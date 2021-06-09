require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
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
          post :create, product: FactoryGirl.attributes_for(:product)
        }.to change(Product,:count).by(1)
      end
      
      it "redirects to the new product" do
        post :create, product: FactoryGirl.attributes_for(:product)
        expect(response).to redirect_to Product.last
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new product" do
        expect{
          post :create, product: FactoryGirl.attributes_for(:invalid_product)
        }.to_not change(Product,:count)
      end
      
      it "re-renders the new product" do
        post :create, product: FactoryGirl.attributes_for(:invalid_product)
        expect(rsponse).to render_template :new
      end
    end
  end
end