class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
  Dir.entries(path).reject{|entry| entry =~ /^\.{1,2}$/}
end

def import
  files.each {|filename| Song.create_from_filename(filename)}
end

end
