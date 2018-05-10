module Concerns::Findable

  def find_by_name(name)
    self.all.detect do |item|
        item.name == name
      end
  end

  def create(name)
    newitem = self.new(name)
    newitem.save
    newitem
  end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

end
