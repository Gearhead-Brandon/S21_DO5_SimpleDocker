## Part 1. Ready-made docker

- Чтобы установить докер надо использовать следующую каманду 
```bash
sudo apt install docker.io
```
***
- Загрузка образа nginx через команду 
```bash
sudo docker pull nginx
```

![docker pull nginx](img/docker_pull_nginx.png)
***
- Проверка наличия докер образа с помощью команды
```bash
sudo docker images
```

![docker images](img/docker_images_part1.png)
***
- Запуск образа через команду 
```bash
sudo docker run -d [image_id|repository]
```

![docekr run -d](img/docker_run_-d_part1.png)
***
- Проверка наличия процесса, через команду
```bash
sudo docker ps
```

![docekr ps](img/docker_ps_part1.png)
***
- Просмотр информации о контейнере через команду
```bash
sudo docker inspect [container_id|container_name]
```

![docker inspect](img/docker_inspect_part1.png)
***
- Размер контейнера можно узнать, через команду
```bash
sudo docker inspect [container_id|container_name] | grep -e Size
```
![docker ShmSize](img/docker_inspect_size_part1.png)
***
- Замапленные порты можно найти в выводе команды
```bash
sudo docker inspect [container_id|container_name]
```
![Exposed ports](img/docker_inspect_exp_ports_part1.png)
***
- IP адрес контейнера можно посмотреть командой
```bash
sudo docker inspect [container_id|container_name] | grep -e IPAddress
```
![container ip addr](img/docker_inspect_ipadr_part1.png)
***
- Остановить докер можно командой
```bash
sudo docker stop [container_id|container_name]
```
![docker stop](img/docker_stop_part1.png)
***
- Проверка остановки образа
```bash
sudo docker ps
```
![docker ps](img/docker_stop_ps_part1.png)
***
- Запуск докера с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине
```bash
sudo docker run -d -p 80:80 -p 443:443 [image_id|repository]
```
![docker run with exposed ports](img/docker_run_ports_part1.png)
***
- Чтобы проверить, что по адресу localhost:80 доступна стартовая страница nginx
```bash
curl localhost:80
```

- А если пробросить порт на 8080 , то можно перейти на такую страницу

![nginx start page](img/docker_localhost_80_part1.png)
***
- Перезапуск докер контейнер через
```bash
sudo docker restart [container_id|container_name]
```

![docker restart](img/docker_restart_part1.png)

- Проверка наличия процесса

![docker ps](img/docker_ps_final_part1.png)
***
## Part 2. Operations with container

- Вывод файла nginx.conf

![nginx.conf](img/docker_exec_conf_part2.png)
***
- Создать файл nginx.conf и настроить по пути /status отдачу страницы статуса сервера nginx

![new nginx.conf](img/new_nginx_conf_part2.png)
***
- Копирование nging.conf внутрь докер образа через 
```bash
docker cp ./nginx.cong [container_id]:etc/nginx/
```
![docker cp](img/docker_cp_nginxconf_part2.png)
***
- Перезапуск nginx внутри докера
```bash
docker exec [container_id | name] nginx -s reload
```

![nginx reload](img/nginx_reload_part2.png)
***
- Проверка, что по адресу localhost:80/status отдается страничка со статусом сервера nginx
```bash
curl localhost:80/status
```

![localhost:80/status](img/localhost80_status_part2.png)
***
- Экспорт докер контейнера в файл
```bash
sudo docker export [container_id | name] > ./container.tar
```

![docker export](img/docker_export_part2.png)
***
- Остановка контейнера
```bash
sudo docker stop [container_id | name]
```

![docker stop](img/docker_stop_part2.png)
***
- Удали образ, не удаляя перед этим контейнеры
```bash
sudo docker rmi [image_id|repository] -f
```

![docker rmi](img/docker_rmi_part2.png)
***
- Удаление остановленного контейнера
```bash
sudo docker rm [container_id | name]
```

![docker rm](img/docker_rm_part2.png)
***
- Импорт контейнера
```bash
sudo docker import -c 'cmd ["nginx", "-g", "daemon off;"]' -c 'ENTRYPOINT ["/docker-entrypoint.sh"]' ./constainer.tar nginx1
```

![docker import](img/docker_import_part2.png)
***
- Запуск импортированного контейнера

![docker run](img/docker_run_end_part2.png)
***
- Проверка, что по адресу localhost:80/status отдается страничка со статусом сервера nginx

![localhost:80/status](img/localhost_status_part2.png)