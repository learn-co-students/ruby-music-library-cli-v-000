class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    x = MusicImporter.new(path)
    x.import
  end

  def call
    y = gets.chomp
    case y
    when "list songs"
      c = 1
      array = MusicImporter.new(@path).files.sort
      array.each {|song|
        x = song.split(".")
        puts "#{c}. #{x[0]}"
        c+=1
        }
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
      a = gets.chomp.to_i
      a -= 1
      array = MusicImporter.new(@path).files.sort
      splitarray = array.collect {|song|
        x = song.split(".")
        x[0]
        }
      song1 = splitarray[a]
      puts "Playing #{song1}"
      self.call
    when "list artist"
      a = gets.chomp
      art = Artist.find_by_name(a)
      art.songs.each {|song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        }
      self.call
    when "list genre"
      a = gets.chomp
      gen = Genre.find_by_name(a)
      gen.songs.each {|song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        }
      self.call
    end

  end
end

