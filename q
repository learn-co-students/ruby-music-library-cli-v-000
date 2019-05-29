
[1mFrom:[0m /home/lekannicholson-67127/code/labs/ruby-music-library-cli-v-000/lib/music_library/music_library_controller.rb @ line 51 MusicLibraryController#list_songs:

    [1;34m32[0m: [32mdef[0m [1;34mlist_songs[0m
    [1;34m33[0m:   [1;34m# prints all songs in the music library in a numbered list (alphabetized by song name)[0m
    [1;34m34[0m:   [1;34m# sorted_songs = [][0m
    [1;34m35[0m:   [1;34m# @library_of_songs.map do |song|[0m
    [1;34m36[0m:   [1;34m#   new_song = Song.new_from_filename(song)[0m
    [1;34m37[0m:   [1;34m#   if sorted_songs.size == 0[0m
    [1;34m38[0m:   [1;34m#     sorted_songs << song[0m
    [1;34m39[0m:   [1;34m#   else[0m
    [1;34m40[0m:   [1;34m#     sorted_songs.sort_by { |x| new_song.name}[0m
    [1;34m41[0m:   [1;34m#   binding.pry[0m
    [1;34m42[0m:   [1;34m# end[0m
    [1;34m43[0m: 
    [1;34m44[0m: 
    [1;34m45[0m:   [1;34m# LOOK UP SORT BY AND TRY SOME STUFF OUT[0m
    [1;34m46[0m: 
    [1;34m47[0m:   new_list_of_songs = @library_of_songs.map [32mdo[0m |song_with_mp3_at_the_end|
    [1;34m48[0m:     remove_mp3 = song_with_mp3_at_the_end.split([31m[1;31m"[0m[31m.[1;31m"[0m[31m[0m)
    [1;34m49[0m:     song_phrase = remove_mp3[[1;34m0[0m]
    [1;34m50[0m:     song_phrase
 => [1;34m51[0m:     binding.pry
    [1;34m52[0m:   [32mend[0m [1;34m#.map[0m
    [1;34m53[0m: 
    [1;34m54[0m:   [1;34m# final_list_of_songs = [][0m
    [1;34m55[0m:   [1;34m# new_list_of_songs.each do |song|[0m
    [1;34m56[0m:   [1;34m#   song.split(" - ")[0m
    [1;34m57[0m:   [1;34m# end #new_list_of_songs[0m
    [1;34m58[0m: 
    [1;34m59[0m: [32mend[0m [1;34m#list_songs[0m

