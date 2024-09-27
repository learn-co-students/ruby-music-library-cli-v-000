require_relative './config/environment'

def reload!
  load_all "./config" if Dir.exists?("./config")
  load_all "./app" if Dir.exists?("./app")
  #load_all "./concerns" if Dir.exists?("./concerns")
  load_all "./lib" if Dir.exists?("./lib")
  load_all "./*.rb" if Dir.entries(".").include?(/\.rb/)
end

task :console do
  puts "Loading your application environment..."
  reload!
  puts "Console started:"
  Pry.start
end
