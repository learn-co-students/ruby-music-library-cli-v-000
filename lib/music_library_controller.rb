
class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    importer = MusicImporter.new(@path)
    importer.import
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
    input = ""
    while input != "exit"
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
      elsif input =="play song"
      self.play_song
      end

    end
end

def list_songs
  Song.all.sort_by!{|song| song.name}
  i = 1
  song_list = []
  Song.all.each do |song|
    sentence = "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    song_list << sentence
    i += 1
  end
  song_list.each {|song| puts song}
end

def list_artists
  list = []
  Artist.all.each{|artist| list << artist}
  list.sort_by!{|artist| artist.name}
  i = 1
  list.each do |artist|
    puts "#{i}. #{artist.name}"
    i += 1
  end
end

def list_genres
  list = []
  Genre.all.each{|genre| list << genre}
  list.sort_by!{|genre| genre.name}
  i = 1
  list.each do |genre|
    puts "#{i}. #{genre.name}"
    i += 1
  end
end

def list_songs_by_artist
  puts "Please enter the name of an artist:"
  input = gets.strip
  if !Artist.find_by_name(input)
    nil
  else
    artist = Artist.find_by_name(input)
    artist.songs.sort_by!{|song| song.name}
    i = 1
    artist.songs.each do |song|
      puts "#{i}. #{song.name} - #{song.genre.name}"
      i += 1
    end
  end
end

def list_songs_by_genre
  puts "Please enter the name of a genre:"
  input = gets.strip
  if !Genre.find_by_name(input)
    nil
  else
    genre = Genre.find_by_name(input)
    genre.songs.sort_by!{|song| song.name}
    i = 1
    genre.songs.each do |song|
      puts "#{i}. #{song.artist.name} - #{song.name}"
      i += 1
    end
  end
end

def play_song
  input = nil
    puts "Which song number would you like to play?"
    input = gets.strip
    index = input.to_i + -1
    if index.to_i > -1 && index.to_i < Song.all.length
    Song.all.sort_by!{|song| song.name[0]}
    song = Song.all[index]
    puts "Playing #{song.name} by #{song.artist.name}"
  else
    nil
  end
end


end
