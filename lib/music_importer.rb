class MusicImporter
  attr_accessor :path 
  def initialize(path)
    @path=path 
  end 
  def files 
    x=Dir.entries(self.path)
    x.select!{|f| f.include?('.mp3')}
  end
  def import 
    self.files.collect{|f| Song.create_from_filename(f)}
  end
end
  