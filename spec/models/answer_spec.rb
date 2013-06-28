require 'spec_helper'

describe Answer do
  context "testing associations" do
    it { should have_many(:votes) }
    it { should have_many(:comments) }
    it { should belong_to(:user) }
    it { should belong_to(:question) }
  end

  context "testing attr_accessible" do
    it { should allow_mass_assignment_of(:content) }
    it { should allow_mass_assignment_of(:file) }
    it { should allow_mass_assignment_of(:path) }
    it { should allow_mass_assignment_of(:user_id) }
    it { should allow_mass_assignment_of(:question_id) }
  end

  # context "testing submit new answer" do

  # end  
end
