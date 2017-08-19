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
    Song.all.sort_by! do |a|
       a.artist.name
    end
     song_number = gets.strip.to_i - 1
     puts "Playing #{Song.all[song_number].artist.name} - #{Song.all[song_number].name} - #{Song.all[song_number].genre.name}"
  end

  
  # take the input and iterate thru the Genre with find by name to find the same genre. Then iterate thru the Genre songs to puts them out
  def list_genre
       genre = gets.chomp
     Genre.all.each do |a|
       if a.name == genre
         a.songs.collect { |s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" }
       end
     end
  end
  
      #class end 
end
   



