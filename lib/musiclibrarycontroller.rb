require_relative '../config/environment.rb'

class MusicLibraryController
  def initialize(path='./db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
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

      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        # artist = input.gsub(/\A\S*\s/,"")
        list_songs_by_artist(input.gsub(/\A\S*\s/,""))
      when "list genre"
        list_songs_by_genre(input.gsub(/\A\S*\s/,""))
      when "play song"
        play_song
      when "exit"
        return 'Good bye'
      end
      call
  end

  def list_songs
    songlist.inject(1){|memo,s|
      puts "#{memo}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      memo += 1}
  end

  def songlist
    Song.all.sort {|a,b| a.name <=> b.name}
  end

  def list_artists
    Artist.all.sort{|a,b| a.name <=> b.name}.inject(1) do |memo,a|
      puts "#{memo}. #{a.name}"
      memo += 1
    end
  end

  def list_genres
    Genre.all.sort{|a,b| a.name <=> b.name}.inject(1) do |memo,g|
      puts "#{memo}. #{g.name}"
      memo += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
    artist = Artist.find_by_name(artist_name)
    if artist != nil
      artist.songs.sort{|a,b| a.name <=> b.name}.inject(1) do |memo,s|
        puts "#{memo}. #{s.name} - #{s.genre.name}"
        memo += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.chomp
    genre = Genre.find_by_name(genre_name)
    if genre != nil
      genre.songs.sort{|a,b| a.name <=> b.name}.inject(1) do |memo,s|
        puts "#{memo}. #{s.artist.name} - #{s.name}"
        memo += 1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.chomp.to_i
    song = songlist[song_number-1]
    if song_number < songlist.count && song_number > 1
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
