class MusicLibraryController

attr_accessor :path


  def initialize(path = "./db/mp3s")
    @path = path
    @importer = []
    @importer= MusicImporter.new(path).import
  end

  def call
    input= ""
    while input!= "exit"
      input = gets.chomp
    case input
    when "list songs"
      @importer.sort.each_with_index{ |song, index|
      puts "#{index+1}. #{song}" }

    when "list artists"
      @importer.each {|song|
      items = song.split(" - ")
      artist= Artist.find_or_create_by_name(items[0])
      puts artist.name
    }
    when "list genres"
      @importer.each {|song|
      items = song.split(" - ")
      genre_name =  items[2].gsub(".mp3","")
      genre = Genre.find_or_create_by_name(genre_name)
      puts genre.name
      }

    when "play song"
      @importer.each {|song|
      song_name = song.gsub(".mp3", "")
      puts "Playing #{song_name}"
      }

    when "list artist"
      name = gets.chomp
      Artist.find_by_name(name).songs.each { |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      }
    when "list genre"
      name = gets.chomp
      Genre.find_by_name(name).songs.each { |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      }
    end
  end
end
end
