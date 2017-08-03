# lib/rails_admin/impersonate_user.rb
require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminPublish
end

module RailsAdmin
  module Config
    module Actions
      class Approving < RailsAdmin::Config::Actions::Base
        register_instance_option :member do
          true
        end
        register_instance_option :visible? do
          bindings[:object].class == Proposal
          #bindings[:object]._current_user.kind.include?("client")
          # bindings[:object].a.kind == 'client'
        end
        register_instance_option :controller do
          Proc.new do
            @object.update_attribute(:status, "Aprovado")
            @object.desire.update_attribute(:status, "Aprovado")

            flash[:notice] = "#{@object.desire.title} - Aprovado! "
            redirect_to back_or_index
            # @object.approving
            # redirect_to back_or_index
          end
        end

        register_instance_option :link_icon do
          'fa fa-download'
        end
        # register_instance_option :pjax? do
        #   false
        # end
      end
    end
  end
end
