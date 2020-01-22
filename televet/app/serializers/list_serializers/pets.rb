class ListSerializers::Pets < ActiveModel::Serializer
  attributes  :pets,
              :meta

  def pets
    object
  end

  def meta
    {
      last_page: object.last_page? || object.out_of_range?,
      num_pages: object.total_pages,
      current_page: object.current_page,
      page_size: object.limit_value,
      total_count: object.total_count
    }
  end
end
