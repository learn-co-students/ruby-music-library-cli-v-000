class MusicImporter
  attr_accessor :files
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    self.files = Dir.entries(self.path).reject{|entry| entry =~ /^\.{1,2}$/}
  end

  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end
end
