require_relative "../grid.rb"

RSpec.describe Grid do
  describe '#aligned?' do
    subject { grid.aligned?(column_index, board_row_index[column_index] + 1 ) }

    let(:grid) do
      grid = Grid.new
      grid.instance_variable_set(:@grid, grid_content)
      grid.instance_variable_set(:@board_row_index, board_row_index)
      grid
    end

    context 'when vertically aligned' do
      context 'when 4 disk of the same color are aligned' do
        let(:grid_content) do
          [
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0]
          ]
        end

        let(:board_row_index) { [1, 5, 5, 5, 5, 5, 5] }
        let(:column_index) { 0 }

        it {expect(subject).to be_truthy }
      end

      context 'when 4 disk of the same color are aligned but with one different in the middle' do
        let(:grid_content) do
          [
            [0, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0],
            [2, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 2, 0, 0, 0],
            [1, 0, 0, 2, 0, 0, 0]
          ]
        end

        let(:board_row_index) { [0, 5, 5, 3, 5, 5, 5] }
        let(:column_index) { 0 }

        it {expect(subject).to be_falsy }
      end

      context 'when 4 disk of the same color are aligned somewhere else' do
        let(:grid_content) do
          [
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 1, 0, 0, 0],
            [0, 0, 0, 1, 0, 0, 0],
            [0, 0, 0, 1, 0, 0, 0],
            [0, 0, 0, 1, 0, 0, 0]
          ]
        end

        let(:board_row_index) { [5, 5, 5, 1, 5, 5, 5] }
        let(:column_index) { 3 }

        it { expect(subject).to be_truthy }
      end

      context 'when 3 disk of the same color are aligned' do
        let(:grid_content) do
          [
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0]
          ]
        end

        let(:board_row_index) { [2, 5, 5, 5, 5, 5, 5] }
        let(:column_index) { 0 }

        it {
          expect(subject).to be_falsy }
      end
    end

    context 'when horizontally aligned' do
      context 'when 4 disk of the same color are aligned' do
        let(:grid_content) do
          [
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [1, 1, 1, 1, 0, 0, 0]
          ]
        end

        let(:board_row_index) { [4, 4, 4, 4, 5, 5, 5] }
        let(:column_index) { 0 }

        it { expect(subject).to be_truthy }
      end

      context 'when 4 disk of the same color are aligned somewhere in the middle of the board' do
        let(:grid_content) do
          [
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 1, 1, 1, 1, 0],
            [0, 0, 1, 2, 2, 2, 0],
            [0, 0, 2, 1, 1, 2, 0],
            [0, 0, 2, 2, 1, 2, 0]
          ]
        end

        let(:board_row_index) { [5, 5, 1, 1, 1, 1, 5] }
        let(:column_index) { 3 }

        it { expect(subject).to be_truthy }
      end

      context 'when 4 disk of different colors are aligned' do
        let(:grid_content) do
          [
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [1, 1, 2, 1, 0, 0, 0]
          ]
        end

        let(:board_row_index) { [4, 4, 4, 4, 5, 5, 5] }
        let(:column_index) { 0 }

        it { expect(subject).to be_falsy }
      end

      context 'when 3 disk of different colors are aligned' do
        let(:grid_content) do
          [
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [1, 1, 1, 0, 0, 0, 0]
          ]
        end

        let(:board_row_index) { [4, 4, 4, 5, 5, 5, 5] }
        let(:column_index) { 0 }

        it { expect(subject).to be_falsy }
      end

      context 'when 4 disk of the same color are aligned but with one different in the middle' do
        let(:grid_content) do
          [
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [1, 1, 2, 1, 1, 0, 0]
          ]
        end

        let(:board_row_index) { [4, 4, 4, 4, 4, 5, 5] }
        let(:column_index) { 0 }

        it { expect(subject).to be_falsy }
      end
    end

    context 'when diagonally aligned' do
      context 'when 4 disk of the same color are aligned but with one different in the middle' do
        let(:grid_content) do
          [
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 1, 0, 0],
            [0, 0, 0, 1, 2, 0, 0],
            [0, 0, 2, 2, 1, 0, 0],
            [0, 1, 2, 1, 2, 0, 0],
            [1, 1, 2, 1, 1, 0, 0]
          ]
        end

        let(:board_row_index) { [4, 3, 2, 1, 0, 5, 5] }
        let(:column_index) { 0 }

        it { expect(subject).to be_falsy }
      end

      context 'when 4 disk of the same color are aligned to the right' do
        let(:grid_content) do
          [
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 1, 0, 0],
            [0, 0, 0, 1, 2, 0, 0],
            [0, 0, 1, 2, 1, 0, 0],
            [0, 1, 2, 1, 2, 0, 0],
            [0, 1, 2, 1, 1, 0, 0]
          ]
        end

        let(:board_row_index) { [5, 3, 2, 1, 0, 5, 5] }
        let(:column_index) { 1 }

        it { expect(subject).to be_truthy }
      end

      context 'when 4 disk of the same color are aligned to the left' do
        let(:grid_content) do
          [
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 1, 0, 0, 0],
            [0, 0, 0, 2, 1, 0, 0],
            [0, 0, 0, 2, 2, 1, 0],
            [0, 0, 0, 1, 2, 2, 1]
          ]
        end

        let(:board_row_index) { [5, 5, 5, 1, 2, 3, 4] }
        let(:column_index) { 3 }

        it { expect(subject).to be_truthy }
      end

      context 'when 3 disk of the same color are aligned to the left' do
        let(:grid_content) do
          [
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 1, 0, 0, 0],
            [0, 0, 0, 2, 1, 0, 0],
            [0, 0, 0, 2, 2, 1, 0],
            [0, 0, 0, 1, 2, 2, 0]
          ]
        end

        let(:board_row_index) { [5, 5, 5, 1, 2, 3, 5] }
        let(:column_index) { 3 }

        it { expect(subject).to be_falsy }
      end

      context 'when 2 and 2 disk of the same color are aligned to the left with a separation in the middle' do
        let(:grid_content) do
          [
            [1, 1, 0, 0, 0, 0, 0],
            [2, 2, 0, 0, 0, 0, 0],
            [1, 2, 0, 0, 0, 0, 0],
            [2, 1, 1, 0, 0, 0, 0],
            [2, 1, 1, 2, 0, 0, 0],
            [2, 1, 2, 2, 2, 1, 0]
          ]
        end

        let(:board_row_index) { [-1, -1, 2, 3, 4, 4, 5] }
        let(:column_index) { 3 }

        it { expect(subject).to be_falsy }
      end

      context 'when 2 and 2 disk of the same color are aligned to the right with a separation in the middle' do
        let(:grid_content) do
          [
            [1, 1, 0, 0, 0, 0, 0],
            [2, 1, 0, 0, 0, 1, 0],
            [1, 2, 0, 0, 1, 2, 0],
            [2, 1, 1, 2, 2, 1, 0],
            [2, 1, 1, 1, 2, 2, 0],
            [2, 1, 2, 2, 2, 1, 0]
          ]
        end

        let(:board_row_index) { [-1, -1, 2, 2, 1, 0, 5] }
        let(:column_index) { 4 }

        it { expect(subject).to be_falsy }
      end
    end
  end
end
