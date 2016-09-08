require 'pry'
class MusicLibraryController
attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = gets.chomp until input == "exit"
    case input
    when "list songs"
      list_songs
    when "list artists"
      list_artists
    when "list genres"
      list_genres
  end
end

  def list_songs
    Song.all.each_with_index {|song, index| puts "#{index}. #{song}"}
  end

  def list_artists
    Artist.all.each {|artist| puts "#{artist}"}
  end

  def list_genres
    Genre.all.each {|genre| puts "#{genre}"}
  end

end
