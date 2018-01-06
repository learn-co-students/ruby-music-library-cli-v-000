class MusicImporter
#=================properties===================
  attr_accessor :path, :files
#=================intialize====================
  def initialize(path)
    self.path = path
  end
#=================instance=====================
  def files
    files = Dir.glob(@path+"/*.mp3")
  end
#==============================================
end
