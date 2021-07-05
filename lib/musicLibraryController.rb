class MusicLibraryController
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(@path)
    music_importer.import
  end
  def call
    user_input = nil
  until user_input == 'exit'
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
     case user_input
     when "list songs"
       list_songs
    when "list artists"
      list_artists
    when "list genres"
      list_genres
    when "list artist"
      list_songs_by_artist
    when "list genre"
      list_songs_by_genre
    when "play song"
      play_song
     end
   end
  end

  def list_songs
    index = 0
    songs = Song.all.sort {|a,b| a.name <=> b.name}
    songs.each.with_index {|song, index|
    puts "#{index + 1}. #{songs[index].artist.name} - #{songs[index].name} - #{songs[index].genre.name}"
  }
  end

  def list_artists
    artists = Artist.all.sort {|a,b| a.name <=> b.name}

    #artists_array = []
    #artists_array = artists.collect {|artist_| artist_.artist.name }
    #artists_array = artists_array.uniq
    #artists_array.each.with_index {|artist_, index|
    #  puts "#{index+1}. #{artist_}"
    #  }
    artists.each.with_index {|artists_, index|
      puts "#{index +1}. #{artists_.name}"
    }
  end

  def list_genres
    genres = Genre.all.sort {|a,b| a.name <=> b.name}
    genres.each.with_index {|genres_, index|
      puts "#{index + 1}. #{genres_.name}"
    }
 end

 def list_songs_by_artist
   count = 1
   puts "Please enter the name of an artist:"
   input = gets.strip
    songs = Song.all.sort {|a,b| a.name <=> b.name}
  songs.each.with_index {|song, index|
    if songs[index].artist.name == input
      puts "#{count}. #{songs[index].name} - #{songs[index].genre.name}"
      count += 1
    else
      nil
    end
  }
  end

  def list_songs_by_genre
    count = 1
   puts "Please enter the name of a genre:"
   input = gets.strip
    songs = Song.all.sort {|a,b| a.name <=> b.name}
  songs.each.with_index {|song, index|
    if songs[index].genre.name == input
      puts "#{count}. #{songs[index].artist.name} - #{songs[index].name}"
      count += 1
    else
      nil
    end
  }
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    songs = Song.all.sort {|a,b| a.name <=> b.name}
    if input < songs.length && input > 0
    puts "Playing #{songs[input-1].name} by #{songs[input-1].artist.name}"
end
  end


end
