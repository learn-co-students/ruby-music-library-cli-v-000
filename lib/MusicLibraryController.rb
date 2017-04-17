require 'pry'

class MusicLibraryController
  attr_accessor :playlist, :imported_playlist

  def initialize(path = "./db/mp3s")
    @playlist = MusicImporter.new(path)
    @imported_playlist = @playlist.import
    #binding.pry
  end

  def call
    inputs = []
    until inputs.include?("exit")
      inputs << gets.strip
      output(inputs.last)
    end
  end

  def output(input)
    case input
      when /list songs/i
        self.playlist_player
      when /list artists/i
        self.list_artists
      when /list genres/i
        self.list_genres
      when /play song/i
        self.play_song
      when /list artist/i
        self.list_artist
      when /list genre/i
        self.list_genre
    end
  end

  def playlist_player
    num = 0
    self.playlist.files.each do |song|
      puts "#{num+=1}. #{song}"
    end
  end

  def list_artists
    Artist.all.each {|artist| puts "#{artist.name}"}
  end

  def list_genres
    Genre.all.each {|genre| puts "#{genre.name}"}
  end

  def play_song
    puts "Enter song number : "
    input = gets.strip
    index = input.to_i - 1
    puts "Playing #{self.playlist.files[index]}"
    #binding.pry
  end

  def list_artist
    puts "Enter artist name:"
    input = gets.strip
    self.playlist.files.each do |song|
      puts "#{song}" if song.include?(input)
    end
  end

  def list_genre
    puts "Enter genre:"
    input = gets.strip
    self.playlist.files.each do |song|
      puts "#{song}" if song.include?(input)
    end
  end

end
