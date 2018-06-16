class MusicLibraryController

attr_accessor :path

def initialize(path = './db/mp3s')
  @path = path
  import_object = MusicImporter.new(path)
  import_object.import
end



def call
  response = ""
  while response != "exit"
  puts "Welcome to your music library!"
  puts "To list all of your songs, enter 'list songs'."
  puts "To list all of the artists in your library, enter 'list artists'."
  puts "To list all of the genres in your library, enter 'list genres'."
  puts "To list all of the songs by a particular artist, enter 'list artist'."
  puts "To list all of the songs of a particular genre, enter 'list genre'."
  puts "To play a song, enter 'play song'."
  puts "To quit, type 'exit'."
  puts "What would you like to do?"
  response = gets.strip
  case response
  when "list songs"
    list_songs
  end
  end
end

def list_songs
sorted_songs = Song.all.sort{|a,b| a.name <=> b.name}
sorted_songs.each do |song|
  counter = 0
  puts "#{counter += 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
end
end


end
