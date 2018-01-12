module Concerns::CLI
#==================songs=======================
  def list_songs
  	list = Song.all.sort{|a,b| a.name <=> b.name}
  	list.each_with_index{|s,i| puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end
#=================artists======================
  def list_artists
  	list = Artist.all.sort{|a,b| a.name <=> b.name}
  	list.each_with_index{|o,i| puts "#{i+1}. #{o.name}"}
  end
#=================genres=======================
  def list_genres
  	list = Genre.all.sort{|a,b| a.name <=> b.name}
  	list.each_with_index{|o,i| puts "#{i+1}. #{o.name}"}
  end
#================by_artist=====================
  def list_songs_by_artist
  	puts "Please enter the name of an artist:"
  	input = gets.strip
  	artist = Artist.find_by_name(input)

  	if artist != nil then
  	#OrderList
  	list = artist.songs.sort{|a,b| a.name <=> b.name}
  	list.each_with_index{|o,i| puts "#{i+1}. #{o.name} - #{o.genre.name}"} end
  end
#================by_genre======================
  def list_songs_by_genre
  	puts "Please enter the name of a genre:"
  	input = gets.strip
  	genre = Genre.find_by_name(input)

  	if genre != nil then
  	#OrderList
  	list = genre.songs.sort{|a,b| a.name <=> b.name}
  	list.each_with_index{|o,i| puts "#{i+1}. #{o.artist.name} - #{o.name}"} end
  end
#==================PLAY========================
  def play_song
  	puts "Which song number would you like to play?"
  	input = gets.strip.to_i

  	if input != 0 || input <= Song.all.count then
	  #OrderList
	  list = Song.all.sort{|a,b| a.name <=> b.name}
	  list.each_with_index{|song, i| puts "Playing #{song.name} by #{song.artist.name}" unless input != i+1} end
  end
#==============================================
end
