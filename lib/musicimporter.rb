class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each{ |filename| Song.create_from_filename(filename)}
  end
end #class
