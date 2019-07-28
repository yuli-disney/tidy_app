class PostsController < ApplicationController
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def new

  end

  def bedit
    @posts = Post.all.order(created_at: :desc)
  end

  def create
    @post=Post.new(content: params[:content], url: params[:url], select: params[:select])
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
    flash[:notice] = "投稿されました"
    redirect_to("/posts/index")
    else
      flash[:notice] = "空の投稿はできません"
      redirect_to("/posts/#{@post.id}/edit")
    end
  end

  def destroy
    puts params[:id]
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end

  def often
    @post = Post.where(select:"よく見るページ")
  end

end
