module Concerns::Findable
  def find_by_name(object)
    self.all.detect {|o| o.name == object}
  end

  def find_or_create_by_name(object)
    found_object = self.all.detect {|o| o.name == object}
    if found_object
      found_object
    else
      new_object = self.new(object)
      new_object.save
      new_object
    end
  end

end
