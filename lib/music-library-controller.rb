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
		elsif request.downcase == "list artists"
			Artist.all.each_with_index {|file, i|  puts "#{i+1}. #{file.name}"}
		elsif request.downcase == "list genres"
			Genre.all.each_with_index {|file, i|  puts "#{i+1}. #{file.name}"}
		end
	end
end