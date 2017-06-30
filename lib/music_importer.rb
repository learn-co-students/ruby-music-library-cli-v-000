require "pry"
class MusicImporter

  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    files = Dir["#{path}/*.mp3"].collect { |song| song.gsub("#{path}/","")}
  end

  def import
    files.each { |filename| Song.create_from_filename(filename)}
  end

end
