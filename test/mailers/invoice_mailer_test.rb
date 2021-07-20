# frozen_string_literal: true

require 'test_helper'

class InvoiceMailerTest < ActionMailer::TestCase
  test 'new_invoice' do
    mail = InvoiceMailer.new_invoice
    assert_equal 'New invoice', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
