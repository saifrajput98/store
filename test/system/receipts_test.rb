# frozen_string_literal: true

require 'application_system_test_case'

class ReceiptsTest < ApplicationSystemTestCase
  setup do
    @receipt = receipts(:one)
  end

  test 'visiting the index' do
    visit receipts_url
    assert_selector 'h1', text: 'Receipts'
  end

  test 'creating a Receipt' do
    visit receipts_url
    click_on 'New Receipt'

    fill_in 'Customer', with: @receipt.customer_id
    fill_in 'Discount amt', with: @receipt.discount_amt
    fill_in 'Gross amt', with: @receipt.gross_amt
    fill_in 'Net amt', with: @receipt.net_amt
    fill_in 'Receipt type', with: @receipt.receipt_type
    click_on 'Create Receipt'

    assert_text 'Receipt was successfully created'
    click_on 'Back'
  end

  test 'updating a Receipt' do
    visit receipts_url
    click_on 'Edit', match: :first

    fill_in 'Customer', with: @receipt.customer_id
    fill_in 'Discount amt', with: @receipt.discount_amt
    fill_in 'Gross amt', with: @receipt.gross_amt
    fill_in 'Net amt', with: @receipt.net_amt
    fill_in 'Receipt type', with: @receipt.receipt_type
    click_on 'Update Receipt'

    assert_text 'Receipt was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Receipt' do
    visit receipts_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Receipt was successfully destroyed'
  end
end
