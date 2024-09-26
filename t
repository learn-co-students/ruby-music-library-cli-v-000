
[1mFrom:[0m /home/nitrous/code/labs/ruby-music-library-cli-v-000/lib/song.rb @ line 64 Song.new_from_filename:

    [1;34m63[0m: [32mdef[0m [1;36mself[0m.[1;34mnew_from_filename[0m(list)
 => [1;34m64[0m:   binding.pry
    [1;34m65[0m:   [32mif[0m list.kind_of?([1;34;4mArray[0m)
    [1;34m66[0m:     list.each [32mdo[0m |file|
    [1;34m67[0m:       file_a = file.split([31m[1;31m"[0m[31m - [1;31m"[0m[31m[0m)
    [1;34m68[0m:       song = [1;36mself[0m.new(file_a[[1;34m1[0m])
    [1;34m69[0m:       song.artist = [1;34;4mArtist[0m.find_or_create_by_name(file_a[[1;34m0[0m])
    [1;34m70[0m:       song.artist.add_song(song.name)
    [1;34m71[0m:       song
    [1;34m72[0m:       binding.pry
    [1;34m73[0m:     [32mend[0m
    [1;34m74[0m:   [32melse[0m
    [1;34m75[0m:     file_a = list.split([31m[1;31m"[0m[31m - [1;31m"[0m[31m[0m)
    [1;34m76[0m:     song = [1;36mself[0m.new(file_a[[1;34m1[0m])
    [1;34m77[0m:     song.artist = [1;34;4mArtist[0m.find_or_create_by_name(file_a[[1;34m0[0m])
    [1;34m78[0m:     song.artist.add_song(song.name)
    [1;34m79[0m:     binding.pry
    [1;34m80[0m:     song
    [1;34m81[0m:   [32mend[0m
    [1;34m82[0m: [32mend[0m

