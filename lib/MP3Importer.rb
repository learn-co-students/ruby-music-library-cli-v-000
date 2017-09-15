class MusicImporter
attr_reader :path

  def initialize(file_path)
    @path = file_path
  end

  def files
    files = Dir.glob("#{self.path}/*.mp3")

    files.collect do |file|
      new_path = file.gsub(/.*\//, "")

      artist = new_path.split(" - ")[0]
      song = new_path.split(" - ")[1]
      genre = new_path.split(" - ")[2]

      [artist, song, genre].join(" - ")
    end
  end

  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end
end
