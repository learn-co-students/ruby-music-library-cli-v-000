require 'pry'

class MusicImporter
  extend Concerns::Findable

  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{@path}/*")
    @files = @files.collect {|file| file.split("#{@path}/")[1]}
  end

  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end
end
