class MusicLibraryController
  extend Concerns::Findable
  attr_accessor :path

  def initialize(path = './db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    response = nil
    until response == "exit" do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      response = gets
      case response
        when "list songs"
          list_songs
        when "list artists"
          list_artists
        when "list genres"
          list_genres
        when "list artist"
          list_songs_by_artist
        when "list genre"
          list_songs_by_genre
        when "play song"
          play_song
      end
    end
  end

  def list_songs
    #"1. Thundercat - For Love I Come - dance" order by song name
    ordered_songs = Song.all.uniq.sort_by {|song| song.name} #need to use "uniq" because there are duplicates of each song for some reason
    ordered_songs.each do |song|
      number = ordered_songs.index(song) + 1
      puts  "#{number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    ordered_artists = Artist.all.sort_by {|artist| artist.name}
    ordered_artists.each do |artist|
      number = ordered_artists.index(artist) + 1
      puts "#{number}. #{artist.name}"
    end
  end

  def list_genres
    ordered_genres = Genre.all.sort_by {|genre| genre.name}
    ordered_genres.each do |genre|
      number = ordered_genres.index(genre) + 1
      puts "#{number}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets
    artist = Artist.all.select { |artist| artist.name == artist_name }.first #need to use .first b/c there are duplicates of each object and we want to select only one object
    if artist != nil
      ordered_songs = artist.songs.sort_by {|song| song.name}
      i = 1
      ordered_songs.each do |song|
        puts "#{i}. #{song.name} - #{song.genre.name}"
        i += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets
    genre = Genre.all.select { |genre| genre.name == genre_name }.first
    if genre != nil
      ordered_songs = genre.songs.sort_by {|song| song.name}
      i = 1
      ordered_songs.each do |song|
        puts "#{i}. #{song.artist.name} - #{song.name}"
        i += 1
      end
    end
  end

  def play_song
    # list_songs
    puts "Which song number would you like to play?"
    song_number = gets.to_i
    index_number = song_number - 1
    unique_songs = Song.all.uniq.sort_by{|song| song.name}
    songs_all = []
    unique_songs.each do |song|
      songs_all << "Playing #{song.name} by #{song.artist.name}"
    end
    if song_number > 0 && song_number <= songs_all.length
      puts songs_all[index_number]
    end
  end


end
