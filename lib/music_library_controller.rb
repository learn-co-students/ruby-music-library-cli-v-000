require 'pry'
class MusicLibraryController
    
    attr_accessor :imports

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    @imports = importer.import
  end

  def call
    input = ""
    while input != "exit"
    puts "Welcome to your music library!"
    puts "What would you like to do?"
    input = gets.strip
      case input
      when "list songs"
        songs 
      when "list artists"
        artists 
      when "list genres"
        genres   

      when "list artist"
        puts "Which artist"
        input = gets.strip
        list_artist(input) 
      
      when "list genres"
        puts "Which genre"
        input = gets.strip
        list_genre(input)
      
      when "play song"
        play_song
      end
    end   
  end 


  def songs
    @songs = @imports.sort!.map {|song| song.gsub(".mp3", "")}
    songs = @songs.each_with_index {|s, i| puts "#{i+1}. #{s}"}
  end  

  def artists
    @artists = @imports.sort!.map {|song| song.split(" _ ")}
    artists = @artists.each {|artist| puts "#{artist[0]}"}
  end    

  def genres
    @genres = @imports.sort!.map {|song| song.gsub(".mp3", "").split(" - ")}
    genres = @genres.each {|genre| puts "#{genre[2]}"}
  end  

  def play_song
    @songs = @imports.sort!.map { |song| song.gsub(".mp3","")}
    songs = @songs.each { |song|  puts "Playing #{song}"}
  end


  def list_artist
    puts "Which artist's songs do you want a list of?"
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each{|song| puts song.name}
    end
  end
end





