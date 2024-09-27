class MusicImporter

  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

def files
  self.files = Dir.entries(path).find_all{|files| files =~ /mp3$/}
end

def import
    files.each do |x| 
    Song.create_from_filename(x)
    end
  end


end