class MusicLibraryController

  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    loop do
      puts "Welcome to Music Player! What would you like to do?"
      puts "  : list songs"
      puts "  : list artists"
      puts "  : list genres"
      puts "  : play song"
      puts "  : list artist"
      puts "  : list genre"

      input = gets.chomp

      case input
      when "exit"
        break
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      end
    end
  end

  def list_songs
    Song.all.each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each { |artist| puts artist.name }
  end

  def list_genres
    Genre.all.each { |genre| puts genre.name }
  end

  def play_song
    puts "Please enter the song number:"
    index = gets.chomp.to_i - 1
    song = Song.all[index]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist
    puts "Please enter the artist's name:"
    name = gets.chomp
    songs = Artist.find_by_name(name).songs
    songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genre
    puts "Please enter the genre:"
    name = gets.chomp
    songs = Genre.find_by_name(name).songs
    songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

end
