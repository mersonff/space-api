# frozen_string_literal: true

require 'rails_helper'

describe ModelLoadingService do
  context 'when #call' do
    let!(:articles) { create_list(:article, 15) }

    context 'when params are present' do
      let!(:search_articles) do
        articles = []
        15.times do |n|
          articles << create(:article, title: "Search #{n + 1}", summary: 'Merson')
        end
        articles
      end

      let!(:unexpected_articles) do
        articles = []
        15.times do |n|
          articles << create(:article, title: "Search #{n + 16}", summary: 'João')
        end
        articles
      end

      let(:params) do
        { search: { title: 'Search', summary: 'Mers' }, order: { title: :desc }, page: 2, length: 4 }
      end

      it 'performs right :length following pagination' do
        service = described_class.new(Article.all, params)
        service.call
        expect(service.records.count).to eq 4
      end

      it 'do right search, order and pagination' do
        search_articles.sort! { |a, b| b[:title] <=> a[:title] }
        service = described_class.new(Article.all, params)
        service.call
        expected_articles = search_articles[4..7]
        expect(service.records).to contain_exactly(*expected_articles)
      end

      it 'sets right :page' do
        service = described_class.new(Article.all, params)
        service.call
        expect(service.pagination[:page]).to eq 2
      end

      it 'sets right :length' do
        service = described_class.new(Article.all, params)
        service.call
        expect(service.pagination[:length]).to eq 4
      end

      it 'sets right :total' do
        service = described_class.new(Article.all, params)
        service.call
        expect(service.pagination[:total]).to eq 15
      end

      it 'sets right :total_pages' do
        service = described_class.new(Article.all, params)
        service.call
        expect(service.pagination[:total_pages]).to eq 4
      end

      it 'does not return unenexpected records' do
        params.merge!(page: 1, length: 50)
        service = described_class.new(Article.all, params)
        service.call
        expect(service.records).not_to include(*unexpected_articles)
      end
    end

    context 'when params are not present' do
      it 'returns default :length pagination' do
        service = described_class.new(Article.all, nil)
        service.call
        expect(service.records.count).to eq 10
      end

      it 'returns first 10 records' do
        service = described_class.new(Article.all, nil)
        service.call
        expected_articles = articles[0..9]
        expected_articles_ids = expected_articles.map(&:id)
        expect(service.records.pluck(:id)).to eq(expected_articles_ids)
      end

      it 'sets right :page' do
        service = described_class.new(Article.all, nil)
        service.call
        expect(service.pagination[:page]).to eq 1
      end

      it 'sets right :length' do
        service = described_class.new(Article.all, nil)
        service.call
        expect(service.pagination[:length]).to eq 10
      end

      it 'sets right :total' do
        service = described_class.new(Article.all, nil)
        service.call
        expect(service.pagination[:total]).to eq 15
      end

      it 'sets right :total_pages' do
        service = described_class.new(Article.all, nil)
        service.call
        expect(service.pagination[:total_pages]).to eq 2
      end
    end
  end
end
