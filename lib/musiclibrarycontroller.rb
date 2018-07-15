class MusicLibraryController

  attr_accessor :answer, :path, :library

  def initialize(path = "./db/mp3s")
      self.path = path
      self.library = MusicImporter.new(path)
      self.library.import
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

    @answer = gets.gsub(" ", "-")

    while @answer != 'exit'
#    self.send(@answer)
    puts "What would you like to do?"
    @answer = gets.gsub(" ", "-")
    end

  end

  def list_songs
    # Song.all.sort_by{|song| song.name}.each_with_index do |song, i|
    #   puts "#{i+1}. #{song.name}"
    # end
    Song.all.sort_by{|song| song.name}.each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by{|artist| artist.name}.each_with_index do |artist, i|
      puts "#{i+1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by{|genre| genre.name}.each_with_index do |genre, i|
      puts "#{i+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    if Artist.find_by_name(artist_name)
      Artist.find_by_name(artist_name).songs.sort_by{|song| song.name}.each_with_index do |song, i|
        puts "#{i+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre
    artist_name = gets.strip
    a = Artist.find_by_name(artist_name)
    a.songs
  end
end
