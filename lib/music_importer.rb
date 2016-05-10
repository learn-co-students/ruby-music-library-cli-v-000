require 'pry'

class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
    file_prep
  end

  def file_prep
    temp_files = []
    Dir[path + '/*'].each { |file| temp_files << file }
    @files = temp_files.map { |file| file.split(path + '/').last }
  end

  def files
    @files
  end

  def import
    files.each { |file| Song.create_from_filename(file) }
  end
end
