class MusicLibraryController

  def initialize(path = nil)

    if path == nil
      path = "./db/mp3s"
    end

    importer_object = MusicImporter.new(path)
    importer_object.import
  end

  def call
    puts "Welcome to your music library!"
    user_response = ""

    while user_response != "exit"

      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      user_response = gets.strip

     case user_response # use a CASE statement - <-- checks VARIABLE for its VALUE & responds accordingly - more elegant than IF/ELSE
      when "list songs" # begin the pattern of VARIABLE checking - same as IF VARIABLE == "VALUE"...etc.
        list_songs # this is the BLOCK that gets executed if the specific CASE of variable checking evaluates TRUTHY
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
    all_songs = Song.all
    all_songs.sort! { |a, b| a.name <=> b.name }

    counter = 0
    all_songs.each do |each_song|
      puts "#{counter += 1}. #{each_song.artist.name} - #{each_song.name} - #{each_song.genre.name}"
    end
  end

  def list_artists
    all_artists = Artist.all
    all_artists.sort! { |a, b| a.name <=> b.name }

    counter = 0
    all_artists.each do |each_artist|
      puts "#{counter += 1}. #{each_artist.name}"
    end
  end

  def list_genres
    all_genres = Genre.all
    all_genres.sort! { |a, b| a.name <=> b.name }

    counter = 0
    all_genres.each do |each_genre|
      puts "#{counter += 1}. #{each_genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:" # prompt the user for the artist's name
    user_response = gets.strip # store the user's response

     artist_object = Artist.find_by_name(user_response) # search through all existing artists for the user's requested artist

     if artist_object != nil
       all_songs = artist_object.songs # store all the matching artist's songs
       all_songs.sort! { |a, b| a.name <=> b.name } # sort all the songs alphabetically
       counter = 0
       all_songs.each { |each_song| puts "#{counter += 1}. #{each_song.name} - #{each_song.genre.name}" } # iterate through the ALL_SONGS array, each time pulling and outputting with string interpolation
     else
       nil
     end
   end

   def list_songs_by_genre
     puts "Please enter the name of a genre:"
     user_response = gets.strip

      genre_object = Genre.find_by_name(user_response)

      if genre_object != nil
        all_songs = genre_object.songs
        all_songs.sort! { |a, b| a.name <=> b.name }
        counter = 0
        all_songs.each { |each_song| puts "#{counter += 1}. #{each_song.artist.name} - #{each_song.name}" }
      else
        nil
      end
   end

   def play_song
     puts "Which song number would you like to play?"
     user_response = gets.strip

     all_songs = Song.all
     all_songs.sort! { |a, b| a.name <=> b.name }
     song_count = all_songs.count

     if user_response != nil && user_response.to_i.between?(1,song_count)
       grabbed_song = all_songs[user_response.to_i - 1]
       puts "Playing #{grabbed_song.name} by #{grabbed_song.artist.name}"
     else
       nil
     end
   end

end
