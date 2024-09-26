class MusicImporter
  path = Pathname('./db/mp3s')

  def initialize(path)
    @path = path
  end
  
  def path
    @path
  end
  
  def files
    Dir.entries(path).collect {|file| file if file.include?(".mp3")}.compact!
  end

  def import
    files.each do |file| 
      Song.create_from_filename(file)
    end
  end
end