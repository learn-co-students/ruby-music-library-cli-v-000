
require 'pry'
class MusicImporter
  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    Dir.glob("#{@path}/*").collect{|file| file.gsub("#{@path}/", "")}
  end

  def import
    files.collect {|file| Song.create_from_filename(file)}
  end

end
