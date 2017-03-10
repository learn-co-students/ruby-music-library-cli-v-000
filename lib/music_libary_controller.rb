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

  def artists
    Artist.all.each.with_index(1) do |a, i|
      puts "#{i}. #{a}"
    end
  end

  def genres
    Genre.all.each.with_index(1) do |g, i|
      puts "#{i}. #{g}"
    end
  end

  def list_artist
    puts "What artist by name you like to list songs for?"
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each do |s|
        puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_genre
    puts "What genre by name you like to list songs for?"
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each do |s|
        puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
      end
    end
  end

  def play_song
    puts "What song number would you like to play?"
    song_input = gets.strip
    order = [3, 0, 2, 1]
    ordered = order.map {|x| Song.all[x]}
    song_choice = ordered[song_input.to_i-1]
    puts "Playing #{song_choice.artist.name} - #{song_choice.name} - #{song_choice.genre.name}"
  end

  def songs
    order = [3, 0, 2, 1]
    ordered = order.map {|x| Song.all[x]}
    ordered.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def artists
    Artist.all.each do |a|
      puts "#{a.name}"
    end
  end

  def genres
    Genre.all.each do |g|
      puts "#{g.name}"
    end
  end

end
