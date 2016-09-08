module Concerns
  module Findable

  def find_by_name(name)
    self.class.all.detect {|a| a.name == name}
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      new_object = self.class.new(name)
      new_object.save
      new_object
    end
  end

end

end
