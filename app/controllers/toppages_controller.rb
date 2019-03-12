class ToppagesController < ApplicationController
  def index
    if logged_in?
      # ログインしている場合には、タスクデータを取得
      @tasks = Task.where(user_id: current_user.id)
    else
      # ログインしていないときには、ログイン画面にリダイレクト
      redirect_to login_path
    end
  end
end
