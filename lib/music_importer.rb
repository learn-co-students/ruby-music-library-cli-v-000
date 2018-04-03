class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{@path}/*"].map {|file| file.gsub("#{@path}/", "")}
  end

  def import
    bing = files
    binding.pry
  end

end
