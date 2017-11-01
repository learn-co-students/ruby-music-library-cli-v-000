
private

def list_songs
  MusicLibraryController.sort_by {|song| puts song.name}
  #  list_of_songs.collect.with_index(1) do |song, index|
  #    puts "#{index+1}. #{song}"
    #  list_of_songs
  #  end

end
