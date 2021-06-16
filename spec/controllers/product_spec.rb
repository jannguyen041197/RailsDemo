require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe ProductsController, type: :controller do
#Test index
  describe "GET index" do
    it "returns all the product in a list" do
      product = FactoryBot.create_list(:product, 3)
      get :index
      expect(assigns(:products)).to eq(product)
    end
    it "renders the index template" do
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
          post(:create, params: { product: FactoryBot.attributes_for(:product)}
            )}.to change(Product, :count).by(1)
      end

      it "redirects to the root" do
        post :create,
        params: {product: FactoryBot.attributes_for(:product)}
        expect(response).to redirect_to root_path
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new product" do
        expect{
          post(:create, params: { product: FactoryBot.attributes_for(:invalid_product)}
            )}.to_not change(Product,:count)
      end
      
      it "re-renders the new product" do
        post :create,
        params: { product: FactoryBot.attributes_for(:invalid_product)}
        expect(response).to render_template :new
      end
    end
  end
#Test delete product
  describe "DELETE products#destroy" do
    it "should delete a product" do
      product = FactoryBot.create(:product)
      expect{
        delete(:destroy, params: { id: product.id}
          )}.to change(Product, :count).by(-1)
    end
    it "redirects to the root" do
      product = FactoryBot.create(:product)
      delete(:destroy, params: { id: product.id})
      expect(response).to redirect_to root_path
    end
  end
#Test show product
  describe "GET product" do
    it "should find a product" do
      product = FactoryBot.create(:product)
      get :show,
      params: { id: product.id}
      expect(assigns(:product)).to eq(product)
    end
    it "redirects to the show template" do
      product = FactoryBot.create(:product)
      get :show,
      params: { id: product.id}
      expect(response).to render_template "products/show"
    end
  end

#Test edit product
  describe "GET product#edit" do
    it "should find a product" do
      product = FactoryBot.create(:product)
      get :edit,
      params: { id: product.id}
      expect(assigns(:product)).to eq(product)
    end
    it "redirects to the edit template" do
      product = FactoryBot.create(:product)
      get :edit,
      params: { id: product.id}
      expect(response).to render_template :edit
    end
  end

#Test update product
  describe "PUT update" do
    context "with valid attributes" do
      it "update a new product" do
        product = FactoryBot.create(:product)
        patch :update,
        params: {id: product.id,product: FactoryBot.attributes_for(:product, name: "ChangeName")}
        product_updated = Product.find_by_id(product.id)
        expect(product_updated.name).to eq("ChangeName")
      end
      it "redirects to the root" do
        product = FactoryBot.create(:product)
        patch :update,
        params: {id: product.id,product: FactoryBot.attributes_for(:product, name: "ChangeName")}
        expect(response).to redirect_to root_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new product" do
        product = FactoryBot.create(:product)
        patch :update,
        params: {id: product.id,product: FactoryBot.attributes_for(:invalid_product, name: "ChangeName")}
        product_updated = Product.find_by_id(product.id)
        expect(product_updated.name).not_to eq("ChangeName")
      end
      it "re-renders the edit product" do
        product = FactoryBot.create(:product)
        patch :update,
        params: {id: product.id,product: FactoryBot.attributes_for(:invalid_product, name: "ChangeName")}
        expect(response).to render_template :edit
      end
    end
  end
end