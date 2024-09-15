

newArray = []
i = 0
while i < 5 do
  newArray << Song.all[i]
  i += 1
end

# newArray[0].name  => "Grown Ocean"

secondArray = newArray.sort_by { |obj| obj.name }

#-----
 main = MusicLibraryController.new('./spec/fixtures/mp3s')

 re = Artist.find_by_name("Real Estate")
 re.songs.count #=>2

#result of list_songs
1. Thundercat - For Love I Come - dance
2. Real Estate - Green Aisles - country
3. Real Estate - It's Real - hip-hop
4. Action Bronson - Larry Csonka - indie
5. Jurassic 5 - What's Golden - hip-hop