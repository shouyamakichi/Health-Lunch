require 'rails_helper'

RSpec.describe Calo, type: :model do
  describe Calo do
    before do
      user = FactoryBot.create(:user)
      @calo = FactoryBot.build(:calo, user_id: user.id)
    end

    describe 'たんぱくケア商品新規登録' do
      context '新規登録がうまく行くとき' do
        it 'image,name,price,energy,prote,Lipid,salt,carbo,first,second,third,forthが存在すれば登録できる' do
          expect(@calo).to be_valid
        end
      end
    end

    context '商品登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @calo.name=''
        @calo.valid?
        expect(@calo.errors.full_messages).to include("Nameを入力してください")
      end

      it "nameが英字だと登録できない" do
        @calo.name = 'AAAAA'
        @calo.valid?
        expect(@calo.errors.full_messages).to include("Nameは不正な値です")
      end
      
      it "nameが半角英字だと登録できない" do
        @calo.name = 'aaaaaaaaa'
        @calo.valid?
        expect(@calo.errors.full_messages).to include("Nameは不正な値です")
      end

      it 'priceが空だと登録できない' do
        @calo.price = ""
        @calo.valid?
        expect(@calo.errors.full_messages).to include("Priceを入力してください")
      end

      it 'priceが全角だと登録できない' do
        @calo.price = 'ああああああ'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Priceは数値で入力してください')
      end

      it 'priceが半角英字だと登録できない' do
        @calo.price = 'aaaaaaaa'
        @calo.price = 'aaaaaaaa'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Priceは数値で入力してください')
      end

      it 'energyが空だと登録できない' do
        @calo.energy = ''
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Energyを入力してください')
      end

      it 'energyが全角だと登録できない' do
        @calo.energy = 'ああああああ'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Energyは不正な値です')
      end

      it 'energyが全角数字だ登録できない' do
        @calo.energy = '１１１１１１'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Energyは不正な値です')
      end
      
      it 'proteが空だと登録できない' do
        @calo.prote = ''
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Proteを入力してください')
      end

      it 'proteが全角だと登録できない' do
        @calo.prote = 'ああああああ'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Proteは不正な値です')
      end

      it 'proteが全角数字だ登録できない' do
        @calo.prote = '１１１１１１'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Proteは不正な値です')
      end

      it 'Lipidが空だと登録できない' do
        @calo.Lipid = ''
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Lipidを入力してください')
      end

      it 'Lipidが全角だと登録できない' do
        @calo.Lipid = 'ああああああ'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Lipidは不正な値です')
      end

      it 'Lipidが全角数字だ登録できない' do
        @calo.Lipid = '１１１１１１'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Lipidは不正な値です')
      end

      it 'saltが空だと登録できない' do
        @calo.salt = ''
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Saltを入力してください')
      end

      it 'saltが全角だと登録できない' do
        @calo.salt = 'ああああああ'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Saltは不正な値です')
      end

      it 'saltが全角数字だ登録できない' do
        @calo.salt = '１１１１１１'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Saltは不正な値です')
      end

      it 'carboが空だと登録できない' do
        @calo.carbo = ''
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Carboを入力してください')
      end

      it 'carboが全角だと登録できない' do
        @calo.carbo = 'ああああああ'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Carboは不正な値です')
      end

      it 'carboが全角数字だと登録できない' do
        @calo.carbo = '１１１１１１'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Carboは不正な値です')
      end

      it 'firstが全角英数だと登録できない' do
        @calo.first = 'AAAAAAAA'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Firstは不正な値です')
      end

      it 'firstが半角英数だと登録できない' do
        @calo.first = 'aaaaaaaa'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Firstは不正な値です')
      end

      it 'firstが数字だと登録できない' do
        @calo.first = '111111'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Firstは不正な値です')
      end

      it 'secondが全角英数だと登録できない' do
        @calo.second = 'AAAAAAAA'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Secondは不正な値です')
      end

      it 'secondが半角英数だと登録できない' do
        @calo.second = 'aaaaaaaaa'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Secondは不正な値です')
      end

      it 'secondが数字だと登録できない' do
        @calo.second = '1111111'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Secondは不正な値です')
      end

      it 'thirdが全角英数だと登録できない' do
        @calo.third = 'AAAAAAAA'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Thirdは不正な値です')
      end

      it 'thirdが半角英数だと登録できない' do
        @calo.third = 'aaaaaaaa'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Thirdは不正な値です')
      end

      it 'thirdが数字だと登録できない' do
        @calo.third = '1111111'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Thirdは不正な値です')
      end

      it 'forthが全角英数だと登録できない' do
        @calo.forth = 'AAAAAAAA'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Forthは不正な値です')
      end

      it 'forthが半角英数だと登録できない' do
        @calo.forth = 'aaaaaaa'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Forthは不正な値です')
      end

      it 'forthが数字だと登録できない' do
        @calo.forth = '1111111'
        @calo.valid?
        expect(@calo.errors.full_messages).to include('Forthは不正な値です')
      end

    end
  end
end
