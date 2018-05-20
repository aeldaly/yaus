links = Link.all.map(&:original)

Short::BloomFilter.instance.seed(links)

