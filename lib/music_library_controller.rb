#require pry

class MusicLibraryController
  attr_accessor :music_importer

  def initialize(path_ = "./db/mp3s") # = "./db/mp3s")
    self.music_importer = MusicImporter.new(path_)
    self.music_importer.import
  end

  def call
    print_msg
    resp = gets.strip.upcase

    while (resp != "EXIT") do

      print_msg
      resp = gets.strip.upcase
    end
  end

  def list_songs
    arr = Song.all

    arr.sort! {|x, y| x.name <=> y.name}

    arr.each_with_index do |e, i|
      #str_ = e.class
      str = "#{i+1}. #{e.artist.name} - #{e.name} - #{e.genre.name}"
      puts str
    end
  end

  def list_artists
    arr = Artist.all
    print_list_std(arr)
  end

  def list_genres
    arr = Genre.all
    print_list_std(arr)
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    inp = gets.strip
    arr = Song.all

    arr.sort! {|x, y| x.name <=> y.name}

    trim_arr = []
    arr.each do |e|
      trim_arr << e if (e.artist.name.strip == inp)
    end

    trim_arr.each_with_index do |e, i|
      str = "#{i+1}. #{e.name} - #{e.genre.name}"
      puts str
    end

  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    inp = gets.strip
    arr = Song.all

    arr.sort! {|x, y| x.name <=> y.name}

    trim_arr = []
    arr.each do |e|
      trim_arr << e if (e.genre.name.strip == inp)
    end

    #binding.pry
    #puts trim_arr

    trim_arr.each_with_index do |e, i|
      str = "#{i+1}. #{e.artist.name} - #{e.name}"
      puts str
    end

  end

  def play_song()
    #self.list_songs
    puts "Which song number would you like to play?"
    inp = gets.strip

    arr = Song.all

    inp = inp.to_i

    if inp < 1 || inp > arr.size
      rerturn nil
    end

    arr.sort! {|x, y| x.name <=> y.name}

    song_ = arr[inp - 1]
    puts "Playing #{song_.name} by #{song_.artist.name}"

  end

  private
  #attr_accessor :music_importer
  def print_msg
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
  end

  def print_list_std(arr)
    arr.sort! {|x, y| x.name <=> y.name}

    arr.each_with_index do |e, i|
      #str_ = e.class
      str = "#{i+1}. #{e.name}"
      puts str
    end
  end
end
