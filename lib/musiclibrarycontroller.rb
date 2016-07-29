require 'pry'

class MusicLibraryController
  attr_reader :path

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    loop do
      puts "What would you like to do?"
      input = gets.strip

      if input == "exit"
        break

      elsif input == "list songs"
        count = 0
        Song.all.each do |song|
          count += 1
          puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end

      elsif input == "list artists"
        Artist.all.each {|artist| puts artist.name}

      elsif input == "list genres"
        Genre.all.each {|genre| puts genre.name}
      
      elsif input == "play song"
        count = 0
        Song.all.each do |song| 
          count += 1
          puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
        puts "PICK YOUR SONG NUMBER!"
        num = gets.strip
        puts "Playing #{Song.all[num.to_i - 1].artist.name} - #{Song.all[num.to_i - 1].name} - #{Song.all[num.to_i - 1].genre.name}"
      
      elsif input == "list artist"
        Artist.all.each {|artist| puts artist.name}
        puts "Which artist's songs would you like to list?"
        artist_name = gets.strip
        artist_songs = Song.all.select {|song| song.artist.name == artist_name}
        artist_songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}

      elsif input == "list genre"
        Genre.all.each {|genre| puts genre.name}
        puts "Which genre's songs would you like to list?"
        genre_name = gets.strip
        genre_songs = Song.all.select {|song| song.genre.name == genre_name}
        genre_songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}  
      end  
    end
  end
end