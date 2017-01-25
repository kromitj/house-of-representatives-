require './database.rb'

db_params = {	
	db_name: "house_reps", 
	tables: 
	[
		{
			table_name: "house_rep_parties",
			table_fields: [
				"region varchar(30)",
			    "congress int",
			    "years int",
			    "party varchar(30)",
			    "percent int",
			    "seats int"
			]
		}
	]
}

db = Database.new(db_params)
db.seed_db_csv("./../resources/house-data.csv")