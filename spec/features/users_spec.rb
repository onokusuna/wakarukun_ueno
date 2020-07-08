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
end