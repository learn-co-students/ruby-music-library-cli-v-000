require 'pry'

class MusicLibraryController

	attr_accessor :path, :call
	
	def initialize(path='./db/mp3s')
		music_importer = MusicImporter.new(path)
		music_importer.import
	end
		
	def call
		begin
			puts "What would you like me to do?"
			puts "Type 'options' for a list of available commands or type 'exit' to exit"
			x = gets.strip
			if x != "exit"
				self.call
			end
		end				
	end
	
	
	
end
	
