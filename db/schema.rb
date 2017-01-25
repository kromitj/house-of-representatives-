class Schema 
	attr_reader :db_fields

	def initialize(schema)
		@db_fields = schema
	end
end