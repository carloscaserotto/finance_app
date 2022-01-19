class StocksController < ApplicationController
    def search
        #byebug
        if params[:stock].present?
            @stock = Stock.new_loockup(params[:stock])
            if @stock
                respond_to do |format|
                    format.js { render partial: 'users/result' }
                end
                #render json: @stock
                #render 'users/my_portfolio'
            else
                #invalid symbol
                respond_to do |format|
                    flash.now[:alert] = "Please enter a valid symbol"
                    format.js { render partial: 'users/result' }
                end
                #redirect_to my_portfolio_path
            end
        else
            #empty search
            respond_to do |format|
                flash.now[:alert] = "Please enter a symbol to search"
                format.js { render partial: 'users/result' }
            end
            #flash[:alert] = "Please enter a symbol to search"
            #redirect_to my_portfolio_path
        end
    end
end