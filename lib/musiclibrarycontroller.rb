class MusicLibraryController

attr_accessor :music_importer

def initialize (path="./db/mp3s")
  MusicImporter.new(path).import
end

def call
  command = " "
  puts "Welcome to your music library!"
  puts "To list all of your songs, enter 'list songs'."
  puts "To list all of the artists in your library, enter 'list artists'."
  puts "To list all of the genres in your library, enter 'list genres'."
  puts "To list all of the songs by a particular artist, enter 'list artist'."
  puts "To list all of the songs of a particular genre, enter 'list genre'."
  puts "To play a song, enter 'play song'."
  puts "To quit, type 'exit'."
  puts "What would you like to do?"

  until command == "exit"
    command = gets.chomp.downcase
    case command
  end
end

    def list_songs
      Song.all.each_with_index do |song, index| puts "#{index+1}. #{song.artist.name}
        - #{song.name} - #{song.genre.name}"
    end

  def list_artists
    Artists.all.each do |artist|
      puts artist.name
  end

  def list_genres
    Genre.all.each do|genre|
      puts genre.name
  end

def play_song
  puts  "Which song do you want to hear?"
  input = gets.chomp.to_i - 1
  puts "Playing #{Song.all[input].artist.name} - #{Song.all[input].name} - #{Song.all[input].genre.name}"
end

end
