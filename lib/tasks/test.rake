task :default => :test

task :test do
  system('rspec')
end
