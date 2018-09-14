class UsersController < ApiController
    before_action :require_login, except: :create
    before_action :set_user, only: [:update, :delete, :profile]
    
    def create
        user = User.create!(user_params)
        render json: {token: user.auth_token}
    end
    
    def profile 
        render json: {user: {email: @user.email, name: @user.name}}
    end
    
    def update 
        @user = user.update(user_params)
        head :no_content
    end
    
    def delete 
        @user.destroy
        head :no_content
    end
    
    private
    
    def user_params
        params.require(:user).permit(:password, :name, :email)
    end
    
    def set_user 
        @user = User.find_by_auth_token!(request.headers[:token])
    end
    
end