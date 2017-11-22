require 'pry'
class MusicImporter
  attr_accessor :path

  def initialize(path)
      @files=[]
      @path=path
      @songs=[]
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
           @songs<<Song.create_from_filename(file)
           #binding.pry
           #puts file
        end
    end

end
