class MusicLibraryController
  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(@path).import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    choice = gets.strip
    until choice == "exit"
      choice = gets.strip
    end
  end
  
  def list_songs
    sorted = Song.all.sort_by{|song| song.name}
    sorted.each_with_index{|song,i| 
        puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      }
    #need to sort by the song name
  end
  
  def list_artists
    sorted = Artist.all.sort_by{|artist| artist.name}
    sorted.each_with_index{|artist,i| 
        puts "#{i + 1}. #{artist.name}"
      }
  end
  
  def list_genres
    sorted = Genre.all.sort_by{|genre| genre.name}
    sorted.each_with_index{|genre,i| 
        puts "#{i + 1}. #{genre.name}"
      }
  end
  
  def list_songs_by_artist
    allchoices = nil
    while allchoices == nil 
      puts "Please enter the name of an artist:"
      choice = gets.strip
      allchoices = Song.all.select{|song| song.artist.name == choice}
    end
    #binding.pry
    sorted = allchoices.sort_by{|song| song.name}
    sorted.each_with_index{|song,i| 
        puts "#{i + 1}. #{song.name} - #{song.genre.name}"
      }
  end
  
  def list_songs_by_genre
    allchoices = nil
    while allchoices == nil 
      puts "Please enter the name of a genre:"
      choice = gets.strip
      allchoices = Genre.all.select{|genre| genre.name == choice}
    end
    binding.pry
    sorted = allchoices.sort_by{|genre| genre.songs.name}
    sorted.each_with_index{|genre,i| 
        puts "#{i + 1}. #{song.artist.name} - #{song.name}"
      }
  end
end