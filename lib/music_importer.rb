class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    list_of_files = Dir.entries(@path)
    list_of_files.select{|x| x.end_with?(".mp3")}
  end

  def import
    self.files.each{|filename| Song.create_from_filename(filename)}
  end

end
