class MusicImporter

  attr_accessor :path, :file

  def initialize(path)
    @path = path
  end

  def files
    @file = Dir["#{self.path}/*"]
    @file.map { |file| file.slice!("#{self.path}/")}
    @file

  end

  def import
    self.files.each { |file| Song.create_from_filename(file)  }
    # binding.pry
  end
# binding.pry
end
