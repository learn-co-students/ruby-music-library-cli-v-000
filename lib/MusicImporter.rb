class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    if @path[-1] != '*'
      @path << "/*"
    end

    Dir[@path].collect do |file_name|
      file_name.split('/')[-1]
    end
  end


  def import
    files.each{|file| Song.create_from_filename(file)}
  end


end
