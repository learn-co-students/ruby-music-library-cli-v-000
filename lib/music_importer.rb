class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    list_of_filenames = Dir[self.path + "/*.mp3"]
    list_of_filenames.each {|filename| filename.slice! self.path + "/"}
  end

  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end

end
