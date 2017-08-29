require 'pry'
class MusicImporter
	

	def initialize(path)
		@path = path
	end

	def path
		@path
	end

	def files
		files = []
		Dir.glob("#{path}/*.mp3") do |f|
			#binding.pry
			files << f.gsub("#{path}/", "")
			
		end
		files
	end

	def import
		#binding.pry
		song_files = files.uniq

		song_files.each {|n|Song.create_from_filename(n)}
	end


end
