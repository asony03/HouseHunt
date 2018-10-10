class House < ApplicationRecord
  has_many_attached :images
  belongs_to :real_estate_company, optional: true
  belongs_to :user
  has_many :inquiries
  has_many :potential_buyers

  validates :name, :location, :owner, :contact, presence: true
  validates :year, :floors, :price, :sq_ft, presence: true, numericality: true

  def self.search(params)

    if !params[:location].nil?
      query=""
      query_params=Hash.new
      if(params[:location]!='')
        query=query+"lower(location) LIKE :location"
        query_params[:location] = "%#{params[:location].downcase}%"
      end
      if(params[:start_price]!='' and params[:end_price]!='')
        if(query!="")
          query+=" and "
        end
        query=query+"price >= :start_price and price <= :end_price"
        query_params[:start_price] = params[:start_price]
        query_params[:end_price] = params[:end_price]
      elsif params[:start_price]!=''
        if(query!="")
          query+=" and "
        end
        query=query+"price >= :start_price"
        query_params[:start_price] = params[:start_price]
      elsif params[:end_price]!=''
        if(query!="")
          query+=" and "
        end
        query=query+"price <= :end_price"
        query_params[:end_price] = params[:end_price]
      end
      if(params[:start_area]!='' and params[:end_area]!='')
        if(query!="")
          query+=" and "
        end
        query=query+"sq_ft >= :start_area and sq_ft <= :end_area"
        query_params[:start_area] = params[:start_area]
        query_params[:end_area] = params[:end_area]
      elsif params[:start_area]!=''
        if(query!="")
          query+=" and "
        end
        query=query+"sq_ft >= :start_area"
        query_params[:start_area] = params[:start_area]
      elsif params[:end_area]!=''
        if(query!="")
          query+=" and "
        end
        query=query+"sq_ft <= :end_area"
        query_params[:end_area] = params[:end_area]
      end
      where(query, query_params)
    else
      all
    end
  end
end
