class MusicLibraryController
  attr_accessor :path

def initialize(path="./db/mp3s")
  importer = MusicImporter.new(path)
  importer.import
end

def call
  input = ""
  until input == "exit"
  input = gets.chomp
  if input == "list songs"
    i = 0
    Song.all.each do |song|
      i += 1
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  elsif input == "list artists"
    Artist.all.each do |artist|
      puts artist.name
    end
  elsif input == "list genres"
    Genre.all.each do |genre|
      puts genre.name
    end
  elsif input == "play song"
    song_number = gets.chomp.to_i
    song = Song.all[song_number - 1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  elsif input == "list artist"
    name = gets.chomp
    artist = Artist.find_by_name(name)
    artist.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  elsif input == "list genre"
    genre_name = gets.chomp
    genre = Genre.find_by_name(genre_name)
    genre.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end



  end
end
end

end
