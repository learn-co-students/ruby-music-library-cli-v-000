class MusicLibraryController
  
attr_accessor :userinput, :newimporter

def initialize(path='./db/mp3s')
  @newimporter = MusicImporter.new(path)
  @newimporter.import
end
  
def call 
  until @userinput == "exit"
    puts "Welcome to your music library!" 
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    @userinput = gets.chomp
  
  
  if @userinput == "list songs"
    list_songs
  elsif @userinput == "list artists"
    list_artists
  elsif @userinput == "list genres"
    list_genres
  elsif @userinput == "list artist"
    list_songs_by_artist
  elsif @userinput == "list genre"
    list_songs_by_genre
  elsif @userinput == "play song"
    play_song
  else 
    nil
  end
end
end 

# get userinput3
#   if userinput3 == "list songs"
#     list_songs
#   elsif userinput3 == "list artists"
#     list_artists
#   elsif userinput3 == "list genres"
#     list_genres
#   elsif userinput3 == "list artist"
#     list_songs_by_artist
#   elsif userinput3 == "list genre"
#     list_songs_by_genre
#   elsif userinput3 == "play song"
#     play_song
#   else 
#     nil
#   end
# end
  

def list_songs
  number = 0
  Song.all.sort_by!{ |m| m.name }
  Song.all.each do |item|
    number = number + 1
    puts "#{number}. #{item.artist.name} - #{item.name} - #{item.genre.name}"
  end
end


def list_artists
  newarray = []
  number = 0
  Artist.all.sort_by!{ |m| m.name }
  Artist.all.each do |item|
    if !newarray.include?(item.name)
      newarray << item.name
    end
  end
  newarray.each do |item|
    number = number + 1
    puts "#{number}. #{item}" 
  end
end

 
def list_genres
  newarray1 = []
  number = 0
  Genre.all.sort_by!{ |m| m.name }
  Genre.all.each do |item|
    if !newarray1.include?(item.name)
      newarray1 << item.name
    end
  end
  newarray1.each do |item|
    number = number + 1
    puts "#{number}. #{item}" 
  end
end 


def list_songs_by_artist
  newarray2 = []
  number = 0
  puts "Please enter the name of an artist:"
  artistpicked = gets.chomp
  Song.all.sort_by!{ |m| m.name }
  Song.all.each do |item|
    if item.artist.name == artistpicked
      newarray2 << item.name
      number = number + 1
      puts "#{number}. #{item.name} - #{item.genre.name}"
    end
  end
end
 
def list_songs_by_genre
  newarray2 = []
  number = 0
  puts "Please enter the name of a genre:"
  genrepicked = gets.chomp
  Song.all.sort_by!{ |m| m.name }
  Song.all.each do |item|
    if item.genre.name == genrepicked && !newarray2.include?(item.genre.name)
      newarray2 << item.name
      number = number + 1
      puts "#{number}. #{item.artist.name} - #{item.name}"
    end
  end
end 

def play_song
  puts "Which song number would you like to play?"
  songpicked = gets.chomp
  newarray2 = []
  number = 0
  Song.all.sort_by!{ |m| m.name }
  Song.all.each do |item|
      newarray2 << item
  end
  if songpicked.to_i <= newarray2.count.to_i && songpicked.to_i > 0
    songlocationinarray = songpicked.to_i - 1
    songtheychose = newarray2[songlocationinarray]
    puts "Playing #{songtheychose.name} by #{songtheychose.artist.name}"
  end
end




end

# @userinput2 = gets.chomp
# if @userinput2 == "list songs"
#   list_songs
# end

