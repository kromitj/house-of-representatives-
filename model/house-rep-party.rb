require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3', # or 'postgresql' or 'sqlite3'
  database: 'house_reps',
  username: 'root',
  password: '',
  host:     'localhost'
)

class HouseRepParty < ActiveRecord::Base
	
end