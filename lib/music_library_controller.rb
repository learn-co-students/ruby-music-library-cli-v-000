class MusicLibraryController

  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    puts "welcome to the Music Library"
    user_input = nil
    until user_input == "exit"
      puts "Yo! Type in a command\nexit\nlist songs\nlist artists\nlist songs\nlist genres\nplay song\nlist artist"
      user_input = gets.chomp
      case user_input
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
        list_genre_songs
      end
    end
  end

  def list_songs
    Song.all.each_with_index { |song, index| puts "#{index +1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"  }
  end

  def list_artists
    Artist.all.each { |artist| puts artist.name }
  end

  def list_genres
    Genre.all.each { |genre| puts genre.name }
  end

  def play_song
    puts "what's the track number of the song you want to play?"
    song_number = gets.chomp.to_i - 1
    song = Song.all[song_number]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist
    puts "what's the artist you want to see?"
    artist_query = gets.chomp
    artist = Artist.find_by_name(artist_query)
    artist.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genre_songs
    puts "what's the genre you want to see?"
    genre_query = gets.chomp
    genre = Genre.find_by_name(genre_query)
    genre.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end


end
