class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*.mp3").collect do |item|
      item.gsub("#{path}/", "")
    end
  end
end
