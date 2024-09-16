module Concerns::Transformation

  def split_song(filename)
    filename.gsub(".mp3", "").split(" - ")
  end

end
