require 'rails_helper'
RSpec.describe Users::SessionsController, type: :controller do
  describe 'ログイン画面' do
    context "ログイン画面が正しく表示される" do
      before do
        {:action=>"new", :controller=>"user_sessions"}
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      render_views
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("Log in")
      end
    end
  end
end