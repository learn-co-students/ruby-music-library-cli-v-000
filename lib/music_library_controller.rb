class MusicLibraryController
  @@song_list = []

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
    @song_list = []
  end

  def call
    input = ""
    options = ["list songs" , "list artists", "list genres" , "list artist" , "list genre" , "play song" , "exit"]
    while input != "exit"
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

      input = gets.strip

      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end


    def update_song_list
      Song.all.each do |s|
        if !@@song_list.include?(s)
          @@song_list << s
          @song_list << s
        end
      end
    end


    def list_artists
      artist_list = Artist.all.sort_by! { |obj| obj.name }
      counter = 1
      artist_list.each do |a|
        puts "#{counter}. #{a.name}"
        counter += 1
      end
    end

    def list_genres
      genre_list = Genre.all.sort_by! { |obj| obj.name }
      counter = 1
      genre_list.each do |g|
        puts "#{counter}. #{g.name}"
        counter += 1
      end
    end

    def list_songs
      self.update_song_list
      @song_list.sort_by! { |obj| obj.name }
      counter = 1
      @song_list.each do |s|
        puts "#{counter}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
        counter += 1
      end
    end


    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      input = gets.strip
      if Artist.find_by_name(input)
        selected_artist = Artist.find_by_name(input)

        self.update_song_list
        @song_list.sort_by! { |obj| obj.name }
        song_list = []
        @song_list.each do |s|
          song_list << s if s.artist.name == input
        end

        counter = 1

        song_list.each do |s|
          puts "#{counter}. #{s.name} - #{s.genre.name}"
          counter += 1
        end
      end
    end


    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      input = gets.strip
      if Genre.find_by_name(input)
        selected_genre = Genre.find_by_name(input)

        self.update_song_list
        @song_list.sort_by! { |obj| obj.name }
        song_list = []
        @song_list.each do |s|
          song_list << s if s.genre.name == input
        end

        counter = 1

        song_list.each do |s|
          puts "#{counter}. #{s.artist.name} - #{s.name}"
          counter += 1
        end
      end
    end


    def play_song
      puts "Which song number would you like to play?"
      input = gets.strip
      answer = input.to_i
      answer -= 1

      if answer >= 0
        alphabetical_song_list = []
        self.update_song_list
        @song_list.sort_by! { |obj| obj.name }
        @song_list.each do |s|
          alphabetical_song_list << "#{s.artist.name} - #{s.name} - #{s.genre.name}"
        end

        if answer < alphabetical_song_list.length
          selected_song = alphabetical_song_list[answer].split(" - ")
          puts "Playing #{selected_song[1]} by #{selected_song[0]}"
        end
      end
    end

end
end
