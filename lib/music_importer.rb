require 'pry'

class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    Dir.foreach(self.path) do |file|
      next if file == '.' || file == '..'
      @files << file
    end
    @files
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
