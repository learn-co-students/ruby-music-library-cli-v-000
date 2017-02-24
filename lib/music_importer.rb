class MusicImporter

  attr_accessor :path
<<<<<<< HEAD
=======


>>>>>>> 6197a1617fb2d89b09bd81d034e133eed61f6d13

  def initialize(path)
    @path= path
  end

  def files
<<<<<<< HEAD
    @files ||= Dir.glob("#{path}/*.mp3").collect {|f| f.gsub("#{path}/", "")}.sort
=======
    @files ||= Dir.glob("#{path}/*.mp3").collect{|file| file.gsub("#{path}/", "")}
>>>>>>> 6197a1617fb2d89b09bd81d034e133eed61f6d13
  end

  def import
    files.each {|f| Song.create_from_filename(f)}
  end



end
