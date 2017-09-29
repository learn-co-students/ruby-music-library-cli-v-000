require_relative "../concerns/findable_module.rb"

class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path 
    MusicImporter.new(path).import
  end

  def list_songs
    counter = 1
    Song.all.each do |p|
      puts "#{counter}. #{p.artist.name} - #{p.name} - #{p.genre.name}"
      counter +=1
      end
  end

  def list_artists
    Artist.all.each {|i| puts i.name}
  end

  def list_genres
    Genre.all.each {|i| puts i.name}
  end

def call

    puts "Okay you dingus, what you going to do?\n
    ***> list songs\n
    ***> list artists\n
    ***> list genres\n
    ***> play song\n
    ***> list artist\n
    ***> list genre\n
    ***> exit
      
    end"
    input = gets.chomp
    case input
    when "list songs"
      list_songs
      self.call
    when "list artists"
      list_artists
      self.call
    when "list genres"
      list_genres
      self.call
    when "play song"
      selection = 0
      puts "Make a selection:"
      list_songs
      selection = gets.to_i
      j = Song.all[selection - 1]
      puts "Playing #{j.artist.name} - #{j.name} - #{j.genre.name}"
      self.call
    when "list artist"
      selection = ""
      puts "Make a selection:"
      list_artists
      selection = gets.chomp
      Song.all.each do |s|
        if s.artist.name = selection
          puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
        end
      end
      self.call
    when "list genre"
      selection = ""
      puts "Make a selection:"
      list_genres
      selection = gets.chomp
      Song.all.each do |s|
        if s.genre.name = selection
          puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
        end
      end
      self.call
    when "exit"
      return
    else
      puts "that's not a cool thing, brother.  Try that again."
      self.call
    end
  end
end