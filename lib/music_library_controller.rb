class MusicLibraryController
  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path).import
  end

  def call
    input = ''
    while input != 'exit'
      input = gets.strip
      case input
        when 'list songs'
          list_songs
        when 'list artists'
          list_artists
        when 'list genres'
          list_genres
        when 'play song'
          play_song
        when 'list artist'
          list_artist_songs
        when 'list genre'
          list_genre_songs
        else
          'Error!'
      end
    end
  end


  def list_songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
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

  def play_song
    list_songs
    selection = gets.strip.to_i - 1
    song = Song.all[selection]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist_songs
    artist = Artist.find_by_name(gets.strip)
    artist.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_genre_songs
    genre = Genre.find_by_name(gets.strip)
    genre.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
end
