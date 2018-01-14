require 'pry'

class MusicLibraryController
attr_reader :path

  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(@path).import
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
    choice = gets.chomp

    if choice != 'exit'
      case choice
        when 'list songs'
          self.list_songs
        when 'list artists'
          self.list_artists
        when 'list genres'
          self.list_genres
        when 'list artist'
          self.list_songs_by_artist
        when 'list genre'
          self.list_songs_by_genre
        when 'play song'
          self.play_song
        else
          self.call
        end
    end
  end

  def list_songs
    x = Song.all.sort_by { |i| i.name }.uniq
    # binding.pry
    x.each_with_index do |el, i|
      puts "#{i + 1}. #{el.artist.name} - #{el.name} - #{el.genre.name}"
    end
  end

  def list_artists
    x = Artist.all.sort_by { |i| i.name }
    x.each_with_index do |el, i|
      # binding.pry
      puts "#{i + 1}. #{el.name}"
    end
  end

  def list_genres
    x = Genre.all.sort_by { |i| i.name }
    x.each_with_index do |el, i|
      # binding.pry
      puts "#{i + 1}. #{el.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.chomp
    x = Artist.find_by_name(artist)
    if x != nil
      x.songs.sort_by {|el| el.name}.each_with_index do |el, i|
        puts "#{i + 1}. #{el.name} - #{el.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.chomp
    x = Genre.find_by_name(genre)
    if x != nil
      y = x.songs.sort_by {|el| el.name}.each_with_index do |el, i|
        # binding.pry
        puts "#{i + 1}. #{el.artist.name} - #{el.name}"
      end
    end
  end

  def play_song
    # self.list_songs
    puts "Which song number would you like to play?"
    song_number = gets.chomp.to_i
    if song_number > 0
        # binding.pry
        x = Song.all.sort_by { |i| i.name }.uniq
        # binding.pry
        x.each_with_index do |el, i|
          if i + 1 == song_number
            puts "Playing #{el.name} by #{el.artist.name}"
          end
        end
    end

  end
end
