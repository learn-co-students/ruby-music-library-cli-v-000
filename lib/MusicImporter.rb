class MusicImporter

  attr_accessor :path

  @@files = []

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).reject{|entry| entry == "." || entry == ".."}
  end

  def import
    self.files.each do |filename|
       Song.create_from_filename(filename)
     end
  end

end
