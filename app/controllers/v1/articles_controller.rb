# frozen_string_literal: true

module V1
  class ArticlesController < ApiController
    before_action :set_article, only: %i[show update destroy]

    def index
      @loading_service = ModelLoadingService.new(Article.all, searchable_params)
      @loading_service.call
    end

    def show; end

    def create
      @article = Article.new(article_params)

      if @article.save
        render :show, status: :ok
      else
        render_error(fields: @book.errors.messages)
      end
    end

    def update
      if @article.update(article_params)
        render :show, status: :ok
      else
        render_error(fields: @article.errors.messages)
      end
    end

    def destroy
      if @article.destroy
        head :no_content
      else
        render_error(fields: @article.errors.messages)
      end
    end

    private

    def article_params
      params.require(:article).permit(:title, :url, :imageUrl, :newsSite, :summary, :publishedAt, :featured)
    end

    def set_article
      @article = Article.find(params[:id])
    end

    def searchable_params
      params.permit({ search: :title }, { order: {} }, :page, :length)
    end
  end
end
