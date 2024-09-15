require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    new_importer = MusicImporter.new(path)
    new_importer.files
    new_importer.import
  end

  def call
    puts "WELCOME"
    input = ""
    while input != "exit"
      puts "What would you like to do now?"
      input = gets.strip

    case input
      when "list songs"
        list_songs
      when"list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        play_song
      when "list artist"
        list_artists_songs
      when "list genre"
        list_genres_songs
      end
    end
  end


    def list_songs #problems here, leads to problems in play_song method
      Song.all.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end

    def list_artists
      Artist.all.each do |artist|
        puts "#{artist.name}"
      end
    end

    def list_genres
      Genre.all.each do |genre|
        puts "#{genre.name}"
      end
    end

    def play_song
      puts "Which song number would you like to hear?"
      song_input = gets.chomp
      select = Song.all[song_input.to_i - 1]
      puts "Playing #{select.artist.name} - #{select.name} - #{select.genre.name}"
    end

    def list_artists_songs
      puts "What artist's songs would you like to see?"
      artist_input = gets.chomp
      if artist = Artist.find_by_name(artist_input)
        artist.songs.each do |s|
          artist_song = s.name
        artist.genres.each do |g|
          genre_name = g.name
          puts "#{artist.name} - #{artist_song} - #{genre_name}"
        end
      end
    end
    end


    def list_genres_songs
      puts "What genre's songs would you like to see?"
      genre_input = gets.chomp
      if genre = Genre.find_by_name(genre_input)
        genre.songs.each do |s|
          genre_name = s.name
        genre.artists.each do |a|
          artist_name = a.name
          puts "#{artist_name} - #{genre_name} - #{genre.name}"
        end
      end
    end
    end



end

#Song.all.sort_by{|e| [e.artist.name, e.name]}

