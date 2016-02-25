require 'pry'

class MusicLibraryController 
attr_accessor :path

def initialize(path= "./db/mp3s")
  @path= path
  @music_importer=MusicImporter.new(path).import
end

def call
  puts "Welcome to Brian's Music Library"
  puts "Please type in one of the following commands"
  puts " "
  puts "To list all songs, type: 'list songs'"
  puts "To list all artists, type: 'list artists'"
  puts "To list all genres, type: 'list genres"
  puts "To play a song, first type: 'play song', then enter the nuber of the song."
  puts "To list all songs by a particular artist, first type: 'list artist' then type the name of the artist."
  puts "To list all songs in a particular genre, first type: 'list genre' then type the name of the genre."
  puts "To exit, type: 'exit'"
  @music_importer.each {|filename| Song.create_from_filename(filename)}
  input= gets.strip
  if input == "list songs"
    x=1
    Song.all.each do |song|
       puts "#{x}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      x+=1
    end
    call
  elsif input == "list artists"
        Artist.all.each {|artist| puts artist.name}
        call
  elsif input == "exit"

  elsif input == "list genres"
    Genre.all.each {|genre| puts genre.name}
    call
  elsif input == "play song"
    puts "Which song number would you like to play?"
    input2=gets.strip.to_i
    input2-=1
    selected_song=Song.all[input2]
    puts "Playing #{selected_song.artist.name} - #{selected_song.name} - #{selected_song.genre.name}"
    call
  elsif input== "list artist"
    puts "Which artist's songs would you like to list?"
    input3=gets.strip
    Artist.find_by_name(input3).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
    call
 elsif input=="list genre"
      puts "Which genre's songs would you like to list?"
      input4=gets.strip
      Genre.find_by_name(input4).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      call
 end


end




end