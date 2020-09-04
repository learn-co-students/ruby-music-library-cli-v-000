# require 'pry'
class MusicImporter
  
      attr_accessor :path
     
      def initialize(path)
       @path = path   
      end
      
      
      def files
        Dir.each_child(path).map{|filename| filename}
        
        # Dir.entries(path)-[".", ".."]
      end
      
      
      # --------------------------------------
    #   #import
    # imports the files into the library by invoking Song.create_from_filename (FAILED - 1) 
      
      
       def import
        song = Song.create_from_filename(file)
      end
      
    #   NameError:
    #   undefined local variable or method `file' for #<MusicImporter:0x0000000001e5ca80 @path="./spec/fixtures/mp3s">
    #   Did you mean?  files
    # # ./lib/musicimporter.rb:18:in `import'
    # # ./spec/009_music_importer_spec.rb:83:in `block (3 levels) in <top (required)>'
    
    
    
      
      def import(file)
        song = Song.create_from_filename(file)
      end
      
    #   1) MusicImporter #import imports the files into the library by invoking Song.create_from_filename
    # Failure/Error:
    #   def import(file)
    #     song = Song.create_from_filename(file)
    #   end

    # ArgumentError:
    #   wrong number of arguments (given 0, expected 1)
    
    
    
    def import
        
    end
      

end