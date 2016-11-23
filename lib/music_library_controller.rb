class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    user_input = nil
    until user_input == "exit"
      user_input = gets.chomp
      if user_input == "list artists"
        list_artists(user_input)
      elsif user_input == "list songs"
        list_songs(user_input)
      elsif user_input == "list genres"
        list_genres(user_input)
      elsif user_input == "play song"
        play_song(user_input)
      elsif user_input == "list artist" || user_input == "list genre"
        list_songs_artist_or_genre(user_input)
      end
    end
  end

  def play_song(num)
    song = Song.all[num.to_i]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end


  def list_songs(songs)
    count = 1
    Song.all.each do |song|
      puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      count += 1
    end
  end

  def list_artists(artist)
    Artist.all.each do |artist|
      puts artist.name
    end
  end

  def list_genres(genre)
    Genre.all.each do |genre|
      puts genre.name
    end
  end

  def list_songs_artist_or_genre(input)
    Song.all.each do |e|
      puts "#{e.artist.name} - #{e.name} - #{e.genre.name}"
    end
  end

end
