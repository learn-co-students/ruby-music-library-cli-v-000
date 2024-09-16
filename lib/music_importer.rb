class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir["#{@path}/*"]
    @files.collect do |file|
      file.split("#{@path}/")[1]
    end
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end


end
