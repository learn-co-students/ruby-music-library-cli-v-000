class MusicLibraryController

  def initialize(path = "./db/mp3s")

    @import = MusicImporter.new(path)
    @import.import

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
    input = gets.chomp #until input == "exit

    commands = {
      "list songs" => "list_songs",
      "list artists" => "list_artists",
      "list genres" => "list_genres",
      "list artist" => "list_songs_by_artist",
      "list genre" => "list_songs_by_genre",
      "play song" => "play_song"
    }
    #binding.pry
    if commands[input] != nil
      self.send("#{commands[input]}")
      #send("#{commands["list songs"]}")
    elsif input == "exit"
      return nil
    else
      call
    end
  end

  def order_by_song
    #@import.files.sort_by {|f| f.slice(/[-] [A-Z]/)}
    Song.all.sort {|a, b| a.name <=> b.name}.uniq
  end

  def list_songs
    #binding.pry
    #order_by_song.each_with_index {|s,i| puts "#{i + 1}. #{s.chomp(".mp3")}"}
    order_by_song.each_with_index do |s,i|
      puts "#{i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    # artist_list = Artist.all.collect {|a| a.name }
    # artist_list.sort.each_with_index {|s,i| puts "#{i + 1}. #{s}"}
    Artist.all.collect {|a| a.name }.sort.each_with_index {|s,i| puts "#{i + 1}. #{s}"}
  end

  def list_genres
    Genre.all.collect {|a| a.name }.sort.each_with_index {|s,i| puts "#{i + 1}. #{s}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if artist = Artist.find_by_name(input)
      artist.songs.sort{|a,b| a.name <=> b.name}.each_with_index do |s, i|
        puts "#{i + 1}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      genre.songs.sort {|a,b| a.name <=> b.name}.each_with_index do |s,i|
        puts "#{i + 1}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    #binding.pry
    if input.to_i.between?(1, order_by_song.length)
      choice = order_by_song[input.to_i - 1]
      puts "Playing #{choice.name} by #{choice.artist.name}"
    end
  end

end
