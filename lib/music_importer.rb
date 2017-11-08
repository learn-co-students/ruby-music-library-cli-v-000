class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*mp3").collect {|f| f.gsub("#{path}/","")}
  end

  def self.import
  end

end
