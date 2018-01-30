class MusicLibraryController

  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    choice = ""
    while choice != "exit"
      puts "Welcome to Your Music Library!"
      puts "What would you like to do?"
      choice = gets.chomp
      case choice
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
    artist_input = gets.chomp
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each do |s,i|
        puts "#{i}. #{s}"
      end
    end
  end

  def list_genre
    puts "What genre by name you like to list songs for?"
    genre_input = gets.chomp
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each do |s,i|
        puts "#{i}. #{s}"
      end
    end
  end

  def play_song
    puts "What song number would you like to play?"
    song_input = gets.chomp
    puts "Playing #{Song.all[song_input.to_i-1]}"
  end

  def songs
    Song.all.each.with_index(1) do |song, i|
      puts "#{i}. #{song}"
    end
  end

end
