class MusicImporter

  attr_accessor :filename, :path

def initialize(path)
   @path = path
   @filename_array = [] #initialize empty array
 end

 def files # loads all the mp3 files in the path directory to the filename array
   @filename_array = Dir.foreach(@path).select {|x| File.file?("#{@path}/#{x}")}
 end

 def import
   self.files #load all filenames into the @filename_array
   @filename_array.each do |file_name| #iterate over each file_name
   Song.create_from_filename(file_name) #create new song and pass in file_name
   end
 end

end
