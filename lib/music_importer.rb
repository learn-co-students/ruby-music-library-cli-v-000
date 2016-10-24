class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(@path)
    files.delete_if {|e| e == "." || e == ".."}
    files
  end

  def import
    files.each{|f| Song.create_from_filename(f)}
  end

end
