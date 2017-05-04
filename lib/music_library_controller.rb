require 'pry'

class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
    song_list = Song.all.sort {|a,b| a.artist.name <=> b.artist.name}
    artist_list = Artist.all.collect {|artist| artist.name}
    genre_list = Genre.all.collect {|genre| genre.name}


  while input != "exit"
    input = gets.chomp
    case input
    when "list songs"
      song_list.each {|song| puts "#{song_list.index(song)+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}

    when "list artists"
      artist_list.each {|artist| puts artist}

    when "list genres"
      genre_list.each {|genre| puts genre}

    when "play song"
      puts "Which track would you like to play?"
      input = gets.chomp.to_i
      song = song_list[input-1]
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"

    when artist_list.select {|x| x==input}[0]
      Artist.find_by_name(input).songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end

    when genre_list.select {|x| x==input}[0]
      Genre.find_by_name(input).songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
end
end
end
