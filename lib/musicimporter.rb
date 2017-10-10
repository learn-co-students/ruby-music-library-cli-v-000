class MusicImporter

  attr_accessor :path, :song

  def initialize(path)
    @path = path
  end

  def files
   Dir.entries(self.path).reject {|entry| entry == "." || entry == ".."}
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end

  end
end
