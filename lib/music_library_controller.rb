require 'pry'
class MusicLibraryController
  attr_accessor :importer

  def initialize(path = "./db/mp3s")
    @importer = MusicImporter.new(path)
    @importer.import
  end

  def call
    while (command = gets.chomp) != "exit"
      if command == "list songs" 
        @importer.files.each_with_index do |song, index|
          puts "#{index + 1}. #{song}"
        end
      elsif command == "list artists"
        @importer.songs.each do |song|
          puts "#{song.artist.name}"
        end
      elsif command == "list genres"
        @importer.songs.each do |song|
          puts "#{song.genre.name}"
        end
      elsif command == "play song"
        song_number = gets.chomp.to_i 
        puts "Playing #{@importer.files[song_number - 1]}"
      elsif command == "list artist"
        artist = Artist.find_by_name(gets.chomp)
        if artist
          artist.list_songs
        end
      elsif command == "list genre" 
        genre = Genre.find_by_name(gets.chomp)
        if genre
          genre.list_songs
        end
      end
    end
  end

end
