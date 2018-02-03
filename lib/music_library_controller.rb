class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    object = MusicImporter.new(path)
    object.import
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
    if input != "exit"
      call
    else
    end
  end

  def list_songs
    Song.all.sort_by! {|song| song.name}.each_with_index do |song, position|
        puts "#{position+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end

  def list_artists
    Artist.all.sort_by! {|artist| artist.name}.each_with_index do |artist, position|
      puts "#{position+1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by! {|genre| genre.name}.each_with_index do |genre, position|
      puts "#{position+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
      input = gets.strip
      if artist = Artist.find_by_name(input)
        artist.songs.sort_by! {|song| song.name}.each_with_index do |s, position|
          puts "#{position+1}. #{s.name} - #{s.genre.name}"
        end
      end
    end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      genre.songs.sort_by! {|song| song.name}.each_with_index do |s, position|
        puts "#{position+1}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip_to_i

  end

end
