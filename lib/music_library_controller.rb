
class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    (MusicImporter.new(path)).import
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
    send_value = input.split(" ").join("_")
    if self.respond_to?(send_value) && ( input.include?("list") || input.include?("play"))
      self.send(send_value)
    elsif input == "list artist"
      list_songs_by_artist
    elsif input == "list genre"
      list_songs_by_genre
    else call unless input == "exit"
      end
  end

  def list_songs
    counter = 1
    sorted_songs = Song.all.sort_by {|i| i.name}
    while counter <= Song.all.size
      sorted_songs.each {|i| puts "#{counter}. #{i.artist.name} - #{i.name} - #{i.genre.name}"; counter += 1}
    end
  end

  def list_artists
    counter = 1
    sorted_artists = Artist.all.sort_by {|i| i.name}
    while counter <= Artist.all.size
      sorted_artists.each {|i| puts "#{counter}. #{i.name}"; counter += 1}
    end
  end

  def list_genres
    counter = 1
    sorted_genres = Genre.all.sort_by {|i| i.name}
    while counter <= Genre.all.size
      sorted_genres.each {|i| puts "#{counter}. #{i.name}"; counter += 1}
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    counter = 1
    artist_songs = (Song.all.select {|i| i if i.artist.name.upcase == input.upcase}).sort_by {|i| i.name}
    while counter <= artist_songs.size
      artist_songs.each {|i| puts "#{counter}. #{i.name} - #{i.genre.name}"; counter += 1}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    counter = 1
    genre_songs = (Song.all.select {|i| i if i.genre.name.upcase == input.upcase}).sort_by {|i| i.name}
    while counter <= genre_songs.size
      genre_songs.each {|i| puts "#{counter}. #{i.artist.name} - #{i.name}"; counter += 1}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    #list_songs
    input = gets.strip.to_i
    if (input >= 1 && input <= Song.all.size)
      play_list = Song.all.sort_by {|i| i.name }
      puts "Playing #{play_list[input-1].name} by #{play_list[input-1].artist.name}"
    end
  end


end
