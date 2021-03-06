require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 1,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do
    # ACT
    visit root_path
    click_on 'Add'

    expect(page).to have_content "My Cart (1)"

    # DEBUG
    save_screenshot
  end
end
