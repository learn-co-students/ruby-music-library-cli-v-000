# Music Importer Class
class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    file_list = Dir["#{@path}/*.mp3"]
    file_list.map do |filename|
      filename.gsub!("#{@path}/", '')
      filename
    end
  end

  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end
