require "pry"

class MusicLibraryController
  attr_reader :imports

    def initialize(path="./db/mp3s")
      imported_object = MusicImporter.new(path)
     @imports=imported_object.import
      # binding.pry
    end

    def call
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      loop do
        commands
        break if gets == "exit"
      end
    end

    def commands
      case gets
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end

    def list_songs
      files =[]
      imports.each {|file| files << file.split(".").delete_at(0)}

      files.sort_by! {|file| file.split("-")[1]}

      files.collect! do |song|
        puts "#{files.index(song)+1}. #{song}"
        "#{files.index(song)+1}. #{song}"
      end

      files

    end

    def list_artists
      files =[]
      Artist.all.each {|artist| files << artist.name}

      files.sort.each_with_index {|artist, index| puts "#{index+1}. #{artist}"}
    end

    def list_genres
      files =[]
      Genre.all.each {|genre| files << genre.name}

      files.sort.each_with_index {|genre, index| puts "#{index+1}. #{genre}"}
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      name = gets
      files =[]
      x=0
      found = Artist.all.detect {|artist| artist.name ==name}

      if found != nil
        found.songs.each {|song| files << "#{song.name} - #{song.genre.name}"}

        files.sort!

        files.each_with_index {|song, index| puts "#{index + 1}. #{song}"}
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
        name = gets
        files =[]
        x=0
        found = Genre.all.detect {|genre| genre.name ==name}

        if found != nil
          found.songs.each do |song|
          files << "#{song.artist.name} - #{song.name}"
          end

          files.sort_by! {|song| song.split(" - ")[1] }

          files.each_with_index do |song, index|
            puts "#{index + 1}. #{song}"
          end
        end
    end


    def play_song
      puts "Which song number would you like to play?"
      input = gets.to_i

      files =[]
      imports.each {|file| files << file.split(".").delete_at(0)}
      files.sort_by! {|file| file.split("-")[1]}
      valid= input!=nil && input >= 1 && input <= files.size

      puts "Playing #{files[input-1].split(" - ")[1]} by #{files[input-1].split(" - ")[0]}" if valid


    end


end
