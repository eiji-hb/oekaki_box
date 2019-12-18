require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:lily)
  end
  context "ユーザーが有効な場合" do
    it "有効であること" do
      expect(@user).to be_valid
    end
  end
  context "ユーザーが無効な場合" do
    it "ユーザー名が存在しない場合無効であること" do
      @user.username = nil
      expect(@user).not_to be_valid
    end
    it "ユーザー名が3文字以下の場合無効であること" do
      @user.username = "a" * 2
      expect(@user).not_to be_valid
    end
    it "ユーザー名が20文字以上の場合無効であること" do
      @user.username = "a" * 21
      expect(@user).not_to be_valid
    end
    it "ユーザー名がすでに存在している場合は無効" do
      @user.username = FactoryBot.build(:lily,username: "lily")
      expect(@user).not_to be_valid
    end


    context "メールアドレスが無効な場合" do
      it "メールアドレスが存在しない場合無効であること" do
        @user.email = nil
        expect(@user).not_to be_valid
      end
      it "メールアドレスがすでに存在している場合は無効" do
        @user.email = FactoryBot.build(:lily,email: "test@example.com")
        expect(@user).not_to be_valid
      end
    end
    context "パスワードが無効な場合" do
      it "パスワードが5文字以下の場合は無効" do
        @user.password = "a" * 5
        expect(@user).not_to be_valid
      end
      it "パスワードが129文字以上の場合は無効" do
        @user.password = "a" * 129
        expect(@user).not_to be_valid
      end
      it "パスワードが存在しない場合は無効" do
        @user.password = nil
        expect(@user).not_to be_valid
      end
    end
  end
end
