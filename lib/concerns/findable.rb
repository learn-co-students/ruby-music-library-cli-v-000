module Concerns::Findable

  def find_by_name(name)

    if !self.all.empty?
      self.all.detect do |i|
        i if i.name == name
      end
    else
      return false
    end
  end

  def find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create(name)
    else
      self.find_by_name(name)
    end
  end
end
