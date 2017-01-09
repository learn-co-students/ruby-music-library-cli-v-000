class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[path + "/*"].collect{|name| name.split('/')[-1]}
  end
end
