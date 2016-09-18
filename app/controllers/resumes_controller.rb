class ResumesController < ApplicationController

  def show
  @text = Unirest.get("http://localhost:3001/api/v1/students/#{params[:id].to_s}.json").body
      respond_to do |format|
        format.html
            format.pdf do
              pdf = Prawn::Document.new
              attribute_values = []
              @text.each do |student, value|
                 attribute_values << value unless value.class == Fixnum || value.empty?
              end
                  pdf.text "#{attribute_values[0]} #{attribute_values[1]}
                  #{attribute_values[2]}
                  #{attribute_values[3]}",
                  :margin => 100,
                  :size => 25
            send_data pdf.render, type: "application/pdf", disposition: "inline"
            end
          end
        end
    end
