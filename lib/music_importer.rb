require 'pry'

class MusicImporter

	attr_accessor :path 

	def initialize(file_path)
		@path = file_path
	end

	def files
		Dir.entries(@path).select { |file| file.include?('.mp3') }
	end

	def import
		self.files.each do | filename|
			filename = filename.gsub(".mp3","")
			song_data = filename.split (" - ")

			song_name = song_data[1]
			genre_name = song_data[2]
			artist_name = song_data[0]

			song = Song.find_or_create_by_name(song_name)
			song.artist = Artist.find_or_create_by_name(artist_name)
			song.genre = Genre.find_or_create_by_name(genre_name)
		end
	end
end
