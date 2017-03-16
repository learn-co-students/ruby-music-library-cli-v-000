# require 'pry'
# require_relative './artist.rb'
# require_relative './genre.rb'
# require_relative './song.rb'
# require_relative './music_importer.rb'
# require_relative './concerns/findable.rb'

class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    until /(?i)exit/ === input
      puts "Input?"
      input = gets.strip
      puts Song.list_songs if /(?i)list songs/ === input
      puts Artist.list_artists if /(?i)list artists/ === input
      puts Genre.list_genres if /(?i)list genres/ === input
      if /(?i)play song/ === input
        puts "What song number would you like to play?"
        number = gets.strip.to_i # here i would really like to validate that the number var/gets is a number
        puts Song.play_song(number)
      end
      if /(?i)list artist songs/ === input
        puts "Which artist's songs would you like to see?" # I'd like to list the available artists here
        artist = gets.strip
        Artist.find_or_create_by_name(artist).list_artist_songs
      end
      if /(?i)list genre songs/ === input
        puts "Which genre's songs would you like to see?" # I'd like to list the available genres here
        genre = gets.strip
        Genre.find_or_create_by_name(genre).list_genre_songs
      end
    end
    puts "Thank you."
  end

end

# hat = MusicLibraryController.new
#
# hat.call
