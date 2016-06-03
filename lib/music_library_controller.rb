require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to your Music Library!"
      puts "What would you like to do?"
      input = gets.strip
      case input
        when "list songs"
          songs
        when "list artists"
          artists
        when "list genres"
          genres
        when "list artists"
          list_artists
        when "list genre"
        when "play song"
          play_song
      end
    end
  end

  #def songs
   # Song.all.each.with_index(1) do |song, index|
    #  puts "#{index}. #{song}"
    #end
  #end

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

    def list_artists
      puts "What artist by name would you like to list songs for?"
      artist_input = gets.strip
        if artist = Artist.find_by_name(artist_input)
          artist.songs.each.with_index(1) do |s, i|
            puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
          end
        end 
        binding.pry
    end

    def play_song
      puts "What song number would you like to play?"
      song_input = gets.strip
      #binding.pry
      puts "Playing #{Song.all[song_input.to_i-1]}"
    end
    #.artist.name} - #{selection.name} - #{selection.genre.name}"
end