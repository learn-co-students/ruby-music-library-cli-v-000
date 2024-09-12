class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
  @files ||=  Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each do |files|
      Song.create_from_filename(files)
    end
  end 
end
