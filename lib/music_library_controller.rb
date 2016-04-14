class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    while input != "7" 
      puts "Welcome to the Music Library!"
      puts "Please enter a number: "
      puts ""
      puts "1. List songs\n2. List artists\n3. List genres"
      puts "4. List artist's songs\n5. List genre's songs\n6. Play song\n7. Exit"
      input = gets.chomp
      case input
      when "1"
        songs
      when "2"
        artists
      when "3"
        genres
      when "4"
        list_artist
      when "5"
        list_genre
      when "6"
        play_song
      end
    end
  end

  def songs
    Song.all.each.with_index(1) do |s,i|
      puts "#{i}. #{s.name}"
    end
  end

  def artists
    Artist.all.each.with_index(1) do |a,i|
      puts "#{i}. #{a.name}"
    end
  end

  def genres
    Genre.all.each.with_index(1) do |g,i|
      puts "#{i}. #{g.name}"
    end
  end

  def list_artist
    puts "Please type the name of the artist whose songs you would like to list:"
    input = gets.chomp
    if artist = Artist.find_by_name(input)
      artist.songs.each.with_index(1) do |s,i|
        puts "#{i}. #{s.name}"
      end
    end
  end

  def list_genre
    puts "Please type the name of the genre whose songs you would like to list:"
    input = gets.chomp
    if genre = Genre.find_by_name(input)
      genre.songs.each.with_index(1) do |s,i|
        puts "#{i}. #{s.name}"
      end
    end
  end

  def play_song
    puts "Please type the number of the song you would like to play:"
    input = gets.chomp
    puts "Now playing: #{Song.all[input.to_i-1].name}"
  end
end




