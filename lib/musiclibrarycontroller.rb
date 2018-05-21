class MusicLibraryController
  attr_accessor :path
  attr_reader :mp3Importer
  
  def initialize(filepath="./db/mp3s")
    @path = filepath
    @mp3Importer = MusicImporter.new(@path)
    @mp3s = @mp3Importer.import
  end
  
  def list_songs
   reorderedSongs = []
    @mp3s.each do |mp3|
      songInfo = mp3.split(" - ")
      artist_name = songInfo[0]
      song_name = songInfo[1]
      genre_name = songInfo[2].gsub!(/.mp3/,"")
      reorderedSongs << [song_name, artist_name, genre_name]
    end
    reorderedSongs.sort.each_with_index do |song, index|
      puts "#{index+1}. #{song[1]} - #{song[0]} - #{song[2]}"
    end
    '''
    #binding.pry
    Song.all.sort_by! {|song|song.name}
    Song.all.uniq
    #binding.pry    
    Song.all.each_with_index do |song, index| 
      binding.pry
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    '''
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
    songNumIndex = gets.strip
    songInt = songNumIndex.to_i
    #sortedSongs = Song.all.sort_by! {|song| song.name}
    #sortedSongs.uniq.each do |song|
    reorderedSongs = []
    @mp3s.each do |mp3|
      songInfo = mp3.split(" - ")
      artist_name = songInfo[0]
      song_name = songInfo[1]
      genre_name = songInfo[2].gsub!(/.mp3/,"")
      reorderedSongs << [song_name, artist_name, genre_name]
    end
    reorderedSongs.sort!
    if songInt-1 < reorderedSongs.length && songInt >= 1 && songInt <= 100
      puts "Playing #{reorderedSongs[songInt-1][0]} by #{reorderedSongs[songInt-1][1]}"
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
      if userInput == "list songs"
        list_songs
      elsif userInput == "list artists"
        list_artists
      elsif userInput == "list genres"
        list_genres
      elsif userInput == "list artist"
        list_songs_by_artist
      elsif userInput == "list genre"
        list_songs_by_genre
      elsif userInput == "play song"
        play_song
      end
    end
  end
end
