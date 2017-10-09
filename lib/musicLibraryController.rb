class MusicLibraryController

#  attr_accessor :patfh

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    user_input = ""
    until user_input == "exit" do
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
    end
  end

  def list_songs
    new_array = Song.all.sort_by { |obj| obj.name }
    i = 1
    new_array.each do |s|
        puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      i += 1
    end
  end

  def list_artists
    new_array = Artist.all.sort_by { |obj| obj.name }
    i = 1
    new_array.each do |a|
        puts "#{i}. #{a.name}"
      i += 1
    end
  end

  def list_genres
    new_array = Genre.all.sort_by { |obj| obj.name }
    i = 1
    new_array.each do |a|
        puts "#{i}. #{a.name}"
      i += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if Artist.all.detect { |a| a.name = input }
      artist_obj = Artist.all.detect { |a| a.name = input }
      new_array = artist_obj.songs.sort_by { |obj| obj.name }
      i = 1
      new_array.each do |s|
        puts "#{i}. #{s.name} - #{s.genre.name}"
        i += 1
      end
    end
  end

end
