require "sqlite3"
require "csv"

require './../model/house-rep-party'


class Database
	attr_reader :db

	def initialize(db_params)
		tables = db_params[:tables]

		@db = SQLite3::Database.new "#{db_params[:db_name]}"
		tables.each do |table|
			row = db.execute "create table #{table[:table_name]} ( #{table[:table_fields].join(",")});"
		end
	end

	def seed_db_csv(csv_file)
		rep_seats = []
		columns = nil
		 CSV.foreach(csv_file) do |rep_seat|
		 	
		 	if columns == nil
		 		columns = rep_seat
		 		columns.each { |column| column.downcase! }	
			elsif columns != rep_seat 
				data_hash = Hash[columns.zip(rep_seat)]
				HouseRepParty.create(data_hash)
			end	
		 end	
	end

	def drop_db(table_name)
		@db.execute "drop table #{table_name}"
	end

end



		