class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = ""
    while input != "exit"
      input = gets.strip
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      end
    end
  end

  def songs
    Song.all.sort_by{|s|s.artist.name}.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def artists
    Artist.all.sort_by{|a|a.name}.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
  end

  def genres
    Genre.all.sort_by{|g|g.name}.each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}"}
  end

  def play_song
    song_input = gets.strip
    puts "Playing #{Song.all[song_input.to_i].artist.name} - #{Song.all[song_input.to_i].name} - #{Song.all[song_input.to_i].genre.name}"
  end

  def list_artist
    artist = gets.strip
    if Artist.find_by_name(artist)
      artist = Artist.find_by_name(artist)
      artist.songs.each{|song| puts "#{artist.name} - #{song.name} - #{song.genre.name}"}
    end
  end

  def list_genre
    genre = gets.strip
    if Genre.find_by_name(genre)
      genre = Genre.find_by_name(genre)
      genre.songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{genre.name}"}
    end
  end


end
