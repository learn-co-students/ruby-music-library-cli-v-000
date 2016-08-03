class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to your music library! What would you like to do?"
      input = gets.strip
      
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      end

    end
  end

  def songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song}"
    end
  end

  def artists
    Artist.all.each do |artist|
      puts "#{artist}"
    end
  end

  def genres
    Genre.all.each do |genre|
      puts "#{genre}"
    end
  end

  def play_song
    Song.all.each do |song|
      puts "Playing #{song}"
    end
  end

  def list_artist
    puts "What artist would you like to list songs for?"
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each do |song, index|
        puts "#{index}. #{song}"
      end
    end
  end

  def list_genre
    puts "What genre would you like to list songs for?"
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each do |song, index|
        puts "#{index}. #{song}"
      end
    end
  end

end


  # case input
      # when "list songs"
      #   #songs
      # when "list artists"
      #   #artists
      # when "list genres"
      #   #genres
      # when "list artist"
      #   #list_artist
      # when "list genre"
      #   #list_genre
      # when "play song"
      #   #play_song
      # end