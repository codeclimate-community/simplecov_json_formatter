# frozen_string_literal: true

require 'spec_helper'
require 'byebug'

describe SimpleCov::Formatter::JSONFormatter do
  let(:result) do
    SimpleCov::Result.new({
                            source_fixture('sample.rb') => { 'lines' => [
                              nil, 1, 1, 1, 1, nil, nil, 1, 1, nil, nil,
                              1, 1, 0, nil, 1, nil, nil, nil, nil, 1, 0, nil, nil, nil
                            ] }
                          })
  end

  describe 'format' do
    context 'whit line coverage' do
      it 'works' do
        subject.format(result)
        expect(json_ouput).to eq(json_result('sample'))
      end
    end

    context 'whit branch coverage' do
      let(:original_lines) do
        [nil, 1, 1, 1, 1, nil, nil, 1, 1,
         nil, nil, 1, 1, 0, nil, 1, nil,
         nil, nil, nil, 1, 0, nil, nil, nil]
      end

      let(:original_branches) do
        {
          [:if, 0, 13, 4, 17, 7] => {
            [:then, 1, 14, 6, 14, 10] => 0,
            [:else, 2, 16, 6, 16, 10] => 1
          }
        }
      end

      let(:result) do
        SimpleCov::Result.new({
                                source_fixture('sample.rb') => {
                                  'lines' => original_lines,
                                  'branches' => original_branches
                                }
                              })
      end

      before do
        enable_branch_coverage
      end

      it 'works' do
        subject.format(result)
        expect(json_ouput).to eq(json_result('sample_with_branch'))
      end
    end
  end
end
