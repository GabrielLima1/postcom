RailsAdmin.config do |config|
  require Rails.root.join('lib', 'rails_admin_publish.rb')
  RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::Publish)
  require Rails.root.join('lib', 'rails_admin', 'approving.rb')
  RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::Approving)

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
    create do
      field :message
      field :desire do
        required true
      end
      field :img1 do
        required true
      end
      field :img2 do
        required true
      end
      field :img3 do
        required true
      end
      field :status do
        visible do
          false
        end
      end
    end
    edit do
      # exclude_fields :message, :desire, :status
    end
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
      field :status do
        visible do
          false
        end
      end
      field :title do
        html_attributes do
         {:placeholder => "Para identificação do pedido", :size => 80} #dont use 600 as maxlength for a string field. It will break the UI
        end
      end
      field :description do  #use second parameter to set field type
        required true #this will just set a hints text
        #to set max length use:
        html_attributes do
         {:maxlength => 100, :placeholder => "Mensagem que será escrita na sua imagem. Limite de 100 caracteres"} #dont use 600 as maxlength for a string field. It will break the UI
        end
      end
      field :action do
        required true
        html_attributes do
         {:size => 80} #dont use 600 as maxlength for a string field. It will break the UI
        end
      end
      field :company do
        required true
      end
      field :img1
      field :img2
      field :img3
      field :user_id, :hidden do
        default_value do
          bindings[:view].current_user.id
        end
      end

    end
    edit do
      field :title
      field :description
      field :company
      field :status do
        visible do
          bindings[:view].current_user.kind=="manager"
        end
      end
      field :action
      field :img1
      field :img2
      field :img3
      field :user_id, :hidden do
        default_value do
          bindings[:view].current_user.id
        end
      end
    end
    list do
      field :id
      field :title
      field :description
      field :status
      field :company
      field :action
      field :img1
      field :img2
      field :img3
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
    grid
    approving do
      # show #do/
      only Proposal
      #
      # end
    end
    #     bindings[:view].proposal.status=="Em_Analise"
    #   end
    # end
    # publish do
    #   only Proposal
    # end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
