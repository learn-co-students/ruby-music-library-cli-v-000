
class MusicLibraryController
  extend Concerns::Findable

  attr_accessor :import_time

  def initialize(path="./db/mp3s")
    @import_time = MusicImporter.new(path)
    @import_time.import
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


    command = ""
    until command == "exit"
      command = gets.chomp
      case command
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
    alpha = Song.all.sort_by! {|song| song.name}
    alpha.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    alpha = Artist.all.sort_by! {|artist| artist.name}
    alpha.each_with_index {|artist, index| puts "#{index+1}. #{artist.name}"}
  end

  def list_genres
    alpha = Genre.all.sort_by! {|genre| genre.name}
    alpha.each_with_index {|genre, index| puts "#{index+1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    specific_artist = gets.chomp
    if Artist.find_by_name(specific_artist) != nil
      sorted = Artist.find_by_name(specific_artist).songs.sort_by! {|song| song.name}
      sorted.each_with_index {|song, index| puts "#{index+1}. #{song.name} - #{song.genre.name}"}.sort_by! {|song| song.name}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    specific_genre = gets.chomp
    if Genre.find_by_name(specific_genre) != nil
      sorted = Genre.find_by_name(specific_genre).songs.sort_by! {|genre| genre.name}
      sorted.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song = gets.chomp.to_i
    alpha = Song.all.sort_by! {|song| song.name}
    total = alpha.length
    file_name = alpha[song - 1]
      if song.between?(1, total)
        puts "Playing #{file_name.name} by #{file_name.artist.name}"
      else
      end
  end
end
