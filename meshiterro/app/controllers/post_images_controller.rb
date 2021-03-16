class PostImagesController < ApplicationController

  # 画像の投稿画面を表示する
  def new
    #３章で追加
    # インスタンス変数に空のインスタンスを渡して画像の投稿ができるようにした
    @post_image = PostImage.new
  end

  # 投稿画像を保存する
  def create
    # ３章で追加
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  # 投稿画像のリストを表示する画面を作る
  def index
    # ３章で追加
    @post_images = PostImage.all
    
  end

  # 投稿画像の詳細を表示する画面を作る
  def show
    # ３章で追加
    @post_image = PostImage.find(params[:id])
    
  end

  # 投稿画像を削除する
  def destroy
    # ３章で追加
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

   # ３章で追加。投稿データのストロングパラメータ
  private
  
  # フォームで入力されたデータが投稿データとして許可されているパラメータかどうかをチェック。
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end

