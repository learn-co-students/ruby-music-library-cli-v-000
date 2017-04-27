#####initialize
#accepts a path to import music
#the path argument defaults to ./db/mp3s
#creates a MusicImporter with that path and imports the music
#populates Song, Artist, and Genre
#####call
#responds to a call method to start the CLI
#asks the user for input at some point
#loops and asks for user input until they type in exit

class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    while (input = gets.chomp) != "exit"

#####Music Library CLI
#allows a user to list songs
#allows a user to list artists
#allows a user to list genres
#allows a user to play a song
#allows a user to list an artist's songs
#allows a user to list a genre's songs
        
      case input
      when input = "list songs"
        songs = Song.all.sort_by! {|song| song.artist.name }
        songs.each_with_index {|song,index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}

      when input = "list artists"
        Song.all.each {|song| puts "#{song.artist.name}"}

      when input = "list genres"
        Song.all.each {|song| puts "#{song.genre.name}"}

      when input = "play song"
        Song.all.each {|song| puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"}

      when input = "list artist"
        artist = gets.strip
        Song.all.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}

      when input = "list genre"
        genre = gets.strip
        Song.all.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      end
    end
  end
end
