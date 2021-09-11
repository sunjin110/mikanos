#include  <Uefi.h>
#include  <Library/UefiLib.h>
#include  <Library/UefiBootServicesTableLib.h>
#include  <Library/PrintLib.h>
#include  <Protocol/LoadedImage.h>
#include  <Protocol/SimpleFileSystem.h>
#include  <Protocol/DiskIo2.h>
#include  <Protocol/BlockIo.h>

// MemoryMap 独自定義のメモリマップ
struct MemoryMap {
    UINTN buffer_size;
    VOID* buffer; // void*はどのような型でもpointerであれば受け取れるというもの
    UINTN map_size;
    UINTN map_key;
    UINTN descriptor_size;
    UINT32 descriptor_version;
};

// GetMemoryMap memory_mapの状態をあれする
EFI_STATUS GetMemoryMap(struct MemoryMap* map) {
    // bufferがない場合は、ない
    if (map->buffer == NULL) {
        return EFI_BUFFER_TOO_SMALL;
    }
    map->map_size = map->buffer_size;
    return gBS->GetMemoryMap(&map->map_size, (EFI_MEMORY_DESCRIPTOR*)map->buffer, &map->map_key, &map->descriptor_size, &map->descriptor_version);
}


// Main
EFI_STATUS EFIAPI UefiMain(EFI_HANDLE image_handle, EFI_SYSTEM_TABLE* system_table) {

    // hello world
    Print(L"Hello, Mikan Sunjin World!");

    // MemoryMapの取得
    CHAR8 memmap_buf[4096 * 4];
    struct MemoryMap memmap = {
        buffer_size: sizeof(memmap_buf),
        buffer: memmap_buf,
        map_size: 0,
        map_key: 0,
        descriptor_size: 0,
        descriptor_version: 0,
    };


    
    return EFI_SUCCESS;
}