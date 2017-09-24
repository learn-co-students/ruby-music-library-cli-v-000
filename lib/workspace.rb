i = 0
Song.all.each do |song|
  i += 1
  puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
end