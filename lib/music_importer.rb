class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
    Dir[path+"/**/*.mp3"].collect{|e| e.split("/").last}
  end
  def import
    #Artist.clear_list
    self.files.each{|e| Song.create_from_filename(e)}
  end
end
