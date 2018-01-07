class MusicImporter
#=================properties===================
  attr_accessor :path, :files
#=================intialize====================
  def initialize(path)
    self.path = path
    @files = []
  end
#=================instance=====================
  def files
  	files = Dir.glob(self.path+"/*.mp3")
  	files.each { |file| @files << file.split(self.path+"/")[1] }
  	@files
  	# ?find out how to use .tap with this?
	end
	
	def import
  	self.files.each{|file|Song.create_from_filename(file)}
	end
#==============================================
end

