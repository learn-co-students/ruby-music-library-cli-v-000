class MusicImporter
  attr_accessor :path 

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir[path + '/*'].collect do |file_name|
    file_name.split(/#{path + "/"}/)[1]
    end
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end

end