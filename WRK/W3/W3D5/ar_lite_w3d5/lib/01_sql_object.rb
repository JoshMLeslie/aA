require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.
# cool

class SQLObject

  attr_reader :table_cols, :attributes

  def self.columns
    @table_cols ||= []

    if @table_cols.empty?
      @table_cols = DBConnection.execute2(<<-SQL)
      SELECT *
      FROM #{self.table_name}
      LIMIT 0
      SQL

      # atleast quicker here? because it's a smaller chunk of data
      @table_cols = @table_cols[0].map(&:to_sym)
    end

    @table_cols
  end

  def self.finalize!

      self.columns.each do |col|

        define_method(col) do
          self.attributes[col]
        end

      define_method("#{col}=") do |el|
        # store in attributes hash instead
        self.attributes[col] = el
      end
    end

  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.to_s.tableize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
    SELECT #{self.table_name}.*
    FROM #{self.table_name}
    SQL

    self.parse_all(results)
  end

  def self.parse_all(results)
    results.map { |set| self.new(set) }
  end

  def self.find(idx)
    tabl_nom = self.table_name

    results = DBConnection.execute(<<-SQL,idx)
    SELECT #{tabl_nom}.*
    FROM #{tabl_nom}
    WHERE #{tabl_nom}.id = ?
    SQL

    parse_all(results)[0] # returning class objects not raw sql
  end

  def initialize(params = {})
    # puts "Init begun -"

    params.each do |nom, val|
      raise "unknown attribute '#{nom}'" unless self.class.columns.include?(nom.to_sym)

      self.send("#{nom}=",val)
    end

    # puts "Init completed, no errors raised." # by virtue of lack of code to count
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map{|col| self.send(col)}
  end

  def insert
    vals = attribute_values.drop(1)

    cls = self.class
    tabl_nom = cls.table_name

    cols = cls.columns.drop(1)

    total_cols = cols.map(&:to_s).join(", ")
    total_qs = ( ["?"] * cols.length).join(", ")

    results = DBConnection.execute(<<-SQL, *vals)
    INSERT INTO #{tabl_nom} (#{total_cols})
    VALUES (#{total_qs})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    vals = attribute_values # not dropping because we want the id too, now.

    cls = self.class
    tabl_nom = cls.table_name

    cols = cls.columns
    total_cols = cols.map{|el| el.to_s + " = ?"}.join(", ")

    results = DBConnection.execute(<<-SQL, *vals, id)
    UPDATE #{tabl_nom}
    SET #{total_cols}
    WHERE #{tabl_nom}.id = ?
    SQL
  end

  def save
    if id.nil?
      insert
    else
      update
    end
  end
end
