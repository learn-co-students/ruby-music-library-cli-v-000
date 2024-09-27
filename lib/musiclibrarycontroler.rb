require 'pry'

class MusicLibraryController
  
  attr_accessor :path
  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    response = ""

    while response != "exit"
      puts "Please select your option: \n 'list songs' \n 'list artists' \n 'play song' \n 'list artist' \n 'list genre' \n 'exit'"
      response = gets.rstrip
      @sg = []
      case response
        when "list songs"
          Song.all.each_with_index{|inst, indx| puts "#{indx+1}. #{inst.artist.name} - #{inst.name} - #{inst.genre.name}"}
        when "list artists"
          Artist.all.each{|inst| puts "#{inst.name}"}
        when "list genres"
          Genre.all.each{|inst| puts "#{inst.name}"}
        when "play song"
          puts "Which song # would you like to play?"
          resp_2 = gets.rstrip.to_i
          puts "Playing #{Song.all[resp_2 - 1].artist.name} - #{Song.all[resp_2 - 1].name} - #{Song.all[resp_2 - 1].genre.name}"
        when "list artist"
          magically_lists_artists
        when "list genre"
          magically_lists_genres
        when "exit"
          puts "Done."

      end  #case
    end  #while
  end #def call

  def magically_lists_artists
    puts "Which artist's songs would you like to look-up?"
    resp_2 = gets.rstrip.downcase
    @sg = []
    Song.all.each do |inst|
      if inst.artist.name.downcase == resp_2
        @sg << inst.artist.name
        @sg << inst.name
        @sg << inst.genre.name
        puts "#{@sg[-3..-1].join(" - ")}"
      end
    end
  end

  def magically_lists_genres
    puts "Which genre's songs would you like to look-up?"
    resp_2 = gets.rstrip.downcase
    @g = []
    puts "#{resp_2}"
    Song.all.each do |inst|
      if inst.genre.name.downcase == resp_2
        @g << inst.artist.name
        @g << inst.name
        @g << inst.genre.name
        puts "#{@g[-3..-1].join(" - ")}"
      end
    end
  end

end

