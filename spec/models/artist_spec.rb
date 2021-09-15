require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "associations" do
    it { should belong_to :director }
    it { should have_many :images }
  end

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:password) }
  end
end
