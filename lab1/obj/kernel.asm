
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 18             	sub    $0x18,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 80 fd 10 00       	mov    $0x10fd80,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	83 ec 04             	sub    $0x4,%esp
  100017:	50                   	push   %eax
  100018:	6a 00                	push   $0x0
  10001a:	68 16 ea 10 00       	push   $0x10ea16
  10001f:	e8 9a 2d 00 00       	call   102dbe <memset>
  100024:	83 c4 10             	add    $0x10,%esp

    cons_init();                // init the console
  100027:	e8 20 15 00 00       	call   10154c <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10002c:	c7 45 f4 60 35 10 00 	movl   $0x103560,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100033:	83 ec 08             	sub    $0x8,%esp
  100036:	ff 75 f4             	pushl  -0xc(%ebp)
  100039:	68 7c 35 10 00       	push   $0x10357c
  10003e:	e8 07 02 00 00       	call   10024a <cprintf>
  100043:	83 c4 10             	add    $0x10,%esp

    print_kerninfo();
  100046:	e8 89 08 00 00       	call   1008d4 <print_kerninfo>

    grade_backtrace();
  10004b:	e8 79 00 00 00       	call   1000c9 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100050:	e8 2d 2a 00 00       	call   102a82 <pmm_init>

    pic_init();                 // init interrupt controller
  100055:	e8 35 16 00 00       	call   10168f <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005a:	e8 b7 17 00 00       	call   101816 <idt_init>

    clock_init();               // init clock interrupt
  10005f:	e8 cd 0c 00 00       	call   100d31 <clock_init>
    intr_enable();              // enable irq interrupt
  100064:	e8 63 17 00 00       	call   1017cc <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();
  100069:	e8 4d 01 00 00       	call   1001bb <lab1_switch_test>

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	55                   	push   %ebp
  100071:	89 e5                	mov    %esp,%ebp
  100073:	83 ec 08             	sub    $0x8,%esp
    mon_backtrace(0, NULL, NULL);
  100076:	83 ec 04             	sub    $0x4,%esp
  100079:	6a 00                	push   $0x0
  10007b:	6a 00                	push   $0x0
  10007d:	6a 00                	push   $0x0
  10007f:	e8 9b 0c 00 00       	call   100d1f <mon_backtrace>
  100084:	83 c4 10             	add    $0x10,%esp
}
  100087:	90                   	nop
  100088:	c9                   	leave  
  100089:	c3                   	ret    

0010008a <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  10008a:	55                   	push   %ebp
  10008b:	89 e5                	mov    %esp,%ebp
  10008d:	53                   	push   %ebx
  10008e:	83 ec 04             	sub    $0x4,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  100091:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  100094:	8b 55 0c             	mov    0xc(%ebp),%edx
  100097:	8d 5d 08             	lea    0x8(%ebp),%ebx
  10009a:	8b 45 08             	mov    0x8(%ebp),%eax
  10009d:	51                   	push   %ecx
  10009e:	52                   	push   %edx
  10009f:	53                   	push   %ebx
  1000a0:	50                   	push   %eax
  1000a1:	e8 ca ff ff ff       	call   100070 <grade_backtrace2>
  1000a6:	83 c4 10             	add    $0x10,%esp
}
  1000a9:	90                   	nop
  1000aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000ad:	c9                   	leave  
  1000ae:	c3                   	ret    

001000af <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000af:	55                   	push   %ebp
  1000b0:	89 e5                	mov    %esp,%ebp
  1000b2:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace1(arg0, arg2);
  1000b5:	83 ec 08             	sub    $0x8,%esp
  1000b8:	ff 75 10             	pushl  0x10(%ebp)
  1000bb:	ff 75 08             	pushl  0x8(%ebp)
  1000be:	e8 c7 ff ff ff       	call   10008a <grade_backtrace1>
  1000c3:	83 c4 10             	add    $0x10,%esp
}
  1000c6:	90                   	nop
  1000c7:	c9                   	leave  
  1000c8:	c3                   	ret    

001000c9 <grade_backtrace>:

void
grade_backtrace(void) {
  1000c9:	55                   	push   %ebp
  1000ca:	89 e5                	mov    %esp,%ebp
  1000cc:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000cf:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000d4:	83 ec 04             	sub    $0x4,%esp
  1000d7:	68 00 00 ff ff       	push   $0xffff0000
  1000dc:	50                   	push   %eax
  1000dd:	6a 00                	push   $0x0
  1000df:	e8 cb ff ff ff       	call   1000af <grade_backtrace0>
  1000e4:	83 c4 10             	add    $0x10,%esp
}
  1000e7:	90                   	nop
  1000e8:	c9                   	leave  
  1000e9:	c3                   	ret    

001000ea <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  1000ea:	55                   	push   %ebp
  1000eb:	89 e5                	mov    %esp,%ebp
  1000ed:	83 ec 18             	sub    $0x18,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  1000f0:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  1000f3:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  1000f6:	8c 45 f2             	mov    %es,-0xe(%ebp)
  1000f9:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  1000fc:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100100:	0f b7 c0             	movzwl %ax,%eax
  100103:	83 e0 03             	and    $0x3,%eax
  100106:	89 c2                	mov    %eax,%edx
  100108:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10010d:	83 ec 04             	sub    $0x4,%esp
  100110:	52                   	push   %edx
  100111:	50                   	push   %eax
  100112:	68 81 35 10 00       	push   $0x103581
  100117:	e8 2e 01 00 00       	call   10024a <cprintf>
  10011c:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  cs = %x\n", round, reg1);
  10011f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100123:	0f b7 d0             	movzwl %ax,%edx
  100126:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10012b:	83 ec 04             	sub    $0x4,%esp
  10012e:	52                   	push   %edx
  10012f:	50                   	push   %eax
  100130:	68 8f 35 10 00       	push   $0x10358f
  100135:	e8 10 01 00 00       	call   10024a <cprintf>
  10013a:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ds = %x\n", round, reg2);
  10013d:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100141:	0f b7 d0             	movzwl %ax,%edx
  100144:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100149:	83 ec 04             	sub    $0x4,%esp
  10014c:	52                   	push   %edx
  10014d:	50                   	push   %eax
  10014e:	68 9d 35 10 00       	push   $0x10359d
  100153:	e8 f2 00 00 00       	call   10024a <cprintf>
  100158:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  es = %x\n", round, reg3);
  10015b:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10015f:	0f b7 d0             	movzwl %ax,%edx
  100162:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100167:	83 ec 04             	sub    $0x4,%esp
  10016a:	52                   	push   %edx
  10016b:	50                   	push   %eax
  10016c:	68 ab 35 10 00       	push   $0x1035ab
  100171:	e8 d4 00 00 00       	call   10024a <cprintf>
  100176:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ss = %x\n", round, reg4);
  100179:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10017d:	0f b7 d0             	movzwl %ax,%edx
  100180:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100185:	83 ec 04             	sub    $0x4,%esp
  100188:	52                   	push   %edx
  100189:	50                   	push   %eax
  10018a:	68 b9 35 10 00       	push   $0x1035b9
  10018f:	e8 b6 00 00 00       	call   10024a <cprintf>
  100194:	83 c4 10             	add    $0x10,%esp
    round ++;
  100197:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10019c:	83 c0 01             	add    $0x1,%eax
  10019f:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001a4:	90                   	nop
  1001a5:	c9                   	leave  
  1001a6:	c3                   	ret    

001001a7 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001a7:	55                   	push   %ebp
  1001a8:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
	asm volatile (
  1001aa:	cd 78                	int    $0x78
  1001ac:	89 ec                	mov    %ebp,%esp
	    "int %0 \n"
	    "movl %%ebp, %%esp"
	    : 
	    : "i"(T_SWITCH_TOU)
	);
}
  1001ae:	90                   	nop
  1001af:	5d                   	pop    %ebp
  1001b0:	c3                   	ret    

001001b1 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001b1:	55                   	push   %ebp
  1001b2:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
	asm volatile (
  1001b4:	cd 79                	int    $0x79
  1001b6:	89 ec                	mov    %ebp,%esp
	    "int %0 \n"
	    "movl %%ebp, %%esp \n"
	    : 
	    : "i"(T_SWITCH_TOK)
	);
}
  1001b8:	90                   	nop
  1001b9:	5d                   	pop    %ebp
  1001ba:	c3                   	ret    

001001bb <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001bb:	55                   	push   %ebp
  1001bc:	89 e5                	mov    %esp,%ebp
  1001be:	83 ec 08             	sub    $0x8,%esp
    lab1_print_cur_status();
  1001c1:	e8 24 ff ff ff       	call   1000ea <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001c6:	83 ec 0c             	sub    $0xc,%esp
  1001c9:	68 c8 35 10 00       	push   $0x1035c8
  1001ce:	e8 77 00 00 00       	call   10024a <cprintf>
  1001d3:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_user();
  1001d6:	e8 cc ff ff ff       	call   1001a7 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001db:	e8 0a ff ff ff       	call   1000ea <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001e0:	83 ec 0c             	sub    $0xc,%esp
  1001e3:	68 e8 35 10 00       	push   $0x1035e8
  1001e8:	e8 5d 00 00 00       	call   10024a <cprintf>
  1001ed:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_kernel();
  1001f0:	e8 bc ff ff ff       	call   1001b1 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  1001f5:	e8 f0 fe ff ff       	call   1000ea <lab1_print_cur_status>
}
  1001fa:	90                   	nop
  1001fb:	c9                   	leave  
  1001fc:	c3                   	ret    

001001fd <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1001fd:	55                   	push   %ebp
  1001fe:	89 e5                	mov    %esp,%ebp
  100200:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  100203:	83 ec 0c             	sub    $0xc,%esp
  100206:	ff 75 08             	pushl  0x8(%ebp)
  100209:	e8 6f 13 00 00       	call   10157d <cons_putc>
  10020e:	83 c4 10             	add    $0x10,%esp
    (*cnt) ++;
  100211:	8b 45 0c             	mov    0xc(%ebp),%eax
  100214:	8b 00                	mov    (%eax),%eax
  100216:	8d 50 01             	lea    0x1(%eax),%edx
  100219:	8b 45 0c             	mov    0xc(%ebp),%eax
  10021c:	89 10                	mov    %edx,(%eax)
}
  10021e:	90                   	nop
  10021f:	c9                   	leave  
  100220:	c3                   	ret    

00100221 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  100221:	55                   	push   %ebp
  100222:	89 e5                	mov    %esp,%ebp
  100224:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  100227:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  10022e:	ff 75 0c             	pushl  0xc(%ebp)
  100231:	ff 75 08             	pushl  0x8(%ebp)
  100234:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100237:	50                   	push   %eax
  100238:	68 fd 01 10 00       	push   $0x1001fd
  10023d:	e8 b2 2e 00 00       	call   1030f4 <vprintfmt>
  100242:	83 c4 10             	add    $0x10,%esp
    return cnt;
  100245:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100248:	c9                   	leave  
  100249:	c3                   	ret    

0010024a <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10024a:	55                   	push   %ebp
  10024b:	89 e5                	mov    %esp,%ebp
  10024d:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100250:	8d 45 0c             	lea    0xc(%ebp),%eax
  100253:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100256:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100259:	83 ec 08             	sub    $0x8,%esp
  10025c:	50                   	push   %eax
  10025d:	ff 75 08             	pushl  0x8(%ebp)
  100260:	e8 bc ff ff ff       	call   100221 <vcprintf>
  100265:	83 c4 10             	add    $0x10,%esp
  100268:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10026b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10026e:	c9                   	leave  
  10026f:	c3                   	ret    

00100270 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100270:	55                   	push   %ebp
  100271:	89 e5                	mov    %esp,%ebp
  100273:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  100276:	83 ec 0c             	sub    $0xc,%esp
  100279:	ff 75 08             	pushl  0x8(%ebp)
  10027c:	e8 fc 12 00 00       	call   10157d <cons_putc>
  100281:	83 c4 10             	add    $0x10,%esp
}
  100284:	90                   	nop
  100285:	c9                   	leave  
  100286:	c3                   	ret    

00100287 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  100287:	55                   	push   %ebp
  100288:	89 e5                	mov    %esp,%ebp
  10028a:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  10028d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100294:	eb 14                	jmp    1002aa <cputs+0x23>
        cputch(c, &cnt);
  100296:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10029a:	83 ec 08             	sub    $0x8,%esp
  10029d:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002a0:	52                   	push   %edx
  1002a1:	50                   	push   %eax
  1002a2:	e8 56 ff ff ff       	call   1001fd <cputch>
  1002a7:	83 c4 10             	add    $0x10,%esp
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  1002aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1002ad:	8d 50 01             	lea    0x1(%eax),%edx
  1002b0:	89 55 08             	mov    %edx,0x8(%ebp)
  1002b3:	0f b6 00             	movzbl (%eax),%eax
  1002b6:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002b9:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002bd:	75 d7                	jne    100296 <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  1002bf:	83 ec 08             	sub    $0x8,%esp
  1002c2:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1002c5:	50                   	push   %eax
  1002c6:	6a 0a                	push   $0xa
  1002c8:	e8 30 ff ff ff       	call   1001fd <cputch>
  1002cd:	83 c4 10             	add    $0x10,%esp
    return cnt;
  1002d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1002d3:	c9                   	leave  
  1002d4:	c3                   	ret    

001002d5 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1002d5:	55                   	push   %ebp
  1002d6:	89 e5                	mov    %esp,%ebp
  1002d8:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1002db:	e8 cd 12 00 00       	call   1015ad <cons_getc>
  1002e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1002e3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1002e7:	74 f2                	je     1002db <getchar+0x6>
        /* do nothing */;
    return c;
  1002e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002ec:	c9                   	leave  
  1002ed:	c3                   	ret    

001002ee <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  1002ee:	55                   	push   %ebp
  1002ef:	89 e5                	mov    %esp,%ebp
  1002f1:	83 ec 18             	sub    $0x18,%esp
    if (prompt != NULL) {
  1002f4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1002f8:	74 13                	je     10030d <readline+0x1f>
        cprintf("%s", prompt);
  1002fa:	83 ec 08             	sub    $0x8,%esp
  1002fd:	ff 75 08             	pushl  0x8(%ebp)
  100300:	68 07 36 10 00       	push   $0x103607
  100305:	e8 40 ff ff ff       	call   10024a <cprintf>
  10030a:	83 c4 10             	add    $0x10,%esp
    }
    int i = 0, c;
  10030d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100314:	e8 bc ff ff ff       	call   1002d5 <getchar>
  100319:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10031c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100320:	79 0a                	jns    10032c <readline+0x3e>
            return NULL;
  100322:	b8 00 00 00 00       	mov    $0x0,%eax
  100327:	e9 82 00 00 00       	jmp    1003ae <readline+0xc0>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  10032c:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100330:	7e 2b                	jle    10035d <readline+0x6f>
  100332:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100339:	7f 22                	jg     10035d <readline+0x6f>
            cputchar(c);
  10033b:	83 ec 0c             	sub    $0xc,%esp
  10033e:	ff 75 f0             	pushl  -0x10(%ebp)
  100341:	e8 2a ff ff ff       	call   100270 <cputchar>
  100346:	83 c4 10             	add    $0x10,%esp
            buf[i ++] = c;
  100349:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10034c:	8d 50 01             	lea    0x1(%eax),%edx
  10034f:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100352:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100355:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  10035b:	eb 4c                	jmp    1003a9 <readline+0xbb>
        }
        else if (c == '\b' && i > 0) {
  10035d:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100361:	75 1a                	jne    10037d <readline+0x8f>
  100363:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100367:	7e 14                	jle    10037d <readline+0x8f>
            cputchar(c);
  100369:	83 ec 0c             	sub    $0xc,%esp
  10036c:	ff 75 f0             	pushl  -0x10(%ebp)
  10036f:	e8 fc fe ff ff       	call   100270 <cputchar>
  100374:	83 c4 10             	add    $0x10,%esp
            i --;
  100377:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  10037b:	eb 2c                	jmp    1003a9 <readline+0xbb>
        }
        else if (c == '\n' || c == '\r') {
  10037d:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100381:	74 06                	je     100389 <readline+0x9b>
  100383:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  100387:	75 8b                	jne    100314 <readline+0x26>
            cputchar(c);
  100389:	83 ec 0c             	sub    $0xc,%esp
  10038c:	ff 75 f0             	pushl  -0x10(%ebp)
  10038f:	e8 dc fe ff ff       	call   100270 <cputchar>
  100394:	83 c4 10             	add    $0x10,%esp
            buf[i] = '\0';
  100397:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10039a:	05 40 ea 10 00       	add    $0x10ea40,%eax
  10039f:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003a2:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1003a7:	eb 05                	jmp    1003ae <readline+0xc0>
        }
    }
  1003a9:	e9 66 ff ff ff       	jmp    100314 <readline+0x26>
}
  1003ae:	c9                   	leave  
  1003af:	c3                   	ret    

001003b0 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003b0:	55                   	push   %ebp
  1003b1:	89 e5                	mov    %esp,%ebp
  1003b3:	83 ec 18             	sub    $0x18,%esp
    if (is_panic) {
  1003b6:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  1003bb:	85 c0                	test   %eax,%eax
  1003bd:	75 4a                	jne    100409 <__panic+0x59>
        goto panic_dead;
    }
    is_panic = 1;
  1003bf:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  1003c6:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1003c9:	8d 45 14             	lea    0x14(%ebp),%eax
  1003cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1003cf:	83 ec 04             	sub    $0x4,%esp
  1003d2:	ff 75 0c             	pushl  0xc(%ebp)
  1003d5:	ff 75 08             	pushl  0x8(%ebp)
  1003d8:	68 0a 36 10 00       	push   $0x10360a
  1003dd:	e8 68 fe ff ff       	call   10024a <cprintf>
  1003e2:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  1003e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003e8:	83 ec 08             	sub    $0x8,%esp
  1003eb:	50                   	push   %eax
  1003ec:	ff 75 10             	pushl  0x10(%ebp)
  1003ef:	e8 2d fe ff ff       	call   100221 <vcprintf>
  1003f4:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  1003f7:	83 ec 0c             	sub    $0xc,%esp
  1003fa:	68 26 36 10 00       	push   $0x103626
  1003ff:	e8 46 fe ff ff       	call   10024a <cprintf>
  100404:	83 c4 10             	add    $0x10,%esp
  100407:	eb 01                	jmp    10040a <__panic+0x5a>
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
    if (is_panic) {
        goto panic_dead;
  100409:	90                   	nop
    vcprintf(fmt, ap);
    cprintf("\n");
    va_end(ap);

panic_dead:
    intr_disable();
  10040a:	e8 c4 13 00 00       	call   1017d3 <intr_disable>
    while (1) {
        kmonitor(NULL);
  10040f:	83 ec 0c             	sub    $0xc,%esp
  100412:	6a 00                	push   $0x0
  100414:	e8 2c 08 00 00       	call   100c45 <kmonitor>
  100419:	83 c4 10             	add    $0x10,%esp
    }
  10041c:	eb f1                	jmp    10040f <__panic+0x5f>

0010041e <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  10041e:	55                   	push   %ebp
  10041f:	89 e5                	mov    %esp,%ebp
  100421:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    va_start(ap, fmt);
  100424:	8d 45 14             	lea    0x14(%ebp),%eax
  100427:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  10042a:	83 ec 04             	sub    $0x4,%esp
  10042d:	ff 75 0c             	pushl  0xc(%ebp)
  100430:	ff 75 08             	pushl  0x8(%ebp)
  100433:	68 28 36 10 00       	push   $0x103628
  100438:	e8 0d fe ff ff       	call   10024a <cprintf>
  10043d:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  100440:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100443:	83 ec 08             	sub    $0x8,%esp
  100446:	50                   	push   %eax
  100447:	ff 75 10             	pushl  0x10(%ebp)
  10044a:	e8 d2 fd ff ff       	call   100221 <vcprintf>
  10044f:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  100452:	83 ec 0c             	sub    $0xc,%esp
  100455:	68 26 36 10 00       	push   $0x103626
  10045a:	e8 eb fd ff ff       	call   10024a <cprintf>
  10045f:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  100462:	90                   	nop
  100463:	c9                   	leave  
  100464:	c3                   	ret    

00100465 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100465:	55                   	push   %ebp
  100466:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100468:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  10046d:	5d                   	pop    %ebp
  10046e:	c3                   	ret    

0010046f <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  10046f:	55                   	push   %ebp
  100470:	89 e5                	mov    %esp,%ebp
  100472:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  100475:	8b 45 0c             	mov    0xc(%ebp),%eax
  100478:	8b 00                	mov    (%eax),%eax
  10047a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10047d:	8b 45 10             	mov    0x10(%ebp),%eax
  100480:	8b 00                	mov    (%eax),%eax
  100482:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100485:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  10048c:	e9 d2 00 00 00       	jmp    100563 <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  100491:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100494:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100497:	01 d0                	add    %edx,%eax
  100499:	89 c2                	mov    %eax,%edx
  10049b:	c1 ea 1f             	shr    $0x1f,%edx
  10049e:	01 d0                	add    %edx,%eax
  1004a0:	d1 f8                	sar    %eax
  1004a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1004a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004a8:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004ab:	eb 04                	jmp    1004b1 <stab_binsearch+0x42>
            m --;
  1004ad:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004b4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004b7:	7c 1f                	jl     1004d8 <stab_binsearch+0x69>
  1004b9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004bc:	89 d0                	mov    %edx,%eax
  1004be:	01 c0                	add    %eax,%eax
  1004c0:	01 d0                	add    %edx,%eax
  1004c2:	c1 e0 02             	shl    $0x2,%eax
  1004c5:	89 c2                	mov    %eax,%edx
  1004c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1004ca:	01 d0                	add    %edx,%eax
  1004cc:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004d0:	0f b6 c0             	movzbl %al,%eax
  1004d3:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004d6:	75 d5                	jne    1004ad <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  1004d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004db:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004de:	7d 0b                	jge    1004eb <stab_binsearch+0x7c>
            l = true_m + 1;
  1004e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004e3:	83 c0 01             	add    $0x1,%eax
  1004e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  1004e9:	eb 78                	jmp    100563 <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  1004eb:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  1004f2:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004f5:	89 d0                	mov    %edx,%eax
  1004f7:	01 c0                	add    %eax,%eax
  1004f9:	01 d0                	add    %edx,%eax
  1004fb:	c1 e0 02             	shl    $0x2,%eax
  1004fe:	89 c2                	mov    %eax,%edx
  100500:	8b 45 08             	mov    0x8(%ebp),%eax
  100503:	01 d0                	add    %edx,%eax
  100505:	8b 40 08             	mov    0x8(%eax),%eax
  100508:	3b 45 18             	cmp    0x18(%ebp),%eax
  10050b:	73 13                	jae    100520 <stab_binsearch+0xb1>
            *region_left = m;
  10050d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100510:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100513:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100515:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100518:	83 c0 01             	add    $0x1,%eax
  10051b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10051e:	eb 43                	jmp    100563 <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100520:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100523:	89 d0                	mov    %edx,%eax
  100525:	01 c0                	add    %eax,%eax
  100527:	01 d0                	add    %edx,%eax
  100529:	c1 e0 02             	shl    $0x2,%eax
  10052c:	89 c2                	mov    %eax,%edx
  10052e:	8b 45 08             	mov    0x8(%ebp),%eax
  100531:	01 d0                	add    %edx,%eax
  100533:	8b 40 08             	mov    0x8(%eax),%eax
  100536:	3b 45 18             	cmp    0x18(%ebp),%eax
  100539:	76 16                	jbe    100551 <stab_binsearch+0xe2>
            *region_right = m - 1;
  10053b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10053e:	8d 50 ff             	lea    -0x1(%eax),%edx
  100541:	8b 45 10             	mov    0x10(%ebp),%eax
  100544:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100546:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100549:	83 e8 01             	sub    $0x1,%eax
  10054c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10054f:	eb 12                	jmp    100563 <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100551:	8b 45 0c             	mov    0xc(%ebp),%eax
  100554:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100557:	89 10                	mov    %edx,(%eax)
            l = m;
  100559:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10055c:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  10055f:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  100563:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100566:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100569:	0f 8e 22 ff ff ff    	jle    100491 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  10056f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100573:	75 0f                	jne    100584 <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  100575:	8b 45 0c             	mov    0xc(%ebp),%eax
  100578:	8b 00                	mov    (%eax),%eax
  10057a:	8d 50 ff             	lea    -0x1(%eax),%edx
  10057d:	8b 45 10             	mov    0x10(%ebp),%eax
  100580:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  100582:	eb 3f                	jmp    1005c3 <stab_binsearch+0x154>
    if (!any_matches) {
        *region_right = *region_left - 1;
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  100584:	8b 45 10             	mov    0x10(%ebp),%eax
  100587:	8b 00                	mov    (%eax),%eax
  100589:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  10058c:	eb 04                	jmp    100592 <stab_binsearch+0x123>
  10058e:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  100592:	8b 45 0c             	mov    0xc(%ebp),%eax
  100595:	8b 00                	mov    (%eax),%eax
  100597:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10059a:	7d 1f                	jge    1005bb <stab_binsearch+0x14c>
  10059c:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10059f:	89 d0                	mov    %edx,%eax
  1005a1:	01 c0                	add    %eax,%eax
  1005a3:	01 d0                	add    %edx,%eax
  1005a5:	c1 e0 02             	shl    $0x2,%eax
  1005a8:	89 c2                	mov    %eax,%edx
  1005aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1005ad:	01 d0                	add    %edx,%eax
  1005af:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1005b3:	0f b6 c0             	movzbl %al,%eax
  1005b6:	3b 45 14             	cmp    0x14(%ebp),%eax
  1005b9:	75 d3                	jne    10058e <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  1005bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005be:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005c1:	89 10                	mov    %edx,(%eax)
    }
}
  1005c3:	90                   	nop
  1005c4:	c9                   	leave  
  1005c5:	c3                   	ret    

