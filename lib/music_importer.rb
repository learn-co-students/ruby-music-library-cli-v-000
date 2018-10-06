class MusicImporter 

    # Retrieves the path provided to the MusicImporter object
    attr_reader :path, :music_library_controller

    # Accepts a file path to a directory of MP3 files to parse.
    def initialize (path)
        @path = path
    end

    # Returns all of the imported filenames
    
    # Loads all the MP3 files in the path directory
    # Normalizes the filename to just the MP3 filename with no path
    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end

    def import
        files.each do |file| 
            Song.create_from_filename(file) 
        end
      end
end