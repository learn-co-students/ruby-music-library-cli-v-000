class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
  Dir["#{@path}/*"].collect do |p|
     p.split("/").last
  end
end


  def import
    files.each do |name|
    Song.create_from_filename(name)
    end
  end
end
