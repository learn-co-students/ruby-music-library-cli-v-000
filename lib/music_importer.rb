class MusicImporter
  attr_reader :path

  def initialize(file_path)
    @path = file_path
  end

  def files
    files_and_dirs = Dir.entries(path)
    files_and_dirs.reject { |i| File.directory?(i) }
  end

  def import
    files.each do |file|
      song = Song.new_from_filename(file)
      song.save
      song.artist.save unless Artist.find_by_name(song.artist.name)
      song.genre.save unless Genre.find_by_name(song.genre.name)
    end
  end
end
