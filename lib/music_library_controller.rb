class MusicLibraryController
  attr_accessor :path

  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def list_songs
    Song.all.sort_by!{|a| a.artist.name}.each_with_index {|s, index| puts "#{index + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end

  def list_artists
    Artist.all.sort_by!{|a| a.name}.each {|s| puts "#{s.name}"}
  end

  def list_genres
    Genre.all.sort_by!{|g| g.name}.each {|s| puts "#{s.name}"}
  end

  def play_song
    puts "Which song number would you like to play?"
    self.list_songs
    number = gets.strip.to_i - 1
    puts "Playing #{Song.all[number].artist.name} - #{Song.all[number].name} - #{Song.all[number].genre.name}"
  end

  def list_artists_songs
      puts "\nPlease type an artist's name to list their songs."
      name = gets.chomp
      artist = Artist.find_by_name(name)
      if artist == nil
        puts "\nThis is not a valid artist."
        self.list_artists_songs
      else
        artist.songs.collect {|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
    end
  end

  def list_genres_songs
    puts "\nPlease type a genre to list it's songs."
    name = gets.chomp
    genre = Genre.find_by_name(name)
    if genre == nil
      puts "\nThis is not a valid genre."
      self.list_genres_songs
    else
      genre.songs.collect {|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
    end
  end

  def call
    user_input = ""
    puts "\nWelcome to your Music Library! To begin, please enter a command or 'help' for a list of available commands."

    until user_input == "exit"
      puts "\nPlease enter a command to continue."
      user_input = gets.chomp.downcase
      case user_input
      when "help"
        puts "1.list songs - to browse by song name\n2.list artists - to browse by artist name\n3.list genres - to browse by genre\n4.play song - to play a song\n5.list artist - to list all songs by artist\n6.list genre - to list all songs in genre\n7.exit"

      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "play song"
        self.play_song
      when "list artist"
        self.list_artists_songs
      when "list genre"
        self.list_genres_songs
      when "exit"
        puts "Please come back soon!"
      else
        puts "This is an invalid command. Type 'help' for a list of available commands."
      end
    end
  end
end
