require 'pry'

class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path

    @new_instance = MusicImporter.new(path).import


    # binding.pry
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    until gets == ("exit")
    end
    # binding.pry
  end

  def list_songs
    # @new_instance.sort_by { |song| song.scan(/\s\W\s[A-Z]/)}.each_with_index{|song, index| puts "#{index + 1}. #{song.gsub(".mp3", "")}"}

    @new_instance.sort_by do |song|
      song.scan(/\s\W\s[A-Z][a-z]/)
    end.each_with_index do |song, index|
      puts "#{index + 1}. #{song.gsub(".mp3", "")}"
    end
    # binding.pry
    # @new_instance.each_with_index {|song, index| puts "#{index + 1}. #{song.gsub(".mp3", "")}"}
        # binding.pry
  end

  def list_artists
    @new_instance.sort_by do |artist|
      artist.scan(/\w+\s/)
      # artist.scan(/([A-Z]\w+)\s?([A-Z]?\w+)/)
        #artist.scan(/^[A-Z]\w+\s?(A-Z|0-9)\w+/) - doesnt work
        # artist.scan(/^(\w+\s?\w+)/)
        # artist.scan(/(\w+\s?)(\w+)/) - doesn't work
        # artist.scan(/\s\W\s[A-Z][a-z]/) - doesnt' work
      # binding.pry
    end.uniq do |artist|
      artist.gsub(/( ?-\D+\d+)/, "")

    end.each_with_index do |artist, index|
      # puts "#{index + 1}. #{artist.gsub(/\W\s.+/, "")}" - doesn't work
      # puts "#{index + 1}. #{artist.gsub(/\s?\W\s[A-Z][a-z].+/, '')}"

      # puts "#{index + 1}. #{artist.gsub(/( ?-\D+\d+)/, "")}"
      puts "#{index + 1}. #{artist.gsub(/( -\D+\d+)/, "")}"
      # binding.pry
    end

  end
end
