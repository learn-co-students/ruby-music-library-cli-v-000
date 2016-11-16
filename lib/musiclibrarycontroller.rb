class MusicLibraryController

  attr_reader :path

  def initialize(path = './db/mp3s')
    @path = path
    music_importer = MusicImporter.new(@path)
    music_importer.import
  end

  def call
    puts "Welcome to the Music Library!"
    puts "Please enter a command:"
    command = "keep going"
    while command != "exit" do
      puts "list songs - List all songs"
      puts "list artists - List all artists"
      puts "list genres - List all genres"
      puts "play song -  Play a song"
      puts "list artist -  List all songs by an artist"
      puts "list genre -  List all songs from a genre"
      puts "Or type exit to quit"
      command = gets.chomp
      case command
        when "list songs"
          self.listSongs
        when "list artists"
          self.listArtists
        when "list genres"
          self.listGenres
        when "play song"
          puts "Available songs:"
          self.listSongs
          puts "Please enter the number of the song you'd like to play:"
          input = gets.chomp.to_i
          #implement check here for invalid input
          input = input - 1
          song = Song.all[input]
          puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
        when "list artist"
          puts "Available artists:"
          self.listArtists
          puts "Please type the name of an artist to view their song list:"
          input = gets.chomp
          #implement check here for invalid input
          artist = Artist.find_by_name(input)
          artist.songs.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        when "list genre"
          puts "Available genres:"
          self.listGenres
          puts "Please type the name of a genre to view its song list:"
          input = gets.chomp
          #implement check here for invalid input
          genre = Genre.find_by_name(input)
          genre.songs.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        when "exit"
          puts "Thank you for using Music Library"
        else
          puts "Invalid command. Try again."
      end
    end
  end

  def listSongs
    Song.all.each do |song|
      count = Song.all.index(song) + 1
      puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def listArtists
    Artist.all.each do |artist|
      count = Artist.all.index(artist) + 1
      puts "#{count}. #{artist.name}"
    end
  end

  def listGenres
    Genre.all.each do |genre|
      count = Genre.all.index(genre) + 1
      puts "#{count}. #{genre.name}"
    end
  end

end
