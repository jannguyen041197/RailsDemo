class ProductsController < ApplicationController
    def search
      @products = Array.new
      @key = params[:key]
      @brand = params[:brand]
      temp = Product.all
      if (@brand == "all") | (@brand == "") |(@brand == nil)
        temp.each do |item|
          if ((item.name.downcase.include?(@key.downcase))||(item.color.downcase.include?(@key.downcase)))
            @products << item
          end
        end
      else
        temp.each do |item|
          if ((item.name.downcase.include?(@key.downcase))||(item.color.downcase.include?(@key.downcase))) &
            (item.brand.downcase == @brand.downcase)
            @products << item
          end
        end
      end
      if params[:sort] == "name"
        @products.sort! {|a,b| a.name.downcase <=> b.name.downcase}
      elsif params[:sort] == "price"
        @products.sort! {|a,b| a.price <=> b.price}
      end

    end
    def index
      @products = Product.all
    end
  
    def new
      @product = Product.new()
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to root_path
      else
        render :new
      end
    end
  
    def show
      @product = Product.find(params[:id])
    end
    
    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to root_path
    end
  
    def edit
      @product = Product.find(params[:id])
      @backURL = params[:backURL]
    end
    def update
      @product = Product.find(params[:id])
  
      if @product.update(product_params)
        redirect_to params[:backURL]
      else
        render :edit
      end
    end
    private
    def product_params
      params.require(:product).permit(:name, :price, :size, :color, :brand, :seller, :description)
    end
  
  end
  #rails g model products name:string price:float size:integer color:string brand:string seller:string description:string