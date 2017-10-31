class MusicLibraryController

  attr_accessor :artist, :genre, :path

  def initialize(path = "./db/mp3s")
      MusicImporter.new(path).import
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

        case input
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
    #counter = 1
    #sort = []
    #@importer.files.collect do |song|
    #  info = song.split(" - ")
    #  genre = info[2].split(".")
    #  info.pop()
    #  genre.pop()
    #  genre_s = genre.join()
    #  info << genre_s
    #  sort << info
    #end
    #sorted = sort.sort_by do |array|
    #  array[1]
    #end
    #sorted_final = sorted.collect do |array|
    #  array.join(" - ")
    #end
    #sorted_final.each do |song|
    #  puts "#{counter}. #{song}"
    #  counter += 1
    #end
    Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    #artists = []
    #counter = 1
    #all_songs = Artist.all
    #all_songs.each do |song|
    #  artists << song.name
    #end
    #artists_sorted = artists.sort()
    #artists_sorted.each do |artist|
    #  puts "#{counter}. #{artist}"
    #  counter += 1
    #end
    Artist.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |a, i|
      puts "#{i}. #{a.name}"
    end
  end

  def list_genres
    #genres = []
    #counter = 1
    #genre_list = Genre.all
    #genre_list.each do |genre|
    #  genres << genre.name
    #end
    #genres_sorted = genres.sort()
    #genres_sorted.each do |genre|
    #  puts "#{counter}. #{genre}"
    #  counter += 1
    #end
    Genre.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |g, i|
      puts "#{i}. #{g.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if artist = Artist.find_by_name(input)
      artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      genre.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.artist.name} - #{s.name}"
      end
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
