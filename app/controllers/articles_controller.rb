class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @article = Article.new
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
    authorize! @article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize! @article
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to articles_path }
        format.turbo_stream { render turbo_stream: turbo_stream.update(@article) }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! @article
    @article.destroy

    respond_to do |format|
      format.html         { redirect_to articles_url }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@article) }
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content).merge(user: current_user)
  end
end
