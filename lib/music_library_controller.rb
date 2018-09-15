class MusicLibraryController

  def initialize(path = "./db/mp3s" ) #it "the 'path' argument defaults to './db/mp3s'" do
    MusicImporter.new(path).import #"invokes the #import method on the created MusicImporter object" do
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

    input = gets.strip
    end
  end

  def list_songs
      sorted_songs = Song.all.sort_by(&:name)
      # either sort_by or a block with <=> can be used to sort an array
      # of objects, such as an array of strings.
      # See http://www.rubyguides.com/2017/07/ruby-sort/

      sorted_songs.each_with_index do |song, index| # not |index,song|
        puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
                                #artist - song title - genre
      end
  end

    def list_artists
        sorted_artists = Artist.all.sort_by(&:name)
        # either sort_by or a block with <=> can be used to sort an array
        # of objects, such as an array of strings.
        # See http://www.rubyguides.com/2017/07/ruby-sort/

        sorted_artists.each_with_index do |artist, index|
          puts "#{index+1}. #{artist.name}"
          # if you only put #{artist}, this error will occur:
          # expected: ("1. Action Bronson")
          #    got: ("1. #<Artist:0x00000003576270>")
        end
    end

end
