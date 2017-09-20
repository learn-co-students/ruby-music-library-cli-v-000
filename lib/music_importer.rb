class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
    @files = Dir["#{path}/*.mp3"].each {|file| file.slice!("#{path}/")}
  end

  def files
    @files
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
