class MP3Importer

   attr_accessor :path

   def initialize(path)
     @path = path
     @files = []
   end

   def import
     self.files.collect do |file_name|
       Song.new_by_filename(file_name)
     end
   end

   def files
     Dir.new(@path).collect do |file|
       if file.include?(".mp3")
         @files << file
       end
     end
     @files
   end
 end

new_library = MP3Importer.new("./spec/fixtures/mp3s")
