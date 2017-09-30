class MusicImporter
    attr_accessor :path
  
    def initialize(path)
      @path = path
    end
  
    def files
      raw_files = Dir[@path + "/*"]
      cleaned_files = []
      raw_files.each {|file| cleaned_files << File.basename(file)}
      cleaned_files
    end
  
    def import
      files.each {|file|
        # binding.pry
        Song.create_from_filename(file)
      }
    end
  
  
  end
  