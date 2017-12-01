require 'pry'
class MusicLibraryController

  extend Concerns::Findable

  def initialize(path = './db/mp3s')
      MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    response = ""
    while response != 'exit'
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      response = gets
      if response == 'list songs'
        list_songs
      elsif response == 'list artists'
        list_artists
      elsif response == 'list genres'
        list_genres
      elsif response == 'list artist'
        list_songs_by_artist
      elsif response == 'list genre'
        list_songs_by_genre
      elsif response == 'play song'
        play_song
      end
    end
  end

  def list_songs
    count = 1
    sorted = Song.all.sort_by {|obj| obj.name}
    sorted.each do |song|
      puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      count+=1
    end
  end

  def list_artists
    count = 1
    sorted = Artist.all.sort_by {|obj| obj.name}
    sorted.each do |artist|
      puts "#{count}. #{artist.name}"
      count+=1
    end
  end

  def list_genres
    count = 1
    sorted = Genre.all.sort_by {|obj| obj.name}
    sorted.each do |genre|
      puts "#{count}. #{genre.name}"
      count+=1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    response = gets
    artist = Artist.find_by_name(response)
    count = 1
    unless artist == nil
      sorted = artist.songs.sort_by {|obj| obj.name}
        sorted.each do |song|
        puts "#{count}. #{song.name} - #{song.genre.name}"
        count +=1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    response = gets
    genre = Genre.find_by_name(response)
    count = 1
    unless genre == nil
      sorted = genre.songs.sort_by {|obj| obj.name}
        sorted.each do |song|
        puts "#{count}. #{song.artist.name} - #{song.name}"
        count +=1
      end
    end

  def play_song
    puts "Which song number would you like to play?"
    response = gets
    number = response.to_i - 1
    sorted = Song.all.sort_by {|obj| obj.name}
      if number < sorted.length && number >= 1 && number.is_a?(Integer)
        puts "Playing #{sorted[number].name} by #{sorted[number].artist.name}"
      end
    end
  end
  
end


# rspec spec/010_music_library_controller_spec.rb
# rspec spec/011_music_library_cli_methods_spec.rb
# rspec spec/012_music_library_cli_spec.rb
