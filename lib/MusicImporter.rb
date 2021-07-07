

class MusicImporter

  attr_accessor :path
  def initialize(path)
    @path = path
  end


  def files
  files = Dir.entries("#{@path}").select {|f| !File.directory? f}
  end

  def import
  files.each {|x| Song.create_from_filename(x)}
  end

end
