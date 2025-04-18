# Этап сборки
FROM ubuntu:20.04 AS build
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y build-essential cmake
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

# Установим рабочую директорию
WORKDIR /app

# Копируем файлы библиотеки machineid
COPY ./machineid /app/machineid

# Собираем библиотеку machineid
RUN cd machineid && mkdir build && cd build && cmake .. && make

# Копируем main-2.cpp и собираем его
COPY main-2.cpp /app/
RUN g++ -g main-2.cpp -o main -I./machineid/include -L./machineid/build -lmachineid

# Финальный образ
FROM ubuntu:20.04
COPY --from=build /app/main /usr/local/bin/  # Копируем исполняемый файл
ENTRYPOINT ["main"]  # Указываем исполняемый файл