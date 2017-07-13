class MusicImporter

  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    files = Dir.glob("#{path}/*mp3")
    clean_files = []
    files.each {|paths| clean_files << File.basename("#{paths}")}
    clean_files
  end

  def import
    files.each { |f| Song.create_from_filename(f)}
  end
end
