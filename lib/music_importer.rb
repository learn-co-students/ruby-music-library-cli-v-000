class MusicImporter
  attr_reader :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(path).select {|f| !File.directory? f }
  end

  def import
    files.each{|f| Song.create_from_filename(f)} #had @files which never called files method
  end

end
