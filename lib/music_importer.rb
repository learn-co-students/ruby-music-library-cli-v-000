class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{@path}/*"].select {|file| File.file? file}.map{|file| File.basename file}
  end

  def import
    basefiles = self.files
    basefiles.collect{ |filename| Song.create_from_filename(filename) }
  end
end
