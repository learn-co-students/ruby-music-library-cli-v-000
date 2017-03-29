class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    #Dir.glob("#{path}/*.mp3").select{|f| File.file? f}.collect{|f| File.basename f}.sort_by{|f| f.downcase}

    #refactored solution
    Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", "")}.sort_by{|f| f.downcase}
  end

  def import
    files.each{|filename| Song.create_from_filename(filename)}
  end

end
