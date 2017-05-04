class MusicLibraryController
  attr_reader :path
  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    puts 'Welcome to my Music Library!!!'
    puts 'What would you like to do???'
    input  = ''
    until input=='exit'
      input = gets.strip
      case input
        when 'list songs'
          songs
        when 'list artists'
          artists
        when 'list genres'
          genres
        when 'play song'
          play_song
        when 'list artist'
          artist
        when 'list genre'
          genre
      end
    end
  end

  def songs
    Song.all.each.with_index {|s, i|
      puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    }
  end
  def artists
    Artist.all.each {|a|
      puts "#{a.name}"
    }
  end
  def genres
    Genre.all.each {|g|
      puts "#{g.name}"
    }
  end
  def play_song
    puts "What song number would you like to play?"
    index  = gets.strip.to_i
    song  = Song.all[index-1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
  def artist
    puts "Which Artist's song would like to know?"
    artist_name = gets.strip
    artist = Artist.find_by_name(artist_name)
    songs = artist.songs
    songs.each {|s|
      puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
    }
  end
  def genre
    puts "What Genre's songs would like to know?"
    genre_name = gets.strip
    genre = Genre.find_by_name(genre_name)
    genre.songs.each {|s|
      puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
    }

  end
end
