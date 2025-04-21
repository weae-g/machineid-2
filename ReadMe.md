Получение уникального индетификатора железа.

# main-2

Использование библиоткеи https://github.com/tarik02/machineid

```
git clone https://github.com/tarik02/machineid
cd machineid
mkdir build
cd build
cmake ..
make
g++ -g main-2.cpp -o main -I./machineid/include -L./machineid/build -lmachineid
g++ -g -m64 main-2.cpp -o main.exe -I"machineid/include" -L"machineid/build" -lmachineid

```


# main

Использование команды чтения - ограничения - права su