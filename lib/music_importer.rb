class MusicImporter
  attr_accessor :path

  def initialize(path)
    self.path = path
  end

  def files
    Dir.entries("#{path}").select{|filename| filename.include?("mp3")}
  end

end
