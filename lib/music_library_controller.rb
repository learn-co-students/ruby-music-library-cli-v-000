class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    imports = MusicImporter.new(path)
    imports.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to the Music Library"
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
    Artist.all.each.with_index(1) do |s, n|
      puts "#{n}. #{s.name}"
    end
  end

  def songs
    Song.all.each.with_index(1) do |s, n|
      puts "#{n}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def genres
    Genre.all.each.with_index(1) do |s, n|
      puts "#{n}. #{s.name}"
    end
  end

  def list_artist
    puts "Which artist would you like to list songs for?"
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each do |s, i|
        puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_genre
    puts "Which genre would you like to list songs for?"
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each do |s, i|
        puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      end
    end
  end

  def play_song
    puts "Which song would you like to play?"
    list_song = Song.all.collect {|song| "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
    list_song.sort
    song_input = gets.strip.to_i
    puts "Playing " + list_song[song_input - 1]
  end


end
