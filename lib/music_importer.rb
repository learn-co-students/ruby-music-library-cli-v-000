class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

=begin
 advanced ruby
  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end
=end

  def files
      all_files = []
      Dir["#{@path}/*"].each do |file_name|
        if file_name.end_with?(".mp3")
          file_name=file_name.gsub("#{path}/", "")
          all_files << file_name
        end
      end
      all_files
  end

  def import
    files.each{ |f| Song.create_from_filename(f) }
  end

end
