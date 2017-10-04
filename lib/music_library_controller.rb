class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    path_import = MusicImporter.new(path)
    path_import.import
  end

  def call
          input = ""
          puts "Welcome to your music library!"

          until input == "exit"
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
                  when 'list songs'
                    list_songs
                  when 'list artists'
                    list_artists
                  when 'list genres'
                     list_genres
                   when 'list artist'
                     list_songs_by_artist
                  when 'list genre'
                    list_songs_by_genre
                  when 'play song'
                    play_song
                  end
          end
  end

  def list_songs
    sorted_songs =   Song.all.sort_by { |s| s.name }
    i = 0
    sorted_songs.each { |s| puts "#{i += 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end

  def list_artists
    sorted_artists = Artist.all.sort_by {|a| a.name}
    i = 0
    sorted_artists.each {|obj| puts "#{i += 1}. #{obj.name}"} #{obj.songs[0].name} - #{obj.songs[0].genre.name}"} /*/// oops.. tried to add songs and genres /////*/
  end

  def list_genres
    sorted_genres = Genre.all.sort_by {|g| g.name}
    i = 0
    sorted_genres.each {|g| puts "#{i += 1}. #{g.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if Artist.find_by_name(input)
      artist= Artist.find_by_name(input)
      array = artist.songs.sort { |a, b| a.name <=> b.name }
      array.each_with_index do |val,index|
        puts "#{index+1}. #{val.name} - #{val.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if Genre.find_by_name(input)
    genre= Genre.find_by_name(input)
    array = genre.songs.sort { |a, b| a.name <=> b.name }
      array.each_with_index do |val,index|
        puts "#{index+1}. #{val.artist.name} - #{val.name}"
      end
    end
  end

      def play_song
        puts "Which song number would you like to play?"
        list = Song.all.sort_by {|x| x.name}
        input = gets.strip
          if input.to_i <= list.length && input.to_i > 0
            puts "Playing #{list[input.to_i - 1].name} by #{list[input.to_i - 1].artist.name}"
          end
      end
end
