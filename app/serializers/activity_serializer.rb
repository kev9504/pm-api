class ActivitySerializer < ActiveModel::Serializer
    attributes  :id,
                :description,
                :time_spent,
                :username,
                :created_at
end