require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    keys = params.keys
    vals = params.values

    keys = keys.map{|col| "#{col} = ?"}.join(" AND ")

    search_results = DBConnection.execute(<<-SQL, *vals)
      SELECT *
      FROM #{table_name}
      WHERE #{keys}
    SQL

    parse_all(search_results)
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
