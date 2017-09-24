require 'pry'

class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end

  def call
    input = ""
    until input == "exit"
      input = gets.strip
      case input
      when "list songs"
        i = 0
        @music_importer.files.each do |file|
          i += 1
          puts "#{i}. #{file.gsub(".mp3","")}"
        end
      when "list artists"
        Artist.all.each {|artist| puts artist.name}
      when "list genres"
        Genre.all.each {|genre| puts genre.name}
      when "play song"
        second_input2index = gets.chomp.to_i - 1
        puts "Playing #{@music_importer.files[second_input2index].gsub(".mp3","")}"
      when "list artist"
        selected_artist = gets.chomp
        @music_importer.files.select { |file| file.split(" - ")[0] == selected_artist}.each do |file|
          puts "#{file.gsub(".mp3","")}"
        end
      when "list genre"
        selected_genre = gets.chomp
        @music_importer.files.select { |file| file.split(" - ")[-1].gsub(".mp3","") == selected_genre}.each do |file|
          puts "#{file.gsub(".mp3","")}"
        end
      end #case
    end #until

  end #call

end
