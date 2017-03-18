class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to the Music Library"
      puts "To Exit type exit"
      input = gets.strip
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        play_song
      when "list artist"
        list_artists_songs
      when "list genre"
        list_genres_songs
      end
    end
  end

  def list_songs
    i = 1
    Song.all.each do |s|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      i += 1
    end
  end

  def list_artists
    Artist.all.each {|a| print "#{a.name}, "}
  end

  def list_genres
    Genre.all.each {|g| print "#{g.name}, "}
  end

  def play_song
    puts "What song number would you like to play?"
    song_number = gets.strip.to_i - 1
    puts "Playing #{Song.all[song_number].artist.name} - #{Song.all[song_number].name} - #{Song.all[song_number].genre.name}"
  end

  def list_artists_songs
    puts "Which artists would you like to hear their songs?"
    artist = gets.strip
    Artist.all.each do |a|
      if artist == a.name
        a.songs.collect {|s| print "#{s.artist.name} - #{s.name } - #{s.genre.name}"}
      end
    end
  end

  def list_genres_songs
    puts "Which genres would you like to hear their songs?"
    genre = gets.strip
    Genre.all.each do |g|
      if genre == g.name
        g.songs.collect {|s| print "#{s.artist.name} - #{s.name } - #{s.genre.name}"}
      end
    end
  end



end
