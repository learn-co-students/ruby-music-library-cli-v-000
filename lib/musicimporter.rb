class MusicImporter
  
  attr_accessor :path
  attr_reader :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(path).select {|f| !File.directory? f}
  end

  def import
    files
    @files.collect {|f| Song.create_from_filename(f)}
  end

end