class MusicLibraryController
  attr_reader :path

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(@path).import
  end

  def call
    puts "Welcome to the jukebox!"

    loop do 
      request = ''
      puts list_options
      request = gets.chomp

      case request
        when "list songs"
          list_songs
        when "list artists"
          list_artists
        when "list genres"
          list_genres
        when "play song"
          play_song
        when "list artist"
          list_artist_songs
        when "list genre"
          list_genre_songs
        when "exit"
          break
        else
          puts "I'm sorry, I didn't understand.  Please try again."
      end
    end
  end 

  def list_options
    value = "Please select from the options below:"
    value += "\n1. list songs"
    value += "\n2. list artists"
    value += "\n3. list genres"
    value += "\n4. play song"
    value += "\n5. list artist"
    value += "\n6. list genre"
    value += "\n7. exit"
    value
  end

  def exit_music
    puts "Thanks for listening!"
  end

  def list_songs
    count = 1
    Song.all.each do |song|
      puts "#{count}. #{formatted_name(song)}"
      count += 1
    end
  end

  def list_artists
    count = 1
    Artist.all.each do |artist|
      puts "#{count}. #{artist.name}"
      count += 1
    end
  end

  def list_genres
    Genre.all.each { |genre| puts "#{genre.name}" }
  end

  def play_song
    list_songs
    puts "\nWhich song would you like to listen to?"
    song_index = gets.chomp.to_i - 1
    song = Song.all[song_index]
    puts "Playing #{formatted_name(song)}"
  end

  def list_artist_songs
    list_artists
    puts "\nWhich artist's songs would you like to view?"
    artist_index = gets.chomp
    songs = Artist.find_by_name(artist_index).songs
    songs.each { |song| puts formatted_name(song) }
  end

  def list_genre_songs
    list_genres
    puts "\nWhich genre's songs would you like to view?"
    genre_index = gets.chomp
    genre = Genre.find_by_name(genre_index)
    genre.songs.each { |song| puts formatted_name(song) }
  end

  def formatted_name(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end