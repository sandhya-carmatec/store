class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(25)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:notice] = "Successfully created product."
      redirect_to @product
    else
      render :action => 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:notice] = "Successfully updated product."
      redirect_to @product
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Successfully destroyed product."
    redirect_to products_url
  end

  def search_results
    query = params[:title] ? params[:title] : ""
    search_for_products(query, true)
    render :template => "admin/products/index"
  end

  def search_for_products(query, pagination=false)
    per_page = params[:per_page] || 10
    if pagination
      @products = Product.search "*#{query.to_s.strip}*", :page => params[:page], :per_page => per_page
    else
      @products = Product.search "*#{query.to_s.strip}*"
    end
  end

  def search_results
    query = params[:title] ? params[:title] : ""
    search_for_products(query, true)
    render :template => "admin/products/index"
  end

  def search_for_products(query, pagination=false)
    per_page = params[:per_page] || 10
    if pagination
      @products = Product.search "*#{query.to_s.strip}*", :page => params[:page], :per_page => per_page
    else
      @products = Product.search "*#{query.to_s.strip}*"
    end
  end

end
