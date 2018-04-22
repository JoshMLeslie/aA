require_relative '03_associatable'

# Phase IV
module Associatable

  def has_one_through(name, thru_name, src_name)
    define_method(name) do
      ## OPTIONS ##
      thru_opts = self.class.assoc_options[thru_name]
      src_opts = thru_opts.model_class.assoc_options[src_name]
      ##         ##

      ## THROUGH ##
      thru_table = thru_opts.table_name
      thru_primary, thru_foreign = thru_opts.primary_key, thru_opts.foreign_key
      ##         ##

      ## SOURCE  ##
      src_table = src_opts.table_name
      src_primary, src_foreign = src_opts.primary_key, src_opts.foreign_key
      ##         ##

      key_val = self.send(thru_foreign)

      results = DBConnection.execute(<<-SQL, key_val)
        SELECT #{src_table}.* FROM #{thru_table}
        JOIN #{src_table}
          ON #{thru_table}.#{src_foreign} = #{src_table}.#{src_primary}
        WHERE
          #{thru_table}.#{thru_primary} = ?
      SQL

      src_opts.model_class.parse_all(results).first
    end
  end

end
