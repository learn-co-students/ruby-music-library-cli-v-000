class MusicImporter
  attr_reader :path


  def initialize(path)
    @path = path
  end

def files
  @files = Dir.entries(@path)
  @files.delete_if {|file| file == "." || file ==".."}

end

def import
  files.each do |file| Song.create_from_filename(file)
  end
end


end
