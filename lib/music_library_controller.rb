class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    user_input = ""
    while user_input != "exit"
      puts "Opening your music library..."
      puts "How can I help you?"
      user_input = gets.strip

      case user_input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      end

    end
  end

  def songs
    Song.all.each.with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def artists
    Song.all.each {|song| puts "#{song.artist.name}"}
  end

  def genres
    Song.all.each {|song| puts "#{song.genre.name}"}
  end

  def play_song
    puts "Which track number would you like to play?"
    track = gets.strip
    puts "Playing #{Song.all[track.to_i - 1].artist.name} - #{Song.all[track.to_i - 1].name} - #{Song.all[track.to_i - 1].genre.name}"
  end

  def list_artist
    puts "Which artist's songs would you like to list?"
    artist = gets.strip
    Song.all.collect {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" unless song.artist.name != artist}
  end

  def list_genre
    puts "Which genre's songs would you like to list?"
    genre = gets.strip
    Song.all.collect {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" unless song.genre.name != genre}
  end

end