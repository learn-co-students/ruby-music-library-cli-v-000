require 'pry'

class MusicLibraryController

def initialize(path="./db/mp3s")
  @path = path
  filez = MusicImporter.new(path)
  filez.import
end

def call
    input = ""
    while input != "exit"
      puts "Would you like to list songs, list artists, list genres, play songs, or exit?"
      input = gets.chomp
          if input == "list songs"
            songs
          elsif input == "list artists"
            artists
          elsif input == "list genres"
            genres
          elsif input == "play song"
            Song.all.map do |song|
              puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
                end
          elsif input == "list artist"
            puts "which artist?"
            response = gets.chomp
            songs_by_artist(response)
          elsif input == "list genre"
            puts "which genre?"
            response = gets.chomp
            songs_by_genre(response)
          end

    end
end

def songs
  Song.all.each_with_index do |song,index|
    puts "#{index +1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
end

def artists
  Artist.all.collect do |x|
    puts x.name
  end
end

def genres
  Genre.all.collect do |x|
    puts x.name
  end
end

def songs_by_artist(response)
  Artist.all.collect do |x|
    if x.name == response
      x.songs.each do |z|
      puts "#{response} - #{z.name} - #{z.genre.name}"
      end 
    end
  end
end

def songs_by_genre(response)
  Song.all.collect do |x|
    if x.genre.name == response
      puts "#{x.artist.name} - #{x.name} - #{x.genre.name}"
    end
  end
end

end
