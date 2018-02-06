class MusicLibraryController

  def initialize(path = "./db/mp3s")
    object = MusicImporter.new(path)
    object.import
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

    input = gets.strip until input == exit

  end

  def list_songs
    Song.all.sort {|a, b| a.name <=> b.name}.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    Artist.all.sort {|a, b| a.name <=> b.name}.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}" }
  end

  def list_genres
    Genre.all.sort {|a, b| a.name <=> b.name}.each_with_index{|g, i| puts "#{i + 1}. #{g.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input_artist = gets.strip
    if Artist.all.collect{|artist| artist.name}.include?(input_artist)
      Artist.all.find{|artist| artist.name == input_artist}.songs.sort {|a, b| a.name <=> b.name}.each_with_index{|s, i| puts "#{i + 1}. #{s.name} - #{s.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      genre.songs.sort{|a, b| a.name <=> b.name}.each_with_index{|s, i| puts "#{i + 1}. #{s.artist.name} - #{s.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input >= 1 && input <= Song.all.length
    song = Song.all.sort {|a, b| a.name <=> b.name}[input - 1]
    puts "Playing #{song.name} by #{song.artist.name}"
  else nil
  end
  end

end
