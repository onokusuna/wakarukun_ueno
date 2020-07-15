require 'rails_helper'

RSpec.feature "動作に関するテスト", type: :feature do
  before do
    FactoryBot.create(:user)
  end
  scenario "ヘッダーにマイページへのリンクが表示されているか" do
    visit exhibitions_path
    expect(page).to have_link "", href: user_path
  end
  feature "userマイページの詳細内容は正しいか" do
    given(:user) {User.last}
    before do
      visit user_path
    end
    scenario "userの名前とメールアドレスを表示されているか" do
        expect(page).to have_content current_user.name
        expect(page).to have_content current_user.email
    end
  end
  scenario '404エラーページに遷移し、ステータスコードが404であること' do
    # 存在しないパスにアクセスする
    visit '/users/0'

    expect(page).to have_content '404 not found'
    expect(page.status_code).to eq 404
  end

  scenario '500エラーページに遷移し、ステータスコードが500であること' do
    # 一覧画面に遷移したら例外を発生させる
    allow_any_instance_of(UsersController).to receive(:index).and_throw(Exception)
    visit users_path

    expect(page).to have_content '500 Internal Server Error'
    expect(page.status_code).to eq 500
  end
end