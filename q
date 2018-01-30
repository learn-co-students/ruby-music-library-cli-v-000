
[1mFrom:[0m /home/nitrous/code/labs/ruby-music-library-cli-v-000/lib/artist.rb @ line 18 Artist#add_song:

    [1;34m13[0m: [32mdef[0m [1;34madd_song[0m(song)
    [1;34m14[0m:   [32mif[0m !(@songs.include?(song))
    [1;34m15[0m:   @songs << song
    [1;34m16[0m:   song.artist= [1;36mself[0m
    [1;34m17[0m:   [32mend[0m
 => [1;34m18[0m:      binding.pry
    [1;34m19[0m: [32mend[0m

