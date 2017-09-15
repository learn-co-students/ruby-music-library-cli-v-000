module Concerns::Findable

  # Pass functionality to Artist, Song && Genre Class

  # Find if instance exists by searching name
  def find_by_name(name)
    self.all.detect{|el| el.name === name}
  end

  # Find instance, else, create instance based on #create procedures for each Class
  def find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create(name)
  end


end
