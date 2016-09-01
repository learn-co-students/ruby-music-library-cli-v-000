require 'pry'
class MusicLibraryController
  attr_accessor :path
  def initialize(path="./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    #puts "Welcome to the Music Library CLI. Please enter a command..."
    music_importer = MusicImporter.new(path)
    music_importer.import
    music_importer.files.each {|filename|
      Song.create_from_filename(filename)
    }
    input = gets
    case input
    when "list songs"
      music_importer = MusicImporter.new(@path)
      count = 1
      music_importer.files.each {|filename|
        puts "#{count}. "+filename
        count += 1
      }
      input
      self.call
    when "list artists"
      Artist.all.each {|artist|
        puts artist.name
      }
      self.call
    when "list genres"
      Genre.all.each {|genre|
        puts genre.name
      }
      self.call
    when "play song"
      puts "Enter song number..."
      count = 1
      music_importer.files.each {|filename|
        puts "#{count}. "+filename
        count += 1
      }
      number = gets

      puts "Playing #{music_importer.files[number.to_i-1]}"
      self.call
    when "list artist"
      puts "Which artist?"
      name = gets
      music_importer.files.each {|filename|
        if filename.split(" - ")[0] == name
          puts filename
        end
      }
      self.call
    when "list genre"
      puts "Which genre?"
      name = gets
      music_importer.files.each {|filename|
        if filename.split(" - ")[2].split(".mp3")[0] == name
          puts filename
        end
      }
      self.call
    when "exit"
      return input
    else
      self.call
    end
  end

end