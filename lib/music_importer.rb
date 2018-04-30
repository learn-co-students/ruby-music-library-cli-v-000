class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    file_list = Dir.glob("#{@path}/*.mp3")
    file_list
    file_list.map do |file|
      parsed_files = file.split( '/' )[4]
    end
  end
  
  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end

end