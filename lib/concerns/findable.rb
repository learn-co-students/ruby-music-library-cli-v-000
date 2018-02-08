module Concerns
  module Findable
    def find_by_name(f_name)
      self.all.map {|x| x if x.name == f_name}[0]
    end
    def find_or_create_by_name(f_name)
      self.find_by_name(f_name) == nil ? self.create(f_name) : self.find_by_name(f_name)
    end
    def create(name)
      binding.pry
      self.new(name).tap {|new_song| new_song.save}
    end
  end
end
