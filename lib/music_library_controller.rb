require 'pry'
class MusicLibraryController
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    @path = path
    # binding.pry
    new_importer = MusicImporter.new(@path)
    new_importer.import
    new_importer
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the genres in your library, enter 'list genres'."
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
    list = self.create_song_list
    list.each {|song| puts song}
  end

  def create_song_list
    list = []
    sorted = Song.all.sort_by {|song| song.name}.uniq
    sorted.each_with_index do|song, i|
      list << "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    list
  end

  def list_artists
    sorted = Artist.all.sort_by {|artist| artist.name}.uniq
    sorted.each_with_index {|artist, i| puts "#{i + 1}. #{artist.name}"}
  end

  def list_genres
    sorted = Genre.all.sort_by {|genre| genre.name}.uniq
    sorted.each_with_index {|genre, i| puts "#{i + 1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    this_artist = Artist.find_by_name(artist_name)
    unless this_artist == nil
      sorted_songs = this_artist.songs.sort_by {|song| song.name}.uniq
      sorted_songs.each_with_index {|song, i| puts "#{i + 1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    this_genre = Genre.find_by_name(genre_name)
    unless this_genre == nil
      sorted_songs = this_genre.songs.sort_by {|song| song.name}.uniq
      sorted_songs.each_with_index {|song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i
    request = self.create_song_list[song_number - 1]
    unless request == nil || song_number > self.create_song_list.size || song_number < 1
      split_list = request.gsub(/[0-9]\.\s/, "").split(" - ")
      puts "Playing #{split_list[1]} by #{split_list[0]}"
    end
  end
end
