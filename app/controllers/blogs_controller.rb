class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]

  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.all
  end

  # GET /blogs/1 or /blogs/1.json
  def show
    @blog = Blog.find(params[:id])
    @blogs = current_user
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs or /blogs.json
  def create
    @blog = current_user.blogs.build(blog_params)

    respond_to do |format|
    if @blog.save
      format.html { redirect_to blog_url(@blog), notice: "Blog was successfully created." }
      format.json { render :show, status: :created, location: @blog }
    else
      Rails.logger.error @blog.errors.inspect

      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @blog.errors, status: :unprocessable_entity }
    end
   end

  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog = Blog.find(params[:id])
  
    # ユーザーが正しいかどうかを確認
    if current_user == @blog.user
      @blog.destroy
      flash[:notice] = "Blog was successfully destroyed."
    else
      flash[:alert] = "You don't have permission to delete this blog."
    end
  
    redirect_to user_path(current_user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :content, :image)
    end
end
