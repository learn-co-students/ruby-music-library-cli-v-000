class MusicLibraryController
  def initialize(path='./db/mp3s')
    @importer = MusicImporter.new(path)
    @importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    input = ""
    while input != "exit"
      input = gets
      #binding.pry
      if input == "list songs"
        self.list_songs
      elsif input == "list artists"
        self.list_artists
      elsif input == "list genres"
        self.list_genres
      elsif input =="list artist"
        self.list_songs_by_artist
      elsif input == "list genre"
        self.list_songs_by_genre
      elsif input == "play song"
        self.play_song
      end
    end
  end

  def list_songs
    count = 0
    arr = Song.all.sort {|x,y| x.name <=> y.name}
    arr.each{|e|puts "#{count += 1}. #{e.artist.name} - #{e.name} - #{e.genre.name}"}
  end

  def list_artists
    count = 0
    arr = Artist.all.sort {|x,y| x.name <=> y.name}
    arr.each{|e|puts "#{count += 1}. #{e.name}"}
  end

  def list_genres
    count = 0
    arr = Genre.all.sort {|x,y| x.name <=> y.name}
    arr.each{|e|puts "#{count += 1}. #{e.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets
    count = 0
    artist_object = Artist.find_by_name(artist)
    if artist_object != nil
      arr = artist_object.songs.sort {|x, y| x.name <=> y.name}
      arr.each{|e|puts "#{count += 1}. #{e.name} - #{e.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets
    count = 0
    genre_object = Genre.find_by_name(genre)
    if genre_object != nil
      arr = genre_object.songs.sort {|x, y| x.name <=> y.name}
      arr.each{|e|puts "#{count += 1}. #{e.artist.name} - #{e.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_choice = gets.strip.to_i
    arr = Song.all.sort {|x, y| x.name <=> y.name}
    #binding.pry
    if (1..arr.length).to_a.include?(song_choice)
      song = arr[song_choice-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end

  end
end
