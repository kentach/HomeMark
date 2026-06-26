class Admin::BaseController < ApplicationController
  before_action :authenticate_user! # ログイン確認
  before_action :authenticate_admin! # 管理者確認
  layout "admin"

  private

  def authenticate_admin!
    unless current_user&.admin?
      flash[:danger] = "ログインしてください。"
      redirect_to admin_login_path
    end
  end
end
