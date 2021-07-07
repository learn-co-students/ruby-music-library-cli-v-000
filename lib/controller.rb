class MusicLibraryController
  
  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end
  
  def call
    input = nil
    until input == "exit" do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets
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
    songs = []
    Song.all.each{|s| songs << [s.artist.name, s.name, s.genre.name]}
    songs.sort{|a,b| a[1] <=> b[1]}.each_with_index do |s, i|
      puts "#{i+1}. #{s[0]} - #{s[1]} - #{s[2]}"
    end
  end
  
  def list_artists
    artists = []
    Artist.all.each{|a| artists << a.name}
    artists.sort.each_with_index do |a, i|
      puts "#{i+1}. #{a}"
    end
  end
  
  def list_genres
    genres = []
    Genre.all.each{|g| genres << g.name}
    genres.sort.each_with_index do |g, i|
      puts "#{i+1}. #{g}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    songs =[]
    if Artist.find_by_name(input)
      Artist.find_by_name(input).songs.each{|s| songs << [s.name, s.genre.name]}
      songs.sort{|a,b| a[0] <=> b[0]}.each_with_index do |s, i|
        puts "#{i+1}. #{s[0]} - #{s[1]}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets
    songs =[]
    if Genre.find_by_name(input)
      Genre.find_by_name(input).songs.each{|s| songs << [s.artist.name, s.name]}
      songs.sort{|a,b| a[1] <=> b[1]}.each_with_index do |s, i|
        puts "#{i+1}. #{s[0]} - #{s[1]}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets
    songs = []
    Song.all.each{|s| songs << [s.artist.name, s.name, s.genre.name]}
    songs.sort!{|a,b| a[1] <=> b[1]}
    if input.to_i.between?(1, songs.count)
      puts "Playing #{songs[input.to_i-1][1]} by #{songs[input.to_i-1][0]}"
    end
  end
end