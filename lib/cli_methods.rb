class CLI_Methods

  def list_songs
    Song.all.sort
  end

end
