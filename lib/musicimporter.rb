class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @path.inspect
  end

  def import(some_filename)
  some_filename.each { |filename| Song.new_by_filename(some_filename) }
  end


end
