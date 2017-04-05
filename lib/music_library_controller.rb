class MusicLibraryController
  attr_accessor :path
  attr_reader :response

  def initialize(path='./db/mp3s')
    self.path = path
    MusicImporter.new(path).import
  end

  def call
    response = ''
    while response != 'exit'
      "Welcome to your music library..."
      "What would you like to do?"
      response = gets.chomp
      case response
      when "list songs"
        "Listing songs"
      when "list artists"
        artists
      when "list genres"
        genres
      when "list artist"
        songs_by_artist
      when "list genre"
        "Listing all songs in this genre"
      when "play song"
        "Playing song"
      else
        "See you later!"
      end
    end
  end

  def artists
    Artist.all.each do |a|
      puts "#{a.name}"
    end
  end

  def genres
    Genre.all.each do |g|
      puts "#{g.name}"
    end
  end

  def songs_by_artist
    puts "Which artist would you like to see?"
    art
  end
end

#  def response
#    puts "Would you like to (a) continue or (b) exit?"
#    response = gets
#    response == 'exit' ? true : false
#  end
#end

#MusicImporter.new(path).import
