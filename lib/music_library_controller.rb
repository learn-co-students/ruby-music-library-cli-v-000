require 'pry'
class MusicLibraryController

  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    until input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip
    end
  end

  def list_songs
    Song.all.sort_by! {|s| s.name}.collect.with_index(1) do |s, i|
       puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
       "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
     end
  end

  def list_artists
    Artist.all.sort_by! {|a| a.name}.collect.with_index(1) do |a, i|
       puts "#{i}. #{a.name}"
     end
  end

  def list_genres
    Genre.all.sort_by! {|g| g.name}.collect.with_index(1) do |g, i|
       puts "#{i}. #{g.name}"
     end
  end

  extend Concerns::Findable

  def list_songs_by_artist    #REFACTOR!!!
    artist = nil
    until artist != nil
      puts "Please enter the name of an artist:"
      artist = gets.strip
      if Artist.find_by_name(artist)
        Artist.find_by_name(artist).songs.sort_by! do |song|
          song.name
        end.map.with_index(1) do |song, i|
            puts "#{i}. #{song.name} - #{song.genre.name}"
        end
      end
    end
  end

  def list_songs_by_genre
    genre = nil
    until genre != nil
      puts "Please enter the name of a genre:"
      genre = gets.strip
      if Genre.find_by_name(genre)
        Genre.find_by_name(genre).songs.sort_by! do |song|
          song.name
        end.map.with_index(1) do |song, i|
            puts "#{i}. #{song.artist.name} - #{song.name}"
        end
      end
    end
  end


  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip
      while song_number != nil
        chosen = self.list_songs.find {|s| s.include?(song_number)}
        binding.pry
        artist, song = chosen.split(' - ')
        artist.slice!(0, 3)
        puts "Playing #{song} by #{artist}"
      end
  end

end
