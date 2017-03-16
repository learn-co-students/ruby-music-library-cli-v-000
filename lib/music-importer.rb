class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir["#{@path}/*.mp3"]
    @files.each do |f|
      f.slice! "#{@path}/"
    end
  end

end
