require 'rails_helper'

RSpec.describe Book, type: :model do

  it { should have_many(:borrows).dependent(:destroy) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:pages) }
end
