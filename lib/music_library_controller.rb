class MusicLibraryController
  attr_accessor :path

  def initialize(path= "./db/mp3s")
    @importer = MusicImporter.new(path)
    @importer.import
  end

  def list_songs
    song_array = @importer.import
    song_array.each_with_index {|song, index| puts "#{index + 1}. #{song}"}
  end

  def list_artists
    Artist.all.each {|artist| puts artist.name}
  end

  def list_genres
    Genre.all.each {|genre| puts genre.name}
  end

  def play_song
    Song.all.each_with_index do |song, i|
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artist_song
    artist_name = gets.strip
    artist_songs = Song.all.select {|song| song.artist.name == artist_name}
    artist_songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_genre
    genre_name = gets.strip
    genre_songs = Song.all.select {|song| song.genre.name == genre_name}
    genre_songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name} "}
  end
  
   

 


  def call
    input = ""
    while input != "exit"               #responds to a call method to start the CLI
      puts "Welcome to Your Music Library!"   #asks the user for input at some point
      puts "What would you like to do?"       # loops and asks for user input until they type in exit
      input = gets.strip    #.strip will take the users input and remove whitespace before and after user input
      case input
       when "list songs"
          list_songs
        when "list artists"
          list_artists
        when "list genres"
          list_genres
        when "play song"
          play_song
        when "list artist"
          list_artist_song
        when "list genre"
          list_genre

        end
      end
    end
  end




        #when "....."
          #puts

    #   case input 
    
    #   when "list artists"
    #     artists
    #   when "list genres"
    #     genres
    #   when "list artist"
    #     list_artist
      
    # end
#   end



