
class MusicLibraryController
  def initialize(path = './db/mp3s')
    new_songs = MusicImporter.new(path)
    new_songs.import
  end
  
  def call
    input = nil
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    until input === "exit"
      input = gets.strip
      
      case input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      end
    end
  end
  
  def list_songs
    alphabetized = Song.all.sort_by { |song| song.name }
    
    alphabetized.each_with_index { |song, index| 
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    }
  end
  
  def list_artists
    sorted = Artist.all.sort_by { |band| band.name }.uniq
    
    sorted.each_with_index { |musician, index|
      puts "#{index + 1}. #{musician.name}"
    }
  end
  
  def list_genres
    organized = Genre.all.sort_by { |type| type.name }.uniq
    
    organized.each_with_index { |style, index| 
      puts "#{index + 1}. #{style.name}"
    }
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    answer = gets.strip
    music_group = Artist.find_by_name(answer)
    
    if music_group != nil
      song_list = music_group.songs.sort_by { |song| song.name }
      
      song_list.each_with_index { |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      }
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_response = gets.strip
    result = Genre.find_by_name(user_response)
    
    if result != nil
      song_list = result.songs.sort_by { |song| song.name }
      
      song_list.each_with_index { |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      }
    end
  end
  
  def play_song
    alphabetical = Song.all.sort_by { |song| song.name }

    puts "Which song number would you like to play?"
    user_input = gets.strip.to_i

    if user_input.between?(1, alphabetical.size)
      puts "Playing #{alphabetical[user_input - 1].name} by #{alphabetical[user_input - 1].artist.name}" 
    end
  end
  
end


