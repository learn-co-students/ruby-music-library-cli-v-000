class MusicLibraryController
attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    object = MusicImporter.new(path)
    object.import
  end

  def import
      new_files = self.files
      new_files.each do |file|
        new_song = Song.create_from_filename(file)
      end
  end

  def call
    user_input = ""
    puts "Welcome to your music library!"
    while user_input != "exit"

      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."


      user_input = gets.strip

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
         else
           puts "What would you like to do?"
         end

    end

  end

  def list_songs
    music = Song.all.sort{|a,b| a.name <=> b.name}
    music.each_with_index do |value, index|
      puts "#{index + 1}. #{value.artist.name} - #{value.name} - #{value.genre.name}"
    end
  end

  def list_artists
    singers = Artist.all.uniq.sort{|a,b| a.name <=> b.name}
    singers.each_with_index do |value, index|
      puts "#{index + 1}. #{value.name}"
    end
  end

  def list_genres
    types = Genre.all.uniq.sort{|a,b| a.name <=> b.name}
    types.each_with_index do |value, index|
      puts "#{index + 1}. #{value.name}"
    end
  end

  def list_songs_by_artist
    user_input = ""
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    if artist = Artist.find_by_name(user_input)
    artist.songs.sort{|a,b| a.name <=> b.name}.each_with_index do |value, index|
      puts "#{index + 1}. #{value.name} - #{value.genre.name}"
    end
    end
  end

  def list_songs_by_genre
    user_input = ""
    puts "Please enter the name of a genre:"
    user_input = gets.strip
    if genre = Genre.find_by_name(user_input)
    genre.songs.sort{|a,b| a.name <=> b.name}.each_with_index do |value, index|
      puts "#{index + 1}. #{value.artist.name} - #{value.name}"
    end
    end
  end

  def play_song
    user_input = ""
    puts "Which song number would you like to play?"
    user_input = gets.strip
    music = Song.all.sort{|a,b| a.name <=> b.name}
    user_input = user_input.to_i
    if user_input > 0 && user_input <= (Song.all.length - 1)
      puts "Playing #{music[user_input - 1].name} by #{music[user_input - 1].artist.name}"
    end
  end


end
