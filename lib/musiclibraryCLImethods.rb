require 'pry'

# MusicLibraryController creates the list from the path
def list_songs
  Song.all.sort_by{|song| song.name}

end
