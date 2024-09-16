class MusicImporter
  extend Concerns::Findable
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*mp3").collect{|file| file.gsub("#{path}/", "")}
  end
  def import
    files.collect do |file|
      Song.create_from_filename(file)
    end
  end
end
