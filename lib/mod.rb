module Concerns::Findable

  def all
    @@all
  end

  def save
    @@all << self
  end

  def destroy_all
    @@all.clear
  end

end
