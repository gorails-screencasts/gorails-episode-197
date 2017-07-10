json.extract! product, :id, :name, :description, :secret, :created_at, :updated_at
json.url product_url(product, format: :json)