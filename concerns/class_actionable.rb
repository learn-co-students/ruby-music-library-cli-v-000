module Concerns::ClassActionable

  def destroy_all
    all.clear
  end

  def create(name)
    new_entry = self.new(name)
    new_entry.save
    new_entry
  end
end
