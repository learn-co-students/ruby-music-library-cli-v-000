class MusicImporter

  attr_accessor :path, :files

  def initialize(path)
    @path = path 
    @files = Dir.entries(path).select { |el| el.include?(".mp3")}
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end

end