require 'pry'

class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    self.path = path
    importedpath = MusicImporter.new(path)
    importedpath.import
  end

  def call
    user_input = "hello"
    while user_input != "exit"
      user_input = gets.strip
      case user_input
      when "list songs"
        Song.all.each_with_index do |song, index|
          puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      when "list artists"
        Artist.all.each {|artist| puts "#{artist.name}"}
      when "list genres"
        Genre.all.each {|genre| puts "#{genre.name}"}
      when "play song"
        songnumber = gets.strip.to_i
        puts "Playing #{Song.all[songnumber-1].artist.name} - #{Song.all[songnumber-1].name} - #{Song.all[songnumber-1].genre.name}"
      when "list artist"
        getartist = gets.strip
        artist = Artist.find_by_name(getartist)
        artist.songs.each {|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
      when "list genre"
        getgenre = gets.strip
        genre = Genre.find_by_name(getgenre)
        genre.songs.each {|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
      end
    end
  end

end
