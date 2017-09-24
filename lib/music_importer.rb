class MusicImporter
  attr_accessor :path
  def initialize(music_path)
    @path=music_path
    @files=[]
  end

  def files
    Dir.foreach(path) do |file|
      if file.match(/.mp3\z/)
          @files<< file
      end
    end
    @files
  end
 
  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end

end