#include <iostream>
#include <fstream>
#include <string>

// var 1 - only sudo
int main() {
    std::ifstream uuidFile("/sys/class/dmi/id/product_uuid"); 
    std::string uuid;

    if (uuidFile.is_open()) {
        getline(uuidFile, uuid); 
        uuidFile.close(); 
        std::cout << "Product UUID1: " << uuid << std::endl; 
    } else {
        std::cerr << "Не удалось открыть файл: /sys/class/dmi/id/product_uuid" << std::endl;
    }

    return 0;
}