001005c6 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {//利用的就是字符串表和符号表
  1005c6:	55                   	push   %ebp
  1005c7:	89 e5                	mov    %esp,%ebp
  1005c9:	83 ec 38             	sub    $0x38,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1005cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005cf:	c7 00 48 36 10 00    	movl   $0x103648,(%eax)
    info->eip_line = 0;
  1005d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d8:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  1005df:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e2:	c7 40 08 48 36 10 00 	movl   $0x103648,0x8(%eax)
    info->eip_fn_namelen = 9;
  1005e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ec:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  1005f3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005f6:	8b 55 08             	mov    0x8(%ebp),%edx
  1005f9:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  1005fc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ff:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
    
    stabs = __STAB_BEGIN__;
  100606:	c7 45 f4 8c 3e 10 00 	movl   $0x103e8c,-0xc(%ebp)
    stab_end = __STAB_END__;
  10060d:	c7 45 f0 fc b8 10 00 	movl   $0x10b8fc,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100614:	c7 45 ec fd b8 10 00 	movl   $0x10b8fd,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10061b:	c7 45 e8 41 d9 10 00 	movl   $0x10d941,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100622:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100625:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100628:	76 0d                	jbe    100637 <debuginfo_eip+0x71>
  10062a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10062d:	83 e8 01             	sub    $0x1,%eax
  100630:	0f b6 00             	movzbl (%eax),%eax
  100633:	84 c0                	test   %al,%al
  100635:	74 0a                	je     100641 <debuginfo_eip+0x7b>
        return -1;
  100637:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10063c:	e9 91 02 00 00       	jmp    1008d2 <debuginfo_eip+0x30c>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100641:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100648:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10064b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10064e:	29 c2                	sub    %eax,%edx
  100650:	89 d0                	mov    %edx,%eax
  100652:	c1 f8 02             	sar    $0x2,%eax
  100655:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  10065b:	83 e8 01             	sub    $0x1,%eax
  10065e:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100661:	ff 75 08             	pushl  0x8(%ebp)
  100664:	6a 64                	push   $0x64
  100666:	8d 45 e0             	lea    -0x20(%ebp),%eax
  100669:	50                   	push   %eax
  10066a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  10066d:	50                   	push   %eax
  10066e:	ff 75 f4             	pushl  -0xc(%ebp)
  100671:	e8 f9 fd ff ff       	call   10046f <stab_binsearch>
  100676:	83 c4 14             	add    $0x14,%esp
    if (lfile == 0)
  100679:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10067c:	85 c0                	test   %eax,%eax
  10067e:	75 0a                	jne    10068a <debuginfo_eip+0xc4>
        return -1;
  100680:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100685:	e9 48 02 00 00       	jmp    1008d2 <debuginfo_eip+0x30c>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  10068a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10068d:	89 45 dc             	mov    %eax,-0x24(%ebp)
  100690:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100693:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  100696:	ff 75 08             	pushl  0x8(%ebp)
  100699:	6a 24                	push   $0x24
  10069b:	8d 45 d8             	lea    -0x28(%ebp),%eax
  10069e:	50                   	push   %eax
  10069f:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1006a2:	50                   	push   %eax
  1006a3:	ff 75 f4             	pushl  -0xc(%ebp)
  1006a6:	e8 c4 fd ff ff       	call   10046f <stab_binsearch>
  1006ab:	83 c4 14             	add    $0x14,%esp

    if (lfun <= rfun) {
  1006ae:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1006b1:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1006b4:	39 c2                	cmp    %eax,%edx
  1006b6:	7f 7c                	jg     100734 <debuginfo_eip+0x16e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1006b8:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006bb:	89 c2                	mov    %eax,%edx
  1006bd:	89 d0                	mov    %edx,%eax
  1006bf:	01 c0                	add    %eax,%eax
  1006c1:	01 d0                	add    %edx,%eax
  1006c3:	c1 e0 02             	shl    $0x2,%eax
  1006c6:	89 c2                	mov    %eax,%edx
  1006c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006cb:	01 d0                	add    %edx,%eax
  1006cd:	8b 00                	mov    (%eax),%eax
  1006cf:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1006d2:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1006d5:	29 d1                	sub    %edx,%ecx
  1006d7:	89 ca                	mov    %ecx,%edx
  1006d9:	39 d0                	cmp    %edx,%eax
  1006db:	73 22                	jae    1006ff <debuginfo_eip+0x139>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  1006dd:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006e0:	89 c2                	mov    %eax,%edx
  1006e2:	89 d0                	mov    %edx,%eax
  1006e4:	01 c0                	add    %eax,%eax
  1006e6:	01 d0                	add    %edx,%eax
  1006e8:	c1 e0 02             	shl    $0x2,%eax
  1006eb:	89 c2                	mov    %eax,%edx
  1006ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006f0:	01 d0                	add    %edx,%eax
  1006f2:	8b 10                	mov    (%eax),%edx
  1006f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1006f7:	01 c2                	add    %eax,%edx
  1006f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006fc:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  1006ff:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100702:	89 c2                	mov    %eax,%edx
  100704:	89 d0                	mov    %edx,%eax
  100706:	01 c0                	add    %eax,%eax
  100708:	01 d0                	add    %edx,%eax
  10070a:	c1 e0 02             	shl    $0x2,%eax
  10070d:	89 c2                	mov    %eax,%edx
  10070f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100712:	01 d0                	add    %edx,%eax
  100714:	8b 50 08             	mov    0x8(%eax),%edx
  100717:	8b 45 0c             	mov    0xc(%ebp),%eax
  10071a:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  10071d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100720:	8b 40 10             	mov    0x10(%eax),%eax
  100723:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100726:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100729:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10072c:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10072f:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100732:	eb 15                	jmp    100749 <debuginfo_eip+0x183>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100734:	8b 45 0c             	mov    0xc(%ebp),%eax
  100737:	8b 55 08             	mov    0x8(%ebp),%edx
  10073a:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  10073d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100740:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  100743:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100746:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  100749:	8b 45 0c             	mov    0xc(%ebp),%eax
  10074c:	8b 40 08             	mov    0x8(%eax),%eax
  10074f:	83 ec 08             	sub    $0x8,%esp
  100752:	6a 3a                	push   $0x3a
  100754:	50                   	push   %eax
  100755:	e8 d8 24 00 00       	call   102c32 <strfind>
  10075a:	83 c4 10             	add    $0x10,%esp
  10075d:	89 c2                	mov    %eax,%edx
  10075f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100762:	8b 40 08             	mov    0x8(%eax),%eax
  100765:	29 c2                	sub    %eax,%edx
  100767:	8b 45 0c             	mov    0xc(%ebp),%eax
  10076a:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  10076d:	83 ec 0c             	sub    $0xc,%esp
  100770:	ff 75 08             	pushl  0x8(%ebp)
  100773:	6a 44                	push   $0x44
  100775:	8d 45 d0             	lea    -0x30(%ebp),%eax
  100778:	50                   	push   %eax
  100779:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  10077c:	50                   	push   %eax
  10077d:	ff 75 f4             	pushl  -0xc(%ebp)
  100780:	e8 ea fc ff ff       	call   10046f <stab_binsearch>
  100785:	83 c4 20             	add    $0x20,%esp
    if (lline <= rline) {
  100788:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10078b:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10078e:	39 c2                	cmp    %eax,%edx
  100790:	7f 24                	jg     1007b6 <debuginfo_eip+0x1f0>
        info->eip_line = stabs[rline].n_desc;
  100792:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100795:	89 c2                	mov    %eax,%edx
  100797:	89 d0                	mov    %edx,%eax
  100799:	01 c0                	add    %eax,%eax
  10079b:	01 d0                	add    %edx,%eax
  10079d:	c1 e0 02             	shl    $0x2,%eax
  1007a0:	89 c2                	mov    %eax,%edx
  1007a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007a5:	01 d0                	add    %edx,%eax
  1007a7:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  1007ab:	0f b7 d0             	movzwl %ax,%edx
  1007ae:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007b1:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007b4:	eb 13                	jmp    1007c9 <debuginfo_eip+0x203>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  1007b6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007bb:	e9 12 01 00 00       	jmp    1008d2 <debuginfo_eip+0x30c>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  1007c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007c3:	83 e8 01             	sub    $0x1,%eax
  1007c6:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007c9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007cf:	39 c2                	cmp    %eax,%edx
  1007d1:	7c 56                	jl     100829 <debuginfo_eip+0x263>
           && stabs[lline].n_type != N_SOL
  1007d3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007d6:	89 c2                	mov    %eax,%edx
  1007d8:	89 d0                	mov    %edx,%eax
  1007da:	01 c0                	add    %eax,%eax
  1007dc:	01 d0                	add    %edx,%eax
  1007de:	c1 e0 02             	shl    $0x2,%eax
  1007e1:	89 c2                	mov    %eax,%edx
  1007e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007e6:	01 d0                	add    %edx,%eax
  1007e8:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1007ec:	3c 84                	cmp    $0x84,%al
  1007ee:	74 39                	je     100829 <debuginfo_eip+0x263>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  1007f0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007f3:	89 c2                	mov    %eax,%edx
  1007f5:	89 d0                	mov    %edx,%eax
  1007f7:	01 c0                	add    %eax,%eax
  1007f9:	01 d0                	add    %edx,%eax
  1007fb:	c1 e0 02             	shl    $0x2,%eax
  1007fe:	89 c2                	mov    %eax,%edx
  100800:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100803:	01 d0                	add    %edx,%eax
  100805:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100809:	3c 64                	cmp    $0x64,%al
  10080b:	75 b3                	jne    1007c0 <debuginfo_eip+0x1fa>
  10080d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100810:	89 c2                	mov    %eax,%edx
  100812:	89 d0                	mov    %edx,%eax
  100814:	01 c0                	add    %eax,%eax
  100816:	01 d0                	add    %edx,%eax
  100818:	c1 e0 02             	shl    $0x2,%eax
  10081b:	89 c2                	mov    %eax,%edx
  10081d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100820:	01 d0                	add    %edx,%eax
  100822:	8b 40 08             	mov    0x8(%eax),%eax
  100825:	85 c0                	test   %eax,%eax
  100827:	74 97                	je     1007c0 <debuginfo_eip+0x1fa>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  100829:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10082c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10082f:	39 c2                	cmp    %eax,%edx
  100831:	7c 46                	jl     100879 <debuginfo_eip+0x2b3>
  100833:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100836:	89 c2                	mov    %eax,%edx
  100838:	89 d0                	mov    %edx,%eax
  10083a:	01 c0                	add    %eax,%eax
  10083c:	01 d0                	add    %edx,%eax
  10083e:	c1 e0 02             	shl    $0x2,%eax
  100841:	89 c2                	mov    %eax,%edx
  100843:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100846:	01 d0                	add    %edx,%eax
  100848:	8b 00                	mov    (%eax),%eax
  10084a:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  10084d:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100850:	29 d1                	sub    %edx,%ecx
  100852:	89 ca                	mov    %ecx,%edx
  100854:	39 d0                	cmp    %edx,%eax
  100856:	73 21                	jae    100879 <debuginfo_eip+0x2b3>
        info->eip_file = stabstr + stabs[lline].n_strx;
  100858:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10085b:	89 c2                	mov    %eax,%edx
  10085d:	89 d0                	mov    %edx,%eax
  10085f:	01 c0                	add    %eax,%eax
  100861:	01 d0                	add    %edx,%eax
  100863:	c1 e0 02             	shl    $0x2,%eax
  100866:	89 c2                	mov    %eax,%edx
  100868:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10086b:	01 d0                	add    %edx,%eax
  10086d:	8b 10                	mov    (%eax),%edx
  10086f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100872:	01 c2                	add    %eax,%edx
  100874:	8b 45 0c             	mov    0xc(%ebp),%eax
  100877:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  100879:	8b 55 dc             	mov    -0x24(%ebp),%edx
  10087c:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10087f:	39 c2                	cmp    %eax,%edx
  100881:	7d 4a                	jge    1008cd <debuginfo_eip+0x307>
        for (lline = lfun + 1;
  100883:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100886:	83 c0 01             	add    $0x1,%eax
  100889:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  10088c:	eb 18                	jmp    1008a6 <debuginfo_eip+0x2e0>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  10088e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100891:	8b 40 14             	mov    0x14(%eax),%eax
  100894:	8d 50 01             	lea    0x1(%eax),%edx
  100897:	8b 45 0c             	mov    0xc(%ebp),%eax
  10089a:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  10089d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008a0:	83 c0 01             	add    $0x1,%eax
  1008a3:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008a6:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008a9:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  1008ac:	39 c2                	cmp    %eax,%edx
  1008ae:	7d 1d                	jge    1008cd <debuginfo_eip+0x307>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008b0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008b3:	89 c2                	mov    %eax,%edx
  1008b5:	89 d0                	mov    %edx,%eax
  1008b7:	01 c0                	add    %eax,%eax
  1008b9:	01 d0                	add    %edx,%eax
  1008bb:	c1 e0 02             	shl    $0x2,%eax
  1008be:	89 c2                	mov    %eax,%edx
  1008c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008c3:	01 d0                	add    %edx,%eax
  1008c5:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1008c9:	3c a0                	cmp    $0xa0,%al
  1008cb:	74 c1                	je     10088e <debuginfo_eip+0x2c8>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  1008cd:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1008d2:	c9                   	leave  
  1008d3:	c3                   	ret    

001008d4 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  1008d4:	55                   	push   %ebp
  1008d5:	89 e5                	mov    %esp,%ebp
  1008d7:	83 ec 08             	sub    $0x8,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  1008da:	83 ec 0c             	sub    $0xc,%esp
  1008dd:	68 52 36 10 00       	push   $0x103652
  1008e2:	e8 63 f9 ff ff       	call   10024a <cprintf>
  1008e7:	83 c4 10             	add    $0x10,%esp
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  1008ea:	83 ec 08             	sub    $0x8,%esp
  1008ed:	68 00 00 10 00       	push   $0x100000
  1008f2:	68 6b 36 10 00       	push   $0x10366b
  1008f7:	e8 4e f9 ff ff       	call   10024a <cprintf>
  1008fc:	83 c4 10             	add    $0x10,%esp
    cprintf("  etext  0x%08x (phys)\n", etext);
  1008ff:	83 ec 08             	sub    $0x8,%esp
  100902:	68 55 35 10 00       	push   $0x103555
  100907:	68 83 36 10 00       	push   $0x103683
  10090c:	e8 39 f9 ff ff       	call   10024a <cprintf>
  100911:	83 c4 10             	add    $0x10,%esp
    cprintf("  edata  0x%08x (phys)\n", edata);
  100914:	83 ec 08             	sub    $0x8,%esp
  100917:	68 16 ea 10 00       	push   $0x10ea16
  10091c:	68 9b 36 10 00       	push   $0x10369b
  100921:	e8 24 f9 ff ff       	call   10024a <cprintf>
  100926:	83 c4 10             	add    $0x10,%esp
    cprintf("  end    0x%08x (phys)\n", end);
  100929:	83 ec 08             	sub    $0x8,%esp
  10092c:	68 80 fd 10 00       	push   $0x10fd80
  100931:	68 b3 36 10 00       	push   $0x1036b3
  100936:	e8 0f f9 ff ff       	call   10024a <cprintf>
  10093b:	83 c4 10             	add    $0x10,%esp
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  10093e:	b8 80 fd 10 00       	mov    $0x10fd80,%eax
  100943:	05 ff 03 00 00       	add    $0x3ff,%eax
  100948:	ba 00 00 10 00       	mov    $0x100000,%edx
  10094d:	29 d0                	sub    %edx,%eax
  10094f:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  100955:	85 c0                	test   %eax,%eax
  100957:	0f 48 c2             	cmovs  %edx,%eax
  10095a:	c1 f8 0a             	sar    $0xa,%eax
  10095d:	83 ec 08             	sub    $0x8,%esp
  100960:	50                   	push   %eax
  100961:	68 cc 36 10 00       	push   $0x1036cc
  100966:	e8 df f8 ff ff       	call   10024a <cprintf>
  10096b:	83 c4 10             	add    $0x10,%esp
}
  10096e:	90                   	nop
  10096f:	c9                   	leave  
  100970:	c3                   	ret    

00100971 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  100971:	55                   	push   %ebp
  100972:	89 e5                	mov    %esp,%ebp
  100974:	81 ec 28 01 00 00    	sub    $0x128,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  10097a:	83 ec 08             	sub    $0x8,%esp
  10097d:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100980:	50                   	push   %eax
  100981:	ff 75 08             	pushl  0x8(%ebp)
  100984:	e8 3d fc ff ff       	call   1005c6 <debuginfo_eip>
  100989:	83 c4 10             	add    $0x10,%esp
  10098c:	85 c0                	test   %eax,%eax
  10098e:	74 15                	je     1009a5 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100990:	83 ec 08             	sub    $0x8,%esp
  100993:	ff 75 08             	pushl  0x8(%ebp)
  100996:	68 f6 36 10 00       	push   $0x1036f6
  10099b:	e8 aa f8 ff ff       	call   10024a <cprintf>
  1009a0:	83 c4 10             	add    $0x10,%esp
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  1009a3:	eb 65                	jmp    100a0a <print_debuginfo+0x99>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009a5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1009ac:	eb 1c                	jmp    1009ca <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  1009ae:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1009b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009b4:	01 d0                	add    %edx,%eax
  1009b6:	0f b6 00             	movzbl (%eax),%eax
  1009b9:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009bf:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009c2:	01 ca                	add    %ecx,%edx
  1009c4:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1009ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009cd:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  1009d0:	7f dc                	jg     1009ae <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  1009d2:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  1009d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009db:	01 d0                	add    %edx,%eax
  1009dd:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  1009e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  1009e3:	8b 55 08             	mov    0x8(%ebp),%edx
  1009e6:	89 d1                	mov    %edx,%ecx
  1009e8:	29 c1                	sub    %eax,%ecx
  1009ea:	8b 55 e0             	mov    -0x20(%ebp),%edx
  1009ed:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1009f0:	83 ec 0c             	sub    $0xc,%esp
  1009f3:	51                   	push   %ecx
  1009f4:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009fa:	51                   	push   %ecx
  1009fb:	52                   	push   %edx
  1009fc:	50                   	push   %eax
  1009fd:	68 12 37 10 00       	push   $0x103712
  100a02:	e8 43 f8 ff ff       	call   10024a <cprintf>
  100a07:	83 c4 20             	add    $0x20,%esp
                fnname, eip - info.eip_fn_addr);
    }
}
  100a0a:	90                   	nop
  100a0b:	c9                   	leave  
  100a0c:	c3                   	ret    

00100a0d <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a0d:	55                   	push   %ebp
  100a0e:	89 e5                	mov    %esp,%ebp
  100a10:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a13:	8b 45 04             	mov    0x4(%ebp),%eax
  100a16:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a19:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a1c:	c9                   	leave  
  100a1d:	c3                   	ret    

00100a1e <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a1e:	55                   	push   %ebp
  100a1f:	89 e5                	mov    %esp,%ebp
  100a21:	83 ec 28             	sub    $0x28,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100a24:	89 e8                	mov    %ebp,%eax
  100a26:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100a29:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling function's return addr eip  = ss:[ebp+4]
      *                   the calling function's ebp = ss:[ebp]
      */
      uint32_t ebp = read_ebp();
  100a2c:	89 45 f4             	mov    %eax,-0xc(%ebp)
      uint32_t eip = read_eip();
  100a2f:	e8 d9 ff ff ff       	call   100a0d <read_eip>
  100a34:	89 45 f0             	mov    %eax,-0x10(%ebp)
      int i = 0;
  100a37:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      for (int i = 0; i < STACKFRAME_DEPTH; ++i) {
  100a3e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100a45:	e9 82 00 00 00       	jmp    100acc <print_stackframe+0xae>
      	cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);
  100a4a:	83 ec 04             	sub    $0x4,%esp
  100a4d:	ff 75 f0             	pushl  -0x10(%ebp)
  100a50:	ff 75 f4             	pushl  -0xc(%ebp)
  100a53:	68 24 37 10 00       	push   $0x103724
  100a58:	e8 ed f7 ff ff       	call   10024a <cprintf>
  100a5d:	83 c4 10             	add    $0x10,%esp
      	for (int j = 1; j <= 4; ++j) {
  100a60:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  100a67:	eb 24                	jmp    100a8d <print_stackframe+0x6f>
      		cprintf("0x%08x", *((uint32_t*)ebp + j * 2));
  100a69:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a6c:	c1 e0 03             	shl    $0x3,%eax
  100a6f:	89 c2                	mov    %eax,%edx
  100a71:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a74:	01 d0                	add    %edx,%eax
  100a76:	8b 00                	mov    (%eax),%eax
  100a78:	83 ec 08             	sub    $0x8,%esp
  100a7b:	50                   	push   %eax
  100a7c:	68 40 37 10 00       	push   $0x103740
  100a81:	e8 c4 f7 ff ff       	call   10024a <cprintf>
  100a86:	83 c4 10             	add    $0x10,%esp
      uint32_t ebp = read_ebp();
      uint32_t eip = read_eip();
      int i = 0;
      for (int i = 0; i < STACKFRAME_DEPTH; ++i) {
      	cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);
      	for (int j = 1; j <= 4; ++j) {
  100a89:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  100a8d:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
  100a91:	7e d6                	jle    100a69 <print_stackframe+0x4b>
      		cprintf("0x%08x", *((uint32_t*)ebp + j * 2));
      	}
      	cprintf("\n");
  100a93:	83 ec 0c             	sub    $0xc,%esp
  100a96:	68 47 37 10 00       	push   $0x103747
  100a9b:	e8 aa f7 ff ff       	call   10024a <cprintf>
  100aa0:	83 c4 10             	add    $0x10,%esp
      	print_debuginfo(eip-1);//函数调用改变的是esp和ebp而eip-1值应该是当前指令的上一条指令的地址
  100aa3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100aa6:	83 e8 01             	sub    $0x1,%eax
  100aa9:	83 ec 0c             	sub    $0xc,%esp
  100aac:	50                   	push   %eax
  100aad:	e8 bf fe ff ff       	call   100971 <print_debuginfo>
  100ab2:	83 c4 10             	add    $0x10,%esp
      	ebp = *((uint32_t *)ebp);
  100ab5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ab8:	8b 00                	mov    (%eax),%eax
  100aba:	89 45 f4             	mov    %eax,-0xc(%ebp)
      	eip = *((uint32_t *)ebp+1);
  100abd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ac0:	83 c0 04             	add    $0x4,%eax
  100ac3:	8b 00                	mov    (%eax),%eax
  100ac5:	89 45 f0             	mov    %eax,-0x10(%ebp)
      *                   the calling function's ebp = ss:[ebp]
      */
      uint32_t ebp = read_ebp();
      uint32_t eip = read_eip();
      int i = 0;
      for (int i = 0; i < STACKFRAME_DEPTH; ++i) {
  100ac8:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100acc:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100ad0:	0f 8e 74 ff ff ff    	jle    100a4a <print_stackframe+0x2c>
      	cprintf("\n");
      	print_debuginfo(eip-1);//函数调用改变的是esp和ebp而eip-1值应该是当前指令的上一条指令的地址
      	ebp = *((uint32_t *)ebp);
      	eip = *((uint32_t *)ebp+1);
      }
}
  100ad6:	90                   	nop
  100ad7:	c9                   	leave  
  100ad8:	c3                   	ret    

00100ad9 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100ad9:	55                   	push   %ebp
  100ada:	89 e5                	mov    %esp,%ebp
  100adc:	83 ec 18             	sub    $0x18,%esp
    int argc = 0;
  100adf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100ae6:	eb 0c                	jmp    100af4 <parse+0x1b>
            *buf ++ = '\0';
  100ae8:	8b 45 08             	mov    0x8(%ebp),%eax
  100aeb:	8d 50 01             	lea    0x1(%eax),%edx
  100aee:	89 55 08             	mov    %edx,0x8(%ebp)
  100af1:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100af4:	8b 45 08             	mov    0x8(%ebp),%eax
  100af7:	0f b6 00             	movzbl (%eax),%eax
  100afa:	84 c0                	test   %al,%al
  100afc:	74 1e                	je     100b1c <parse+0x43>
  100afe:	8b 45 08             	mov    0x8(%ebp),%eax
  100b01:	0f b6 00             	movzbl (%eax),%eax
  100b04:	0f be c0             	movsbl %al,%eax
  100b07:	83 ec 08             	sub    $0x8,%esp
  100b0a:	50                   	push   %eax
  100b0b:	68 cc 37 10 00       	push   $0x1037cc
  100b10:	e8 ea 20 00 00       	call   102bff <strchr>
  100b15:	83 c4 10             	add    $0x10,%esp
  100b18:	85 c0                	test   %eax,%eax
  100b1a:	75 cc                	jne    100ae8 <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100b1c:	8b 45 08             	mov    0x8(%ebp),%eax
  100b1f:	0f b6 00             	movzbl (%eax),%eax
  100b22:	84 c0                	test   %al,%al
  100b24:	74 69                	je     100b8f <parse+0xb6>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100b26:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100b2a:	75 12                	jne    100b3e <parse+0x65>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100b2c:	83 ec 08             	sub    $0x8,%esp
  100b2f:	6a 10                	push   $0x10
  100b31:	68 d1 37 10 00       	push   $0x1037d1
  100b36:	e8 0f f7 ff ff       	call   10024a <cprintf>
  100b3b:	83 c4 10             	add    $0x10,%esp
        }
        argv[argc ++] = buf;
  100b3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b41:	8d 50 01             	lea    0x1(%eax),%edx
  100b44:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100b47:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b4e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b51:	01 c2                	add    %eax,%edx
  100b53:	8b 45 08             	mov    0x8(%ebp),%eax
  100b56:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b58:	eb 04                	jmp    100b5e <parse+0x85>
            buf ++;
  100b5a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b5e:	8b 45 08             	mov    0x8(%ebp),%eax
  100b61:	0f b6 00             	movzbl (%eax),%eax
  100b64:	84 c0                	test   %al,%al
  100b66:	0f 84 7a ff ff ff    	je     100ae6 <parse+0xd>
  100b6c:	8b 45 08             	mov    0x8(%ebp),%eax
  100b6f:	0f b6 00             	movzbl (%eax),%eax
  100b72:	0f be c0             	movsbl %al,%eax
  100b75:	83 ec 08             	sub    $0x8,%esp
  100b78:	50                   	push   %eax
  100b79:	68 cc 37 10 00       	push   $0x1037cc
  100b7e:	e8 7c 20 00 00       	call   102bff <strchr>
  100b83:	83 c4 10             	add    $0x10,%esp
  100b86:	85 c0                	test   %eax,%eax
  100b88:	74 d0                	je     100b5a <parse+0x81>
            buf ++;
        }
    }
  100b8a:	e9 57 ff ff ff       	jmp    100ae6 <parse+0xd>
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
            break;
  100b8f:	90                   	nop
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100b90:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100b93:	c9                   	leave  
  100b94:	c3                   	ret    

00100b95 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100b95:	55                   	push   %ebp
  100b96:	89 e5                	mov    %esp,%ebp
  100b98:	83 ec 58             	sub    $0x58,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100b9b:	83 ec 08             	sub    $0x8,%esp
  100b9e:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100ba1:	50                   	push   %eax
  100ba2:	ff 75 08             	pushl  0x8(%ebp)
  100ba5:	e8 2f ff ff ff       	call   100ad9 <parse>
  100baa:	83 c4 10             	add    $0x10,%esp
  100bad:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100bb0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100bb4:	75 0a                	jne    100bc0 <runcmd+0x2b>
        return 0;
  100bb6:	b8 00 00 00 00       	mov    $0x0,%eax
  100bbb:	e9 83 00 00 00       	jmp    100c43 <runcmd+0xae>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100bc0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100bc7:	eb 59                	jmp    100c22 <runcmd+0x8d>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100bc9:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100bcc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bcf:	89 d0                	mov    %edx,%eax
  100bd1:	01 c0                	add    %eax,%eax
  100bd3:	01 d0                	add    %edx,%eax
  100bd5:	c1 e0 02             	shl    $0x2,%eax
  100bd8:	05 00 e0 10 00       	add    $0x10e000,%eax
  100bdd:	8b 00                	mov    (%eax),%eax
  100bdf:	83 ec 08             	sub    $0x8,%esp
  100be2:	51                   	push   %ecx
  100be3:	50                   	push   %eax
  100be4:	e8 76 1f 00 00       	call   102b5f <strcmp>
  100be9:	83 c4 10             	add    $0x10,%esp
  100bec:	85 c0                	test   %eax,%eax
  100bee:	75 2e                	jne    100c1e <runcmd+0x89>
            return commands[i].func(argc - 1, argv + 1, tf);
  100bf0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bf3:	89 d0                	mov    %edx,%eax
  100bf5:	01 c0                	add    %eax,%eax
  100bf7:	01 d0                	add    %edx,%eax
  100bf9:	c1 e0 02             	shl    $0x2,%eax
  100bfc:	05 08 e0 10 00       	add    $0x10e008,%eax
  100c01:	8b 10                	mov    (%eax),%edx
  100c03:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c06:	83 c0 04             	add    $0x4,%eax
  100c09:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100c0c:	83 e9 01             	sub    $0x1,%ecx
  100c0f:	83 ec 04             	sub    $0x4,%esp
  100c12:	ff 75 0c             	pushl  0xc(%ebp)
  100c15:	50                   	push   %eax
  100c16:	51                   	push   %ecx
  100c17:	ff d2                	call   *%edx
  100c19:	83 c4 10             	add    $0x10,%esp
  100c1c:	eb 25                	jmp    100c43 <runcmd+0xae>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c1e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c22:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c25:	83 f8 02             	cmp    $0x2,%eax
  100c28:	76 9f                	jbe    100bc9 <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100c2a:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100c2d:	83 ec 08             	sub    $0x8,%esp
  100c30:	50                   	push   %eax
  100c31:	68 ef 37 10 00       	push   $0x1037ef
  100c36:	e8 0f f6 ff ff       	call   10024a <cprintf>
  100c3b:	83 c4 10             	add    $0x10,%esp
    return 0;
  100c3e:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c43:	c9                   	leave  
  100c44:	c3                   	ret    

00100c45 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100c45:	55                   	push   %ebp
  100c46:	89 e5                	mov    %esp,%ebp
  100c48:	83 ec 18             	sub    $0x18,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100c4b:	83 ec 0c             	sub    $0xc,%esp
  100c4e:	68 08 38 10 00       	push   $0x103808
  100c53:	e8 f2 f5 ff ff       	call   10024a <cprintf>
  100c58:	83 c4 10             	add    $0x10,%esp
    cprintf("Type 'help' for a list of commands.\n");
  100c5b:	83 ec 0c             	sub    $0xc,%esp
  100c5e:	68 30 38 10 00       	push   $0x103830
  100c63:	e8 e2 f5 ff ff       	call   10024a <cprintf>
  100c68:	83 c4 10             	add    $0x10,%esp

    if (tf != NULL) {
  100c6b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100c6f:	74 0e                	je     100c7f <kmonitor+0x3a>
        print_trapframe(tf);
  100c71:	83 ec 0c             	sub    $0xc,%esp
  100c74:	ff 75 08             	pushl  0x8(%ebp)
  100c77:	e8 4f 0d 00 00       	call   1019cb <print_trapframe>
  100c7c:	83 c4 10             	add    $0x10,%esp
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100c7f:	83 ec 0c             	sub    $0xc,%esp
  100c82:	68 55 38 10 00       	push   $0x103855
  100c87:	e8 62 f6 ff ff       	call   1002ee <readline>
  100c8c:	83 c4 10             	add    $0x10,%esp
  100c8f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c92:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c96:	74 e7                	je     100c7f <kmonitor+0x3a>
            if (runcmd(buf, tf) < 0) {
  100c98:	83 ec 08             	sub    $0x8,%esp
  100c9b:	ff 75 08             	pushl  0x8(%ebp)
  100c9e:	ff 75 f4             	pushl  -0xc(%ebp)
  100ca1:	e8 ef fe ff ff       	call   100b95 <runcmd>
  100ca6:	83 c4 10             	add    $0x10,%esp
  100ca9:	85 c0                	test   %eax,%eax
  100cab:	78 02                	js     100caf <kmonitor+0x6a>
                break;
            }
        }
    }
  100cad:	eb d0                	jmp    100c7f <kmonitor+0x3a>

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
            if (runcmd(buf, tf) < 0) {
                break;
  100caf:	90                   	nop
            }
        }
    }
}
  100cb0:	90                   	nop
  100cb1:	c9                   	leave  
  100cb2:	c3                   	ret    

00100cb3 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100cb3:	55                   	push   %ebp
  100cb4:	89 e5                	mov    %esp,%ebp
  100cb6:	83 ec 18             	sub    $0x18,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100cb9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100cc0:	eb 3c                	jmp    100cfe <mon_help+0x4b>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100cc2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cc5:	89 d0                	mov    %edx,%eax
  100cc7:	01 c0                	add    %eax,%eax
  100cc9:	01 d0                	add    %edx,%eax
  100ccb:	c1 e0 02             	shl    $0x2,%eax
  100cce:	05 04 e0 10 00       	add    $0x10e004,%eax
  100cd3:	8b 08                	mov    (%eax),%ecx
  100cd5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cd8:	89 d0                	mov    %edx,%eax
  100cda:	01 c0                	add    %eax,%eax
  100cdc:	01 d0                	add    %edx,%eax
  100cde:	c1 e0 02             	shl    $0x2,%eax
  100ce1:	05 00 e0 10 00       	add    $0x10e000,%eax
  100ce6:	8b 00                	mov    (%eax),%eax
  100ce8:	83 ec 04             	sub    $0x4,%esp
  100ceb:	51                   	push   %ecx
  100cec:	50                   	push   %eax
  100ced:	68 59 38 10 00       	push   $0x103859
  100cf2:	e8 53 f5 ff ff       	call   10024a <cprintf>
  100cf7:	83 c4 10             	add    $0x10,%esp

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100cfa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100cfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d01:	83 f8 02             	cmp    $0x2,%eax
  100d04:	76 bc                	jbe    100cc2 <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100d06:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d0b:	c9                   	leave  
  100d0c:	c3                   	ret    

00100d0d <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d0d:	55                   	push   %ebp
  100d0e:	89 e5                	mov    %esp,%ebp
  100d10:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d13:	e8 bc fb ff ff       	call   1008d4 <print_kerninfo>
    return 0;
  100d18:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d1d:	c9                   	leave  
  100d1e:	c3                   	ret    

00100d1f <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100d1f:	55                   	push   %ebp
  100d20:	89 e5                	mov    %esp,%ebp
  100d22:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100d25:	e8 f4 fc ff ff       	call   100a1e <print_stackframe>
    return 0;
  100d2a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d2f:	c9                   	leave  
  100d30:	c3                   	ret    

00100d31 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d31:	55                   	push   %ebp
  100d32:	89 e5                	mov    %esp,%ebp
  100d34:	83 ec 18             	sub    $0x18,%esp
  100d37:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d3d:	c6 45 ef 34          	movb   $0x34,-0x11(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d41:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  100d45:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d49:	ee                   	out    %al,(%dx)
  100d4a:	66 c7 45 f4 40 00    	movw   $0x40,-0xc(%ebp)
  100d50:	c6 45 f0 9c          	movb   $0x9c,-0x10(%ebp)
  100d54:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
  100d58:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  100d5c:	ee                   	out    %al,(%dx)
  100d5d:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d63:	c6 45 f1 2e          	movb   $0x2e,-0xf(%ebp)
  100d67:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d6b:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d6f:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d70:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100d77:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100d7a:	83 ec 0c             	sub    $0xc,%esp
  100d7d:	68 62 38 10 00       	push   $0x103862
  100d82:	e8 c3 f4 ff ff       	call   10024a <cprintf>
  100d87:	83 c4 10             	add    $0x10,%esp
    pic_enable(IRQ_TIMER);
  100d8a:	83 ec 0c             	sub    $0xc,%esp
  100d8d:	6a 00                	push   $0x0
  100d8f:	e8 ce 08 00 00       	call   101662 <pic_enable>
  100d94:	83 c4 10             	add    $0x10,%esp
}
  100d97:	90                   	nop
  100d98:	c9                   	leave  
  100d99:	c3                   	ret    

