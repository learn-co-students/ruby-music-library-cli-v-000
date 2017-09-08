module Concerns::Findable
  def find_by_name(obj_name)
    self.all.find {|obj| obj.name == obj_name}
  end

  def create(obj_name)
    self.new(obj_name).tap {|x| x.save}
  end

  def find_or_create_by_name(song)
    self.find_by_name(song) ? self.find_by_name(song) : self.create(song)
  end
end
