class TaskSerializer < ActiveModel::Serializer
    attributes  :id,
                :description,
                :difficulty,
                :status,
                :source
end