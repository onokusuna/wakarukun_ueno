require 'rails_helper'
RSpec.describe ExhibitionsController, type: :controller do
  describe '展覧会一覧画面' do
    context "展覧会一覧画面が正しく表示される" do
      before do
        {:action=>"index", :controller=>"exhibitions"}
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      render_views
      it 'タイトルが正しく表示されていること' do
          expect(response.body).to include("開催中展覧会一覧")
      end
    end
  end
end