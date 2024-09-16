class MusicLibraryController
  attr_accessor :path
  attr_reader :mp3Importer
  
  def initialize(filepath="./db/mp3s")
    @path = filepath
    @mp3Importer = MusicImporter.new(@path)
    @mp3s = @mp3Importer.import
  end
  
  def list_songs
    reorderedSongs = Song.all.sort {|a,b| a.name <=> b.name}
    reorderedSongs.each_with_index do |song,index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    Artist.all.sort_by! {|artist|artist.name}
    Artist.all.uniq
    Artist.all.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end
  
  def list_genres
    Genre.all.sort_by! {|genre|genre.name}
    Genre.all.uniq
    Genre.all.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    artist = Artist.all.detect {|artist| artist.name == artist_name}
    if artist != nil
      artist.songs.sort_by! {|song|song.name}
      artist.songs.each_with_index do |song, index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    genre = Genre.all.detect {|genreObject| genreObject.name == genre_name}
    if genre != nil
      genre.songs.sort_by! {|song|song.name}
      genre.songs.each_with_index do |songObject, index|
        puts "#{index+1}. #{songObject.artist.name} - #{songObject.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    songNumIndex = gets.strip.to_i
    reorderedSongs = Song.all.sort {|a,b| a.name <=> b.name}
    if songNumIndex-1 < reorderedSongs.length && songNumIndex >= 1 && songNumIndex <= 100
      puts "Playing #{reorderedSongs[songNumIndex-1].name} by #{reorderedSongs[songNumIndex-1].artist.name}"
    end
  end

  def call
    userInput = ""
    while userInput != 'exit'
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      userInput = gets.strip
      case userInput
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
      when"play song"
        play_song
      end
    end
  end
end
