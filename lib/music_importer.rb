class MusicImporter
  attr_accessor :files, :path
  def initialize(path)
  	@path = path
  	@files = []
  end

  def files
  	new_files = Dir.glob(@path+"/*.mp3")
  	new_files.each do |file|
  	  @files << file.split(@path+"/")[1]
  	end
  	@files
  end

  def import
  	files
  	@files.map do |file|
  	  Song.create_from_filename(file)
  	end
  end

end