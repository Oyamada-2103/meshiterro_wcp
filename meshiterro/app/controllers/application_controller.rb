class ApplicationController < ActionController::Base

# 6章で追加。権限の設定
before_action :authenticate_user!,except: [:top]
# before_actionメソッドは、このコントローラが動作する前に実行される
# authenticate_userメソッドは、devise側が用意しているメソッドです。
# :authenticate_user!とすることによって、「ログイン認証されていなければ、ログイン画面へリダイレクトする」機能を実装できます。
# exceptは指定したアクションをbefore_actionの対象から外します。

before_action :configure_permitted_parameters, if: :devise_controller?

 # 3章終盤で追加。ログイン後は投稿一覧画面に遷移するように修正
 def after_sign_in_path_for(resource)
    post_images_path
 end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
