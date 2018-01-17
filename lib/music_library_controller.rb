class MusicLibraryController

  attr_accessor :importer

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
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
    puts "To get the list of commands, type 'commands'."
    puts "What would you like to do?"

    input = ""
    until input == "exit"
      input = gets.strip

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
        when 'commands'
          self.list_commands
        else
          puts "Please enter a valid command"
        end #end case

        puts "What next?"
    end #end until
  end # end #call

  def list_commands
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "To get the list of commands, type 'commands'."
  end

  def list_songs
    sorted = Song.all.sort_by!{|song| song.name}

    sorted.each do |song|
      puts "#{sorted.index(song)+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.print_alphabetized_by_name
  end

  def list_genres
    Genre.print_alphabetized_by_name
  end

  def list_songs_by_artist
    puts("Please enter the name of an artist:")
    artist = gets.strip
    found_artist = Artist.find_by_name(artist)

    if found_artist != nil
      found_artist.songs.sort_by!{|song| song.name}
      found_artist.songs.each do |song|
        puts "#{found_artist.songs.index(song)+1}. #{song.name} - #{song.genre.name}"
      end
    else
      puts "You don't have any songs by that artist."
    end

  end

  def list_songs_by_genre
    puts("Please enter the name of a genre:")
    genre = gets.strip

    found_genre = Genre.find_by_name(genre)

    if found_genre != nil
      found_genre.songs.sort_by!{|song| song.name}
      found_genre.songs.each do |song|
        puts "#{found_genre.songs.index(song)+1}. #{song.artist.name} - #{song.name}"
      end
    else
      puts "You don't have any songs of that genre."
    end
  end

  def play_song
    puts("Which song number would you like to play?")
    number = gets.strip.to_i

    sorted = Song.all.sort_by!{|song| song.name}

    if sorted[number-1] != nil && number > 0 && number < sorted.size
      song = sorted[number-1]
      puts("Playing #{song.name} by #{song.artist.name}")
    else
      puts "That is not a valid song number."
    end
  end
end
