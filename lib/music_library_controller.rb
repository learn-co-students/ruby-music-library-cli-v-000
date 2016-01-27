class MusicLibraryController
  

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end


  def call
    input=""
    while input != "exit"
      puts "Welcome to Your Music Library!"
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
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song
      end
    end
  end


  def songs
    Song.all.each_with_index do |s,i|
      puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def artists
    Artist.all.each {|a| puts "#{a.name}"}
  end
 
  def genres
    Genre.all.each {|g| puts "#{g.name}"}
  end

  def play_song
    Song.all.each_with_index do |s,i|
      puts "Playing #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artist
    Artist.all.each {|a| 
       a.songs.each{|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
     }
  end

  def list_genre
    Genre.all.each {|g| 
       g.songs.each{|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
     }
   end

end
