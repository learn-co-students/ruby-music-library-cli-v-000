
def list_songs
  list_of_songs = MusicLibraryController.sort_by{|song| song.name}
   list_of_songs.collect.with_index(1) do |song, index|
     puts "#{index}. #{song}"
   end
end
