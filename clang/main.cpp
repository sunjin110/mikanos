#include <iostream>

int main() {

    std::cout << "Hello world" << std::endl;

    int i = 42;
    int* p = &i;

    uintptr_t addr = reinterpret_cast<uintptr_t>(p);
    int* q = reinterpret_cast<int*>(addr);

    std::cout << addr << std::endl;
    std::cout << q << std::endl;

    return 0;
}
