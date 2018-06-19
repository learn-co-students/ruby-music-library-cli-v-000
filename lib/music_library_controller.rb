class MusicLibraryController

  def initialize(path = "./db/mp3s")
    new_importer = MusicImporter.new(path)
    new_importer.import
  end

  def call
    a = nil
    until a == "exit"
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    a = gets.strip
    self.list_songs if a == "list songs"
    self.list_artists if a == "list artists"
    self.list_genres if a == "list genres"
    self.list_songs_by_artist if a == "list artist"
    self.list_songs_by_genre if a == "list genre"
    self.play_song if a == "play song"

    end
  end

  def list_songs
    num = 0
    a = {}
  Song.all.map do |x|
    artist_name = x.artist.name
    song_name = x.name
    artist_genre = x.genre.name
    a[song_name] = {artist_name => artist_genre}
    end
    b = a.sort
    list = b.map do |song_name, artist_name|
      num += 1
      puts "#{num}. #{artist_name.keys.join} - #{song_name} - #{artist_name.values.join}"
    end
      list
  end

  def list_artists
    num = 0
    a = []
      Artist.all.map do |x|
       a << x.name unless a.include?(x.name)
      end
      b = a.sort
      b.map do |x|
        num += 1
        puts "#{num}. #{x}"
      end
    end

    def list_genres
      a = []
      num = 0
      Genre.all.map do |x|
        a << x.name unless a.include?(x.name)
      end
      b = a.sort
      b.map do |x|
        num += 1
        puts "#{num}. #{x}"
      end
    end

    def list_songs_by_artist
      num = 0
      song_names_and_genres = {}
      puts "Please enter the name of an artist:"
      artist = gets.chomp.strip #is a string, must use "find by"
      search_artist = Artist.find_by_name(artist)
        if search_artist == nil

          else
            search_artist.songs.map do |x|
              song_name = x.name
              song_genre = x.genre.name
              song_names_and_genres[song_name] = song_genre
          end
      end
      sorted = song_names_and_genres.sort
      sorted.map do |x|
        num += 1
        puts "#{num}. #{x[0]} - #{x[1]}"
    end
  end

  def list_songs_by_genre
    num = 0
    genre_songs = {}
    puts "Please enter the name of a genre:"
    genre = gets.chomp.strip
    search_genre = Genre.find_by_name(genre)
      if search_genre == nil

      else
        search_genre.songs.map do |x|
          artist_name = x.artist.name
          artist_song = x.name
          genre_songs[artist_song] = artist_name
        end
        sorted = genre_songs.sort
        sorted.map do |x|
          num += 1
          puts "#{num}. #{x[1]} - #{x[0]}"
      end
    end
  end

  def play_song
    song_list = {}
    song_number_get = -1
    song_count = Song.all.count
    puts "Which song number would you like to play?"
    song_number_get = gets.strip.to_i
    song_number = song_number_get - 1
    Song.all.map do |x|
      song_list[x.name] = x.artist.name
    end
    ordered_list = Hash[song_list.sort]
    if song_number.between?(1, song_count - 1)
      puts "Playing #{ordered_list.keys[song_number]} by #{ordered_list.values[song_number]}"
    else

    end
  end



end
