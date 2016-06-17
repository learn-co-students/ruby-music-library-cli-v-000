class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end


  def files
    @file = Dir.entries(path).select {|file|file[/(.mp3)/]}
  end
end
