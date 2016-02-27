class MusicLibraryController
 def initialize(path ="./db/mp3s")
  importer = MusicImporter.new(path)
  importer.import
  end

def call
  input = ""
  while input != "exit"
        puts "what do you want to do?"
        input = gets.chomp
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
        play_song
      end
    end 
  end

def songs
      Song.all.each.with_index do |s, i|
          puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      end
  end


def artists
    Artist.all.each do |artist|
        puts "#{artist.name}"
  end
end

def genres
  Genre.all.each do |genre|
        puts "#{genre.name}"
  end
end

def play_song
  puts "choose a song to play by number mate!"
  number= gets.chomp.to_i-1
  play = Song.all[number]
    puts "Playing #{play.artist.name} - #{play.name} - #{play.genre.name}"
end

 def list_artist
  puts "Choose an artist mate!"
  input = gets.chomp
  if artist = Artist.find_by_name(input)
      artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    else
      puts "Artist not found"
    end
  end



def list_genre
  puts "Choose a genre mate!"
  input = gets.chomp
  if genre = Genre.find_by_name(input)
      genre.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
     else
      puts "Artist not found"
    end
  end





end