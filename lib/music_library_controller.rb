class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importor = MusicImporter.new(path)
    importor.import
  end

  def call
    input = ""

    puts "Welcome to Your Music Library!"
    puts "What would you like to do?"

    while input != "exit"
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
          list_artist
        when "list genre"
          list_genre
        end
    end
  end
  
  def list_artists
    Artist.all.each {|artist| puts artist.name}
  end

  def list_genres
    Genre.all.each {|genre| puts genre.name}
  end

  def list_songs
    Song.all.each_with_index do |song, index|
      puts "#{index +1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def play_song
    puts "Please enter A Song by Number"
    input = gets.strip.to_i - 1
    track = Song.all[input]
    puts "Playing #{track.artist.name} - #{track.name} - #{track.genre.name}"
  end

  def list_artist
    puts "Pick an Artist"
    artist = gets.strip
    Song.all.each_with_index do |song, index|
      if Artist.find_by_name(artist)
        puts "#{index +1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre
    puts "Pick an Genre"
    genre = gets.strip
    Song.all.each_with_index do |song, index|
      if Genre.find_by_name(genre)
        puts "#{index +1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

end
