class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to your Library!"
      puts "What would you like to do?"
      input = gets.strip
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list artist"
        list_artist
      when "list genres"
        genres
      when "list genre"
        list_genre
      when "play song"
        play_song
      end
    end  
  end

  def artists
    Artist.all.each.with_index(1){|artist, num| puts "#{num}. #{artist}"}
  end

  def genres
    Genre.all.each.with_index(1){|genre, num| puts "#{num}. #{genre}"}
  end

  def songs
    Song.all.each.with_index(1){|song, num| puts "#{num}. #{song}"}
  end

  def list_artist
    puts "What artist's songs would you like to see?"
    input = gets.strip
    artist = Artist.find_by_name(input)
    if artist
      artist.songs.each{|song, num| puts "#{num}. #{song}"}
    end
  end

  def list_genre
    puts "What genre's songs would you like to see?"
    input = gets.strip
    genre = Genre.find_by_name(input)
    if genre
      genre.songs.each{|song, num| puts "#{num}. #{song}"}
    end
  end

  def play_song
    puts "What song number would you like to play?"
    input = gets.strip
    puts "Now Playing #{Song.all[input.to_i - 1]}"
  end

end