00100d9a <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100d9a:	55                   	push   %ebp
  100d9b:	89 e5                	mov    %esp,%ebp
  100d9d:	83 ec 10             	sub    $0x10,%esp
  100da0:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t			//串口并口访问，端口统一寻址和端口独立寻址
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100da6:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100daa:	89 c2                	mov    %eax,%edx
  100dac:	ec                   	in     (%dx),%al
  100dad:	88 45 f4             	mov    %al,-0xc(%ebp)
  100db0:	66 c7 45 fc 84 00    	movw   $0x84,-0x4(%ebp)
  100db6:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  100dba:	89 c2                	mov    %eax,%edx
  100dbc:	ec                   	in     (%dx),%al
  100dbd:	88 45 f5             	mov    %al,-0xb(%ebp)
  100dc0:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100dc6:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100dca:	89 c2                	mov    %eax,%edx
  100dcc:	ec                   	in     (%dx),%al
  100dcd:	88 45 f6             	mov    %al,-0xa(%ebp)
  100dd0:	66 c7 45 f8 84 00    	movw   $0x84,-0x8(%ebp)
  100dd6:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  100dda:	89 c2                	mov    %eax,%edx
  100ddc:	ec                   	in     (%dx),%al
  100ddd:	88 45 f7             	mov    %al,-0x9(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100de0:	90                   	nop
  100de1:	c9                   	leave  
  100de2:	c3                   	ret    

00100de3 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100de3:	55                   	push   %ebp
  100de4:	89 e5                	mov    %esp,%ebp
  100de6:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100de9:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100df0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100df3:	0f b7 00             	movzwl (%eax),%eax
  100df6:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100dfa:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100dfd:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e02:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e05:	0f b7 00             	movzwl (%eax),%eax
  100e08:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e0c:	74 12                	je     100e20 <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e0e:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e15:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e1c:	b4 03 
  100e1e:	eb 13                	jmp    100e33 <cga_init+0x50>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e20:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e23:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e27:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e2a:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e31:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e33:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e3a:	0f b7 c0             	movzwl %ax,%eax
  100e3d:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  100e41:	c6 45 ea 0e          	movb   $0xe,-0x16(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e45:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  100e49:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  100e4d:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e4e:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e55:	83 c0 01             	add    $0x1,%eax
  100e58:	0f b7 c0             	movzwl %ax,%eax
  100e5b:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t			//串口并口访问，端口统一寻址和端口独立寻址
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e5f:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e63:	89 c2                	mov    %eax,%edx
  100e65:	ec                   	in     (%dx),%al
  100e66:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  100e69:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  100e6d:	0f b6 c0             	movzbl %al,%eax
  100e70:	c1 e0 08             	shl    $0x8,%eax
  100e73:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e76:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e7d:	0f b7 c0             	movzwl %ax,%eax
  100e80:	66 89 45 f0          	mov    %ax,-0x10(%ebp)
  100e84:	c6 45 ec 0f          	movb   $0xf,-0x14(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e88:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  100e8c:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  100e90:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100e91:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e98:	83 c0 01             	add    $0x1,%eax
  100e9b:	0f b7 c0             	movzwl %ax,%eax
  100e9e:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t			//串口并口访问，端口统一寻址和端口独立寻址
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ea2:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100ea6:	89 c2                	mov    %eax,%edx
  100ea8:	ec                   	in     (%dx),%al
  100ea9:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100eac:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100eb0:	0f b6 c0             	movzbl %al,%eax
  100eb3:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100eb6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100eb9:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100ebe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ec1:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100ec7:	90                   	nop
  100ec8:	c9                   	leave  
  100ec9:	c3                   	ret    

00100eca <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100eca:	55                   	push   %ebp
  100ecb:	89 e5                	mov    %esp,%ebp
  100ecd:	83 ec 28             	sub    $0x28,%esp
  100ed0:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100ed6:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100eda:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
  100ede:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100ee2:	ee                   	out    %al,(%dx)
  100ee3:	66 c7 45 f4 fb 03    	movw   $0x3fb,-0xc(%ebp)
  100ee9:	c6 45 db 80          	movb   $0x80,-0x25(%ebp)
  100eed:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  100ef1:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  100ef5:	ee                   	out    %al,(%dx)
  100ef6:	66 c7 45 f2 f8 03    	movw   $0x3f8,-0xe(%ebp)
  100efc:	c6 45 dc 0c          	movb   $0xc,-0x24(%ebp)
  100f00:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  100f04:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f08:	ee                   	out    %al,(%dx)
  100f09:	66 c7 45 f0 f9 03    	movw   $0x3f9,-0x10(%ebp)
  100f0f:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
  100f13:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f17:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  100f1b:	ee                   	out    %al,(%dx)
  100f1c:	66 c7 45 ee fb 03    	movw   $0x3fb,-0x12(%ebp)
  100f22:	c6 45 de 03          	movb   $0x3,-0x22(%ebp)
  100f26:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
  100f2a:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f2e:	ee                   	out    %al,(%dx)
  100f2f:	66 c7 45 ec fc 03    	movw   $0x3fc,-0x14(%ebp)
  100f35:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
  100f39:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  100f3d:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  100f41:	ee                   	out    %al,(%dx)
  100f42:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f48:	c6 45 e0 01          	movb   $0x1,-0x20(%ebp)
  100f4c:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  100f50:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f54:	ee                   	out    %al,(%dx)
  100f55:	66 c7 45 e8 fd 03    	movw   $0x3fd,-0x18(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t			//串口并口访问，端口统一寻址和端口独立寻址
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f5b:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
  100f5f:	89 c2                	mov    %eax,%edx
  100f61:	ec                   	in     (%dx),%al
  100f62:	88 45 e1             	mov    %al,-0x1f(%ebp)
    return data;
  100f65:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f69:	3c ff                	cmp    $0xff,%al
  100f6b:	0f 95 c0             	setne  %al
  100f6e:	0f b6 c0             	movzbl %al,%eax
  100f71:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100f76:	66 c7 45 e6 fa 03    	movw   $0x3fa,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t			//串口并口访问，端口统一寻址和端口独立寻址
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f7c:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100f80:	89 c2                	mov    %eax,%edx
  100f82:	ec                   	in     (%dx),%al
  100f83:	88 45 e2             	mov    %al,-0x1e(%ebp)
  100f86:	66 c7 45 e4 f8 03    	movw   $0x3f8,-0x1c(%ebp)
  100f8c:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100f90:	89 c2                	mov    %eax,%edx
  100f92:	ec                   	in     (%dx),%al
  100f93:	88 45 e3             	mov    %al,-0x1d(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100f96:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100f9b:	85 c0                	test   %eax,%eax
  100f9d:	74 0d                	je     100fac <serial_init+0xe2>
        pic_enable(IRQ_COM1);
  100f9f:	83 ec 0c             	sub    $0xc,%esp
  100fa2:	6a 04                	push   $0x4
  100fa4:	e8 b9 06 00 00       	call   101662 <pic_enable>
  100fa9:	83 c4 10             	add    $0x10,%esp
    }
}
  100fac:	90                   	nop
  100fad:	c9                   	leave  
  100fae:	c3                   	ret    

00100faf <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100faf:	55                   	push   %ebp
  100fb0:	89 e5                	mov    %esp,%ebp
  100fb2:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fb5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fbc:	eb 09                	jmp    100fc7 <lpt_putc_sub+0x18>
        delay();
  100fbe:	e8 d7 fd ff ff       	call   100d9a <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fc3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100fc7:	66 c7 45 f4 79 03    	movw   $0x379,-0xc(%ebp)
  100fcd:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100fd1:	89 c2                	mov    %eax,%edx
  100fd3:	ec                   	in     (%dx),%al
  100fd4:	88 45 f3             	mov    %al,-0xd(%ebp)
    return data;
  100fd7:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100fdb:	84 c0                	test   %al,%al
  100fdd:	78 09                	js     100fe8 <lpt_putc_sub+0x39>
  100fdf:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100fe6:	7e d6                	jle    100fbe <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  100fe8:	8b 45 08             	mov    0x8(%ebp),%eax
  100feb:	0f b6 c0             	movzbl %al,%eax
  100fee:	66 c7 45 f8 78 03    	movw   $0x378,-0x8(%ebp)
  100ff4:	88 45 f0             	mov    %al,-0x10(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ff7:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
  100ffb:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  100fff:	ee                   	out    %al,(%dx)
  101000:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  101006:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  10100a:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10100e:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101012:	ee                   	out    %al,(%dx)
  101013:	66 c7 45 fa 7a 03    	movw   $0x37a,-0x6(%ebp)
  101019:	c6 45 f2 08          	movb   $0x8,-0xe(%ebp)
  10101d:	0f b6 45 f2          	movzbl -0xe(%ebp),%eax
  101021:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101025:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101026:	90                   	nop
  101027:	c9                   	leave  
  101028:	c3                   	ret    

00101029 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101029:	55                   	push   %ebp
  10102a:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  10102c:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101030:	74 0d                	je     10103f <lpt_putc+0x16>
        lpt_putc_sub(c);
  101032:	ff 75 08             	pushl  0x8(%ebp)
  101035:	e8 75 ff ff ff       	call   100faf <lpt_putc_sub>
  10103a:	83 c4 04             	add    $0x4,%esp
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  10103d:	eb 1e                	jmp    10105d <lpt_putc+0x34>
lpt_putc(int c) {
    if (c != '\b') {
        lpt_putc_sub(c);
    }
    else {
        lpt_putc_sub('\b');
  10103f:	6a 08                	push   $0x8
  101041:	e8 69 ff ff ff       	call   100faf <lpt_putc_sub>
  101046:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub(' ');
  101049:	6a 20                	push   $0x20
  10104b:	e8 5f ff ff ff       	call   100faf <lpt_putc_sub>
  101050:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub('\b');
  101053:	6a 08                	push   $0x8
  101055:	e8 55 ff ff ff       	call   100faf <lpt_putc_sub>
  10105a:	83 c4 04             	add    $0x4,%esp
    }
}
  10105d:	90                   	nop
  10105e:	c9                   	leave  
  10105f:	c3                   	ret    

00101060 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101060:	55                   	push   %ebp
  101061:	89 e5                	mov    %esp,%ebp
  101063:	53                   	push   %ebx
  101064:	83 ec 14             	sub    $0x14,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101067:	8b 45 08             	mov    0x8(%ebp),%eax
  10106a:	b0 00                	mov    $0x0,%al
  10106c:	85 c0                	test   %eax,%eax
  10106e:	75 07                	jne    101077 <cga_putc+0x17>
        c |= 0x0700;
  101070:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  101077:	8b 45 08             	mov    0x8(%ebp),%eax
  10107a:	0f b6 c0             	movzbl %al,%eax
  10107d:	83 f8 0a             	cmp    $0xa,%eax
  101080:	74 4e                	je     1010d0 <cga_putc+0x70>
  101082:	83 f8 0d             	cmp    $0xd,%eax
  101085:	74 59                	je     1010e0 <cga_putc+0x80>
  101087:	83 f8 08             	cmp    $0x8,%eax
  10108a:	0f 85 8a 00 00 00    	jne    10111a <cga_putc+0xba>
    case '\b':
        if (crt_pos > 0) {
  101090:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101097:	66 85 c0             	test   %ax,%ax
  10109a:	0f 84 a0 00 00 00    	je     101140 <cga_putc+0xe0>
            crt_pos --;
  1010a0:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010a7:	83 e8 01             	sub    $0x1,%eax
  1010aa:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010b0:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010b5:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  1010bc:	0f b7 d2             	movzwl %dx,%edx
  1010bf:	01 d2                	add    %edx,%edx
  1010c1:	01 d0                	add    %edx,%eax
  1010c3:	8b 55 08             	mov    0x8(%ebp),%edx
  1010c6:	b2 00                	mov    $0x0,%dl
  1010c8:	83 ca 20             	or     $0x20,%edx
  1010cb:	66 89 10             	mov    %dx,(%eax)
        }
        break;
  1010ce:	eb 70                	jmp    101140 <cga_putc+0xe0>
    case '\n':
        crt_pos += CRT_COLS;
  1010d0:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010d7:	83 c0 50             	add    $0x50,%eax
  1010da:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1010e0:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  1010e7:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  1010ee:	0f b7 c1             	movzwl %cx,%eax
  1010f1:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  1010f7:	c1 e8 10             	shr    $0x10,%eax
  1010fa:	89 c2                	mov    %eax,%edx
  1010fc:	66 c1 ea 06          	shr    $0x6,%dx
  101100:	89 d0                	mov    %edx,%eax
  101102:	c1 e0 02             	shl    $0x2,%eax
  101105:	01 d0                	add    %edx,%eax
  101107:	c1 e0 04             	shl    $0x4,%eax
  10110a:	29 c1                	sub    %eax,%ecx
  10110c:	89 ca                	mov    %ecx,%edx
  10110e:	89 d8                	mov    %ebx,%eax
  101110:	29 d0                	sub    %edx,%eax
  101112:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  101118:	eb 27                	jmp    101141 <cga_putc+0xe1>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  10111a:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  101120:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101127:	8d 50 01             	lea    0x1(%eax),%edx
  10112a:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  101131:	0f b7 c0             	movzwl %ax,%eax
  101134:	01 c0                	add    %eax,%eax
  101136:	01 c8                	add    %ecx,%eax
  101138:	8b 55 08             	mov    0x8(%ebp),%edx
  10113b:	66 89 10             	mov    %dx,(%eax)
        break;
  10113e:	eb 01                	jmp    101141 <cga_putc+0xe1>
    case '\b':
        if (crt_pos > 0) {
            crt_pos --;
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
        }
        break;
  101140:	90                   	nop
        crt_buf[crt_pos ++] = c;     // write the character
        break;
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101141:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101148:	66 3d cf 07          	cmp    $0x7cf,%ax
  10114c:	76 59                	jbe    1011a7 <cga_putc+0x147>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10114e:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101153:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101159:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10115e:	83 ec 04             	sub    $0x4,%esp
  101161:	68 00 0f 00 00       	push   $0xf00
  101166:	52                   	push   %edx
  101167:	50                   	push   %eax
  101168:	e8 91 1c 00 00       	call   102dfe <memmove>
  10116d:	83 c4 10             	add    $0x10,%esp
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101170:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  101177:	eb 15                	jmp    10118e <cga_putc+0x12e>
            crt_buf[i] = 0x0700 | ' ';
  101179:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10117e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101181:	01 d2                	add    %edx,%edx
  101183:	01 d0                	add    %edx,%eax
  101185:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10118a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10118e:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101195:	7e e2                	jle    101179 <cga_putc+0x119>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  101197:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10119e:	83 e8 50             	sub    $0x50,%eax
  1011a1:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011a7:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011ae:	0f b7 c0             	movzwl %ax,%eax
  1011b1:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1011b5:	c6 45 e8 0e          	movb   $0xe,-0x18(%ebp)
  1011b9:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
  1011bd:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011c1:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011c2:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011c9:	66 c1 e8 08          	shr    $0x8,%ax
  1011cd:	0f b6 c0             	movzbl %al,%eax
  1011d0:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  1011d7:	83 c2 01             	add    $0x1,%edx
  1011da:	0f b7 d2             	movzwl %dx,%edx
  1011dd:	66 89 55 f0          	mov    %dx,-0x10(%ebp)
  1011e1:	88 45 e9             	mov    %al,-0x17(%ebp)
  1011e4:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1011e8:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  1011ec:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  1011ed:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011f4:	0f b7 c0             	movzwl %ax,%eax
  1011f7:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  1011fb:	c6 45 ea 0f          	movb   $0xf,-0x16(%ebp)
  1011ff:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  101203:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101207:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  101208:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10120f:	0f b6 c0             	movzbl %al,%eax
  101212:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101219:	83 c2 01             	add    $0x1,%edx
  10121c:	0f b7 d2             	movzwl %dx,%edx
  10121f:	66 89 55 ec          	mov    %dx,-0x14(%ebp)
  101223:	88 45 eb             	mov    %al,-0x15(%ebp)
  101226:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  10122a:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  10122e:	ee                   	out    %al,(%dx)
}
  10122f:	90                   	nop
  101230:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101233:	c9                   	leave  
  101234:	c3                   	ret    

00101235 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101235:	55                   	push   %ebp
  101236:	89 e5                	mov    %esp,%ebp
  101238:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10123b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101242:	eb 09                	jmp    10124d <serial_putc_sub+0x18>
        delay();
  101244:	e8 51 fb ff ff       	call   100d9a <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101249:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10124d:	66 c7 45 f8 fd 03    	movw   $0x3fd,-0x8(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t			//串口并口访问，端口统一寻址和端口独立寻址
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101253:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  101257:	89 c2                	mov    %eax,%edx
  101259:	ec                   	in     (%dx),%al
  10125a:	88 45 f7             	mov    %al,-0x9(%ebp)
    return data;
  10125d:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  101261:	0f b6 c0             	movzbl %al,%eax
  101264:	83 e0 20             	and    $0x20,%eax
  101267:	85 c0                	test   %eax,%eax
  101269:	75 09                	jne    101274 <serial_putc_sub+0x3f>
  10126b:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101272:	7e d0                	jle    101244 <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  101274:	8b 45 08             	mov    0x8(%ebp),%eax
  101277:	0f b6 c0             	movzbl %al,%eax
  10127a:	66 c7 45 fa f8 03    	movw   $0x3f8,-0x6(%ebp)
  101280:	88 45 f6             	mov    %al,-0xa(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101283:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  101287:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10128b:	ee                   	out    %al,(%dx)
}
  10128c:	90                   	nop
  10128d:	c9                   	leave  
  10128e:	c3                   	ret    

0010128f <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  10128f:	55                   	push   %ebp
  101290:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  101292:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101296:	74 0d                	je     1012a5 <serial_putc+0x16>
        serial_putc_sub(c);
  101298:	ff 75 08             	pushl  0x8(%ebp)
  10129b:	e8 95 ff ff ff       	call   101235 <serial_putc_sub>
  1012a0:	83 c4 04             	add    $0x4,%esp
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  1012a3:	eb 1e                	jmp    1012c3 <serial_putc+0x34>
serial_putc(int c) {
    if (c != '\b') {
        serial_putc_sub(c);
    }
    else {
        serial_putc_sub('\b');
  1012a5:	6a 08                	push   $0x8
  1012a7:	e8 89 ff ff ff       	call   101235 <serial_putc_sub>
  1012ac:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub(' ');
  1012af:	6a 20                	push   $0x20
  1012b1:	e8 7f ff ff ff       	call   101235 <serial_putc_sub>
  1012b6:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub('\b');
  1012b9:	6a 08                	push   $0x8
  1012bb:	e8 75 ff ff ff       	call   101235 <serial_putc_sub>
  1012c0:	83 c4 04             	add    $0x4,%esp
    }
}
  1012c3:	90                   	nop
  1012c4:	c9                   	leave  
  1012c5:	c3                   	ret    

001012c6 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1012c6:	55                   	push   %ebp
  1012c7:	89 e5                	mov    %esp,%ebp
  1012c9:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1012cc:	eb 33                	jmp    101301 <cons_intr+0x3b>
        if (c != 0) {
  1012ce:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1012d2:	74 2d                	je     101301 <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  1012d4:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1012d9:	8d 50 01             	lea    0x1(%eax),%edx
  1012dc:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  1012e2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1012e5:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  1012eb:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1012f0:	3d 00 02 00 00       	cmp    $0x200,%eax
  1012f5:	75 0a                	jne    101301 <cons_intr+0x3b>
                cons.wpos = 0;
  1012f7:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  1012fe:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  101301:	8b 45 08             	mov    0x8(%ebp),%eax
  101304:	ff d0                	call   *%eax
  101306:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101309:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  10130d:	75 bf                	jne    1012ce <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  10130f:	90                   	nop
  101310:	c9                   	leave  
  101311:	c3                   	ret    

00101312 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101312:	55                   	push   %ebp
  101313:	89 e5                	mov    %esp,%ebp
  101315:	83 ec 10             	sub    $0x10,%esp
  101318:	66 c7 45 f8 fd 03    	movw   $0x3fd,-0x8(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t			//串口并口访问，端口统一寻址和端口独立寻址
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10131e:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  101322:	89 c2                	mov    %eax,%edx
  101324:	ec                   	in     (%dx),%al
  101325:	88 45 f7             	mov    %al,-0x9(%ebp)
    return data;
  101328:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  10132c:	0f b6 c0             	movzbl %al,%eax
  10132f:	83 e0 01             	and    $0x1,%eax
  101332:	85 c0                	test   %eax,%eax
  101334:	75 07                	jne    10133d <serial_proc_data+0x2b>
        return -1;
  101336:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10133b:	eb 2a                	jmp    101367 <serial_proc_data+0x55>
  10133d:	66 c7 45 fa f8 03    	movw   $0x3f8,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t			//串口并口访问，端口统一寻址和端口独立寻址
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101343:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101347:	89 c2                	mov    %eax,%edx
  101349:	ec                   	in     (%dx),%al
  10134a:	88 45 f6             	mov    %al,-0xa(%ebp)
    return data;
  10134d:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101351:	0f b6 c0             	movzbl %al,%eax
  101354:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101357:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  10135b:	75 07                	jne    101364 <serial_proc_data+0x52>
        c = '\b';
  10135d:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101364:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101367:	c9                   	leave  
  101368:	c3                   	ret    

00101369 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101369:	55                   	push   %ebp
  10136a:	89 e5                	mov    %esp,%ebp
  10136c:	83 ec 08             	sub    $0x8,%esp
    if (serial_exists) {
  10136f:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101374:	85 c0                	test   %eax,%eax
  101376:	74 10                	je     101388 <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  101378:	83 ec 0c             	sub    $0xc,%esp
  10137b:	68 12 13 10 00       	push   $0x101312
  101380:	e8 41 ff ff ff       	call   1012c6 <cons_intr>
  101385:	83 c4 10             	add    $0x10,%esp
    }
}
  101388:	90                   	nop
  101389:	c9                   	leave  
  10138a:	c3                   	ret    

0010138b <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  10138b:	55                   	push   %ebp
  10138c:	89 e5                	mov    %esp,%ebp
  10138e:	83 ec 18             	sub    $0x18,%esp
  101391:	66 c7 45 ec 64 00    	movw   $0x64,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t			//串口并口访问，端口统一寻址和端口独立寻址
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101397:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10139b:	89 c2                	mov    %eax,%edx
  10139d:	ec                   	in     (%dx),%al
  10139e:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1013a1:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013a5:	0f b6 c0             	movzbl %al,%eax
  1013a8:	83 e0 01             	and    $0x1,%eax
  1013ab:	85 c0                	test   %eax,%eax
  1013ad:	75 0a                	jne    1013b9 <kbd_proc_data+0x2e>
        return -1;
  1013af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013b4:	e9 5d 01 00 00       	jmp    101516 <kbd_proc_data+0x18b>
  1013b9:	66 c7 45 f0 60 00    	movw   $0x60,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t			//串口并口访问，端口统一寻址和端口独立寻址
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013bf:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1013c3:	89 c2                	mov    %eax,%edx
  1013c5:	ec                   	in     (%dx),%al
  1013c6:	88 45 ea             	mov    %al,-0x16(%ebp)
    return data;
  1013c9:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
    }

    data = inb(KBDATAP);
  1013cd:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1013d0:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1013d4:	75 17                	jne    1013ed <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  1013d6:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013db:	83 c8 40             	or     $0x40,%eax
  1013de:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  1013e3:	b8 00 00 00 00       	mov    $0x0,%eax
  1013e8:	e9 29 01 00 00       	jmp    101516 <kbd_proc_data+0x18b>
    } else if (data & 0x80) {
  1013ed:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013f1:	84 c0                	test   %al,%al
  1013f3:	79 47                	jns    10143c <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1013f5:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013fa:	83 e0 40             	and    $0x40,%eax
  1013fd:	85 c0                	test   %eax,%eax
  1013ff:	75 09                	jne    10140a <kbd_proc_data+0x7f>
  101401:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101405:	83 e0 7f             	and    $0x7f,%eax
  101408:	eb 04                	jmp    10140e <kbd_proc_data+0x83>
  10140a:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10140e:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101411:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101415:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10141c:	83 c8 40             	or     $0x40,%eax
  10141f:	0f b6 c0             	movzbl %al,%eax
  101422:	f7 d0                	not    %eax
  101424:	89 c2                	mov    %eax,%edx
  101426:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10142b:	21 d0                	and    %edx,%eax
  10142d:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101432:	b8 00 00 00 00       	mov    $0x0,%eax
  101437:	e9 da 00 00 00       	jmp    101516 <kbd_proc_data+0x18b>
    } else if (shift & E0ESC) {
  10143c:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101441:	83 e0 40             	and    $0x40,%eax
  101444:	85 c0                	test   %eax,%eax
  101446:	74 11                	je     101459 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101448:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  10144c:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101451:	83 e0 bf             	and    $0xffffffbf,%eax
  101454:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  101459:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10145d:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101464:	0f b6 d0             	movzbl %al,%edx
  101467:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10146c:	09 d0                	or     %edx,%eax
  10146e:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  101473:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101477:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  10147e:	0f b6 d0             	movzbl %al,%edx
  101481:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101486:	31 d0                	xor    %edx,%eax
  101488:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  10148d:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101492:	83 e0 03             	and    $0x3,%eax
  101495:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  10149c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014a0:	01 d0                	add    %edx,%eax
  1014a2:	0f b6 00             	movzbl (%eax),%eax
  1014a5:	0f b6 c0             	movzbl %al,%eax
  1014a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014ab:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014b0:	83 e0 08             	and    $0x8,%eax
  1014b3:	85 c0                	test   %eax,%eax
  1014b5:	74 22                	je     1014d9 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1014b7:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014bb:	7e 0c                	jle    1014c9 <kbd_proc_data+0x13e>
  1014bd:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014c1:	7f 06                	jg     1014c9 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1014c3:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014c7:	eb 10                	jmp    1014d9 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1014c9:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1014cd:	7e 0a                	jle    1014d9 <kbd_proc_data+0x14e>
  1014cf:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1014d3:	7f 04                	jg     1014d9 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1014d5:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1014d9:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014de:	f7 d0                	not    %eax
  1014e0:	83 e0 06             	and    $0x6,%eax
  1014e3:	85 c0                	test   %eax,%eax
  1014e5:	75 2c                	jne    101513 <kbd_proc_data+0x188>
  1014e7:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1014ee:	75 23                	jne    101513 <kbd_proc_data+0x188>
        cprintf("Rebooting!\n");
  1014f0:	83 ec 0c             	sub    $0xc,%esp
  1014f3:	68 7d 38 10 00       	push   $0x10387d
  1014f8:	e8 4d ed ff ff       	call   10024a <cprintf>
  1014fd:	83 c4 10             	add    $0x10,%esp
  101500:	66 c7 45 ee 92 00    	movw   $0x92,-0x12(%ebp)
  101506:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10150a:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10150e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101512:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101513:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101516:	c9                   	leave  
  101517:	c3                   	ret    

00101518 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101518:	55                   	push   %ebp
  101519:	89 e5                	mov    %esp,%ebp
  10151b:	83 ec 08             	sub    $0x8,%esp
    cons_intr(kbd_proc_data);
  10151e:	83 ec 0c             	sub    $0xc,%esp
  101521:	68 8b 13 10 00       	push   $0x10138b
  101526:	e8 9b fd ff ff       	call   1012c6 <cons_intr>
  10152b:	83 c4 10             	add    $0x10,%esp
}
  10152e:	90                   	nop
  10152f:	c9                   	leave  
  101530:	c3                   	ret    

00101531 <kbd_init>:

static void
kbd_init(void) {
  101531:	55                   	push   %ebp
  101532:	89 e5                	mov    %esp,%ebp
  101534:	83 ec 08             	sub    $0x8,%esp
    // drain the kbd buffer
    kbd_intr();
  101537:	e8 dc ff ff ff       	call   101518 <kbd_intr>
    pic_enable(IRQ_KBD);
  10153c:	83 ec 0c             	sub    $0xc,%esp
  10153f:	6a 01                	push   $0x1
  101541:	e8 1c 01 00 00       	call   101662 <pic_enable>
  101546:	83 c4 10             	add    $0x10,%esp
}
  101549:	90                   	nop
  10154a:	c9                   	leave  
  10154b:	c3                   	ret    

0010154c <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  10154c:	55                   	push   %ebp
  10154d:	89 e5                	mov    %esp,%ebp
  10154f:	83 ec 08             	sub    $0x8,%esp
    cga_init();
  101552:	e8 8c f8 ff ff       	call   100de3 <cga_init>
    serial_init();
  101557:	e8 6e f9 ff ff       	call   100eca <serial_init>
    kbd_init();
  10155c:	e8 d0 ff ff ff       	call   101531 <kbd_init>
    if (!serial_exists) {
  101561:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101566:	85 c0                	test   %eax,%eax
  101568:	75 10                	jne    10157a <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  10156a:	83 ec 0c             	sub    $0xc,%esp
  10156d:	68 89 38 10 00       	push   $0x103889
  101572:	e8 d3 ec ff ff       	call   10024a <cprintf>
  101577:	83 c4 10             	add    $0x10,%esp
    }
}
  10157a:	90                   	nop
  10157b:	c9                   	leave  
  10157c:	c3                   	ret    

0010157d <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  10157d:	55                   	push   %ebp
  10157e:	89 e5                	mov    %esp,%ebp
  101580:	83 ec 08             	sub    $0x8,%esp
    lpt_putc(c);
  101583:	ff 75 08             	pushl  0x8(%ebp)
  101586:	e8 9e fa ff ff       	call   101029 <lpt_putc>
  10158b:	83 c4 04             	add    $0x4,%esp
    cga_putc(c);
  10158e:	83 ec 0c             	sub    $0xc,%esp
  101591:	ff 75 08             	pushl  0x8(%ebp)
  101594:	e8 c7 fa ff ff       	call   101060 <cga_putc>
  101599:	83 c4 10             	add    $0x10,%esp
    serial_putc(c);
  10159c:	83 ec 0c             	sub    $0xc,%esp
  10159f:	ff 75 08             	pushl  0x8(%ebp)
  1015a2:	e8 e8 fc ff ff       	call   10128f <serial_putc>
  1015a7:	83 c4 10             	add    $0x10,%esp
}
  1015aa:	90                   	nop
  1015ab:	c9                   	leave  
  1015ac:	c3                   	ret    

001015ad <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015ad:	55                   	push   %ebp
  1015ae:	89 e5                	mov    %esp,%ebp
  1015b0:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015b3:	e8 b1 fd ff ff       	call   101369 <serial_intr>
    kbd_intr();
  1015b8:	e8 5b ff ff ff       	call   101518 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015bd:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015c3:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015c8:	39 c2                	cmp    %eax,%edx
  1015ca:	74 36                	je     101602 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015cc:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015d1:	8d 50 01             	lea    0x1(%eax),%edx
  1015d4:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  1015da:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  1015e1:	0f b6 c0             	movzbl %al,%eax
  1015e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1015e7:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015ec:	3d 00 02 00 00       	cmp    $0x200,%eax
  1015f1:	75 0a                	jne    1015fd <cons_getc+0x50>
            cons.rpos = 0;
  1015f3:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  1015fa:	00 00 00 
        }
        return c;
  1015fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101600:	eb 05                	jmp    101607 <cons_getc+0x5a>
    }
    return 0;
  101602:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101607:	c9                   	leave  
  101608:	c3                   	ret    

00101609 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101609:	55                   	push   %ebp
  10160a:	89 e5                	mov    %esp,%ebp
  10160c:	83 ec 14             	sub    $0x14,%esp
  10160f:	8b 45 08             	mov    0x8(%ebp),%eax
  101612:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101616:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10161a:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  101620:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101625:	85 c0                	test   %eax,%eax
  101627:	74 36                	je     10165f <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  101629:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10162d:	0f b6 c0             	movzbl %al,%eax
  101630:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101636:	88 45 fa             	mov    %al,-0x6(%ebp)
  101639:	0f b6 45 fa          	movzbl -0x6(%ebp),%eax
  10163d:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101641:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  101642:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101646:	66 c1 e8 08          	shr    $0x8,%ax
  10164a:	0f b6 c0             	movzbl %al,%eax
  10164d:	66 c7 45 fc a1 00    	movw   $0xa1,-0x4(%ebp)
  101653:	88 45 fb             	mov    %al,-0x5(%ebp)
  101656:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  10165a:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  10165e:	ee                   	out    %al,(%dx)
    }
}
  10165f:	90                   	nop
  101660:	c9                   	leave  
  101661:	c3                   	ret    

00101662 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101662:	55                   	push   %ebp
  101663:	89 e5                	mov    %esp,%ebp
    pic_setmask(irq_mask & ~(1 << irq));
  101665:	8b 45 08             	mov    0x8(%ebp),%eax
  101668:	ba 01 00 00 00       	mov    $0x1,%edx
  10166d:	89 c1                	mov    %eax,%ecx
  10166f:	d3 e2                	shl    %cl,%edx
  101671:	89 d0                	mov    %edx,%eax
  101673:	f7 d0                	not    %eax
  101675:	89 c2                	mov    %eax,%edx
  101677:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10167e:	21 d0                	and    %edx,%eax
  101680:	0f b7 c0             	movzwl %ax,%eax
  101683:	50                   	push   %eax
  101684:	e8 80 ff ff ff       	call   101609 <pic_setmask>
  101689:	83 c4 04             	add    $0x4,%esp
}
  10168c:	90                   	nop
  10168d:	c9                   	leave  
  10168e:	c3                   	ret    

