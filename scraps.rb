

newArray = []
i = 0
while i < 5 do
  newArray << Song.all[i]
  i += 1
end

# newArray[0].name  => "Grown Ocean"

secondArray = newArray.sort_by { |obj| obj.name }


 x = MusicLibraryController.new('./spec/fixtures/mp3s')