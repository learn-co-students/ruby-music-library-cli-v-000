class MusicImporter
  extend Concerns::Findable
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).reject{|file| file == "." || file == ".."}
  end

  def import
    self.files.each { |f|  Song.create_from_filename(f)}
  end


end
