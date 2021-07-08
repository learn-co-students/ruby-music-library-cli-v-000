require 'pry'
class MusicLibraryController
  extend Concerns::Findable
  attr_accessor :path 
  
  def initialize(path = './db/mp3s')
    @path = path 
    x = MusicImporter.new(path)
    x.import
    #@finalSongArray = []
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
    loop do 
      puts "What would you like to do?"
      x = gets.chomp
      if x == "exit"
        break 
      end 
      if x == "list songs"
        list_songs
        elsif x == "list artists"
        list_artists
        elsif x == "list genres"
        list_genres
        elsif x == "list artist"
        list_songs_by_artist
        elsif x == "list genre"
        list_songs_by_genre
        elsif x == "play song"
        play_song
      end 
    end 
  end 
  
  def list_songs
    count = 1
    songName = []
    @finalSongArray = []
    songObArray = Song.all 
    
    songObArray.map do |songInstance|
      songName << songInstance.name 
    end 
    songName = songName.sort
    
    songName.map do |name|
      songObArray.map do |songInstance|
        if name == songInstance.name 
          songName = songInstance.name 
          songArtistOb = songInstance.artist
          songArtist = songArtistOb.name
          songGenreOb = songInstance.genre 
          songGenre = songGenreOb.name
          songInfo = "#{songArtist} - #{songName} - #{songGenre}"
          @finalSongArray << songInfo
        end 
      end 
    end 
    
    @finalSongArray.each do |song|
        puts "#{count}. #{song}"
        count += 1 
    end 
  end 
  
  def list_artists
     count = 1
    
    artistArray = [] 
    artistArrayOb = Artist.all 
    artistArrayOb.map do |artist|
      artistArray << artist.name 
    end 
    sortedArtistArray = artistArray.sort
    
    sortedArtistArray.each do |artist|
         puts "#{count}. #{artist}"
         count += 1 
     end 
  end 
  
  def list_genres 
    count = 1
    
    genreArray = [] 
    genreArrayOb = Genre.all 
    genreArrayOb.map do |genre|
      genreArray << genre.name 
    end 
    sortedGenreArray = genreArray.sort
    
    sortedGenreArray.each do |genre|
         puts "#{count}. #{genre}"
         count += 1 
     end 
  end 
  
  def list_songs_by_artist
    count = 1
    artistArray = [] 
    artistSongsOb = []
    artistSongs = []
    artistArrayOb = Artist.all 
    
    puts "Please enter the name of an artist:"
    artistUser = gets.chomp
    
    artistArrayOb.map do |artist|
      artistArray << artist.name 
    end 
    
    artistArray.map do |artist|
      if artist == artistUser
        artistArrayOb.map do |artistOb|
          if artistUser == artistOb.name 
            artistSongsOb = artistOb.songs
          end 
        end 
      end 
    end 
    
    artistSongsOb.map do |songs|
      songName = songs.name 
      songGenreOb = songs.genre
      songGenre = songGenreOb.name 
      info = "#{songName} - #{songGenre}"
      artistSongs << info 
    end 
    
    alphaArtistSongs = artistSongs.sort
    alphaArtistSongs.each do |song|
      puts "#{count}. #{song}"
      count += 1
    end 
    
  end 
  
  def list_songs_by_genre
    count = 1
    genreArray = [] 
    genreSongsOb = []
    genreSongs = []
    genreArrayOb = Genre.all 
    songsArray = []
    alphaSongsOb = []
    
    puts "Please enter the name of a genre:"
    genreUser = gets.chomp 
    
    genreArrayOb.map do |genre|
      genreArray << genre.name 
    end 
    #genreArray = genreArray.sort
    genreArray.map do |genre|
      if genre == genreUser
        genreArrayOb.map do |genreOb|
          if genreUser == genreOb.name 
            genreSongsOb = genreOb.songs
            genreSongsOb.map do |songs|
              songsArray << songs.name 
            end 
            songsArray = songsArray.sort 
          end 
        end 
      end 
    end 
    
    songsArray.map do |songNames|
      genreSongsOb.map do |songs|
        if songs.name == songNames
          alphaSongsOb << songs 
        end
      end 
    end 
    
    alphaSongsOb.map do |songs|
      songName = songs.name 
      songArtistOb = songs.artist
      songArtist = songArtistOb.name 
      info = "#{songArtist} - #{songName}"
      genreSongs << info 
    end 
    
    #alphaGenreSongs = genreSongs.sort
    genreSongs.each do |song|
      puts "#{count}. #{song}"
      count += 1
    end 
  end 
  
  def alpha_songs 
    count = 1
    songName = []
    finalSongArray = []
    songObArray = Song.all 
    
    songObArray.map do |songInstance|
      songName << songInstance.name 
    end 
    songName = songName.sort
    
    songName.map do |name|
      songObArray.map do |songInstance|
        if name == songInstance.name 
          songName = songInstance.name 
          songArtistOb = songInstance.artist
          songArtist = songArtistOb.name
          songGenreOb = songInstance.genre 
          songGenre = songGenreOb.name
          songInfo = "#{songArtist} - #{songName} - #{songGenre}"
          finalSongArray << songInfo
        end 
      end 
    end 
    finalSongArray
  end 
  
  def play_song
    
    puts "Which song number would you like to play?"
    #list_songs
    x = gets.chomp
    x = x.to_i
    
    if x > 0 && x < 6 
      chosen = alpha_songs
      #alpha_songs
      chosen = chosen[x - 1]
      # chosen = @finalSongArray[x]
       chosen = chosen.split(" - ")
       artist = chosen[0]
       song = chosen[1]
      puts "Playing #{song} by #{artist}"
    end 
    
  end 
end 