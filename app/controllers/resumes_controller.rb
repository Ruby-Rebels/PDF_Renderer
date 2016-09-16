class ResumesController < ApplicationController

  def show
  @text = Unirest.get("https://data.cityofnewyork.us/resource/byk8-bdfw.json").body
      respond_to do |format|
        format.html
            format.pdf do
              pdf = Prawn::Document.new
              pdf.text "#{@text[1]["borough"]}"
              send_data pdf.render, type: "application/pdf", disposition: "inline"
            end
          end
        end
    end
