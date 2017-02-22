require_relative "./music_importer.rb"
class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    answer = nil
    array = []
    i = nil
    while answer != "exit"
      answer = gets.strip
      case answer
        when "list songs"
          Song.all.each_with_index {|a, i| array << "#{i+1}. #{a.artist.name} - #{a.name} - #{a.genre.name}"}
          puts array
        when "list artists"
          puts Artist.all.collect {|a| a.name}
        when "list genres"
          puts Genre.all.collect {|a| a.name}
        when "play song"
          i = gets.strip
          song = Song.all[i.to_i-1]
          puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
        when "list artist"
          artist = nil
          i = gets.strip
          artist = Artist.all.detect {|a| a.name == i}
          puts artist.songs.collect {|a| "#{a.artist.name} - #{a.name} - #{a.genre.name}"}
        when "list genre"
          genre = nil
          i = gets.strip
          genre = Genre.all.detect {|a| a.name == i}
          puts genre.songs.collect {|a| "#{a.artist.name} - #{a.name} - #{a.genre.name}"}
      end
    end
  end
end
