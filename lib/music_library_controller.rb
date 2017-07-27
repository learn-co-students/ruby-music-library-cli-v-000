require 'pry'
class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
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
    user_input = gets.strip # loop while getting user input
      until user_input == "exit"
        case user_input
          when "list songs"
            list songs
            user_input = "exit"
          when "list artists"
            list artists
            user_input = "exit"
          when "list genres"
            list genres
            user_input = "exit"
          when "play song"
            play song
            user_input = "exit"
          else
            puts "I dont understand your response"
            user_input = gets.strip # print the prompt, so the user knows to re-enter input
        end
      end
  end

  def list_songs
    sort_songs = Song.all.sort do |x, y|
      if x.name == y.name
        0
      elsif x.name < y.name
        -1
      elsif x.name > y.name
        1
      end
    end
    sort_songs.each_with_index {|song,id|
      puts "#{id+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    }
  end

  def list_artists
    sort_artist = Artist.all.sort do |x, y|
      if x.name == y.name
        0
      elsif x.name < y.name
        -1
      elsif x.name > y.name
        1
      end
    end
    sort_artist.each_with_index {|artist,id|
      puts "#{id+1}. #{artist.name}"
    }
  end

  def list_genres
    sort_artist = Genre.all.sort do |x, y|
      if x.name == y.name
        0
      elsif x.name < y.name
        -1
      elsif x.name > y.name
        1
      end
    end
    sort_artist.each_with_index {|genre,id|
      puts "#{id+1}. #{genre.name}"
    }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    if Artist.find_by_name(user_input) != nil
      artist = Artist.find_by_name(user_input)
      sort_artist = artist.songs.sort do |x, y|
        if x.name == y.name
          0
        elsif x.name < y.name
          -1
        elsif x.name > y.name
          1
        end
      end
      sort_artist.each_with_index {|song,id|
        puts "#{id+1}. #{song.name} - #{song.genre.name}"
      }
    end
   end

   def list_songs_by_genre
     puts "Please enter the name of a genre:"
     genre_input = gets.strip
     if Genre.find_by_name(genre_input) != nil
       genre = Genre.find_by_name(genre_input)
       sort_genre = genre.songs.sort do |x, y|
         if x.name == y.name
           0
         elsif x.name < y.name
           -1
         elsif x.name > y.name
           1
         end
       end
       sort_genre.each_with_index {|song,id|
         puts "#{id+1}. #{song.artist.name} - #{song.name}"
       }
     end
   end

   def play_song
     puts "Which song number would you like to play?"
     user_input = gets.strip

     sort_songs = Song.all.sort do |x, y|
       if x.name == y.name
         0
       elsif x.name < y.name
         -1
       elsif x.name > y.name
         1
       end
     end

     sort_songs.each_with_index {|song,id|
       if id + 1 == user_input.to_i
         puts "Playing #{song.name} by #{song.artist.name}"
       end
     }
   end
end
