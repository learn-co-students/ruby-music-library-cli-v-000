class MusicLibraryController

  attr_accessor :path

  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    answer = nil
    while answer != "exit" 
      puts "Welcome to Your Music Library!"
      puts "What would you like to do?"
      answer = gets.chomp
      if answer == "list songs"
        songs
      elsif answer == "list artists"
        artists
      elsif answer == "list genres"
        genres
      elsif answer == "play song"
        play
      elsif answer == "list artist"
        artist_songs
      elsif answer == "list genre"
        genre_songs
      end

    end
  end

  def songs
    Song.all.each.with_index(1){|song, i| puts "#{i}. #{song.to_s}"}
  end

  def artists
    Artist.all.each{|artist| puts "#{artist.name}"}
  end

  def genres
    Genre.all.each{|genre| puts "#{genre.name}"}
  end

  def play
    puts "enter song number"
    answer = gets.chomp
    puts "Playing #{Song.all[answer.to_i-1]}"
  end

  def artist_songs
    puts "enter artist name"
    answer = gets.chomp
    selected_artist = Artist.find_or_create_by_name(answer)
    selected_artist.songs.each do |song|
      puts "#{song.to_s}"
    end 
  end

  def genre_songs
    puts "enter genre"
    answer = gets.chomp
    selected_genre = Genre.find_or_create_by_name(answer)
    selected_genre.songs.each do |song|
      puts "#{song.to_s}"
    end
  end

end
