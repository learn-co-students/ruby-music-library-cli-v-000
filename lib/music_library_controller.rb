class MusicLibraryController


 def initialize(path = './db/mp3s')
   object = MusicImporter.new(path)
   object.import
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

  command = nil
  until command == "exit" do
   command = gets
  end
 end

 def list_songs
   counter = 1
   songs = Song.all.sort_by do |song|
     song.name
   end
   songs.each do |song|
     puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
     counter += 1
   end
 end

 def list_artists
   counter = 1
   artists = Artist.all.sort_by do |artist|
     artist.name
   end
   artists.each do |artist|
     puts "#{counter}. #{artist.name}"
     counter += 1
   end
 end

 def list_genres
   counter = 1
   genres = Genre.all.sort_by do |genre|
     genre.name
   end
   genres.each do |genre|
     puts "#{counter}. #{genre.name}"
     counter += 1
   end
 end

 def list_songs_by_artist
  puts "Please enter the name of an artist:"
  artist_name = gets
  found_artist = Artist.all.find {|artist| artist.name == artist_name}
  if found_artist == nil
    # does nothing
  else
    found_artist.songs.sort! do |song1, song2|
      song1.name <=> song2.name
    end
    counter = 1
    found_artist.songs.each do |song|
      puts "#{counter}. #{song.name} - #{song.genre.name}"
      counter += 1
    end
   end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets

    genre_name = Genre.all.find {|genre| genre.name == genre_name}
    if genre_name == nil
      # does nothing
    else
      genre_name.songs.sort! do |song1, song2|
        song1.name <=> song2.name
      end
      counter = 1
      genre_name.songs.each do |song|
        puts "#{counter}. #{song.artist.name} - #{song.name}"
        counter += 1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.to_i
    biggest_number = Song.all.length
    if song_number > biggest_number || song_number <= 0

    else
      sorted_songs = Song.all.sort do |song1, song2|
                      song1.name <=> song2.name
                    end
      puts "Playing #{sorted_songs[song_number - 1].name} by #{sorted_songs[song_number - 1].artist.name}"
    end
  end

end # class end
