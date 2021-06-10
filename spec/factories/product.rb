FactoryBot.define do
    factory :product do
        name { "John" }
        price  { 123456 }
        size {32 }
        color {"red"}
        brand {"adidas"}
        seller {"nhat"}
        description {"good"}
    end
    
    factory :invalid_product do
        price  { "nhat" }
    end
    
    factory :count do
        Product.all.length
    end
  end