# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Launch do
  it { is_expected.to belong_to(:article) }
end