0010168f <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  10168f:	55                   	push   %ebp
  101690:	89 e5                	mov    %esp,%ebp
  101692:	83 ec 30             	sub    $0x30,%esp
    did_init = 1;
  101695:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  10169c:	00 00 00 
  10169f:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016a5:	c6 45 d6 ff          	movb   $0xff,-0x2a(%ebp)
  1016a9:	0f b6 45 d6          	movzbl -0x2a(%ebp),%eax
  1016ad:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016b1:	ee                   	out    %al,(%dx)
  1016b2:	66 c7 45 fc a1 00    	movw   $0xa1,-0x4(%ebp)
  1016b8:	c6 45 d7 ff          	movb   $0xff,-0x29(%ebp)
  1016bc:	0f b6 45 d7          	movzbl -0x29(%ebp),%eax
  1016c0:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  1016c4:	ee                   	out    %al,(%dx)
  1016c5:	66 c7 45 fa 20 00    	movw   $0x20,-0x6(%ebp)
  1016cb:	c6 45 d8 11          	movb   $0x11,-0x28(%ebp)
  1016cf:	0f b6 45 d8          	movzbl -0x28(%ebp),%eax
  1016d3:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016d7:	ee                   	out    %al,(%dx)
  1016d8:	66 c7 45 f8 21 00    	movw   $0x21,-0x8(%ebp)
  1016de:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
  1016e2:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  1016e6:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  1016ea:	ee                   	out    %al,(%dx)
  1016eb:	66 c7 45 f6 21 00    	movw   $0x21,-0xa(%ebp)
  1016f1:	c6 45 da 04          	movb   $0x4,-0x26(%ebp)
  1016f5:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
  1016f9:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1016fd:	ee                   	out    %al,(%dx)
  1016fe:	66 c7 45 f4 21 00    	movw   $0x21,-0xc(%ebp)
  101704:	c6 45 db 03          	movb   $0x3,-0x25(%ebp)
  101708:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  10170c:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  101710:	ee                   	out    %al,(%dx)
  101711:	66 c7 45 f2 a0 00    	movw   $0xa0,-0xe(%ebp)
  101717:	c6 45 dc 11          	movb   $0x11,-0x24(%ebp)
  10171b:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  10171f:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101723:	ee                   	out    %al,(%dx)
  101724:	66 c7 45 f0 a1 00    	movw   $0xa1,-0x10(%ebp)
  10172a:	c6 45 dd 28          	movb   $0x28,-0x23(%ebp)
  10172e:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101732:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  101736:	ee                   	out    %al,(%dx)
  101737:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  10173d:	c6 45 de 02          	movb   $0x2,-0x22(%ebp)
  101741:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
  101745:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101749:	ee                   	out    %al,(%dx)
  10174a:	66 c7 45 ec a1 00    	movw   $0xa1,-0x14(%ebp)
  101750:	c6 45 df 03          	movb   $0x3,-0x21(%ebp)
  101754:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  101758:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  10175c:	ee                   	out    %al,(%dx)
  10175d:	66 c7 45 ea 20 00    	movw   $0x20,-0x16(%ebp)
  101763:	c6 45 e0 68          	movb   $0x68,-0x20(%ebp)
  101767:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  10176b:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10176f:	ee                   	out    %al,(%dx)
  101770:	66 c7 45 e8 20 00    	movw   $0x20,-0x18(%ebp)
  101776:	c6 45 e1 0a          	movb   $0xa,-0x1f(%ebp)
  10177a:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  10177e:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  101782:	ee                   	out    %al,(%dx)
  101783:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  101789:	c6 45 e2 68          	movb   $0x68,-0x1e(%ebp)
  10178d:	0f b6 45 e2          	movzbl -0x1e(%ebp),%eax
  101791:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101795:	ee                   	out    %al,(%dx)
  101796:	66 c7 45 e4 a0 00    	movw   $0xa0,-0x1c(%ebp)
  10179c:	c6 45 e3 0a          	movb   $0xa,-0x1d(%ebp)
  1017a0:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
  1017a4:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
  1017a8:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017a9:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017b0:	66 83 f8 ff          	cmp    $0xffff,%ax
  1017b4:	74 13                	je     1017c9 <pic_init+0x13a>
        pic_setmask(irq_mask);
  1017b6:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017bd:	0f b7 c0             	movzwl %ax,%eax
  1017c0:	50                   	push   %eax
  1017c1:	e8 43 fe ff ff       	call   101609 <pic_setmask>
  1017c6:	83 c4 04             	add    $0x4,%esp
    }
}
  1017c9:	90                   	nop
  1017ca:	c9                   	leave  
  1017cb:	c3                   	ret    

001017cc <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1017cc:	55                   	push   %ebp
  1017cd:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1017cf:	fb                   	sti    
    sti();
}
  1017d0:	90                   	nop
  1017d1:	5d                   	pop    %ebp
  1017d2:	c3                   	ret    

001017d3 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1017d3:	55                   	push   %ebp
  1017d4:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  1017d6:	fa                   	cli    
    cli();
}
  1017d7:	90                   	nop
  1017d8:	5d                   	pop    %ebp
  1017d9:	c3                   	ret    

001017da <print_ticks>:
#include <kdebug.h>
#include <string.h>

#define TICK_NUM 100

static void print_ticks() {
  1017da:	55                   	push   %ebp
  1017db:	89 e5                	mov    %esp,%ebp
  1017dd:	83 ec 08             	sub    $0x8,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017e0:	83 ec 08             	sub    $0x8,%esp
  1017e3:	6a 64                	push   $0x64
  1017e5:	68 c0 38 10 00       	push   $0x1038c0
  1017ea:	e8 5b ea ff ff       	call   10024a <cprintf>
  1017ef:	83 c4 10             	add    $0x10,%esp
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
  1017f2:	83 ec 0c             	sub    $0xc,%esp
  1017f5:	68 ca 38 10 00       	push   $0x1038ca
  1017fa:	e8 4b ea ff ff       	call   10024a <cprintf>
  1017ff:	83 c4 10             	add    $0x10,%esp
    panic("EOT: kernel seems ok.");
  101802:	83 ec 04             	sub    $0x4,%esp
  101805:	68 d8 38 10 00       	push   $0x1038d8
  10180a:	6a 13                	push   $0x13
  10180c:	68 ee 38 10 00       	push   $0x1038ee
  101811:	e8 9a eb ff ff       	call   1003b0 <__panic>

00101816 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101816:	55                   	push   %ebp
  101817:	89 e5                	mov    %esp,%ebp
  101819:	83 ec 10             	sub    $0x10,%esp
      extern uintptr_t __vectors[];
      /*
	SETGATE(idt表项，是trap还是普通中断，中断服务例程（包括系统调用的代码）所在的代码段在GDT中selector（1<<3 = 8），
				中断服务例程的偏移（实际上就是地址），DPL值：KERNEL/USER)
      */
      for (int i = 0; i < 256; ++i) {		
  10181c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101823:	e9 c3 00 00 00       	jmp    1018eb <idt_init+0xd5>
      	SETGATE(idt[i], 0, GD_KTEXT,__vectors[i], DPL_KERNEL);	
  101828:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10182b:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101832:	89 c2                	mov    %eax,%edx
  101834:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101837:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  10183e:	00 
  10183f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101842:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  101849:	00 08 00 
  10184c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10184f:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101856:	00 
  101857:	83 e2 e0             	and    $0xffffffe0,%edx
  10185a:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101861:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101864:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  10186b:	00 
  10186c:	83 e2 1f             	and    $0x1f,%edx
  10186f:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101876:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101879:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101880:	00 
  101881:	83 e2 f0             	and    $0xfffffff0,%edx
  101884:	83 ca 0e             	or     $0xe,%edx
  101887:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  10188e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101891:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101898:	00 
  101899:	83 e2 ef             	and    $0xffffffef,%edx
  10189c:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018a6:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018ad:	00 
  1018ae:	83 e2 9f             	and    $0xffffff9f,%edx
  1018b1:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018bb:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018c2:	00 
  1018c3:	83 ca 80             	or     $0xffffff80,%edx
  1018c6:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018d0:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018d7:	c1 e8 10             	shr    $0x10,%eax
  1018da:	89 c2                	mov    %eax,%edx
  1018dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018df:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  1018e6:	00 
      extern uintptr_t __vectors[];
      /*
	SETGATE(idt表项，是trap还是普通中断，中断服务例程（包括系统调用的代码）所在的代码段在GDT中selector（1<<3 = 8），
				中断服务例程的偏移（实际上就是地址），DPL值：KERNEL/USER)
      */
      for (int i = 0; i < 256; ++i) {		
  1018e7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1018eb:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  1018f2:	0f 8e 30 ff ff ff    	jle    101828 <idt_init+0x12>
      	SETGATE(idt[i], 0, GD_KTEXT,__vectors[i], DPL_KERNEL);	
      }
      
      SETGATE(idt[T_SWITCH_TOK], 1, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);	
  1018f8:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  1018fd:	66 a3 68 f4 10 00    	mov    %ax,0x10f468
  101903:	66 c7 05 6a f4 10 00 	movw   $0x8,0x10f46a
  10190a:	08 00 
  10190c:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  101913:	83 e0 e0             	and    $0xffffffe0,%eax
  101916:	a2 6c f4 10 00       	mov    %al,0x10f46c
  10191b:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  101922:	83 e0 1f             	and    $0x1f,%eax
  101925:	a2 6c f4 10 00       	mov    %al,0x10f46c
  10192a:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101931:	83 c8 0f             	or     $0xf,%eax
  101934:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101939:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101940:	83 e0 ef             	and    $0xffffffef,%eax
  101943:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101948:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  10194f:	83 c8 60             	or     $0x60,%eax
  101952:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101957:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  10195e:	83 c8 80             	or     $0xffffff80,%eax
  101961:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101966:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  10196b:	c1 e8 10             	shr    $0x10,%eax
  10196e:	66 a3 6e f4 10 00    	mov    %ax,0x10f46e
  101974:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  10197b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10197e:	0f 01 18             	lidtl  (%eax)
	  //设置特定的idt表项（T_SWITCH_TOK = 121）为trap，trap的DPL为USER
      lidt(&idt_pd);//IDT存放在静态常量区，让IDTR知道IDT存放在哪
}
  101981:	90                   	nop
  101982:	c9                   	leave  
  101983:	c3                   	ret    

00101984 <trapname>:

static const char *
trapname(int trapno) {
  101984:	55                   	push   %ebp
  101985:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101987:	8b 45 08             	mov    0x8(%ebp),%eax
  10198a:	83 f8 13             	cmp    $0x13,%eax
  10198d:	77 0c                	ja     10199b <trapname+0x17>
        return excnames[trapno];
  10198f:	8b 45 08             	mov    0x8(%ebp),%eax
  101992:	8b 04 85 40 3c 10 00 	mov    0x103c40(,%eax,4),%eax
  101999:	eb 18                	jmp    1019b3 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  10199b:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  10199f:	7e 0d                	jle    1019ae <trapname+0x2a>
  1019a1:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1019a5:	7f 07                	jg     1019ae <trapname+0x2a>
        return "Hardware Interrupt";
  1019a7:	b8 ff 38 10 00       	mov    $0x1038ff,%eax
  1019ac:	eb 05                	jmp    1019b3 <trapname+0x2f>
    }
    return "(unknown trap)";
  1019ae:	b8 12 39 10 00       	mov    $0x103912,%eax
}
  1019b3:	5d                   	pop    %ebp
  1019b4:	c3                   	ret    

001019b5 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1019b5:	55                   	push   %ebp
  1019b6:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1019b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1019bb:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1019bf:	66 83 f8 08          	cmp    $0x8,%ax
  1019c3:	0f 94 c0             	sete   %al
  1019c6:	0f b6 c0             	movzbl %al,%eax
}
  1019c9:	5d                   	pop    %ebp
  1019ca:	c3                   	ret    

001019cb <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  1019cb:	55                   	push   %ebp
  1019cc:	89 e5                	mov    %esp,%ebp
  1019ce:	83 ec 18             	sub    $0x18,%esp
    cprintf("trapframe at %p\n", tf);
  1019d1:	83 ec 08             	sub    $0x8,%esp
  1019d4:	ff 75 08             	pushl  0x8(%ebp)
  1019d7:	68 53 39 10 00       	push   $0x103953
  1019dc:	e8 69 e8 ff ff       	call   10024a <cprintf>
  1019e1:	83 c4 10             	add    $0x10,%esp
    print_regs(&tf->tf_regs);
  1019e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1019e7:	83 ec 0c             	sub    $0xc,%esp
  1019ea:	50                   	push   %eax
  1019eb:	e8 b8 01 00 00       	call   101ba8 <print_regs>
  1019f0:	83 c4 10             	add    $0x10,%esp
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  1019f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1019f6:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  1019fa:	0f b7 c0             	movzwl %ax,%eax
  1019fd:	83 ec 08             	sub    $0x8,%esp
  101a00:	50                   	push   %eax
  101a01:	68 64 39 10 00       	push   $0x103964
  101a06:	e8 3f e8 ff ff       	call   10024a <cprintf>
  101a0b:	83 c4 10             	add    $0x10,%esp
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101a0e:	8b 45 08             	mov    0x8(%ebp),%eax
  101a11:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101a15:	0f b7 c0             	movzwl %ax,%eax
  101a18:	83 ec 08             	sub    $0x8,%esp
  101a1b:	50                   	push   %eax
  101a1c:	68 77 39 10 00       	push   $0x103977
  101a21:	e8 24 e8 ff ff       	call   10024a <cprintf>
  101a26:	83 c4 10             	add    $0x10,%esp
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101a29:	8b 45 08             	mov    0x8(%ebp),%eax
  101a2c:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101a30:	0f b7 c0             	movzwl %ax,%eax
  101a33:	83 ec 08             	sub    $0x8,%esp
  101a36:	50                   	push   %eax
  101a37:	68 8a 39 10 00       	push   $0x10398a
  101a3c:	e8 09 e8 ff ff       	call   10024a <cprintf>
  101a41:	83 c4 10             	add    $0x10,%esp
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101a44:	8b 45 08             	mov    0x8(%ebp),%eax
  101a47:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101a4b:	0f b7 c0             	movzwl %ax,%eax
  101a4e:	83 ec 08             	sub    $0x8,%esp
  101a51:	50                   	push   %eax
  101a52:	68 9d 39 10 00       	push   $0x10399d
  101a57:	e8 ee e7 ff ff       	call   10024a <cprintf>
  101a5c:	83 c4 10             	add    $0x10,%esp
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101a5f:	8b 45 08             	mov    0x8(%ebp),%eax
  101a62:	8b 40 30             	mov    0x30(%eax),%eax
  101a65:	83 ec 0c             	sub    $0xc,%esp
  101a68:	50                   	push   %eax
  101a69:	e8 16 ff ff ff       	call   101984 <trapname>
  101a6e:	83 c4 10             	add    $0x10,%esp
  101a71:	89 c2                	mov    %eax,%edx
  101a73:	8b 45 08             	mov    0x8(%ebp),%eax
  101a76:	8b 40 30             	mov    0x30(%eax),%eax
  101a79:	83 ec 04             	sub    $0x4,%esp
  101a7c:	52                   	push   %edx
  101a7d:	50                   	push   %eax
  101a7e:	68 b0 39 10 00       	push   $0x1039b0
  101a83:	e8 c2 e7 ff ff       	call   10024a <cprintf>
  101a88:	83 c4 10             	add    $0x10,%esp
    cprintf("  err  0x%08x\n", tf->tf_err);
  101a8b:	8b 45 08             	mov    0x8(%ebp),%eax
  101a8e:	8b 40 34             	mov    0x34(%eax),%eax
  101a91:	83 ec 08             	sub    $0x8,%esp
  101a94:	50                   	push   %eax
  101a95:	68 c2 39 10 00       	push   $0x1039c2
  101a9a:	e8 ab e7 ff ff       	call   10024a <cprintf>
  101a9f:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101aa2:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa5:	8b 40 38             	mov    0x38(%eax),%eax
  101aa8:	83 ec 08             	sub    $0x8,%esp
  101aab:	50                   	push   %eax
  101aac:	68 d1 39 10 00       	push   $0x1039d1
  101ab1:	e8 94 e7 ff ff       	call   10024a <cprintf>
  101ab6:	83 c4 10             	add    $0x10,%esp
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101ab9:	8b 45 08             	mov    0x8(%ebp),%eax
  101abc:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101ac0:	0f b7 c0             	movzwl %ax,%eax
  101ac3:	83 ec 08             	sub    $0x8,%esp
  101ac6:	50                   	push   %eax
  101ac7:	68 e0 39 10 00       	push   $0x1039e0
  101acc:	e8 79 e7 ff ff       	call   10024a <cprintf>
  101ad1:	83 c4 10             	add    $0x10,%esp
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101ad4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad7:	8b 40 40             	mov    0x40(%eax),%eax
  101ada:	83 ec 08             	sub    $0x8,%esp
  101add:	50                   	push   %eax
  101ade:	68 f3 39 10 00       	push   $0x1039f3
  101ae3:	e8 62 e7 ff ff       	call   10024a <cprintf>
  101ae8:	83 c4 10             	add    $0x10,%esp

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101aeb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101af2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101af9:	eb 3f                	jmp    101b3a <print_trapframe+0x16f>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101afb:	8b 45 08             	mov    0x8(%ebp),%eax
  101afe:	8b 50 40             	mov    0x40(%eax),%edx
  101b01:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101b04:	21 d0                	and    %edx,%eax
  101b06:	85 c0                	test   %eax,%eax
  101b08:	74 29                	je     101b33 <print_trapframe+0x168>
  101b0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b0d:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b14:	85 c0                	test   %eax,%eax
  101b16:	74 1b                	je     101b33 <print_trapframe+0x168>
            cprintf("%s,", IA32flags[i]);
  101b18:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b1b:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b22:	83 ec 08             	sub    $0x8,%esp
  101b25:	50                   	push   %eax
  101b26:	68 02 3a 10 00       	push   $0x103a02
  101b2b:	e8 1a e7 ff ff       	call   10024a <cprintf>
  101b30:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b33:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101b37:	d1 65 f0             	shll   -0x10(%ebp)
  101b3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b3d:	83 f8 17             	cmp    $0x17,%eax
  101b40:	76 b9                	jbe    101afb <print_trapframe+0x130>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101b42:	8b 45 08             	mov    0x8(%ebp),%eax
  101b45:	8b 40 40             	mov    0x40(%eax),%eax
  101b48:	25 00 30 00 00       	and    $0x3000,%eax
  101b4d:	c1 e8 0c             	shr    $0xc,%eax
  101b50:	83 ec 08             	sub    $0x8,%esp
  101b53:	50                   	push   %eax
  101b54:	68 06 3a 10 00       	push   $0x103a06
  101b59:	e8 ec e6 ff ff       	call   10024a <cprintf>
  101b5e:	83 c4 10             	add    $0x10,%esp

    if (!trap_in_kernel(tf)) {
  101b61:	83 ec 0c             	sub    $0xc,%esp
  101b64:	ff 75 08             	pushl  0x8(%ebp)
  101b67:	e8 49 fe ff ff       	call   1019b5 <trap_in_kernel>
  101b6c:	83 c4 10             	add    $0x10,%esp
  101b6f:	85 c0                	test   %eax,%eax
  101b71:	75 32                	jne    101ba5 <print_trapframe+0x1da>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101b73:	8b 45 08             	mov    0x8(%ebp),%eax
  101b76:	8b 40 44             	mov    0x44(%eax),%eax
  101b79:	83 ec 08             	sub    $0x8,%esp
  101b7c:	50                   	push   %eax
  101b7d:	68 0f 3a 10 00       	push   $0x103a0f
  101b82:	e8 c3 e6 ff ff       	call   10024a <cprintf>
  101b87:	83 c4 10             	add    $0x10,%esp
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101b8a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b8d:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101b91:	0f b7 c0             	movzwl %ax,%eax
  101b94:	83 ec 08             	sub    $0x8,%esp
  101b97:	50                   	push   %eax
  101b98:	68 1e 3a 10 00       	push   $0x103a1e
  101b9d:	e8 a8 e6 ff ff       	call   10024a <cprintf>
  101ba2:	83 c4 10             	add    $0x10,%esp
    }
}
  101ba5:	90                   	nop
  101ba6:	c9                   	leave  
  101ba7:	c3                   	ret    

00101ba8 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101ba8:	55                   	push   %ebp
  101ba9:	89 e5                	mov    %esp,%ebp
  101bab:	83 ec 08             	sub    $0x8,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101bae:	8b 45 08             	mov    0x8(%ebp),%eax
  101bb1:	8b 00                	mov    (%eax),%eax
  101bb3:	83 ec 08             	sub    $0x8,%esp
  101bb6:	50                   	push   %eax
  101bb7:	68 31 3a 10 00       	push   $0x103a31
  101bbc:	e8 89 e6 ff ff       	call   10024a <cprintf>
  101bc1:	83 c4 10             	add    $0x10,%esp
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101bc4:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc7:	8b 40 04             	mov    0x4(%eax),%eax
  101bca:	83 ec 08             	sub    $0x8,%esp
  101bcd:	50                   	push   %eax
  101bce:	68 40 3a 10 00       	push   $0x103a40
  101bd3:	e8 72 e6 ff ff       	call   10024a <cprintf>
  101bd8:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101bdb:	8b 45 08             	mov    0x8(%ebp),%eax
  101bde:	8b 40 08             	mov    0x8(%eax),%eax
  101be1:	83 ec 08             	sub    $0x8,%esp
  101be4:	50                   	push   %eax
  101be5:	68 4f 3a 10 00       	push   $0x103a4f
  101bea:	e8 5b e6 ff ff       	call   10024a <cprintf>
  101bef:	83 c4 10             	add    $0x10,%esp
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101bf2:	8b 45 08             	mov    0x8(%ebp),%eax
  101bf5:	8b 40 0c             	mov    0xc(%eax),%eax
  101bf8:	83 ec 08             	sub    $0x8,%esp
  101bfb:	50                   	push   %eax
  101bfc:	68 5e 3a 10 00       	push   $0x103a5e
  101c01:	e8 44 e6 ff ff       	call   10024a <cprintf>
  101c06:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101c09:	8b 45 08             	mov    0x8(%ebp),%eax
  101c0c:	8b 40 10             	mov    0x10(%eax),%eax
  101c0f:	83 ec 08             	sub    $0x8,%esp
  101c12:	50                   	push   %eax
  101c13:	68 6d 3a 10 00       	push   $0x103a6d
  101c18:	e8 2d e6 ff ff       	call   10024a <cprintf>
  101c1d:	83 c4 10             	add    $0x10,%esp
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101c20:	8b 45 08             	mov    0x8(%ebp),%eax
  101c23:	8b 40 14             	mov    0x14(%eax),%eax
  101c26:	83 ec 08             	sub    $0x8,%esp
  101c29:	50                   	push   %eax
  101c2a:	68 7c 3a 10 00       	push   $0x103a7c
  101c2f:	e8 16 e6 ff ff       	call   10024a <cprintf>
  101c34:	83 c4 10             	add    $0x10,%esp
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101c37:	8b 45 08             	mov    0x8(%ebp),%eax
  101c3a:	8b 40 18             	mov    0x18(%eax),%eax
  101c3d:	83 ec 08             	sub    $0x8,%esp
  101c40:	50                   	push   %eax
  101c41:	68 8b 3a 10 00       	push   $0x103a8b
  101c46:	e8 ff e5 ff ff       	call   10024a <cprintf>
  101c4b:	83 c4 10             	add    $0x10,%esp
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101c4e:	8b 45 08             	mov    0x8(%ebp),%eax
  101c51:	8b 40 1c             	mov    0x1c(%eax),%eax
  101c54:	83 ec 08             	sub    $0x8,%esp
  101c57:	50                   	push   %eax
  101c58:	68 9a 3a 10 00       	push   $0x103a9a
  101c5d:	e8 e8 e5 ff ff       	call   10024a <cprintf>
  101c62:	83 c4 10             	add    $0x10,%esp
}
  101c65:	90                   	nop
  101c66:	c9                   	leave  
  101c67:	c3                   	ret    

00101c68 <trap_dispatch>:
/* temporary trapframe or pointer to trapframe */
struct trapframe switchk2u, *switchu2k;

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101c68:	55                   	push   %ebp
  101c69:	89 e5                	mov    %esp,%ebp
  101c6b:	57                   	push   %edi
  101c6c:	56                   	push   %esi
  101c6d:	53                   	push   %ebx
  101c6e:	83 ec 1c             	sub    $0x1c,%esp
    char c;

    switch (tf->tf_trapno) {			//中断编号
  101c71:	8b 45 08             	mov    0x8(%ebp),%eax
  101c74:	8b 40 30             	mov    0x30(%eax),%eax
  101c77:	83 f8 2f             	cmp    $0x2f,%eax
  101c7a:	77 21                	ja     101c9d <trap_dispatch+0x35>
  101c7c:	83 f8 2e             	cmp    $0x2e,%eax
  101c7f:	0f 83 09 02 00 00    	jae    101e8e <trap_dispatch+0x226>
  101c85:	83 f8 21             	cmp    $0x21,%eax
  101c88:	0f 84 91 00 00 00    	je     101d1f <trap_dispatch+0xb7>
  101c8e:	83 f8 24             	cmp    $0x24,%eax
  101c91:	74 65                	je     101cf8 <trap_dispatch+0x90>
  101c93:	83 f8 20             	cmp    $0x20,%eax
  101c96:	74 1c                	je     101cb4 <trap_dispatch+0x4c>
  101c98:	e9 bb 01 00 00       	jmp    101e58 <trap_dispatch+0x1f0>
  101c9d:	83 f8 78             	cmp    $0x78,%eax
  101ca0:	0f 84 a0 00 00 00    	je     101d46 <trap_dispatch+0xde>
  101ca6:	83 f8 79             	cmp    $0x79,%eax
  101ca9:	0f 84 33 01 00 00    	je     101de2 <trap_dispatch+0x17a>
  101caf:	e9 a4 01 00 00       	jmp    101e58 <trap_dispatch+0x1f0>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
	ticks++;			//clock.h中已经定义一个ticks变量
  101cb4:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101cb9:	83 c0 01             	add    $0x1,%eax
  101cbc:	a3 08 f9 10 00       	mov    %eax,0x10f908
	if (ticks % TICK_NUM == 0) {
  101cc1:	8b 0d 08 f9 10 00    	mov    0x10f908,%ecx
  101cc7:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101ccc:	89 c8                	mov    %ecx,%eax
  101cce:	f7 e2                	mul    %edx
  101cd0:	89 d0                	mov    %edx,%eax
  101cd2:	c1 e8 05             	shr    $0x5,%eax
  101cd5:	6b c0 64             	imul   $0x64,%eax,%eax
  101cd8:	29 c1                	sub    %eax,%ecx
  101cda:	89 c8                	mov    %ecx,%eax
  101cdc:	85 c0                	test   %eax,%eax
  101cde:	0f 85 ad 01 00 00    	jne    101e91 <trap_dispatch+0x229>
		print_ticks();
  101ce4:	e8 f1 fa ff ff       	call   1017da <print_ticks>
		ticks = 0;
  101ce9:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  101cf0:	00 00 00 
	}
        break;
  101cf3:	e9 99 01 00 00       	jmp    101e91 <trap_dispatch+0x229>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101cf8:	e8 b0 f8 ff ff       	call   1015ad <cons_getc>
  101cfd:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101d00:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101d04:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101d08:	83 ec 04             	sub    $0x4,%esp
  101d0b:	52                   	push   %edx
  101d0c:	50                   	push   %eax
  101d0d:	68 a9 3a 10 00       	push   $0x103aa9
  101d12:	e8 33 e5 ff ff       	call   10024a <cprintf>
  101d17:	83 c4 10             	add    $0x10,%esp
        break;
  101d1a:	e9 79 01 00 00       	jmp    101e98 <trap_dispatch+0x230>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101d1f:	e8 89 f8 ff ff       	call   1015ad <cons_getc>
  101d24:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101d27:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101d2b:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101d2f:	83 ec 04             	sub    $0x4,%esp
  101d32:	52                   	push   %edx
  101d33:	50                   	push   %eax
  101d34:	68 bb 3a 10 00       	push   $0x103abb
  101d39:	e8 0c e5 ff ff       	call   10024a <cprintf>
  101d3e:	83 c4 10             	add    $0x10,%esp
        break;
  101d41:	e9 52 01 00 00       	jmp    101e98 <trap_dispatch+0x230>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    	if (tf->tf_cs != USER_CS) {		//内核态切到虚拟的用户态，没必要保存内核栈的esp和ss，他们都在进程tss中，iret指令时才真正的切换栈
  101d46:	8b 45 08             	mov    0x8(%ebp),%eax
  101d49:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d4d:	66 83 f8 1b          	cmp    $0x1b,%ax
  101d51:	0f 84 3d 01 00 00    	je     101e94 <trap_dispatch+0x22c>
            switchk2u = *tf;
  101d57:	8b 55 08             	mov    0x8(%ebp),%edx
  101d5a:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  101d5f:	89 d3                	mov    %edx,%ebx
  101d61:	ba 4c 00 00 00       	mov    $0x4c,%edx
  101d66:	8b 0b                	mov    (%ebx),%ecx
  101d68:	89 08                	mov    %ecx,(%eax)
  101d6a:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
  101d6e:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
  101d72:	8d 78 04             	lea    0x4(%eax),%edi
  101d75:	83 e7 fc             	and    $0xfffffffc,%edi
  101d78:	29 f8                	sub    %edi,%eax
  101d7a:	29 c3                	sub    %eax,%ebx
  101d7c:	01 c2                	add    %eax,%edx
  101d7e:	83 e2 fc             	and    $0xfffffffc,%edx
  101d81:	89 d0                	mov    %edx,%eax
  101d83:	c1 e8 02             	shr    $0x2,%eax
  101d86:	89 de                	mov    %ebx,%esi
  101d88:	89 c1                	mov    %eax,%ecx
  101d8a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
            switchk2u.tf_cs = USER_CS;
  101d8c:	66 c7 05 5c f9 10 00 	movw   $0x1b,0x10f95c
  101d93:	1b 00 
            switchk2u.tf_ds = switchk2u.tf_es = switchk2u.tf_ss = USER_DS;
  101d95:	66 c7 05 68 f9 10 00 	movw   $0x23,0x10f968
  101d9c:	23 00 
  101d9e:	0f b7 05 68 f9 10 00 	movzwl 0x10f968,%eax
  101da5:	66 a3 48 f9 10 00    	mov    %ax,0x10f948
  101dab:	0f b7 05 48 f9 10 00 	movzwl 0x10f948,%eax
  101db2:	66 a3 4c f9 10 00    	mov    %ax,0x10f94c
            switchk2u.tf_esp = (uint32_t)tf + sizeof(struct trapframe) - 8;//实际上lab1_switch_to_user是在kern_init中切换，也就是说此处还是是内核态返回到内核态（虚拟的用户态，trapframe用来保存这虚拟的用户态信息），sizeof(struct trapframe)有76字节，但是esp和ss没保存，所以只要偏移sizeof(struct trapframe)-8即可
  101db8:	8b 45 08             	mov    0x8(%ebp),%eax
  101dbb:	83 c0 44             	add    $0x44,%eax
  101dbe:	a3 64 f9 10 00       	mov    %eax,0x10f964
		
            // set eflags, make sure ucore can use io under user mode.
            // if CPL > IOPL, then cpu will generate a general protection.
            switchk2u.tf_eflags |= FL_IOPL_MASK;/* Eflags register 对I/O操作限制那一位*/
  101dc3:	a1 60 f9 10 00       	mov    0x10f960,%eax
  101dc8:	80 cc 30             	or     $0x30,%ah
  101dcb:	a3 60 f9 10 00       	mov    %eax,0x10f960
            // set temporary stack
            // then iret will jump to the right stack
            *((uint32_t *)tf - 1) = (uint32_t)&switchk2u;//由于之前为了传递tf参数，多压入了esp，然后等trap_dispatch退出时，esp内容还在栈顶，所以tf提前4字节把esp覆盖，然后iret时就可以正确弹出到对应的寄存器，所以print_cur_state会打出变化的内容
  101dd0:	8b 45 08             	mov    0x8(%ebp),%eax
  101dd3:	83 e8 04             	sub    $0x4,%eax
  101dd6:	ba 20 f9 10 00       	mov    $0x10f920,%edx
  101ddb:	89 10                	mov    %edx,(%eax)
            //print_trapframe(tf);
        }
    	break;
  101ddd:	e9 b2 00 00 00       	jmp    101e94 <trap_dispatch+0x22c>
    case T_SWITCH_TOK:
        //panic("T_SWITCH_** ??\n");
        if (tf->tf_cs != KERNEL_CS) {		//虚拟用户态（内核态）到内核态，esp和ss需要保存
  101de2:	8b 45 08             	mov    0x8(%ebp),%eax
  101de5:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101de9:	66 83 f8 08          	cmp    $0x8,%ax
  101ded:	0f 84 a4 00 00 00    	je     101e97 <trap_dispatch+0x22f>
            tf->tf_cs = KERNEL_CS;
  101df3:	8b 45 08             	mov    0x8(%ebp),%eax
  101df6:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
            tf->tf_ds = tf->tf_es = KERNEL_DS;
  101dfc:	8b 45 08             	mov    0x8(%ebp),%eax
  101dff:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101e05:	8b 45 08             	mov    0x8(%ebp),%eax
  101e08:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101e0c:	8b 45 08             	mov    0x8(%ebp),%eax
  101e0f:	66 89 50 2c          	mov    %dx,0x2c(%eax)
            tf->tf_eflags &= ~FL_IOPL_MASK;
  101e13:	8b 45 08             	mov    0x8(%ebp),%eax
  101e16:	8b 40 40             	mov    0x40(%eax),%eax
  101e19:	80 e4 cf             	and    $0xcf,%ah
  101e1c:	89 c2                	mov    %eax,%edx
  101e1e:	8b 45 08             	mov    0x8(%ebp),%eax
  101e21:	89 50 40             	mov    %edx,0x40(%eax)
            switchu2k = (struct trapframe *)(tf->tf_esp - (sizeof(struct trapframe) - 8));	//在tf_esp以下开辟一块76字节区域存放trapframe
  101e24:	8b 45 08             	mov    0x8(%ebp),%eax
  101e27:	8b 40 44             	mov    0x44(%eax),%eax
  101e2a:	83 e8 44             	sub    $0x44,%eax
  101e2d:	a3 6c f9 10 00       	mov    %eax,0x10f96c
            memmove(switchu2k, tf, sizeof(struct trapframe) - 8);//由于多压入了esp和ss栈存放不下，所以在另一片内存需要将其拷贝到开辟好的76字节
  101e32:	a1 6c f9 10 00       	mov    0x10f96c,%eax
  101e37:	83 ec 04             	sub    $0x4,%esp
  101e3a:	6a 44                	push   $0x44
  101e3c:	ff 75 08             	pushl  0x8(%ebp)
  101e3f:	50                   	push   %eax
  101e40:	e8 b9 0f 00 00       	call   102dfe <memmove>
  101e45:	83 c4 10             	add    $0x10,%esp
            *((uint32_t *)tf - 1) = (uint32_t)switchu2k;
  101e48:	8b 45 08             	mov    0x8(%ebp),%eax
  101e4b:	83 e8 04             	sub    $0x4,%eax
  101e4e:	8b 15 6c f9 10 00    	mov    0x10f96c,%edx
  101e54:	89 10                	mov    %edx,(%eax)
            //print_trapframe(tf);
        }
        break;
  101e56:	eb 3f                	jmp    101e97 <trap_dispatch+0x22f>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101e58:	8b 45 08             	mov    0x8(%ebp),%eax
  101e5b:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e5f:	0f b7 c0             	movzwl %ax,%eax
  101e62:	83 e0 03             	and    $0x3,%eax
  101e65:	85 c0                	test   %eax,%eax
  101e67:	75 2f                	jne    101e98 <trap_dispatch+0x230>
            print_trapframe(tf);
  101e69:	83 ec 0c             	sub    $0xc,%esp
  101e6c:	ff 75 08             	pushl  0x8(%ebp)
  101e6f:	e8 57 fb ff ff       	call   1019cb <print_trapframe>
  101e74:	83 c4 10             	add    $0x10,%esp
            panic("unexpected trap in kernel.\n");
  101e77:	83 ec 04             	sub    $0x4,%esp
  101e7a:	68 ca 3a 10 00       	push   $0x103aca
  101e7f:	68 d8 00 00 00       	push   $0xd8
  101e84:	68 ee 38 10 00       	push   $0x1038ee
  101e89:	e8 22 e5 ff ff       	call   1003b0 <__panic>
        }
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101e8e:	90                   	nop
  101e8f:	eb 07                	jmp    101e98 <trap_dispatch+0x230>
	ticks++;			//clock.h中已经定义一个ticks变量
	if (ticks % TICK_NUM == 0) {
		print_ticks();
		ticks = 0;
	}
        break;
  101e91:	90                   	nop
  101e92:	eb 04                	jmp    101e98 <trap_dispatch+0x230>
            // set temporary stack
            // then iret will jump to the right stack
            *((uint32_t *)tf - 1) = (uint32_t)&switchk2u;//由于之前为了传递tf参数，多压入了esp，然后等trap_dispatch退出时，esp内容还在栈顶，所以tf提前4字节把esp覆盖，然后iret时就可以正确弹出到对应的寄存器，所以print_cur_state会打出变化的内容
            //print_trapframe(tf);
        }
    	break;
  101e94:	90                   	nop
  101e95:	eb 01                	jmp    101e98 <trap_dispatch+0x230>
            switchu2k = (struct trapframe *)(tf->tf_esp - (sizeof(struct trapframe) - 8));	//在tf_esp以下开辟一块76字节区域存放trapframe
            memmove(switchu2k, tf, sizeof(struct trapframe) - 8);//由于多压入了esp和ss栈存放不下，所以在另一片内存需要将其拷贝到开辟好的76字节
            *((uint32_t *)tf - 1) = (uint32_t)switchu2k;
            //print_trapframe(tf);
        }
        break;
  101e97:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101e98:	90                   	nop
  101e99:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101e9c:	5b                   	pop    %ebx
  101e9d:	5e                   	pop    %esi
  101e9e:	5f                   	pop    %edi
  101e9f:	5d                   	pop    %ebp
  101ea0:	c3                   	ret    

