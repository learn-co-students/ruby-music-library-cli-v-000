
[1mFrom:[0m /home/eyosef/ruby-music-library-cli-v-000/lib/musiclibrarycontroller.rb @ line 95 MusicLibraryController#play_song:

    [1;34m77[0m: [32mdef[0m [1;34mplay_song[0m
    [1;34m78[0m:   puts [31m[1;31m"[0m[31mWhich song number would you like to play?[1;31m"[0m[31m[0m
    [1;34m79[0m:   user_input = gets.chomp
    [1;34m80[0m: 
    [1;34m81[0m:   list = []
    [1;34m82[0m: 
    [1;34m83[0m:   [1;34m# ["1. Thundercat - For Love I Come - dance",[0m
    [1;34m84[0m:   [1;34m#  "2. Real Estate - Green Aisles - country",[0m
    [1;34m85[0m:   [1;34m#  "3. Real Estate - It's Real - hip-hop",[0m
    [1;34m86[0m:   [1;34m#  "4. Action Bronson - Larry Csonka - indie",[0m
    [1;34m87[0m:   [1;34m#  "5. Jurassic 5 - What's Golden - hip-hop"][0m
    [1;34m88[0m: 
    [1;34m89[0m:   [1;34;4mSong[0m.all.sort {|a, b| a.name <=> b.name }.each_with_index { |song, index|
    [1;34m90[0m:     list << [31m[1;31m"[0m[31m#{index + 1}[0m[31m. #{song.artist.name}[0m[31m - #{song.name}[0m[31m - #{song.genre.name}[0m[31m[1;31m"[0m[31m[0m }
    [1;34m91[0m:   [1;34m# list.detect do |song|[0m
    [1;34m92[0m:   [1;34m#   if user_input == list[0][0] || user_input == list[1][0] ||[0m
    [1;34m93[0m:   [1;34m#     user_input == list [2][0] || user_input == list[3][0] ||[0m
    [1;34m94[0m:   [1;34m#     user_input == list[4][0][0m
 => [1;34m95[0m:              binding.pry
    [1;34m96[0m:      puts [31m[1;31m"[0m[31mPlaying #{song.name}[0m[31m by #{song.artist.name}[0m[31m[1;31m"[0m[31m[0m
    [1;34m97[0m:    [1;34m#end #if statement[0m
    [1;34m98[0m:  [1;34m#end#detect[0m
    [1;34m99[0m: [32mend[0m [1;34m#play_song method[0m

