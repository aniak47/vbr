class AccountActivationsController < ApplicationController
    before_action :correct_activation
    
    
    def edit
    end
    
    def update
        if params[:staff][:password].empty?
          @staff.errors.add(:password, "can't be empty")
          render 'edit'
        elsif @staff.update_attributes(user_params)
          log_in @staff
          flash[:success] = "Acount is now activated! Now Edit your profile."
          redirect_to @staff
        else
          render 'edit'
        end
    end
    
      private

    def user_params
      params.require(:user).permit(:password, :password_confirmation, :name)
    end
    
    private
      def correct_activation
        
      end
end
