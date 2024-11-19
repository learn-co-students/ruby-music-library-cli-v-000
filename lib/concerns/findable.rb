module Concerns::Findable

  def find_by_name(name)
    self.all.detect{|a| a.name == name}
  end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
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
      new_instance
    end

    def destroy_all
      self.all.clear
    end
  end
end
