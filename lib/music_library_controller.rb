require 'pry'
class MusicLibraryController

def initialize(path = "./db/mp3s")
  obj = MusicImporter.new(path)
  @newobj = obj.import
end

def call
   response = ""
  while (response != "exit")

  puts "Please Enter Input"
  response =  gets.strip
  case response
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
      when "exit"
        puts "Exiting program"
        exit
            end
end
end


def songs
Song.all.each{|song| song.name}
end

def artists
  Artist.all.each{|artist| artist.name}
      end

def genres
Genre.all.each{|genre| genre.name}
end

def list_artist

end

end
#binding.pry
