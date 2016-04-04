class AccountActivationsController < ApplicationController
    before_action :get_staff
    before_action :valid_staff,  only: [:edit]
    
    
    def edit
      
    end
    
    def update
        if params[:staff][:password].empty?
          @staff.errors.add(:password, "can't be empty")
          render 'edit'
        elsif @staff.update_attributes(staff_params)
          @staff.activate
          log_in @staff
          flash[:success] = "Acount is now activated! Now Edit your profile."
          redirect_to @staff
        else
          render 'edit'
        end
    end
    
      private
      
      def staff_params
        params.require(:staff).permit(:email, :password, :password_confirmation, :name)
      end
      
      def get_staff
        @staff = Staff.find_by(email: params[:email])
      end
      
      # Confirms a valid user.
      def valid_staff
        unless @staff && !@staff.activated? && @staff.authenticated?(:activation, params[:id])
          flash[:danger] = "Invalid activation link"
          redirect_to root_url
        end
      end
end