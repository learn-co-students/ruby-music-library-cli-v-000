class MusicLibraryController
  attr_accessor :path

  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(@path).import
  end

  def call
    input = ""

    while input != "exit"
      input = gets.chomp
      case input
      when "list songs"
        list_songs
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

  def list_songs
    song_list = Song.all.sort_by {|song| song.artist.name}

    song_list.each.with_index do |song, index|
     puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end

  end

  def play_song
    song_number = gets.chomp.to_i
    songs = list_songs
    song = songs[song_number - 1]

    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def artists
    Artist.all.each { |artist| puts "#{artist.name}"}
  end

  def list_artist
    artist_name = gets
    if artist = Artist.find_by_name(artist_name)
      artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def genres
    Genre.all.each { |genre| puts "#{genre.name}"}
  end

  def list_genre
    genre_name = gets
    if genre = Genre.find_by_name(genre_name)
      genre.songs.each do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

end
