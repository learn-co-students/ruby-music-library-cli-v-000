require 'pry'
class MusicLibraryController
	attr_accessor :path, :files

	def initialize(path = './db/mp3s')
		#binding.pry
		music_importer = MusicImporter.new(path)
		@files = music_importer.import
	end

	def call(request = "")
		request = gets.chomp
		if request.downcase == "list songs"
			@files.each_with_index {|file, i|  puts "#{i+1}. #{file}"}
			puts gets.strip 
		elsif request.downcase == "list artists"
			Artist.all.each_with_index {|file, i|  puts "#{i+1}. #{file.name}"}
			puts gets.strip 
		elsif request.downcase == "list genres"
			Genre.all.each_with_index {|file, i|  puts "#{i+1}. #{file.name}"}
			puts gets.strip
		elsif request.downcase == "play song"
			puts gets.strip
			@files.each_with_index {|file, i|  puts "Playing #{file}"}
			puts gets.strip
		elsif request.downcase == "list artist"
			artist = gets.strip
			
			@files.each_with_index do |file, i|
				file = file.split (" - ")
				if file[0] == artist
					file = file.join(" - ")
				puts "#{file.scan(/(^.+).mp3$/)[0].join}"
				end
			end
			puts gets.strip
		elsif request.downcase == "list genre"
			genre = gets.strip
			
			@files.each_with_index do |file, i|
				file = file.split (" - ")
				if file[2] == "#{genre}.mp3"
					file = file.join(" - ")
				puts "#{file.scan(/(^.+).mp3$/)[0].join}"
				end
			end
			puts gets.strip
		end
			
	end
end