module ProductsHelper

def link_attributes(product)
  available_attributes = ["Book Your Date", "/products/#{product.id}", "btn btn-success"]
  not_available_attributes = ["Sold Out! ", "", "btn btn-danger"]
  product.stock > 0 ? available_attributes : not_available_attributes
end

end
