require 'spec_helper'

describe Question do
  context "testing associations" do
    it { should have_many(:votes) }
    it { should have_many(:comments) }
    it { should have_many(:answers) }
    # Not working yet
    # it { should have_many(:tagclouds) }
    it { should have_many(:tags).through(:tagclouds) }
    it { should belong_to(:user) }    
  end
  
  context "testing attr_accessible" do
    it { should allow_mass_assignment_of(:file) }
    it { should allow_mass_assignment_of(:title) }
    it { should allow_mass_assignment_of(:content) }
    it { should allow_mass_assignment_of(:path) }
    it { should allow_mass_assignment_of(:user_id) }
  end
end
