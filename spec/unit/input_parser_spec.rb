require_relative '../support/spec_helper'

describe InputParser do

  describe '#parse' do

    it 'parses a place command heading north' do
      command_factory = double('CommandFactory')

      parser = InputParser.new command_factory: command_factory

      expect(command_factory).to receive(:place).with( position: Position.new(0, 0, :NORTH) )

      parser.parse('PLACE 0,0,NORTH')
    end

    it 'parses a place command heading south' do
      command_factory = double('CommandFactory')

      parser = InputParser.new command_factory: command_factory

      expect(command_factory).to receive(:place).with( position: Position.new(0, 1, :SOUTH) )

      parser.parse('PLACE 0,1,SOUTH')
    end

    it 'parses a place command heading west' do
      command_factory = double('CommandFactory')

      parser = InputParser.new command_factory: command_factory

      expect(command_factory).to receive(:place).with( position: Position.new(1, 0, :WEST) )

      parser.parse('PLACE 1,0,WEST')
    end

    it 'parses a place command heading east' do
      command_factory = double('CommandFactory')

      parser = InputParser.new command_factory: command_factory

      expect(command_factory).to receive(:place).with( position: Position.new(4, 0, :EAST) )

      parser.parse('PLACE 4,0,EAST')
    end

    it 'parses a report command' do
      command_factory = double('CommandFactory')

      parser = InputParser.new command_factory: command_factory

      expect(command_factory).to receive(:report)

      parser.parse('REPORT')
    end

    it 'parses a move command' do
      command_factory = double('CommandFactory')

      parser = InputParser.new command_factory: command_factory

      expect(command_factory).to receive(:move)

      parser.parse('MOVE')
    end

    it 'parses a multiple command' do
      place_command = double('PlaceCommand')
      report_command = double('ReportCommand')
      command_factory = double('CommandFactory')

      parser = InputParser.new command_factory: command_factory

      expect(command_factory).to receive(:place) { place_command }
      expect(command_factory).to receive(:report) { report_command }

      result = parser.parse("PLACE 0,0,NORTH\nREPORT")

      expect(result).to be_a(Array)
      expect(result.count).to eq(2)
      expect(result.first).to eq(place_command)
      expect(result.last).to eq(report_command)
    end
  end
end
