class MusicImporter
  attr_accessor :path, :files

  def initialize(file_path)
    self.path = file_path
  end

  def files
    self.files = Dir["#{self.path}" + "/*"].select{ |f| File.file? f }.map{ |f| File.basename f }
  end

  def import
    self.files.each { |file| Song.create_from_filename(file) }
  end
end
