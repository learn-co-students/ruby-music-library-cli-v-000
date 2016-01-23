class MusicLibraryController

  attr_reader :path

  def initialize(path = './db/mp3s')
    @path=path
    musicimporter = MusicImporter.new(path)
    musicimporter.import
  end

  def call
    puts "Hello. What do you want to do?"
    input = nil
    while input != "exit"
      input = gets.chomp
      case input
        when "list songs"
          list_songs
          puts "What would you like to do next?"
        when "list artists"
          list_artists
          puts "What would you like to do next?"
        when "list genres"
          list_genres
          puts "What would you like to do next?"
        when "play song"
          play_song
          puts "What would you like to do next?"
        when "list artist"
          list_artist_songs
          puts "What would you like to do next?"
        when "list genre"
          list_genre_songs
          puts "What would you like to do next?"
        when "exit"
          break
          puts "Your library is awesome!"
        else
          puts "Error! Enter another input"
      end
    end
  end

  def list_songs
    Song.all.each.with_index(1) {|song, track| puts "#{track}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    Artist.all.each {|art| puts art.name}
  end

  def list_genres
    Genre.all.each {|gen| puts gen.name}
  end

  def play_song
    Song.all.each_with_index {|item, index| puts "Playing #{item.artist.name} - #{item.name} - #{item.genre.name}"}
  end

  def list_artist_songs
    artistname = gets.chomp
    Song.all.each.with_index(1) do |song, track| 
      if song.artist.name == artistname
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre_songs
    genrename = gets.chomp
    Song.all.each do |song| 
      if song.genre.name == genrename
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genres
    Genre.all.each {|gen| puts gen.name}
  end
  
end