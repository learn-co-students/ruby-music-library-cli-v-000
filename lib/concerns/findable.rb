module Concerns::Findable
  def create(name)
    self.new(name).tap do |object|
      object.save
    end
  end

  def find_by_name(name)
    self.all.detect{|n| n.name == name}
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
end
