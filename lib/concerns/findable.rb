module Concerns::Findable

  def find_by_name(name)
    self.all.detect{|a| a.name == name}
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      new_a = self.create(name)
    else
      return self.find_by_name(name)
    end
  end

end

module SongArtists
  module InstanceMethods
    def save
      self.class.all<<self
    end
  end

  module ClassMethods

    def create(name)
      new_instance = self.new(name)
      new_instance.save
      self.all[0]
    end

    def destroy_all
      self.all.clear
    end
  end
end
