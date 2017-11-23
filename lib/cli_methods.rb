
class CLIMethods

    def list_songs
        if MusicLibraryController.gets == "list songs"
        @songs.each_with_index do |song, index| song.sort numbered_song = index.to_i-1 

            binding.pry
            
            puts "#{numbered_song}. #{song}"

            end
        end
    end
end

  # output list
        # list is songs from files?
        # list is numbered
        # songs are in alphabetical order
