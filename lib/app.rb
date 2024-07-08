require 'pry'
require 'x'
require 'dotenv'
Dotenv.load('.env') 

x_credentials = {
  api_key:             ENV['X_API_KEY'],
  api_key_secret:      ENV['X_API_KEY_SECRET'],
  access_token:        ENV['X_ACCESS_TOKEN'],
  access_token_secret: ENV['X_ACCESS_TOKEN_SECRET'],
}

# Initialize an API v1.1 client
v1_client = X::Client.new(base_url: "https://api.twitter.com/1.1/", **x_credentials)
puts v1_client.get('users/show.json').inspect

# # Define a custom response object
# Language = Struct.new(:code, :name, :local_name, :status, :debug)

# # Parse a response with custom array and object classes
# languages = v1_client.get("help/languages.json", object_class: Language, array_class: Set)
# # <Set: {#<struct Language code="ur", name="Urdu", local_name="اردو", status="beta", debug=false>, …

# # Access data with dots instead of brackets
# languages.first.local_name.inspect

# # Initialize an Ads API client
# ads_client = X::Client.new(base_url: "https://ads-api.twitter.com/12/", **x_credentials)

# # Get your ad accounts
# ads_client.get("accounts")