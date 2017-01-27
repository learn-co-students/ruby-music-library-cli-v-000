class MusicImporter
  attr_accessor :path

  def initialize(url)
    @path = url.to_s
  end

  def files
    Dir.entries(@path).reject{|x| x == "." || x == ".."}
  end

  def import
    self.files.each do |x|
      Song.create_from_filename(x)
    end
  end

end
