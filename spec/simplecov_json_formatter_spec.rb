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
    context 'with line coverage' do
      it 'works' do
        subject.format(result)
        expect(json_ouput).to eq(json_result('sample'))
      end
    end

    context 'with branch coverage' do
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

    context 'with groups' do
      let(:result) do
        res = SimpleCov::Result.new({
                                      source_fixture('sample.rb') => { 'lines' => [
                                        nil, 1, 1, 1, 1, nil, nil, 1, 1, nil, nil,
                                        1, 1, 0, nil, 1, nil, nil, nil, nil, 1, 0, nil, nil, nil
                                      ] }
                                    })

        # right now SimpleCov works mostly on global state, hence setting the groups that way
        # would be global state --> Mocking is better here
        allow(res).to receive_messages(groups: { 'My Group' => double('File List', covered_percent: 80.0) })
        res
      end

      it 'displays groups correctly in the JSON' do
        subject.format(result)
        expect(json_ouput).to eq(json_result('sample_groups'))
      end
    end
  end
end
