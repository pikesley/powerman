require 'spec_helper'

describe MarvelExplorer do
  before :each do
    Timecop.freeze '2014-12-03T19:01:00+00:00'
  end

  after :each do
    Timecop.return
  end

  it 'should get the default start character', :vcr do
    MARSHAL_FILE = 'not_a_path'
    expect(MarvelExplorer.start_character.name).to eq 'Hulk'
  end

  it 'should load the stored character'

  it 'should select a comic for the start character', :vcr do
    MARSHAL_FILE = 'not_a_path'
    c = MarvelExplorer.start_character
    stub_request(:get, /gateway.marvel.com\/v1\/public\/characters\/1009351\/comics/)
    .to_return(status: 200, body: File.read('spec/fixtures/hulk_comics.json'))
    expect(MarvelExplorer.comic(c).title).to eq 'Marvel Double Shot (2003) #2'
  end

  it 'should extract the year correctly', :vcr do
    c = Ultron::Comics.find '50372'
    expect(MarvelExplorer.get_year c).to eq 2014
  end

  it 'should save the end character'
end
