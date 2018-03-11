module Concerns::Findable

  def find_by_name(name)
    self.all.detect{|obj| obj.name == name}
  end

  # def find_or_create_by_name(name)
  #   obj = self.find_by_name(name)
  #   if
  # end

  def find_or_create_by_name(name)
    obj = self.find_by_name(name)
    if obj == nil
      obj = self.create(name)
    end
    obj
  end

end
