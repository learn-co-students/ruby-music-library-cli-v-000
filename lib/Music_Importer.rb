class MusicImporter
extend Concerns::Findable
   attr_accessor :path

   def initialize(path)
     @path = path
   end

   def files
     files1 = []
     directory = Dir["#{@path}/*.mp3"]
     files1 = directory.collect do |file|
          file.split("p3s/")
     end
     files1 = files1.flatten
     files = []
     files1.each do |file|
        if file.include?(" ") == true
         files << file
        end
     end
     return files
   end

   def import
     files.each do |file|
       Song.create_from_filename(file)
     end
   end

end
