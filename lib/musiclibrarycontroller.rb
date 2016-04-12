class MusicLibraryController
  attr_reader :path

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def list_songs
    Song.all.each_with_index do |song, index|
    puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each do |artist|
      puts "#{artist.name}"
    end
  end

  def list_genres
    Genre.all.each do |genre|
      puts "#{genre.name}"
    end
  end

  def play_a_song
    Song.all.each do |song|
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
  end

  def artist_songs
    Song.all.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def genre_songs
     Song.all.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def call
    on = true
    while on do
      puts "Hello"
    
      input = gets.strip
    
      case input
        when "list songs"
          list_songs
        when"list artists"
          list_artists
        when "list genres"
          list_genres
        when "play song"
          play_a_song
        when "list artist"
          artist_songs
        when "list genre"
          genre_songs
        when "exit"
          on = false
        end
    end 
  end

end