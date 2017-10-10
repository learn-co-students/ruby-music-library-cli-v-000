class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    #loads all the mp3 files in the path directory
    Dir.glob(path)

    #normalizes the filename to just the mp3 filename with no path
    Dir.entries(path).select {|f| !File.directory? f}
  end

  def import
    list_of_filenames = self.files

    list_of_filenames.each {|filename| Song.create_from_filename(filename)}
  end

end
