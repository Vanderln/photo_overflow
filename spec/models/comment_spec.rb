require 'spec_helper'

describe Comment do
  context "testing associations" do
    it { should belong_to(:commentable) }
    it { should belong_to(:user) }
    it { should have_many(:votes) }
  end

  context "testing attr_accessible" do
    it { should allow_mass_assignment_of(:user_id) }
    it { should allow_mass_assignment_of(:content) }
    it { should allow_mass_assignment_of(:commentable_id) }
    it { should allow_mass_assignment_of(:commentable_type) }
  end
end
