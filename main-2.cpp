#include <iostream>
#include "machineid/machineid.h"

// var 2
// build: g++ -g main-2.cpp -o main -I./machineid/include -L./machineid/build -lmachineid
int main() {
    std::string uuid = machineid::machineHash(); 
    std::cout << "Product UUID: " << uuid << std::endl;
    return 0;
}