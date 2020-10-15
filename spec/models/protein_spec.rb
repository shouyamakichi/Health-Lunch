require 'rails_helper'

RSpec.describe Protein, type: :model do
  describe Protein do
    before do
      user = FactoryBot.create(:user)
      @protein = FactoryBot.build(:protein, user_id: user.id)
    end

    describe 'たんぱくケア商品新規登録' do
      context '新規登録がうまく行くとき' do
        it 'image,name,price,energy,prote,Lipid,salt,carbo,first,second,third,forthが存在すれば登録できる' do
          expect(@protein).to be_valid
        end
      end
    end

    context '商品登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @protein.name=''
        @protein.valid?
        expect(@protein.errors.full_messages).to include("Nameを入力してください")
      end

      it "nameが英字だと登録できない" do
        @protein.name = 'AAAAA'
        @protein.valid?
        expect(@protein.errors.full_messages).to include("Nameは不正な値です")
      end
      
      it "nameが半角英字だと登録できない" do
        @protein.name = 'aaaaaaaaa'
        @protein.valid?
        expect(@protein.errors.full_messages).to include("Nameは不正な値です")
      end

      it 'priceが空だと登録できない' do
        @protein.price = ""
        @protein.valid?
        expect(@protein.errors.full_messages).to include("Priceを入力してください")
      end

      it 'priceが全角だと登録できない' do
        @protein.price = 'ああああああ'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Priceは数値で入力してください')
      end

      it 'priceが半角英字だと登録できない' do
        @protein.price = 'aaaaaaaa'
        @protein.price = 'aaaaaaaa'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Priceは数値で入力してください')
      end

      it 'energyが空だと登録できない' do
        @protein.energy = ''
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Energyを入力してください')
      end

      it 'energyが全角だと登録できない' do
        @protein.energy = 'ああああああ'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Energyは不正な値です')
      end

      it 'energyが全角数字だ登録できない' do
        @protein.energy = '１１１１１１'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Energyは不正な値です')
      end
      
      it 'proteが空だと登録できない' do
        @protein.prote = ''
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Proteを入力してください')
      end

      it 'proteが全角だと登録できない' do
        @protein.prote = 'ああああああ'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Proteは不正な値です')
      end

      it 'proteが全角数字だ登録できない' do
        @protein.prote = '１１１１１１'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Proteは不正な値です')
      end

      it 'Lipidが空だと登録できない' do
        @protein.Lipid = ''
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Lipidを入力してください')
      end

      it 'Lipidが全角だと登録できない' do
        @protein.Lipid = 'ああああああ'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Lipidは不正な値です')
      end

      it 'Lipidが全角数字だ登録できない' do
        @protein.Lipid = '１１１１１１'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Lipidは不正な値です')
      end

      it 'saltが空だと登録できない' do
        @protein.salt = ''
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Saltを入力してください')
      end

      it 'saltが全角だと登録できない' do
        @protein.salt = 'ああああああ'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Saltは不正な値です')
      end

      it 'saltが全角数字だ登録できない' do
        @protein.salt = '１１１１１１'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Saltは不正な値です')
      end

      it 'carboが空だと登録できない' do
        @protein.carbo = ''
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Carboを入力してください')
      end

      it 'carboが全角だと登録できない' do
        @protein.carbo = 'ああああああ'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Carboは不正な値です')
      end

      it 'carboが全角数字だと登録できない' do
        @protein.carbo = '１１１１１１'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Carboは不正な値です')
      end

      it 'firstが全角英数だと登録できない' do
        @protein.first = 'AAAAAAAA'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Firstは不正な値です')
      end

      it 'firstが半角英数だと登録できない' do
        @protein.first = 'aaaaaaaa'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Firstは不正な値です')
      end

      it 'firstが数字だと登録できない' do
        @protein.first = '111111'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Firstは不正な値です')
      end

      it 'secondが全角英数だと登録できない' do
        @protein.second = 'AAAAAAAA'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Secondは不正な値です')
      end

      it 'secondが半角英数だと登録できない' do
        @protein.second = 'aaaaaaaaa'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Secondは不正な値です')
      end

      it 'secondが数字だと登録できない' do
        @protein.second = '1111111'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Secondは不正な値です')
      end

      it 'thirdが全角英数だと登録できない' do
        @protein.third = 'AAAAAAAA'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Thirdは不正な値です')
      end

      it 'thirdが半角英数だと登録できない' do
        @protein.third = 'aaaaaaaa'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Thirdは不正な値です')
      end

      it 'thirdが数字だと登録できない' do
        @protein.third = '1111111'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Thirdは不正な値です')
      end

      it 'forthが全角英数だと登録できない' do
        @protein.forth = 'AAAAAAAA'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Forthは不正な値です')
      end

      it 'forthが半角英数だと登録できない' do
        @protein.forth = 'aaaaaaa'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Forthは不正な値です')
      end

      it 'forthが数字だと登録できない' do
        @protein.forth = '1111111'
        @protein.valid?
        expect(@protein.errors.full_messages).to include('Forthは不正な値です')
      end

    end
  end
end
