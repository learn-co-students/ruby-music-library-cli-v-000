module Concerns::Persistable

    def save
      @@all << self
    end

    def destroy_all
      @all.clear
    end

    def count
      @all.size
    end

end
