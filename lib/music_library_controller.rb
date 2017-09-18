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
    song = []
    name = []
    sort_list = []

    @list.each_with_index do |list, i| #creates classes
      song[i] = Song.create_from_filename(list)
      name[i] = song[i].name # just a vector of song names
    end

    name_list = name.sort #sorts into alpha order
    song.each do |list|
      name_list.each_with_index do |name , i|
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
    song = []
    name = []

    @list.each_with_index do |list, i| #creates classes
      song[i] = Song.create_from_filename(list)
      name[i] = song[i].artist.name # just a vector of song names
    end
    binding.pry
  end

end
