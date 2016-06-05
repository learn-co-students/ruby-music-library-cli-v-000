class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    music_import = MusicImporter.new(path)
    music_import.import
  end


  def call
    input = ""
    while input != "exit"
      puts "What do you want?"
      input = gets.chomp
        if input == "list songs"
          songs
        elsif input == "list artists"
          artists
        elsif input == "list genres"
          genres
        elsif input == "play song"
          play_song
        elsif input == "list artist"
          list_artist
        elsif input == "list genre"
          list_genre
        end
    end


  end


  def songs
    Song.all.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end



    def artists
      Artist.all.each.with_index(1) do |a, i|
        puts "#{i}. #{a.name}"
      end
    end


    def genres
      Genre.all.each.with_index(1) do |g, i|
        puts "#{i}. #{g.name}"
      end
    end


    def play_song
      puts "What song number would you like to play?"
      songs
      song_input = gets.chomp
      puts "Playing #{Song.all[song_input.to_i-1].artist.name} - #{Song.all[song_input.to_i-1].name} - #{Song.all[song_input.to_i-1].genre.name}"
    end


    def list_artist
      puts "What artist's songs would you like to see?"
      artists
      artist_input = gets.chomp
      if artist = Artist.find_by_name(artist_input)
        artist.songs.each.with_index(1) do |s, i|
          puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
        end
      end
    end

    def list_genre
      puts "What genre of songs would you like to see?"
      genres
      genre_input = gets.chomp
      if genre = Genre.find_by_name(genre_input)
        genre.songs.each.with_index(1) do |s, i|
          puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
        end
      end
    end


end
