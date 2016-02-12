require_relative "../concerns/findable_module.rb"

class MusicLibraryController
  attr_accessor :path, :imported

  def initialize(path = "./db/mp3s")
    @path = path 
    @imported = MusicImporter.new(path).import
  end

  def file_names(array)
    counter = 1
    array.each do |i|
      puts "#{counter}" +". " + i
      counter += 1
    end
  end

  
    #name = file_name.split(" - ")[1]
   # artist_name = file_name.split(" - ")[0]
   # artist = Artist.find_or_create_by_name(artist_name)
   # genre_name = file_name[/.*\s(.*?).mp3/,1]
  #end



=begin

  def call
    puts "HEY USER! PUT IN SOME EFFING TEXT!!"

    input = gets.chomp

    case input
    when "list songs"
      puts "1. Action Bronson - Larry Csonka - indie"
    when "list artists"
      puts "no biggie"
    when "list genres"
      puts "okay"
    else 
    puts "done"
    end
  end
=end

def call
    puts "HEY USER!"

    input = gets.chomp

    case input
    when "list songs"
      self.file_names(imported)
    when "list artists"
      puts Artist.all
    when "list genres"
      puts Genre.all
    else 
    puts "done"
    end
  end
end