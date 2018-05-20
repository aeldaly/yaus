# One of the best URL shorteners known to man

## Starting the app

### Server
1. cd server
2. rake db:create
3. rake db:migrate
4. rails s

### Web
1. cd web
2. yarn install
3. npm start

## General Notes
1. Some approaches are naive:

  a. Shortening algorithm is pretty simple. I opted to focus on functionality + look & feel

  b. Calling Link.all in a couple of places. For the purposes of this demo, I feel it's good enough. Pagination would have been better in the case of serving, and in the case of the bloom filter, it could be backed by Redis or such.

2. There's no security. CORS allows from anywhere. In practice, I would Only allow CORS from the production domain

3. If this where to become a public API, I would implement some sort of API key functionality with rate limiting and maximum number of requests per hour/day/month.

4. No error catching. Any errors that occur server side, will not appear client side. The user can be left scratching their head.

5. Not 100% test coverage. I only tested `ShortenController` and `Short::BloomFilter` as a demonstration.