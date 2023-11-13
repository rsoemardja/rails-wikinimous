class ArticlesController < ApplicationController
  def index
    @article = Article.all
  end

  def show
    @article = Article.find(params[:id])

    if @article.nil?
      render json: { error: 'Article not found' }, status: :not_found
    end
  end

  def new
    @articles = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to Article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to Article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to Article_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end

# Path: app/views/articles/index.html.erb
