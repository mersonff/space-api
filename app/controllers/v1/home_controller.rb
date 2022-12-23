# frozen_string_literal: true

module V1
  class HomeController < ApiController
    def index
      render json: { message: 'Back-end Challenge 2021 🏅 - Space Flight News' }
    end
  end
end
