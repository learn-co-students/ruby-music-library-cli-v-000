require 'pry'
require_relative "../lib/concerns/findable.rb"
# require_relative "../lib/artist.rb"
class MusicLibraryController
  # extend Concerns::Findable
  include Concerns
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
    end.uniq do |artist|
      artist.gsub(/( ?-\D+\d+)/, "")
    end.each_with_index do |artist, index|
      if @new_instance.include?(artist)
        puts "#{index + 1}. #{artist.gsub(/( -\D+\d+)/, "")}"
      else

        # @new_instance << Artist.create("ZZ Top")
        artist = Artist.create("ZZ Top")
        @new_instance << artist.name
        # @new_instance << artist
        # artist = @new_instance << Artist.create("ZZ Top")
        # @new_instance << Artist.create("ZZ Top")

        # artist = Artist.create(name)
        # @new_instance << artist
        # artist = @new_instance.join
        # artist[35,40]
        # @new_instance.join.include?("ZZ Top")

        # @new_instance << artist
        # @new_instance
        puts "#{index + 1}. #{artist}"
        # puts "#{index + 1}. #{artist.find("ZZ Top")}"
      end
      binding.pry
    end
  end

end
