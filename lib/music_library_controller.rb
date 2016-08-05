require 'pry'
class MusicLibraryController
	attr_accessor :path

	def initialize(path = './db/mp3s')
		@path = path
		MusicImporter.new(path).import
	end

	def call
		self
		a = []
		loop do
		b = gets.strip
		a << b
		break if b == "exit"
		end
	return a
	end

end
