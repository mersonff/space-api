# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article do
  it { is_expected.to have_many(:events) }
  it { is_expected.to have_many(:launches) }
end
