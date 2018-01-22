require 'pry'

class MusicLibraryController
  def initialize(path = './db/mp3s')
    musicImporter = MusicImporter.new(path)
    musicImporter.import
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
    input = gets.chomp
    until input == 'exit' do
        input = gets.chomp
    end
  end

  def list_songs
    output = ""
    Song.all.sort_by{|song| song.name}.each.with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      output += "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"

    end
    output
  end

  def list_artists
    Artist.all.sort_by{|artist| artist.name}.each.with_index do |artist, i|
      puts "#{i+1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by{|genre| genre.name}.each.with_index do |genre, i|
      puts "#{i+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.chomp

    artist = Artist.find_by_name(artist)

    if artist.class == Artist
      songs = artist.songs
      songs.sort_by{|song| song.name}.each.with_index do |song, i|
        puts "#{i+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.chomp

    genre = Genre.find_by_name(genre)

    if genre.class == Genre
      songs = genre.songs
      songs.sort_by{|song| song.name}.each.with_index do |song, i|
        puts "#{i+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_num = gets.chomp.to_i

    if song_num > 0 && song_num <= Song.all.count
      song = self.list_songs.grep(/#{song_num}./)
      name = song.split(' - ')[1]
      artist = song.split(' - ')[0]
      puts "Playing #{name} by #{artist}"
    end
  end

end
