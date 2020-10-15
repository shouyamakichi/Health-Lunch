require 'rails_helper'

RSpec.describe Soft, type: :model do
  describe Soft do
    before do
      user = FactoryBot.create(:user)
      @soft = FactoryBot.build(:soft, user_id: user.id)
    end

    describe 'たんぱくケア商品新規登録' do
      context '新規登録がうまく行くとき' do
        it 'image,name,price,energy,prote,Lipid,salt,carbo,first,second,third,forthが存在すれば登録できる' do
          expect(@soft).to be_valid
        end
      end
    end

    context '商品登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @soft.name=''
        @soft.valid?
        expect(@soft.errors.full_messages).to include("Nameを入力してください")
      end

      it "nameが英字だと登録できない" do
        @soft.name = 'AAAAA'
        @soft.valid?
        expect(@soft.errors.full_messages).to include("Nameは不正な値です")
      end
      
      it "nameが半角英字だと登録できない" do
        @soft.name = 'aaaaaaaaa'
        @soft.valid?
        expect(@soft.errors.full_messages).to include("Nameは不正な値です")
      end

      it 'priceが空だと登録できない' do
        @soft.price = ""
        @soft.valid?
        expect(@soft.errors.full_messages).to include("Priceを入力してください")
      end

      it 'priceが全角だと登録できない' do
        @soft.price = 'ああああああ'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Priceは数値で入力してください')
      end

      it 'priceが半角英字だと登録できない' do
        @soft.price = 'aaaaaaaa'
        @soft.price = 'aaaaaaaa'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Priceは数値で入力してください')
      end

      it 'energyが空だと登録できない' do
        @soft.energy = ''
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Energyを入力してください')
      end

      it 'energyが全角だと登録できない' do
        @soft.energy = 'ああああああ'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Energyは不正な値です')
      end

      it 'energyが全角数字だ登録できない' do
        @soft.energy = '１１１１１１'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Energyは不正な値です')
      end

      it 'proteが空だと登録できない' do
        @soft.prote = ''
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Proteを入力してください')
      end

      it 'proteが全角だと登録できない' do
        @soft.prote = 'ああああああ'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Proteは不正な値です')
      end

      it 'proteが全角数字だ登録できない' do
        @soft.prote = '１１１１１１'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Proteは不正な値です')
      end

      it 'Lipidが空だと登録できない' do
        @soft.Lipid = ''
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Lipidを入力してください')
      end

      it 'Lipidが全角だと登録できない' do
        @soft.Lipid = 'ああああああ'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Lipidは不正な値です')
      end

      it 'Lipidが全角数字だ登録できない' do
        @soft.Lipid = '１１１１１１'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Lipidは不正な値です')
      end

      it 'saltが空だと登録できない' do
        @soft.salt = ''
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Saltを入力してください')
      end

      it 'saltが全角だと登録できない' do
        @soft.salt = 'ああああああ'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Saltは不正な値です')
      end

      it 'saltが全角数字だ登録できない' do
        @soft.salt = '１１１１１１'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Saltは不正な値です')
      end

      it 'carboが空だと登録できない' do
        @soft.carbo = ''
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Carboを入力してください')
      end

      it 'carboが全角だと登録できない' do
        @soft.carbo = 'ああああああ'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Carboは不正な値です')
      end

      it 'carboが全角数字だと登録できない' do
        @soft.carbo = '１１１１１１'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Carboは不正な値です')
      end

      it 'firstが全角英数だと登録できない' do
        @soft.first = 'AAAAAAAA'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Firstは不正な値です')
      end

      it 'firstが半角英数だと登録できない' do
        @soft.first = 'aaaaaaaa'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Firstは不正な値です')
      end

      it 'firstが数字だと登録できない' do
        @soft.first = '111111'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Firstは不正な値です')
      end

      it 'secondが全角英数だと登録できない' do
        @soft.second = 'AAAAAAAA'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Secondは不正な値です')
      end

      it 'secondが半角英数だと登録できない' do
        @soft.second = 'aaaaaaaaa'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Secondは不正な値です')
      end

      it 'secondが数字だと登録できない' do
        @soft.second = '1111111'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Secondは不正な値です')
      end

      it 'thirdが全角英数だと登録できない' do
        @soft.third = 'AAAAAAAA'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Thirdは不正な値です')
      end

      it 'thirdが半角英数だと登録できない' do
        @soft.third = 'aaaaaaaa'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Thirdは不正な値です')
      end

      it 'thirdが数字だと登録できない' do
        @soft.third = '1111111'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Thirdは不正な値です')
      end

      it 'forthが全角英数だと登録できない' do
        @soft.forth = 'AAAAAAAA'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Forthは不正な値です')
      end

      it 'forthが半角英数だと登録できない' do
        @soft.forth = 'aaaaaaa'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Forthは不正な値です')
      end

      it 'forthが数字だと登録できない' do
        @soft.forth = '1111111'
        @soft.valid?
        expect(@soft.errors.full_messages).to include('Forthは不正な値です')
      end

    end
  end
end
