module Concerns::Findable

  def find_by_name(find_name)
    self.all.find do |inst|
      find_name == inst.name
    end
  end

  def find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      return_song = self.create(song_name)
    else
      return_song = self.find_by_name(song_name)
    end
  end

end
