class MusicLibraryController

  def initialize(path = "./db/mp3s")
    # @path = path
    importer = MusicImporter.new(path)
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
    puts "What would you like to do?"
    user_input = gets.to_s
    if user_input == 'exit'
      return "Thanks, take care!"
    else
      call
    end
  end

  def list_songs
    sorted_songs = Song.all.sort_by! {|song| song.name}
    sorted_songs.each_with_index do |item, index|
      puts "#{index + 1}. #{item.artist.name} - #{item.name} - #{item.genre.name}"
      # binding.pry
    end
  end

end
