require "pry"

class MusicLibraryController

  def initialize(path = "./db/mp3s")
    imported_files = MusicImporter.new(path)
    imported_files.import
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
    case input.downcase
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list artist'
        list_songs_by_artist
      when 'list genres'
        list_genres
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      end
      self.call unless input.downcase == "exit"
    end



  def list_songs
    list_of_songs = []
    sorted_songs = Song.all.sort_by {|song| song.name}.uniq
    sorted_songs.each_with_index do |song, i|
      list_of_songs << "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
   list_of_songs.each {|song| puts song}
   list_of_songs
  end

  def list_artists
    list_of_artists = []
    sorted_artists = Artist.all.sort_by {|artist| artist.name}.uniq
    sorted_artists.each_with_index do |artist, i|
      list_of_artists << "#{i + 1}. #{artist.name}"
    end
    list_of_artists.each {|artist| puts artist}
    list_of_artists
  end

  def list_genres
    list_of_genres = []
    sorted_genres = Genre.all.sort_by {|genre| genre.name}.uniq
    sorted_genres.each_with_index do |genre, i|
      list_of_genres << "#{i + 1}. #{genre.name}"
    end
    list_of_genres.each {|genre| puts genre}
    list_of_genres
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    got_artist = Artist.find_by_name(input)
    unless got_artist == nil
      sorted = got_artist.songs.sort_by {|song| song.name}.uniq
      sorted.each_with_index {|song, i| puts "#{i + 1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    got_genre = Genre.find_by_name(input)
    unless got_genre == nil
      sorted = got_genre.songs.sort_by {|song| song.name}.uniq
      sorted.each_with_index {|song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name}"}
    end
  end

  #"Playing Larry Csonka by Action Bronson"

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    songs = Song.all.sort_by {|song| song.name}.uniq
    if input > 0 && input <= songs.count
      puts "Playing #{songs[input - 1].name} by #{songs[input - 1].artist.name}"
    end
  end


end
