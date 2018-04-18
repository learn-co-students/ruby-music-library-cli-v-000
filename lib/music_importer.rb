class MusicImporter
  attr_accessor :path

  def initialize(path)
    self.path = path
  end

  def files
    Dir.glob(self.path.strip + '/*.mp3') do |rb_file|
      # do work on files ending in .rb in the desired directory
    end
  end
end
