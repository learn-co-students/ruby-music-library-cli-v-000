

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
  elsif input = "play a song"
  play_a_song
  elsif input == "list artists songs"
  list_artists_songs
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

def play_a_song
 Song.all.each_with_index {|x,index|
    print "Playing ",x.artist.name," - ",x.name," - ",x.genre.name
  }
end

def list_artists_songs
  Song.all.each {|x| 
  print x.artist.name," - ",x.name," - ",x.genre.name
  }

end


end