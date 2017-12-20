require 'rails_helper'

RSpec.describe Borrow, type: :model do
  it { should belong_to(:book) }
  it { should validate_presence_of(:name) }
end
