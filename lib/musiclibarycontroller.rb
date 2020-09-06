require 'pry'
class MusicLibraryController

  attr_accessor :to_import
  attr_reader :files

  def initialize(path = "./db/mp3s")
    @to_import = MusicImporter.new(path)
    to_import.import
  end

  def call
    puts "What would you like to do?"
    input = nil
    i = 1
    while input != "exit"
      input = gets.strip.downcase
      case input 

      when "list songs"
        @to_import.files.each do |file|
          puts "#{i}. #{file.gsub(/\.mp3/, "")}"
          i += 1
        end
      when "list artists"
        Artist.all.each do |artist|
          puts artist.name
        end
      when "list genres"
        Genre.all.each do |genre|
          puts genre.name
        end
      when "play song"
        puts "Which song?"
        input = gets.to_i 
        puts "Playing #{@to_import.files[input -1].gsub(/\.mp3/, "")}"
      when "list artist"
        input = gets.strip
       @to_import.files.select {|file| file.include?(input)}.each {|file| puts file}
      when "list genre"
        input  = gets.strip
        @to_import.files.select {|file| file.include?(input)}.each {|file| puts file}
      end
    end
  end
end