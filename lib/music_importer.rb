class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path

  end

  def files
    Dir.glob("#{path}/*mp3").collect{|i| i.gsub("#{path}/", '')}
  end

  def import
    file_name = self.files
    file_name.each {|song| Song.create_from_filename(song)}
  end


end
