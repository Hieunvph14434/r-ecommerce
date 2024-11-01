class Admins::ProductsController < ApplicationController
  def index
    render 'products/index'
  end

  def new
    @product = Product.new
    @categories = Category.all
    @attributes = Attribute.all
    render 'products/new'
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  def create

    @product = Product.new(product_params)
    @product.status = Product.statuses[product_params[:status]]
    variants = JSON.parse(params[:product][:variants])
    raise variants.inspect
    if @product.save
      unless variants.empty?
        variants.each do |variant_data|
          variant = Variant.new(variant_data.slice('sku', 'price', 'stock'))
          variant.product_id = @product.id
          if variant.save
            variant_attributes = variant_data['attributes'] || []
            unless variant_attributes.empty?
              variant_attributes.each do |attribute_data|
                variant_attribute = VariantAttribute.new(attribute_data)
                variant_attribute.variant_id = variant.id
                variant_attribute.save
              end
            end
          end
        end
      end
      redirect_to admins_products_path, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :description, :status, :category_id)
  end
end
