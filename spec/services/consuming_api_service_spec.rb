# frozen_string_literal: true

require 'rails_helper'

describe ConsumingApiService do
  context 'when #persist_data' do
    let(:persist) { described_class.new(10).persist_data }

    it 'creates 10 articles' do
      expect { persist }.to change(Article, :count).by(10)
    end
  end
end
