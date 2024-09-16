class MusicLibraryController

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = nil
    while input != "exit"
      input = gets.chomp.strip
      if input == "list songs"
        Song.all.each.with_index(1){|sng, indx| puts "#{indx}. #{sng.artist.name} - #{sng.name} - #{sng.genre.name}"}
      elsif input == "list artists"
        Artist.all.each{|a| puts "-#{a.name}"}
			elsif input == "list genres"
				Genre.all.each{|g| puts "#{g.name}"}
			elsif input == "play song"
				Song.all.each {|random_song| puts "Playing #{random_song.artist.name} - #{random_song.name} - #{random_song.genre.name}"}
			elsif input == "list artist"
				puts "Then give me a god damn artist!"
				artist_input = gets.strip
				artist = Artist.find_by_name(artist_input)
				artist.songs.each do |halp|
				  puts "#{halp.artist.name} - #{halp.name} - #{halp.genre.name}"
				end
			elsif input == "list genre"
				puts "May I have a genre, sweetie?"
				genre_input = gets.strip
				genre = Genre.find_by_name(genre_input)
				genre.songs.each do |halp|
					puts "#{halp.artist.name} - #{halp.name} - #{halp.genre.name}"
				end
      end
    end
  end
end
