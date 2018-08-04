

class MusicLibraryController

  def initialize(path = './db/mp3s')
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
    loop do
      puts "What would you like to do?"
      i = gets
      if i == 'exit'
        break
      end
    end
  end

  def list_artists
    ary = Artist.all.sort_by {|artist| artist.name}
    i = 1
    ary.each do |artist|
      puts "#{i}. #{artist.name}"
      i += 1
    end
  end

  def list_genres
    ary = Genre.all.sort_by {|genre| genre.name}
    i = 1
    ary.each do |genre|
      puts "#{i}. #{genre.name}"
      i += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    i = gets
    artist = Artist.find_by_name(i)
    if artist
      j = 1
      artist.songs.sort_by {|song| song.name}.each do |song|
        puts "#{j}. #{song.name} - #{song.genre.name}"
        j += 1
      end
    else
      nil
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    i = gets
    genre = Genre.find_by_name(i)
    if genre
      j = 1
      genre.songs.sort_by {|song| song.name}.each do |song|
        puts "#{j}. #{song.artist.name} - #{song.name}"
        j += 1
      end
    else
      nil
    end
  end

  def list_songs
    sorted_songs = Song.all.sort_by {|song| song.name}
    i = 1
    sorted_songs.each do |song|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      i += 1
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    i = gets.to_i - 1
    sorted_songs = Song.all.sort_by {|song| song.name}
    if ((i + 1) <= sorted_songs.count) && ((i + 1) > 0)
      puts "Playing #{sorted_songs[i].name} by #{sorted_songs[i].artist.name}"
    end
  end

end
