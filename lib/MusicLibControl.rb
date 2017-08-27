class MusicLibraryController

  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
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
      input = gets.strip

          case input
          when 'list songs'
            list_songs
          when 'list artists'
            list_artists
          when 'list genres'
            list_genres
          when 'list artist'
            list_songs_by_artist
          when 'list genre'
            list_songs_by_genre
          when 'play song'
            play_song
          end
        end
      end

  def list_songs
    sorted = Song.all.sort! {|a,b| a.name <=> b.name}
    sorted.each_with_index {|song,index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    sorted = Artist.all.sort! {|a,b| a.name <=> b.name}
    sorted.each_with_index {|artist,index| puts "#{index+1}. #{artist.name}"}
  end

  def list_genres
    sorted = Genre.all.sort! {|a,b| a.name <=> b.name}
    sorted.each_with_index {|genre,index| puts "#{index+1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
      if input = Artist.find_by_name(input)
        sorted = input.songs.sort! {|a,b| a.name <=> b.name}
        sorted.each_with_index {|song,index| puts "#{index+1}. #{song.name} - #{song.genre.name}"}
      end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
      if input = Genre.find_by_name(input)
        sorted = input.songs.sort! {|a,b| a.name <=> b.name}
        sorted.each_with_index {|song,index| puts "#{index+1}. #{song.artist.name} - #{song.name}"}
      end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input >= 1 && input <= Song.all.length
      sorted = Song.all.sort! {|a,b| a.name <=> b.name}.fetch(input -1)
      puts "Playing #{sorted.name} by #{sorted.artist.name}"
    end
  end
end
