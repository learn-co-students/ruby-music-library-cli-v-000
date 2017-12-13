class MusicLibraryController
  attr_accessor :music_importer
  
  def initialize(path='./db/mp3s')
    @music_importer = MusicImporter.new(path)
    @music_importer.import
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
    loop do
      input = gets.chomp
      if input == "exit"
        break
      end
    end
  end

def list_songs
  Song.all.sort_by(&:name).each_with_index do |song, index| 
    puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end

def list_artists
  Artist.all.sort_by(&:name).each_with_index do |artist, index|
    puts "#{index + 1}. #{artist.name}"
  end
end

end