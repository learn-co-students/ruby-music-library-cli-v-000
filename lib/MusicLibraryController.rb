class MusicLibraryController

def initialize(path = "./db/mp3s")
  @path =path
  MusicImporter.new(path).import
  #menu
end


def call
ch = ""
while ch != "exit"
puts "-----start---------"
puts "list songs"
puts "list artists"
puts "list genres"
puts "play song"
puts "list artist"
puts "list genre"
puts "exit"
puts "-----end---------"
ch = gets.chomp
case ch
   when "list songs"
     lists
   when "list artists"
     artists
   when "list genres"
     genres
   when "play song"
      play
    when "list artist"
        artist
    when "list genre"
        genre
end
end
end

def lists
  s=Song.all
s.each_with_index do |song, index|
  puts (index+1).to_s + ". " + song.artist.name + " - " + song.name + " - " + song.genre.name
end
end

def play
  n= gets.chomp
  s=Song.all
  n1 = n.to_i
s.each_with_index do |song, index|
  if index+1 == n1
  puts  "++++--Playing " + song.artist.name + " - " + song.name + " - " + song.genre.name
end
end
end

def artist
  n = gets.chomp
  artists = Artist.all

artist = artists.select  do |artist| artist.name == n end

  artist[0].songs.each do |song|
puts artist[0].name + " - " + song.name + " - " + song.genre.name
  end
end

def genre
n = gets.chomp
genres = Genre.all
genre = genres.select  do |genre| genre.name == n end
genre[0].songs.each do |song|
puts song.artist.name + " - " + song.name + " - " + genre[0].name
end
end



def artists
  s=Artist.all
s.each do |artist|
  puts artist.name
end
end

def genres
  s=Genre.all
s.each do |genre|
  puts genre.name
end
end
end
