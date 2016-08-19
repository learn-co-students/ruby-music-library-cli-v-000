class MusicLibraryController

  attr_accessor :path



  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end



  def call
    input = nil
    while input != "exit"
      puts "Welcome to Your Music Library!"
      puts "What would you like to do?"
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
    Song.sort
    Song.all.each.with_index(1) do |song, i| puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def artists
    Artist.all.each_with_index {|artist| puts artist.name}
  end

  def genres
    Genre.all.each_with_index {|genre| puts genre.name}
  end

  def play_song
    puts "Enter a song number"
    input = gets.strip.to_i
    Song.sort
    song = Song.all[input - 1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end

def list_artist
  puts "Enter artist name"
  input = gets.strip.to_i
  Song.sort
  artist = Artist.all[input - 1]
  artist.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
end
end

def list_genre
  puts "Enter genre name"
  input = gets.strip
   Genre.all.each do |g|
    if g.name == input
  g.songs.each do |song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
end
end
end

end
