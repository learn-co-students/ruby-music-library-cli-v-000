class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
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
    if input == "exit"
    else
      call
    end
  end

  def list_songs
     Song.all.sort_by{|song| song.name}.each_with_index do |song, num|
       puts "#{num + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
  end

  def list_artists
    Artist.all.sort_by{|item| item.name}.each_with_index do |item, num|
        puts "#{num +1}. #{item.name}"
      end
    end

  def list_genres
    Genre.all.sort_by{|g| g.name}.each_with_index do |item, num|
      puts "#{num +1}. #{item.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"

    artist_name = gets.strip

     Artist.all.detect do |item|
       item.name == artist_name
    #  .sort_by{|n| n.name}.each_with_index do |item, num|
    #    puts "#{num}. #{item.name}"
      end
    end


end
