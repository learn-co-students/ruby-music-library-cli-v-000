class MusicImporter

  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  # loads all the MP3 files in the path directory
  # normalizes the filename to just the MP3 filename with no path
  def files
    Dir.new(@path).collect do |file|
      if file.include?(".mp3")
        @files << file
      end
    end
    @files
  end

  # imports the files into the library
  def import
    self.files.collect do |filename|
      Song.create_from_filename(filename)
    end
    @files
  end

end
