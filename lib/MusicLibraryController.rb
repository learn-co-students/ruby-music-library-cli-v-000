class MusicLibraryController
  attr_accessor :path, :songs

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(@path).import
  end

  def valid?(input)
    commands = ['list songs', 'list artists', 'list genres', 'list artist', 'list genre', 'play song']
    commands.include?(input)
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
    input = gets.chomp
    unless input == 'exit'
      if valid?(input)
        input = input.gsub(' ', '_')
        self.send(input)
        self.call
      else
        self.call
      end
    end
  end

  def list_songs
    count = 1
    res = Song.all.sort_by {|song| song.name}
    res.each do |song|
      puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      count += 1
    end
  end

  def list_artists
    count = 1
    res = Artist.all.sort_by {|artist| artist.name}
    res.each do |artist|
      puts "#{count}. #{artist.name}"
      count += 1
    end
  end

  def list_genres
    count = 1
    res = Genre.all.sort_by {|genre| genre.name}
    res.each do |genre|
      puts "#{count}. #{genre.name}"
      count += 1
    end
  end

  def list_songs_by_artist
    count = 1
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if Artist.all.detect {|artist| input == artist.name}
      artist_obj = Artist.all.detect {|artist| input == artist.name}
      sorted = artist_obj.songs.sort_by {|song| song.name}
      sorted.each do |song|
        puts "#{count}. #{song.name} - #{song.genre.name}"
        count += 1
      end
    end
  end

  def list_artist
    self.list_songs_by_artist
  end

  def list_songs_by_genre
    count = 1
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if Genre.all.detect {|genre| input == genre.name}
      genre_obj = Genre.all.detect {|genre| input == genre.name}
      sorted = genre_obj.songs.sort_by {|song| song.name}
      sorted.each do |song|
        puts "#{count}. #{song.artist.name} - #{song.name}"
        count += 1
      end
    end
  end

  def list_genre
    self.list_songs_by_genre
  end

  def play_song
   puts "Which song number would you like to play?"
   sorted = Song.all.sort_by {|song| song.name}
   input = gets.to_i
   input -= 1
   if input >= 0 && input <= sorted.length - 1
     puts "Playing #{sorted[input].name} by #{sorted[input].artist.name}"
   end
 end

end
