class MusicImporter

   attr_accessor :path, :files

   def initialize(path)
     @path = path
     @files = Dir.entries(path).grep(/.mp3/)
   end

   def import
     self.files.each {|file| Song.create_from_filename(file)}
   end
end


new_library = MusicImporter.new("./spec/fixtures/mp3s")
