class ArticlesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource

  def index
    @q = Article.ransack(params[:q])

    @articles = @q.result
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.create(article_params)

    if @article.persisted?
      flash[:success] = "Object successfully created"
      redirect_to @article
    else
      flash[:error] = @article.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :body, :status,
comments_attributes: [:id, :status, :_destroy, :commenter, :body])
    end

end
