class MusicLibraryController

  def initialize(path = './db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
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
    until input == "exit"
      puts "Welcome to your music library!"
      puts "What would you like to do?"
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      end
      input = gets.strip
    end
  end

  def list_songs
    Song.all.sort! {|a,b| a.name <=> b.name}
    Song.all.each_with_index do |s, index|
      puts "#{index+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by! {|a| a.name}
    Artist.all.each_with_index { |a, i| puts "#{i+1}. #{a.name}" }
  end

  def list_genres
    Genre.all.sort_by! {|g| g.name}
    Genre.all.each_with_index { |g, i| puts "#{i+1}. #{g.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    Artist.all.each do |artist|
      if artist.name == input
        artist.songs.sort_by! {|s| s.name}
        artist.songs.each_with_index do |s, i|
          puts "#{i+1}. #{s.name} - #{s.genre.name}"
        end
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    Genre.all.each do |genre|
      if genre.name == input
        genre.songs.sort_by! {|s| s.name}
        genre.songs.each_with_index do |s, i|
          puts "#{i+1}. #{s.artist.name} - #{s.name}"
        end
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    sorted = Song.all.sort_by! {|s| s.name}
    if input > 0 and input < sorted.size
      puts "Playing #{sorted[input-1].name} by #{sorted[input-1].artist.name}"
    end
  end

end
