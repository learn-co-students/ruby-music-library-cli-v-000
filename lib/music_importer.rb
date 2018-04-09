class MusicImporter

attr_accessor :path

def initialize(path)
  @path = path
      #accepts a file path to parse MP3 files from
      #retrieves the path provided to the MusicImporter object
end

def files
  @files = Dir.entries("#{@path}").select {|file| file.include?('.mp3')}
      # loads all the MP3 files in the path directory
      # normalizes the filename to just the MP3 filename with no path
end

def import
    files.each{|file| Song.create_from_filename(file) }
    end


end
