class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(params_permit)

    if @post.valid?
      return redirect_to post_index_path
    end

    render 'new'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    @post.update(params_permit)

    if @post.valid?
      return redirect_to post_index_path
    end

    render 'edit'
  end

  def destroy
    @post = Post.find(params[:id])

    unless @post.nil?
      @post.delete

      redirect_to post_index_path
    end
  end

  private
    def params_permit
      params.require(:post).permit(:title, :body)
    end
end
