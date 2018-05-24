class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env["omniauth.auth"])
      if @user.persisted?
        unless @user.avatar.present?
          photo_url = request.env["omniauth.auth"].info.image
          @user.remote_avatar_url = photo_url
          @user.save!
        end
        sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: "GitHub") if is_navigational_format?
      else
        session["devise.github_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end

    def failure
      redirect_to root_path
    end
end
