require 'pry'

class MusicLibraryController

  attr_accessor :path, :songs, :artist, :genre

  @@all = []

  def initialize(path = './db/mp3s')
    @path = path
    @@all = MusicImporter.new(path).import
  end

  def call
    # puts "What would you lke to see?"
    user_input = gets.chomp

    if user_input == "list songs"
      i = 0
      counter = 1
      while i < self.all.count
          puts "#{counter}. #{self.all[i].sub(/(.mp3)/, '')}"
          i += 1
          counter += 1
      end
      user_input = gets.chomp
    
    elsif user_input == "list artists"
      self.all.each do |x|        
        puts "#{x.sub(/(.mp3)/, '').split(" - ")[0]}"
      end
      user_input = gets.chomp  

    elsif user_input == "list genres"
      self.all.each do |x|        
        puts "#{x.sub(/(.mp3)/, '').split(" - ")[2]}"
      end
      user_input = gets.chomp  

    elsif user_input == "play song"
      song_number = gets.chomp
      playlist = song_number.to_i - 1
        puts "Playing #{self.all[playlist].sub(/(.mp3)/, '')}"
      user_input = gets.chomp

    elsif user_input == "list artist"      
      artist_request = gets.chomp
      self.all.each do |song|
        if song.sub(/(.mp3)/, '').split(" - ")[0] == artist_request
          puts "#{song.sub(/(.mp3)/, '')}"
        end
      end
      user_input = gets.chomp

    elsif user_input == "list genre"
      genre_request = gets.chomp
      self.all.each do |genre|
        if genre.sub(/(.mp3)/, '').split(" - ")[2] == genre_request
          puts "#{genre.sub(/(.mp3)/, '')}"
        end
      end
      user_input = gets.chomp


    end


  end

  def all
    @@all
  end
end