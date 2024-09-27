class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(@path).import
  end

#  def call
#    input = ""
#    puts "Hello hello, it's Wayback Monday so let's play music like it's 1995"
#    puts "What can I do for you?"
#    puts " list songs | list artists | list genres | play song | list songs by artist | list songs by genre"
#    while input != "exit"
#      puts "Welcome to Your Music Library!"
#      puts "What would you like to do?"
#      input = gets.strip
#      case input
#      when "list songs"
#        list_songs
#      when "list artists"
#        list_artists
#      when "list genres"
#        list_genres
#      when "list artist"
#        list_songs_by_artist
#      when "list genre"
#        list_song_by_genre
#      when "play song"
#        play_song
#      end
#    end
#  end
  def call
    input = ""
    puts "Hello hello, it's Wayback Monday so let's play music like it's 1995"
    puts "What can I do for you?"
    while input != "exit"
      puts " list songs | list artists | list genres | play song | list artist | list genre"
      input = gets.strip
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_song_by_genre
      when "play song"
        play_song
      when "exit"
        puts "Have a great day!"
        break
      end
    end
  end

  def list_songs
    Song.all.each_with_index {|song, inx| puts "#{inx+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def list_artists
    Artist.all.each {|artist| puts artist.name}
  end

  def list_genres
    Genre.all.each {|genre| puts genre.name}
  end

  def play_song
    puts "Please type song number:"
    idx = gets.strip.to_i
    song = Song.all[idx-1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_songs_by_artist
    puts "Which artist?"
    artist_name = gets.strip.to_s
    artist = Artist.find_by_name(artist_name)
    artist.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_song_by_genre
    puts "Which genre?"
    genre_name = gets.strip.to_s
    genre = Genre.find_by_name(genre_name)
    genre.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
end