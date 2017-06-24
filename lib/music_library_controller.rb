require 'pry'

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
    user_input = gets.chomp

      while user_input != 'exit'
        if user_input == "list songs"
          list_songs
        elsif user_input == "list artists"
          list_artists
        elsif user_input == "list genres"
          list_genres
        elsif user_input == "list artist"
          list_songs_by_artist
        elsif user_input == "list genre"
          list_songs_by_genre
        elsif user_input == "play song"
          play_song
        end
        puts "What would you like to do?"
        user_input = gets.chomp
      end
      if user_input == 'exit'
      end
  end

  def list_songs
    counter = 1
    sorted = Song.all.sort_by {|song| song.name}
      sorted.each do |object|
        puts "#{counter}. #{object.artist.name} - #{object.name} - #{object.genre.name}"
       counter += 1
      end
  end

  def list_artists
    counter = 1
    artists = []
    sorted = Artist.all.sort_by {|artist| artist.name}
      sorted.each do |object|
        artists << object.name
      end
      artists.uniq.each do |artist|
        puts "#{counter}. #{artist}"
      counter += 1
      end
  end

  def list_genres
    counter = 1
    genres = []
    sorted = Genre.all.sort_by {|genre| genre.name}
      sorted.each do |object|
        genres << object.name
      end
      genres.uniq.each do |genre|
        puts "#{counter}. #{genre}"
      counter += 1
      end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    req_artist = gets.chomp
    all_artists = []
    temp = []
    list = []
    counter = 1

    Artist.all.each do |art_obj|
      all_artists << art_obj.name
    end

    if all_artists.include?(req_artist)
      Song.all.each do |song|
        if song.artist.name == req_artist
          temp << song
        end
      end
      temp_sorted = temp.sort_by {|obj| obj.name}
        temp_sorted.each do |item|
          puts "#{counter}. #{item.name} - #{item.genre.name}"
          counter += 1
        end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    req_genre = gets.chomp
    all_genres = []
    temp = []
    list = []
    counter = 1

    Genre.all.each do |gen_obj|
      all_genres << gen_obj.name
    end

    if all_genres.include?(req_genre)
      Song.all.each do |song|
        if song.genre.name == req_genre
          temp << song
        end
      end
      temp_sorted = temp.sort_by {|obj| obj.name}
        temp_sorted.each do |item|
          puts "#{counter}. #{item.artist.name} - #{item.name}"
          counter += 1
        end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    usr_choice = gets.chomp.to_i
    play_container = []

    if usr_choice !=0 && usr_choice < Song.all.count
      sorted = Song.all.sort_by {|song| song.name}
        sorted.each do |object|
          play_container << "#{object.name} by #{object.artist.name}"
        end
        song_choice = play_container[usr_choice-1]
          puts "Playing #{song_choice}"
    end
  end

end
