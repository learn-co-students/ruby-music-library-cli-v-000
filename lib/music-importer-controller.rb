class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    @music_import = []
    @music_import = MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      input = gets.chomp
      case input
      when "list songs"
        @music_import.sort.each.with_index { |song, index|
          puts "#{index+1}. #{song}"
        }
      when "list artists"
        @music_import.sort.each { |song|
          parts = song.split (" - ")
          artist = Artist.find_or_create_by_name(parts[0])
          puts artist.name
        }
      when "list genres"
        @music_import.sort.each { |song|
          parts = song.split (" - ")
          genre_name = parts[2].gsub(".mp3", "")
          genre = Genre.find_or_create_by_name(genre_name)
          puts genre.name
        }

      when "play song"
        @music_import.sort.each { |song|
          filename = song.gsub(".mp3", "")
          puts "Playing #{filename}"
        }

      when "list artist"
        artist = gets.strip
        @music_import.sort.each { |song|
          if song.split(" - ")[0] == artist
            puts "#{song.chomp('.mp3')}"
          end
        }

      when "list genre"
        genre = gets.strip
        @music_import.sort.each { |song|
          if song.gsub(".mp3", "").split(" - ")[2] == genre
            puts "#{song.chomp('.mp3')}"
          end
        }
      end
    end
  end
end
