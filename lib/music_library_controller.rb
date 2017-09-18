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

  def list_songs
    song_names = []
    song = []
    sort_list = []

    Song.all.each_with_index do |x, i| #gets names of all songs
      song_names[i] = x.name
      song[i] = x
    end
    song_names.sort!

    song.each do |list|
      song_names.each_with_index do |name , i|
        if list.name == name
          sort_list[i] = list
        end
      end
    end

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

end
