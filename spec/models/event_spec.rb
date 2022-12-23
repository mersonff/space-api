require 'rails_helper'

RSpec.describe Event do
  it { is_expected.to belong_to(:article) }
end
