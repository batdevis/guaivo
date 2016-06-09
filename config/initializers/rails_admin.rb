RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
     warden.authenticate! scope: :admin
  end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'User' do
    weight 10

    list do
      field :email
      field :avatar
      field :created_at
    end

    edit do
      field :email
      field :firstname
      field :lastname
      field :avatar
    end
  end

  config.model 'Project' do
    weight 20
  end

  config.model 'SwaggerDefinition' do
    parent 'Project'
    weight 20
  end

  config.model 'Link' do
    parent 'Project'
    weight 20

    list do
      field :name
      field :url
      field :logo
    end
  end
end
