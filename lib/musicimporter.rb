class MusicImporter

    attr_accessor :path
    
  
      def initialize(path)
          @path = path
          @@all = []
      end
  
      def files        
          Dir.entries(path).reject {|item| item == ".." || item == "."}  
      end
  
      def import
          files.each {|file| Song.create_from_filename(file)}
      end
  
end