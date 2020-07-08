require 'rails_helper'
RSpec.describe HomesController, type: :controller do
  describe 'トップ画面' do
    context "トップ画面が正しく表示される" do
      before do
        {:action=>"top", :controller=>"homes"}
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      render_views
      it 'タイトルが正しく表示されていること' do
          expect(response.body).to include("わかるくん")
      end
    end
  end
  describe 'アバウト画面' do
    context "アバウト画面が正しく表示される" do
      before do
        {:action=>"about", :controller=>"homes"}
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      render_views
      it 'タイトルが正しく表示されていること' do
          expect(response.body).to include("このアプリは")
      end
    end
  end
end