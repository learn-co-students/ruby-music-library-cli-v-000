class MusicLibraryController

  def initialize(path='./db/mp3s')
   MusicImporter.new(path).import
  end

  def list_songs
    array = Song.all.sort_by {|song| song.name}
    array.each.with_index(1) do |song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    array = Artist.all.sort_by {|artist| artist.name}
    array.each.with_index(1) do |artist, index| puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    array = Genre.all.sort_by {|genre| genre.name}
    array.each.with_index(1) do |genre, index| puts "#{index}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    name = gets.chomp
    if Artist.find_by_name(name) !=nil
      artist = Artist.find_by_name(name)
      array = artist.songs.sort_by {|song| song.name}
      array.each.with_index(1) do |song, index| puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    name = gets.chomp
    if Genre.find_by_name(name) !=nil
      genre = Genre.find_by_name(name)
      array = genre.songs.sort_by {|song| song.name}
      array.each.with_index(1) do |song, index| puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    number = gets.chomp.to_i
    array = Song.all.sort_by {|song| song.name}
    if number>0 && number<=array.size
      puts "Playing #{array[number-1].name} by #{array[number-1].artist.name}"
      end
  end

  def call
  input = ""
  while input != "exit"
   puts "Welcome to your music library!"
   puts "To list all of your songs, enter 'list songs'."
   puts "To list all of the artists in your library, enter 'list artists'."
   puts "To list all of the genres in your library, enter 'list genres'."
   puts "To list all of the songs by a particular artist, enter 'list artist'."
   puts "To list all of the songs of a particular genre, enter 'list genre'."
   puts "To play a song, enter 'play song'."
   puts "To quit, type 'exit'."
   puts "What would you like to do?"
   input = gets.chomp

   case input
     when "list songs"
       self.list_songs
     when "list artists"
       self.list_artists
     when "list genres"
       self.list_genres
     when "list artist"
       self.list_songs_by_artist
     when "list genre"
       self.list_songs_by_genre
     when "play song"
       self.play_song
     end
  end
end
end
