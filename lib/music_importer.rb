class MusicImporter
  
  attr_reader :path
  attr_accessor :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    Dir.glob("#{path}/*.mp3").collect{|f| f.sub("#{path}/", "")}
  end

  def import
<<<<<<< HEAD
    files.each{|f| Song.create_from_filename(f)}
  end
end
=======
    files.each {|file| song = Song.create_from_filename(file)}
  end


end
>>>>>>> bc99f2111444b6029301bd99f91826a6256996a4
