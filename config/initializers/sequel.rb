# Configure database connection based on environment
if Rails.env.test?
  DB = Sequel.connect(
    adapter: 'postgres',
    host: 'test_db',
    port: 5432,
    user: 'postgres',
    password: 'password',
    database: 'myapp_test'
  )
else
  DB = Sequel.connect(
    adapter: 'postgres',
    host: ENV['DATABASE_HOST'],
    port: ENV['DATABASE_PORT'],
    user: ENV['DATABASE_USER'],
    password: ENV['DATABASE_PASSWORD'],
    database: ENV['DATABASE_NAME']
  )
end
