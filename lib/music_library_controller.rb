class MusicLibraryController
  attr_accessor :song

  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
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

    call unless input == "exit"
  end

  def list_songs
    alphabetized = Song.all.sort_by do |song|
      song.name
    end
    list = alphabetized.collect do | song |
        "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    list.each_with_index { |string, index | puts "#{index+1}. #{string}" }
  end

  def list_artists
    list = Artist.all.collect do | artist |
        artist.name
      end
    list.sort.uniq.each_with_index { |string, index | puts "#{index+1}. #{string}" }
  end

  def list_genres
    list = Genre.all.collect do | genre |
        genre.name
      end
    list.sort.uniq.each_with_index { |string, index | puts "#{index+1}. #{string}" }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    list = Artist.all.sort_by do | artist |
        artist.name
      end
    list.uniq.each_with_index do | artist, index |
      if input == artist.name
      puts "#{index+1}. #{artist.name} - #{artist.songs.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    list = Genre.all.sort_by do | genre |
        genre.name
      end
    list.uniq.each_with_index do | genre, index |
      if input == genre.name
      puts "#{index+1}. #{genre.name} - #{genre.artist.name}"
      end
    end
  end

  # def list_songs_by_artist
  #   puts "Please enter the name of an artist:"
  #   input = gets.strip
  #   list = Song.all.sort_by do | song |
  #       song.artist.name
  #     end
  #   list.uniq.each_with_index do | song, index |
  #     if input == song.artist.name
  #     puts "#{index+1}. #{song.artist.name} - #{song.genre.name}"
  #     end
  #   end
  # end

  # def list_songs_by_artist
  #     puts "Please enter the name of an artist:"
  #     input = gets.chomp
  #     Song.all.sort_by do |song|
  #       song.name
  #     end.each_with_index do |song, index|
  #       if input == song.artist.name
  #         puts "#{index+1}. #{song.name} - #{song.genre.name}"
  #         end
  #       end
  #     end

end
