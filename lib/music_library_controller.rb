require 'pry'

class MusicLibraryController
  attr_accessor :path
  attr_reader :music_lib

  def initialize(path='./db/mp3s')
    @path = path
    @music_lib = MusicImporter.new(path)
    music_lib.import

  end

  def call

    path_songs = music_lib.import.sort

    #path_songs.each do |song_full|
    #  songName = song_full.split(" - ")[1]
    #  artistName = song_full.split(" - ")[0]
    #  genreName = song_full.split(" - ")[2].gsub(".mp3", "")
    #  artist = Artist.find_or_create_by_name(artistName)
    #  genre = Genre.find_or_create_by_name(genreName)
    #  Song.new(songName, artist, genre)
    #end

      while (a = gets.chomp) != 'exit'
        if a == "list songs"
          path_songs.each_with_index do |song, index|
            puts "#{index + 1}. #{song}"
          end
        elsif a == "list artists"
          Artist.all.each do |artist|
            puts "#{artist.name}"
          end
        elsif a == "list genres"
          Genre.all.each do |genre|
            puts "#{genre.name}"
          end
        elsif a == "play song"
            puts "What song?"
            song_num = gets.chomp
            puts "Playing #{music_lib.import.sort[song_num.to_i-1]}"
        elsif a == "list artist"
         puts "songs for what artist"
         artist_input = gets.strip
         if artist = Artist.find_by_name(artist_input)
           artist.songs.each do |s|
             puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
           end
         end
       elsif a == "list genre"
        puts "songs for what genre"
        genre_input = gets.strip
        if genre = Genre.find_by_name(genre_input)
          genre.songs.each do |s|
            puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
          end
        end
        end

      end
    end

end
