class MusicImporter

  attr_accessor :path, :files

  def initialize(path)
    @path = path;
  end

  def files
    @files = Dir["#{path}/*.mp3"];
    @files.map{ |file| File.basename(file)};
  end

  def import
    files.each {|file| Song.create_from_filename(file)};
  end

end
