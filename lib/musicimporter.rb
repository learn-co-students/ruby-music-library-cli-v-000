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

def import
  files.each do |filename|
    Song.create_from_filename(filename)
    end
  end
end
