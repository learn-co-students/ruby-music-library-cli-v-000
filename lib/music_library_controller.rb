require 'pry'

class MusicLibraryController

  attr_accessor :path 

  def initialize(path = "./db/mp3s")
    @path = path 
    @new_music = MusicImporter.new(path)
    @new_music.import
  end 

  def call 
    something = gets.chomp 
    while something != "exit"
      if something == "list songs"
        @new_music.files.sort.each_with_index.collect do 
          |n,index| puts "#{index + 1}. #{n[0..-5]}"
        end 
      elsif something == "list artists"
        @new_music.files.sort.uniq.each_with_index.collect do 
          |n,index| puts "#{n.split(" - ")[0]}"
        end 
      elsif something == "list genres"
        @new_music.files.sort.uniq.each_with_index.collect do 
          |n,index| puts "#{n.split(" - ")[2][0..-5]}"
        end 
      elsif something == "play song"
        song_num = gets.chomp 
        ind_num = song_num.to_i - 1
        puts "Playing #{@new_music.files.sort[ind_num][0..-5]}" 
      elsif something == "list artist"
        artist = gets.chomp 
        artist_files = @new_music.files.sort.reject {|s| s.split(" - ")[0] != artist}
        artist_files.each_with_index.collect do 
          |n,index| puts "#{n[0..-5]}"
        end 
      elsif something == "list genre"
        genre = gets.chomp 
        genre_files = @new_music.files.sort.reject {|s| s.split(" - ")[2][0..-5] != genre}
        genre_files.each_with_index.collect do 
          |n,index| puts "#{n[0..-5]}"
        end 
      end 
      something = gets.chomp 
    end 
  end 
  
end