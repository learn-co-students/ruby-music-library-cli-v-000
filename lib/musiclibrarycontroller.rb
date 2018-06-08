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

# Thundercat - For Love I Come - dance.mp3
# Real Estate - Green Aisles - country.mp3
# Real Estate(getting Thundercat) - It's Real - hip-hop.mp3
# Action Bronson - Larry Csonka - indie.mp3
# Jurassic 5 - What's Golden - hip-hop.mp3

# why am I getting Thundercat instead of Real Estate?
# What is the artist of the song object It's Real?

    sorted_list = Song.all.sort do |a,b|
      a.name <=> b.name
    end
    # binding.pry
    sorted_list.each_with_index do |s, i|
      # binding.pry
      puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
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
