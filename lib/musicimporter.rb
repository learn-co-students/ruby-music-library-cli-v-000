class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

def files
  filelist = Dir.glob("#{@path}/*.mp3")
  filelist.map do |file|
    file.gsub!("#{@path}/","")
  end
  filelist
end
end
