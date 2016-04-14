require_relative '../lib/music_importer.rb'

require 'pry'

class MusicLibraryController

  attr_accessor :mpath

  def initialize(mpath="./db/mp3s")
    m = MusicImporter.new(mpath)
    m.import
  end

  def call
    user_input = nil
    while user_input != "exit"
      user_input = gets.chomp
      case user_input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song
      end # case
    end # while loop
  end # call

  def songs
    Songs.all.each do |song|
      binding.pry
      songs.name
    end
  end

  def artists
    puts "hello"
  end

  def genres
    puts "yoyoyo"
  end

  def list_artist
    "prince"
  end

  def list_genre
    "rap"
  end

  def play_song
    "gogogo"
  end
end

MusicLibraryController.new.call
