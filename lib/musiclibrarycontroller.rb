require 'pry'

class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path).import
    # importer.import
  end

  def call
    input = ""
    while input != "exit"
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
        if input == 'list songs'
          list_songs
        elsif input == 'list artists'
          list_artists
        elsif input == 'list genres'
          list_genres
        elsif input == 'list artist'
          list_songs_by_artist
        elsif input == 'list genre'
          list_songs_by_genre
        elsif input == 'play song'
          play_song
        end

      end

    end


    def list_songs
        arr = Song.all.sort_by{|song| song.name}
        arr.each_with_index do |song, idx|
          puts "#{idx + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        arr = Artist.all.sort_by{|artist| artist.name}.uniq
        arr.uniq.each_with_index do |artist, idx|
          puts "#{idx + 1}. #{artist.name}"
        end
    end

    def list_genres
        arr = Genre.all.sort_by{|genre| genre.name}.uniq
        arr.uniq.each_with_index do |genre, idx|
          puts "#{idx + 1}. #{genre.name}"
        end
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      input = gets.strip

      artistcollection = Song.all.select{|song| song if song.artist.name == input}
      sorted_songs = artistcollection.sort_by {|song| song.name}

      sorted_songs.each_with_index do |song, index|
        puts  "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      input = gets.strip

      genrecollection = Song.all.select{|song| song if song.genre.name == input}
      sorted_songs = genrecollection.sort_by {|song| song.name}

      sorted_songs.each_with_index do |song, index|
        puts  "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end

    def play_song
      puts "Which song number would you like to play?"
      input = gets.strip
      index = input.to_i - 1

      if (1..Song.all.length).include?(index)
        song = Song.all.sort_by{|song| song.name}[index]
      end
      # arr = Song.all.sort_by{|song| song.name}
      if song!=nil
        puts "Playing #{song.name} by #{song.artist.name}"
      end


      #
      # if (1..arr.length).include?(index)
      #   puts "Playing #{arr[index].name} by #{arr[index].artist.name}"
      # # else
      # #   puts nil
      # end

    end


end
