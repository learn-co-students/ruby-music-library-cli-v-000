require 'pry'
class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[path + '/*'].map { |file| file.split(path + '/').last }
  end

  def import
    files.each { |file| Song.create_from_filename(file) }
  end
end
