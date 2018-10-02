json.extract! user, :id, :name, :email, :password_digest, :phone, :preferred_cnt_menthod, :is_admin, :is_realtor, :is_house_hunter, :RealEstateCompany_id, :created_at, :updated_at
json.url user_url(user, format: :json)
