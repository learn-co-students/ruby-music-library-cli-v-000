
class MusicImporter
  attr_accessor :path

  def initialize(path)
    self.path = path
  end

  def files
    Dir.entries(self.path).delete_if{|s| s.length < 3}
  end

  def import
    files.each {|s| Song.create_from_filename(s)}
  end

end  # End of Class
