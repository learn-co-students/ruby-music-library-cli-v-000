# require 'pry'


class MusicLibraryController
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

def call
  answer = ""

  while answer != "exit"
    puts "\n\n"
    list = ["List Songs- View all Songs", "List Artists - View all artists", "List Genres- View all genres", "Play Song - select a song to play", "Artist - View songs by an artist", "Genre - view songs by genre"]
    puts "Welcome to your music library"
    puts "Enter one of the actions or enter 'exit'"
    puts "---------Choose one of the options below by name or number-------"
    puts "\n" 
    list.each do |name|
    puts "#{name}"
  end  
  puts "\n\n"
  puts "Enter name here: "


    answer = gets.strip.upcase
    puts "\n\n"
    puts "----------------Choose from below--------------"

    exit if answer == "EXIT"

    case answer
    when "LIST SONGS"
      list_songs

    when "LIST ARTISTS"
      list_artists
    when "LIST GENRES"
      list_genres

    when "PLAY SONG"
      play
    # when "LIST ARTIST"
    when "GENRE"
      genre

    when "ARTIST"
      artist
  end 
  end
end 
end 

def again?
    puts "Would you like to go back to the main menu? Enter (Y/N)"
    answer = gets.strip.upcase
    if answer == "Y"
      call
    elsif answer == "N"
      puts "Come back whenever to look at your Jams!"
      exit
    else
      puts "Please enter (Y/N)"
     again?    end
  end 

   def format_song(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end 



def list_songs
 Song.all.each_with_index do |song, index|
    puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
  again?
end 

def list_artists
    Artist.all.each do |artist|
      puts artist.name
    end 
     again?
end 

def play
   Song.all.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    puts "Enter the number for the song you want to play: "
    input= gets
    Song.all.each_with_index do |song, index|
      if index+1 == input.to_i 
        puts "-------"
        puts "Playing: " + format_song(song)
        puts " ------"
      end
    end 
    again?
end 

def list_genres
 Genre.all.each do |type| 
    puts type.name
  end 
    again?
end 

def artist
  Artist.all.each do |person|
    puts person.name
  end 
  puts "Choose an artists and retrieve their songs!"
  artist_input = gets.strip.downcase
  puts"\n\n\n"
  puts "***********SONGS************"

    Artist.all.each do |artist|
      if artist_input == artist.name.downcase
        artist.songs.each do |song|
        puts "#{song.name}"
        end
      end  
    end 
      puts "\n\n"
      again?
end 

def genre
  Genre.all.each do |type| 
    puts type.name
  end 
    puts "What genre by name you like to list songs for?"
    genre_input = gets.strip.downcase
    puts "\n\n\n"
    puts "*************SONGS*****************"
    if genre = Genre.find_by_name(genre_input.downcase)
      # binding.pry
      genre.songs.each {|s| puts "#{s.name}"} 
    puts "\n\n"
    again?
end



 
end 
  






#   def call
  #   list = ["List Songs", "List Artists", "List Genres", "Play Song", "List Artist", "List Genre"]
  #   puts "Welcome to your music library"
  #   puts "Choose one of the options below by name or number " 
  #   list.each.with_index do |name, i|
  #   puts "#{i+1}. #{name}"
  # end 
#   puts "exit"
#   input = gets.strip.upcase

#     until input == 'EXIT'

#       case input
#       when "LIST SONGS" 
#         Song.all.each_with_index do |song, index|
#           puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
#         end
#         again?

#       when "LIST ARTISTS" 
#         Artist.all.each do |artist|
#           puts artist.name
#         end 
#         again?

#       when "LIST GENRES" 
#         Genre.all.each do |type| 
#           puts type.name
#         end 
#         again?
      
#       when "PLAY SONG"
#         Song.all.each_with_index do |song, index|
#           puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
#         end
#         puts "which song would you like to play?"
#         input= gets
#         Song.all.each_with_index do |song, index|
#           if index+1 == input.to_i 
#             puts "Playing " + format_song(song)
#           end
#         end 
#         again?

#       when "LIST ARTIST" 
#         Artist.all.each do |artist|
#           puts artist.name
#         end 
#           puts "Please choose an artist's name."
#           choice = gets.strip.split(" ").each {|word| word.capitalize!}
#           choice = choice.join(" ")
#           Findable.find_or_create_by_name(choice).songs.each {|song| song.print}
#         again?

#       when "LIST GENRE" 

#     list_genres
#     puts "\nEnter a genre:"
#     genre_name = gets.strip.downcase
    
#     genre_songs = [] 
#     Song.all.each do |song|
#       genre_songs << song if song.genre.name.downcase == genre_name 
#     end

#     if genre_songs == []
#       puts "\nGenre not found"
#     else
#       puts "\n#{genre_name.capitalize} Songs:\n\n"
#       print_songs(genre_songs)
#     end
#   end

#         again?
#       end
#     end
#    end 

#   def again?
#     puts "would you like to go back to the main menu? Enter (Y/N)"
#     answer = gets.strip.upcase
#     if answer == "Y"
#       call
#     elsif answer == "N"
#       puts "Come back whenever to look at your Jams!"
#       exit
#     else
#       puts "Please enter (Y/N)"
#       again?
#     end
#   end 
  

#   def format_song(song)
#     "#{song.artist.name} - #{song.name} - #{song.genre.name}"
#   end
# end 




