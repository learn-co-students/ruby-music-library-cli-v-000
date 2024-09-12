module Concerns::Findable

  def find_by_name(song)
    self.all.detect do |x|
      x.name == song
    end
  end

  def find_or_create_by_name(song)
    if !self.find_by_name(song)
      self.create(song)
    else
      self.find_by_name(song)
    end
  end


end
