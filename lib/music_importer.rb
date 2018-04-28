require 'pry'

class MusicImporter

  attr_accessor :path, :filenames

  def initialize(path)
    @path = path
  end

  def files
    d = Dir[@path + "/*"]
    d.collect! do |fname|
      fname = fname.split(@path+"/").last
    end
  end

  def import
    files.each do |fname|
      Song.create_from_filename(fname)
    end
  end

end
