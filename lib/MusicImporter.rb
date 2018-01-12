class MusicImporter
#=================properties===================
  attr_accessor :path, :files
#=================intialize====================
  def initialize(path)
    self.path = path
    self.files = []
  end
#=================instance=====================
  def files
  	files = Dir.glob(self.path+"/*.mp3")
  	files.each { |file| @files << file.split(self.path+"/")[1] }
  	@files
	end
	
	def import
  	self.files.each{|file| Song.create_from_filename(file)}
	end
#==============================================
end

