# To Do as of 10/23

- idea show page: allow investors to save/fund ideas to fulfill investor has many ideas thorugh inventors etc. Maybe option to follow an inventor?

- refactor code and create partials

- error messages

- accountable picture and default picture?

   <div class="favorite">
    <% if investor_account %>

        Fund this Idea 

        <%= form_tag '/investors/:investor_id/ideas/:id'(investor_account, @idea), :method => :put do %>

          <%= check_box_tag :funded %><br>

          <%= submit_tag("Submit") %>
          
        <% end %>
    <% end %>    
  </div>


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

