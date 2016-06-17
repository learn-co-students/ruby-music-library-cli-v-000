class MusicLibraryController
  extend Concerns::Findable
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = gets.chomp
    until input == "exit"
    if input == "list songs"
      list_songs
    elsif input == "list artists"
      list_artists
    elsif input == "list genres"
      list_genres
    elsif input == "play song"
      Song.all.each_with_index do |s, i|
        input.include?((i + 1).to_s)
        puts "Playing #{s.artist.name} - #{s.name} - #{s.genre.name}"
      end
    elsif input == "list artist"
      artist_songs = Artist.find_by_name(input)
      artist_songs.each do |artist|
        puts "#{song.artist.name}"
      end
    elsif input == "list genre"
    end
    input = gets.chomp
  end
  end

  def list_songs
    alpha = Song.all.sort_by{|s| s.artist.name}
    alpha.each.with_index do |s, i|
      puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    artists = Artist.all.sort_by{|a| a.name}
    artists.each do |artist|
      puts "#{artist.name}"
    end
  end

  def list_genres
    genres = Genre.all.sort_by{|g| g.name}
    genres.each do |genre|
      puts "#{genre.name}"
    end
  end


end
