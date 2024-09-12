class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(path)
    @files.delete_if {|name| name.end_with? "."}
    @files #array of filenames
  end

  def import
    files.each{|f| Song.create_from_filename(f)}
  end

end
