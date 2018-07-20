class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir.new(self.path).each do |file|
      files << file if file.size > 4
    end
    files
  end

  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end
end
