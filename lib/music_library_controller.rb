class MusicLibraryController
  
  attr_accessor :files
  
  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    @files = importer.import
  end
  
  def call
    input = nil
    while input != 'exit' do
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
    if input == "list songs"
      self.list_songs
    elsif input == "list artists"
      self.list_artists
    elsif input == "list genres"
      self.list_genres
    elsif input == "list artist"
      self.list_songs_by_artist
    elsif input == "list genre"
      self.list_songs_by_genre
    elsif input == "play song"
      self.play_song
    end
    end
  end
    
  def remove_mp3(files)
    @files.collect do |file|
      file.slice!('.mp3')
      file
    end
  end
  
  def list_songs
    i = 1
    songs = []
    list = remove_mp3(@files)
    list.each do |string| 
    parts = string.split(/\ - /)
    song = parts[1]
    songs << song
    end
    sorted_songs = songs.sort
    sorted_songs.each do |title|
      list.each do |string|
        if string.include?(title)
        puts "#{i}. #{string}"
        i += 1
        end
      end
    end
  end
  
  def list_artists
    i = 1
    artists = []
    Artist.all.each do |instance|
      if !artists.include?(instance.name)
      artists << instance.name
      end
    end
    list = remove_mp3(@files)
    list.each do |string| 
    parts = string.split(/\ - /)
    artist = parts[0]
    if !artists.include?(artist)
    artists << artist
    end
    
    end
    sorted_artists = artists.sort
      sorted_artists.each do |title|
      puts "#{i}. #{title}"
      i += 1
    end
  end
  
  def list_genres
    i = 1
    genres = []
    list = remove_mp3(@files)
    list.each do |string| 
    parts = string.split(/\ - /)
    genre = parts[2]
      if !genres.include?(genre)
      genres << genre
      end
    end
    genres.sort.each do |title|
    puts "#{i}. #{title}"
    i += 1
    end
  end
  
  def list_songs_by_artist
    i = 1
    input = nil
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_by_name(input)
    if artist != nil
    names = artist.songs.collect do |song|
      song.name
    end
    names.sort.each do |title|
      artist.songs.each do |instance|
        if instance.name.include?(title)
        puts "#{i}. #{instance.name} - #{instance.genre.name}"
        i += 1
        end
        end
      end
    end
  end
  
  def list_songs_by_genre
    i = 1
    input = nil
    names = []
    posted = []
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre = Genre.find_by_name(input)
    if genre != nil
    genre.songs.each do |song|
      if !names.include?(song.name)
      names << song.name
      end
      end
    names.sort.each do |title|
      genre.songs.each do |instance|
        if instance.name.include?(title)
          if !posted.include?(instance.name)
          puts "#{i}. #{instance.artist.name} - #{instance.name}"
          i += 1
          posted << instance.name
          end
        end
        end
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    songs = []
    list = remove_mp3(@files)
    list.each do |string| 
    parts = string.split(/\ - /)
    song = parts[1]
    songs << song
    end
    sorted_songs = songs.sort
    play = Song.find_by_name(sorted_songs[input-1])
    if play != nil && input.between?(1, sorted_songs.size)
    puts "Playing #{play.name} by #{play.artist.name}"
    end
  end
end