require 'rails_helper'
RSpec.describe Users::RegistrationsController, type: :controller do
  describe '会員登録画面' do
    context "会員登録画面が正しく表示される" do
      before do
        {:action=>"new", :controller=>"user_registrations"}
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      render_views # どのcontrollerにおいても、render_viewsからのexpect(response.body).to include("表示文")がうまくいかない
      it 'タイトルが正しく表示されていること' do
          expect(response.body).to include("会員登録")
      end
    end
  end
end