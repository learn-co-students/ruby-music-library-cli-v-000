class MusicLibraryController
  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"

    input = ""
    while input != "exit"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.chomp

      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      end
    end
  end

  def list_songs
    Song.all.sort_by {|song|song.name}.each_with_index do |s,i|
      puts "#{i+=1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by {|artist| artist.name}.each_with_index do |a,i|
      puts "#{i+=1}. #{a.name}"
    end
  end

  def list_genres
    Genre.all.sort_by {|genre| genre.name}.each_with_index do |g,i|
      puts "#{i+=1}. #{g.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    i = 0
    Song.all.sort_by {|song| song.name}.each do |s|
      if s.artist.name == input
        puts "#{i+=1}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    i = 0
    Song.all.sort_by {|song| song.name}.each do |s|
      if s.genre.name == input
        puts "#{i+=1}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    if input.between?(1, Song.all.size)
      song = Song.all.sort_by {|song|song.name}[input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
