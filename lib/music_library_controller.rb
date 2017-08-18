require 'pry'
class MusicLibraryController   

  
  def initialize(path = './db/mp3s')
     MusicImporter.new(path).import
  end
  
  def call
    input = ""
    while input != "exit"
      input = gets.strip
      case input
        when "list songs"
          songs
          when "list artists"
            artists
            when "list genres"
              genres
              when "play song"
                play_song
                when "list artist"
                  songs
                  when "list genre"
                    list_genre
      end
    end
  end
  
  def songs
    sorted_songs.each_with_index do |s,i| 
    puts "#{ i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end
  
  def sorted_songs
    Song.all.sort do |x, y|
      if x.artist.name == y.artist.name
        x.name <=> y.name
      else
        x.artist.name <=> y.artist.name
      end
    end
  end
  
  def artists 
      Artist.all.each{ |artist| puts artist.name}
  end
  
  def genres
    Genre.all.each{|genre| puts genre.name}
  end
  
  def play_song
    puts "What song number would you like to listen to?"
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each do |s|
        puts s
      end
    end

  end
  
  
  def list_genre
   
  end

end

