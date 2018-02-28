module Concerns::Findable

  def all
    @@all
  end

  def save
    self.class.all << self
  end

  def destroy_all
    @@all.clear
  end

  def create
      save << self.class.new
    end

end
