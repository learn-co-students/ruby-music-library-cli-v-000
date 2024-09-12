require 'pry'
class MusicLibraryController
attr_accessor :path, :music_importer

def initialize (path="./db/mp3s")
  @path = path
  @music_importer = MusicImporter.new(@path)
  @music_importer.import
end

def call
  input = gets.chomp
  song_list_array =[]
  while input != "exit"
    case input
    when "list songs"
      i = 0
      Artist.all.each {|a| a.songs.each { |s| puts "#{i+=1}. #{a.name} - #{s.name} - #{s.genre.name}"}}
      input = gets.chomp
    when "play song"
      input = gets.chomp
      i = 0
      Artist.all.each {|a| a.songs.each  do |s|
        i+=1
        puts "Playing #{a.name} - #{s.name} - #{s.genre.name}" if input.to_i == i
      end
      }
      input = gets.chomp

    when "list artists"
      Artist.all.each {|a| puts a.name}
      input = gets.chomp

    when "list genres"
      Genre.all.each {|g| puts g.name}
      input = gets.chomp

    when "list artist"
      i=0
      input = gets.chomp
      Artist.all.each {|a|  a.songs.each {|s| puts "#{i+=1}. #{a.name} - #{s.name} - #{s.genre.name}"} if a.name== input}
      input = gets.chomp

    when "list genre"
      i=0
      input = gets.chomp
      Genre.all.each {|g|  g.songs.each {|s| puts "#{i+=1}. #{s.artist.name} - #{s.name} - #{g.name}"} if g.name== input}
      input = gets.chomp

    else
      input = gets.chomp
    end
  end
end

end
