class MusicLibraryController

  @@all = []

  def initialize(path="./db/mp3s")
    #@path=path
    MusicImporter.new(path).import
    #@list = []
    #@list << music_importer.import
    #binding.pry
    #@list.each do  |song|
      #@@all << song unless @@all.detect {|songs| songs == list}
      #binding.pry
    #end

  end

  def call
    music_choice = ""
    until music_choice == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      music_choice = gets.strip.downcase
      case music_choice
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end

    end
  end

  def list_songs

    counter = 0
    testhash = {}
    testhash = Song.all.sort {|a,b| a.name <=> b.name}
    testhash.each do |s|
      counter+=1
      puts "#{counter}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    counter = 0
    testhash = {}
    testhash = Artist.all.sort {|a,b| a.name <=> b.name}
    testhash.each do |s|
      counter+=1
      puts "#{counter}. #{s.name}" #{} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_genres
    counter = 0
    testhash = {}
    testhash = Genre.all.sort {|a,b| a.name <=> b.name}
    testhash.each do |s|
      counter+=1
      puts "#{counter}. #{s.name}" #{} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_songs_by_artist

    puts "Please enter the name of an artist:"
    artist_name = gets.strip

    if artist_to_be_named = Artist.find_by_name(artist_name)
      artist_to_be_named.songs.sort{|a,b| a.name <=> b.name }.each.with_index(1) do |s, c|
        #counter+=1
        puts "#{c}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_pick = gets.strip
    if genre_to_be_named = Genre.find_by_name(genre_pick)
      genre_to_be_named.songs.sort{|a,b| a.name <=> b.name }.each.with_index(1) do |s, c|
        #counter+=1
        puts "#{c}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i


    if (song_number > 0 && song_number <= Song.all.length)
      #song_number -= 1
      song = Song.all.sort{ |a, b| a.name <=> b.name }[song_number-1]
      #binding.pry
    end

    puts "Playing #{song.name} by #{song.artist.name}" if song
  end


end

=begin
#binding.pry
artist_to_be_named.songs.each do |s|

if artist = Artist.find_by_name(artist_name)
  artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
    puts "#{i}. #{s.name} - #{s.genre.name}"
  end
end
=end
