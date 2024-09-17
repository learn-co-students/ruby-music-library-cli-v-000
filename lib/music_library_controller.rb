require 'pry'

class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
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
    answer = gets.strip
    if answer == "exit"
      nil
    else
      if answer == "list songs"
        list_songs
        # call
      elsif answer == "list artists"
        list_artists
        # call
      elsif answer == "list genres"
        list_genres
        # call
      elsif answer == "list artist"
        list_songs_by_artist
        # call
      elsif answer == "list genre"
        list_songs_by_genre
        # call
      elsif answer == "play song"
        play_song
        # call
      else
        call
      end
    end
  end

    def list_songs
      # binding.pry
      sortarry = []
      sortarry = Song.all.sort_by {|song| song.name}
      sortarry.each_with_index {|song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end

    def list_artists
      srtart = []
      srtart = Artist.all.sort_by {|artist| artist.name}
      srtart.each_with_index {|artist, i| puts "#{i + 1}. #{artist.name}"}
    end

    def list_genres
      sgenre = []
      sgenre = Genre.all.sort_by {|genre| genre.name}
      sgenre.each_with_index {|genre, i| puts "#{i + 1}. #{genre.name}"}
    end

    def list_songs_by_artist
      # binding.pry
      puts "Please enter the name of an artist:"
      name = gets.strip
       if artist = Artist.find_by_name(name)
         ssong = []
         ssong = artist.songs.sort_by {|song| song.name}
         ssong.each_with_index {|s, i| puts "#{i + 1}. #{s.name} - #{s.genre.name}"}
       end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      name = gets.strip
      if genre = Genre.find_by_name(name)
        sortg = []
        sortg = genre.songs.sort_by {|song| song.name}
        sortg.each_with_index {|s, i| puts "#{i +1}. #{s.artist.name} - #{s.name}"}
      end
    end

    def play_song
      sortarry = Song.all.sort_by {|song| song.name}
      puts "Which song number would you like to play?"
      number = gets.strip
      if number.to_i.between?(1, sortarry.length)
        puts "Playing #{sortarry[number.to_i.pred].name} by #{sortarry[number.to_i.pred].artist.name}"
      end
    end








end
