
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
    puts "Welcom to the Music Library.\nWhat Would you like to do?\n"
    input = gets.strip

      case input

      when "list songs" then songs

      when "list artists" then artists

      when "list genres" then genres

      when  "play song" then play_song

      when "list artist" then artists_songs

      when "list genre" then genre_songs

      end

    end
  end

  def songs
    Song.all.each_with_index do |song,index|
      puts  "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Artist.all.each do |artist|
      puts  "#{artist.name}"
    end
  end

  def genres
    Genre.all.each do |genre|
      puts  "#{genre.name}"
    end
  end

  def play_song
    puts "Enter a song number"
    number = gets.strip
    Song.all.each_with_index do |song,index|
            if index == number.to_i-1
            puts  "#Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
            end
          end
  end

  def artists_songs
    puts "Name an artist."
    artistInput = gets.strip

    the_artist = Artist.find_by_name(artistInput)
    the_artist.songs.collect do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def genre_songs
    puts "Choose a genre"
    a_genre = gets.strip
    genre_instance = Genre.find_by_name(a_genre)
    #
      #self.call
    #else
      genre_instance.songs.each do |song|
        if song.class == Song
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end


end
