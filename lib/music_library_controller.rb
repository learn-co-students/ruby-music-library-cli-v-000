class MusicLibraryController

	attr_accessor :path 

	def initialize(path='./db/mp3s')
		@path = path
		@list = MusicImporter.new(path).import
		@list.sort! if @list != nil
	end

	def call
		list_copy = @list
		input = gets.strip
		@list.each_with_index do |file, idx|
			file.gsub!('.mp3', '') 
			file_split = file.split(" - ")

			case input
			when "list songs"
				puts "#{idx+1}. #{file}"
			when "list artists"
				puts "#{file_split[0]}"
			when "list genres"
				puts "#{file_split[2]}"
			when "play song"
				input = gets.strip.to_i
				puts "Playing #{file}" if idx+1 == input
			when "list artist"
				input = gets.strip
				list_copy.each_with_index do |file_2, index|
					file_split_2 = file_2.split(" - ")
					puts "#{file_2}" if input == file_split_2[0]
				end
			when "list genre"
				input = gets.strip
				list_copy.each_with_index do |file_2, index|
					file_2.gsub!('.mp3', '') 
					file_split_2 = file_2.split(" - ")
					puts "#{file_2}" if input == file_split_2[2]
				end
			end
		end

		gets.strip if input != "exit" #in order to receive 'exit' input
	end
end