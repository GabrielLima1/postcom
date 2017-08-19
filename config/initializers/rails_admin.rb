RailsAdmin.config do |config|
  require Rails.root.join('lib', 'rails_admin_publish.rb')
  RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::Publish)
  require Rails.root.join('lib', 'rails_admin', 'approving.rb')
  RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::Approving)

  config.main_app_name = ["PostCom",""]


config.navigation_static_links = {
  'Comprar Créditos' => 'http://postcom.com.br/planos/','Dúvidas' => 'https://www.youtube.com/channel/UCF0Pf7AJpeqpuq6WnOKqmqA', 'Fale Conosco' => 'http://postcom.com.br/contato/'
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
      navigation_icon 'fa fa-user'
      exclude_fields_if do
        type == :datetime
      end
      exclude_fields :id, :sign_in_count, :current_sign_in_ip, :last_sign_in_ip

      # list do
      #     field
      # end

      edit do
        fields :plan, :kind, :status, :email, :credit, :desires, :companies do
          visible do
            # true if bindings[:view]._current_user.kind == 'manager'
            bindings[:view]._current_user.kind.include?("manager")
        end
      end
    end
  end

  config.model Proposal do
    navigation_icon 'fa fa-paint-brush'
    list do
      field :id
      field :img1
      field :img2
      field :img3
      field :message
      field :status
      field :desire
      field :note
    end

    create do
      field :note do
        visible do
          bindings[:view]._current_user.kind.include?("client")
        end
      end
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
      fields :message, :img1, :img2, :img3, :status, :desire do
        visible do
          bindings[:view]._current_user.kind.include?("manager")
        end
      end
      field :note do
        read_only do
          bindings[:object].status == "Aprovado"
        end
        visible do
          bindings[:view]._current_user.plan.include?("diamond")
        end
      end
    end


  end
  # INICIO COMPANY #
  config.model Company do
    navigation_icon 'fa fa-building-o'
    create do
      field :name do
        required true
        html_attributes do
         {:placeholder => "Nome da empresa.", :size => 80} #dont use 600 as maxlength for a string field. It will break the UI
        end
      end
      field :acting do
        html_attributes do
         {:placeholder => "Ex: Frigorifico, Propaganda, Redes Supermercado, Confecção e etc..", :size => 80} #dont use 600 as maxlength for a string field. It will break the UI
        end
      end
      field :page_face do
        html_attributes do
         {:placeholder => "Nome da sua página.", :size => 80} #dont use 600 as maxlength for a string field. It will break the UI
        end
      end
      field :profile_insta do
        html_attributes do
         {:placeholder => "Nome do seu perfil.", :size => 80} #dont use 600 as maxlength for a string field. It will break the UI
        end
      end
      field :city do
        html_attributes do
         {:placeholder => "Estado/Cidade de sua empresa", :size => 80} #dont use 600 as maxlength for a string field. It will break the UI
        end
      end
      field :public do
        html_attributes do
         {:placeholder => "Ex: Jovens entre 17 e 25 anos de classe média, compram na minha loja.", :size => 80} #dont use 600 as maxlength for a string field. It will break the UI
        end
      end
      field :description do
        required true
        html_attributes do
         {:placeholder => "Breve descrição de sua empresa. Limite de 100 caracteres", :size => 120} #dont use 600 as maxlength for a string field. It will break the UI
        end
      end
      field :color do
        label do
          "Cores da sua empresa"
        end
        html_attributes do
         {:placeholder => "Ex: Vermelho, Azul e Branco.", :size => 60} #dont use 600 as maxlength for a string field. It will break the UI
        end
      end
      field :photo do
        label do
          "Seu Logo"
        end
      end
      field :user_id, :hidden do
        default_value do
          bindings[:view].current_user.id
        end
      end

    end
    edit do
      field :name
      field :acting
      field :page_face
      field :profile_insta
      field :city
      field :public
      field :color
      field :description
      field :photo
      field :user_id, :hidden do
        default_value do
          bindings[:view].current_user.id
        end
      end
    end
    list do
      field :name
      field :description
      field :city
      field :photo
      field :public
      field :acting
      field :color
      field :page_face
      field :profile_insta
      exclude_fields_if do
        type == :datetime
      end
    end
  end
  # FIM COMPANY #


  # INICIO DESIRE #
  config.model Desire do
    navigation_icon 'fa fa-pencil-square-o'
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
      field :observation do  #use second parameter to set field type
        required true #this will just set a hints text
        #to set max length use:
        html_attributes do
         {:maxlength => 100, :placeholder => "Mensagem que será escrita na sua imagem. Limite de 100 caracteres"} #dont use 600 as maxlength for a string field. It will break the UI
        end
      end
      field :format, :enum do
        label do
          "Formato da imagem"
        end
        enum do
          ['Formato quadrado (800x800)', 'Formato Retangular (1920x960)', 'Formato TV (1920x960)']
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
      field :observation
      field :format
      field :status
      field :company
      field :action
      field :img1
      field :img2
      field :img3
      field :created_at
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
    approving do
      only Proposal
    end
    edit
    delete
    show_in_app
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
