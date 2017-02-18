class MusicImporter

  attr_reader :path, :files

  files = []

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(@path).select {|f| /.*\.mp3$/ =~ f}
  end

  def import
    files.each { |file|
      Song.create_from_filename(file)}
  end

end
