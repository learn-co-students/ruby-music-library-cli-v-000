class MusicImporter
   attr_reader :path

   def initialize(path)
     @path = path
   end

   def files
     @files = Dir.entries(@path) - [".", ".."]
   end

   def import
     self.files
     @files.each do |filename|
       Song.create_from_filename(filename)
     end
   end

 end
