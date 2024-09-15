require 'pry'
class MusicLibraryController

  def initialize(path= "./db/mp3s")
    @path = path
    MusicImporter.new(@path).import
  end

  def call
    user_input = nil
    puts "Welcome to your music library!"
    while user_input != "exit"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      user_input = gets.chomp
      if user_input == 'list songs'
        self.list_songs
      elsif user_input == 'list artists'
        self.list_artists
      elsif user_input == 'list genres'
        self.list_genres
      elsif user_input == 'list artist'
        self.list_songs_by_artist
      elsif user_input == 'list genre'
        self.list_songs_by_genre
      elsif user_input == 'play song'
        self.play_song
      end
    end
  end

  def list_songs
    count = 0
    Song.all.sort_by {|song| song.name}.each do |song|
      count += 1
      puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    count = 0
    Artist.all.sort_by {|artist| artist.name}.uniq.each do |artist|
      count += 1
      puts "#{count}. #{artist.name}"
    end
  end

  def list_genres
    count = 0
    Genre.all.sort_by {|genre| genre.name}.uniq.each do |genre|
      count += 1
      puts "#{count}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    selected_artist = Artist.find_by_name(gets.chomp)
    if selected_artist != nil
      count = 0
      selected_artist.songs.sort_by {|song| song.name}.each do |song|
        count += 1
        puts "#{count}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    selected_genre = Genre.find_by_name(gets.chomp)
    if selected_genre != nil
      count = 0
      selected_genre.songs.sort_by {|song| song.name}.each do |song|
        count += 1
        puts "#{count}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_choice = gets.chomp.to_i
    if song_choice >= 1 &&  song_choice <= Song.all.size
      alpha_songs = Song.all.sort_by {|song| song.name}
      puts "Playing #{alpha_songs[song_choice - 1].name} by #{alpha_songs[song_choice - 1].artist.name}"
    end
  end


end
