class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
    Dir["#{path}/*"].map {|x| x.gsub("#{path}/", "")}
    binding.pry
  end
end
