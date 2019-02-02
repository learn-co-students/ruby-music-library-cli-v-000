require 'pry'

class MusicImporter
	attr_accessor :path, :files

# run the importer as:
# MusicImporter.new.import

	def initialize(path)
		@path = path # path will be ./spec/fixtures/mp3s'
	end
# at #initialize, new importer has a directory path

# #files reads mp3 files from @path
# then parses @files to contain string filenames, no path
  def files
		(Dir.glob("#{@path}/*.mp3")).map do |path_filename|
		  @files = File.basename(path_filename)
		end
	end

# #import calls #files method
# to look in MusicImporter.new object's path
# parse out filenames then import
# creates new Song from each filename
	def import
		self.files.each do |filename|
      Song.create_from_filename(filename)
  	end
	end
end #class end below
