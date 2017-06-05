class MusicImporter
  attr_accessor :path, :files
  def initialize(path)
    @path = path
    @files = []
  end

  def files
    Dir.entries(@path).reject {|f| File.directory?(f) || f[0].include?('.')}.each do |file|
      @files << file
    end
  end

  def import
    self.files
    @files.each do |file|
      song = Song.create_from_filename(file)
    end
  end
end
