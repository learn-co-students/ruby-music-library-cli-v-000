class MusicImporter
attr_reader :path
  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}").map { |file| file.gsub("#{path}")}
  end


end

#video 13:11
