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
    path=""
    while path != "exit"
        path = gets
        if path =='list songs'
        self.list_songs
      elsif path =='list artists'
        self.list_artists
      elsif path =='list genres'
        self.list_genres
      elsif path =='list artist'
        self.list_songs_by_artist
      elsif path =='list genre'
        self.list_songs_by_genre
      elsif path == 'play song'
        self.play_song
      else
      end

    end

  end

  def list_songs
    i = 0
    narr = Song.all.sort do
          |sone, stwo| sone.name <=> stwo.name
        end
    #    binding.pry

    narr.each do
      |song| puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      i +=1
    end

  end

  def list_artists
    i = 0
    narr = Artist.all.sort do
          |sone, stwo| sone.name <=> stwo.name
        end
    #    binding.pry

    narr.each do
      |song| puts "#{i+1}. #{song.name}"
      i +=1
    end
  end

  def list_genres
    i = 0
    narr = Genre.all.sort do
          |sone, stwo| sone.name <=> stwo.name
        end
    #    binding.pry

    narr.each do
      |song| puts "#{i+1}. #{song.name}"
      i +=1
    end
  end

  def list_songs_by_artist

    puts("Please enter the name of an artist:")
    @artist_n = gets
    i = 0
    narr = Song.all.sort do
          |sone, stwo| sone.name <=> stwo.name
        end
    #    binding.pry

    narr.each do
      |song| if song.artist.name == @artist_n
      puts "#{i+1}. #{song.name} - #{song.genre.name}"
      i +=1
      end
    end

  end

    def list_songs_by_genre

      puts("Please enter the name of a genre:")
      @genre_n = gets
      i = 0
      narr = Song.all.sort do
            |sone, stwo| sone.name <=> stwo.name
          end
      #    binding.pry

      narr.each do
        |song| if song.genre.name == @genre_n
        puts "#{i+1}. #{song.artist.name} - #{song.name}"
        i +=1
        end
      end
    end

    def play_song

      puts("Which song number would you like to play?")
      @song_n = gets
      i = 0
      narr = Song.all.sort do
            |sone, stwo| sone.name <=> stwo.name
          end

      if @song_n.to_i >0 && @song_n.to_i < narr.length
          #binding.pry
      puts("Playing #{narr[@song_n.to_i-1].name} by #{narr[@song_n.to_i-1].artist.name}")
      end
    end
end
