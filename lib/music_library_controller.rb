class MusicLibraryController

  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = nil
    while input != "exit"
      puts "Welcome to Music Library."
      puts "What do you want to do?"
      input = gets.strip
      if input == "list songs"
        songs
      elsif input == "list artists"
        artists
      elsif input == "list genres"
        genres
      elsif input == "play song"
        play_song
      elsif input == "list artist"
        list_artist
      elsif input == "list genre"
        list_genre
      end
    end
  end

  def songs
    Song.all.each.with_index(1) do |n, i|
      puts "#{i}. #{n.artist.name} - #{n.name} - #{n.genre.name}"
    end
  end

  def artists
    Artist.all.each.with_index(1) do |n, i|
      puts "#{i}. #{n.name}"
    end
  end

  def list_artist
    puts "What artist songs would you like to see?"
    input = gets.strip
    artist = Artist.find_by_name(input)
    artist.songs.each.with_index(1) do |n, i|
      puts "#{i}. #{artist.name} - #{n.name} - #{n.genre.name}"
    end
  end

  def genres
    Genre.all.each.with_index(1) do |n, i|
      puts "#{i}. #{n.name}"
    end
  end

  def list_genre
    puts "What genre's songs would you like to see?"
    input = gets.strip
    genre = Genre.find_by_name(input)
    genre.songs.each.with_index(1) do |n, i|
      puts "#{i}. #{n.artist.name} - #{n.name} - #{genre.name}"
    end
  end

  def play_song
    puts "What song would you like to play?"
    input = gets.strip
    song = Song.all[input.to_i-1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end
