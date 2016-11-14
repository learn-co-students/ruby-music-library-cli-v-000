class MusicLibraryController

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    loop do
      puts "Type one of the following and press 'enter':\nplay song, list songs, list artists, list genres, list artist, list genre\n(to exit, type 'exit' and press 'enter')"
      input = gets.chomp
      break if input == "exit"
      method = input.gsub(" ", "_").to_sym
      self.send(method) if self.class.instance_methods(false).include?(method)
    end
  end

  def list_songs
    Song.all.each_with_index do |song, i|
      puts "#{i + 1}. #{song.full_string}"
    end
  end

  def list_artists
    Artist.all.each { |a| puts a.name }
  end

  def list_genres
    Genre.all.each { |g| puts g.name }
  end

  def play_song
    index = -1
    until index.between?(0, Song.all.size - 1)
      puts "Please select a song by its number, then press 'enter'"
      index = gets.chomp.to_i - 1
    end
    song = Song.all[index]
    puts "Playing #{song.full_string}"
  end

  def list_artist
    self.list_artists
    artist = nil
    until artist
      puts "Please select an artist by typing in their name, then press 'enter'"
      artist = Artist.find_by_name(gets.chomp)
    end
    artist.songs.each { |song| puts song.full_string }
  end

  def list_genre
    self.list_genres
    genre = nil
    until genre
      puts "Please select a genre by typing in its name, then press 'enter'"
      genre = Genre.find_by_name(gets.chomp)
    end
    genre.songs.each { |song| puts song.full_string }
  end
end
