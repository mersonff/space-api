require 'rails_helper'

RSpec.describe "Articles" do
  describe "GET /articles" do
    let(:articles) { create_list(:article, 15) }
    
    it "works! (now write some real specs)" do
      get v1_articles_path
      expect(response).to have_http_status(200)
    end

    it "returns all articles" do
      get v1_articles_path
      expect(body_json['articles'].count).to eq articles.count
    end
  end

  describe "GET /articles/:id" do
    let(:article) { create(:article) }

    it "works! (now write some real specs)" do
      get v1_article_path(article)
      expect(response).to have_http_status(200)
    end

    it "returns requested article" do
      get v1_article_path(article)
      expect(body_json['article']['id']).to eq article.id
    end
  end

  describe "POST /articles" do
    let(:article_params) { attributes_for(:article) }

    it "works! (now write some real specs)" do
      post v1_articles_path, params: article_params
      expect(response).to have_http_status(201)
    end

    it "creates a new article", :aggregate_failures do
      expect do
        post v1_articles_path, params: article_params
      end.to change(Article, :count).by(1)
    end
  end

  describe "PATCH /articles/:id" do
    let(:article) { create(:article, title: 'old title') }
    let(:article_params) { { article: { title: 'new title' }.to_json } }

    it "works! (now write some real specs)" do
      patch v1_article_path(article), params: article_params
      expect(response).to have_http_status(200)
    end

    it "updates the article", :aggregate_failures do
      expect do
        patch v1_article_path(article), params: article_params
      end.to change { article.reload.title }.from('old title').to('new title')
    end
  end

  describe "DELETE /articles/:id" do
    let!(:article) { create(:article) }

    it "works! (now write some real specs)" do
      delete v1_article_path(article)
      expect(response).to have_http_status(204)
    end

    it "deletes the article", :aggregate_failures do
      delete v1_article_path(article)
      expect(body_json).to be_empty
    end
  end
end
