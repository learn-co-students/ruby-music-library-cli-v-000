class MusicLibraryController
  #attribute and variables
  attr_accessor :path

  #initialize
  def initialize(path = "./db/mp3s")
    @path = MusicImporter.new(path).import
  end

  #instance methods
  def call
    user_input = ""
    puts "Hello DJ Maestro!!"
    puts "Let's get started:"
    while user_input != "exit"

      user_input = gets.chomp

      case user_input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genre
      when "play song"
        play_song
      when "list artist"
        list_artist_songs
      when "list genre"
        list_genre_songs
      end
    end
  end

  def list_songs
    self.path.sort!.each {|filename| puts "#{(self.path.index(filename))+1}. #{filename}"}
  end

  def play_song
    puts "Which Song would you like to hear?"
    user_input = (gets.chomp.to_i) - 1
    puts "Playing #{Song.all[user_input].artist.name} - #{Song.all[user_input].name} - #{Song.all[user_input].genre.name}"
  end

  def list_artists
    Artist.all.each {|artist| puts artist.name}
  end

  def list_genre
    Genre.all.each {|genre| puts genre.name}
  end

  def list_artist_songs
    "What artist are you interested in?"
    user_input = gets.chomp
    Artist.find_by_name(user_input).songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_genre_songs
    "What genre are you interested in?"
    user_input = gets.chomp
    Genre.find_by_name(user_input).songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

end
