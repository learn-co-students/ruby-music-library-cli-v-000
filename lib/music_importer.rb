class MusicImporter

attr_accessor :path
    # retrieves the path provided to the MusicImporter object

def initialize(path)
  @path = path
      #accepts a file path to parse MP3 files from
end

def files
  @files = Dir.entries("#{@path}").select {|file| file.include?('.mp3')}
      # loads all the MP3 files in the path directory
      # normalizes the filename to just the MP3 filename with no path
end

def import
    files.each{|file| Song.create_from_filename(file) }
      # imports the files into the library by invoking Song.create_from_filename
    end


end
