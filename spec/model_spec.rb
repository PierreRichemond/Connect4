require_relative "../model.rb"

RSpec.describe Grid do
  it 'test grid\'s method' do
    grid = instance_double(Grid)
    allow(grid).to receive(:can_be_placed?).and_return(false)
    allow(grid).to receive(:place_disk).with(2, 1)
  end
end
