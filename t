
[1mFrom:[0m /home/mrjak13/ruby-music-library-cli-v-000/lib/musiclibrarycontroller.rb @ line 63 MusicLibraryController#list_songs_by_artist:

    [1;34m59[0m: [32mdef[0m [1;34mlist_songs_by_artist[0m
    [1;34m60[0m:   puts [31m[1;31m"[0m[31mPlease enter the name of an artist:[1;31m"[0m[31m[0m
    [1;34m61[0m:   input = gets
    [1;34m62[0m:   list = [1;34;4mArtist[0m.all.collect{|a| a.name == input.chomp}
 => [1;34m63[0m:   binding.pry
    [1;34m64[0m: 
    [1;34m65[0m:   [1;34m# Artist.all.collect{|a| a.name == input.chomp}.sort_by{|a|[0m
    [1;34m66[0m:   [1;34m#   binding.pry[0m
    [1;34m67[0m:   [1;34m#   a.song.name}.uniq.each.with_index(1) do |artist, index|[0m
    [1;34m68[0m:   [1;34m#     # binding.pry[0m
    [1;34m69[0m:   [1;34m#   puts "#{index}. #{artist.name}"[0m
    [1;34m70[0m: 
    [1;34m71[0m:   [1;34m# new_list = [][0m
    [1;34m72[0m:   [1;34m# Song.all.sort_by{|s| s.name}.uniq.each do |song|[0m
    [1;34m73[0m:   [1;34m#    if input.chomp == "#{song.artist.name}"[0m
    [1;34m74[0m:   [1;34m#    new_list << song unless new_list.include?(song)[0m
    [1;34m75[0m:   [1;34m#    elsif new_list.each.with_index(1) do |song, index|[0m
    [1;34m76[0m:   [1;34m#       puts "#{index}. #{song.name} - #{song.genre.name}"[0m
    [1;34m77[0m:   [1;34m#     end[0m
    [1;34m78[0m:   [1;34m#   end[0m
    [1;34m79[0m: 
    [1;34m80[0m:   [1;34m# Song.all.sort_by{|s| s.name}.uniq.collect.with_index(1) do |song, index|[0m
    [1;34m81[0m:   [1;34m#   if input.chomp == "#{song.artist.name}"[0m
    [1;34m82[0m:   [1;34m#     puts "#{index}. #{song.name} - #{song.genre.name}"[0m
    [1;34m83[0m:   [1;34m#   end[0m
    [1;34m84[0m: 
    [1;34m85[0m: [32mend[0m

