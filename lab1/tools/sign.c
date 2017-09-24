#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <sys/stat.h>

/*该文件使用了argc和argv
(1).int argc:英文名为arguments count(参数计数)
(2).char **argv:英文名为arguments value/vector(参数值)
pointer to table of cmd line args,字符串数组,用来存放指向字符串参数的指针数组,每个元素指向一个参数,空格分隔参数,其长度为argc.数组下标从0开始,argv[argc]=NULL.
argv[0] 指向程序运行时的全路径名
argv[1] 指向执行程序名后的第一个字符串
argv[2] 指向执行程序名后的第二个字符串
argv[argc] 为NULL.

make会先生成bootblock.out（<=510bytes）和bootblock（512bytes）和sign，然后运行sign并且后跟上bootblock.out和 bootblock路径，然后使用argv[1],argv[2]访问各个路径，先对.out进行大小判断，然后对bootblock的510和511最后两字节进行修改0xAA55，生成合法的MBR
*/

int
main(int argc, char *argv[]) {
    struct stat st;
    if (argc != 3) {
        fprintf(stderr, "Usage: <input filename> <output filename>\n");
        return -1;
    }
    if (stat(argv[1], &st) != 0) {
        fprintf(stderr, "Error opening file '%s': %s\n", argv[1], strerror(errno));
        return -1;
    }
    printf("'%s' size: %lld bytes\n", argv[1], (long long)st.st_size);
    if (st.st_size > 510) {
        fprintf(stderr, "%lld >> 510!!\n", (long long)st.st_size);
        return -1;
    }
    char buf[512];
    memset(buf, 0, sizeof(buf));
    FILE *ifp = fopen(argv[1], "rb");
    int size = fread(buf, 1, st.st_size, ifp);
    if (size != st.st_size) {
        fprintf(stderr, "read '%s' error, size is %d.\n", argv[1], size);
        return -1;
    }
    fclose(ifp);
    buf[510] = 0x55;
    buf[511] = 0xAA;
    FILE *ofp = fopen(argv[2], "wb+");
    size = fwrite(buf, 1, 512, ofp);
    if (size != 512) {
        fprintf(stderr, "write '%s' error, size is %d.\n", argv[2], size);
        return -1;
    }
    fclose(ofp);
    printf("build 512 bytes boot sector: '%s' success!\n", argv[2]);
    return 0;
}

