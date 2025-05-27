# todo:env読みにかえる
host = ENV.fetch('DATABASE_HOST', 'localhost')
DB = Sequel.connect(ENV["DATABASE_URL"] || "postgres://postgres:password@#{host}:5432/myapp_development")
