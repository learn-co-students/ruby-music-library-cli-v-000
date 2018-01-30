class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    puts "Welcome to your Music Library!"
    puts "What would you like to do?"

    while input != "exit"
      input = gets.strip

      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      end

    end #while
  end #call

def songs
  Song.all.each.with_index(1) { |song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
end

def artists
  Song.all.each { |song| puts "#{song.artist.name}" }
end

def genres
  Song.all.each { |song| puts "#{song.genre.name}" }
end

def play_song
  Song.all.each { |song| puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}" }
end

def list_artist
  Song.all.each { |song| puts "-#{song.artist.name} - #{song.name} - #{song.genre.name}" }
end

def list_genre
  Song.all.each { |song| puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}" }
end

end #class
