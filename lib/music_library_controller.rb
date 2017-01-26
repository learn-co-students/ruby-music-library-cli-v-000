class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""

    while input != "exit"
      puts "Hello! Welcome to your Music Library!"
      puts "What would you like to do?"
      puts "You can (a) list songs, (b) list artists, (c) list genres. (d) list artist, (e) list genre, (f) play song or (g) exit."

      input = gets.strip

      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song
      end
    end
  end

  def songs
    temp_array = []

    Song.all.each do |value|
      temp_array << value.to_s
    end

    temp_array = temp_array.sort

    temp_array.each.with_index(1) do |song, index|
      puts "#{index}. #{song}"
    end
  end

  def artists
    Artist.all.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def genres
    Genre.all.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end

  def play_song
    puts "What song number would you like to play?"
    song_input = gets.strip

    temp_array = []
    Song.all.each do |value|
      temp_array << value.to_s
    end
    temp_array = temp_array.sort

    puts "Playing #{temp_array[song_input.to_i-1]}" #takes the current song number and selects it from the all array in songs adjusting the index
  end

  #list an artists songs
  def list_artist
    puts "What artist by name would you like to list songs for?"
    artist_input = gets.strip

    if artist = Artist.find_by_name(artist_input)
      artist.songs.each do |song, index|
        puts "#{index}. #{song}"
      end
    end
  end

  #list a genres songs
  def list_genre
    puts "What genre by nae would you like to list sonfs for?"
    genre_input = gets.strip

    if genre = Genre.find_by_name(genre_input) #if true and not nil
      genre.songs.each do |song, index|
        puts "#{index}. #{song}"
      end
    end
  end

end
