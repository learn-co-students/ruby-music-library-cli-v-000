class MusicImporter

  attr_reader :path

  def initialize(filepath)
    @path = filepath
  end

  def files
    @files = Dir.entries(@path)
    @files.delete_if {|file| file == "." || file == ".."}
  end

end
