class CLIMethods
  attr_accessor


  def list_songs
    Song.all.map do |song|
      puts "#{song}"
    end
  end


end
