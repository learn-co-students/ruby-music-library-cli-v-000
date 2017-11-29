#crap

artist#genres
temp = []
@songs.each do |song|
  if !temp.includes?(song.genre)
    temp << song.genre
  end
end
temp
