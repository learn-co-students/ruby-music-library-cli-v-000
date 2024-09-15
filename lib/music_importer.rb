class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(@path).reject{|fn| fn == "." || fn == ".."}
  end

  def import
    files.each do |path|
      Song.create_from_filename(path)
    end
  end

end
