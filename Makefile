attach:
	docker-compose exec geth geth --datadir /data attach

sh1:
	docker-compose exec geth sh

sh2:
	docker-compose exec prysm bash

run:
	docker-compose up -d
	docker-compose logs --tail=100 -f
