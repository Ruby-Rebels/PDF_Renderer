class ResumesController < ApplicationController

  def show
  @text = Unirest.get("http://localhost:3000/api/v1/students.json").body
      respond_to do |format|
        format.html
            format.pdf do
              pdf = Prawn::Document.new
              pdf.text "#{@text[0]['']}"
              send_data pdf.render, type: "application/pdf", disposition: "inline"
            end
          end
        end
    end
