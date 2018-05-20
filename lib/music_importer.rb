require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(self.path).reject { |filename| filename =~ /^\.{1,2}$/ }
  end

  def import
    self.files.each { |filename| Song.create_from_filename(filename) }
  end

end
