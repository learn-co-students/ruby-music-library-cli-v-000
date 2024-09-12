class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    self.path = path
  end

  def files
    Dir.glob("#{@path}/*").collect do |file|
      file.split("/")[4]
    end
  end

  def import
    files.each {|files| Song.create_from_filename(files)}
  end

end
