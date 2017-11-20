class MusicImporter
  attr_accessor :path

  def initialize(path)
      @files=[]
      @path=path
    end

    def files
      mp3s=@path+"/*.mp3"

      Dir.glob(mp3s) do |item|
        filename=item.split(@path)[1].split("/")[1]
        @files<<filename
      end
        @files
    end


    def import
        self.files.each do |file|
        Song.create_from_filename(file)
        puts file
      end
    end

end
