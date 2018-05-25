class MusicLibraryController
  attr_accessor :path


  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import

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
    input = " "
    until input == "exit"
      input = gets.strip
      if input == "list songs"
          list_songs
        end
       if input == "list artists"
          list_artists
        end
        if input == "list genres"
          list_genres
        end
          if input == "list artist"
          list_songs_by_artist
        end
            if input == "list genre"
            list_songs_by_genre
          end
              if input == "play song"
              play_song
              end

  end
end

  def list_songs
    Song.all.sort_by{|m| m.name}.each_with_index{|s,i| puts "#{i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end

  def list_artists
    Artist.all.sort_by{|m| m.name}.uniq.each_with_index{|s,i| puts "#{i + 1}. #{s.name}"}
  end

  def list_genres
    Genre.all.sort_by{|m| m.name}.uniq.each_with_index{|s,i| puts "#{i + 1}. #{s.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if Artist.find_by_name("#{input}")
      Artist.find_by_name("#{input}").songs.sort_by{|m| m.name}.each_with_index{|s,i| puts "#{i + 1}. #{s.name} - #{s.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if Genre.find_by_name("#{input}")
      Genre.find_by_name("#{input}").songs.sort_by{|m| m.name}.each_with_index{|s,i| puts "#{i + 1}. #{s.artist.name} - #{s.name}"}
    end
  end

  def play_song
    # loop do
    puts "Which song number would you like to play?"
    input = gets.to_i
    # binding.pry
      if input.between?(1, Song.all.count)
        a = Song.all.sort_by{|m| m.name}.collect{|s| "Playing #{s.name} by #{s.artist.name}"}
        result = a[input - 1]
        puts "#{result}"
      end
  end


end