00101ea1 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101ea1:	55                   	push   %ebp
  101ea2:	89 e5                	mov    %esp,%ebp
  101ea4:	83 ec 08             	sub    $0x8,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101ea7:	83 ec 0c             	sub    $0xc,%esp
  101eaa:	ff 75 08             	pushl  0x8(%ebp)
  101ead:	e8 b6 fd ff ff       	call   101c68 <trap_dispatch>
  101eb2:	83 c4 10             	add    $0x10,%esp
}
  101eb5:	90                   	nop
  101eb6:	c9                   	leave  
  101eb7:	c3                   	ret    

00101eb8 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0		#pushl = push dword   $0是为了有中断错误码和无中断错误码的统一
  101eb8:	6a 00                	push   $0x0
  pushl $0
  101eba:	6a 00                	push   $0x0
  jmp __alltraps
  101ebc:	e9 67 0a 00 00       	jmp    102928 <__alltraps>

00101ec1 <vector1>:
.globl vector1
vector1:
  pushl $0
  101ec1:	6a 00                	push   $0x0
  pushl $1
  101ec3:	6a 01                	push   $0x1
  jmp __alltraps
  101ec5:	e9 5e 0a 00 00       	jmp    102928 <__alltraps>

00101eca <vector2>:
.globl vector2
vector2:
  pushl $0
  101eca:	6a 00                	push   $0x0
  pushl $2
  101ecc:	6a 02                	push   $0x2
  jmp __alltraps
  101ece:	e9 55 0a 00 00       	jmp    102928 <__alltraps>

00101ed3 <vector3>:
.globl vector3
vector3:
  pushl $0
  101ed3:	6a 00                	push   $0x0
  pushl $3
  101ed5:	6a 03                	push   $0x3
  jmp __alltraps
  101ed7:	e9 4c 0a 00 00       	jmp    102928 <__alltraps>

00101edc <vector4>:
.globl vector4
vector4:
  pushl $0
  101edc:	6a 00                	push   $0x0
  pushl $4
  101ede:	6a 04                	push   $0x4
  jmp __alltraps
  101ee0:	e9 43 0a 00 00       	jmp    102928 <__alltraps>

00101ee5 <vector5>:
.globl vector5
vector5:
  pushl $0
  101ee5:	6a 00                	push   $0x0
  pushl $5
  101ee7:	6a 05                	push   $0x5
  jmp __alltraps
  101ee9:	e9 3a 0a 00 00       	jmp    102928 <__alltraps>

00101eee <vector6>:
.globl vector6
vector6:
  pushl $0
  101eee:	6a 00                	push   $0x0
  pushl $6
  101ef0:	6a 06                	push   $0x6
  jmp __alltraps
  101ef2:	e9 31 0a 00 00       	jmp    102928 <__alltraps>

00101ef7 <vector7>:
.globl vector7
vector7:
  pushl $0
  101ef7:	6a 00                	push   $0x0
  pushl $7
  101ef9:	6a 07                	push   $0x7
  jmp __alltraps
  101efb:	e9 28 0a 00 00       	jmp    102928 <__alltraps>

00101f00 <vector8>:
.globl vector8
vector8:
  pushl $8
  101f00:	6a 08                	push   $0x8
  jmp __alltraps
  101f02:	e9 21 0a 00 00       	jmp    102928 <__alltraps>

00101f07 <vector9>:
.globl vector9
vector9:
  pushl $9
  101f07:	6a 09                	push   $0x9
  jmp __alltraps
  101f09:	e9 1a 0a 00 00       	jmp    102928 <__alltraps>

00101f0e <vector10>:
.globl vector10
vector10:
  pushl $10
  101f0e:	6a 0a                	push   $0xa
  jmp __alltraps
  101f10:	e9 13 0a 00 00       	jmp    102928 <__alltraps>

00101f15 <vector11>:
.globl vector11
vector11:
  pushl $11
  101f15:	6a 0b                	push   $0xb
  jmp __alltraps
  101f17:	e9 0c 0a 00 00       	jmp    102928 <__alltraps>

00101f1c <vector12>:
.globl vector12
vector12:
  pushl $12
  101f1c:	6a 0c                	push   $0xc
  jmp __alltraps
  101f1e:	e9 05 0a 00 00       	jmp    102928 <__alltraps>

00101f23 <vector13>:
.globl vector13
vector13:
  pushl $13
  101f23:	6a 0d                	push   $0xd
  jmp __alltraps
  101f25:	e9 fe 09 00 00       	jmp    102928 <__alltraps>

00101f2a <vector14>:
.globl vector14
vector14:
  pushl $14
  101f2a:	6a 0e                	push   $0xe
  jmp __alltraps
  101f2c:	e9 f7 09 00 00       	jmp    102928 <__alltraps>

00101f31 <vector15>:
.globl vector15
vector15:
  pushl $0
  101f31:	6a 00                	push   $0x0
  pushl $15
  101f33:	6a 0f                	push   $0xf
  jmp __alltraps
  101f35:	e9 ee 09 00 00       	jmp    102928 <__alltraps>

00101f3a <vector16>:
.globl vector16
vector16:
  pushl $0
  101f3a:	6a 00                	push   $0x0
  pushl $16
  101f3c:	6a 10                	push   $0x10
  jmp __alltraps
  101f3e:	e9 e5 09 00 00       	jmp    102928 <__alltraps>

00101f43 <vector17>:
.globl vector17
vector17:
  pushl $17
  101f43:	6a 11                	push   $0x11
  jmp __alltraps
  101f45:	e9 de 09 00 00       	jmp    102928 <__alltraps>

00101f4a <vector18>:
.globl vector18
vector18:
  pushl $0
  101f4a:	6a 00                	push   $0x0
  pushl $18
  101f4c:	6a 12                	push   $0x12
  jmp __alltraps
  101f4e:	e9 d5 09 00 00       	jmp    102928 <__alltraps>

00101f53 <vector19>:
.globl vector19
vector19:
  pushl $0
  101f53:	6a 00                	push   $0x0
  pushl $19
  101f55:	6a 13                	push   $0x13
  jmp __alltraps
  101f57:	e9 cc 09 00 00       	jmp    102928 <__alltraps>

00101f5c <vector20>:
.globl vector20
vector20:
  pushl $0
  101f5c:	6a 00                	push   $0x0
  pushl $20
  101f5e:	6a 14                	push   $0x14
  jmp __alltraps
  101f60:	e9 c3 09 00 00       	jmp    102928 <__alltraps>

00101f65 <vector21>:
.globl vector21
vector21:
  pushl $0
  101f65:	6a 00                	push   $0x0
  pushl $21
  101f67:	6a 15                	push   $0x15
  jmp __alltraps
  101f69:	e9 ba 09 00 00       	jmp    102928 <__alltraps>

00101f6e <vector22>:
.globl vector22
vector22:
  pushl $0
  101f6e:	6a 00                	push   $0x0
  pushl $22
  101f70:	6a 16                	push   $0x16
  jmp __alltraps
  101f72:	e9 b1 09 00 00       	jmp    102928 <__alltraps>

00101f77 <vector23>:
.globl vector23
vector23:
  pushl $0
  101f77:	6a 00                	push   $0x0
  pushl $23
  101f79:	6a 17                	push   $0x17
  jmp __alltraps
  101f7b:	e9 a8 09 00 00       	jmp    102928 <__alltraps>

00101f80 <vector24>:
.globl vector24
vector24:
  pushl $0
  101f80:	6a 00                	push   $0x0
  pushl $24
  101f82:	6a 18                	push   $0x18
  jmp __alltraps
  101f84:	e9 9f 09 00 00       	jmp    102928 <__alltraps>

00101f89 <vector25>:
.globl vector25
vector25:
  pushl $0
  101f89:	6a 00                	push   $0x0
  pushl $25
  101f8b:	6a 19                	push   $0x19
  jmp __alltraps
  101f8d:	e9 96 09 00 00       	jmp    102928 <__alltraps>

00101f92 <vector26>:
.globl vector26
vector26:
  pushl $0
  101f92:	6a 00                	push   $0x0
  pushl $26
  101f94:	6a 1a                	push   $0x1a
  jmp __alltraps
  101f96:	e9 8d 09 00 00       	jmp    102928 <__alltraps>

00101f9b <vector27>:
.globl vector27
vector27:
  pushl $0
  101f9b:	6a 00                	push   $0x0
  pushl $27
  101f9d:	6a 1b                	push   $0x1b
  jmp __alltraps
  101f9f:	e9 84 09 00 00       	jmp    102928 <__alltraps>

00101fa4 <vector28>:
.globl vector28
vector28:
  pushl $0
  101fa4:	6a 00                	push   $0x0
  pushl $28
  101fa6:	6a 1c                	push   $0x1c
  jmp __alltraps
  101fa8:	e9 7b 09 00 00       	jmp    102928 <__alltraps>

00101fad <vector29>:
.globl vector29
vector29:
  pushl $0
  101fad:	6a 00                	push   $0x0
  pushl $29
  101faf:	6a 1d                	push   $0x1d
  jmp __alltraps
  101fb1:	e9 72 09 00 00       	jmp    102928 <__alltraps>

00101fb6 <vector30>:
.globl vector30
vector30:
  pushl $0
  101fb6:	6a 00                	push   $0x0
  pushl $30
  101fb8:	6a 1e                	push   $0x1e
  jmp __alltraps
  101fba:	e9 69 09 00 00       	jmp    102928 <__alltraps>

00101fbf <vector31>:
.globl vector31
vector31:
  pushl $0
  101fbf:	6a 00                	push   $0x0
  pushl $31
  101fc1:	6a 1f                	push   $0x1f
  jmp __alltraps
  101fc3:	e9 60 09 00 00       	jmp    102928 <__alltraps>

00101fc8 <vector32>:
.globl vector32
vector32:
  pushl $0
  101fc8:	6a 00                	push   $0x0
  pushl $32
  101fca:	6a 20                	push   $0x20
  jmp __alltraps
  101fcc:	e9 57 09 00 00       	jmp    102928 <__alltraps>

00101fd1 <vector33>:
.globl vector33
vector33:
  pushl $0
  101fd1:	6a 00                	push   $0x0
  pushl $33
  101fd3:	6a 21                	push   $0x21
  jmp __alltraps
  101fd5:	e9 4e 09 00 00       	jmp    102928 <__alltraps>

00101fda <vector34>:
.globl vector34
vector34:
  pushl $0
  101fda:	6a 00                	push   $0x0
  pushl $34
  101fdc:	6a 22                	push   $0x22
  jmp __alltraps
  101fde:	e9 45 09 00 00       	jmp    102928 <__alltraps>

00101fe3 <vector35>:
.globl vector35
vector35:
  pushl $0
  101fe3:	6a 00                	push   $0x0
  pushl $35
  101fe5:	6a 23                	push   $0x23
  jmp __alltraps
  101fe7:	e9 3c 09 00 00       	jmp    102928 <__alltraps>

00101fec <vector36>:
.globl vector36
vector36:
  pushl $0
  101fec:	6a 00                	push   $0x0
  pushl $36
  101fee:	6a 24                	push   $0x24
  jmp __alltraps
  101ff0:	e9 33 09 00 00       	jmp    102928 <__alltraps>

00101ff5 <vector37>:
.globl vector37
vector37:
  pushl $0
  101ff5:	6a 00                	push   $0x0
  pushl $37
  101ff7:	6a 25                	push   $0x25
  jmp __alltraps
  101ff9:	e9 2a 09 00 00       	jmp    102928 <__alltraps>

00101ffe <vector38>:
.globl vector38
vector38:
  pushl $0
  101ffe:	6a 00                	push   $0x0
  pushl $38
  102000:	6a 26                	push   $0x26
  jmp __alltraps
  102002:	e9 21 09 00 00       	jmp    102928 <__alltraps>

00102007 <vector39>:
.globl vector39
vector39:
  pushl $0
  102007:	6a 00                	push   $0x0
  pushl $39
  102009:	6a 27                	push   $0x27
  jmp __alltraps
  10200b:	e9 18 09 00 00       	jmp    102928 <__alltraps>

00102010 <vector40>:
.globl vector40
vector40:
  pushl $0
  102010:	6a 00                	push   $0x0
  pushl $40
  102012:	6a 28                	push   $0x28
  jmp __alltraps
  102014:	e9 0f 09 00 00       	jmp    102928 <__alltraps>

00102019 <vector41>:
.globl vector41
vector41:
  pushl $0
  102019:	6a 00                	push   $0x0
  pushl $41
  10201b:	6a 29                	push   $0x29
  jmp __alltraps
  10201d:	e9 06 09 00 00       	jmp    102928 <__alltraps>

00102022 <vector42>:
.globl vector42
vector42:
  pushl $0
  102022:	6a 00                	push   $0x0
  pushl $42
  102024:	6a 2a                	push   $0x2a
  jmp __alltraps
  102026:	e9 fd 08 00 00       	jmp    102928 <__alltraps>

0010202b <vector43>:
.globl vector43
vector43:
  pushl $0
  10202b:	6a 00                	push   $0x0
  pushl $43
  10202d:	6a 2b                	push   $0x2b
  jmp __alltraps
  10202f:	e9 f4 08 00 00       	jmp    102928 <__alltraps>

00102034 <vector44>:
.globl vector44
vector44:
  pushl $0
  102034:	6a 00                	push   $0x0
  pushl $44
  102036:	6a 2c                	push   $0x2c
  jmp __alltraps
  102038:	e9 eb 08 00 00       	jmp    102928 <__alltraps>

0010203d <vector45>:
.globl vector45
vector45:
  pushl $0
  10203d:	6a 00                	push   $0x0
  pushl $45
  10203f:	6a 2d                	push   $0x2d
  jmp __alltraps
  102041:	e9 e2 08 00 00       	jmp    102928 <__alltraps>

00102046 <vector46>:
.globl vector46
vector46:
  pushl $0
  102046:	6a 00                	push   $0x0
  pushl $46
  102048:	6a 2e                	push   $0x2e
  jmp __alltraps
  10204a:	e9 d9 08 00 00       	jmp    102928 <__alltraps>

0010204f <vector47>:
.globl vector47
vector47:
  pushl $0
  10204f:	6a 00                	push   $0x0
  pushl $47
  102051:	6a 2f                	push   $0x2f
  jmp __alltraps
  102053:	e9 d0 08 00 00       	jmp    102928 <__alltraps>

00102058 <vector48>:
.globl vector48
vector48:
  pushl $0
  102058:	6a 00                	push   $0x0
  pushl $48
  10205a:	6a 30                	push   $0x30
  jmp __alltraps
  10205c:	e9 c7 08 00 00       	jmp    102928 <__alltraps>

00102061 <vector49>:
.globl vector49
vector49:
  pushl $0
  102061:	6a 00                	push   $0x0
  pushl $49
  102063:	6a 31                	push   $0x31
  jmp __alltraps
  102065:	e9 be 08 00 00       	jmp    102928 <__alltraps>

0010206a <vector50>:
.globl vector50
vector50:
  pushl $0
  10206a:	6a 00                	push   $0x0
  pushl $50
  10206c:	6a 32                	push   $0x32
  jmp __alltraps
  10206e:	e9 b5 08 00 00       	jmp    102928 <__alltraps>

00102073 <vector51>:
.globl vector51
vector51:
  pushl $0
  102073:	6a 00                	push   $0x0
  pushl $51
  102075:	6a 33                	push   $0x33
  jmp __alltraps
  102077:	e9 ac 08 00 00       	jmp    102928 <__alltraps>

0010207c <vector52>:
.globl vector52
vector52:
  pushl $0
  10207c:	6a 00                	push   $0x0
  pushl $52
  10207e:	6a 34                	push   $0x34
  jmp __alltraps
  102080:	e9 a3 08 00 00       	jmp    102928 <__alltraps>

00102085 <vector53>:
.globl vector53
vector53:
  pushl $0
  102085:	6a 00                	push   $0x0
  pushl $53
  102087:	6a 35                	push   $0x35
  jmp __alltraps
  102089:	e9 9a 08 00 00       	jmp    102928 <__alltraps>

0010208e <vector54>:
.globl vector54
vector54:
  pushl $0
  10208e:	6a 00                	push   $0x0
  pushl $54
  102090:	6a 36                	push   $0x36
  jmp __alltraps
  102092:	e9 91 08 00 00       	jmp    102928 <__alltraps>

00102097 <vector55>:
.globl vector55
vector55:
  pushl $0
  102097:	6a 00                	push   $0x0
  pushl $55
  102099:	6a 37                	push   $0x37
  jmp __alltraps
  10209b:	e9 88 08 00 00       	jmp    102928 <__alltraps>

001020a0 <vector56>:
.globl vector56
vector56:
  pushl $0
  1020a0:	6a 00                	push   $0x0
  pushl $56
  1020a2:	6a 38                	push   $0x38
  jmp __alltraps
  1020a4:	e9 7f 08 00 00       	jmp    102928 <__alltraps>

001020a9 <vector57>:
.globl vector57
vector57:
  pushl $0
  1020a9:	6a 00                	push   $0x0
  pushl $57
  1020ab:	6a 39                	push   $0x39
  jmp __alltraps
  1020ad:	e9 76 08 00 00       	jmp    102928 <__alltraps>

001020b2 <vector58>:
.globl vector58
vector58:
  pushl $0
  1020b2:	6a 00                	push   $0x0
  pushl $58
  1020b4:	6a 3a                	push   $0x3a
  jmp __alltraps
  1020b6:	e9 6d 08 00 00       	jmp    102928 <__alltraps>

001020bb <vector59>:
.globl vector59
vector59:
  pushl $0
  1020bb:	6a 00                	push   $0x0
  pushl $59
  1020bd:	6a 3b                	push   $0x3b
  jmp __alltraps
  1020bf:	e9 64 08 00 00       	jmp    102928 <__alltraps>

001020c4 <vector60>:
.globl vector60
vector60:
  pushl $0
  1020c4:	6a 00                	push   $0x0
  pushl $60
  1020c6:	6a 3c                	push   $0x3c
  jmp __alltraps
  1020c8:	e9 5b 08 00 00       	jmp    102928 <__alltraps>

001020cd <vector61>:
.globl vector61
vector61:
  pushl $0
  1020cd:	6a 00                	push   $0x0
  pushl $61
  1020cf:	6a 3d                	push   $0x3d
  jmp __alltraps
  1020d1:	e9 52 08 00 00       	jmp    102928 <__alltraps>

001020d6 <vector62>:
.globl vector62
vector62:
  pushl $0
  1020d6:	6a 00                	push   $0x0
  pushl $62
  1020d8:	6a 3e                	push   $0x3e
  jmp __alltraps
  1020da:	e9 49 08 00 00       	jmp    102928 <__alltraps>

001020df <vector63>:
.globl vector63
vector63:
  pushl $0
  1020df:	6a 00                	push   $0x0
  pushl $63
  1020e1:	6a 3f                	push   $0x3f
  jmp __alltraps
  1020e3:	e9 40 08 00 00       	jmp    102928 <__alltraps>

001020e8 <vector64>:
.globl vector64
vector64:
  pushl $0
  1020e8:	6a 00                	push   $0x0
  pushl $64
  1020ea:	6a 40                	push   $0x40
  jmp __alltraps
  1020ec:	e9 37 08 00 00       	jmp    102928 <__alltraps>

001020f1 <vector65>:
.globl vector65
vector65:
  pushl $0
  1020f1:	6a 00                	push   $0x0
  pushl $65
  1020f3:	6a 41                	push   $0x41
  jmp __alltraps
  1020f5:	e9 2e 08 00 00       	jmp    102928 <__alltraps>

001020fa <vector66>:
.globl vector66
vector66:
  pushl $0
  1020fa:	6a 00                	push   $0x0
  pushl $66
  1020fc:	6a 42                	push   $0x42
  jmp __alltraps
  1020fe:	e9 25 08 00 00       	jmp    102928 <__alltraps>

00102103 <vector67>:
.globl vector67
vector67:
  pushl $0
  102103:	6a 00                	push   $0x0
  pushl $67
  102105:	6a 43                	push   $0x43
  jmp __alltraps
  102107:	e9 1c 08 00 00       	jmp    102928 <__alltraps>

0010210c <vector68>:
.globl vector68
vector68:
  pushl $0
  10210c:	6a 00                	push   $0x0
  pushl $68
  10210e:	6a 44                	push   $0x44
  jmp __alltraps
  102110:	e9 13 08 00 00       	jmp    102928 <__alltraps>

00102115 <vector69>:
.globl vector69
vector69:
  pushl $0
  102115:	6a 00                	push   $0x0
  pushl $69
  102117:	6a 45                	push   $0x45
  jmp __alltraps
  102119:	e9 0a 08 00 00       	jmp    102928 <__alltraps>

0010211e <vector70>:
.globl vector70
vector70:
  pushl $0
  10211e:	6a 00                	push   $0x0
  pushl $70
  102120:	6a 46                	push   $0x46
  jmp __alltraps
  102122:	e9 01 08 00 00       	jmp    102928 <__alltraps>

00102127 <vector71>:
.globl vector71
vector71:
  pushl $0
  102127:	6a 00                	push   $0x0
  pushl $71
  102129:	6a 47                	push   $0x47
  jmp __alltraps
  10212b:	e9 f8 07 00 00       	jmp    102928 <__alltraps>

00102130 <vector72>:
.globl vector72
vector72:
  pushl $0
  102130:	6a 00                	push   $0x0
  pushl $72
  102132:	6a 48                	push   $0x48
  jmp __alltraps
  102134:	e9 ef 07 00 00       	jmp    102928 <__alltraps>

00102139 <vector73>:
.globl vector73
vector73:
  pushl $0
  102139:	6a 00                	push   $0x0
  pushl $73
  10213b:	6a 49                	push   $0x49
  jmp __alltraps
  10213d:	e9 e6 07 00 00       	jmp    102928 <__alltraps>

00102142 <vector74>:
.globl vector74
vector74:
  pushl $0
  102142:	6a 00                	push   $0x0
  pushl $74
  102144:	6a 4a                	push   $0x4a
  jmp __alltraps
  102146:	e9 dd 07 00 00       	jmp    102928 <__alltraps>

0010214b <vector75>:
.globl vector75
vector75:
  pushl $0
  10214b:	6a 00                	push   $0x0
  pushl $75
  10214d:	6a 4b                	push   $0x4b
  jmp __alltraps
  10214f:	e9 d4 07 00 00       	jmp    102928 <__alltraps>

00102154 <vector76>:
.globl vector76
vector76:
  pushl $0
  102154:	6a 00                	push   $0x0
  pushl $76
  102156:	6a 4c                	push   $0x4c
  jmp __alltraps
  102158:	e9 cb 07 00 00       	jmp    102928 <__alltraps>

0010215d <vector77>:
.globl vector77
vector77:
  pushl $0
  10215d:	6a 00                	push   $0x0
  pushl $77
  10215f:	6a 4d                	push   $0x4d
  jmp __alltraps
  102161:	e9 c2 07 00 00       	jmp    102928 <__alltraps>

00102166 <vector78>:
.globl vector78
vector78:
  pushl $0
  102166:	6a 00                	push   $0x0
  pushl $78
  102168:	6a 4e                	push   $0x4e
  jmp __alltraps
  10216a:	e9 b9 07 00 00       	jmp    102928 <__alltraps>

0010216f <vector79>:
.globl vector79
vector79:
  pushl $0
  10216f:	6a 00                	push   $0x0
  pushl $79
  102171:	6a 4f                	push   $0x4f
  jmp __alltraps
  102173:	e9 b0 07 00 00       	jmp    102928 <__alltraps>

00102178 <vector80>:
.globl vector80
vector80:
  pushl $0
  102178:	6a 00                	push   $0x0
  pushl $80
  10217a:	6a 50                	push   $0x50
  jmp __alltraps
  10217c:	e9 a7 07 00 00       	jmp    102928 <__alltraps>

00102181 <vector81>:
.globl vector81
vector81:
  pushl $0
  102181:	6a 00                	push   $0x0
  pushl $81
  102183:	6a 51                	push   $0x51
  jmp __alltraps
  102185:	e9 9e 07 00 00       	jmp    102928 <__alltraps>

0010218a <vector82>:
.globl vector82
vector82:
  pushl $0
  10218a:	6a 00                	push   $0x0
  pushl $82
  10218c:	6a 52                	push   $0x52
  jmp __alltraps
  10218e:	e9 95 07 00 00       	jmp    102928 <__alltraps>

00102193 <vector83>:
.globl vector83
vector83:
  pushl $0
  102193:	6a 00                	push   $0x0
  pushl $83
  102195:	6a 53                	push   $0x53
  jmp __alltraps
  102197:	e9 8c 07 00 00       	jmp    102928 <__alltraps>

0010219c <vector84>:
.globl vector84
vector84:
  pushl $0
  10219c:	6a 00                	push   $0x0
  pushl $84
  10219e:	6a 54                	push   $0x54
  jmp __alltraps
  1021a0:	e9 83 07 00 00       	jmp    102928 <__alltraps>

001021a5 <vector85>:
.globl vector85
vector85:
  pushl $0
  1021a5:	6a 00                	push   $0x0
  pushl $85
  1021a7:	6a 55                	push   $0x55
  jmp __alltraps
  1021a9:	e9 7a 07 00 00       	jmp    102928 <__alltraps>

001021ae <vector86>:
.globl vector86
vector86:
  pushl $0
  1021ae:	6a 00                	push   $0x0
  pushl $86
  1021b0:	6a 56                	push   $0x56
  jmp __alltraps
  1021b2:	e9 71 07 00 00       	jmp    102928 <__alltraps>

001021b7 <vector87>:
.globl vector87
vector87:
  pushl $0
  1021b7:	6a 00                	push   $0x0
  pushl $87
  1021b9:	6a 57                	push   $0x57
  jmp __alltraps
  1021bb:	e9 68 07 00 00       	jmp    102928 <__alltraps>

001021c0 <vector88>:
.globl vector88
vector88:
  pushl $0
  1021c0:	6a 00                	push   $0x0
  pushl $88
  1021c2:	6a 58                	push   $0x58
  jmp __alltraps
  1021c4:	e9 5f 07 00 00       	jmp    102928 <__alltraps>

001021c9 <vector89>:
.globl vector89
vector89:
  pushl $0
  1021c9:	6a 00                	push   $0x0
  pushl $89
  1021cb:	6a 59                	push   $0x59
  jmp __alltraps
  1021cd:	e9 56 07 00 00       	jmp    102928 <__alltraps>

