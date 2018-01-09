require 'pry'

class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    begin
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets
    end until input == "exit"
  end

  def list_songs
    Song.all.sort{|a, b| a.name <=> b.name}.each_with_index.collect do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort{|a, b| a.name <=> b.name}.uniq.each_with_index.collect do |artist, index|
        puts "#{index + 1}. #{artist.name}"
      end
  end

  def list_genres
    Genre.all.sort{|a, b| a.name <=> b.name}.uniq.each_with_index.collect do |genre, index|
        puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    Artist.all.each do |artist|
        if artist.name == input
          artist.songs.collect{|song| song.name + song.genre.to_s}.sort{|a, b| a.name <=>b.name}.each_with_index.collect do |name, index|
          puts "#{index + 1}. #{name} - #{genre}"
        end
      end
    end
  end

end
