class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    @path = path
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end
  
  def call
    request = ""
    while request != "exit"
      greeting
      request = gets.strip
      case request
        when "list songs"
          list_songs
        when "list artists"
          list_artists
        when "list genres"
          puts 'listing genres'
        when "list artist"
          puts "listing artist"
        when "list genre"
          puts "listing genre"
        when "play song"
          puts "playing song"
        when "exit"
          break
        else
        end
     end
  end
  

  def list_songs
    ordered = Song.all.sort_by(&:name)
    ordered.collect.with_index { |s,i| puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}" }
  end
  
  # list_artists prints all artists in the music library in 
  # a numbered list (alphabetized by artist name)
  def list_artists
    Artist.all.sort_by(&:name).map.with_index { |a,i| puts "#{i+1}. #{a.name}" }
  end
  
  
  
  private 
  
  def greeting
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
  end
  
end