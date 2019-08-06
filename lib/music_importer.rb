require 'pry'
class MusicImporter
  attr_accessor :path, :song, :name

  def initialize(path)
    @path = path
	@@import = []
  end

  def files
    Dir.entries(@path).keep_if {|x| x.include? ".mp3"}
  end

  def import
    self.files.each do |i|
      Song.create_from_filename(i)
    end
  end

end
