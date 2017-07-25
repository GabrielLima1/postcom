RailsAdmin.config do |config|
  config.main_app_name = ["PostCom",""]


config.navigation_static_links = {
  'Comprar Créditos' => 'https://www.facebook.com/',
  'Dúvidas' => 'https://www.facebook.com/'
}

config.navigation_static_label = "Links Úteis"


  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.model User do
    exclude_fields_if do
      type == :datetime
    end
  end
  config.model Proposal do
    exclude_fields_if do
      type == :datetime
    end
    # create do
    #   field :img1
    # end
  end
  # INICIO COMPANY #
  config.model Company do
    create do
      field :name do
        required true
      end
      field :description do
        required true
      end
      field :photo
      field :user_id, :hidden do
        default_value do
          bindings[:view].current_user.id
        end
      end

    end
    edit do
      field :name
      field :description
      field :photo
      field :user_id, :hidden do
        default_value do
          bindings[:view].current_user.id
        end
      end
    end
    list do
      exclude_fields_if do
        type == :datetime
      end
    end
  end
  # FIM COMPANY #


  # INICIO DESIRE #
  config.model Desire do
    create do
      field :title do
        required true
      end
      field :description do  #use second parameter to set field type
        required true #this will just set a hints text
        #to set max length use:
        html_attributes do
         {:maxlength => 200} #dont use 600 as maxlength for a string field. It will break the UI
        end
      end
      field :company do
        required true
      end
      field :action do
        required true
      end
      field :photo
      field :user_id, :hidden do
        default_value do
          bindings[:view].current_user.id
        end
      end

    end
    # edit do
    #   field :title
    #   field :description
    #   field :company
    #   field :photo
    #   field :action
    #   field :status do
    #     visible do
    #       bindings[:view].current_user.kind=="manager"
    #     end
    #   end
    #   field :user_id, :hidden do
    #     default_value do
    #       bindings[:view].current_user.id
    #     end
    #   end
    # end
    list do
      field :id
      field :title
      field :description
      field :status
      field :company
      field :action
      field :photo
    end

  end
  # FIM DESIRE #
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    #export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
