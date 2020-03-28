class MusicImporter
  attr_reader :path #retrieves the path provided to the MusicImporter object

  def initialize(path)
    @path = path  #accepts a file path to parse MP3 files from
  end

  def files
    @files = []
    Dir.entries(self.path).each do |file| #loads all the MP3 files in the path directory
      if file.include?(".mp3")
      @files << File.basename(file) #normalizes the filename to just the MP3 filename with no path
      end
    end
    @files
  end

  def import  #imports all files from the library and instantiates a new Song object for each file
     self.files.each  {|filename| Song.create_from_filename(filename)}
  end
end
