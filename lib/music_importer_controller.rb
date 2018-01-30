class MusicLibraryController



  def initialize(path = "./db/mp3s")
    @path = path
    importer = MusicImporter.new(@path)
    importer.import
  end

  def call
    input = ""

      while input != "exit"
        input = gets.chomp

        if input == "list songs"
          list_songs


        elsif input == "list artists"
          list_artists


        elsif input == "list genres"
          list_genres

        elsif input == "play song"
          play_song

        elsif input == "list artist"
          list_artist_songs

        elsif input == "list genre"
          list_genre_songs
        end
      end
  end


    ##helper methods, etc

    def list_songs
      Song.all.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end

    def list_artists
      instance_array = Artist.all
      name_array = instance_array.collect {|instance| instance.name}
      name_array.each {|name| puts "#{name}"}
    end

    def list_genres
      instance_array = Genre.all
      name_array = instance_array.collect {|instance| instance.name}
      name_array.each {|name| puts "#{name}"}
    end




    def play_song
      input = gets.chomp.to_i
      song_instance_array = Song.all
      @songs_sorted = song_instance_array.sort { |a, b| (a.artist.name <=> b.artist.name) }
      song = @songs_sorted[input - 1]
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end

    def list_artist_songs
      input = gets.chomp
      Song.all.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" if song.artist.name == input }
    end

    def list_genre_songs
      input = gets.chomp
      Song.all.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" if song.genre.name == input }
    end







end
