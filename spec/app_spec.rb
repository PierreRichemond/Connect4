require_relative "../app.rb"
require_relative "../model.rb"

RSpec.describe App do
  let(:app_double) { instance_double(App) }
  let(:controller_double) { instance_double(Controller) }
  let(:grid_double) { instance_double(Grid) }
  let(:player1_double) { instance_double(Player, name: "Pierre") }
  let(:player2_double) { instance_double(Player, name: "Paul") }

  # before(:context) do
  #   allow(Controller).to receive(:new).and_return(controller_double)
  #   allow(Grid).to receive(:new).and_return(grid_double)
  #   allow(Player).to receive(:new).and_return(player1_double)
  # end

  # it { is_expected.to respond_to(:welcome_message) }  Difference ??

  it 'has the required methods' do
    allow(app_double).to receive(:initialize).with(no_args)
    allow(app_double).to receive(:welcome_message).with(no_args)
    allow(app_double).to receive(:run).with(no_args)
    allow(app_double).to receive(:stop).with(no_args)
    allow(app_double).to receive(:route_action).with(1)
    allow(app_double).to receive(:display_tasks).with(no_args)
    allow(app_double).to receive(:play_again).with(1)
    allow(app_double).to receive(:display_options).with(no_args)
  end

  describe '#initialize' do
    it 'should check the variable presence within the initialize' do # verifier que cette method a cette variable
      expect(app_double).instance_variable_get(@running).to be_truthy
    end
  end

  describe '#run' do
    it 'should check we can call methods from #run' do # verifier que cette method a cette variable
      expect(app_double.run).to receive(:welcome_message).once
      expect(app_double.run).to receive(:kick_start).once
      app_double.run
    end
  end

  describe '#stop' do
    it 'checks that Stop method change the @running variable to true' do # verifier que cette method a cette variable
      expect(app_double.stop).instance_variable_get(@running).not_to be_falsy
    end
  end
end
