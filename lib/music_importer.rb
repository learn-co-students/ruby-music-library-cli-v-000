class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", "")}
  end

  def import
    test_ordered_files = files.unshift(files.pop)
    test_ordered_files.each{|f| Song.create_from_filename(f)}
  end
end
