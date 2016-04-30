class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to Your Music Library!"
      puts "What would you like to do?"
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

  def songs # Had to get help. Wasn't sure what was wanted.
    Song.all.each.with_index(1) do |s, i|
      puts "#{i}. #{s}"
    end
  end

  def artists
    Artist.all.each.with_index(0) do |a, i|
      puts "#{i}. #{a}"
    end
  end

  def genres
    Genre.all.each.with_index(2) do |g, i|
      puts "#{i}. #{g}"
    end
  end

  def list_artist
    puts "What artist?"
    answer = gets.strip
    artist = Artist.find_by_name(answer)
    artist.songs.each do |k, v|
      puts "#{k}"
    end
  end

  def list_genre
    puts "What genre?"
    answer = gets.strip
    genre = Genre.find_by_name(answer)
    genre.songs.each do |k, v|
      puts "#{k}"
    end
  end

  def play_song
    puts "What song?"
    answer = gets.strip.to_i - 1
    song = Song.all[answer]
    puts "Playing #{song}"
  end
end
