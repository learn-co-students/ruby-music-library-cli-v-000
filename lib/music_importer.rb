class MusicImporter
  attr_accessor :path, :files
  def initialize(directory)
    @path = directory
    @files = []

  end
  def files
    #Dir[@path+'/*'].each { |chr| @files << chr.sub!("./spec/fixtures/mp3s/", "")
    Dir[@path+'/*'].each { |chr| @files << chr.sub!("#{path}/", "")
      }
  end
  def import
   self.files.each { |filename|
        Song.create_from_filename(filename)
       }
  end
end
