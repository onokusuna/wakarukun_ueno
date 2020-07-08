require 'rails_helper'
RSpec.describe User, type: :model do
  # データを全て入力
  context "データが正しく保存される" do
    before do
      @user = User.new
      @user.id = 1
      @user.name = "John Doe"
      @user.email = "john@doe"
      @user.password = "111111"
      @user.created_at = Time.current
      @user.updated_at = Time.current
      @user.save
    end
    it "全て入力してあるので保存される" do
      expect(@user).to be_valid
    end
  end
  # バリデーションを確認name
  context "データが正しく保存されない" do
    before do
      @user = User.new
      @user.id = 1
      @user.name = ""
      @user.email = "john@doe"
      @user.password = "111111"
      @user.created_at = Time.current
      @user.updated_at = Time.current
      @user.save
    end
    it "nameが入力されていないので保存されない" do
      expect(@user).to be_invalid
      expect(@user.errors[:name]).to include("can't be blank")
    end
  end
  # バリデーションemail
  context "データが正しく保存されない" do
    before do
      @user = User.new
      @user.id = 1
      @user.name = "John Doe"
      @user.email = ""
      @user.password = "111111"
      @user.created_at = Time.current
      @user.updated_at = Time.current
      @user.save
    end
    it "emailが入力されていないので保存されない" do
      expect(@user).to be_invalid
      expect(@user.errors[:email]).to include("can't be blank")
    end
  end
  # バリデーションpassword
  context "データが正しく保存されない" do
    before do
      @user = User.new
      @user.id = 1
      @user.name = "John Doe"
      @user.email = "john@doe"
      @user.password = ""
      @user.created_at = Time.current
      @user.updated_at = Time.current
      @user.save
    end
    it "passwordが入力されていないので保存されない" do
      expect(@user).to be_invalid
      expect(@user.errors[:password]).to include("can't be blank")
    end
  end
  # バリデーションを確認name:max20
  context "データが正しく保存されない" do
    before do
      @user = User.new
      @user.id = 1
      @user.name = "123456789022345678901"
      @user.email = "john@doe"
      @user.password = "111111"
      @user.created_at = Time.current
      @user.updated_at = Time.current
      @user.save
    end
    it "nameが20文字を超えているので保存されない" do
      expect(@user).to be_invalid
      expect(@user.errors[:name]).to include("is too long (maximum is 20 characters)")
    end
  end
# ログイン状態にする
describe "ログイン状態" do
  before do
    @user = build(:user)
  end

  context "バリデーション" do
    it "emailとpasswordどちらも値が設定されていれば、OK" do
      expect(@user.valid?).to eq(true)
    end

    it "emailが空だとNG" do
      @user.email = ""
      expect(@user.valid?).to eq(false)
    end

    it "passwordが空だとNG" do
      @user.password = ""
      expect(@user.valid?).to eq(false)
    end
  end
end
end