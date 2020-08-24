require 'rails_helper'

RSpec.describe User::Operation::Create do
  context "With valid params" do
    it "Creates new user successfully" do
      result = User::Operation::Create.(params: {user: {name: "Niranja djd", email: "abc@xyz"}})

      expect(result.success?).to eq(true)
    end
  end

  context "With invalid params returns error" do
    it "Creates new user successfully" do
      result = User::Operation::Create.(params: {user: {name: "", email: "abc@xyz"}})

      expect(result.success?).to eq(false)
      expect(result["contract.default"].errors.full_messages).to include("Name can't be blank")
    end

    it "Creates new user successfully" do
      result = User::Operation::Create.(params: {user: {name: "JDJDJD", email: ""}})

      expect(result.success?).to eq(false)
      expect(result["contract.default"].errors.full_messages).to include("Email can't be blank")
    end
  end
end