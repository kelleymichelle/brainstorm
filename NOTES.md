# Create an Accounts table
- in db it will have:
- password_digest
- username

- must belong_to EITHER an investor OR inventor

to set up polymorphism inside account migration:
t.references :accountable, polymorphic: true, index: true

inside your Account model
belongs_to :accountable, polymorphic: true

inside your Investor AND Inventor model
has_one :account, as: :accountable

Controllers:

accounts#new --> handle initial account creation
Account.new(account_params) # account params = username and password

session[:account_id] = @account.id
session[:is_inventor] = params[:investor].blank?


after you create your account, redirect to either investor#new OR inventor#new based on params

@inventor = Inventor.new(inventor_params)
@inventor.account = Account.find(session[:account_id])



<%= form_for :inventor, url: '/inventors' do |f| %>
  Name: <%= f.text_field :name %><br>
  Email: <%= f.text_field :email %><br>
  Location: <%= f.text_field :location %><br>
  Bio: <%= f.text_area :bio %><br>
  Password: <%= f.password_field :password %><br>
  Password Confirmation: <%= f.password_field :password_confirmation %><br>
  <%= f.submit "Submit" %>
<% end %>

class Inventor < ApplicationRecord
  has_secure_password
  has_many :ideas
  has_many :groups, through: :ideas
  has_many :investors, through: :ideas
  has_many :comments, through: :ideas


end

class Investor < ApplicationRecord
  has_secure_password
  has_many :inventors, through: :ideas
  has_many :ideas, through: :inventors
end
