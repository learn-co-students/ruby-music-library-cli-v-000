require "pry"
class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.foreach(@path).select { |x| File.file?("#{@path}/#{x}") }
  end

  def import
    @files = files
    @files ? @files.each { |filename| Song.create_from_filename(filename) } : ""
  end

end
