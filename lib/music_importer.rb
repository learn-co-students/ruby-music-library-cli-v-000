class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    files_arr = Dir.entries(path).reject {|file| !(file.include?('.mp3'))}
  end

  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end
end