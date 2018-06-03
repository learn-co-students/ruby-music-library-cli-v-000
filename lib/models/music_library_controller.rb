require 'pry'

class MusicLibraryController
  attr_accessor :path, :artist

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter \'list songs\'."
    puts "To list all of the artists in your library, enter \'list artists\'."
    puts "To list all of the genres in your library, enter \'list genres\'."
    puts "To list all of the songs by a particular artist, enter \'list artist\'."
    puts "To list all of the songs of a particular genre, enter \'list genre\'."
    puts "To play a song, enter \'play song\'."
    puts "To quit, type \'exit\'."
    puts "What would you like to do?"

    loop do
      input = gets.chomp

      case input
      when "list songs"
        self.list_songs
        self.reprompt
      when "list artists"
        self.list_artists
        self.reprompt
      when "list genres"
        self.list_genres
        self.reprompt
      when "list artist"
        self.list_songs_by_artist
        self.reprompt
      when "list genre"
        self.list_songs_by_genre               self.reprompt
      when "play song"
        self.play_song
        self.reprompt
      when "exit"
        break
      end
    end
  end

  def reprompt
    sleep 2
    self.call
  end

  def list_songs
    song_array = Song.all.sort_by {|s| s.name}
    # puts song_array
    song_array.each_with_index do |s, i|
      puts "#{i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by {|a| a.name}.each_with_index do |a, i|
      puts "#{i + 1}. #{a.name}"
    end
  end

  def list_genres
    Genre.all.sort_by {|g| g.name}.each_with_index do |g, i|
      puts "#{i + 1}. #{g.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"

    artist = Artist.find_by_name(gets.chomp)

    if artist
      artist.songs.sort_by {|s| s.name}.each_with_index do |s, i|
        puts "#{i + 1}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"

    genre = Genre.find_by_name(gets.chomp)

    if genre
      genre.songs.sort_by {|s| s.name}.each_with_index do |s, i|
        puts "#{i + 1}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    i = gets.chomp.to_i - 1

    if i >= 0 && i <= Song.all.size
      song = Song.all.sort_by {|s| s.name}[i]
      
      puts "Playing #{song.name} by #{song.artist.name}" if song
    end
  end
end
