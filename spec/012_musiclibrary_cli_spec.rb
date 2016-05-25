describe 'Music Library CLI' do

  it 'allows a user to list songs' do
    music_libray_controller = MusicLibraryController.new("./spec/fixtures/mp3s")

    expect(MusicLibraryController).to receive(:new).and_return(music_libray_controller)
    expect(music_libray_controller).to receive(:gets).and_return("list songs", "exit")

    output = capture_puts {run_file("./bin/musiclibrary")}

    expect(output).to include("1. Action Bronson - Larry Csonka - indie")
    expect(output).to include("2. Real Estate - Green Aisles - country")
    expect(output).to include("3. Real Estate - It's Real - hip-hop")
    expect(output).to include("4. Thundercat - For Love I Come - dance")
  end

  it 'allows a user to list artists' do
    music_libray_controller = MusicLibraryController.new("./spec/fixtures/mp3s")

    expect(MusicLibraryController).to receive(:new).and_return(music_libray_controller)
    expect(music_libray_controller).to receive(:gets).and_return("list artists", "exit")

    output = capture_puts {run_file("./bin/musiclibrary")}

    expect(output).to include("Action Bronson")
    expect(output).to include("Real Estate")
    expect(output).to include("Thundercat")
  end

  it 'allows a user to list genres' do
    music_libray_controller = MusicLibraryController.new("./spec/fixtures/mp3s")

    expect(MusicLibraryController).to receive(:new).and_return(music_libray_controller)
    expect(music_libray_controller).to receive(:gets).and_return("list genres", "exit")

    output = capture_puts {run_file("./bin/musiclibrary")}

    expect(output).to include("indie")
    expect(output).to include("country")
    expect(output).to include("hip-hop")
    expect(output).to include("dance")
  end

  it 'allows a user to play a song' do
    music_libray_controller = MusicLibraryController.new("./spec/fixtures/mp3s")

    expect(MusicLibraryController).to receive(:new).and_return(music_libray_controller)
    expect(music_libray_controller).to receive(:gets).and_return("play song", "1", "exit")

    output = capture_puts {run_file("./bin/musiclibrary")}

    expect(output).to include("Playing Action Bronson - Larry Csonka - indie")
  end

  it 'allows a user to list an artist\'s songs' do
    music_libray_controller = MusicLibraryController.new("./spec/fixtures/mp3s")

    expect(MusicLibraryController).to receive(:new).and_return(music_libray_controller)
    expect(music_libray_controller).to receive(:gets).and_return("list artist", "Real Estate", "exit")

    output = capture_puts {run_file("./bin/musiclibrary")}

    expect(output).to include("Real Estate - Green Aisles - country")
    expect(output).to include("Real Estate - It's Real - hip-hop")
  end

  it 'allows a user to list a genre\'s songs' do
    music_libray_controller = MusicLibraryController.new("./spec/fixtures/mp3s")

    expect(MusicLibraryController).to receive(:new).and_return(music_libray_controller)
    expect(music_libray_controller).to receive(:gets).and_return("list genre", "dance", "exit")

    output = capture_puts {run_file("./bin/musiclibrary")}

    expect(output).to include("Thundercat - For Love I Come - dance")
  end
end
