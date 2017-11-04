task :default => :test

task :test do
  system('rake db:migrate RAILS_ENV=test')
  system('rspec')
end
