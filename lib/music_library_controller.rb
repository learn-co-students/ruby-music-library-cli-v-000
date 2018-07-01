class MusicLibraryController
  attr_accessor :path
  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(@path).import
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
    input = ""
    until input == 'exit'
      input = gets.strip
      if input == 'list songs'
        list_songs
      elsif input == 'list artists'
        list_artists
      elsif input == 'list genres'
        list_genres
      elsif input == 'list artist'
        list_songs_by_artist
      elsif input == 'list genre'
        list_songs_by_genre
      elsif input == 'play song'
        play_song
      end
    end
  end
  def list_songs
    Song.all.sort {|x,y| x.name <=> y.name}.each_with_index {|item,i| puts "#{i+1}. #{item.artist.name} - #{item.name} - #{item.genre.name}"}
  end
  def list_artists
    Artist.all.sort {|x,y| x.name <=> y.name}.each_with_index {|item,i| puts "#{i+1}. #{item.name}"}
  end
  def list_genres
    Genre.all.sort {|x,y| x.name <=> y.name}.each_with_index {|item,i| puts "#{i+1}. #{item.name}"}
  end
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if artist = Artist.find_by_name(input)
      artist.songs.sort {|x,y| x.name <=> y.name}.each_with_index {|item,i| puts "#{i+1}. #{item.name} - #{item.genre.name}"}
    end
  end
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      genre.songs.sort {|x,y| x.name <=> y.name}.each_with_index {|item,i| puts "#{i+1}. #{item.artist.name} - #{item.name}"}
    end
  end
  def play_song
    puts "Which song number would you like to play?"
    #list_songs
    input = gets.strip.to_i
    if input > 0 && input < Song.all.length+1
      song = Song.all.sort {|x,y| x.name <=> y.name}[input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
