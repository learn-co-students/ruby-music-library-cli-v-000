#musiclibrarycontroller class
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    new_a = MusicImporter.new(path)
    new_a.import

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

    loop do
      input = gets.strip
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
      if input == "exit"
        break
      end
    end
  end

  def list_songs
    Song.all.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  # def list_artists
  #   artist_array = Song.all.sort{|a,b| a.artist.name <=> b.artist.name}.map {|s| s.artist.name}
  #   artist_array.uniq.each.with_index(1) do |a, i|
  #     puts "#{i}. #{a}"
  #   end
  # end

  def list_artists
   Artist.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |a, i|
     puts "#{i}. #{a.name}"
   end
 end

  def list_genres
    genre_array = Song.all.sort{|a,b| a.genre.name <=> b.genre.name}.map {|s|s.genre.name}
    genre_array.uniq.each.with_index(1) do |b,i|
      puts "#{i}. #{b}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.all.detect {|a| a.name == input}
    if artist != nil
      artist.songs.sort{|a,b| a.name <=> b.name}.each.with_index(1) do |s,i|
        puts "#{i}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre = Genre.all.detect {|a| a.name == input}
    if genre != nil
      genre.songs.sort{|a,b| a.name <=> b.name}.each.with_index(1) do |s,i|
        puts "#{i}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end

  end

end
