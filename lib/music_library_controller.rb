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
      puts "What would you like to do?"
      puts "Your options are (enter exactly as shown):"
      puts "list songs"
      puts "list artists"
      puts "list genres"
      puts "play song"
      puts "list artist"
      puts "list genre"
      puts "exit"
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
          puts "enter song number as a number"
          i = gets.strip
          song = Song.all[i.to_i-1]
          puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
        when "list artist"
          "enter the artist name"
          i = gets.strip
          artist = Artist.all.detect {|a| a.name == i}
          puts artist.songs.collect {|a| "#{a.artist.name} - #{a.name} - #{a.genre.name}"}
        when "list genre"
          puts "enter the genre name"
          i = gets.strip
          genre = Genre.all.detect {|a| a.name == i}
          puts genre.songs.collect {|a| "#{a.artist.name} - #{a.name} - #{a.genre.name}"}
      end
    end
  end
end
