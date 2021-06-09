require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe "db schema" do
    context "columns" do
      it { should have_db_column(:commenter).of_type(:string) }
      it { should have_db_column(:body).of_type(:string) }
    end
  end


    describe "validations" do
      it { should validate_presence_of(:commenter) }
      it { should validate_presence_of(:body) }
    end

    describe "associations" do
        it { should belong_to(:product) }
      end
end