require_relative 'music_importer.rb'

class MusicLibraryController
	def initialize(path='./db/mp3s')
		@import = MusicImporter.new(path)
		@import.import
	end
	
	def call
		loop do
		puts "Give me some input"
		@get = gets.chomp
		case @get
		when 'list songs'
			@import.all.each do |x|
				puts "#{@import.all.index(x)+1}. " + x
			end
		when 'list artists'
			Artist.all.each { |x| puts x.name }
		when 'list genres'
			Genre.all.each { |x| puts x.name }
		when 'play song'
			puts "What song number?"
			song = gets.chomp
			puts "Playing #{@import.all[song.to_i-1]}"
		when 'list artist'
			puts "What artist?"
			artist = gets.chomp
			print = @import.all.select { |x| x.include?(artist)}
			print.each { |x| puts x }
		when 'list genre'
			puts "What genre?"
			genre = gets.chomp
			print = @import.all.select { |x| x.include?(genre)}
			print.each { |x| puts x }
		when 'exit'
			break
		else
			puts "not recognized"
		end
	end
		@get
	
	end	
end