class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    @music_importer = MusicImporter.new(path)
    #binding.pry
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

    user_input = ""
    while user_input != "exit"
      user_input = gets
    end
  end


    def list_songs
      list = @music_importer.files
      list.sort_by!{|song| song.split(" - ")[1]}
      list.each_with_index {|val, index| puts "#{index+1}. #{val.chomp(".mp3")}"}
    end

    def list_artists
      list = Song.all.map {|song| song.artist.name}
      binding.pry
      list.uniq!.sort_by!{|a| a.name}
      list.each_with_index {|val, index| puts "#{index+1}. #{val.name}"}
    end

end
