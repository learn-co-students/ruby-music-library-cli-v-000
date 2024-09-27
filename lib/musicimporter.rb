class MusicImporter

  attr_accessor :path

  def initialize(path)
    self.path = path
  end

  def files
    files = Dir.entries(self.path)
    files.delete_if { |item| !item.end_with?('.mp3') }
  end

  def import
    self.files.each { |filename| Song.create_from_filename(filename) }
  end

end
