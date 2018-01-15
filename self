
[1mFrom:[0m /home/brittlegit/code/ruby-music-library-cli-v-000/lib/music_library_controller.rb @ line 44 MusicLibraryController#list_songs:

    [1;34m31[0m: [32mdef[0m [1;34mlist_songs[0m
    [1;34m32[0m:   [1;34m#AT THIS POINT you have already imported all of the songs, and created song[0m
    [1;34m33[0m:   [1;34m#instances to work with. If you call Song.all right now, it will list all your[0m
    [1;34m34[0m:   [1;34m#instances, associated with Artists and Genres.  SO just, find a way to access the names and then alphabetize them[0m
    [1;34m35[0m:   [1;34m#Maybe you can #collect EACH Song.all.each self.name shovel to an array and then SORT that array. Etc.[0m
    [1;34m36[0m: 
    [1;34m37[0m:     [1;34m#idea:  if the song names in the sorted songs array are INCLUDED in the[0m
    [1;34m38[0m:     [1;34m#@controller.files name, then shovel that filename into the array.  It is[0m
    [1;34m39[0m:     [1;34m#important that this is done in order of the sorted songs array so that it[0m
    [1;34m40[0m:     [1;34m#can stay in order.[0m
    [1;34m41[0m: 
    [1;34m42[0m: 
    [1;34m43[0m: 
 => [1;34m44[0m:   binding.pry
    [1;34m45[0m: [32mend[0m

