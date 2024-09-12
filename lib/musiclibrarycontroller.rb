require 'pry'

class MusicLibraryController

  def initialize(path= "./db/mp3s")
    new_music = MusicImporter.new(path)
    new_music.import
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

    user_input = gets.strip

    while user_input != "exit"
      if user_input == "list songs"
       self.list_songs
      elsif user_input == "list artists"
       self.list_artists
      elsif user_input == "list genres"
       self.list_genres
      elsif user_input == "list artist"
       self.list_songs_by_artist
      elsif user_input == "list genre"
       self.list_songs_by_genre
      elsif user_input == "play song"
       self.play_song
      end
      puts "What would you like to do?"
      user_input = gets.strip
    end
  end



    def list_songs
      sorted = Song.all.sort {|a, b| a.name <=> b.name}
      sorted.each_with_index do |item, index|
       puts "#{index + 1}. #{item.artist.name} - #{item.name} - #{item.genre.name}"
      end
    end

    def list_artists
      sorted = Artist.all.sort_by {|artist|artist.name}
      sorted.each_with_index do |artist, index|
        puts "#{index + 1}. #{artist.name}"
      end
    end

    def list_genres
      sorted = Genre.all.sort_by {|genre| genre.name}
      sorted.each_with_index do |genre, index|
        puts "#{index + 1}. #{genre.name}"
      end
    end

    def list_songs_by_artist
     puts "Please enter the name of an artist:"
     user_input = gets.strip
     if artist = Artist.find_by_name(user_input)
       artist.songs.sort_by { |song| song.name }.each_with_index do |song, index|
         puts "#{index + 1}. #{song.name} - #{song.genre.name}"
       end
     end
   end

   def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.strip
    if genre = Genre.find_by_name(user_input)
      genre.songs.sort_by { |song| song.name }.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

    def play_song
      puts "Which song number would you like to play?"
      user_input = gets.strip.to_i
      if user_input > 0 && user_input < Song.all.size + 1
        playing_song = Song.all.sort_by {|song| song.name}[user_input - 1]
        puts "Playing #{playing_song.name} by #{playing_song.artist.name}"
      end

    end

end
