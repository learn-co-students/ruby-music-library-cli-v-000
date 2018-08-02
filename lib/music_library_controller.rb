class MusicLibraryController

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

         }

  end
  def list_artists
        # z = 1
        # #primero ordeno luego acceso sobre el resultado
        # Artist.all.sort_by{|val| val.name}.each { |e|
        #    puts "#{z}. #{e.name}"
        #    z = z+1
        #  }
  end
  def list_genres
        # l = 1
        # #primero ordeno luego acceso sobre el resultado
        # Genre.all.sort_by{|val| val.name}.each { |e|
        #    puts "#{j}. #{e.name}"
        #    l = l+1
        #  }
  end
  def list_songs_by_artist
    # puts "Please enter the name of an artist:"
    # input = gets.chomp
    # p=1
    # Song.all.sort_by{|val| val.name}.select { |song|
    #       puts "#{p}. #{song.name} - #{song.genre.name}" if song.artist.name == input
    #       p = p + 1
    #     }
    # Song.all.select {|s| s.artist.name  =  input}.sort_by{|val|
    #   val.name
    #   puts "#{j}. #{val.name} - #{val.genre.name}"
    #     j += 1
    #  }

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
       self.list_songs
     when 'list artists'
       self.list_artist
     when 'list genres'
       self.list_genres
     when 'list artist'
       self.list_songs_by_artist
     when 'list genre'
     else 'play song'
     end


  end
end
