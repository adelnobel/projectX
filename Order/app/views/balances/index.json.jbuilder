json.array!(@balances) do |balance|
  json.extract! balance, :id, :user_id, :credit
  json.url balance_url(balance, format: :json)
end
