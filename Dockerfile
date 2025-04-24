FROM ubuntu:20.04 AS build
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y build-essential cmake
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

WORKDIR /app

COPY ./machineid /app/machineid

RUN cd machineid && mkdir build && cd build && cmake .. && make

COPY main-2.cpp /app/
RUN g++ -g main-2.cpp -o main -I./machineid/include -L./machineid/build -lmachineid

FROM ubuntu:20.04
COPY --from=build /app/main /usr/local/bin/  # Копируем исполняемый файл
ENTRYPOINT ["main"]  # Указываем исполняемый файл
