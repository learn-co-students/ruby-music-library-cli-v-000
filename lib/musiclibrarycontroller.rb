class MusicLibraryController

  attr_accessor :path

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call

    loop do
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
      
      if input == 'exit'
        break
      elsif input == "list songs"
        self.list_songs
      elsif input == "list artists"
        self.list_artists
      elsif input == 'list genres'
        self.list_genres
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
    songs = Song.all

    songs.sort! do |a,b|
      a.name <=> b.name
    end

    new_songs = songs.collect do |instance|
      instance.artist.name + " - " + instance.name + " - " + instance.genre.name
    end
    new_songs.each_with_index do |item, index|
      puts "#{index+=1}. #{item}"
    end
  end

  def list_artists
    artists = Artist.all
    artists.sort {|a,b| a.name <=> b.name }.each_with_index do |item, index|
      puts "#{index+=1}. #{item.name}"
    end
  end

  def list_genres
    genres = Genre.all
    genres.sort {|a,b| a.name <=> b.name}.each_with_index do |item, index|
      puts "#{index+=1}. #{item.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if Artist.find_by_name(input) != nil
      Artist.find_by_name(input).songs.sort do |a,b|
        a.name <=> b.name
      end.each_with_index do |instance_of_song, index|
        puts "#{index+=1}. #{instance_of_song.name} - #{instance_of_song.genre.name}"
      end
    else
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if Genre.find_by_name(input) != nil
      Genre.find_by_name(input).songs.sort do |a,b|
        a.name <=> b.name
      end.each_with_index do |instance_of_song, index|
        puts "#{index+=1}. #{instance_of_song.artist.name} - #{instance_of_song.name}"
      end
    else
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    # self.list_songs
    input = gets.strip.to_i
    if input > 0 && input <= Song.all.length
      Song.all.sort! do |a,b|
        a.name <=> b.name
      end
      puts "Playing #{Song.all[input-=1].name} by #{Song.all[input].artist.name}"
    else
    end
  end

end
