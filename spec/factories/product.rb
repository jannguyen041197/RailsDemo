FactoryBot.define do
    factory :product do
        name { "Sport" }
        price  { 123456 }
        size {32 }
        color {"red"}
        brand {"adidas"}
        seller {"nhat"}
        description {"good"}
    end
    factory :invalid_product, parent: :product do
        price  { "price" }
    end
  end
