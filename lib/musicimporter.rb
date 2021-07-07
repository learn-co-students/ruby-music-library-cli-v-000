class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
     Dir.new(self.path).each do |file|
       if file.length > 4
          files << file
        end
    end
     files
   end

   def import()
     files.each {|filename| Song.create_from_filename(filename)}
   end




end
