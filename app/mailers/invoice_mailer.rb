class InvoiceMailer < ApplicationMailer
  def new_invoice(receipt)
    @receipt = receipt

    pdf = WickedPdf.new.pdf_from_string(
      render_to_string('receipts/invoice.html.erb', layout: 'pdf.html.erb')
    )

    attachments["Receipt id #{receipt.id}.pdf"] = pdf
    mail(to: 'saif@gmail.com')
  end
end
