class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
    importer = MusicImporter.new(@path)
    @importer = importer
    importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts"To list all of the songs by a particular artist, enter 'list artist'."
    puts"To list all of the songs of a particular genre, enter 'list genre'."
    puts"To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets
    while input != "exit"
      puts "What would you like to do?"
      input = gets
    end
  end

  def list_songs
#    array = name.split(" -")
#    person = array[0]
#    title = array[1]
  #  musicprototype = array[2].split(".mp3")
#    music = musicprototype[0]
    array = []
    index = 1
     @importer.files.each do |song|
       title = song[1]
       array << song.split(" -")[1].lstrip
     end
     ordered = array.sort
     @importer.files.each do |song|
       while index < ordered.length
         if song.include? ordered[index - 1]
           puts index + ". " + song
           index = index + 1
         end
       end
     end
  end

end
