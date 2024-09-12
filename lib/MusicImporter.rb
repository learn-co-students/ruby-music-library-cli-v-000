class MusicImporter
  attr_accessor :path

  def initialize(file)
    @path = file
  end

  def files
    @files = []
    list = Dir.glob(@path+"/*")
    list.each do |filename|
      newfile = File.basename(filename)
      if newfile.include?(".mp3")
        @files << newfile
      end
    end
    @files
  end

  def import
    self.files
    @files.collect do |file|
      new_song = Song.create_from_filename(file)
    end
  end



end
