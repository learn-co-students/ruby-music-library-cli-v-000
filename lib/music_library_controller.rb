require 'pry'

class MusicLibraryController

  attr_reader :repertuar, :created_songs

  def initialize(path = "./db/mp3s")
    @repertuar = MusicImporter.new(path)
    @created_songs = @repertuar.import
  end

  def call
    puts "Hey, enter smth:"
    input = gets.chomp
    case input
    when "list songs"
      list_songs # no explicit receiver, otherwise NoMethod Error - !!!! why ????
      #call - should I call here? ???
    when "list artists"
      list_artists
    when "list genres"
      list_genres
    when "play song"
      play_song
    when "list artist"
      list_artist
    when "list genre"
      list_genre
    else
      unless input == "exit"
        #when proc { |n| !(n == "exit") }      #!(input == "exit") #it gave an infinitive loop with until ??????
        MusicLibraryController.new(input)
        call
      end
    end
  end #end of .call method

private
  def list_songs
    sorted_repertuar = self.repertuar.files_without_extension.sort
    sorted_repertuar.each.with_index do |f, i|
      i += 1
      puts "#{i}. #{f}"
    end
    call
  end

  def list_artists
    self.created_songs.each do |s| #what if there the same artist ?????
      puts "#{s.artist.name}"
    end
    call
  end

  def list_genres
    self.created_songs.each do |s| #what if there the same artist ?????
      puts "#{s.genre.name}"
    end
    call
  end

  def play_song
    puts "Enter the number of the song"
    song_number = gets.chomp.to_i - 1
    puts "Playing #{self.repertuar.files_without_extension.sort[song_number]}"
    call
  end

  def list_artist
    puts "Enter the artist name"
    artist_name = gets.chomp
    self.repertuar.files_without_extension.each do |f|
      puts "#{f}" if f.split(" - ")[0] == artist_name
    end
    call
  end

  def list_genre
    puts "Enter the genre name"
    genre_name = gets.chomp
    self.repertuar.files_without_extension.each do |f|
      puts "#{f}" if f.split(" - ")[-1] == genre_name
    end
    call
  end

end


#    if input == "list songs" && !(self.repertuar.empty?)
#      self.repertuar.each {|f| "1. #{f}"}
#    elsif !(input == "exit")
#      songs = MusicLibraryController.new(input)
#      call
#    end


    #unless input == "exit" #it gave an infinitive loop with until ??????
    #    songs = MusicLibraryController.new(input)
    #    call
    #end
    #songs
