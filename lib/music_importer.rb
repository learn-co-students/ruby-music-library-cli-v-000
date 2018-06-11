require 'pry'
class MusicImporter
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    @path = path
  end

  def files
    files = Dir.glob("#{path}/*")
    files.map { |f| f.split("#{path}/")[1] }
  end

  def import
    files.each{|s| Song.create_from_filename(s)}
  end
end
