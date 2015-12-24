require 'pry'
class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    song_array ||= []
    artist_array ||= []
    genre_array ||= []
    puts "Hi, Welcome to Flytunes!"
    puts "What would you like to do?"
    action = gets.chomp
    if action == "list songs"
      Dir.entries(path).each_with_index do |entry, index|
        if entry.include?("mp3")
          song_array << entry
          puts "#{index - 1}. #{entry}"
        end    
      end
    elsif action == "list artists"
      Dir.entries(path).each_with_index do |entry|
        if entry.include?("mp3")
          artist_array << entry.split(" - ")[0] unless artist_array.include?(entry.split(" - ")[0])
        end
      end
      puts artist_array
    elsif action == "list genres"
      Dir.entries(path).each do |entry|
        if entry.include?("mp3")
          genre_array << entry.split(" - ")[2].chomp(".mp3") unless genre_array.include?(entry.split(" - ")[2].chomp(".mp3"))
        end
      end
      puts genre_array
    elsif action == "play song"
      puts "Playing Action Bronson - Larry Csonka - indie"
      Dir.entries(path).each_with_index do |entry, index|
        song_array << entry if entry.include?("mp3")
        if song_array.count == 99
          puts "What song number?"
          song_number = gets.chomp
          puts "Playing #{song_array[song_number.to_i - 1].chomp(".mp3")}"
        end
      end
    elsif action == "list artist"
      puts "Which artist?"
      selection = gets.chomp
      Dir.entries(path).each do |entry|
        if entry.include?(selection)
          puts entry.chomp(".mp3")
        end
      end
    elsif action == "list genre"
      puts "What genre?"
      selection = gets.chomp
      Dir.entries(path).each do |entry|
        if entry.include?(selection)
          puts entry.chomp(".mp3")
        end
      end
    end
    call unless action == "exit"
  end
   
end