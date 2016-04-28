require 'pry'

class MusicLibraryController
  def initialize(path = "./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = " "
    while input != "exit"
      puts "Welcome to your Music Library!"
      puts "What would you like to do?"
      input = gets.strip
      case input
      when "list songs"
        Song.all.each_with_index{|song,index|
        puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
      when "list artists"
        Artist.all.each{|artist| puts artist.name}
      when "list genres"
        Genre.all.each{|genre| puts genre.name}
      when "play song"
        puts "Which song would you like to play? Hint: Pick a number"
        song = gets
        song = song.to_i
        s = Song.all[song - 1]
        puts "Playing #{s.artist.name} - #{s.name} - #{s.genre.name}"

      when "list artist"
        puts "Enter an artist name:"
        artist = gets
        artist = Artist.find_by_name(artist)
        artist.songs.each{|s| puts "#{artist.name} - #{s.name} - #{s.genre.name}"}
      when "list genre"
        puts "Enter an genre:"
        genre = gets
        genre = Genre.find_by_name(genre)
        genre.songs.each{|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
      end
    end
  end
end
