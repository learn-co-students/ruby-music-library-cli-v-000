require 'pry'
class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.glob("#{path}/*").map {|file| file.gsub("#{path}/", '')}
  end

  def import
    #binding.pry
    files.each { |file| Song.create_from_filename(file)}
  end
end
