require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe ' ユーザー新規登録 ' do
    context ' 新規登録ができるとき ' do
      it ' nicknameとemail、passwordとpassword_confirmation、family_name、last_name、j_famly_name、j_last_name、birthdayが存在すれば登録できること ' do
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
    end

    context ' 新規登録できないとき ' do
      it ' nikcnameがない場合は登録できないこと ' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームが入力されていません。')
      end

      it ' emailがない場合は登録できないこと ' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスが入力されていません。')
      end

      it ' emailが一意性であること ' do
        @user.save
        user2 = FactoryBot.build(:user)
        user2.email = @user.email
        user2.valid?
        expect(user2.errors.full_messages).to include('メールアドレスは既に使用されています。')
      end

      it ' emailは＠を含む必要があること ' do
        @user.email = 'aaatest'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは有効でありません。')
      end

      it ' パスワードが空では登録できないこと ' do
        @user.password = ''
        @user.valid?
        expect(@user.errors[:password]).to include('が入力されていません。', 'は半角英数字混合での入力が必須です。')
      end

      it ' パスワードは英字だけでは登録できない ' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors[:password]).to include('は半角英数字混合での入力が必須です。')
      end

      it ' パスワードは数字だけでは登録できない ' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors[:password]).to include('は半角英数字混合での入力が必須です。')
      end

      it ' passwordが存在してもpassword_confirmationがない場合は登録できないこと ' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("が内容とあっていません。", "確認用パスワードとパスワードは一致しないといけません。", "は半角英数字混合での入力が必須です。", "が入力されていません。")
      end

      it ' パスワードと確認用パスワードの値が一致しないと登録できない ' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'bbb222'
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("が内容とあっていません。", "確認用パスワードとパスワードは一致しないといけません。")
      end

      it ' passwordが5文字以下であれば登録できないこと ' do
        @user.password = 'aaa11'
        @user.password_confirmation = 'aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上に設定して下さい。')
      end

      it ' famliy_nameがない場合は登録できないこと ' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字が入力されていません。', '苗字は、全角（漢字・ひらがな・カタカナ）での入力が必須です。')
      end

      it ' last_nameがない場合は登録できないこと ' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('氏名が入力されていません。', '氏名は、全角（漢字・ひらがな・カタカナ）での入力が必須です。')
      end

      it ' 名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない ' do
        @user.family_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字は、全角（漢字・ひらがな・カタカナ）での入力が必須です。')
      end

      it ' 名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない ' do
        @user.last_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('氏名は、全角（漢字・ひらがな・カタカナ）での入力が必須です。')
      end

      it ' フリガナ（名字）が空だと登録できない ' do
        @user.j_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字のカナ表記が入力されていません。', '苗字のカナ表記は、全角（カタカナ）での入力が必須です。')
      end

      it ' フリガナ（名前）が空だと登録できない ' do
        @user.j_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('氏名のカナ表記が入力されていません。', '氏名のカナ表記は、全角（カタカナ）での入力が必須です。')
      end

      it ' 名字のフリガナは全角（カタカナ）でなければ登録できない ' do
        @user.j_family_name = 'かな'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字のカナ表記は、全角（カタカナ）での入力が必須です。')
      end

      it ' 名前のフリガナは全角（カタカナ）でなければ登録できない ' do
        @user.j_last_name = 'かな'
        @user.valid?
        expect(@user.errors.full_messages).to include('氏名のカナ表記は、全角（カタカナ）での入力が必須です。')
      end

      it ' birthdayがない場合は登録できないこと ' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日が入力されていません。')
      end
    end
  end
end
