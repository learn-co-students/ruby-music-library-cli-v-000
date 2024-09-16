require 'pry'
class MusicLibraryController
extend Concerns::Findable
  def initialize(path = './db/mp3s')
    # musicimp = MusicImporter.new(path)
    # musicimp.import
    MusicImporter.new(path).import

  end
  def list_songs
        j = 1
        #primero ordeno luego acceso sobre el resultado
        Song.all.sort_by{|val| val.name}.each { |e|
           puts "#{j}. #{e.artist.name} - #{e.name} - #{e.genre.name}"
            j = j+1
         }

  end
  def list_artists
        z = 1
        #primero ordeno luego acceso sobre el resultado
        Artist.all.sort_by{|val| val.name}.each { |e|
           puts "#{z}. #{e.name}"
           z = z+1
         }
  end
  def list_genres
        l = 1
        #primero ordeno luego acceso sobre el resultado
        Genre.all.sort_by{|val| val.name}.each { |e|
           puts "#{l}. #{e.name}"
           l = l+1
         }
  end
  def list_songs_by_artist

          puts "Please enter the name of an artist:"
          input = gets.chomp
          p=1
          if  Artist.find_by_name(input) != nil
              artist = Artist.find_by_name(input)
              artist.songs.sort_by {|son| son.name}.each {|i|
              puts "#{p}. #{i.name} - #{i.genre.name}"
              p=p+1
          }

          else
          end

  end
  def list_songs_by_genre
         puts "Please enter the name of a genre:"
         input = gets.chomp
         z = 1
        if  Genre.find_by_name(input) != nil
            genre = Genre.find_by_name(input)
            genre.songs.sort_by{|son| son.name}.each { |i|
            puts "#{z}. #{i.artist.name} - #{i.name}"
            z=z+1
             }
        else
        end
  end
  def play_song
    puts  "Which song number would you like to play?"
    input = gets.chomp

    totnumber = Song.all.sort_by{|val| val.name}.length
    if  input.to_i < totnumber && input.to_i > 0
         song = Song.all.sort_by{|val| val.name}[input.to_i-1].name
         artist = Song.all.sort_by{|val| val.name}[input.to_i-1].artist.name

         puts "Playing #{song} by #{artist}"

    end

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
    input = " "
    i = 0
     while input = ' ' && i <4
        input = gets.chomp
        i = i +1
     end
     case input
     when 'list songs'
      #  self.list_songs
       self.send(:list_songs)
     when 'list artists'
       self.list_artist
     when 'list genres'
       self.list_genres
     when 'list artist'
       self.list_songs_by_artist
     when 'list genre'
       self.list_songs_by_genre
     when 'play song'
       play_song
     when 'exit'
       return
     else
        call
     end


  end
end
