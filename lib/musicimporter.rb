class MusicImporter
  @@files = []

  attr_accessor :path

  def initialize(file_path)
    @path = file_path

  end

  def files
    Dir["#{@path}/**/*.mp3"].each do |file_name|
      @@files << file_name.gsub!(/.\/spec\/fixtures\/mp3s\//,"")
    end
  end

  def import
    @@files.each do |file_name|
      Song.new(file_name)
    end
  end

end
