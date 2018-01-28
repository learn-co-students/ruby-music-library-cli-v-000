
[1mFrom:[0m /home/jstoos/ruby-music-library-cli-v-000/lib/music_library_controller.rb @ line 72 MusicLibraryController#list_songs_by_artist:

    [1;34m64[0m: [32mdef[0m [1;34mlist_songs_by_artist[0m
    [1;34m65[0m:   list_of_songs = []
    [1;34m66[0m:   puts [31m[1;31m"[0m[31mPlease enter the name of an artist:[1;31m"[0m[31m[0m
    [1;34m67[0m:   artist_name = gets
    [1;34m68[0m:   [1;34m#binding.pry[0m
    [1;34m69[0m:   [32mwhile[0m ![1;34;4mArtist[0m.find_by_name(artist_name)
    [1;34m70[0m:     puts [31m[1;31m"[0m[31mPlease enter the name of an artist:[1;31m"[0m[31m[0m
    [1;34m71[0m:     artist_name = gets
 => [1;34m72[0m:     binding.pry
    [1;34m73[0m:   [32mend[0m
    [1;34m74[0m: 
    [1;34m75[0m:   [1;34;4mSong[0m.all.each [32mdo[0m |song|
    [1;34m76[0m:     [32mif[0m song.artist.name = artist_name
    [1;34m77[0m:       list_of_songs << song
    [1;34m78[0m:       alphabetized = []
    [1;34m79[0m:       alphabetized = list_of_songs.sort_by {|obj| obj.name}
    [1;34m80[0m:       alphabetized.each [32mdo[0m |song_instance|
    [1;34m81[0m:         counter +=[1;34m1[0m
    [1;34m82[0m:         puts [31m[1;31m"[0m[31m#{counter}[0m[31m. #{song_instance.name}[0m[31m - #{song_instance.genre}[0m[31m[1;31m"[0m[31m[0m
    [1;34m83[0m:       [32mend[0m
    [1;34m84[0m: 
    [1;34m85[0m:     [32mend[0m
    [1;34m86[0m:   [32mend[0m
    [1;34m87[0m: 
    [1;34m88[0m: [32mend[0m

