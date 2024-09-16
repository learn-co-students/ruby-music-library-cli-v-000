class MusicLibraryController
  attr_accessor :path
  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(self.path).import
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
    input = gets.strip
    until input == "exit" do
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
        else
            puts "Not a valid option."
      end
      puts "What would you like to do?"
      input = gets.strip
    end

  end
  #menu methods
  def list_songs
    Song.all.sort{|a,b|
      a.name <=> b.name}.each_with_index{|s,i|
        puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      }
  end
  def list_artists
    Artist.all.collect{|a|
      a.name}.uniq.sort.each_with_index{|s,i|
        puts "#{i+1}. #{s}"
      }
  end
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    name = gets.strip
    artist = Artist.find_by_name(name)
    if artist
      artist.songs.collect.sort{|a,b|
          a.name <=> b.name
        }.each_with_index{|n,i| puts "#{i+1}. #{n.name} - #{n.genre.name}"}
    end
  end
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    name = gets.strip
    genre = Genre.find_by_name(name)
    if genre
      genre.songs.collect.sort{|a,b|
          a.name <=> b.name
        }.each_with_index{|n,i| puts "#{i+1}. #{n.artist.name} - #{n.name}"}
    end
  end
  def list_genres
    Genre.all.collect{|a|
      a.name}.uniq.sort.each_with_index{|s,i|
        puts "#{i+1}. #{s}"
      }
  end
  def play_song
    #self.list_songs
    puts "Which song number would you like to play?"
    tn = gets.strip
    tn = tn.to_i - 1
    if tn >= 0 && tn < Song.all.size
      alphaSongs = Song.all.sort{|a,b| a.name <=> b.name}
      song = alphaSongs[tn]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
