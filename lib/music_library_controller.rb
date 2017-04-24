class MusicLibraryController

  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    while (input = gets.chomp) != "exit"

      case input
      when input = "list songs"
      songs = Song.all.sort_by! {|song| song.artist.name }
      songs.each_with_index {|song,index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}

      when input = "list artists"
        Song.all.each {|song| puts "#{song.artist.name}"}

      when input = "list genres"
        Song.all.each {|song| puts "#{song.genre.name}"}

      when input = "play song"
        Song.all.each {|song| puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"}

      when input = "list artist"
        artist = gets.strip
        Song.all.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}

      when input = "list genre"

      end
    end
  end


end
