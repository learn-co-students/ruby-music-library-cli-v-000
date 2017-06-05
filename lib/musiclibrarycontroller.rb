class MusicLibraryController
  attr_accessor :sorted_songs
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
    @sorted_songs = Song.all.sort_by {|song| song.artist.name}
  end

  def call
    input = ""
    until input == "exit"
    #get user input
      input = gets.strip
      case input
    #user can list songs
      when "list songs"
        self.list_songs
    #user can list artists
      when "list artists"
        self.list_artists
    #user can list genres
      when "list genres"
        self.list_genres
    #user can play songs
      when "play song"
        self.play_song
    #user can list songs by artist
      when "list artist"
        self.list_songs_by_artist
    #user can list songs by genre
      when "list genre"
        self.list_songs_by_genre
      end
    end
  end

  def list_songs
    @sorted_songs.each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each {|artist| puts artist.name}
  end

  def list_genres
    Genre.all.each {|genre| puts genre.name}
  end

  def play_song
    num = gets.strip.to_i
    puts "Playing #{@sorted_songs[num-1].artist.name} - #{@sorted_songs[num-1].name} - #{@sorted_songs[num-1].genre.name}"
  end

  def list_songs_by_artist
    name = gets.strip
    Artist.find_by_name(name).songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs_by_genre
    name = gets.strip
    Genre.find_by_name(name).songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
end
