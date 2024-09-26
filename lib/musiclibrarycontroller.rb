class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def list_songs(songs)
    idx = 1
    Song.all.each do |song| puts "#{idx}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    idx += 1
    end
  end

  def list_artists(artist)
    Artist.all.each {|artist| puts artist.name}
  end

  def list_genres(genre)
    Genre.all.each {|genre| puts genre.name}
  end

  def play_song(index)
    song = Song.all[index.to_i]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist_songs_genre(input)
    Song.all.each {|single| puts "#{single.artist.name} - #{single.name} - #{single.genre.name}"}
  end

  def call
    input = nil
    until input == "exit"
      input = gets.chomp
      if input == "list artists"
        list_artists(input)
      elsif input == "list songs"
        list_songs(input)
      elsif input == "list genres"
        list_genres(input)
      elsif input == "play song"
        play_song(input)
      elsif input == "list artist" || input == "list genre"
        list_artist_songs_genre(input)
      end
    end
  end

end
