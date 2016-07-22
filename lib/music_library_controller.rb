require 'pry'

class MusicLibraryController

	def initialize(path = "./db/mp3s")
		MusicImporter.new(path).import
	end

	# def call
	# 	input = ""
	# 	while input != "exit"
	# 		puts "Welcome to your music library!"
	# 		input = gets.strip
	# 		case input
	# 		when "list songs"
	# 			Song.all.each.with_index(1) do |song, i|
	# 				puts "#{i}. #{song.name}"
	# 			end
	# 		when "list artists"
	# 			Artist.all.each.with_index do(1) |artist, i|
	# 				puts "#{i}. #{artist.name}"
	# 			end
	# 		when "list genres"
	# 			Genre.all.each.with_index(1) do |genre, i|
	# 				puts "#{i}. #{genre.name}"
	# 			end
	# 		when "list artist"
	# 			puts "What artist by name you like to list songs for?"
 #    			artist_input = gets.strip
 #    			if artist = Artist.find_by_name(artist_input)
 #      				artist.songs.each do |s,i|
 #        				puts "#{i}. #{s}"
 #      				end
	# 				end
	# 		when "list genre"
	# 			genre_input = gets.strip
 #    		if genre = Genre.find_by_name(genre_input)
 #      		genre.songs.each do |s,i|
 #        		puts "#{i}. #{s}"
 #        	end
 #      	end
	# 		end
	# 	end
	# end

	def call
    input = ""
    while input != "exit"
      puts "Welcome to Your Music Library!"
      puts "What would you like to do?"
      input = gets.strip
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song
      end
    end
  end

  def artists
    Artist.all.each.with_index(1) do |a, i|
      puts "#{i}. #{a.name}"
    end
  end

  def genres
    Genre.all.each.with_index(1) do |g, i|
      puts "#{i}. #{g.name}"
    end
  end

  def list_artist
    puts "What artist by name you like to list songs for?"
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each do |s,i|
        puts "#{i}. #{s}"
      end
    end
  end

  def list_genre
    puts "What genre by name you like to list songs for?"
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each do |s,i|
        puts "#{i}. #{s}"
      end
    end
  end

  def play_song
    puts "What song number would you like to play?"
    song_input = gets.strip
    puts "Playing #{Song.all[song_input.to_i-1]}"
  end

  def songs
    Song.all.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end


end

# rspec spec/011_music_library_controller_spec.rb
# rspec spec/012_musiclibrary_cli_spec.rb





