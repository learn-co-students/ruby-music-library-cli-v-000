require 'pry'
class MusicLibraryController
  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    puts "Welcome to Your Music Library!"
    puts "What would you like to do?"
    while input != "exit"

      input = gets.strip

      case input
      when "list songs"
        Song.all.each_with_index do |s, i|
          puts "#{i+1}. #{s.artist_name} - #{s.name} - #{s.genre.name}"
        end
      when "list artists"
        Artist.all.each do |a|
          puts "#{a.name}"
        end
        #puts "#{Artist.self.all}"
        #puts "#{artist.all}"
        #Song.create_from_filename(filename)

      when "list genres"
        Genre.all.each do |g|
          puts "#{g.name}"
        end
        #puts "#{Genre.genre.all}"
        #puts "#{Genre.self.all}"
        #puts "#{genre.all}"
        #Song.create_from_filename(filename)
        #genre_name
        #list_genres
      when "play song"
        input = gets.strip
        input = input.to_i
        index = input - 1
        song = Song.all[index]
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"

        #play_song
      when "list artist"
        input = gets.strip

        Artist.find_by_name(input).songs.each do |s|
          puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
        end

      when "list genre"
        input = gets.strip

        Genre.find_by_name(input).songs.each do |s|
          puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
        end
      end
    end
  end
end
