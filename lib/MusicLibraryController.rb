class MusicLibraryController
  def initialize(path="./db/mp3s")
    importer= MusicImporter.new(path)
    importer.import
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

    input= ""
    while(input != "exit")
      input= gets.strip
      case input
      when 'list songs'
        self.list_songs
      when 'list artists'
        self.list_artists
      when 'list genres'
        self.list_genres
      when 'list artist'
        self.list_songs_by_artist
      when 'list genre'
        self.list_songs_by_genre
      when 'play song'
        self.play_song
      end
    end

    end


  def list_songs
    Song.all.sort{|a,b| a.name <=> b.name}.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  def list_artists
    Artist.all.sort{|a,b| a.name <=> b.name}.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end
  def list_genres
    i= 1
    Genre.all.sort{|a,b| a.name <=> b.name}.each do |genre|
      puts "#{i}. #{genre.name}"
      i+= 1
    end
  end
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name= gets.strip
    i=1
    if Artist.find_by_name(artist_name) != nil
      Artist.find_by_name(artist_name).songs.sort{|a,b| a.name <=> b.name}.each do |song|
        puts "#{i}. #{song.name} - #{song.genre.name}"
        i+=1
      end
    end

  end

    #
    # "1. Green Aisles - country")
    # ("2. It's Real - hip-hop")
    # ("3. Wonder Years - dream pop")


  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    artist_name= gets.strip
    i=1
    if Genre.find_by_name(artist_name) != nil
      Genre.find_by_name(artist_name).songs.sort{|a,b| a.name <=> b.name}.each do |song|
        puts "#{i}. #{song.artist.name} - #{song.name}"
        i+=1
      end
    end
  end
  def play_song
    puts "Which song number would you like to play?"
    song= gets.strip
    newarray= Song.all.sort{|a,b| a.name <=> b.name}
    if song.to_i >= 1 && song.to_i <= Song.all.length
      puts "Playing #{newarray[song.to_i - 1].name} by #{newarray[song.to_i - 1].artist.name}"

    end
  end

end
