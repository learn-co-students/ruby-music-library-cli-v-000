class MusicLibraryController


  attr_accessor :path

def initialize(path = './db/mp3s' )
  @path = path
  new_path = MusicImporter.new(path)
  new_path.import
end


def call
  input = gets
  until input == "exit"
  if input == "list songs"
  list_songs
  elsif input == "list artists"
  list_artists
  elsif input == "list genres"
  list_genres
  elsif input == "play song"
  song_number = gets
  play_song(song_number)
  elsif input == "list artist"
  artist_name = gets
  list_artists_songs(artist_name)
  elsif input == "list genre"
   genre_name = gets
   list_genres_songs(genre_name)
  end
  input = gets
  end
end


def list_songs
  Song.all.each_with_index {|x,index|
    print index + 1,". ",x.artist.name," - ",x.name," - ",x.genre.name

  }
end


def list_artists
  Song.all.each {|x| puts x.artist.name}
end

def list_genres
  Song.all.each {|x| puts x.genre.name}
end

def play_song(number)
 Song.all.each_with_index {|x,index|
    print "Playing ",x.artist.name," - ",x.name," - ",x.genre.name
  }
end

def list_artists_songs(artist_name)
  Song.all.detect {|x|
    x == artist_name
  print x.artist.name," - ",x.name," - ",x.genre.name
  }
end

def list_genres_songs(genre_type)

  Song.all.detect{|x|
    x == genre_type
    print x.artist.name," - ",x.name," - ",x.genre.name


  }

end


end
