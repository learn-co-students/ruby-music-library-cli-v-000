require("pry")
class MusicLibraryController
  attr_reader :mp3

  def initialize(path='./db/mp3s')
    @mp3 = MusicImporter.new(path)
    @mp3.import
    # binding.pry
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
      input = gets.chomp
      case input
      when 'list songs'
        self.list_songs
      when 'list artists'
        self.list_artists
      when 'list genres'
        self.list_genres
      when 'list artist'
        self.list_songs_by_artist
      when 'list genre'
        self.list_songs_by_genre
      when 'play song'
        self.play_song
      end
    end
  end

  def files
    @mp3.files
  end

  def list_songs
    counter = 0
    sorted = self.files.sort{|f1, f2| f1.split(" - ")[1] <=> f2.split(" - ")[1]}
    sorted.each do |song|
      puts "#{counter+=1}. #{song.chomp(".mp3")}"
    end
  end

  def list_artists
    counter = 0
    sorted = Artist.all.map{|artist| artist.name}
    sorted.sort!
    sorted.each do |artist|
      puts "#{counter+=1}. #{artist}"
    end
  end

  def list_genres
    counter = 0
    sorted = Genre.all.map{|genre| genre.name}
    sorted.sort!
    sorted.each do |genre|
      puts "#{counter+=1}. #{genre}"
    end
  end

  def list_songs_by_artist
    counter = 0
    puts "Please enter the name of an artist:"
    artist = gets.chomp
    artist = Artist.find_by_name(artist)
    # binding.pry
    if artist != nil
      artist.songs.sort!{|x,y| x.name <=> y.name}
      artist.songs.each do |song|
        puts "#{counter+=1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    counter = 0
    puts "Please enter the name of a genre:"
    genre = gets.chomp
    genre = Genre.find_by_name(genre)
    if genre != nil
      genre.songs.sort!{|x,y| x.name <=> y.name}
      genre.songs.each do |song|
        puts "#{counter+=1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    number = gets.to_i
    if number.between?(1,Song.all.size)
      sorted = self.files.sort{|f1, f2| f1.split(" - ")[1] <=> f2.split(" - ")[1]}
      puts "Playing #{sorted[number-1].split(" - ")[1]} by #{sorted[number-1].split(" - ")[0]}"
    end
  end
end
