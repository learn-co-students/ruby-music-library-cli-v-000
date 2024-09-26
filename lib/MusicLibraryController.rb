class MusicLibraryController

  def initialize(path='./db/mp3s')
    importer= MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    puts "What do you want to do?"
    while input !="exit"
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
  songs = Song.sort_songs
  songs.each_with_index do |son, ind| puts "#{ind +1}. #{son.artist.name} - #{son.name} - #{son.genre.name}"
  end
end

  def artists
    Artist.all.each do |a|
      puts "#{a.name}"
    end
  end

  def genres
    Genre.all.each do |g| puts "#{g.name}"
    end
  end

  def play_song
    "What number song would you like to play?"
    numinput = gets.strip
    puts "Playing #{Song.all[numinput.to_i-2].artist.name} - #{Song.all[numinput.to_i-2].name} - #{Song.all[numinput.to_i-2].genre.name}"
  end

  def list_artist
    "What artist would you like to list the songs of?"
    artinput = gets.strip
      if artist = Artist.find_by_name(artinput)
      artist.songs.each do |son, ind| puts "#{ind}. #{son.artist.name} - #{son.name} - #{son.genre.name}"
          end
        end
      end

    def list_genre
      "What genre would you like to list the songs of?"
      geninput = gets.strip
      if genre = Genre.find_by_name(geninput)
      genre.songs.each do |son, ind| puts "#{ind}. #{son.artist.name} - #{son.name} - #{son.genre.name}"
          end
        end
      end


end
