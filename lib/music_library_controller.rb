class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    new_MI_object = MusicImporter.new(path)
    new_MI_object.import
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
    
    input = ""
    until input == 'exit'
    input = gets.strip
    end
  end

  def list_songs
    look_at_all_songs_in_CLI = Song.all
    alphabetized_songs = look_at_all_songs_in_CLI.sort{|a,b| a.name <=> b.name }
    remove_duplicates = alphabetized_songs.uniq
    
    list_songs_with_number = remove_duplicates.each_with_index{ |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    }
    print list_songs_with_number
  end

end
