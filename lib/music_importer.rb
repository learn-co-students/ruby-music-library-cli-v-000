class MusicImporter
  attr_accessor :path
  attr_reader :files

  def initialize(filepath)
    @path = filepath
  end

  def files
    files = Dir.entries(self.path)
    files.delete_if {|file| file == "." || file == ".."}
    files
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
