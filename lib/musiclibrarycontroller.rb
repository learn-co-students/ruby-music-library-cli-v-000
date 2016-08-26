class MusicLibraryController
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    loop do
      print "What would you like to do? "
      input = gets.chomp

      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        print "Enter the song number: "
        song_num = gets.chomp.to_i
        play_song(song_num)
      when "exit"
        break
      end

      if artists.include?(input)
        list_artist_songs(input)
      elsif genres.include?(input)
        list_genre_songs(input)
      end

    end
  end

  def artists
    artists = songs.collect { |song| song.artist.name}.uniq.sort
  end

  def genres
    genres = songs.collect { |song| song.genre.name}.uniq.sort
  end

  def songs
    songs = Song.all.sort_by { |song| [ song.artist.name, song.name ] }
  end

  def list_artists
    artists.each do |artist|
      puts "#{artist}"
    end
  end

  def list_artist_songs(artist_name)
    artist = Artist.find_by_name(artist_name)
    artist.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genre_songs(genre_name)
    genre = Genre.find_by_name(genre_name)
    genre.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genres
    genres.each do |genre|
      puts "#{genre}"
    end
  end

  def list_songs
    songs.each do |song|
      puts "#{songs.index(song)+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def play_song(song_num)
    song = songs[song_num - 1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end
