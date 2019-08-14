class MusicImporter
attr_reader :path

      def initialize(path) # accepts a file path to a directory of MP3 files.
      @path = path
      end


      def files # returns all of the imported filenames.
      @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
      end

      def import # imports all of the files from the library, instantiating a new Song object for each file.
      files.each{ |f| Song.create_from_filename(f) }
      end

end #end class
