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
			if x == "list songs"
				self.list_songs			
			elsif x != "exit"
				self.call
			end
		end				
	end
	
	def commands
		puts "list songs"
	end
	
	def list_songs
		Song.all.each_with_index do |o, i|
			binding.pry
			puts "#{i + 1}. #{o}"
			
		end
	end
	
	
	
end
	
