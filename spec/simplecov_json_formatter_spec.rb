# frozen_string_literal: true

require 'spec_helper'

describe SimpleCov::Formatter::JSONFormatter do
  let(:result) do
    SimpleCov::Result.new({
                            source_fixture('sample.rb') => { 'lines' => [nil, 1, 1, 1, nil, nil, 1, 1, nil, nil] }
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
