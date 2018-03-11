require 'pry'

class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end


  def call

    input = ""
    while input != 'exit'

    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

      input = gets.chomp

      case input
        when "list songs"
          list_songs
        when "list artists"
          list_artists
        when "list genres"
          list_genres
        when 'list artist'
          list_songs_by_artist
        when 'list genre'
          list_songs_by_genre
        when 'play song'
          play_song
        else
          'exit'
    end
  end
end


  def list_songs

    sorted_song = Song.all.sort_by { |song| song.name}

    sorted_song.each_with_index do |song, index|
      puts  "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"

    end
  end

  def list_artists

    sorted_artist = Artist.all.sort_by {|artist| artist.name }

    sorted_artist.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres

    sorted_genre = Genre.all.sort_by {|genre| genre.name}

    sorted_genre.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip


    artistcol = Song.all.select do |song|
      if song.artist.name == input
        song
      end
    end

    sorted_song = artistcol.sort_by { |song| song.name}

    sorted_song.each_with_index do |song, index|
      puts  "#{index+1}. #{song.name} - #{song.genre.name}"
  end
end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    genrecol = Song.all.select do |song|
          if song.genre.name == input
            song
          end
        end

        sorted_song = genrecol.sort_by { |song| song.name}

        sorted_song.each_with_index do |song, index|
          puts  "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end


    def play_song
       puts "Which song number would you like to play?"

       input = gets.strip.to_i
       if (1..Song.all.length).include?(input)
         song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
       end

       puts "Playing #{song.name} by #{song.artist.name}" if song
     end



end
