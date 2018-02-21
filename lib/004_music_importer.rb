class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files_arr = files
    files_arr.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end
