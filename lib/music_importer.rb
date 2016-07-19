class MusicImporter
  attr_accessor :path
  attr_reader :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries("#{@path}")
    @files.delete_if {|dir| dir == "." || dir == ".."}
    @files
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
