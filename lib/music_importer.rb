class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{self.path}/*.mp3").collect {|file| file.split("/").last}
  end

  def import
    files.each {|filename| Song.create_from_filename(filename)}  # iterates over array returned from files method, creates new song instance for each filename in the array
  end

end