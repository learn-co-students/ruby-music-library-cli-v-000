class MusicLibraryController
  attr_accessor = :importer, :songs
  def initialize(path='./db/mp3s')
  	@importer = MusicImporter.new(path)
  	@songs = @importer.import
  end

  def call
  	puts "Welcome to your music library!"
  	puts "To list all of your songs, enter 'list songs'."
  	puts "To list all of the artists in your library, enter 'list artists'."
  	puts "To list all of the genres in your library, enter 'list genres'."
  	puts "To list all of the songs by a particular artist, enter 'list artist'."
  	puts "To list all of the songs of a particular genre, enter 'list genre'."
  	puts "To play a song, enter 'play song'."
  	puts "To quit, type 'exit'."
  	puts "What would you like to do?"
  	exit_prompt = false
  	while exit_prompt == false
  	  input = gets.strip
  	  if input == "exit"
  	  	exit_prompt = true
  	  elsif input == "list songs"
  	  	list_songs
  	  elsif input == "list artists"
  	  	list_artists
  	  elsif input == "list genres"
  	  	list_genres
  	  elsif input == "list artist"
  	  	list_songs_by_artist
  	  elsif input == "list genre"
  	  	list_songs_by_genre
  	  elsif input == "play song"
  	  	play_song
  	  else puts "Invalid selection"
  	  end
  	end
  end

  def list_songs
  	ordered_list = Song.all.sort do |a,b|
  		a.name <=> b.name
  	end
  	ordered_list.each_with_index do |song, i|
  		puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  	end
  end

  def list_artists
  	ordered_list = Artist.all.sort do |a,b|
  		a.name <=> b.name
  	end
  	ordered_list.each_with_index do |artist, i|
  		puts "#{i+1}. #{artist.name}"
  	end
  end

  def list_genres
  	ordered_list = Genre.all.sort do |a,b|
  		a.name <=> b.name
  	end
  	ordered_list.each_with_index do |genre, i|
  		puts "#{i+1}. #{genre.name}"
  	end
  end

  def list_songs_by_artist
  	puts "Please enter the name of an artist:"
  	desired_artist = gets.strip
  	artist = Artist.all.detect{|artist| artist.name == desired_artist}
  	if artist != nil
  		sorted_songs = artist.songs.sort do |a,b|
  			a.name <=> b.name
  		end
  		sorted_songs.each_with_index do |song, i|
  			puts "#{i+1}. #{song.name} - #{song.genre.name}"
  		end
  	end
  end

  def list_songs_by_genre
  	puts "Please enter the name of a genre:"
  	desired_genre = gets.strip
  	genre = Genre.all.detect{|genre| genre.name == desired_genre}
  	if genre != nil
  		sorted_songs = genre.songs.sort do |a,b|
  			a.name <=> b.name
  		end
  		sorted_songs.each_with_index do |song, i|
  			puts "#{i+1}. #{song.artist.name} - #{song.name}"
  		end
  	end
  end

  def play_song
  	puts "Which song number would you like to play?"
  	desired_song = gets.strip
    desired_song = desired_song.to_i
  	if desired_song != 0
  		#puts "#{desired_song}"
  		sorted_songs = Song.all.sort do |a,b|
  			a.name <=> b.name
      end
  		sorted_songs.each_with_index do |song, i|
  			if desired_song == i+1
  				puts "Playing #{song.name} by #{song.artist.name}"
  			end
  		end
  		#if desired_song <= Song.all.count
  			
  		#end
    end
  end
end