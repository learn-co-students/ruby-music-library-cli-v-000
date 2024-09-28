class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""
    puts "Welcome to your music library!"

    while input != "exit"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.strip
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      end
    end
  end

  def list_songs
    i = 0
    song_list = Song.all.sort_by {|song| song.name}
    song_list.each {|song| puts "#{i+=1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    i = 0
    artist_list = Artist.all.sort_by {|artist| artist.name}
    artist_list.each {|artist| puts "#{i+=1}. #{artist.name}"}
  end

  def list_genres
    i = 0
    genre_list = Genre.all.sort_by {|genre| genre.name}
    genre_list.each {|genre| puts "#{i+=1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if artist = Artist.find_by_name(input)
      artist.songs.sort{ |a, b| a.name <=> b.name}.each.with_index(1) do |song, index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      genre.songs.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input.between?(1, Song.all.length)
      song = Song.all.sort {|a, b| a.name <=> b.name}
      puts "Playing #{song[input-1].name} by #{song[input-1].artist.name}"
    end
  end

end
