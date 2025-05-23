require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping_address = FactoryBot.build(:order_shipping_address,user_id: user.id,item_id: item.id)
  end

  describe "商品購入及び配送先住所の保存" do
    context "内容に問題がない場合" do
      it "すべての値が正しく入力されていれば保存できる" do
        expect(@order_shipping_address).to be_valid
      end
      it "building_nameは空でも保存できる" do
        @order_shipping_address.building_name = ""
        expect(@order_shipping_address).to be_valid
      end
    end

    context "内容に問題がある場合" do
      it "postal_codeが空だと保存できない" do
        @order_shipping_address.postal_code = ""
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeは半角のハイフンを含んだ正しい形式でないと保存できない" do
        @order_shipping_address.postal_code = "0608611"
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "prefecture_idが1だと保存できない" do
        @order_shipping_address.prefecture_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空だと保存できない" do
        @order_shipping_address.city = ""
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it "street_addressが空だと保存できない" do
        @order_shipping_address.street_address = ""
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Street address can't be blank")
      end
      it "phone_numberが空だと保存できない" do
        @order_shipping_address.phone_number = ""
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが10-11桁の半角数字のみで記述されていないと保存できない" do
        @order_shipping_address.phone_number = "011-211-2111"
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number must be 10 or 11 digits and not include hyphen(-)")
      end

      it "userが紐ついていないと保存できない" do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐ついていないと保存できない" do
        @order_shipping_address.item_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空だと保存できない" do
        @order_shipping_address.token = ""
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it "priceが空だと保存できない" do
        @order_shipping_address.price = ""
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Price can't be blank")
      end
      





    end
  


  end


end
