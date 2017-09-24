class MusicLibraryController

  attr_reader :path, :input

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    while input != "exit"
      @input = gets
        if @input == "list songs"
          numbered_list
        elsif @input == "list artists"
          list_artists
        elsif @input == "list genres"
          list_genres
        elsif @input == "play song"
          puts "Which song would you like to play?"
          sorted_list
          @number = gets.to_i
          playing_song = sorted_list[@number - 1]
          puts "Playing #{playing_song.artist.name} - #{playing_song.name} - #{playing_song.genre.name}"
        elsif @input == "list artist"
          puts "Which artist's songs would you like to see?"
          @art_list = gets
          @art_found =  Artist.find_by_name(@art_list)
          list_artist_songs(@art_found)
        elsif @input == "list genre"
          puts "Which genre's songs would you like to see?"
          @gen_list = gets
          @gen_found =  Genre.find_by_name(@gen_list)
          list_genres_songs(@gen_found)
        end
      puts "a, b, exit"
    end
  end

  def sorted_list
    sorted_list = Song.all.sort_by {
      |song| song.artist.name
    }
  end

  def numbered_list
    i = 1
    sorted_list.each {|song|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      i += 1 }
  end

  def list_artists
    Artist.all.each {|artist|
      puts "#{artist.name}" }
  end

  def list_genres
    Genre.all.each {|genre|
    puts "#{genre.name}" }
  end

  def list_artist_songs(artist)
    artist.songs.each {|song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_genres_songs(genre)
    genre.songs.each {|song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

end
