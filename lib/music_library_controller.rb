class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    user_input = ""
    until user_input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_input = gets.chomp

      case user_input
      when "list_songs"
        list songs

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
    song = Song.all.sort {|a,b| a.name <=> b.name}.uniq
    song.each_with_index do |s, i|
      puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    artist = Artist.all.sort {|a,b| a.name <=> b.name}.uniq
    artist.each_with_index do |a, i|
      puts "#{i+1}. #{a.name}"
    end
  end

  def list_genres
    genre = Genre.all.sort {|a,b| a.name <=> b.name}.uniq
    genre.each_with_index do |g, i|
      puts "#{i+1}. #{g.name}"
    end
  end

end
