require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe ProductsController, type: :controller do
  describe "GET index" do
    it "returns all the product in a list" do
      get :index
      expect(Product.all).to_not be_empty
    end
  end
  describe "GET new" do
    it "assigns a blank product to the view" do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end
  end


  describe "POST create" do
    context "with valid attributes" do
    
      it "creates a new product" do
        expect{
          FactoryBot.create(:product)
        }.to change(Product,:count).by(1)
      end

      it "redirects to the new product" do
        FactoryBot.create(:product)
        expect(response).to render_template :index
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new product" do
        expect{FactoryBot.attributes_for(:product)
        }.to_not change(Product,:count)
      end
      
      it "re-renders the new product" do
        FactoryBot.attributes_for(:product)
        expect(response).to render_template :new
      end
    end
  end
end