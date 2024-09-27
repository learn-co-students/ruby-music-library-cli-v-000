require 'pry'
class MusicLibraryController

	def initialize(path="./db/mp3s")
		@library = MusicImporter.new(path)
		@library.import
		build_library_hash
	end

	def call
		input = ""
		while input != "exit" do
			input = gets.chomp
			if input == "list songs"
				@library_hash.each_with_index { |(key, value), i| puts "#{i + 1}. #{key}" }
			end
			if input == "list artists"
				output_values(:artist_name)
			end
			if input == "list genres"
				output_values(:genre)
			end
			if input == "play song"
				song_number = gets.chomp.to_i
				puts "Playing #{@library.files[song_number - 1]}"
			end
			if input == "list artist"
				artist = gets.chomp
				list_filenames_with_value(:artist_name, artist)
			end
			if input == "list genre"
				genre = gets.chomp
				list_filenames_with_value(:genre, genre)
			end
		end
	end

	def build_library_hash
  		@library_hash = {}
  		@library.files.each do |filename|
  			name = File.basename(filename, ".mp3")
  			filename_array = name.split(" - ")
  			@library_hash[filename] = {
  				artist_name: filename_array[0],
  				song_name: filename_array[1],
  				genre: filename_array[2]
  			}
  		end
	end

	def output_values(attribute_name)
		values = []
		@library_hash.each do |key, attributes_hash| 
			attributes_hash.each do |attribute, value|
				if attribute == attribute_name
					values << value
				end
			end
		end 
		values.uniq.each { |value| puts "#{value}"}
	end

	def list_filenames_with_value(attribute_name, value_name)
		@library_hash.each do |key, attributes_hash| 
			attributes_hash.each do |attribute, value|
				if attribute == attribute_name && value == value_name
					puts "#{key}"
				end
			end
		end 
	end
end