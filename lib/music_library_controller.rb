class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
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
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
      play_songs
    end
  end
end




  def artists
    Artist.all.each.with_index(1) do |a, i|
      puts "#{i}. #{a}"
    end
  end

  def genres
    Genre.all.each.with_index(1) do |g, i|
      puts "#{i}. #{g}"
    end
  end

  def list_artist
    puts "list artists?"
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each do |s,i|
        puts "#{i}. #{s}"
      end
    end
  end

  def list_genre
    puts "list genres?"
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each do |s,i|
        puts "#{i}. #{s}"
      end
    end
  end



 def play_songs
input = gets.chomp.to_i
song_instance_array = Song.all
 @songs_sorted = song_instance_array.sort { |a, b| (a.artist.name <=> b.artist.name) }
song = @songs_sorted[input - 1]
  puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
end
end
def songs
puts "list songs"
  i=0
Song.all.sort{|a,b|a.artist.name <=> b.artist.name}.each do |s|
i+=1
puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
end
end
