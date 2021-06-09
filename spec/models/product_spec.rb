require 'rails_helper'

RSpec.describe Product, type: :model do

  describe "db schema" do
    context "columns" do
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:price).of_type(:float) }
      it { should have_db_column(:size).of_type(:integer) }
      it { should have_db_column(:color).of_type(:string) }
      it { should have_db_column(:brand).of_type(:string) }
      it { should have_db_column(:seller).of_type(:string) }
      it { should have_db_column(:description).of_type(:string) }
    end
  end


    describe "validations" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:price) }
      it { should validate_numericality_of(:price) }
      it { should validate_presence_of(:size) }
      it { should validate_numericality_of(:size) }
      it { should validate_presence_of(:color) }
      it { should validate_presence_of(:brand) }
      it { should validate_presence_of(:seller) }
      it { should validate_presence_of(:description) }
    end

    describe "associations" do
        it { should have_many(:comments) }
      end
end