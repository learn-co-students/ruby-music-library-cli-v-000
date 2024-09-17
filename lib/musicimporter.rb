class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
     Dir.glob("#{path}/*").map{|file| file.gsub("#{path}/", '')}
  end

  def import
      files.each do |file| Song.create_from_filename(file)
      end
  end
end
