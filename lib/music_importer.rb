require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = []
    Dir.foreach(@path) do |file|
      next if file == "." or file == '..'
      @files << file
    end
    @files
  end

  def path
    @path
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
