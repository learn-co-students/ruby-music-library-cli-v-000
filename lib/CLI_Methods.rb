def list_songs
  count = 1
  Song.all.each do |song| 
    puts "#{count}. #{song}"
    count += 1
  end
end

def list_artists
  count = 1
  Artist.all.each do |artist| 
    puts "#{count}. #{artist}"
    count += 1
  end
end

def list_genres
  count = 1
  Genre.all.each do |genre| 
    puts "#{count}. #{genre}"
    count += 1
  end
end

def list_songs_by_artist
  
end

def list_songs_by_genre
  
end

def play_song
  
end