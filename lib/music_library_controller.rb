class MusicLibraryController

  def initialize(path = './db/mp3s')
    music_importer = MusicImporter.new(path).import
  end

  def call
    user_input = ""
    while user_input != "exit"
      puts "Welcome to your music library!"
      puts "What would you like to do?"
      puts "Type exit to exit"
      user_input = gets.strip

      case user_input
        when "list songs"
          list_songs
        when "list artists"
          list_artists
        when "list genres"
          list_genres
        when "list artist"
          list_artist_songs
        when "list genre"
          list_genre_songs
        when "play song"
          play_song
      end
    end
  end

  def list_songs
    Song.all.sort_by!{|a| a.artist.name}.each_with_index do |s, i|
      puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    Artist.all.each {|a| puts a.name}
  end

  def list_genres
    Genre.all.each {|g| puts g.name}
  end

  def play_song
    puts "What song number would you like to play?"
    self.list_songs
    input = gets.to_i - 1
    puts "Playing #{Song.all[input].artist.name} - #{Song.all[input].name} - #{Song.all[input].genre.name}"
  end

  def list_artist_songs
    puts "Which artist's songs do you want to list?"
    self.list_artists
    artist_name = gets.strip
    artist = Artist.find_by_name(artist_name)
    if artist == nil
      puts "Not a valid artist name"
    else
      artist.songs.collect {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end
  end

  def list_genre_songs
    puts "Which genre's songs do you want to list?"
    self.list_genres
    genre_name = gets.strip
    genre = Genre.find_by_name(genre_name)
    if genre == nil
      puts "Not a valid artist name"
    else
      genre.songs.collect {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end
  end

end
