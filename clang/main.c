#include <stdio.h>
#include <stdint.h>

struct MemoryMap {
    int32_t buffer_size;
    int32_t hoge;
};

void hoge(struct MemoryMap** mpp) {
    struct MemoryMap m;
    m.buffer_size = 999;
    m.hoge = 8989;
    struct MemoryMap* mp = &m;
    (*mpp) = mp;
}

int main() {
    printf("Hello world\n");

    int i = 42;
    int* p = &i;

    int r1 = *p;
    *p = 1;
    int r2 = i;

    printf("r1 is %d\nr2 is %d\n", r1, r2);

    struct MemoryMap m;
    struct MemoryMap* mp = &m;

    struct MemoryMap** mpp = &mp;
    

    printf("buffer_size is %d\n", m.buffer_size);

    mp->buffer_size = 8;

    printf("buffer_size is %d\n", m.buffer_size);

    (*mp).buffer_size = 100;

    printf("buffer_size is %d\n", m.buffer_size);

    hoge(mpp);
    struct MemoryMap* aaa = *mpp;
    printf("aaa is %d\n", aaa->buffer_size);    

    return 0;
}