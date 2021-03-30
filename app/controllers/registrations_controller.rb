class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end


    

    def create
    # render plain: 'Thanks'
    # params[:user]
    # => {"email"=>"george@gmail.com", "password"=>"123456", "password_confirmation"=>"123456"}
    # render plain: params[:user]
        @user =  User.new(user_params)
        if @user.save   
            # cookies(:user_id)
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Successfully created account"
        else
            # flash[:alert] = "Something was wrong"
            render :new
        end
    end
    private

     def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
        # params.require({email: "george@gmail.com", password: "123456"})

    end

end
    
    