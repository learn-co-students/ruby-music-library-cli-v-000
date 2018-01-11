class MusicLibraryController
#=================modules======================
  include Concerns::CLI
#=================intialize====================
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end
#=================instance=====================
  def call
    input = nil
    until input == "exit"
      puts "Welcome to your music library!".red
      puts "To list all of your songs, enter" + ' list songs'.green
      puts "To list all of the artists in your library, enter" + ' list artists'.green
      puts "To list all of the genres in your library, enter" + ' list genres'.green
      puts "To list all of the songs by a particular artist, enter" + ' list artist'.green
      puts "To list all of the songs of a particular genre, enter" + ' list genre'.green
      puts "To play a song, enter" + ' play song'.green
      puts "To quit, type" + ' exit'.green
      puts "What would you like to do?".red
      input = gets.strip
  #================commands====================
  # SEE concerns/CLI.rb
  #============================================
      case input
      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "list artist"
        self.list_songs_by_artist
      when "list genre"
        self.list_songs_by_genre
      when "play song"
        self.play_song
      else
        "Invalid Entry, Please Try Again"
      end
#==============================================
    end
  end
end
