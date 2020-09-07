# frozen_string_literal: true

class DashboardsController < ApplicationController
  def index
    @products = Product.last(10)
    @clients = Client.last(10)
    @sales = Sale.last(10)
  end
end
