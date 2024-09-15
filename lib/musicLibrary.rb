class MusicLibraryController
  attr_accessor :path
  def initialize(path = './db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = ''
    while input != "exit"
      puts "Welcome to Your Music Library"
      puts "What would you like to do"
      input = gets.strip
      case input
      when "list artists"
        artists
      when "list songs"
        songs
      when "list genres"
        genres
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list song"
        list_song
      when "list genre"
        list_genre
      end
    end
  end

  def artists
    Artist.all.each_with_index {|artist, index| puts "#{index + 1}. #{artist}"}
  end

  def songs
    Song.all.each_with_index {|song, index| puts "#{index + 1}. #{song}"}
  end

  def genres
    Genre.all.each_with_index {|genre, index| puts "#{index + 1}. #{genre}"}
  end

  def play_song
    puts "What song would you like to play?"
    song_input = gets.strip
    puts "Playing #{Song.all[song_input.to_i-1]}"
  end

  def list_artist
    puts "What artist would you like a list for?"
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each {|song, index| puts "#{index}. #{song}"}
    end
  end

  def list_genre
    puts "What genre would you like a list for?"
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each{|song, index| puts "#{index}. #{song}"}
    end
  end

end
