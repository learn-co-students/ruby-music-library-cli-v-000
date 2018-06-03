class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{path}/*"].collect do |f|
      f.gsub("#{path}/", "")
    end
  end

  def import
    files.each {|filename| Song.create_from_filename(filename)}
  end
end
