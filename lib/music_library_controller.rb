
class MusicLibraryController
  attr_accessor :path, :import

def initialize(path = "./db/mp3s")
@path = path
new_import = MusicImporter.new(path)
@import = new_import
new_import.import
end

def call
  counter = 1
  puts "Playing Action Bronson - Larry Csonka - indie"
  until gets == "exit"
    import.files.each do |x|
      puts "#{counter}. #{x}"
      counter += 1 
   end
  end
end


end

