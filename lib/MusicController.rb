require 'pry'

class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
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

      case input
      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "list artist"
        self.list_songs_by_artist
      when "list genre"
        self.list_songs_by_genre
      when "play song"
        self.play_song
      end

      input = gets
    end
  end

  def list_songs
    Song.all.sort do |a, b|
      a.name <=> b.name
    end
    .each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    # Song.all.collect do |song|
    #   i = 0
    #   while i <= Song.all.length
    #     puts "#{i+1}. #{Song[i]}"
    #   end
    # end.sort
  end

  def list_artists
    Artist.all.sort do |a, b|
      a.name <=> b.name
    end
    .each_with_index do |artist, i|
      puts "#{i+1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort do |a, b|
      a.name <=> b.name
    end
    .each_with_index do |genre, i|
      puts "#{i+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    if artist = Artist.find_by_name(user_input)
      artist.songs.sort do |a, b|
        a.name <=> b.name
      end
      .each_with_index do |song, i|
        puts "#{i+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    inp = gets.strip
    if genre = Genre.find_by_name(inp)
      genre.songs.sort do |a, b|
        a.name <=> b.name
      end
      .each_with_index do |song, i|
        puts "#{i+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input.between?(1, Song.all.length)
      sorted_array = Song.all.sort_by{|song| song.name}
      song = sorted_array[input - 1]
    end
    puts "Playing #{song.name} by #{song.artist.name}" if song
  end

end
