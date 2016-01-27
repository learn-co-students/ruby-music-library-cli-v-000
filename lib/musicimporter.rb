class MusicImporter

  def initialize(filepath)
    @filepath = filepath
  end

  def path
    @filepath
  end
 
  def files
    Dir.entries(self.path).reject{|entry| entry == "." || entry == ".."}
  end
   
   def import
    files.each do |filename|
    Song.create_from_filename(filename)
  end
end
  


end