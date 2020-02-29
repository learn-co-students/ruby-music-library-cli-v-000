class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
    # call
  end

  def call
    answer = ""
     while answer != "exit" do
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    answer = gets.chomp
  #  while answer != "exit" do
      if answer == "list songs"
      list_songs
     elsif answer == "list artists"
       list_artists
     elsif answer == "list genres"
       list_genres
     elsif answer == "list artist"
       list_songs_by_artist
     elsif answer == "list genre"
       list_songs_by_genre
     elsif answer == "play song"
       play_song
      end
    end
  end

def list_songs
  i = 1
  song_list = Song.all.sort_by {|song| song.name }
  song_list.each do |e| puts "#{i}. #{e.artist.name} - #{e.name} - #{e.genre.name}"
    i +=1
  end
end


def list_artists
  i = 1
  artists_list = Artist.all.sort_by {|artist| artist.name }
  artists_list.each do |e| puts "#{i}. #{e.name}"
    i +=1
  end
end

def list_genres
  i = 1
  genres_list = Genre.all.sort_by {|genre| genre.name }
  genres_list.each do |e| puts "#{i}. #{e.name}"
    i +=1
  end
end

def list_songs_by_artist
  i = 1
  puts "Please enter the name of an artist:"
name_of_artist = gets.chomp
artist_1 = Artist.find_by_name(name_of_artist)

if artist_1
song_list = artist_1.songs.sort_by {|song| song.name }
# binding.pry
song_list.each do |e| puts "#{i}. #{e.name} - #{e.genre.name}"
     i +=1
   end
 end
end

def list_songs_by_genre

  i = 1
  puts "Please enter the name of a genre:"
  name_of_genre = gets.chomp
  genre_1 = Genre.find_by_name(name_of_genre)

      if genre_1
  song_by_genre = genre_1.songs.sort_by {|song| song.name }
  song_by_genre.each do |e| puts "#{i}. #{e.artist.name} - #{e.name}"
    i +=1
        end
      end
    end

    def play_song

      puts "Which song number would you like to play?"
      selected_song = gets.chomp
      song_num = selected_song.to_i - 1
      song_list = Song.all.sort_by {|song| song.name }
      #binding.pry
      if  song_num <= song_list.size && selected_song.to_i != 0
      song = song_list[song_num]

      if song
     puts "Playing #{song.name} by #{song.artist.name}"
        end
      end
    end

 #list_songs
#  list_artists
#  list_genres
#  list_songs_by_artist
#  list_songs_by_genre


end
