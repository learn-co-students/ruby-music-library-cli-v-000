require "pry"
class MusicLibraryController
  attr_accessor :path
  def initialize(path="./db/mp3s")
    @path=path
    music=MusicImporter.new(@path)
    music.import

  end

  def call
    input = nil

    puts "Welcome to your music library!"
    puts "What would you like to do?"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."

    until input == "exit"
       input = gets.strip
       if input == "list songs"
         list_songs
       elsif input == 'list artists'
         list_artists
       elsif input == 'list artist'
         list_songs_by_artist
       elsif input == 'list genres'
         list_genres
       elsif input == 'list genre'
         list_songs_by_genre
       elsif input == 'play song'
         play_song
       end
    end




  end


  def list_songs
    Song.all.sort_by! {|song| song.name}

    Song.all.each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end

  end
  def list_artists
    array=Artist.all.sort_by! {|artist| artist.name}
    array1=array.uniq
    array1.each_with_index do |artist, i|
      puts "#{i+1}. #{artist.name}"
    end
  end
  def list_genres
    array=Genre.all.sort_by! {|genre| genre.name}
    array1=array.uniq
    array1.each_with_index do |genre, i|
      puts "#{i+1}. #{genre.name}"
    end
  end
  def list_songs_by_artist
      puts "Please enter the name of an artist:"
      name=gets.strip
      artist= Artist.find_by_name(name)
     if artist != nil
      array = artist.songs.sort_by! {|song| song.name}
      array.each_with_index do |song, i|
         puts "#{i+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  def list_songs_by_genre
      puts "Please enter the name of a genre:"
      name=gets.strip
      genre= Genre.find_by_name(name)
     if genre != nil
      array = genre.songs.sort_by! {|song| song.name}
      array.each_with_index do |song, i|
         puts "#{i+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  def play_song
     Song.all.sort_by! {|song| song.name}
     puts "Which song number would you like to play?"

     if gets.strip.match(/[0-9]/)
       i= gets.strip.to_i

       if  (i > 0 and i << Song.all.length)
          song=Song.all[(i-1)]
          if song != nil
          puts "Playing #{song.name} by #{song.artist.name}"
          end

        end
      end
   end
end
