# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home' do
  describe 'GET /' do
    it 'works! (now write some real specs)' do
      get root_path
      expect(response).to have_http_status(:ok)
    end

    it 'returns all articles' do
      get root_path
      expect(body_json['message']).to eq 'Back-end Challenge 2021 🏅 - Space Flight News'
    end
  end
end
