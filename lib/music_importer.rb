class MusicImporter
  attr_reader :path, :files
  def initialize(path)
    @path = path
    @files = Dir.entries(path).sort.select {|f| !File.directory? f}
  end
  def import
    @files.each { |filename| Song.create_from_filename(filename)}
  end
end
