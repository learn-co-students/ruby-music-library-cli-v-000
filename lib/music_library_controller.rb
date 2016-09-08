class MusicLibraryController
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    loop do
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
        play_song(gets.chomp.to_i)
      when "list artist"
        list_songs_from_artist(gets.chomp)
      when "list genre"
        list_songs_from_genre(gets.chomp)
      end
    end
  end

  private
  def list_songs_from_artist(artist)
    songs = Artist.find_by_name(artist).songs
    songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs_from_genre(genre)
    songs = Genre.find_by_name(genre).songs
    songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs
    Song.all.each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
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

  def play_song(song_number)
    song = Song.all[song_number - 1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end
