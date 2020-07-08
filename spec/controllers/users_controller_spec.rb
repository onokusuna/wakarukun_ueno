require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  describe '登録情報変更画面' do
    context "登録情報変更画面が正しく表示される" do
      before do
        get :edit
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      render_views
      it 'タイトルが正しく表示されていること' do
          expect(response.body).to include("登録情報変更")
      end
    end
  end
end