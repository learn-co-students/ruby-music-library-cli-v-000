module Concerns::Findable

  def find_by_name(name)
    self.all.detect{|n| n.name == name}
  end

  def find_or_create_by_name(name)
    inquiry = self.find_by_name(name)
    if inquiry
      inquiry
    else
      create(name)
    end
  end
end
