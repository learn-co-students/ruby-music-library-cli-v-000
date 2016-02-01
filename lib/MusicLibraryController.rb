require "pry"
class MusicLibraryController
  attr_accessor :path, :import

  def initialize(path="./db/mp3s")
    @import = MusicImporter.new(path).import
  end

  def call
    user = gets.chomp.downcase
      if user  == "list songs"
        @import.each_with_index do |s, i|
          puts "#{i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
        end
        user = gets.chomp.downcase
      elsif user == "list artists"
        @import.each { |s| puts s.artist.name }
        user = gets.chomp.downcase
      elsif user == "list genres"
        @import.each { |s| puts s.genre.name }
        user = gets.chomp.downcase
      elsif user == "play song"
        puts "Pick a song number:"
        song_index = gets.chomp.to_i - 1
        song = @import[song_index]
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
        user = gets.chomp.downcase
      elsif user == "list artist"
        puts "Enter a artist name:"
        artist = gets.chomp
        @import.each do |s| 
          if s.artist.name == artist
            puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
          end
        end
        user = gets.chomp.downcase
      elsif user == "list genre"
        puts "Enter a genre name:"
        genre  = gets.chomp
        @import.each do |s| 
          if s.genre.name == genre
            puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
          end
        end
        user = gets.chomp.downcase
      end

  end

end
