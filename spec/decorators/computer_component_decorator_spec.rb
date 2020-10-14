require 'rails_helper'

RSpec.describe ComputerComponentDecorator do
  let!(:car) { create(:car) }
  let!(:computer_component) {
    create(:component, type_cd: Component.types["computer"], car: car)
  }
  let!(:chasis_component) {
    create(:component, type_cd: Component.types["chasis"], error: true, car: car)
  }
  let(:decorated_computer_component) {
    computer_component.extend(ComputerComponentDecorator)
  }

  context "computer component decorated" do
    it "should return errors" do
      expect(decorated_computer_component.any_error?).to eq(true)
    end

    it "should return component with error" do
      components_with_error = decorated_computer_component.components_with_error

      expect(components_with_error.count).to eq(1)
      expect(components_with_error.first).to eq(chasis_component)
    end
  end
end
