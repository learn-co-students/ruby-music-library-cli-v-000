require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(@path).select {|file| !File.directory? file}
  end

  def import
    files.map { |f| Song.create_from_filename(f)}
  end

end
