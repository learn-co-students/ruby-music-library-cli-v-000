require 'pry'
class MusicLibraryController

  attr_accessor :path

  def initialize(path = './db/mp3s')
    @music_importer = MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != 'exit'
      input=gets.strip
      case input
        when 'list songs'
          songs
    end
    end
  end

  def songs
    Song.all.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
end
