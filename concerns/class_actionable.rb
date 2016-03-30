module Concerns::ClassActionable

  def create(name)
    new_entry = self.new(name)
    new_entry.save
    new_entry
  end

  def destroy_all
    all.clear
  end

   def print_all
    self.all.each {|e| e.print}
  end
end
