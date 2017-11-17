class MusicImporter
  attr_accessor :path

  def initialize(file_path = "./db/mp3s")
    @path = file_path
  end

  def files
    file_path_names = Dir.glob("#{path}/*mp3")
    clean_file_names = []
    file_path_names.each do |file_path_name|
      clean_file_names << File.basename("#{file_path_name}")
    end
    clean_file_names
  end

  def import
    files.each do |file_name|
      song = Song.new_from_filename(file_name)
      song.save
    end
  end
end
