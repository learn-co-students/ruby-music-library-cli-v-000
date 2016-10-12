class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    new_import = MusicImporter.new(path)
    new_import.import
  end

  def call
    action = gets
    do_the_thing(action)
  end

  def display_menu
    puts "Please enter one of the following commands:"
    puts "list songs"
    puts "list artists"
    puts "list genres"
    puts "play song"
    puts "list artist"
    puts "list genre"
  end

  def do_the_thing(action)
    case action
    when "list songs"
      Song.all.each_with_index{|a, i| 
        puts "#{i+1}. #{a.artist.name} - #{a.name} - #{a.genre.name}"
      }
      call
    when "list artists"
      Artist.all.each{|a| puts a.name}
      call
    when "list genres"
      Genre.all.each{|a| puts a.name}
      call
    when "play song"
      which_song = gets
      which_song = which_song.to_i
      this_song = Song.all[which_song - 1]
      puts "Playing #{this_song.artist.name} - #{this_song.name} - #{this_song.genre.name}"
      call
    when "list artist"
      the_artist = gets
      the_artist = Artist.find_by_name(the_artist)
      the_artist.songs.each{|a|
        puts "#{the_artist.name} - #{a.name} - #{a.genre.name}"
      }
      call
    when "list genre"
      the_genre = gets
      the_genre = Genre.find_by_name(the_genre)
      the_genre.songs.each{|a|
        puts "#{a.artist.name} - #{a.name} - #{a.genre.name}"
      }
      call
    when "exit"
      return nil
    else
      puts "oops"
    end

  end

end