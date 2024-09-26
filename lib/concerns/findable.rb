module Concerns::Findable

  def find_by_name(song)
    self.all.each do |instance|
      if instance.name == song
        return instance
      end
    end
    nil
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      self.create(name)
    end
  end

end
