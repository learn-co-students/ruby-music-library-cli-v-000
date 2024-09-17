
class MusicLibraryController
        attr_accessor :path

    def initialize(path ='./db/mp3s')
        @path = path
        MusicImporter.new(path).import


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

    #      #gets calls a function to allow the CLI to receive user input
          input = ""
          while input != "exit"
              input = gets.strip #.chomp is used at times. .chomp takes an optional argument that allows you to use the argument and remove it form the string
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
    end
    def list_songs
      #each with index returns the value = s with the index = n
      sorted_songs = Song.all.sort_by{|song| song.name}
        #this can also be written as....    sorted_songs = Song.all.sort_by(&:name)
      sorted_songs.each.with_index(1) { |s,i| puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
    end
    def list_artists
      sorted_artists = Artist.all.sort_by{|artist| artist.name}.uniq
      sorted_artists.each.with_index(1) { |a,i| puts "#{i}. #{a.name}"}
      #Artist.all.each.with_index(1) {|a,n| puts "#{n}. #{a.name}"}
    end
    def list_genres
      #below "(&:name)" is the same context as "{|genre| genre.name}"
      sorted_genres = Genre.all.sort_by(&:name).uniq
      sorted_genres.each.with_index(1) {|g,i| puts "#{i}. #{g.name}"}
    end
    def list_songs_by_artist
        #lets talk to user
        puts "Please enter the name of an artist:"
        #lets have the user put input into cli
        artist_input = gets.strip
        #lets create a variable if the users input is a name variable(find_by_name is a method that belongs to classes) for the Artist class
        if artist = Artist.find_by_name(artist_input)
            sorted_songs = artist.songs.sort_by(&:name)
            sorted_songs.each.with_index(1) {|s,i| puts "#{i}. #{s.name} - #{s.genre.name}"}
        end
    end
    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre_input = gets.strip
        if genre = Genre.find_by_name(genre_input)
            sorted_songs = genre.songs.sort_by(&:name)
            sorted_songs.each.with_index(1) {|s,i| puts "#{i}. #{s.artist.name} - #{s.name}"}
        end
    end
    def play_song
        puts "Which song number would you like to play?"
        sorted_songs = Song.all.sort_by{|song| song.name}
        #array_of_songs = list_songs
        user_input = gets.strip
        # (1, 2,3).include?(6)
        if (1..sorted_songs.count).include?(user_input.to_i)
              song_name = sorted_songs[user_input.to_i - 1].name
              song_artist = sorted_songs[user_input.to_i - 1].artist.name
              puts "Playing #{song_name} by #{song_artist}"

        end

        # number -1 = index
        #take a number, do not except anything else

  #      puts "Playing Song"
  #      if song = self.list_songs.find_by_name(user_input)
  #          puts "#{song}. #{song.artist.name} - #{song.name}"
  #      end
    end
end



#  rspec spec/011_music_library_cli_methods_spec.rb
# load "config/environment.rb"


#        load "config/environment.rb"
#        mlc = MusicLibraryController.new("./spec/fixtures/mp3s")
#        mlc.play_song
