class MusicImporter
attr_reader :path
  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.map{|file_name| Song.create_from_filename(file_name)}
  end


end
