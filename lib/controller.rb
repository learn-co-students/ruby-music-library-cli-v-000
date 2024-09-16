class MusicLibraryController

  attr_accessor :path

  def initialize(file_path = "./db/mp3s")
    @path = file_path
    MusicImporter.new(@path).import
  end


  def call
    action = ""

    while action != "exit"
      puts "Welcome to your music library. What would you like to you? Please enter:"
      puts "'list songs' to list your songs"
      puts "'list artists' to list your artists"
      puts "'list genres' to list your genres"
      puts "'play song' to play a song"
      puts "'list artist' to list all of an artist's songs"
      puts "'list genre' to list all songs in a genre"

      action = gets.strip

      case action

        when "list songs"
          self.list_songs
        when "list artists"
          self.list_artists
        when "list genres"
          self.list_genres
        when "play song"
          self.play_song
        when "list artist"
          self.list_artist
        when "list genre"
          self.list_genre
        else
          "Please enter a valid action."
      end
    end
  end


  def list_songs
    song_list = Song.all.sort_by {|song| song.artist.name}.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    song_list
  end

  def list_artists
    Artist.all.uniq.each {|artist| puts "#{artist.name}"}
  end

  def list_genres
    Genre.all.uniq.each {|genre| puts "#{genre.name}"}
  end

  def play_song
    song_list = list_songs
    puts "Enter the list number for the song"
    number = gets.to_i
    index = number - 1
    puts "Playing #{song_list[index].artist.name} - #{song_list[index].name} - #{song_list[index].genre.name}"
  end

  def list_artist
    puts "What artist would you like to list songs for:"
    artist_name = gets.strip
    Artist.find_by_name(artist_name).songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genre
    puts "What genre would you like to list songs for:"
    genre_name = gets.strip
    Genre.find_by_name(genre_name).songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

end
