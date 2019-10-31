# Current TODO

- ability to edit investor and inventor show

- accountable picture and default picture?


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

 Located in: <%= @investor.location %><br>

  <div class="index-list">
    A little about what I do: <%= @investor.bio %><br>
  </div>


    <div class="index-list">
      <%= f.label :username %>
      <%= f.text_field :username %>
    </div>

  Idea.all.sort_by{|idea| idea.favorite_count}

  Idea.all.sort_by{|idea| idea.favorite_count}.map(&:id).last

   id = Idea.all.sort_by{|idea| idea.favorite_count}.map(&:id).last
    Idea.find_by_id(id)



