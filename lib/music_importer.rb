class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(self.path).select {|f| !File.directory? f}
  end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end