001021d2 <vector90>:
.globl vector90
vector90:
  pushl $0
  1021d2:	6a 00                	push   $0x0
  pushl $90
  1021d4:	6a 5a                	push   $0x5a
  jmp __alltraps
  1021d6:	e9 4d 07 00 00       	jmp    102928 <__alltraps>

001021db <vector91>:
.globl vector91
vector91:
  pushl $0
  1021db:	6a 00                	push   $0x0
  pushl $91
  1021dd:	6a 5b                	push   $0x5b
  jmp __alltraps
  1021df:	e9 44 07 00 00       	jmp    102928 <__alltraps>

001021e4 <vector92>:
.globl vector92
vector92:
  pushl $0
  1021e4:	6a 00                	push   $0x0
  pushl $92
  1021e6:	6a 5c                	push   $0x5c
  jmp __alltraps
  1021e8:	e9 3b 07 00 00       	jmp    102928 <__alltraps>

001021ed <vector93>:
.globl vector93
vector93:
  pushl $0
  1021ed:	6a 00                	push   $0x0
  pushl $93
  1021ef:	6a 5d                	push   $0x5d
  jmp __alltraps
  1021f1:	e9 32 07 00 00       	jmp    102928 <__alltraps>

001021f6 <vector94>:
.globl vector94
vector94:
  pushl $0
  1021f6:	6a 00                	push   $0x0
  pushl $94
  1021f8:	6a 5e                	push   $0x5e
  jmp __alltraps
  1021fa:	e9 29 07 00 00       	jmp    102928 <__alltraps>

001021ff <vector95>:
.globl vector95
vector95:
  pushl $0
  1021ff:	6a 00                	push   $0x0
  pushl $95
  102201:	6a 5f                	push   $0x5f
  jmp __alltraps
  102203:	e9 20 07 00 00       	jmp    102928 <__alltraps>

00102208 <vector96>:
.globl vector96
vector96:
  pushl $0
  102208:	6a 00                	push   $0x0
  pushl $96
  10220a:	6a 60                	push   $0x60
  jmp __alltraps
  10220c:	e9 17 07 00 00       	jmp    102928 <__alltraps>

00102211 <vector97>:
.globl vector97
vector97:
  pushl $0
  102211:	6a 00                	push   $0x0
  pushl $97
  102213:	6a 61                	push   $0x61
  jmp __alltraps
  102215:	e9 0e 07 00 00       	jmp    102928 <__alltraps>

0010221a <vector98>:
.globl vector98
vector98:
  pushl $0
  10221a:	6a 00                	push   $0x0
  pushl $98
  10221c:	6a 62                	push   $0x62
  jmp __alltraps
  10221e:	e9 05 07 00 00       	jmp    102928 <__alltraps>

00102223 <vector99>:
.globl vector99
vector99:
  pushl $0
  102223:	6a 00                	push   $0x0
  pushl $99
  102225:	6a 63                	push   $0x63
  jmp __alltraps
  102227:	e9 fc 06 00 00       	jmp    102928 <__alltraps>

0010222c <vector100>:
.globl vector100
vector100:
  pushl $0
  10222c:	6a 00                	push   $0x0
  pushl $100
  10222e:	6a 64                	push   $0x64
  jmp __alltraps
  102230:	e9 f3 06 00 00       	jmp    102928 <__alltraps>

00102235 <vector101>:
.globl vector101
vector101:
  pushl $0
  102235:	6a 00                	push   $0x0
  pushl $101
  102237:	6a 65                	push   $0x65
  jmp __alltraps
  102239:	e9 ea 06 00 00       	jmp    102928 <__alltraps>

0010223e <vector102>:
.globl vector102
vector102:
  pushl $0
  10223e:	6a 00                	push   $0x0
  pushl $102
  102240:	6a 66                	push   $0x66
  jmp __alltraps
  102242:	e9 e1 06 00 00       	jmp    102928 <__alltraps>

00102247 <vector103>:
.globl vector103
vector103:
  pushl $0
  102247:	6a 00                	push   $0x0
  pushl $103
  102249:	6a 67                	push   $0x67
  jmp __alltraps
  10224b:	e9 d8 06 00 00       	jmp    102928 <__alltraps>

00102250 <vector104>:
.globl vector104
vector104:
  pushl $0
  102250:	6a 00                	push   $0x0
  pushl $104
  102252:	6a 68                	push   $0x68
  jmp __alltraps
  102254:	e9 cf 06 00 00       	jmp    102928 <__alltraps>

00102259 <vector105>:
.globl vector105
vector105:
  pushl $0
  102259:	6a 00                	push   $0x0
  pushl $105
  10225b:	6a 69                	push   $0x69
  jmp __alltraps
  10225d:	e9 c6 06 00 00       	jmp    102928 <__alltraps>

00102262 <vector106>:
.globl vector106
vector106:
  pushl $0
  102262:	6a 00                	push   $0x0
  pushl $106
  102264:	6a 6a                	push   $0x6a
  jmp __alltraps
  102266:	e9 bd 06 00 00       	jmp    102928 <__alltraps>

0010226b <vector107>:
.globl vector107
vector107:
  pushl $0
  10226b:	6a 00                	push   $0x0
  pushl $107
  10226d:	6a 6b                	push   $0x6b
  jmp __alltraps
  10226f:	e9 b4 06 00 00       	jmp    102928 <__alltraps>

00102274 <vector108>:
.globl vector108
vector108:
  pushl $0
  102274:	6a 00                	push   $0x0
  pushl $108
  102276:	6a 6c                	push   $0x6c
  jmp __alltraps
  102278:	e9 ab 06 00 00       	jmp    102928 <__alltraps>

0010227d <vector109>:
.globl vector109
vector109:
  pushl $0
  10227d:	6a 00                	push   $0x0
  pushl $109
  10227f:	6a 6d                	push   $0x6d
  jmp __alltraps
  102281:	e9 a2 06 00 00       	jmp    102928 <__alltraps>

00102286 <vector110>:
.globl vector110
vector110:
  pushl $0
  102286:	6a 00                	push   $0x0
  pushl $110
  102288:	6a 6e                	push   $0x6e
  jmp __alltraps
  10228a:	e9 99 06 00 00       	jmp    102928 <__alltraps>

0010228f <vector111>:
.globl vector111
vector111:
  pushl $0
  10228f:	6a 00                	push   $0x0
  pushl $111
  102291:	6a 6f                	push   $0x6f
  jmp __alltraps
  102293:	e9 90 06 00 00       	jmp    102928 <__alltraps>

00102298 <vector112>:
.globl vector112
vector112:
  pushl $0
  102298:	6a 00                	push   $0x0
  pushl $112
  10229a:	6a 70                	push   $0x70
  jmp __alltraps
  10229c:	e9 87 06 00 00       	jmp    102928 <__alltraps>

001022a1 <vector113>:
.globl vector113
vector113:
  pushl $0
  1022a1:	6a 00                	push   $0x0
  pushl $113
  1022a3:	6a 71                	push   $0x71
  jmp __alltraps
  1022a5:	e9 7e 06 00 00       	jmp    102928 <__alltraps>

001022aa <vector114>:
.globl vector114
vector114:
  pushl $0
  1022aa:	6a 00                	push   $0x0
  pushl $114
  1022ac:	6a 72                	push   $0x72
  jmp __alltraps
  1022ae:	e9 75 06 00 00       	jmp    102928 <__alltraps>

001022b3 <vector115>:
.globl vector115
vector115:
  pushl $0
  1022b3:	6a 00                	push   $0x0
  pushl $115
  1022b5:	6a 73                	push   $0x73
  jmp __alltraps
  1022b7:	e9 6c 06 00 00       	jmp    102928 <__alltraps>

001022bc <vector116>:
.globl vector116
vector116:
  pushl $0
  1022bc:	6a 00                	push   $0x0
  pushl $116
  1022be:	6a 74                	push   $0x74
  jmp __alltraps
  1022c0:	e9 63 06 00 00       	jmp    102928 <__alltraps>

001022c5 <vector117>:
.globl vector117
vector117:
  pushl $0
  1022c5:	6a 00                	push   $0x0
  pushl $117
  1022c7:	6a 75                	push   $0x75
  jmp __alltraps
  1022c9:	e9 5a 06 00 00       	jmp    102928 <__alltraps>

001022ce <vector118>:
.globl vector118
vector118:
  pushl $0
  1022ce:	6a 00                	push   $0x0
  pushl $118
  1022d0:	6a 76                	push   $0x76
  jmp __alltraps
  1022d2:	e9 51 06 00 00       	jmp    102928 <__alltraps>

001022d7 <vector119>:
.globl vector119
vector119:
  pushl $0
  1022d7:	6a 00                	push   $0x0
  pushl $119
  1022d9:	6a 77                	push   $0x77
  jmp __alltraps
  1022db:	e9 48 06 00 00       	jmp    102928 <__alltraps>

001022e0 <vector120>:
.globl vector120
vector120:
  pushl $0
  1022e0:	6a 00                	push   $0x0
  pushl $120
  1022e2:	6a 78                	push   $0x78
  jmp __alltraps
  1022e4:	e9 3f 06 00 00       	jmp    102928 <__alltraps>

001022e9 <vector121>:
.globl vector121
vector121:
  pushl $0
  1022e9:	6a 00                	push   $0x0
  pushl $121
  1022eb:	6a 79                	push   $0x79
  jmp __alltraps
  1022ed:	e9 36 06 00 00       	jmp    102928 <__alltraps>

001022f2 <vector122>:
.globl vector122
vector122:
  pushl $0
  1022f2:	6a 00                	push   $0x0
  pushl $122
  1022f4:	6a 7a                	push   $0x7a
  jmp __alltraps
  1022f6:	e9 2d 06 00 00       	jmp    102928 <__alltraps>

001022fb <vector123>:
.globl vector123
vector123:
  pushl $0
  1022fb:	6a 00                	push   $0x0
  pushl $123
  1022fd:	6a 7b                	push   $0x7b
  jmp __alltraps
  1022ff:	e9 24 06 00 00       	jmp    102928 <__alltraps>

00102304 <vector124>:
.globl vector124
vector124:
  pushl $0
  102304:	6a 00                	push   $0x0
  pushl $124
  102306:	6a 7c                	push   $0x7c
  jmp __alltraps
  102308:	e9 1b 06 00 00       	jmp    102928 <__alltraps>

0010230d <vector125>:
.globl vector125
vector125:
  pushl $0
  10230d:	6a 00                	push   $0x0
  pushl $125
  10230f:	6a 7d                	push   $0x7d
  jmp __alltraps
  102311:	e9 12 06 00 00       	jmp    102928 <__alltraps>

00102316 <vector126>:
.globl vector126
vector126:
  pushl $0
  102316:	6a 00                	push   $0x0
  pushl $126
  102318:	6a 7e                	push   $0x7e
  jmp __alltraps
  10231a:	e9 09 06 00 00       	jmp    102928 <__alltraps>

0010231f <vector127>:
.globl vector127
vector127:
  pushl $0
  10231f:	6a 00                	push   $0x0
  pushl $127
  102321:	6a 7f                	push   $0x7f
  jmp __alltraps
  102323:	e9 00 06 00 00       	jmp    102928 <__alltraps>

00102328 <vector128>:
.globl vector128
vector128:
  pushl $0
  102328:	6a 00                	push   $0x0
  pushl $128
  10232a:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  10232f:	e9 f4 05 00 00       	jmp    102928 <__alltraps>

00102334 <vector129>:
.globl vector129
vector129:
  pushl $0
  102334:	6a 00                	push   $0x0
  pushl $129
  102336:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  10233b:	e9 e8 05 00 00       	jmp    102928 <__alltraps>

00102340 <vector130>:
.globl vector130
vector130:
  pushl $0
  102340:	6a 00                	push   $0x0
  pushl $130
  102342:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102347:	e9 dc 05 00 00       	jmp    102928 <__alltraps>

0010234c <vector131>:
.globl vector131
vector131:
  pushl $0
  10234c:	6a 00                	push   $0x0
  pushl $131
  10234e:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102353:	e9 d0 05 00 00       	jmp    102928 <__alltraps>

00102358 <vector132>:
.globl vector132
vector132:
  pushl $0
  102358:	6a 00                	push   $0x0
  pushl $132
  10235a:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  10235f:	e9 c4 05 00 00       	jmp    102928 <__alltraps>

00102364 <vector133>:
.globl vector133
vector133:
  pushl $0
  102364:	6a 00                	push   $0x0
  pushl $133
  102366:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  10236b:	e9 b8 05 00 00       	jmp    102928 <__alltraps>

00102370 <vector134>:
.globl vector134
vector134:
  pushl $0
  102370:	6a 00                	push   $0x0
  pushl $134
  102372:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102377:	e9 ac 05 00 00       	jmp    102928 <__alltraps>

0010237c <vector135>:
.globl vector135
vector135:
  pushl $0
  10237c:	6a 00                	push   $0x0
  pushl $135
  10237e:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102383:	e9 a0 05 00 00       	jmp    102928 <__alltraps>

00102388 <vector136>:
.globl vector136
vector136:
  pushl $0
  102388:	6a 00                	push   $0x0
  pushl $136
  10238a:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  10238f:	e9 94 05 00 00       	jmp    102928 <__alltraps>

00102394 <vector137>:
.globl vector137
vector137:
  pushl $0
  102394:	6a 00                	push   $0x0
  pushl $137
  102396:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  10239b:	e9 88 05 00 00       	jmp    102928 <__alltraps>

001023a0 <vector138>:
.globl vector138
vector138:
  pushl $0
  1023a0:	6a 00                	push   $0x0
  pushl $138
  1023a2:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1023a7:	e9 7c 05 00 00       	jmp    102928 <__alltraps>

001023ac <vector139>:
.globl vector139
vector139:
  pushl $0
  1023ac:	6a 00                	push   $0x0
  pushl $139
  1023ae:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1023b3:	e9 70 05 00 00       	jmp    102928 <__alltraps>

001023b8 <vector140>:
.globl vector140
vector140:
  pushl $0
  1023b8:	6a 00                	push   $0x0
  pushl $140
  1023ba:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1023bf:	e9 64 05 00 00       	jmp    102928 <__alltraps>

001023c4 <vector141>:
.globl vector141
vector141:
  pushl $0
  1023c4:	6a 00                	push   $0x0
  pushl $141
  1023c6:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1023cb:	e9 58 05 00 00       	jmp    102928 <__alltraps>

001023d0 <vector142>:
.globl vector142
vector142:
  pushl $0
  1023d0:	6a 00                	push   $0x0
  pushl $142
  1023d2:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1023d7:	e9 4c 05 00 00       	jmp    102928 <__alltraps>

001023dc <vector143>:
.globl vector143
vector143:
  pushl $0
  1023dc:	6a 00                	push   $0x0
  pushl $143
  1023de:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1023e3:	e9 40 05 00 00       	jmp    102928 <__alltraps>

001023e8 <vector144>:
.globl vector144
vector144:
  pushl $0
  1023e8:	6a 00                	push   $0x0
  pushl $144
  1023ea:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1023ef:	e9 34 05 00 00       	jmp    102928 <__alltraps>

001023f4 <vector145>:
.globl vector145
vector145:
  pushl $0
  1023f4:	6a 00                	push   $0x0
  pushl $145
  1023f6:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1023fb:	e9 28 05 00 00       	jmp    102928 <__alltraps>

00102400 <vector146>:
.globl vector146
vector146:
  pushl $0
  102400:	6a 00                	push   $0x0
  pushl $146
  102402:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102407:	e9 1c 05 00 00       	jmp    102928 <__alltraps>

0010240c <vector147>:
.globl vector147
vector147:
  pushl $0
  10240c:	6a 00                	push   $0x0
  pushl $147
  10240e:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102413:	e9 10 05 00 00       	jmp    102928 <__alltraps>

00102418 <vector148>:
.globl vector148
vector148:
  pushl $0
  102418:	6a 00                	push   $0x0
  pushl $148
  10241a:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  10241f:	e9 04 05 00 00       	jmp    102928 <__alltraps>

00102424 <vector149>:
.globl vector149
vector149:
  pushl $0
  102424:	6a 00                	push   $0x0
  pushl $149
  102426:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  10242b:	e9 f8 04 00 00       	jmp    102928 <__alltraps>

00102430 <vector150>:
.globl vector150
vector150:
  pushl $0
  102430:	6a 00                	push   $0x0
  pushl $150
  102432:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102437:	e9 ec 04 00 00       	jmp    102928 <__alltraps>

0010243c <vector151>:
.globl vector151
vector151:
  pushl $0
  10243c:	6a 00                	push   $0x0
  pushl $151
  10243e:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102443:	e9 e0 04 00 00       	jmp    102928 <__alltraps>

00102448 <vector152>:
.globl vector152
vector152:
  pushl $0
  102448:	6a 00                	push   $0x0
  pushl $152
  10244a:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  10244f:	e9 d4 04 00 00       	jmp    102928 <__alltraps>

00102454 <vector153>:
.globl vector153
vector153:
  pushl $0
  102454:	6a 00                	push   $0x0
  pushl $153
  102456:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  10245b:	e9 c8 04 00 00       	jmp    102928 <__alltraps>

00102460 <vector154>:
.globl vector154
vector154:
  pushl $0
  102460:	6a 00                	push   $0x0
  pushl $154
  102462:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102467:	e9 bc 04 00 00       	jmp    102928 <__alltraps>

0010246c <vector155>:
.globl vector155
vector155:
  pushl $0
  10246c:	6a 00                	push   $0x0
  pushl $155
  10246e:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102473:	e9 b0 04 00 00       	jmp    102928 <__alltraps>

00102478 <vector156>:
.globl vector156
vector156:
  pushl $0
  102478:	6a 00                	push   $0x0
  pushl $156
  10247a:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  10247f:	e9 a4 04 00 00       	jmp    102928 <__alltraps>

00102484 <vector157>:
.globl vector157
vector157:
  pushl $0
  102484:	6a 00                	push   $0x0
  pushl $157
  102486:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  10248b:	e9 98 04 00 00       	jmp    102928 <__alltraps>

00102490 <vector158>:
.globl vector158
vector158:
  pushl $0
  102490:	6a 00                	push   $0x0
  pushl $158
  102492:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  102497:	e9 8c 04 00 00       	jmp    102928 <__alltraps>

0010249c <vector159>:
.globl vector159
vector159:
  pushl $0
  10249c:	6a 00                	push   $0x0
  pushl $159
  10249e:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1024a3:	e9 80 04 00 00       	jmp    102928 <__alltraps>

001024a8 <vector160>:
.globl vector160
vector160:
  pushl $0
  1024a8:	6a 00                	push   $0x0
  pushl $160
  1024aa:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1024af:	e9 74 04 00 00       	jmp    102928 <__alltraps>

001024b4 <vector161>:
.globl vector161
vector161:
  pushl $0
  1024b4:	6a 00                	push   $0x0
  pushl $161
  1024b6:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1024bb:	e9 68 04 00 00       	jmp    102928 <__alltraps>

001024c0 <vector162>:
.globl vector162
vector162:
  pushl $0
  1024c0:	6a 00                	push   $0x0
  pushl $162
  1024c2:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1024c7:	e9 5c 04 00 00       	jmp    102928 <__alltraps>

001024cc <vector163>:
.globl vector163
vector163:
  pushl $0
  1024cc:	6a 00                	push   $0x0
  pushl $163
  1024ce:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1024d3:	e9 50 04 00 00       	jmp    102928 <__alltraps>

001024d8 <vector164>:
.globl vector164
vector164:
  pushl $0
  1024d8:	6a 00                	push   $0x0
  pushl $164
  1024da:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1024df:	e9 44 04 00 00       	jmp    102928 <__alltraps>

001024e4 <vector165>:
.globl vector165
vector165:
  pushl $0
  1024e4:	6a 00                	push   $0x0
  pushl $165
  1024e6:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1024eb:	e9 38 04 00 00       	jmp    102928 <__alltraps>

001024f0 <vector166>:
.globl vector166
vector166:
  pushl $0
  1024f0:	6a 00                	push   $0x0
  pushl $166
  1024f2:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1024f7:	e9 2c 04 00 00       	jmp    102928 <__alltraps>

001024fc <vector167>:
.globl vector167
vector167:
  pushl $0
  1024fc:	6a 00                	push   $0x0
  pushl $167
  1024fe:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102503:	e9 20 04 00 00       	jmp    102928 <__alltraps>

00102508 <vector168>:
.globl vector168
vector168:
  pushl $0
  102508:	6a 00                	push   $0x0
  pushl $168
  10250a:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  10250f:	e9 14 04 00 00       	jmp    102928 <__alltraps>

00102514 <vector169>:
.globl vector169
vector169:
  pushl $0
  102514:	6a 00                	push   $0x0
  pushl $169
  102516:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  10251b:	e9 08 04 00 00       	jmp    102928 <__alltraps>

00102520 <vector170>:
.globl vector170
vector170:
  pushl $0
  102520:	6a 00                	push   $0x0
  pushl $170
  102522:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102527:	e9 fc 03 00 00       	jmp    102928 <__alltraps>

0010252c <vector171>:
.globl vector171
vector171:
  pushl $0
  10252c:	6a 00                	push   $0x0
  pushl $171
  10252e:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102533:	e9 f0 03 00 00       	jmp    102928 <__alltraps>

00102538 <vector172>:
.globl vector172
vector172:
  pushl $0
  102538:	6a 00                	push   $0x0
  pushl $172
  10253a:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  10253f:	e9 e4 03 00 00       	jmp    102928 <__alltraps>

00102544 <vector173>:
.globl vector173
vector173:
  pushl $0
  102544:	6a 00                	push   $0x0
  pushl $173
  102546:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10254b:	e9 d8 03 00 00       	jmp    102928 <__alltraps>

00102550 <vector174>:
.globl vector174
vector174:
  pushl $0
  102550:	6a 00                	push   $0x0
  pushl $174
  102552:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102557:	e9 cc 03 00 00       	jmp    102928 <__alltraps>

0010255c <vector175>:
.globl vector175
vector175:
  pushl $0
  10255c:	6a 00                	push   $0x0
  pushl $175
  10255e:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102563:	e9 c0 03 00 00       	jmp    102928 <__alltraps>

00102568 <vector176>:
.globl vector176
vector176:
  pushl $0
  102568:	6a 00                	push   $0x0
  pushl $176
  10256a:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  10256f:	e9 b4 03 00 00       	jmp    102928 <__alltraps>

00102574 <vector177>:
.globl vector177
vector177:
  pushl $0
  102574:	6a 00                	push   $0x0
  pushl $177
  102576:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  10257b:	e9 a8 03 00 00       	jmp    102928 <__alltraps>

00102580 <vector178>:
.globl vector178
vector178:
  pushl $0
  102580:	6a 00                	push   $0x0
  pushl $178
  102582:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102587:	e9 9c 03 00 00       	jmp    102928 <__alltraps>

0010258c <vector179>:
.globl vector179
vector179:
  pushl $0
  10258c:	6a 00                	push   $0x0
  pushl $179
  10258e:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102593:	e9 90 03 00 00       	jmp    102928 <__alltraps>

00102598 <vector180>:
.globl vector180
vector180:
  pushl $0
  102598:	6a 00                	push   $0x0
  pushl $180
  10259a:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  10259f:	e9 84 03 00 00       	jmp    102928 <__alltraps>

001025a4 <vector181>:
.globl vector181
vector181:
  pushl $0
  1025a4:	6a 00                	push   $0x0
  pushl $181
  1025a6:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1025ab:	e9 78 03 00 00       	jmp    102928 <__alltraps>

001025b0 <vector182>:
.globl vector182
vector182:
  pushl $0
  1025b0:	6a 00                	push   $0x0
  pushl $182
  1025b2:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1025b7:	e9 6c 03 00 00       	jmp    102928 <__alltraps>

001025bc <vector183>:
.globl vector183
vector183:
  pushl $0
  1025bc:	6a 00                	push   $0x0
  pushl $183
  1025be:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1025c3:	e9 60 03 00 00       	jmp    102928 <__alltraps>

001025c8 <vector184>:
.globl vector184
vector184:
  pushl $0
  1025c8:	6a 00                	push   $0x0
  pushl $184
  1025ca:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1025cf:	e9 54 03 00 00       	jmp    102928 <__alltraps>

001025d4 <vector185>:
.globl vector185
vector185:
  pushl $0
  1025d4:	6a 00                	push   $0x0
  pushl $185
  1025d6:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1025db:	e9 48 03 00 00       	jmp    102928 <__alltraps>

001025e0 <vector186>:
.globl vector186
vector186:
  pushl $0
  1025e0:	6a 00                	push   $0x0
  pushl $186
  1025e2:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1025e7:	e9 3c 03 00 00       	jmp    102928 <__alltraps>

001025ec <vector187>:
.globl vector187
vector187:
  pushl $0
  1025ec:	6a 00                	push   $0x0
  pushl $187
  1025ee:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1025f3:	e9 30 03 00 00       	jmp    102928 <__alltraps>

001025f8 <vector188>:
.globl vector188
vector188:
  pushl $0
  1025f8:	6a 00                	push   $0x0
  pushl $188
  1025fa:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1025ff:	e9 24 03 00 00       	jmp    102928 <__alltraps>

00102604 <vector189>:
.globl vector189
vector189:
  pushl $0
  102604:	6a 00                	push   $0x0
  pushl $189
  102606:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  10260b:	e9 18 03 00 00       	jmp    102928 <__alltraps>

00102610 <vector190>:
.globl vector190
vector190:
  pushl $0
  102610:	6a 00                	push   $0x0
  pushl $190
  102612:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102617:	e9 0c 03 00 00       	jmp    102928 <__alltraps>

0010261c <vector191>:
.globl vector191
vector191:
  pushl $0
  10261c:	6a 00                	push   $0x0
  pushl $191
  10261e:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102623:	e9 00 03 00 00       	jmp    102928 <__alltraps>

00102628 <vector192>:
.globl vector192
vector192:
  pushl $0
  102628:	6a 00                	push   $0x0
  pushl $192
  10262a:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  10262f:	e9 f4 02 00 00       	jmp    102928 <__alltraps>

00102634 <vector193>:
.globl vector193
vector193:
  pushl $0
  102634:	6a 00                	push   $0x0
  pushl $193
  102636:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10263b:	e9 e8 02 00 00       	jmp    102928 <__alltraps>

00102640 <vector194>:
.globl vector194
vector194:
  pushl $0
  102640:	6a 00                	push   $0x0
  pushl $194
  102642:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102647:	e9 dc 02 00 00       	jmp    102928 <__alltraps>

0010264c <vector195>:
.globl vector195
vector195:
  pushl $0
  10264c:	6a 00                	push   $0x0
  pushl $195
  10264e:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102653:	e9 d0 02 00 00       	jmp    102928 <__alltraps>

00102658 <vector196>:
.globl vector196
vector196:
  pushl $0
  102658:	6a 00                	push   $0x0
  pushl $196
  10265a:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  10265f:	e9 c4 02 00 00       	jmp    102928 <__alltraps>

00102664 <vector197>:
.globl vector197
vector197:
  pushl $0
  102664:	6a 00                	push   $0x0
  pushl $197
  102666:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  10266b:	e9 b8 02 00 00       	jmp    102928 <__alltraps>

00102670 <vector198>:
.globl vector198
vector198:
  pushl $0
  102670:	6a 00                	push   $0x0
  pushl $198
  102672:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102677:	e9 ac 02 00 00       	jmp    102928 <__alltraps>

0010267c <vector199>:
.globl vector199
vector199:
  pushl $0
  10267c:	6a 00                	push   $0x0
  pushl $199
  10267e:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102683:	e9 a0 02 00 00       	jmp    102928 <__alltraps>

00102688 <vector200>:
.globl vector200
vector200:
  pushl $0
  102688:	6a 00                	push   $0x0
  pushl $200
  10268a:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  10268f:	e9 94 02 00 00       	jmp    102928 <__alltraps>

00102694 <vector201>:
.globl vector201
vector201:
  pushl $0
  102694:	6a 00                	push   $0x0
  pushl $201
  102696:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  10269b:	e9 88 02 00 00       	jmp    102928 <__alltraps>

001026a0 <vector202>:
.globl vector202
vector202:
  pushl $0
  1026a0:	6a 00                	push   $0x0
  pushl $202
  1026a2:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1026a7:	e9 7c 02 00 00       	jmp    102928 <__alltraps>

001026ac <vector203>:
.globl vector203
vector203:
  pushl $0
  1026ac:	6a 00                	push   $0x0
  pushl $203
  1026ae:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1026b3:	e9 70 02 00 00       	jmp    102928 <__alltraps>

001026b8 <vector204>:
.globl vector204
vector204:
  pushl $0
  1026b8:	6a 00                	push   $0x0
  pushl $204
  1026ba:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1026bf:	e9 64 02 00 00       	jmp    102928 <__alltraps>

001026c4 <vector205>:
.globl vector205
vector205:
  pushl $0
  1026c4:	6a 00                	push   $0x0
  pushl $205
  1026c6:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1026cb:	e9 58 02 00 00       	jmp    102928 <__alltraps>

001026d0 <vector206>:
.globl vector206
vector206:
  pushl $0
  1026d0:	6a 00                	push   $0x0
  pushl $206
  1026d2:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1026d7:	e9 4c 02 00 00       	jmp    102928 <__alltraps>

001026dc <vector207>:
.globl vector207
vector207:
  pushl $0
  1026dc:	6a 00                	push   $0x0
  pushl $207
  1026de:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1026e3:	e9 40 02 00 00       	jmp    102928 <__alltraps>

001026e8 <vector208>:
.globl vector208
vector208:
  pushl $0
  1026e8:	6a 00                	push   $0x0
  pushl $208
  1026ea:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1026ef:	e9 34 02 00 00       	jmp    102928 <__alltraps>

001026f4 <vector209>:
.globl vector209
vector209:
  pushl $0
  1026f4:	6a 00                	push   $0x0
  pushl $209
  1026f6:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1026fb:	e9 28 02 00 00       	jmp    102928 <__alltraps>

00102700 <vector210>:
.globl vector210
vector210:
  pushl $0
  102700:	6a 00                	push   $0x0
  pushl $210
  102702:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102707:	e9 1c 02 00 00       	jmp    102928 <__alltraps>

0010270c <vector211>:
.globl vector211
vector211:
  pushl $0
  10270c:	6a 00                	push   $0x0
  pushl $211
  10270e:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102713:	e9 10 02 00 00       	jmp    102928 <__alltraps>

00102718 <vector212>:
.globl vector212
vector212:
  pushl $0
  102718:	6a 00                	push   $0x0
  pushl $212
  10271a:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  10271f:	e9 04 02 00 00       	jmp    102928 <__alltraps>

00102724 <vector213>:
.globl vector213
vector213:
  pushl $0
  102724:	6a 00                	push   $0x0
  pushl $213
  102726:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  10272b:	e9 f8 01 00 00       	jmp    102928 <__alltraps>

00102730 <vector214>:
.globl vector214
vector214:
  pushl $0
  102730:	6a 00                	push   $0x0
  pushl $214
  102732:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102737:	e9 ec 01 00 00       	jmp    102928 <__alltraps>

0010273c <vector215>:
.globl vector215
vector215:
  pushl $0
  10273c:	6a 00                	push   $0x0
  pushl $215
  10273e:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102743:	e9 e0 01 00 00       	jmp    102928 <__alltraps>

00102748 <vector216>:
.globl vector216
vector216:
  pushl $0
  102748:	6a 00                	push   $0x0
  pushl $216
  10274a:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  10274f:	e9 d4 01 00 00       	jmp    102928 <__alltraps>

00102754 <vector217>:
.globl vector217
vector217:
  pushl $0
  102754:	6a 00                	push   $0x0
  pushl $217
  102756:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  10275b:	e9 c8 01 00 00       	jmp    102928 <__alltraps>

00102760 <vector218>:
.globl vector218
vector218:
  pushl $0
  102760:	6a 00                	push   $0x0
  pushl $218
  102762:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102767:	e9 bc 01 00 00       	jmp    102928 <__alltraps>

