class ArticlesController < ApplicationController
  #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  before_action :authenticate_user!, except: [:index, :show]

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
      flash[:error] = "Something went wrong"
      render :new, status: :unprocessable_entity
    end

    # @article = Article.new(article_params)

    # if @article.save
    #   flash[:success] = "Object successfully created"
    #   redirect_to @article
    # else
    #   flash[:error] = "Something went wrong"
    #   render :new, status: :unprocessable_entity
    # end
  end

  def edit
    verificarPermissao
    @article = Article.find(params[:id])
  end

  def update
    verificarPermissao
  
    if @article.present? && @article.update(article_params)
      flash[:success] = "Object successfully updated"
      redirect_to @article
    end

    # @article = Article.find(params[:id])

    # if @article.update(article_params)
    #   redirect_to @article
    # else
    #   render :edit, status: :unprocessable_entity
    # end

  end

  def destroy
    verificarPermissao
    if @article.present?
      @article.destroy
      redirect_to root_path
      flash[:success] = "Object successfully deleted"
    end
  end
  
  
  private
    
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

  def verificarPermissao
    begin
      @article = current_user.articles.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Usuário sem permissão"
      redirect_to article_path(params[:id]) and return
    end
  end

end
