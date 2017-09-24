class MusicLibraryController

	def initialize(path= "./db/mp3s")
		MusicImporter.new(path).import
	end

	def call
		puts "Welcome to Your Music Library"
		input = ""
		until input=="exit"
			puts "What would you like to do?"
			input = gets.chomp
			case input
			when "list songs"
				i=0
				Song.all.sort{|a,b|a.artist.name <=> b.artist.name}.each do |s|
					i+=1
					puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
				end  
			when "list artists"
				Artist.all.each{|a| puts a.name}
			when "list genres"
				Genre.all.each{|g| puts g.name}
			when "play song"
				puts "Which song?"
				num = gets
				s = Song.all.sort{|a,b|a.artist.name <=> b.artist.name}[num.to_i-1]
				puts "Playing #{s.artist.name} - #{s.name} - #{s.genre.name}"
			when "list artist"
				art = gets
				Artist.all.find{|a| a.name == art}.songs.each{|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
			when "list genre"
				gen = gets
				Genre.all.find{|a| a.name == gen}.songs.each{|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
			end

		end
	end

end