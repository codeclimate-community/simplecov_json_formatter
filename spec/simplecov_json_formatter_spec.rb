# frozen_string_literal: true

require 'spec_helper'
require 'byebug'

describe SimpleCov::Formatter::JSONFormatter do
  let(:result) do
    SimpleCov::Result.new({
                            source_fixture('sample.rb') => { 'lines' => [nil, 1, 1, 1, nil, nil, 1, 1, nil, nil] }
                          })
  end

  describe 'format' do
    it 'works' do
      subject.format(result)
      expect(json_ouput).to eq(json_result('sample'))
    end
  end
end
