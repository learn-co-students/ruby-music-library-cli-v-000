
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end


  def files
    @file = Dir.entries(path).select {|file|file[/(.mp3)/]}
  end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end
