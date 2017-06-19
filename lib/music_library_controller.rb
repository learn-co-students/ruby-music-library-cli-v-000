class MusicLibraryController
  def initialize(mp3_path = './db/mp3s')
    MusicImporter.new(mp3_path).import
  end
  
  def list_songs
    Song.all.sort_by{|s| s.name}.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
    
  end

  def list_artists
    Artist.all.sort_by{|a| a.name}.each.with_index(1) do |a, i|
      puts "#{i}. #{a.name}"
    end
  end

  def list_genres
    Genre.all.sort_by{|g| g.name}.each.with_index(1) do |g, i|
      puts "#{i}. #{g.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    if query = Artist.find_by_name(gets.strip)
      query.songs.sort_by{|s| s.name}.each.with_index(1) do |s, i|
        puts "#{i}. #{s.name} - #{s.genre.name}"
      end
    end   

  end

  def list_songs_by_genre 
    puts "Please enter the name of a genre:"
    if query = Genre.find_by_name(gets.strip)
      query.songs.sort_by{|s| s.name}.each.with_index(1) do |s, i|
        puts "#{i}. #{s.artist.name} - #{s.name}"
      end
    end

  end
  
  
  def play_song
    puts "Which song number would you like to play?"
    index = gets.strip.to_i - 1

    if index > -1 && Song.all[index]
      song = Song.all.sort_by{|s| s.name}[index]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
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

    input = ""

    while input != "exit"
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

end
