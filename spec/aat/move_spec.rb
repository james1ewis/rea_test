require 'rspec'

describe 'moving the robot' do

  context 'when facing north' do

    it 'moves the robot forward north' do
      input_file = 'spec/aat/data/move_north.txt'
      expect { REATest::Application.new(input_file).run }.to output(/0,1,NORTH/).to_stdout
    end
  end
end