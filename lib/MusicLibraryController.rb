require 'pry'
class MusicLibraryController
  attr_accessor :path
  def initialize(path = './db/mp3s')
    @path = MusicImporter.new(path)
    @path.import
  end

  def call
    user_input = ''
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
    until user_input == "exit"
      user_input = gets.chomp


      if user_input == "list songs"
        list_songs
      elsif user_input == "list artists"
        list_artists
      elsif user_input == "list genres"
        list_genres
      elsif user_input == "list artist"
        list_songs_by_artist
      elsif user_input == "list genre"
        list_songs_by_genre
      elsif user_input == "play song"
        play_song
      end
    end
  end

  def list_songs
    song_list = @path.files.sort{|x,y| x.split(" - ")[1] <=> y.split(" - ")[1]}
    i = 0
      while i < song_list.length
        puts "#{i+1}. #{song_list[i].chomp(".mp3")}"
        i += 1
      end
      i
  end

  def list_artists
    artist_list = Artist.all.map{|x| x.name}.sort
    i = 0
      while i < artist_list.length
        puts "#{i+1}. #{artist_list[i].split(" - ")[0]}"
        i += 1
      end
    end

    def list_genres
      genre_list = Genre.all.map{|x| x.name}.sort
      i = 0
        while i < genre_list.length
          puts "#{i+1}. #{genre_list[i]}"
          i += 1
        end
    end

    def list_songs_by_artist
       puts "Please enter the name of an artist:"
       user_input = gets.chomp

       if artist = Artist.find_by_name(user_input)
         artist.songs.sort{|x, y| x.name <=> y.name }.each.with_index(1) do |s, i|
           puts "#{i}. #{s.name} - #{s.genre.name}"
         end
       end
     end

     def list_songs_by_genre
       puts "Please enter the name of a genre:"
       user_input = gets.chomp

       if genre = Genre.find_by_name(user_input)
         genre.songs.sort{|x, y| x.name <=> y.name }.each.with_index(1) do |s, i|
           puts "#{i}. #{s.artist.name} - #{s.name}"
         end
       end
     end

     def play_song
       puts "Which song number would you like to play?"
       user_input = gets.chomp.to_i
       song = nil
       if user_input <= Song.all.length && user_input > 0
         song = Song.all.sort{|x,y| x.name <=> y.name}.uniq[user_input-1]
       end
      puts "Playing #{song.name} by #{song.artist.name}" if song
     end

end
