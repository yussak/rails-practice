namespace :sequel do
  # docker compose exec web bin/rake sequel:migrate
  # でマイグレ実行可能にする
  desc "Sequelマイグレーションを実行"
  task :migrate do
    require "sequel"
    Sequel.extension :migration
    host = ENV.fetch('DATABASE_HOST', 'localhost')
    DB = Sequel.connect(ENV["DATABASE_URL"] || "postgres://postgres:password@#{host}:5432/myapp_development")
    Sequel::Migrator.run(DB, "db/migrate")
    puts "Sequel migrations applied!"
  end
end