0010276c <vector219>:
.globl vector219
vector219:
  pushl $0
  10276c:	6a 00                	push   $0x0
  pushl $219
  10276e:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102773:	e9 b0 01 00 00       	jmp    102928 <__alltraps>

00102778 <vector220>:
.globl vector220
vector220:
  pushl $0
  102778:	6a 00                	push   $0x0
  pushl $220
  10277a:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  10277f:	e9 a4 01 00 00       	jmp    102928 <__alltraps>

00102784 <vector221>:
.globl vector221
vector221:
  pushl $0
  102784:	6a 00                	push   $0x0
  pushl $221
  102786:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  10278b:	e9 98 01 00 00       	jmp    102928 <__alltraps>

00102790 <vector222>:
.globl vector222
vector222:
  pushl $0
  102790:	6a 00                	push   $0x0
  pushl $222
  102792:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102797:	e9 8c 01 00 00       	jmp    102928 <__alltraps>

0010279c <vector223>:
.globl vector223
vector223:
  pushl $0
  10279c:	6a 00                	push   $0x0
  pushl $223
  10279e:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1027a3:	e9 80 01 00 00       	jmp    102928 <__alltraps>

001027a8 <vector224>:
.globl vector224
vector224:
  pushl $0
  1027a8:	6a 00                	push   $0x0
  pushl $224
  1027aa:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1027af:	e9 74 01 00 00       	jmp    102928 <__alltraps>

001027b4 <vector225>:
.globl vector225
vector225:
  pushl $0
  1027b4:	6a 00                	push   $0x0
  pushl $225
  1027b6:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1027bb:	e9 68 01 00 00       	jmp    102928 <__alltraps>

001027c0 <vector226>:
.globl vector226
vector226:
  pushl $0
  1027c0:	6a 00                	push   $0x0
  pushl $226
  1027c2:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1027c7:	e9 5c 01 00 00       	jmp    102928 <__alltraps>

001027cc <vector227>:
.globl vector227
vector227:
  pushl $0
  1027cc:	6a 00                	push   $0x0
  pushl $227
  1027ce:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1027d3:	e9 50 01 00 00       	jmp    102928 <__alltraps>

001027d8 <vector228>:
.globl vector228
vector228:
  pushl $0
  1027d8:	6a 00                	push   $0x0
  pushl $228
  1027da:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1027df:	e9 44 01 00 00       	jmp    102928 <__alltraps>

001027e4 <vector229>:
.globl vector229
vector229:
  pushl $0
  1027e4:	6a 00                	push   $0x0
  pushl $229
  1027e6:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1027eb:	e9 38 01 00 00       	jmp    102928 <__alltraps>

001027f0 <vector230>:
.globl vector230
vector230:
  pushl $0
  1027f0:	6a 00                	push   $0x0
  pushl $230
  1027f2:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1027f7:	e9 2c 01 00 00       	jmp    102928 <__alltraps>

001027fc <vector231>:
.globl vector231
vector231:
  pushl $0
  1027fc:	6a 00                	push   $0x0
  pushl $231
  1027fe:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102803:	e9 20 01 00 00       	jmp    102928 <__alltraps>

00102808 <vector232>:
.globl vector232
vector232:
  pushl $0
  102808:	6a 00                	push   $0x0
  pushl $232
  10280a:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  10280f:	e9 14 01 00 00       	jmp    102928 <__alltraps>

00102814 <vector233>:
.globl vector233
vector233:
  pushl $0
  102814:	6a 00                	push   $0x0
  pushl $233
  102816:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  10281b:	e9 08 01 00 00       	jmp    102928 <__alltraps>

00102820 <vector234>:
.globl vector234
vector234:
  pushl $0
  102820:	6a 00                	push   $0x0
  pushl $234
  102822:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102827:	e9 fc 00 00 00       	jmp    102928 <__alltraps>

0010282c <vector235>:
.globl vector235
vector235:
  pushl $0
  10282c:	6a 00                	push   $0x0
  pushl $235
  10282e:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102833:	e9 f0 00 00 00       	jmp    102928 <__alltraps>

00102838 <vector236>:
.globl vector236
vector236:
  pushl $0
  102838:	6a 00                	push   $0x0
  pushl $236
  10283a:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  10283f:	e9 e4 00 00 00       	jmp    102928 <__alltraps>

00102844 <vector237>:
.globl vector237
vector237:
  pushl $0
  102844:	6a 00                	push   $0x0
  pushl $237
  102846:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  10284b:	e9 d8 00 00 00       	jmp    102928 <__alltraps>

00102850 <vector238>:
.globl vector238
vector238:
  pushl $0
  102850:	6a 00                	push   $0x0
  pushl $238
  102852:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102857:	e9 cc 00 00 00       	jmp    102928 <__alltraps>

0010285c <vector239>:
.globl vector239
vector239:
  pushl $0
  10285c:	6a 00                	push   $0x0
  pushl $239
  10285e:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102863:	e9 c0 00 00 00       	jmp    102928 <__alltraps>

00102868 <vector240>:
.globl vector240
vector240:
  pushl $0
  102868:	6a 00                	push   $0x0
  pushl $240
  10286a:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  10286f:	e9 b4 00 00 00       	jmp    102928 <__alltraps>

00102874 <vector241>:
.globl vector241
vector241:
  pushl $0
  102874:	6a 00                	push   $0x0
  pushl $241
  102876:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  10287b:	e9 a8 00 00 00       	jmp    102928 <__alltraps>

00102880 <vector242>:
.globl vector242
vector242:
  pushl $0
  102880:	6a 00                	push   $0x0
  pushl $242
  102882:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102887:	e9 9c 00 00 00       	jmp    102928 <__alltraps>

0010288c <vector243>:
.globl vector243
vector243:
  pushl $0
  10288c:	6a 00                	push   $0x0
  pushl $243
  10288e:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102893:	e9 90 00 00 00       	jmp    102928 <__alltraps>

00102898 <vector244>:
.globl vector244
vector244:
  pushl $0
  102898:	6a 00                	push   $0x0
  pushl $244
  10289a:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  10289f:	e9 84 00 00 00       	jmp    102928 <__alltraps>

001028a4 <vector245>:
.globl vector245
vector245:
  pushl $0
  1028a4:	6a 00                	push   $0x0
  pushl $245
  1028a6:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1028ab:	e9 78 00 00 00       	jmp    102928 <__alltraps>

001028b0 <vector246>:
.globl vector246
vector246:
  pushl $0
  1028b0:	6a 00                	push   $0x0
  pushl $246
  1028b2:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1028b7:	e9 6c 00 00 00       	jmp    102928 <__alltraps>

001028bc <vector247>:
.globl vector247
vector247:
  pushl $0
  1028bc:	6a 00                	push   $0x0
  pushl $247
  1028be:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1028c3:	e9 60 00 00 00       	jmp    102928 <__alltraps>

001028c8 <vector248>:
.globl vector248
vector248:
  pushl $0
  1028c8:	6a 00                	push   $0x0
  pushl $248
  1028ca:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1028cf:	e9 54 00 00 00       	jmp    102928 <__alltraps>

001028d4 <vector249>:
.globl vector249
vector249:
  pushl $0
  1028d4:	6a 00                	push   $0x0
  pushl $249
  1028d6:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1028db:	e9 48 00 00 00       	jmp    102928 <__alltraps>

001028e0 <vector250>:
.globl vector250
vector250:
  pushl $0
  1028e0:	6a 00                	push   $0x0
  pushl $250
  1028e2:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1028e7:	e9 3c 00 00 00       	jmp    102928 <__alltraps>

001028ec <vector251>:
.globl vector251
vector251:
  pushl $0
  1028ec:	6a 00                	push   $0x0
  pushl $251
  1028ee:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1028f3:	e9 30 00 00 00       	jmp    102928 <__alltraps>

001028f8 <vector252>:
.globl vector252
vector252:
  pushl $0
  1028f8:	6a 00                	push   $0x0
  pushl $252
  1028fa:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  1028ff:	e9 24 00 00 00       	jmp    102928 <__alltraps>

00102904 <vector253>:
.globl vector253
vector253:
  pushl $0
  102904:	6a 00                	push   $0x0
  pushl $253
  102906:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  10290b:	e9 18 00 00 00       	jmp    102928 <__alltraps>

00102910 <vector254>:
.globl vector254
vector254:
  pushl $0
  102910:	6a 00                	push   $0x0
  pushl $254
  102912:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102917:	e9 0c 00 00 00       	jmp    102928 <__alltraps>

0010291c <vector255>:
.globl vector255
vector255:
  pushl $0
  10291c:	6a 00                	push   $0x0
  pushl $255
  10291e:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102923:	e9 00 00 00 00       	jmp    102928 <__alltraps>

00102928 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  102928:	1e                   	push   %ds
    pushl %es
  102929:	06                   	push   %es
    pushl %fs
  10292a:	0f a0                	push   %fs
    pushl %gs
  10292c:	0f a8                	push   %gs
    pushal						#把所有通用寄存器压入栈中
  10292e:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax				#内核数据段的selector
  10292f:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  102934:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102936:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102938:	54                   	push   %esp

    # call trap(tf), where tf=%esp			#tf指针指向这个栈，然后栈内容会填充trapframe结构体
    call trap
  102939:	e8 63 f5 ff ff       	call   101ea1 <trap>

    # pop the pushed stack pointer
    popl %esp
  10293e:	5c                   	pop    %esp

0010293f <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  10293f:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102940:	0f a9                	pop    %gs
    popl %fs
  102942:	0f a1                	pop    %fs
    popl %es
  102944:	07                   	pop    %es
    popl %ds
  102945:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102946:	83 c4 08             	add    $0x8,%esp
    iret
  102949:	cf                   	iret   

0010294a <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  10294a:	55                   	push   %ebp
  10294b:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  10294d:	8b 45 08             	mov    0x8(%ebp),%eax
  102950:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102953:	b8 23 00 00 00       	mov    $0x23,%eax
  102958:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  10295a:	b8 23 00 00 00       	mov    $0x23,%eax
  10295f:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102961:	b8 10 00 00 00       	mov    $0x10,%eax
  102966:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102968:	b8 10 00 00 00       	mov    $0x10,%eax
  10296d:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  10296f:	b8 10 00 00 00       	mov    $0x10,%eax
  102974:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102976:	ea 7d 29 10 00 08 00 	ljmp   $0x8,$0x10297d
}
  10297d:	90                   	nop
  10297e:	5d                   	pop    %ebp
  10297f:	c3                   	ret    

00102980 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102980:	55                   	push   %ebp
  102981:	89 e5                	mov    %esp,%ebp
  102983:	83 ec 10             	sub    $0x10,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102986:	b8 80 f9 10 00       	mov    $0x10f980,%eax
  10298b:	05 00 04 00 00       	add    $0x400,%eax
  102990:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  102995:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  10299c:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  10299e:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  1029a5:	68 00 
  1029a7:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1029ac:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  1029b2:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1029b7:	c1 e8 10             	shr    $0x10,%eax
  1029ba:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  1029bf:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029c6:	83 e0 f0             	and    $0xfffffff0,%eax
  1029c9:	83 c8 09             	or     $0x9,%eax
  1029cc:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029d1:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029d8:	83 c8 10             	or     $0x10,%eax
  1029db:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029e0:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029e7:	83 e0 9f             	and    $0xffffff9f,%eax
  1029ea:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029ef:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029f6:	83 c8 80             	or     $0xffffff80,%eax
  1029f9:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029fe:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a05:	83 e0 f0             	and    $0xfffffff0,%eax
  102a08:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a0d:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a14:	83 e0 ef             	and    $0xffffffef,%eax
  102a17:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a1c:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a23:	83 e0 df             	and    $0xffffffdf,%eax
  102a26:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a2b:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a32:	83 c8 40             	or     $0x40,%eax
  102a35:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a3a:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a41:	83 e0 7f             	and    $0x7f,%eax
  102a44:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a49:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102a4e:	c1 e8 18             	shr    $0x18,%eax
  102a51:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102a56:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a5d:	83 e0 ef             	and    $0xffffffef,%eax
  102a60:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102a65:	68 10 ea 10 00       	push   $0x10ea10
  102a6a:	e8 db fe ff ff       	call   10294a <lgdt>
  102a6f:	83 c4 04             	add    $0x4,%esp
  102a72:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102a78:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102a7c:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102a7f:	90                   	nop
  102a80:	c9                   	leave  
  102a81:	c3                   	ret    

00102a82 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102a82:	55                   	push   %ebp
  102a83:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102a85:	e8 f6 fe ff ff       	call   102980 <gdt_init>
}
  102a8a:	90                   	nop
  102a8b:	5d                   	pop    %ebp
  102a8c:	c3                   	ret    

00102a8d <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102a8d:	55                   	push   %ebp
  102a8e:	89 e5                	mov    %esp,%ebp
  102a90:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102a93:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102a9a:	eb 04                	jmp    102aa0 <strlen+0x13>
        cnt ++;
  102a9c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  102aa0:	8b 45 08             	mov    0x8(%ebp),%eax
  102aa3:	8d 50 01             	lea    0x1(%eax),%edx
  102aa6:	89 55 08             	mov    %edx,0x8(%ebp)
  102aa9:	0f b6 00             	movzbl (%eax),%eax
  102aac:	84 c0                	test   %al,%al
  102aae:	75 ec                	jne    102a9c <strlen+0xf>
        cnt ++;
    }
    return cnt;
  102ab0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102ab3:	c9                   	leave  
  102ab4:	c3                   	ret    

00102ab5 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102ab5:	55                   	push   %ebp
  102ab6:	89 e5                	mov    %esp,%ebp
  102ab8:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102abb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102ac2:	eb 04                	jmp    102ac8 <strnlen+0x13>
        cnt ++;
  102ac4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  102ac8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102acb:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102ace:	73 10                	jae    102ae0 <strnlen+0x2b>
  102ad0:	8b 45 08             	mov    0x8(%ebp),%eax
  102ad3:	8d 50 01             	lea    0x1(%eax),%edx
  102ad6:	89 55 08             	mov    %edx,0x8(%ebp)
  102ad9:	0f b6 00             	movzbl (%eax),%eax
  102adc:	84 c0                	test   %al,%al
  102ade:	75 e4                	jne    102ac4 <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  102ae0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102ae3:	c9                   	leave  
  102ae4:	c3                   	ret    

00102ae5 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102ae5:	55                   	push   %ebp
  102ae6:	89 e5                	mov    %esp,%ebp
  102ae8:	57                   	push   %edi
  102ae9:	56                   	push   %esi
  102aea:	83 ec 20             	sub    $0x20,%esp
  102aed:	8b 45 08             	mov    0x8(%ebp),%eax
  102af0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102af3:	8b 45 0c             	mov    0xc(%ebp),%eax
  102af6:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102af9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102afc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102aff:	89 d1                	mov    %edx,%ecx
  102b01:	89 c2                	mov    %eax,%edx
  102b03:	89 ce                	mov    %ecx,%esi
  102b05:	89 d7                	mov    %edx,%edi
  102b07:	ac                   	lods   %ds:(%esi),%al
  102b08:	aa                   	stos   %al,%es:(%edi)
  102b09:	84 c0                	test   %al,%al
  102b0b:	75 fa                	jne    102b07 <strcpy+0x22>
  102b0d:	89 fa                	mov    %edi,%edx
  102b0f:	89 f1                	mov    %esi,%ecx
  102b11:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102b14:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102b17:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102b1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
  102b1d:	90                   	nop
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102b1e:	83 c4 20             	add    $0x20,%esp
  102b21:	5e                   	pop    %esi
  102b22:	5f                   	pop    %edi
  102b23:	5d                   	pop    %ebp
  102b24:	c3                   	ret    

00102b25 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102b25:	55                   	push   %ebp
  102b26:	89 e5                	mov    %esp,%ebp
  102b28:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102b2b:	8b 45 08             	mov    0x8(%ebp),%eax
  102b2e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102b31:	eb 21                	jmp    102b54 <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  102b33:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b36:	0f b6 10             	movzbl (%eax),%edx
  102b39:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b3c:	88 10                	mov    %dl,(%eax)
  102b3e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b41:	0f b6 00             	movzbl (%eax),%eax
  102b44:	84 c0                	test   %al,%al
  102b46:	74 04                	je     102b4c <strncpy+0x27>
            src ++;
  102b48:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  102b4c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102b50:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  102b54:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b58:	75 d9                	jne    102b33 <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  102b5a:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102b5d:	c9                   	leave  
  102b5e:	c3                   	ret    

00102b5f <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102b5f:	55                   	push   %ebp
  102b60:	89 e5                	mov    %esp,%ebp
  102b62:	57                   	push   %edi
  102b63:	56                   	push   %esi
  102b64:	83 ec 20             	sub    $0x20,%esp
  102b67:	8b 45 08             	mov    0x8(%ebp),%eax
  102b6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b6d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b70:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  102b73:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102b76:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b79:	89 d1                	mov    %edx,%ecx
  102b7b:	89 c2                	mov    %eax,%edx
  102b7d:	89 ce                	mov    %ecx,%esi
  102b7f:	89 d7                	mov    %edx,%edi
  102b81:	ac                   	lods   %ds:(%esi),%al
  102b82:	ae                   	scas   %es:(%edi),%al
  102b83:	75 08                	jne    102b8d <strcmp+0x2e>
  102b85:	84 c0                	test   %al,%al
  102b87:	75 f8                	jne    102b81 <strcmp+0x22>
  102b89:	31 c0                	xor    %eax,%eax
  102b8b:	eb 04                	jmp    102b91 <strcmp+0x32>
  102b8d:	19 c0                	sbb    %eax,%eax
  102b8f:	0c 01                	or     $0x1,%al
  102b91:	89 fa                	mov    %edi,%edx
  102b93:	89 f1                	mov    %esi,%ecx
  102b95:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102b98:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102b9b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  102b9e:	8b 45 ec             	mov    -0x14(%ebp),%eax
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
  102ba1:	90                   	nop
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102ba2:	83 c4 20             	add    $0x20,%esp
  102ba5:	5e                   	pop    %esi
  102ba6:	5f                   	pop    %edi
  102ba7:	5d                   	pop    %ebp
  102ba8:	c3                   	ret    

00102ba9 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102ba9:	55                   	push   %ebp
  102baa:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102bac:	eb 0c                	jmp    102bba <strncmp+0x11>
        n --, s1 ++, s2 ++;
  102bae:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102bb2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102bb6:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102bba:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bbe:	74 1a                	je     102bda <strncmp+0x31>
  102bc0:	8b 45 08             	mov    0x8(%ebp),%eax
  102bc3:	0f b6 00             	movzbl (%eax),%eax
  102bc6:	84 c0                	test   %al,%al
  102bc8:	74 10                	je     102bda <strncmp+0x31>
  102bca:	8b 45 08             	mov    0x8(%ebp),%eax
  102bcd:	0f b6 10             	movzbl (%eax),%edx
  102bd0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bd3:	0f b6 00             	movzbl (%eax),%eax
  102bd6:	38 c2                	cmp    %al,%dl
  102bd8:	74 d4                	je     102bae <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102bda:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bde:	74 18                	je     102bf8 <strncmp+0x4f>
  102be0:	8b 45 08             	mov    0x8(%ebp),%eax
  102be3:	0f b6 00             	movzbl (%eax),%eax
  102be6:	0f b6 d0             	movzbl %al,%edx
  102be9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bec:	0f b6 00             	movzbl (%eax),%eax
  102bef:	0f b6 c0             	movzbl %al,%eax
  102bf2:	29 c2                	sub    %eax,%edx
  102bf4:	89 d0                	mov    %edx,%eax
  102bf6:	eb 05                	jmp    102bfd <strncmp+0x54>
  102bf8:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102bfd:	5d                   	pop    %ebp
  102bfe:	c3                   	ret    

00102bff <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102bff:	55                   	push   %ebp
  102c00:	89 e5                	mov    %esp,%ebp
  102c02:	83 ec 04             	sub    $0x4,%esp
  102c05:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c08:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c0b:	eb 14                	jmp    102c21 <strchr+0x22>
        if (*s == c) {
  102c0d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c10:	0f b6 00             	movzbl (%eax),%eax
  102c13:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102c16:	75 05                	jne    102c1d <strchr+0x1e>
            return (char *)s;
  102c18:	8b 45 08             	mov    0x8(%ebp),%eax
  102c1b:	eb 13                	jmp    102c30 <strchr+0x31>
        }
        s ++;
  102c1d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  102c21:	8b 45 08             	mov    0x8(%ebp),%eax
  102c24:	0f b6 00             	movzbl (%eax),%eax
  102c27:	84 c0                	test   %al,%al
  102c29:	75 e2                	jne    102c0d <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  102c2b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c30:	c9                   	leave  
  102c31:	c3                   	ret    

00102c32 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102c32:	55                   	push   %ebp
  102c33:	89 e5                	mov    %esp,%ebp
  102c35:	83 ec 04             	sub    $0x4,%esp
  102c38:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c3b:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c3e:	eb 0f                	jmp    102c4f <strfind+0x1d>
        if (*s == c) {
  102c40:	8b 45 08             	mov    0x8(%ebp),%eax
  102c43:	0f b6 00             	movzbl (%eax),%eax
  102c46:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102c49:	74 10                	je     102c5b <strfind+0x29>
            break;
        }
        s ++;
  102c4b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  102c4f:	8b 45 08             	mov    0x8(%ebp),%eax
  102c52:	0f b6 00             	movzbl (%eax),%eax
  102c55:	84 c0                	test   %al,%al
  102c57:	75 e7                	jne    102c40 <strfind+0xe>
  102c59:	eb 01                	jmp    102c5c <strfind+0x2a>
        if (*s == c) {
            break;
  102c5b:	90                   	nop
        }
        s ++;
    }
    return (char *)s;
  102c5c:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102c5f:	c9                   	leave  
  102c60:	c3                   	ret    

00102c61 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102c61:	55                   	push   %ebp
  102c62:	89 e5                	mov    %esp,%ebp
  102c64:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102c67:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102c6e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102c75:	eb 04                	jmp    102c7b <strtol+0x1a>
        s ++;
  102c77:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102c7b:	8b 45 08             	mov    0x8(%ebp),%eax
  102c7e:	0f b6 00             	movzbl (%eax),%eax
  102c81:	3c 20                	cmp    $0x20,%al
  102c83:	74 f2                	je     102c77 <strtol+0x16>
  102c85:	8b 45 08             	mov    0x8(%ebp),%eax
  102c88:	0f b6 00             	movzbl (%eax),%eax
  102c8b:	3c 09                	cmp    $0x9,%al
  102c8d:	74 e8                	je     102c77 <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  102c8f:	8b 45 08             	mov    0x8(%ebp),%eax
  102c92:	0f b6 00             	movzbl (%eax),%eax
  102c95:	3c 2b                	cmp    $0x2b,%al
  102c97:	75 06                	jne    102c9f <strtol+0x3e>
        s ++;
  102c99:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102c9d:	eb 15                	jmp    102cb4 <strtol+0x53>
    }
    else if (*s == '-') {
  102c9f:	8b 45 08             	mov    0x8(%ebp),%eax
  102ca2:	0f b6 00             	movzbl (%eax),%eax
  102ca5:	3c 2d                	cmp    $0x2d,%al
  102ca7:	75 0b                	jne    102cb4 <strtol+0x53>
        s ++, neg = 1;
  102ca9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102cad:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102cb4:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102cb8:	74 06                	je     102cc0 <strtol+0x5f>
  102cba:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102cbe:	75 24                	jne    102ce4 <strtol+0x83>
  102cc0:	8b 45 08             	mov    0x8(%ebp),%eax
  102cc3:	0f b6 00             	movzbl (%eax),%eax
  102cc6:	3c 30                	cmp    $0x30,%al
  102cc8:	75 1a                	jne    102ce4 <strtol+0x83>
  102cca:	8b 45 08             	mov    0x8(%ebp),%eax
  102ccd:	83 c0 01             	add    $0x1,%eax
  102cd0:	0f b6 00             	movzbl (%eax),%eax
  102cd3:	3c 78                	cmp    $0x78,%al
  102cd5:	75 0d                	jne    102ce4 <strtol+0x83>
        s += 2, base = 16;
  102cd7:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102cdb:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102ce2:	eb 2a                	jmp    102d0e <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  102ce4:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102ce8:	75 17                	jne    102d01 <strtol+0xa0>
  102cea:	8b 45 08             	mov    0x8(%ebp),%eax
  102ced:	0f b6 00             	movzbl (%eax),%eax
  102cf0:	3c 30                	cmp    $0x30,%al
  102cf2:	75 0d                	jne    102d01 <strtol+0xa0>
        s ++, base = 8;
  102cf4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102cf8:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102cff:	eb 0d                	jmp    102d0e <strtol+0xad>
    }
    else if (base == 0) {
  102d01:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d05:	75 07                	jne    102d0e <strtol+0xad>
        base = 10;
  102d07:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102d0e:	8b 45 08             	mov    0x8(%ebp),%eax
  102d11:	0f b6 00             	movzbl (%eax),%eax
  102d14:	3c 2f                	cmp    $0x2f,%al
  102d16:	7e 1b                	jle    102d33 <strtol+0xd2>
  102d18:	8b 45 08             	mov    0x8(%ebp),%eax
  102d1b:	0f b6 00             	movzbl (%eax),%eax
  102d1e:	3c 39                	cmp    $0x39,%al
  102d20:	7f 11                	jg     102d33 <strtol+0xd2>
            dig = *s - '0';
  102d22:	8b 45 08             	mov    0x8(%ebp),%eax
  102d25:	0f b6 00             	movzbl (%eax),%eax
  102d28:	0f be c0             	movsbl %al,%eax
  102d2b:	83 e8 30             	sub    $0x30,%eax
  102d2e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d31:	eb 48                	jmp    102d7b <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102d33:	8b 45 08             	mov    0x8(%ebp),%eax
  102d36:	0f b6 00             	movzbl (%eax),%eax
  102d39:	3c 60                	cmp    $0x60,%al
  102d3b:	7e 1b                	jle    102d58 <strtol+0xf7>
  102d3d:	8b 45 08             	mov    0x8(%ebp),%eax
  102d40:	0f b6 00             	movzbl (%eax),%eax
  102d43:	3c 7a                	cmp    $0x7a,%al
  102d45:	7f 11                	jg     102d58 <strtol+0xf7>
            dig = *s - 'a' + 10;
  102d47:	8b 45 08             	mov    0x8(%ebp),%eax
  102d4a:	0f b6 00             	movzbl (%eax),%eax
  102d4d:	0f be c0             	movsbl %al,%eax
  102d50:	83 e8 57             	sub    $0x57,%eax
  102d53:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d56:	eb 23                	jmp    102d7b <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102d58:	8b 45 08             	mov    0x8(%ebp),%eax
  102d5b:	0f b6 00             	movzbl (%eax),%eax
  102d5e:	3c 40                	cmp    $0x40,%al
  102d60:	7e 3c                	jle    102d9e <strtol+0x13d>
  102d62:	8b 45 08             	mov    0x8(%ebp),%eax
  102d65:	0f b6 00             	movzbl (%eax),%eax
  102d68:	3c 5a                	cmp    $0x5a,%al
  102d6a:	7f 32                	jg     102d9e <strtol+0x13d>
            dig = *s - 'A' + 10;
  102d6c:	8b 45 08             	mov    0x8(%ebp),%eax
  102d6f:	0f b6 00             	movzbl (%eax),%eax
  102d72:	0f be c0             	movsbl %al,%eax
  102d75:	83 e8 37             	sub    $0x37,%eax
  102d78:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102d7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d7e:	3b 45 10             	cmp    0x10(%ebp),%eax
  102d81:	7d 1a                	jge    102d9d <strtol+0x13c>
            break;
        }
        s ++, val = (val * base) + dig;
  102d83:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102d87:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d8a:	0f af 45 10          	imul   0x10(%ebp),%eax
  102d8e:	89 c2                	mov    %eax,%edx
  102d90:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d93:	01 d0                	add    %edx,%eax
  102d95:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  102d98:	e9 71 ff ff ff       	jmp    102d0e <strtol+0xad>
        }
        else {
            break;
        }
        if (dig >= base) {
            break;
  102d9d:	90                   	nop
        }
        s ++, val = (val * base) + dig;
        // we don't properly detect overflow!
    }

    if (endptr) {
  102d9e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102da2:	74 08                	je     102dac <strtol+0x14b>
        *endptr = (char *) s;
  102da4:	8b 45 0c             	mov    0xc(%ebp),%eax
  102da7:	8b 55 08             	mov    0x8(%ebp),%edx
  102daa:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102dac:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102db0:	74 07                	je     102db9 <strtol+0x158>
  102db2:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102db5:	f7 d8                	neg    %eax
  102db7:	eb 03                	jmp    102dbc <strtol+0x15b>
  102db9:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102dbc:	c9                   	leave  
  102dbd:	c3                   	ret    

00102dbe <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102dbe:	55                   	push   %ebp
  102dbf:	89 e5                	mov    %esp,%ebp
  102dc1:	57                   	push   %edi
  102dc2:	83 ec 24             	sub    $0x24,%esp
  102dc5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dc8:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102dcb:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102dcf:	8b 55 08             	mov    0x8(%ebp),%edx
  102dd2:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102dd5:	88 45 f7             	mov    %al,-0x9(%ebp)
  102dd8:	8b 45 10             	mov    0x10(%ebp),%eax
  102ddb:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102dde:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102de1:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102de5:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102de8:	89 d7                	mov    %edx,%edi
  102dea:	f3 aa                	rep stos %al,%es:(%edi)
  102dec:	89 fa                	mov    %edi,%edx
  102dee:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102df1:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102df4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102df7:	90                   	nop
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102df8:	83 c4 24             	add    $0x24,%esp
  102dfb:	5f                   	pop    %edi
  102dfc:	5d                   	pop    %ebp
  102dfd:	c3                   	ret    

00102dfe <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102dfe:	55                   	push   %ebp
  102dff:	89 e5                	mov    %esp,%ebp
  102e01:	57                   	push   %edi
  102e02:	56                   	push   %esi
  102e03:	53                   	push   %ebx
  102e04:	83 ec 30             	sub    $0x30,%esp
  102e07:	8b 45 08             	mov    0x8(%ebp),%eax
  102e0a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e0d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e10:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102e13:	8b 45 10             	mov    0x10(%ebp),%eax
  102e16:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102e19:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e1c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102e1f:	73 42                	jae    102e63 <memmove+0x65>
  102e21:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e24:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102e27:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e2a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102e2d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e30:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102e33:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102e36:	c1 e8 02             	shr    $0x2,%eax
  102e39:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  102e3b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102e3e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e41:	89 d7                	mov    %edx,%edi
  102e43:	89 c6                	mov    %eax,%esi
  102e45:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102e47:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102e4a:	83 e1 03             	and    $0x3,%ecx
  102e4d:	74 02                	je     102e51 <memmove+0x53>
  102e4f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e51:	89 f0                	mov    %esi,%eax
  102e53:	89 fa                	mov    %edi,%edx
  102e55:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102e58:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102e5b:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  102e5e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
#ifdef __HAVE_ARCH_MEMMOVE
    return __memmove(dst, src, n);
  102e61:	eb 36                	jmp    102e99 <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102e63:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e66:	8d 50 ff             	lea    -0x1(%eax),%edx
  102e69:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e6c:	01 c2                	add    %eax,%edx
  102e6e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e71:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102e74:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e77:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  102e7a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e7d:	89 c1                	mov    %eax,%ecx
  102e7f:	89 d8                	mov    %ebx,%eax
  102e81:	89 d6                	mov    %edx,%esi
  102e83:	89 c7                	mov    %eax,%edi
  102e85:	fd                   	std    
  102e86:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e88:	fc                   	cld    
  102e89:	89 f8                	mov    %edi,%eax
  102e8b:	89 f2                	mov    %esi,%edx
  102e8d:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102e90:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102e93:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  102e96:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102e99:	83 c4 30             	add    $0x30,%esp
  102e9c:	5b                   	pop    %ebx
  102e9d:	5e                   	pop    %esi
  102e9e:	5f                   	pop    %edi
  102e9f:	5d                   	pop    %ebp
  102ea0:	c3                   	ret    

00102ea1 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102ea1:	55                   	push   %ebp
  102ea2:	89 e5                	mov    %esp,%ebp
  102ea4:	57                   	push   %edi
  102ea5:	56                   	push   %esi
  102ea6:	83 ec 20             	sub    $0x20,%esp
  102ea9:	8b 45 08             	mov    0x8(%ebp),%eax
  102eac:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102eaf:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eb2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102eb5:	8b 45 10             	mov    0x10(%ebp),%eax
  102eb8:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102ebb:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ebe:	c1 e8 02             	shr    $0x2,%eax
  102ec1:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  102ec3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ec6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ec9:	89 d7                	mov    %edx,%edi
  102ecb:	89 c6                	mov    %eax,%esi
  102ecd:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102ecf:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102ed2:	83 e1 03             	and    $0x3,%ecx
  102ed5:	74 02                	je     102ed9 <memcpy+0x38>
  102ed7:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102ed9:	89 f0                	mov    %esi,%eax
  102edb:	89 fa                	mov    %edi,%edx
  102edd:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102ee0:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102ee3:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  102ee6:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
  102ee9:	90                   	nop
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102eea:	83 c4 20             	add    $0x20,%esp
  102eed:	5e                   	pop    %esi
  102eee:	5f                   	pop    %edi
  102eef:	5d                   	pop    %ebp
  102ef0:	c3                   	ret    

00102ef1 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102ef1:	55                   	push   %ebp
  102ef2:	89 e5                	mov    %esp,%ebp
  102ef4:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102ef7:	8b 45 08             	mov    0x8(%ebp),%eax
  102efa:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102efd:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f00:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102f03:	eb 30                	jmp    102f35 <memcmp+0x44>
        if (*s1 != *s2) {
  102f05:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f08:	0f b6 10             	movzbl (%eax),%edx
  102f0b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f0e:	0f b6 00             	movzbl (%eax),%eax
  102f11:	38 c2                	cmp    %al,%dl
  102f13:	74 18                	je     102f2d <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102f15:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f18:	0f b6 00             	movzbl (%eax),%eax
  102f1b:	0f b6 d0             	movzbl %al,%edx
  102f1e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f21:	0f b6 00             	movzbl (%eax),%eax
  102f24:	0f b6 c0             	movzbl %al,%eax
  102f27:	29 c2                	sub    %eax,%edx
  102f29:	89 d0                	mov    %edx,%eax
  102f2b:	eb 1a                	jmp    102f47 <memcmp+0x56>
        }
        s1 ++, s2 ++;
  102f2d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102f31:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  102f35:	8b 45 10             	mov    0x10(%ebp),%eax
  102f38:	8d 50 ff             	lea    -0x1(%eax),%edx
  102f3b:	89 55 10             	mov    %edx,0x10(%ebp)
  102f3e:	85 c0                	test   %eax,%eax
  102f40:	75 c3                	jne    102f05 <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  102f42:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102f47:	c9                   	leave  
  102f48:	c3                   	ret    

00102f49 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102f49:	55                   	push   %ebp
  102f4a:	89 e5                	mov    %esp,%ebp
  102f4c:	83 ec 38             	sub    $0x38,%esp
  102f4f:	8b 45 10             	mov    0x10(%ebp),%eax
  102f52:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102f55:	8b 45 14             	mov    0x14(%ebp),%eax
  102f58:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102f5b:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102f5e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102f61:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102f64:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102f67:	8b 45 18             	mov    0x18(%ebp),%eax
  102f6a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102f6d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f70:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102f73:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102f76:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102f79:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f7c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102f7f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102f83:	74 1c                	je     102fa1 <printnum+0x58>
  102f85:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f88:	ba 00 00 00 00       	mov    $0x0,%edx
  102f8d:	f7 75 e4             	divl   -0x1c(%ebp)
  102f90:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102f93:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f96:	ba 00 00 00 00       	mov    $0x0,%edx
  102f9b:	f7 75 e4             	divl   -0x1c(%ebp)
  102f9e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fa1:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fa4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102fa7:	f7 75 e4             	divl   -0x1c(%ebp)
  102faa:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102fad:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102fb0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fb3:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102fb6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102fb9:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102fbc:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102fbf:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102fc2:	8b 45 18             	mov    0x18(%ebp),%eax
  102fc5:	ba 00 00 00 00       	mov    $0x0,%edx
  102fca:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102fcd:	77 41                	ja     103010 <printnum+0xc7>
  102fcf:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102fd2:	72 05                	jb     102fd9 <printnum+0x90>
  102fd4:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102fd7:	77 37                	ja     103010 <printnum+0xc7>
        printnum(putch, putdat, result, base, width - 1, padc);
  102fd9:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102fdc:	83 e8 01             	sub    $0x1,%eax
  102fdf:	83 ec 04             	sub    $0x4,%esp
  102fe2:	ff 75 20             	pushl  0x20(%ebp)
  102fe5:	50                   	push   %eax
  102fe6:	ff 75 18             	pushl  0x18(%ebp)
  102fe9:	ff 75 ec             	pushl  -0x14(%ebp)
  102fec:	ff 75 e8             	pushl  -0x18(%ebp)
  102fef:	ff 75 0c             	pushl  0xc(%ebp)
  102ff2:	ff 75 08             	pushl  0x8(%ebp)
  102ff5:	e8 4f ff ff ff       	call   102f49 <printnum>
  102ffa:	83 c4 20             	add    $0x20,%esp
  102ffd:	eb 1b                	jmp    10301a <printnum+0xd1>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102fff:	83 ec 08             	sub    $0x8,%esp
  103002:	ff 75 0c             	pushl  0xc(%ebp)
  103005:	ff 75 20             	pushl  0x20(%ebp)
  103008:	8b 45 08             	mov    0x8(%ebp),%eax
  10300b:	ff d0                	call   *%eax
  10300d:	83 c4 10             	add    $0x10,%esp
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  103010:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  103014:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  103018:	7f e5                	jg     102fff <printnum+0xb6>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  10301a:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10301d:	05 10 3d 10 00       	add    $0x103d10,%eax
  103022:	0f b6 00             	movzbl (%eax),%eax
  103025:	0f be c0             	movsbl %al,%eax
  103028:	83 ec 08             	sub    $0x8,%esp
  10302b:	ff 75 0c             	pushl  0xc(%ebp)
  10302e:	50                   	push   %eax
  10302f:	8b 45 08             	mov    0x8(%ebp),%eax
  103032:	ff d0                	call   *%eax
  103034:	83 c4 10             	add    $0x10,%esp
}
  103037:	90                   	nop
  103038:	c9                   	leave  
  103039:	c3                   	ret    

