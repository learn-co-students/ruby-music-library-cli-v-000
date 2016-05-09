require 'pry'

class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
    files
  end

  def files
    temp_files = []
    Dir[path + '/*'].each { |file| temp_files << file }
    @files = temp_files.map { |file| file.split(path + '/').last }
  end

  def import
    # binding.pry
    @files.each { |file| Song.create_from_filename(file) }
    # binding.pry
  end
end
