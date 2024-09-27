class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).reject {|entry| entry == "." || entry == ".."}
  end

  def import
    files.each {|file_name| Song.create_from_filename(file_name)}
  end

end
