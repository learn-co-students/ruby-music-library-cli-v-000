class MusicLibraryController

  def initialize(path = "./db/mp3s")
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
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end
  end

  def list_songs
    Song.all.sort_by{|s| s.name}.each_with_index.collect do |x,i|
      puts "#{i + 1}. #{x.artist.name} - #{x.name} - #{x.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by{|a| a.name}.each_with_index.collect do |x,i|
       puts "#{i + 1}. #{x.name}"
     end
  end

  def list_genres
    Genre.all.sort_by{|g| g.name}.each_with_index.collect do |x,i|
      puts "#{i + 1}. #{x.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    Artist.all.each do |artist|
      if artist.name == input
        artist.songs.sort_by{|s| s.name}.each_with_index.collect do |x,i|
          puts "#{i + 1}. #{x.name} - #{x.genre.name}"
        end
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    Genre.all.each do |genre|
      if genre.name == input
        genre.songs.sort_by{|s| s.name}.each_with_index.collect do |x,i|
           puts "#{i + 1}. #{x.artist.name} - #{x.name}"
         end
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    Song.all.sort_by{|s| s.name}.each_with_index.collect do |x,i|
      if i + 1 == input.to_i
        puts "Playing #{x.name} by #{x.artist.name}"
      end
    end
  end
end
