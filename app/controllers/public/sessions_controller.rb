# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_state, only: [:create]
  def after_sign_in_path_for(resource)
        admin_root_path(current_admin)
        #注文履歴一覧(管理者トップページ）admin/homes top
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
    #管理者ログイン画面
  end
end
