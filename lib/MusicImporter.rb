class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    song_path_array = Dir.glob("#{path}/*.mp3")
    song_path_array.each {|song_path| song_path.gsub!("./spec/fixtures/mp3s/",'')}
  end

  def import
    files.each do |i|
      Song.create_from_filename(i)
    end
  end
end
