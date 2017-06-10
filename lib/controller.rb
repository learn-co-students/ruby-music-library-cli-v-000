class MusicLibraryController
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def songs
     Song.all.each.with_index  do |song, index|
       puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
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

  def play
    user_input = gets.strip
    puts "Playing #{Song.all[user_input.to_i-1].artist.name} - #{Song.all[user_input.to_i-1].name} - #{Song.all[user_input.to_i-1].genre.name}"
  end

  def artist_song
    user_input = gets.strip
    artist = Artist.find_by_name(user_input)
    artist.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def genre
    user_input = gets.strip
    genre = Genre.find_by_name(user_input)
    genre.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end 
  end


  def call
    input = ""
    while input !="exit"
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
      when "play song"
        play
      when "list artist"
        artist_song
      when "list genre"
        genre
      end
    end
  end
end
