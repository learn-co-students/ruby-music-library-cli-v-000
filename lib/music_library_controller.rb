class MusicLibraryController

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."

    puts "What would you like to do?"
    selection = gets.chomp

    if selection == 'list songs'
      list_songs
    elsif selection == 'list artists'
      list_artists
    elsif selection ==  'list genres'
      list_genres
    elsif selection ==  'list artist'
      list_songs_by_artist
    elsif selection == 'list genre'
      list_songs_by_genre
    elsif selection == 'play song'
      play_song
    elsif selection != "exit"
      call
    end 
  end 

  def sorted_by_name
    sorted_songs = Song.all.sort_by {|song| song.name}
  end

  def list_songs
    sorted_by_name.each_with_index do |song, idx|
      puts "#{idx+1}. #{song.full_name}"
    end 
  end 

  def list_artists
    sorted_artists = Artist.all.sort_by {|artist| artist.name}
    sorted_artists.each_with_index do |artist, idx|
      puts "#{idx+1}. #{artist.name}"
    end 
  end

  def list_genres
    sorted_genres = Genre.all.sort_by {|genre| genre.name}
    sorted_genres.each_with_index do |genre, idx|
      puts "#{idx+1}. #{genre.name}"
    end 
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
  
    # prints all songs by a particular artist in a numbered list (alphabetized by song name) (FAILED - 9)
    selected_artist = Artist.all.find {|artist| artist.name == artist_name}
    
    if selected_artist == nil 
      return "fuck this"
    else 
      sorted_songs = selected_artist.songs.sort_by {|song| song.name}
      sorted_songs.each_with_index do |song, idx|
        puts "#{idx+1}. #{song.name} - #{song.genre.name}"
      end 
    end 
  end 

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.chomp
  
    selected_genre = Genre.all.find {|genre| genre.name == genre_name}
    
    if selected_genre == nil 
      return "fuck this"
    else 
      sorted_songs = selected_genre.songs.sort_by {|song| song.name}
      sorted_songs.each_with_index do |song, idx|
        puts "#{idx+1}. #{song.artist.name} - #{song.name}"
      end 
    end 
  end 

  def play_song
    sorted_songs = sorted_by_name

    puts "Which song number would you like to play?"
    song_choice = gets.chomp.to_i

    if song_choice >= 1 && song_choice <= sorted_songs.length
      puts "Playing #{sorted_songs[song_choice-1].name} by #{sorted_songs[song_choice-1].artist.name}"
    else
      return "fuck everything"
    end 
  end 
end 
