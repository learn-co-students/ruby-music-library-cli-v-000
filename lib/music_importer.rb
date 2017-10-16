class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(path).select {|f| !File.directory? f }
  end

  def import
    files.each{|f| Song.new_from_filename(f)}
  end

end
