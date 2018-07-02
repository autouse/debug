#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <arpa/inet.h>
#include <memory.h>
#include <string.h>
char * header = "HTTP/1.0 200\nContent-Type: text/html; charset=utf-8\nConnection: close\n\n";
uint64_t counter = 0;
void serve() {
    int sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    int value = 1;
    setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &value, sizeof(value));
    struct sockaddr_in addr;
    addr.sin_family = AF_INET;
    addr.sin_port = htons(8001);
    addr.sin_addr.s_addr = INADDR_ANY;
    *(uint64_t*)&addr.sin_zero = 0;
    bind(sock, (struct sockaddr *)&addr, sizeof(struct sockaddr_in));
    listen(sock, 8);
    puts("listen");
    struct sockaddr_in sa;
    *(uint64_t*)&sa.sin_zero = 0;
    socklen_t len = sizeof(struct sockaddr_in);
    for (;;) {
        int c = accept(sock, (struct sockaddr *)&sa, &len);
        counter ++;
        printf("accept #%llu\n", counter);
        char b, i = 0;
        for (;;) {
            recv(c, &b, 1, 0);
            printf("%c", b);
            if (b == 10 && i == 0) {
                i ++;
            } else if (b == 13 && i == 1)
                break;
            else
                i = 0;
        }
        printf("\n");
        write(c, header, strlen(header));
        //
        char html[1024];
        sprintf(html, "<html><title>Web Server Enterprise</title><body><center>pure C<br><font size='-3'>%llu</body></html>", counter);
        write(c, html, strlen(html));
        goto client_end;
        //
        int f = open("index.html", O_RDONLY);
        off_t size = lseek(f, 0, SEEK_END);
        lseek(f, 0, SEEK_SET);
        void * h = malloc(size);
        if (h) {
            printf("alloc: %lld\n", size);
            unsigned long rlen = read(f, h, size);
            printf("read: %lu\n", rlen);
            close(f);
            rlen = write(c, h, size);
            printf("send: %lu\n", rlen);
        }
        free(h);
    client_end:
        shutdown(c, SHUT_WR);
        close(c);
    }
}

int main(int argc, const char * argv[]) {
    puts("web server enterprise");
    serve();
    puts("done");
    return 0;
}
