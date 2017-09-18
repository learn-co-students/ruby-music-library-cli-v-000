class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @list = MusicImporter.new(path).import
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
    input = nil
    until input == "exit"
      input = gets.chomp
    end
  end

  def find_songs
    song_names = []
    song = []
    sort_list = []

    Song.all.each_with_index do |x, i|
      song_names[i] = x.name #gets names of all songs
      song[i] = x #gets class of all songs
    end
    song_names.sort! # sorts song names alpha order

    song.each do |list|
      song_names.each_with_index do |name , i|
        if list.name == name #checks if class song name is name as alpha order string song name
          sort_list[i] = list # if it has the same name the class is placed in its postion in new array now in alpha order
        end
      end
    end
    sort_list
  end

  def list_songs
    sort_list = self.find_songs

    sort_list.each_with_index do |list, i|  # print in order
      puts "#{i+1}. #{list.artist.name} - #{list.name} - #{list.genre.name}"
    end


  end

  def list_artists
    artist_names =[]

    Artist.all.each_with_index do |x, i| #gets names of all arthist
      artist_names[i] = x.name
    end

    artist_names.sort! # alpha order

    artist_names.each_with_index do |name, i| # prints names
      puts "#{i+1}. #{name}"
    end

  end

  def list_genres
    genre_names =[]

    Genre.all.each_with_index do |x, i| #gets names of all arthist
      genre_names[i] = x.name
    end

    genre_names.sort! # alpha order

    genre_names.each_with_index do |name, i| # prints names
      puts "#{i+1}. #{name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    song_list = Song.get_song_by_name(input)
    song_list.sort!
    song_list.each_with_index do |list,i|
      puts "#{i+1}. #{list}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre_list = Song.get_song_by_genre(input)
    genre_list.each_with_index do |list,i|
      puts "#{i+1}. #{list}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp
    list = self.find_songs
    input = "#{input}".to_i - 1
    if input >= 0 && input <= list.length
      puts "Playing #{list[input].name} by #{list[input].artist.name}" unless list[input] == nil
    end
  end

end
