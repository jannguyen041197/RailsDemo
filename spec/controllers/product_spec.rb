require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe ProductsController, type: :controller do
#Test index
  describe "GET index" do
    it "returns all the product in a list" do
      FactoryBot.create(:product)
      FactoryBot.create(:product)
      get :index
      expect(Product.all.length).to eq(2)
    end
    it "renders the index template" do
      FactoryBot.create(:product)
      get :index
      expect(response).to render_template("index")
    end
  end
#Test create product
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
          post(:create, params: { product: {:name=>"Sport", :price=>123456, :size=>32, :color=>"red", :brand=>"adidas", :seller=>"nhat", :description=>"good"}}
            )}.to change(Product, :count).by(1)
      end

      it "redirects to the root" do
        post :create,
        params: {product: {:name=>"Sport", :price=>123456, :size=>32, :color=>"red", :brand=>"adidas", :seller=>"nhat", :description=>"good"}}
        expect(response).to redirect_to root_path
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new product" do
        expect{
          post(:create, params: { product: {:name=>"Sport", :price=>"price", :size=>32, :color=>"red", :brand=>"adidas", :seller=>"nhat", :description=>"good"}}
            )}.to_not change(Product,:count)
      end
      
      it "re-renders the new product" do
        post :create,
        params: { product: {:name=>"Sport", :price=>"price", :size=>32, :color=>"red", :brand=>"adidas", :seller=>"nhat", :description=>"good"}}
        expect(response).to render_template :new
      end
    end
  end
#Test delete product
  describe "DELETE products#destroy" do
    it "should delete a product" do
      FactoryBot.create(:product)
      expect{
        delete(:destroy, params: { id: 1}
          )}.to change(Product, :count).by(-1)
    end
    it "redirects to the root" do
      FactoryBot.create(:product)
      delete(:destroy, params: { id: 1})
      expect(response).to redirect_to root_path
    end
  end
end