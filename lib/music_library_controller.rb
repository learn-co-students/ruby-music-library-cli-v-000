class MusicLibraryController

  def initialize(path = "./db/mp3s")
    music_import = MusicImporter.new(path)
    music_import.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Hello and WELCOME to the best Music Library around!"
      puts "How can I help you today?"
      input = gets.strip
      if input == "list songs"
        songs
      elsif input == "list artists"
        artists
      elsif input == "list genres"
        genres
      elsif input == "list artist"
        list_artist
      elsif input == "list genre"
        list_genre
      elsif input == "play song"
        play_song
      end
    end
  end

  def songs
    Song.all.each.with_index(1) do |a,b|
      puts "#{b}. #{a}"
    end
  end

  def play_song
    puts "Enter corresponding song number to play."
    input = gets.chomp
    puts "Playing #{Song.all[input.to_i-1]}"
  end

  def artists
    Artist.all.each.with_index(1) do |a,b|
      puts "#{b}. #{a}"
    end
  end

  def genres
    Genre.all.each.with_index(1) do |a,b|
      puts "#{b}. #{a}"
    end
  end

  def list_artist
    puts "Which artist name would you like the songs listed for?"
    input = gets.chomp
    if artist = Artist.find_by_name(input)
      artist.songs.each do |a,b|
        puts "#{b}. #{a}"
      end
    end
  end

  def list_genre
    puts "Which genre would you like the songs listed for?"
    input = gets.chomp
    if genre = Genre.find_by_name(input)
      genre.songs.each do |a,b|
        puts "#{b}. #{a}"
      end
    end
  end

end
