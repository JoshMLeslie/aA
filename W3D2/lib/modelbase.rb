require 'byebug'
require 'sqlite3'
require 'singleton'
require 'active_support/inflector'
# ALSO INCLUDES QuestionsDBConnection Class

class ModelBase

  attr_reader :id

  def self.all(ref)
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT *
      FROM #{ref}
    SQL
    data.map { |datum| self.new(datum) }
  end

  def self.find_by_id
    class_name = make_plural(self.to_s.downcase)
    personalized = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT *
      FROM  #{class_name}
      WHERE id = ?
    SQL
    return nil unless personalized.length > 0

    self.class.new(personalized.first) # question_like is stored in an array!
  end

  def self.where(other_options)
    class_name = make_plural(self.to_s.downcase)

    where_string = make_where_string(other_options)

    QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT *
      FROM #{class_name}
      WHERE #{where_string}
    SQL
  end

  def self.make_plural(class_name)
    case class_name
    when 'reply'
        return 'replies'
      else
        return class_name + "s"
    end
  end

  def self.method_missing(method_name, *args)
    debugger
    method_name = method_name.to_s
    if method_name.start_with?("find_by_")
      # attributes_string is, e.g., "first_name_and_last_name"
      attributes_string = method_name[("find_by_".length)..-1]

      # attribute_names is, e.g., ["first_name", "last_name"]
      attribute_names = attributes_string.split("_and_")

      unless attribute_names.length == args.length
        raise "unexpected # of arguments"
      end

      search_conditions = {}
      attribute_names.length.times do |i|
        search_conditions[attribute_names[i]] = args[i]
      end

      # Imagine search takes a hash of search conditions and finds
      # objects with the given properties.
      self.where(search_conditions)
    else
      # complain about the missing method
      super
    end
  end

  def self.make_where_string(other_options)
    # currently only works on hashes
    if other_options.is_a?(Hash)
      i = 0
      where_string = ""
      other_options.each do |k,v|
        where_string << "#{k} = '#{v}'"
        where_string << " AND " unless i+1 == other_options.length
        i += 1
      end
      
    else
      return other_options
    end

    return where_string
  end

  def initialize(options)
    @id = options['id']
  end



end


class QuestionsDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end