0010303a <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  10303a:	55                   	push   %ebp
  10303b:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  10303d:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  103041:	7e 14                	jle    103057 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  103043:	8b 45 08             	mov    0x8(%ebp),%eax
  103046:	8b 00                	mov    (%eax),%eax
  103048:	8d 48 08             	lea    0x8(%eax),%ecx
  10304b:	8b 55 08             	mov    0x8(%ebp),%edx
  10304e:	89 0a                	mov    %ecx,(%edx)
  103050:	8b 50 04             	mov    0x4(%eax),%edx
  103053:	8b 00                	mov    (%eax),%eax
  103055:	eb 30                	jmp    103087 <getuint+0x4d>
    }
    else if (lflag) {
  103057:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10305b:	74 16                	je     103073 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  10305d:	8b 45 08             	mov    0x8(%ebp),%eax
  103060:	8b 00                	mov    (%eax),%eax
  103062:	8d 48 04             	lea    0x4(%eax),%ecx
  103065:	8b 55 08             	mov    0x8(%ebp),%edx
  103068:	89 0a                	mov    %ecx,(%edx)
  10306a:	8b 00                	mov    (%eax),%eax
  10306c:	ba 00 00 00 00       	mov    $0x0,%edx
  103071:	eb 14                	jmp    103087 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  103073:	8b 45 08             	mov    0x8(%ebp),%eax
  103076:	8b 00                	mov    (%eax),%eax
  103078:	8d 48 04             	lea    0x4(%eax),%ecx
  10307b:	8b 55 08             	mov    0x8(%ebp),%edx
  10307e:	89 0a                	mov    %ecx,(%edx)
  103080:	8b 00                	mov    (%eax),%eax
  103082:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  103087:	5d                   	pop    %ebp
  103088:	c3                   	ret    

00103089 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  103089:	55                   	push   %ebp
  10308a:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  10308c:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  103090:	7e 14                	jle    1030a6 <getint+0x1d>
        return va_arg(*ap, long long);
  103092:	8b 45 08             	mov    0x8(%ebp),%eax
  103095:	8b 00                	mov    (%eax),%eax
  103097:	8d 48 08             	lea    0x8(%eax),%ecx
  10309a:	8b 55 08             	mov    0x8(%ebp),%edx
  10309d:	89 0a                	mov    %ecx,(%edx)
  10309f:	8b 50 04             	mov    0x4(%eax),%edx
  1030a2:	8b 00                	mov    (%eax),%eax
  1030a4:	eb 28                	jmp    1030ce <getint+0x45>
    }
    else if (lflag) {
  1030a6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1030aa:	74 12                	je     1030be <getint+0x35>
        return va_arg(*ap, long);
  1030ac:	8b 45 08             	mov    0x8(%ebp),%eax
  1030af:	8b 00                	mov    (%eax),%eax
  1030b1:	8d 48 04             	lea    0x4(%eax),%ecx
  1030b4:	8b 55 08             	mov    0x8(%ebp),%edx
  1030b7:	89 0a                	mov    %ecx,(%edx)
  1030b9:	8b 00                	mov    (%eax),%eax
  1030bb:	99                   	cltd   
  1030bc:	eb 10                	jmp    1030ce <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  1030be:	8b 45 08             	mov    0x8(%ebp),%eax
  1030c1:	8b 00                	mov    (%eax),%eax
  1030c3:	8d 48 04             	lea    0x4(%eax),%ecx
  1030c6:	8b 55 08             	mov    0x8(%ebp),%edx
  1030c9:	89 0a                	mov    %ecx,(%edx)
  1030cb:	8b 00                	mov    (%eax),%eax
  1030cd:	99                   	cltd   
    }
}
  1030ce:	5d                   	pop    %ebp
  1030cf:	c3                   	ret    

001030d0 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  1030d0:	55                   	push   %ebp
  1030d1:	89 e5                	mov    %esp,%ebp
  1030d3:	83 ec 18             	sub    $0x18,%esp
    va_list ap;

    va_start(ap, fmt);
  1030d6:	8d 45 14             	lea    0x14(%ebp),%eax
  1030d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  1030dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1030df:	50                   	push   %eax
  1030e0:	ff 75 10             	pushl  0x10(%ebp)
  1030e3:	ff 75 0c             	pushl  0xc(%ebp)
  1030e6:	ff 75 08             	pushl  0x8(%ebp)
  1030e9:	e8 06 00 00 00       	call   1030f4 <vprintfmt>
  1030ee:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  1030f1:	90                   	nop
  1030f2:	c9                   	leave  
  1030f3:	c3                   	ret    

001030f4 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  1030f4:	55                   	push   %ebp
  1030f5:	89 e5                	mov    %esp,%ebp
  1030f7:	56                   	push   %esi
  1030f8:	53                   	push   %ebx
  1030f9:	83 ec 20             	sub    $0x20,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  1030fc:	eb 17                	jmp    103115 <vprintfmt+0x21>
            if (ch == '\0') {
  1030fe:	85 db                	test   %ebx,%ebx
  103100:	0f 84 8e 03 00 00    	je     103494 <vprintfmt+0x3a0>
                return;
            }
            putch(ch, putdat);
  103106:	83 ec 08             	sub    $0x8,%esp
  103109:	ff 75 0c             	pushl  0xc(%ebp)
  10310c:	53                   	push   %ebx
  10310d:	8b 45 08             	mov    0x8(%ebp),%eax
  103110:	ff d0                	call   *%eax
  103112:	83 c4 10             	add    $0x10,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103115:	8b 45 10             	mov    0x10(%ebp),%eax
  103118:	8d 50 01             	lea    0x1(%eax),%edx
  10311b:	89 55 10             	mov    %edx,0x10(%ebp)
  10311e:	0f b6 00             	movzbl (%eax),%eax
  103121:	0f b6 d8             	movzbl %al,%ebx
  103124:	83 fb 25             	cmp    $0x25,%ebx
  103127:	75 d5                	jne    1030fe <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  103129:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  10312d:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  103134:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103137:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  10313a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  103141:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103144:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  103147:	8b 45 10             	mov    0x10(%ebp),%eax
  10314a:	8d 50 01             	lea    0x1(%eax),%edx
  10314d:	89 55 10             	mov    %edx,0x10(%ebp)
  103150:	0f b6 00             	movzbl (%eax),%eax
  103153:	0f b6 d8             	movzbl %al,%ebx
  103156:	8d 43 dd             	lea    -0x23(%ebx),%eax
  103159:	83 f8 55             	cmp    $0x55,%eax
  10315c:	0f 87 05 03 00 00    	ja     103467 <vprintfmt+0x373>
  103162:	8b 04 85 34 3d 10 00 	mov    0x103d34(,%eax,4),%eax
  103169:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  10316b:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  10316f:	eb d6                	jmp    103147 <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  103171:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  103175:	eb d0                	jmp    103147 <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  103177:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  10317e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103181:	89 d0                	mov    %edx,%eax
  103183:	c1 e0 02             	shl    $0x2,%eax
  103186:	01 d0                	add    %edx,%eax
  103188:	01 c0                	add    %eax,%eax
  10318a:	01 d8                	add    %ebx,%eax
  10318c:	83 e8 30             	sub    $0x30,%eax
  10318f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  103192:	8b 45 10             	mov    0x10(%ebp),%eax
  103195:	0f b6 00             	movzbl (%eax),%eax
  103198:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  10319b:	83 fb 2f             	cmp    $0x2f,%ebx
  10319e:	7e 39                	jle    1031d9 <vprintfmt+0xe5>
  1031a0:	83 fb 39             	cmp    $0x39,%ebx
  1031a3:	7f 34                	jg     1031d9 <vprintfmt+0xe5>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  1031a5:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  1031a9:	eb d3                	jmp    10317e <vprintfmt+0x8a>
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  1031ab:	8b 45 14             	mov    0x14(%ebp),%eax
  1031ae:	8d 50 04             	lea    0x4(%eax),%edx
  1031b1:	89 55 14             	mov    %edx,0x14(%ebp)
  1031b4:	8b 00                	mov    (%eax),%eax
  1031b6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  1031b9:	eb 1f                	jmp    1031da <vprintfmt+0xe6>

        case '.':
            if (width < 0)
  1031bb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1031bf:	79 86                	jns    103147 <vprintfmt+0x53>
                width = 0;
  1031c1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  1031c8:	e9 7a ff ff ff       	jmp    103147 <vprintfmt+0x53>

        case '#':
            altflag = 1;
  1031cd:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  1031d4:	e9 6e ff ff ff       	jmp    103147 <vprintfmt+0x53>
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
            goto process_precision;
  1031d9:	90                   	nop
        case '#':
            altflag = 1;
            goto reswitch;

        process_precision:
            if (width < 0)
  1031da:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1031de:	0f 89 63 ff ff ff    	jns    103147 <vprintfmt+0x53>
                width = precision, precision = -1;
  1031e4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1031e7:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1031ea:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  1031f1:	e9 51 ff ff ff       	jmp    103147 <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  1031f6:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  1031fa:	e9 48 ff ff ff       	jmp    103147 <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  1031ff:	8b 45 14             	mov    0x14(%ebp),%eax
  103202:	8d 50 04             	lea    0x4(%eax),%edx
  103205:	89 55 14             	mov    %edx,0x14(%ebp)
  103208:	8b 00                	mov    (%eax),%eax
  10320a:	83 ec 08             	sub    $0x8,%esp
  10320d:	ff 75 0c             	pushl  0xc(%ebp)
  103210:	50                   	push   %eax
  103211:	8b 45 08             	mov    0x8(%ebp),%eax
  103214:	ff d0                	call   *%eax
  103216:	83 c4 10             	add    $0x10,%esp
            break;
  103219:	e9 71 02 00 00       	jmp    10348f <vprintfmt+0x39b>

        // error message
        case 'e':
            err = va_arg(ap, int);
  10321e:	8b 45 14             	mov    0x14(%ebp),%eax
  103221:	8d 50 04             	lea    0x4(%eax),%edx
  103224:	89 55 14             	mov    %edx,0x14(%ebp)
  103227:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  103229:	85 db                	test   %ebx,%ebx
  10322b:	79 02                	jns    10322f <vprintfmt+0x13b>
                err = -err;
  10322d:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  10322f:	83 fb 06             	cmp    $0x6,%ebx
  103232:	7f 0b                	jg     10323f <vprintfmt+0x14b>
  103234:	8b 34 9d f4 3c 10 00 	mov    0x103cf4(,%ebx,4),%esi
  10323b:	85 f6                	test   %esi,%esi
  10323d:	75 19                	jne    103258 <vprintfmt+0x164>
                printfmt(putch, putdat, "error %d", err);
  10323f:	53                   	push   %ebx
  103240:	68 21 3d 10 00       	push   $0x103d21
  103245:	ff 75 0c             	pushl  0xc(%ebp)
  103248:	ff 75 08             	pushl  0x8(%ebp)
  10324b:	e8 80 fe ff ff       	call   1030d0 <printfmt>
  103250:	83 c4 10             	add    $0x10,%esp
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  103253:	e9 37 02 00 00       	jmp    10348f <vprintfmt+0x39b>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  103258:	56                   	push   %esi
  103259:	68 2a 3d 10 00       	push   $0x103d2a
  10325e:	ff 75 0c             	pushl  0xc(%ebp)
  103261:	ff 75 08             	pushl  0x8(%ebp)
  103264:	e8 67 fe ff ff       	call   1030d0 <printfmt>
  103269:	83 c4 10             	add    $0x10,%esp
            }
            break;
  10326c:	e9 1e 02 00 00       	jmp    10348f <vprintfmt+0x39b>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  103271:	8b 45 14             	mov    0x14(%ebp),%eax
  103274:	8d 50 04             	lea    0x4(%eax),%edx
  103277:	89 55 14             	mov    %edx,0x14(%ebp)
  10327a:	8b 30                	mov    (%eax),%esi
  10327c:	85 f6                	test   %esi,%esi
  10327e:	75 05                	jne    103285 <vprintfmt+0x191>
                p = "(null)";
  103280:	be 2d 3d 10 00       	mov    $0x103d2d,%esi
            }
            if (width > 0 && padc != '-') {
  103285:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103289:	7e 76                	jle    103301 <vprintfmt+0x20d>
  10328b:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  10328f:	74 70                	je     103301 <vprintfmt+0x20d>
                for (width -= strnlen(p, precision); width > 0; width --) {
  103291:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103294:	83 ec 08             	sub    $0x8,%esp
  103297:	50                   	push   %eax
  103298:	56                   	push   %esi
  103299:	e8 17 f8 ff ff       	call   102ab5 <strnlen>
  10329e:	83 c4 10             	add    $0x10,%esp
  1032a1:	89 c2                	mov    %eax,%edx
  1032a3:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1032a6:	29 d0                	sub    %edx,%eax
  1032a8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1032ab:	eb 17                	jmp    1032c4 <vprintfmt+0x1d0>
                    putch(padc, putdat);
  1032ad:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  1032b1:	83 ec 08             	sub    $0x8,%esp
  1032b4:	ff 75 0c             	pushl  0xc(%ebp)
  1032b7:	50                   	push   %eax
  1032b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1032bb:	ff d0                	call   *%eax
  1032bd:	83 c4 10             	add    $0x10,%esp
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  1032c0:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  1032c4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1032c8:	7f e3                	jg     1032ad <vprintfmt+0x1b9>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1032ca:	eb 35                	jmp    103301 <vprintfmt+0x20d>
                if (altflag && (ch < ' ' || ch > '~')) {
  1032cc:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  1032d0:	74 1c                	je     1032ee <vprintfmt+0x1fa>
  1032d2:	83 fb 1f             	cmp    $0x1f,%ebx
  1032d5:	7e 05                	jle    1032dc <vprintfmt+0x1e8>
  1032d7:	83 fb 7e             	cmp    $0x7e,%ebx
  1032da:	7e 12                	jle    1032ee <vprintfmt+0x1fa>
                    putch('?', putdat);
  1032dc:	83 ec 08             	sub    $0x8,%esp
  1032df:	ff 75 0c             	pushl  0xc(%ebp)
  1032e2:	6a 3f                	push   $0x3f
  1032e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1032e7:	ff d0                	call   *%eax
  1032e9:	83 c4 10             	add    $0x10,%esp
  1032ec:	eb 0f                	jmp    1032fd <vprintfmt+0x209>
                }
                else {
                    putch(ch, putdat);
  1032ee:	83 ec 08             	sub    $0x8,%esp
  1032f1:	ff 75 0c             	pushl  0xc(%ebp)
  1032f4:	53                   	push   %ebx
  1032f5:	8b 45 08             	mov    0x8(%ebp),%eax
  1032f8:	ff d0                	call   *%eax
  1032fa:	83 c4 10             	add    $0x10,%esp
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1032fd:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  103301:	89 f0                	mov    %esi,%eax
  103303:	8d 70 01             	lea    0x1(%eax),%esi
  103306:	0f b6 00             	movzbl (%eax),%eax
  103309:	0f be d8             	movsbl %al,%ebx
  10330c:	85 db                	test   %ebx,%ebx
  10330e:	74 26                	je     103336 <vprintfmt+0x242>
  103310:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103314:	78 b6                	js     1032cc <vprintfmt+0x1d8>
  103316:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  10331a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  10331e:	79 ac                	jns    1032cc <vprintfmt+0x1d8>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  103320:	eb 14                	jmp    103336 <vprintfmt+0x242>
                putch(' ', putdat);
  103322:	83 ec 08             	sub    $0x8,%esp
  103325:	ff 75 0c             	pushl  0xc(%ebp)
  103328:	6a 20                	push   $0x20
  10332a:	8b 45 08             	mov    0x8(%ebp),%eax
  10332d:	ff d0                	call   *%eax
  10332f:	83 c4 10             	add    $0x10,%esp
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  103332:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  103336:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10333a:	7f e6                	jg     103322 <vprintfmt+0x22e>
                putch(' ', putdat);
            }
            break;
  10333c:	e9 4e 01 00 00       	jmp    10348f <vprintfmt+0x39b>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  103341:	83 ec 08             	sub    $0x8,%esp
  103344:	ff 75 e0             	pushl  -0x20(%ebp)
  103347:	8d 45 14             	lea    0x14(%ebp),%eax
  10334a:	50                   	push   %eax
  10334b:	e8 39 fd ff ff       	call   103089 <getint>
  103350:	83 c4 10             	add    $0x10,%esp
  103353:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103356:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  103359:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10335c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10335f:	85 d2                	test   %edx,%edx
  103361:	79 23                	jns    103386 <vprintfmt+0x292>
                putch('-', putdat);
  103363:	83 ec 08             	sub    $0x8,%esp
  103366:	ff 75 0c             	pushl  0xc(%ebp)
  103369:	6a 2d                	push   $0x2d
  10336b:	8b 45 08             	mov    0x8(%ebp),%eax
  10336e:	ff d0                	call   *%eax
  103370:	83 c4 10             	add    $0x10,%esp
                num = -(long long)num;
  103373:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103376:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103379:	f7 d8                	neg    %eax
  10337b:	83 d2 00             	adc    $0x0,%edx
  10337e:	f7 da                	neg    %edx
  103380:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103383:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  103386:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  10338d:	e9 9f 00 00 00       	jmp    103431 <vprintfmt+0x33d>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  103392:	83 ec 08             	sub    $0x8,%esp
  103395:	ff 75 e0             	pushl  -0x20(%ebp)
  103398:	8d 45 14             	lea    0x14(%ebp),%eax
  10339b:	50                   	push   %eax
  10339c:	e8 99 fc ff ff       	call   10303a <getuint>
  1033a1:	83 c4 10             	add    $0x10,%esp
  1033a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033a7:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  1033aa:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1033b1:	eb 7e                	jmp    103431 <vprintfmt+0x33d>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  1033b3:	83 ec 08             	sub    $0x8,%esp
  1033b6:	ff 75 e0             	pushl  -0x20(%ebp)
  1033b9:	8d 45 14             	lea    0x14(%ebp),%eax
  1033bc:	50                   	push   %eax
  1033bd:	e8 78 fc ff ff       	call   10303a <getuint>
  1033c2:	83 c4 10             	add    $0x10,%esp
  1033c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033c8:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  1033cb:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  1033d2:	eb 5d                	jmp    103431 <vprintfmt+0x33d>

        // pointer
        case 'p':
            putch('0', putdat);
  1033d4:	83 ec 08             	sub    $0x8,%esp
  1033d7:	ff 75 0c             	pushl  0xc(%ebp)
  1033da:	6a 30                	push   $0x30
  1033dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1033df:	ff d0                	call   *%eax
  1033e1:	83 c4 10             	add    $0x10,%esp
            putch('x', putdat);
  1033e4:	83 ec 08             	sub    $0x8,%esp
  1033e7:	ff 75 0c             	pushl  0xc(%ebp)
  1033ea:	6a 78                	push   $0x78
  1033ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1033ef:	ff d0                	call   *%eax
  1033f1:	83 c4 10             	add    $0x10,%esp
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  1033f4:	8b 45 14             	mov    0x14(%ebp),%eax
  1033f7:	8d 50 04             	lea    0x4(%eax),%edx
  1033fa:	89 55 14             	mov    %edx,0x14(%ebp)
  1033fd:	8b 00                	mov    (%eax),%eax
  1033ff:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103402:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  103409:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  103410:	eb 1f                	jmp    103431 <vprintfmt+0x33d>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  103412:	83 ec 08             	sub    $0x8,%esp
  103415:	ff 75 e0             	pushl  -0x20(%ebp)
  103418:	8d 45 14             	lea    0x14(%ebp),%eax
  10341b:	50                   	push   %eax
  10341c:	e8 19 fc ff ff       	call   10303a <getuint>
  103421:	83 c4 10             	add    $0x10,%esp
  103424:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103427:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  10342a:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103431:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  103435:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103438:	83 ec 04             	sub    $0x4,%esp
  10343b:	52                   	push   %edx
  10343c:	ff 75 e8             	pushl  -0x18(%ebp)
  10343f:	50                   	push   %eax
  103440:	ff 75 f4             	pushl  -0xc(%ebp)
  103443:	ff 75 f0             	pushl  -0x10(%ebp)
  103446:	ff 75 0c             	pushl  0xc(%ebp)
  103449:	ff 75 08             	pushl  0x8(%ebp)
  10344c:	e8 f8 fa ff ff       	call   102f49 <printnum>
  103451:	83 c4 20             	add    $0x20,%esp
            break;
  103454:	eb 39                	jmp    10348f <vprintfmt+0x39b>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  103456:	83 ec 08             	sub    $0x8,%esp
  103459:	ff 75 0c             	pushl  0xc(%ebp)
  10345c:	53                   	push   %ebx
  10345d:	8b 45 08             	mov    0x8(%ebp),%eax
  103460:	ff d0                	call   *%eax
  103462:	83 c4 10             	add    $0x10,%esp
            break;
  103465:	eb 28                	jmp    10348f <vprintfmt+0x39b>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  103467:	83 ec 08             	sub    $0x8,%esp
  10346a:	ff 75 0c             	pushl  0xc(%ebp)
  10346d:	6a 25                	push   $0x25
  10346f:	8b 45 08             	mov    0x8(%ebp),%eax
  103472:	ff d0                	call   *%eax
  103474:	83 c4 10             	add    $0x10,%esp
            for (fmt --; fmt[-1] != '%'; fmt --)
  103477:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10347b:	eb 04                	jmp    103481 <vprintfmt+0x38d>
  10347d:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103481:	8b 45 10             	mov    0x10(%ebp),%eax
  103484:	83 e8 01             	sub    $0x1,%eax
  103487:	0f b6 00             	movzbl (%eax),%eax
  10348a:	3c 25                	cmp    $0x25,%al
  10348c:	75 ef                	jne    10347d <vprintfmt+0x389>
                /* do nothing */;
            break;
  10348e:	90                   	nop
        }
    }
  10348f:	e9 68 fc ff ff       	jmp    1030fc <vprintfmt+0x8>
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
            if (ch == '\0') {
                return;
  103494:	90                   	nop
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  103495:	8d 65 f8             	lea    -0x8(%ebp),%esp
  103498:	5b                   	pop    %ebx
  103499:	5e                   	pop    %esi
  10349a:	5d                   	pop    %ebp
  10349b:	c3                   	ret    

0010349c <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  10349c:	55                   	push   %ebp
  10349d:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  10349f:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034a2:	8b 40 08             	mov    0x8(%eax),%eax
  1034a5:	8d 50 01             	lea    0x1(%eax),%edx
  1034a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034ab:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  1034ae:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034b1:	8b 10                	mov    (%eax),%edx
  1034b3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034b6:	8b 40 04             	mov    0x4(%eax),%eax
  1034b9:	39 c2                	cmp    %eax,%edx
  1034bb:	73 12                	jae    1034cf <sprintputch+0x33>
        *b->buf ++ = ch;
  1034bd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034c0:	8b 00                	mov    (%eax),%eax
  1034c2:	8d 48 01             	lea    0x1(%eax),%ecx
  1034c5:	8b 55 0c             	mov    0xc(%ebp),%edx
  1034c8:	89 0a                	mov    %ecx,(%edx)
  1034ca:	8b 55 08             	mov    0x8(%ebp),%edx
  1034cd:	88 10                	mov    %dl,(%eax)
    }
}
  1034cf:	90                   	nop
  1034d0:	5d                   	pop    %ebp
  1034d1:	c3                   	ret    

001034d2 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  1034d2:	55                   	push   %ebp
  1034d3:	89 e5                	mov    %esp,%ebp
  1034d5:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  1034d8:	8d 45 14             	lea    0x14(%ebp),%eax
  1034db:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  1034de:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1034e1:	50                   	push   %eax
  1034e2:	ff 75 10             	pushl  0x10(%ebp)
  1034e5:	ff 75 0c             	pushl  0xc(%ebp)
  1034e8:	ff 75 08             	pushl  0x8(%ebp)
  1034eb:	e8 0b 00 00 00       	call   1034fb <vsnprintf>
  1034f0:	83 c4 10             	add    $0x10,%esp
  1034f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1034f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1034f9:	c9                   	leave  
  1034fa:	c3                   	ret    

001034fb <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  1034fb:	55                   	push   %ebp
  1034fc:	89 e5                	mov    %esp,%ebp
  1034fe:	83 ec 18             	sub    $0x18,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  103501:	8b 45 08             	mov    0x8(%ebp),%eax
  103504:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103507:	8b 45 0c             	mov    0xc(%ebp),%eax
  10350a:	8d 50 ff             	lea    -0x1(%eax),%edx
  10350d:	8b 45 08             	mov    0x8(%ebp),%eax
  103510:	01 d0                	add    %edx,%eax
  103512:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103515:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  10351c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103520:	74 0a                	je     10352c <vsnprintf+0x31>
  103522:	8b 55 ec             	mov    -0x14(%ebp),%edx
  103525:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103528:	39 c2                	cmp    %eax,%edx
  10352a:	76 07                	jbe    103533 <vsnprintf+0x38>
        return -E_INVAL;
  10352c:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  103531:	eb 20                	jmp    103553 <vsnprintf+0x58>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  103533:	ff 75 14             	pushl  0x14(%ebp)
  103536:	ff 75 10             	pushl  0x10(%ebp)
  103539:	8d 45 ec             	lea    -0x14(%ebp),%eax
  10353c:	50                   	push   %eax
  10353d:	68 9c 34 10 00       	push   $0x10349c
  103542:	e8 ad fb ff ff       	call   1030f4 <vprintfmt>
  103547:	83 c4 10             	add    $0x10,%esp
    // null terminate the buffer
    *b.buf = '\0';
  10354a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10354d:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  103550:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103553:	c9                   	leave  
  103554:	c3                   	ret    
