
class MusicImporter
  
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    files = []
    Dir.glob("#{path}/*.mp3").each do |file_name|
      files << file_name.gsub("#{path}/", "")
    end
  end
  
end
