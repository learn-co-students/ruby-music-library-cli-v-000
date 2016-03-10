require 'pry'
class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

 def call
    input = ""
  while input != "exit"
     # puts "Welcome to Your Music Library!"
     # puts "What would you like to do?"
      input = gets.strip

    case input
      
      when "list songs"
      binding.pry
       list_songs
      when "list artists"
       list_artists
      when "list genres"
      list_genres
      when "play a song"
      play_song
      when "list artist's songs"
      list_artist_songs
      when "list genre's songs"
      list_genre_songs
    end
  end
end


  def list_songs
    #binding.pry
    Song.all.each_with_index do |song, index|
      #binding.pry
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      #binding.pry
      # puts "#{i+1}. #{list_artists} - #{s.name} - #{list_genres}"
    end
  end


  def list_artists

    Artist.all.each.with_index do |a, i|
      puts "#{i+1}. #{a.name}"
      end
  end

  def list_genres
     Genre.all.each.with_index do |g, i|
      puts "#{i+1}. #{g.name}"
      end
  end

end