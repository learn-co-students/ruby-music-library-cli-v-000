class MusicLibraryController
  def initialize(path='./db/mp3s')
    importer=MusicImporter.new(path)
    importer.import
  end

  def call
    input=""
    while input != "exit"
      puts "Welcome to Your Music Library!"
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

  def songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Artist.all.each do |artist|
      puts "#{artist.name}"
    end
  end

  def genres
    Genre.all.each do |genre|
      puts "#{genre.name}"
    end
  end

  def play_song
    puts "What song number do you wnat to play?"
    song_input = gets.strip
    song=Song.all[song_input.to_i-1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist
    puts "What artist by name you like to list songs for?"
    input = gets.strip
    if artist = Artist.find_by_name(input)
      artist.songs.each do |song,index|
        puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre
    puts "What genre by name you like to list songs for?"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      genre.songs.each do |song,index|
        puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end
end