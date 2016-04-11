class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(@path).import
  end

def call
    response = ""
    while response != "exit"
      puts "Tell me what to do"
      response = gets.chomp
      case response
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
    puts "Select a song."
    song_index = gets.strip
    puts "Playing #{Song.all[song_index.to_i-1].artist.name} - #{Song.all[song_index.to_i-1].name} - #{Song.all[song_index.to_i-1].genre.name}"
  end

  def list_artist
    puts "Select an artist"
    artist_name = gets.strip
    if artist = Artist.find_by_name(artist_name)
      artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre
    puts "Select a genre"
    song_genre = gets.strip
    if genre = Genre.find_by_name(song_genre)
      genre.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

end







