if ActiveRecord::Base.connection.table_exists?('links')
  links = Link.all.map(&:original)

  Short::BloomFilter.instance.seed(links)
end

