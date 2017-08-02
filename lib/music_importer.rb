class MusicImporter
  attr_accessor :path

  def initialize(file_path)
    @path = file_path
  end

  def files
    @files ||= Dir.entries(@path).map { |file| file if file.length > 2 }.compact
  end

  def import
    self.files.each { |file| Song.create_from_filename(file) }
  end
end