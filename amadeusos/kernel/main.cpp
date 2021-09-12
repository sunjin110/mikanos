// 関数のマングリング(名前修飾)を防ぐためextern "C"している
extern "C" void KernelMain() {
    while (1) __asm__("hlt");
}
