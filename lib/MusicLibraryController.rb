class MusicLibraryController
  attr_accessor :path


  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
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

    user_input = gets.chomp

    if user_input == 'list songs'
      list_songs
      call
    elsif user_input == 'list artists'
      list_artists
      call
    elsif user_input == 'list genres'
      list_genres
      call
    elsif user_input == 'list artist'
     list_songs_by_artist
     call
    elsif user_input == 'list genre'
     list_songs_by_genre
     call
   elsif user_input == 'play song'
     play_song
     call
   elsif user_input == 'exit'
     return
   else
     call
   end
  end

  def list_songs
    count = 1
    sorted_songs = Song.all.sort_by {|song| song.name}
    sorted_songs.each do |song|
      puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      count += 1
    end
  end

  def list_artists
    count = 1
    sorted_artists = Artist.all.sort_by {|artist| artist.name}
    sorted_artists.each do |artist|
      puts "#{count}. #{artist.name}"
      count += 1
    end
  end

 def list_genres
   count = 1
   sorted_genres = Genre.all.sort_by {|genre| genre.name}
   sorted_genres.each do |genre|
     puts "#{count}. #{genre.name}"
     count += 1
   end
 end

 def list_songs_by_artist
   puts "Please enter the name of an artist:"
   user_input = gets.chomp
   selected_artist = Artist.find_by_name(user_input)
   if selected_artist
     count = 1
     selected_artist.songs.sort_by{|song| song.name}.each do |song|
       puts "#{count}. #{song.name} - #{song.genre.name}"
       count += 1
     end
   end
 end

 def list_songs_by_genre
   puts "Please enter the name of a genre:"
   user_input = gets.chomp
   selected_genre = Genre.find_by_name(user_input)
   if selected_genre
     count = 1
     selected_genre.songs.sort_by{|song| song.name}.each do |song|
       puts "#{count}. #{song.artist.name} - #{song.name}"
       count += 1
     end
   end
 end

  def play_song
    sorted_songs = Song.all.sort_by{|song| song.name}
    puts "Which song number would you like to play?"
    song_number = gets.chomp.to_i
    if song_number.between?(1, Song.all.size)
      puts "Playing #{sorted_songs[song_number-1].name} by #{sorted_songs[song_number-1].artist.name}"
    end
  end

 end
