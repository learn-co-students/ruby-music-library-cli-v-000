class MusicLibraryController

  attr_accessor :path

  def initialize(path="./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    puts "What would you like to do?"
    input=""
    while input != "exit"
    input = gets.chomp

    Song.all.sort! { |a,b|
        if a.artist.name != b.artist.name
          a.artist.name.downcase <=> b.artist.name.downcase
        else
          a.name.downcase <=> b.name.downcase
        end
      }

     if input == "list songs"
      song_number = 1
      Song.all.each {|song|
        puts "#{song_number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        song_number += 1
      }


      elsif input == "list artists"
        Song.all.each {|song|
          puts "#{song.artist.name}"
        }


      elsif input == "list artists"
        song_number = 1
        Song.all.each {|song|
          puts "#{song.artist.name}"
          song_number += 1
        }

      elsif input == "list genres"
        song_number = 1
        Song.all.each {|song|
          puts "#{song.genre.name}"
          song_number += 1
          }
      elsif input == "play song"
        song_number = 1
        Song.all.each {|song|
          puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
          song_number += 1
        }

      elsif input == "list artist"
        Song.all.each {|song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        }

      elsif input == "list genre"
        Song.all.each {|song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        }
     end

    end
  end
end
