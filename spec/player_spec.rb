require 'player'

describe Player do

  subject{Player.new("Hegel") }

  it "has a name" do
    expect(subject.name).to eq 'Hegel'
  end

  it 'does not initially have a hand' do
    expect(subject.hand).to be_empty
  end

  it 'has a score of 0 to begin with' do
    expect(subject.score).to eq 0
  end

end
