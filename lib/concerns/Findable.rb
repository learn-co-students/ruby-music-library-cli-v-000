module Concerns::Findable

  def find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def find(song_name)
    self.all.find{|song| song.name == song_name}
  end

  def find_or_create_by_name(name)
    if self.find(name) == nil
      song = self.new(name)
      song.save
      song
    else
      self.find(name)
    end
  end
end
