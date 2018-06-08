require 'bundler'
Bundler.require

module Concerns
end

require_all 'lib'


class MusicLibraryController

  attr_accessor :user_input

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    options = ['list songs',
      'list artists',
      'list genres',
      'list artist',
      'list genre',
      'play song',
      'exit']
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    @user_input = gets.strip
    case
    when options.include?(@user_input)
      self.user_input.gsub(" ","_")
    else
      self.call
    end
  end

  def list_songs
    # I need two conditions for this sort -
    # first by name and then by artist
    # sorted_list = Song.all.sort_by {|a| [a.name, a.artist.name]}
    # binding.pry
    sorted_list = Song.all
    sorted_list.each_with_index do |s, i|
      puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
      # puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists

  end

  def list_genres

  end

  def list_artist

  end

  def list_genre

  end

  def play_song

  end

  def exit

  end

end

MusicLibraryController.new("./spec/fixtures/mp3s").list_songs
