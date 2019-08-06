class PostsController < ApplicationController

  
  def index
    @current_user = User.find_by(id: session[:user_id])
    @posts = Post.all.order(created_at: :desc)
    @posts = @posts.where(user_id: @current_user.id)
  end
  
  def new

  end

  def oftenbedit
    @current_user = User.find_by(id: session[:user_id])
    @posts = Post.all.order(created_at: :desc)
    @posts = @posts.where(user_id: @current_user.id, select: "よく見るページ")
  end

  def laterbedit
    @current_user = User.find_by(id: session[:user_id])
    @posts = Post.all.order(created_at: :desc)
    @posts = @posts.where(user_id: @current_user.id, select: "あとで見るページ")
  end

  def usefulbedit
    @current_user = User.find_by(id: session[:user_id])
    @posts = Post.all.order(created_at: :desc)
    @posts = @posts.where(select: "役にたつもの", user_id: @current_user.id)
  end

  def savebedit
    @current_user = User.find_by(id: session[:user_id])
    @posts = Post.all.order(created_at: :desc)
    @posts = @posts.where(select: "とっておきたいページ", user_id: @current_user.id)
  end

  def bedit
    @current_user = User.find_by(id: session[:user_id])
    @posts = Post.all.order(created_at: :desc)
    @posts = @posts.where(user_id: @current_user.id)
  end

  def create
    @current_user = User.find_by(id: session[:user_id])
    @post=Post.new(content: params[:content], url: params[:url], select: params[:select], user_id: @current_user.id)
    @post.save
    redirect_to("/posts/index")
  end
  
  def show
    
    @post = Post.find_by(id: params[:id])
    @id=params[:id]
  end

  def edit
    @post = Post.find_by(id:params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content= params[:content]
    if @post.save
    redirect_to("/posts/index")
    else
      redirect_to("/posts/#{@post.id}/edit")
    end
  end

  def destroy
    begin
      @post = Post.find_by(id: params[:id])
      @post.destroy
      redirect_to("/posts/index")
    rescue
      redirect_to ("/posts/index")
    end
  end

  def often
    @current_user = User.find_by(id: session[:user_id])
    @posts = Post.all.order(created_at: :desc)
    @posts = @posts.where(select: "よく見るページ" , user_id: @current_user.id)
  end

  def later
    @current_user = User.find_by(id: session[:user_id])
    @posts = Post.all.order(created_at: :desc)
    @posts = @posts.where(select: "あとで見るページ", user_id: @current_user.id)
  end

  def useful
    @current_user = User.find_by(id: session[:user_id])
    @posts = Post.all.order(created_at: :desc)
    @posts = @posts.where(select: "役にたつもの", user_id: @current_user.id)
  end

  def save
    @current_user = User.find_by(id: session[:user_id])
    @posts = Post.all.order(created_at: :desc)
    @posts = @posts.where(select: "とっておきたいページ", user_id: @current_user.id)
  end

end
