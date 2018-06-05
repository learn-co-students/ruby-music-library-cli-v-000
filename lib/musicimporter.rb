class MusicImporter
attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    # go back to ruby-collaborating-objects-lab-v-000 for review on below code
    @files ||= Dir.entries(@path).select do |song| !File.directory?(song) && song.end_with?(".mp3")
    end
  end

  def import
    files.each{|filename| Song.create_from_filename(filename)}
  end

end
