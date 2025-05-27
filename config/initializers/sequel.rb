host = ENV["DATABASE_HOST"]
database = ENV["DATABASE_NAME"]
user = ENV["DATABASE_USER"]
password = ENV["DATABASE_PASSWORD"]

DB = Sequel.connect(
  adapter: 'postgres',
  host: ENV['DATABASE_HOST'],
  port: ENV['DATABASE_PORT'],
  user: ENV['DATABASE_USER'],
  password: ENV['DATABASE_PASSWORD'],
  database: ENV['DATABASE_NAME']
)
