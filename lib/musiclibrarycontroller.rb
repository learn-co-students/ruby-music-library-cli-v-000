require 'pry'
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    importer = MusicImporter.new(@path)
    importer.import
  end

  def call
    answer = ""
    Song.all.sort!{|a, b| a.artist.name <=> b.artist.name}
    Genre.all.sort!{|a, b| a.name <=> b.name}
    Artist.all.sort!{|a, b| a.name <=> b.name}
    while answer != "exit"
      answer = gets.strip()
      case answer
      when "list songs"
        Song.all.each_with_index do |song, index|
          puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      when "list artists"
        Artist.all.each_with_index do |artist, index|
          puts "#{index+1}. #{artist.name}"
        end
      when "list genres"
        Genre.all.each_with_index do |genre, index|
          puts "#{index+1}. #{genre.name}"
        end
      when "play song"
        song_index = gets.strip()
        song = Song.all[song_index.to_i-1]
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      when "list artist"
        artist = gets.strip()
        artist = Artist.find_by_name(artist)
        artist.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      when "list genre"
        genre = gets.strip()
        genre = Genre.find_by_name(genre)
        genre.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      end
    end
  end


end
