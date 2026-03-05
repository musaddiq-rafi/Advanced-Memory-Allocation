
obj/kern/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <video_init>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	53                   	push   %ebx
  100004:	83 ec 14             	sub    $0x14,%esp
  100007:	e8 b4 03 00 00       	call   1003c0 <__x86.get_pc_thunk.bx>
  10000c:	81 c3 e8 ff 00 00    	add    $0xffe8,%ebx
  100012:	c7 45 f4 00 80 0b 00 	movl   $0xb8000,-0xc(%ebp)
  100019:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10001c:	0f b7 00             	movzwl (%eax),%eax
  10001f:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100023:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100026:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
  10002b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10002e:	0f b7 00             	movzwl (%eax),%eax
  100031:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100035:	74 2c                	je     100063 <video_init+0x63>
  100037:	c7 45 f4 00 00 0b 00 	movl   $0xb0000,-0xc(%ebp)
  10003e:	c7 83 0c 60 00 00 b4 	movl   $0x3b4,0x600c(%ebx)
  100045:	03 00 00 
  100048:	8b 83 0c 60 00 00    	mov    0x600c(%ebx),%eax
  10004e:	83 ec 08             	sub    $0x8,%esp
  100051:	50                   	push   %eax
  100052:	8d 83 0c 90 ff ff    	lea    -0x6ff4(%ebx),%eax
  100058:	50                   	push   %eax
  100059:	e8 3e 2d 00 00       	call   102d9c <dprintf>
  10005e:	83 c4 10             	add    $0x10,%esp
  100061:	eb 2d                	jmp    100090 <video_init+0x90>
  100063:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100066:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10006a:	66 89 10             	mov    %dx,(%eax)
  10006d:	c7 83 0c 60 00 00 d4 	movl   $0x3d4,0x600c(%ebx)
  100074:	03 00 00 
  100077:	8b 83 0c 60 00 00    	mov    0x600c(%ebx),%eax
  10007d:	83 ec 08             	sub    $0x8,%esp
  100080:	50                   	push   %eax
  100081:	8d 83 0c 90 ff ff    	lea    -0x6ff4(%ebx),%eax
  100087:	50                   	push   %eax
  100088:	e8 0f 2d 00 00       	call   102d9c <dprintf>
  10008d:	83 c4 10             	add    $0x10,%esp
  100090:	8b 83 0c 60 00 00    	mov    0x600c(%ebx),%eax
  100096:	83 ec 08             	sub    $0x8,%esp
  100099:	6a 0e                	push   $0xe
  10009b:	50                   	push   %eax
  10009c:	e8 a8 3a 00 00       	call   103b49 <outb>
  1000a1:	83 c4 10             	add    $0x10,%esp
  1000a4:	8b 83 0c 60 00 00    	mov    0x600c(%ebx),%eax
  1000aa:	83 c0 01             	add    $0x1,%eax
  1000ad:	83 ec 0c             	sub    $0xc,%esp
  1000b0:	50                   	push   %eax
  1000b1:	e8 44 3a 00 00       	call   103afa <inb>
  1000b6:	83 c4 10             	add    $0x10,%esp
  1000b9:	0f b6 c0             	movzbl %al,%eax
  1000bc:	c1 e0 08             	shl    $0x8,%eax
  1000bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1000c2:	8b 83 0c 60 00 00    	mov    0x600c(%ebx),%eax
  1000c8:	83 ec 08             	sub    $0x8,%esp
  1000cb:	6a 0f                	push   $0xf
  1000cd:	50                   	push   %eax
  1000ce:	e8 76 3a 00 00       	call   103b49 <outb>
  1000d3:	83 c4 10             	add    $0x10,%esp
  1000d6:	8b 83 0c 60 00 00    	mov    0x600c(%ebx),%eax
  1000dc:	83 c0 01             	add    $0x1,%eax
  1000df:	83 ec 0c             	sub    $0xc,%esp
  1000e2:	50                   	push   %eax
  1000e3:	e8 12 3a 00 00       	call   103afa <inb>
  1000e8:	83 c4 10             	add    $0x10,%esp
  1000eb:	0f b6 c0             	movzbl %al,%eax
  1000ee:	09 45 ec             	or     %eax,-0x14(%ebp)
  1000f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1000f4:	89 83 10 60 00 00    	mov    %eax,0x6010(%ebx)
  1000fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1000fd:	66 89 83 14 60 00 00 	mov    %ax,0x6014(%ebx)
  100104:	c7 83 18 60 00 00 00 	movl   $0x0,0x6018(%ebx)
  10010b:	00 00 00 
  10010e:	90                   	nop
  10010f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100112:	c9                   	leave
  100113:	c3                   	ret

00100114 <video_putc>:
  100114:	55                   	push   %ebp
  100115:	89 e5                	mov    %esp,%ebp
  100117:	56                   	push   %esi
  100118:	53                   	push   %ebx
  100119:	83 ec 10             	sub    $0x10,%esp
  10011c:	e8 9f 02 00 00       	call   1003c0 <__x86.get_pc_thunk.bx>
  100121:	81 c3 d3 fe 00 00    	add    $0xfed3,%ebx
  100127:	8b 45 08             	mov    0x8(%ebp),%eax
  10012a:	3d ff 00 00 00       	cmp    $0xff,%eax
  10012f:	77 07                	ja     100138 <video_putc+0x24>
  100131:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
  100138:	8b 45 08             	mov    0x8(%ebp),%eax
  10013b:	0f b6 c0             	movzbl %al,%eax
  10013e:	83 f8 0d             	cmp    $0xd,%eax
  100141:	0f 84 84 00 00 00    	je     1001cb <video_putc+0xb7>
  100147:	83 f8 0d             	cmp    $0xd,%eax
  10014a:	0f 8f f9 00 00 00    	jg     100249 <video_putc+0x135>
  100150:	83 f8 0a             	cmp    $0xa,%eax
  100153:	74 65                	je     1001ba <video_putc+0xa6>
  100155:	83 f8 0a             	cmp    $0xa,%eax
  100158:	0f 8f eb 00 00 00    	jg     100249 <video_putc+0x135>
  10015e:	83 f8 08             	cmp    $0x8,%eax
  100161:	74 0e                	je     100171 <video_putc+0x5d>
  100163:	83 f8 09             	cmp    $0x9,%eax
  100166:	0f 84 9a 00 00 00    	je     100206 <video_putc+0xf2>
  10016c:	e9 d8 00 00 00       	jmp    100249 <video_putc+0x135>
  100171:	0f b7 83 14 60 00 00 	movzwl 0x6014(%ebx),%eax
  100178:	66 85 c0             	test   %ax,%ax
  10017b:	0f 84 ee 00 00 00    	je     10026f <video_putc+0x15b>
  100181:	0f b7 83 14 60 00 00 	movzwl 0x6014(%ebx),%eax
  100188:	83 e8 01             	sub    $0x1,%eax
  10018b:	66 89 83 14 60 00 00 	mov    %ax,0x6014(%ebx)
  100192:	8b 45 08             	mov    0x8(%ebp),%eax
  100195:	b0 00                	mov    $0x0,%al
  100197:	83 c8 20             	or     $0x20,%eax
  10019a:	89 c1                	mov    %eax,%ecx
  10019c:	8b 83 10 60 00 00    	mov    0x6010(%ebx),%eax
  1001a2:	0f b7 93 14 60 00 00 	movzwl 0x6014(%ebx),%edx
  1001a9:	0f b7 d2             	movzwl %dx,%edx
  1001ac:	01 d2                	add    %edx,%edx
  1001ae:	01 d0                	add    %edx,%eax
  1001b0:	89 ca                	mov    %ecx,%edx
  1001b2:	66 89 10             	mov    %dx,(%eax)
  1001b5:	e9 b5 00 00 00       	jmp    10026f <video_putc+0x15b>
  1001ba:	0f b7 83 14 60 00 00 	movzwl 0x6014(%ebx),%eax
  1001c1:	83 c0 50             	add    $0x50,%eax
  1001c4:	66 89 83 14 60 00 00 	mov    %ax,0x6014(%ebx)
  1001cb:	0f b7 b3 14 60 00 00 	movzwl 0x6014(%ebx),%esi
  1001d2:	0f b7 8b 14 60 00 00 	movzwl 0x6014(%ebx),%ecx
  1001d9:	0f b7 c1             	movzwl %cx,%eax
  1001dc:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  1001e2:	c1 e8 10             	shr    $0x10,%eax
  1001e5:	89 c2                	mov    %eax,%edx
  1001e7:	66 c1 ea 06          	shr    $0x6,%dx
  1001eb:	89 d0                	mov    %edx,%eax
  1001ed:	c1 e0 02             	shl    $0x2,%eax
  1001f0:	01 d0                	add    %edx,%eax
  1001f2:	c1 e0 04             	shl    $0x4,%eax
  1001f5:	29 c1                	sub    %eax,%ecx
  1001f7:	89 ca                	mov    %ecx,%edx
  1001f9:	89 f0                	mov    %esi,%eax
  1001fb:	29 d0                	sub    %edx,%eax
  1001fd:	66 89 83 14 60 00 00 	mov    %ax,0x6014(%ebx)
  100204:	eb 6a                	jmp    100270 <video_putc+0x15c>
  100206:	83 ec 0c             	sub    $0xc,%esp
  100209:	6a 20                	push   $0x20
  10020b:	e8 04 ff ff ff       	call   100114 <video_putc>
  100210:	83 c4 10             	add    $0x10,%esp
  100213:	83 ec 0c             	sub    $0xc,%esp
  100216:	6a 20                	push   $0x20
  100218:	e8 f7 fe ff ff       	call   100114 <video_putc>
  10021d:	83 c4 10             	add    $0x10,%esp
  100220:	83 ec 0c             	sub    $0xc,%esp
  100223:	6a 20                	push   $0x20
  100225:	e8 ea fe ff ff       	call   100114 <video_putc>
  10022a:	83 c4 10             	add    $0x10,%esp
  10022d:	83 ec 0c             	sub    $0xc,%esp
  100230:	6a 20                	push   $0x20
  100232:	e8 dd fe ff ff       	call   100114 <video_putc>
  100237:	83 c4 10             	add    $0x10,%esp
  10023a:	83 ec 0c             	sub    $0xc,%esp
  10023d:	6a 20                	push   $0x20
  10023f:	e8 d0 fe ff ff       	call   100114 <video_putc>
  100244:	83 c4 10             	add    $0x10,%esp
  100247:	eb 27                	jmp    100270 <video_putc+0x15c>
  100249:	8b 8b 10 60 00 00    	mov    0x6010(%ebx),%ecx
  10024f:	0f b7 83 14 60 00 00 	movzwl 0x6014(%ebx),%eax
  100256:	8d 50 01             	lea    0x1(%eax),%edx
  100259:	66 89 93 14 60 00 00 	mov    %dx,0x6014(%ebx)
  100260:	0f b7 c0             	movzwl %ax,%eax
  100263:	01 c0                	add    %eax,%eax
  100265:	01 c8                	add    %ecx,%eax
  100267:	8b 55 08             	mov    0x8(%ebp),%edx
  10026a:	66 89 10             	mov    %dx,(%eax)
  10026d:	eb 01                	jmp    100270 <video_putc+0x15c>
  10026f:	90                   	nop
  100270:	0f b7 83 14 60 00 00 	movzwl 0x6014(%ebx),%eax
  100277:	66 3d cf 07          	cmp    $0x7cf,%ax
  10027b:	76 5d                	jbe    1002da <video_putc+0x1c6>
  10027d:	8b 83 10 60 00 00    	mov    0x6010(%ebx),%eax
  100283:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  100289:	8b 83 10 60 00 00    	mov    0x6010(%ebx),%eax
  10028f:	83 ec 04             	sub    $0x4,%esp
  100292:	68 00 0f 00 00       	push   $0xf00
  100297:	52                   	push   %edx
  100298:	50                   	push   %eax
  100299:	e8 b7 25 00 00       	call   102855 <memmove>
  10029e:	83 c4 10             	add    $0x10,%esp
  1002a1:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1002a8:	eb 16                	jmp    1002c0 <video_putc+0x1ac>
  1002aa:	8b 83 10 60 00 00    	mov    0x6010(%ebx),%eax
  1002b0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1002b3:	01 d2                	add    %edx,%edx
  1002b5:	01 d0                	add    %edx,%eax
  1002b7:	66 c7 00 20 07       	movw   $0x720,(%eax)
  1002bc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1002c0:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1002c7:	7e e1                	jle    1002aa <video_putc+0x196>
  1002c9:	0f b7 83 14 60 00 00 	movzwl 0x6014(%ebx),%eax
  1002d0:	83 e8 50             	sub    $0x50,%eax
  1002d3:	66 89 83 14 60 00 00 	mov    %ax,0x6014(%ebx)
  1002da:	8b 83 0c 60 00 00    	mov    0x600c(%ebx),%eax
  1002e0:	83 ec 08             	sub    $0x8,%esp
  1002e3:	6a 0e                	push   $0xe
  1002e5:	50                   	push   %eax
  1002e6:	e8 5e 38 00 00       	call   103b49 <outb>
  1002eb:	83 c4 10             	add    $0x10,%esp
  1002ee:	0f b7 83 14 60 00 00 	movzwl 0x6014(%ebx),%eax
  1002f5:	66 c1 e8 08          	shr    $0x8,%ax
  1002f9:	0f b6 c0             	movzbl %al,%eax
  1002fc:	8b 93 0c 60 00 00    	mov    0x600c(%ebx),%edx
  100302:	83 c2 01             	add    $0x1,%edx
  100305:	83 ec 08             	sub    $0x8,%esp
  100308:	50                   	push   %eax
  100309:	52                   	push   %edx
  10030a:	e8 3a 38 00 00       	call   103b49 <outb>
  10030f:	83 c4 10             	add    $0x10,%esp
  100312:	8b 83 0c 60 00 00    	mov    0x600c(%ebx),%eax
  100318:	83 ec 08             	sub    $0x8,%esp
  10031b:	6a 0f                	push   $0xf
  10031d:	50                   	push   %eax
  10031e:	e8 26 38 00 00       	call   103b49 <outb>
  100323:	83 c4 10             	add    $0x10,%esp
  100326:	0f b7 83 14 60 00 00 	movzwl 0x6014(%ebx),%eax
  10032d:	0f b6 c0             	movzbl %al,%eax
  100330:	8b 93 0c 60 00 00    	mov    0x600c(%ebx),%edx
  100336:	83 c2 01             	add    $0x1,%edx
  100339:	83 ec 08             	sub    $0x8,%esp
  10033c:	50                   	push   %eax
  10033d:	52                   	push   %edx
  10033e:	e8 06 38 00 00       	call   103b49 <outb>
  100343:	83 c4 10             	add    $0x10,%esp
  100346:	90                   	nop
  100347:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10034a:	5b                   	pop    %ebx
  10034b:	5e                   	pop    %esi
  10034c:	5d                   	pop    %ebp
  10034d:	c3                   	ret

0010034e <video_set_cursor>:
  10034e:	55                   	push   %ebp
  10034f:	89 e5                	mov    %esp,%ebp
  100351:	e8 66 00 00 00       	call   1003bc <__x86.get_pc_thunk.dx>
  100356:	81 c2 9e fc 00 00    	add    $0xfc9e,%edx
  10035c:	8b 45 08             	mov    0x8(%ebp),%eax
  10035f:	89 c1                	mov    %eax,%ecx
  100361:	89 c8                	mov    %ecx,%eax
  100363:	c1 e0 02             	shl    $0x2,%eax
  100366:	01 c8                	add    %ecx,%eax
  100368:	c1 e0 04             	shl    $0x4,%eax
  10036b:	89 c1                	mov    %eax,%ecx
  10036d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100370:	01 c8                	add    %ecx,%eax
  100372:	66 89 82 14 60 00 00 	mov    %ax,0x6014(%edx)
  100379:	90                   	nop
  10037a:	5d                   	pop    %ebp
  10037b:	c3                   	ret

0010037c <video_clear_screen>:
  10037c:	55                   	push   %ebp
  10037d:	89 e5                	mov    %esp,%ebp
  10037f:	83 ec 10             	sub    $0x10,%esp
  100382:	e8 31 00 00 00       	call   1003b8 <__x86.get_pc_thunk.ax>
  100387:	05 6d fc 00 00       	add    $0xfc6d,%eax
  10038c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100393:	eb 16                	jmp    1003ab <video_clear_screen+0x2f>
  100395:	8b 90 10 60 00 00    	mov    0x6010(%eax),%edx
  10039b:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  10039e:	01 c9                	add    %ecx,%ecx
  1003a0:	01 ca                	add    %ecx,%edx
  1003a2:	66 c7 02 20 00       	movw   $0x20,(%edx)
  1003a7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1003ab:	81 7d fc cf 07 00 00 	cmpl   $0x7cf,-0x4(%ebp)
  1003b2:	7e e1                	jle    100395 <video_clear_screen+0x19>
  1003b4:	90                   	nop
  1003b5:	90                   	nop
  1003b6:	c9                   	leave
  1003b7:	c3                   	ret

001003b8 <__x86.get_pc_thunk.ax>:
  1003b8:	8b 04 24             	mov    (%esp),%eax
  1003bb:	c3                   	ret

001003bc <__x86.get_pc_thunk.dx>:
  1003bc:	8b 14 24             	mov    (%esp),%edx
  1003bf:	c3                   	ret

001003c0 <__x86.get_pc_thunk.bx>:
  1003c0:	8b 1c 24             	mov    (%esp),%ebx
  1003c3:	c3                   	ret

001003c4 <cons_init>:
  1003c4:	55                   	push   %ebp
  1003c5:	89 e5                	mov    %esp,%ebp
  1003c7:	53                   	push   %ebx
  1003c8:	83 ec 04             	sub    $0x4,%esp
  1003cb:	e8 f0 ff ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1003d0:	81 c3 24 fc 00 00    	add    $0xfc24,%ebx
  1003d6:	83 ec 04             	sub    $0x4,%esp
  1003d9:	68 08 02 00 00       	push   $0x208
  1003de:	6a 00                	push   $0x0
  1003e0:	8d 83 2c 60 00 00    	lea    0x602c(%ebx),%eax
  1003e6:	50                   	push   %eax
  1003e7:	e8 ef 23 00 00       	call   1027db <memset>
  1003ec:	83 c4 10             	add    $0x10,%esp
  1003ef:	e8 2f 04 00 00       	call   100823 <serial_init>
  1003f4:	e8 07 fc ff ff       	call   100000 <video_init>
  1003f9:	90                   	nop
  1003fa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1003fd:	c9                   	leave
  1003fe:	c3                   	ret

001003ff <cons_intr>:
  1003ff:	55                   	push   %ebp
  100400:	89 e5                	mov    %esp,%ebp
  100402:	53                   	push   %ebx
  100403:	83 ec 14             	sub    $0x14,%esp
  100406:	e8 b5 ff ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  10040b:	81 c3 e9 fb 00 00    	add    $0xfbe9,%ebx
  100411:	eb 39                	jmp    10044c <cons_intr+0x4d>
  100413:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100417:	74 32                	je     10044b <cons_intr+0x4c>
  100419:	8b 83 30 62 00 00    	mov    0x6230(%ebx),%eax
  10041f:	8d 50 01             	lea    0x1(%eax),%edx
  100422:	89 93 30 62 00 00    	mov    %edx,0x6230(%ebx)
  100428:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10042b:	88 94 03 2c 60 00 00 	mov    %dl,0x602c(%ebx,%eax,1)
  100432:	8b 83 30 62 00 00    	mov    0x6230(%ebx),%eax
  100438:	3d 00 02 00 00       	cmp    $0x200,%eax
  10043d:	75 0d                	jne    10044c <cons_intr+0x4d>
  10043f:	c7 83 30 62 00 00 00 	movl   $0x0,0x6230(%ebx)
  100446:	00 00 00 
  100449:	eb 01                	jmp    10044c <cons_intr+0x4d>
  10044b:	90                   	nop
  10044c:	8b 45 08             	mov    0x8(%ebp),%eax
  10044f:	ff d0                	call   *%eax
  100451:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100454:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  100458:	75 b9                	jne    100413 <cons_intr+0x14>
  10045a:	90                   	nop
  10045b:	90                   	nop
  10045c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10045f:	c9                   	leave
  100460:	c3                   	ret

00100461 <cons_getc>:
  100461:	55                   	push   %ebp
  100462:	89 e5                	mov    %esp,%ebp
  100464:	53                   	push   %ebx
  100465:	83 ec 14             	sub    $0x14,%esp
  100468:	e8 53 ff ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  10046d:	81 c3 87 fb 00 00    	add    $0xfb87,%ebx
  100473:	e8 81 02 00 00       	call   1006f9 <serial_intr>
  100478:	e8 59 06 00 00       	call   100ad6 <keyboard_intr>
  10047d:	8b 93 2c 62 00 00    	mov    0x622c(%ebx),%edx
  100483:	8b 83 30 62 00 00    	mov    0x6230(%ebx),%eax
  100489:	39 c2                	cmp    %eax,%edx
  10048b:	74 39                	je     1004c6 <cons_getc+0x65>
  10048d:	8b 83 2c 62 00 00    	mov    0x622c(%ebx),%eax
  100493:	8d 50 01             	lea    0x1(%eax),%edx
  100496:	89 93 2c 62 00 00    	mov    %edx,0x622c(%ebx)
  10049c:	0f b6 84 03 2c 60 00 	movzbl 0x602c(%ebx,%eax,1),%eax
  1004a3:	00 
  1004a4:	0f be c0             	movsbl %al,%eax
  1004a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1004aa:	8b 83 2c 62 00 00    	mov    0x622c(%ebx),%eax
  1004b0:	3d 00 02 00 00       	cmp    $0x200,%eax
  1004b5:	75 0a                	jne    1004c1 <cons_getc+0x60>
  1004b7:	c7 83 2c 62 00 00 00 	movl   $0x0,0x622c(%ebx)
  1004be:	00 00 00 
  1004c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1004c4:	eb 05                	jmp    1004cb <cons_getc+0x6a>
  1004c6:	b8 00 00 00 00       	mov    $0x0,%eax
  1004cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1004ce:	c9                   	leave
  1004cf:	c3                   	ret

001004d0 <cons_putc>:
  1004d0:	55                   	push   %ebp
  1004d1:	89 e5                	mov    %esp,%ebp
  1004d3:	53                   	push   %ebx
  1004d4:	83 ec 14             	sub    $0x14,%esp
  1004d7:	e8 e4 fe ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1004dc:	81 c3 18 fb 00 00    	add    $0xfb18,%ebx
  1004e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1004e5:	88 45 f4             	mov    %al,-0xc(%ebp)
  1004e8:	0f be 45 f4          	movsbl -0xc(%ebp),%eax
  1004ec:	83 ec 0c             	sub    $0xc,%esp
  1004ef:	50                   	push   %eax
  1004f0:	e8 9d 02 00 00       	call   100792 <serial_putc>
  1004f5:	83 c4 10             	add    $0x10,%esp
  1004f8:	0f be 45 f4          	movsbl -0xc(%ebp),%eax
  1004fc:	83 ec 0c             	sub    $0xc,%esp
  1004ff:	50                   	push   %eax
  100500:	e8 0f fc ff ff       	call   100114 <video_putc>
  100505:	83 c4 10             	add    $0x10,%esp
  100508:	90                   	nop
  100509:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10050c:	c9                   	leave
  10050d:	c3                   	ret

0010050e <getchar>:
  10050e:	55                   	push   %ebp
  10050f:	89 e5                	mov    %esp,%ebp
  100511:	83 ec 18             	sub    $0x18,%esp
  100514:	e8 9f fe ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  100519:	05 db fa 00 00       	add    $0xfadb,%eax
  10051e:	90                   	nop
  10051f:	e8 3d ff ff ff       	call   100461 <cons_getc>
  100524:	88 45 f7             	mov    %al,-0x9(%ebp)
  100527:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  10052b:	74 f2                	je     10051f <getchar+0x11>
  10052d:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  100531:	c9                   	leave
  100532:	c3                   	ret

00100533 <putchar>:
  100533:	55                   	push   %ebp
  100534:	89 e5                	mov    %esp,%ebp
  100536:	83 ec 18             	sub    $0x18,%esp
  100539:	e8 7a fe ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  10053e:	05 b6 fa 00 00       	add    $0xfab6,%eax
  100543:	8b 45 08             	mov    0x8(%ebp),%eax
  100546:	88 45 f4             	mov    %al,-0xc(%ebp)
  100549:	0f be 45 f4          	movsbl -0xc(%ebp),%eax
  10054d:	83 ec 0c             	sub    $0xc,%esp
  100550:	50                   	push   %eax
  100551:	e8 7a ff ff ff       	call   1004d0 <cons_putc>
  100556:	83 c4 10             	add    $0x10,%esp
  100559:	90                   	nop
  10055a:	c9                   	leave
  10055b:	c3                   	ret

0010055c <readline>:
  10055c:	55                   	push   %ebp
  10055d:	89 e5                	mov    %esp,%ebp
  10055f:	53                   	push   %ebx
  100560:	83 ec 14             	sub    $0x14,%esp
  100563:	e8 58 fe ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  100568:	81 c3 8c fa 00 00    	add    $0xfa8c,%ebx
  10056e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100572:	74 15                	je     100589 <readline+0x2d>
  100574:	83 ec 08             	sub    $0x8,%esp
  100577:	ff 75 08             	push   0x8(%ebp)
  10057a:	8d 83 1a 90 ff ff    	lea    -0x6fe6(%ebx),%eax
  100580:	50                   	push   %eax
  100581:	e8 16 28 00 00       	call   102d9c <dprintf>
  100586:	83 c4 10             	add    $0x10,%esp
  100589:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100590:	e8 79 ff ff ff       	call   10050e <getchar>
  100595:	88 45 f3             	mov    %al,-0xd(%ebp)
  100598:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
  10059c:	79 21                	jns    1005bf <readline+0x63>
  10059e:	0f be 45 f3          	movsbl -0xd(%ebp),%eax
  1005a2:	83 ec 08             	sub    $0x8,%esp
  1005a5:	50                   	push   %eax
  1005a6:	8d 83 1d 90 ff ff    	lea    -0x6fe3(%ebx),%eax
  1005ac:	50                   	push   %eax
  1005ad:	e8 ea 27 00 00       	call   102d9c <dprintf>
  1005b2:	83 c4 10             	add    $0x10,%esp
  1005b5:	b8 00 00 00 00       	mov    $0x0,%eax
  1005ba:	e9 92 00 00 00       	jmp    100651 <readline+0xf5>
  1005bf:	80 7d f3 08          	cmpb   $0x8,-0xd(%ebp)
  1005c3:	74 06                	je     1005cb <readline+0x6f>
  1005c5:	80 7d f3 7f          	cmpb   $0x7f,-0xd(%ebp)
  1005c9:	75 19                	jne    1005e4 <readline+0x88>
  1005cb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1005cf:	7e 13                	jle    1005e4 <readline+0x88>
  1005d1:	83 ec 0c             	sub    $0xc,%esp
  1005d4:	6a 08                	push   $0x8
  1005d6:	e8 58 ff ff ff       	call   100533 <putchar>
  1005db:	83 c4 10             	add    $0x10,%esp
  1005de:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  1005e2:	eb 68                	jmp    10064c <readline+0xf0>
  1005e4:	80 7d f3 1f          	cmpb   $0x1f,-0xd(%ebp)
  1005e8:	7e 2f                	jle    100619 <readline+0xbd>
  1005ea:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  1005f1:	7f 26                	jg     100619 <readline+0xbd>
  1005f3:	0f be 45 f3          	movsbl -0xd(%ebp),%eax
  1005f7:	83 ec 0c             	sub    $0xc,%esp
  1005fa:	50                   	push   %eax
  1005fb:	e8 33 ff ff ff       	call   100533 <putchar>
  100600:	83 c4 10             	add    $0x10,%esp
  100603:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100606:	8d 50 01             	lea    0x1(%eax),%edx
  100609:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10060c:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
  100610:	88 94 03 4c 62 00 00 	mov    %dl,0x624c(%ebx,%eax,1)
  100617:	eb 33                	jmp    10064c <readline+0xf0>
  100619:	80 7d f3 0a          	cmpb   $0xa,-0xd(%ebp)
  10061d:	74 0a                	je     100629 <readline+0xcd>
  10061f:	80 7d f3 0d          	cmpb   $0xd,-0xd(%ebp)
  100623:	0f 85 67 ff ff ff    	jne    100590 <readline+0x34>
  100629:	83 ec 0c             	sub    $0xc,%esp
  10062c:	6a 0a                	push   $0xa
  10062e:	e8 00 ff ff ff       	call   100533 <putchar>
  100633:	83 c4 10             	add    $0x10,%esp
  100636:	8d 93 4c 62 00 00    	lea    0x624c(%ebx),%edx
  10063c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10063f:	01 d0                	add    %edx,%eax
  100641:	c6 00 00             	movb   $0x0,(%eax)
  100644:	8d 83 4c 62 00 00    	lea    0x624c(%ebx),%eax
  10064a:	eb 05                	jmp    100651 <readline+0xf5>
  10064c:	e9 3f ff ff ff       	jmp    100590 <readline+0x34>
  100651:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100654:	c9                   	leave
  100655:	c3                   	ret

00100656 <delay>:
  100656:	55                   	push   %ebp
  100657:	89 e5                	mov    %esp,%ebp
  100659:	53                   	push   %ebx
  10065a:	83 ec 04             	sub    $0x4,%esp
  10065d:	e8 5e fd ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  100662:	81 c3 92 f9 00 00    	add    $0xf992,%ebx
  100668:	83 ec 0c             	sub    $0xc,%esp
  10066b:	68 84 00 00 00       	push   $0x84
  100670:	e8 85 34 00 00       	call   103afa <inb>
  100675:	83 c4 10             	add    $0x10,%esp
  100678:	83 ec 0c             	sub    $0xc,%esp
  10067b:	68 84 00 00 00       	push   $0x84
  100680:	e8 75 34 00 00       	call   103afa <inb>
  100685:	83 c4 10             	add    $0x10,%esp
  100688:	83 ec 0c             	sub    $0xc,%esp
  10068b:	68 84 00 00 00       	push   $0x84
  100690:	e8 65 34 00 00       	call   103afa <inb>
  100695:	83 c4 10             	add    $0x10,%esp
  100698:	83 ec 0c             	sub    $0xc,%esp
  10069b:	68 84 00 00 00       	push   $0x84
  1006a0:	e8 55 34 00 00       	call   103afa <inb>
  1006a5:	83 c4 10             	add    $0x10,%esp
  1006a8:	90                   	nop
  1006a9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1006ac:	c9                   	leave
  1006ad:	c3                   	ret

001006ae <serial_proc_data>:
  1006ae:	55                   	push   %ebp
  1006af:	89 e5                	mov    %esp,%ebp
  1006b1:	53                   	push   %ebx
  1006b2:	83 ec 04             	sub    $0x4,%esp
  1006b5:	e8 06 fd ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1006ba:	81 c3 3a f9 00 00    	add    $0xf93a,%ebx
  1006c0:	83 ec 0c             	sub    $0xc,%esp
  1006c3:	68 fd 03 00 00       	push   $0x3fd
  1006c8:	e8 2d 34 00 00       	call   103afa <inb>
  1006cd:	83 c4 10             	add    $0x10,%esp
  1006d0:	0f b6 c0             	movzbl %al,%eax
  1006d3:	83 e0 01             	and    $0x1,%eax
  1006d6:	85 c0                	test   %eax,%eax
  1006d8:	75 07                	jne    1006e1 <serial_proc_data+0x33>
  1006da:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006df:	eb 13                	jmp    1006f4 <serial_proc_data+0x46>
  1006e1:	83 ec 0c             	sub    $0xc,%esp
  1006e4:	68 f8 03 00 00       	push   $0x3f8
  1006e9:	e8 0c 34 00 00       	call   103afa <inb>
  1006ee:	83 c4 10             	add    $0x10,%esp
  1006f1:	0f b6 c0             	movzbl %al,%eax
  1006f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1006f7:	c9                   	leave
  1006f8:	c3                   	ret

001006f9 <serial_intr>:
  1006f9:	55                   	push   %ebp
  1006fa:	89 e5                	mov    %esp,%ebp
  1006fc:	53                   	push   %ebx
  1006fd:	83 ec 04             	sub    $0x4,%esp
  100700:	e8 b3 fc ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  100705:	05 ef f8 00 00       	add    $0xf8ef,%eax
  10070a:	0f b6 90 4c 66 00 00 	movzbl 0x664c(%eax),%edx
  100711:	84 d2                	test   %dl,%dl
  100713:	74 14                	je     100729 <serial_intr+0x30>
  100715:	83 ec 0c             	sub    $0xc,%esp
  100718:	8d 90 ba 06 ff ff    	lea    -0xf946(%eax),%edx
  10071e:	52                   	push   %edx
  10071f:	89 c3                	mov    %eax,%ebx
  100721:	e8 d9 fc ff ff       	call   1003ff <cons_intr>
  100726:	83 c4 10             	add    $0x10,%esp
  100729:	90                   	nop
  10072a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10072d:	c9                   	leave
  10072e:	c3                   	ret

0010072f <serial_reformatnewline>:
  10072f:	55                   	push   %ebp
  100730:	89 e5                	mov    %esp,%ebp
  100732:	53                   	push   %ebx
  100733:	83 ec 14             	sub    $0x14,%esp
  100736:	e8 85 fc ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  10073b:	81 c3 b9 f8 00 00    	add    $0xf8b9,%ebx
  100741:	c7 45 f4 0d 00 00 00 	movl   $0xd,-0xc(%ebp)
  100748:	c7 45 f0 0a 00 00 00 	movl   $0xa,-0x10(%ebp)
  10074f:	8b 45 08             	mov    0x8(%ebp),%eax
  100752:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  100755:	75 31                	jne    100788 <serial_reformatnewline+0x59>
  100757:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10075a:	0f b6 c0             	movzbl %al,%eax
  10075d:	83 ec 08             	sub    $0x8,%esp
  100760:	50                   	push   %eax
  100761:	ff 75 0c             	push   0xc(%ebp)
  100764:	e8 e0 33 00 00       	call   103b49 <outb>
  100769:	83 c4 10             	add    $0x10,%esp
  10076c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10076f:	0f b6 c0             	movzbl %al,%eax
  100772:	83 ec 08             	sub    $0x8,%esp
  100775:	50                   	push   %eax
  100776:	ff 75 0c             	push   0xc(%ebp)
  100779:	e8 cb 33 00 00       	call   103b49 <outb>
  10077e:	83 c4 10             	add    $0x10,%esp
  100781:	b8 01 00 00 00       	mov    $0x1,%eax
  100786:	eb 05                	jmp    10078d <serial_reformatnewline+0x5e>
  100788:	b8 00 00 00 00       	mov    $0x0,%eax
  10078d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100790:	c9                   	leave
  100791:	c3                   	ret

00100792 <serial_putc>:
  100792:	55                   	push   %ebp
  100793:	89 e5                	mov    %esp,%ebp
  100795:	53                   	push   %ebx
  100796:	83 ec 24             	sub    $0x24,%esp
  100799:	e8 22 fc ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  10079e:	81 c3 56 f8 00 00    	add    $0xf856,%ebx
  1007a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1007a7:	88 45 e4             	mov    %al,-0x1c(%ebp)
  1007aa:	0f b6 83 4c 66 00 00 	movzbl 0x664c(%ebx),%eax
  1007b1:	84 c0                	test   %al,%al
  1007b3:	74 68                	je     10081d <serial_putc+0x8b>
  1007b5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1007bc:	eb 09                	jmp    1007c7 <serial_putc+0x35>
  1007be:	e8 93 fe ff ff       	call   100656 <delay>
  1007c3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1007c7:	83 ec 0c             	sub    $0xc,%esp
  1007ca:	68 fd 03 00 00       	push   $0x3fd
  1007cf:	e8 26 33 00 00       	call   103afa <inb>
  1007d4:	83 c4 10             	add    $0x10,%esp
  1007d7:	0f b6 c0             	movzbl %al,%eax
  1007da:	83 e0 20             	and    $0x20,%eax
  1007dd:	85 c0                	test   %eax,%eax
  1007df:	75 09                	jne    1007ea <serial_putc+0x58>
  1007e1:	81 7d f4 ff 31 00 00 	cmpl   $0x31ff,-0xc(%ebp)
  1007e8:	7e d4                	jle    1007be <serial_putc+0x2c>
  1007ea:	0f be 45 e4          	movsbl -0x1c(%ebp),%eax
  1007ee:	83 ec 08             	sub    $0x8,%esp
  1007f1:	68 f8 03 00 00       	push   $0x3f8
  1007f6:	50                   	push   %eax
  1007f7:	e8 33 ff ff ff       	call   10072f <serial_reformatnewline>
  1007fc:	83 c4 10             	add    $0x10,%esp
  1007ff:	85 c0                	test   %eax,%eax
  100801:	75 1b                	jne    10081e <serial_putc+0x8c>
  100803:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
  100807:	0f b6 c0             	movzbl %al,%eax
  10080a:	83 ec 08             	sub    $0x8,%esp
  10080d:	50                   	push   %eax
  10080e:	68 f8 03 00 00       	push   $0x3f8
  100813:	e8 31 33 00 00       	call   103b49 <outb>
  100818:	83 c4 10             	add    $0x10,%esp
  10081b:	eb 01                	jmp    10081e <serial_putc+0x8c>
  10081d:	90                   	nop
  10081e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100821:	c9                   	leave
  100822:	c3                   	ret

00100823 <serial_init>:
  100823:	55                   	push   %ebp
  100824:	89 e5                	mov    %esp,%ebp
  100826:	53                   	push   %ebx
  100827:	83 ec 04             	sub    $0x4,%esp
  10082a:	e8 91 fb ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  10082f:	81 c3 c5 f7 00 00    	add    $0xf7c5,%ebx
  100835:	83 ec 08             	sub    $0x8,%esp
  100838:	6a 00                	push   $0x0
  10083a:	68 f9 03 00 00       	push   $0x3f9
  10083f:	e8 05 33 00 00       	call   103b49 <outb>
  100844:	83 c4 10             	add    $0x10,%esp
  100847:	83 ec 08             	sub    $0x8,%esp
  10084a:	68 80 00 00 00       	push   $0x80
  10084f:	68 fb 03 00 00       	push   $0x3fb
  100854:	e8 f0 32 00 00       	call   103b49 <outb>
  100859:	83 c4 10             	add    $0x10,%esp
  10085c:	83 ec 08             	sub    $0x8,%esp
  10085f:	6a 01                	push   $0x1
  100861:	68 f8 03 00 00       	push   $0x3f8
  100866:	e8 de 32 00 00       	call   103b49 <outb>
  10086b:	83 c4 10             	add    $0x10,%esp
  10086e:	83 ec 08             	sub    $0x8,%esp
  100871:	6a 00                	push   $0x0
  100873:	68 f9 03 00 00       	push   $0x3f9
  100878:	e8 cc 32 00 00       	call   103b49 <outb>
  10087d:	83 c4 10             	add    $0x10,%esp
  100880:	83 ec 08             	sub    $0x8,%esp
  100883:	6a 03                	push   $0x3
  100885:	68 fb 03 00 00       	push   $0x3fb
  10088a:	e8 ba 32 00 00       	call   103b49 <outb>
  10088f:	83 c4 10             	add    $0x10,%esp
  100892:	83 ec 08             	sub    $0x8,%esp
  100895:	68 c7 00 00 00       	push   $0xc7
  10089a:	68 fa 03 00 00       	push   $0x3fa
  10089f:	e8 a5 32 00 00       	call   103b49 <outb>
  1008a4:	83 c4 10             	add    $0x10,%esp
  1008a7:	83 ec 08             	sub    $0x8,%esp
  1008aa:	6a 0b                	push   $0xb
  1008ac:	68 fc 03 00 00       	push   $0x3fc
  1008b1:	e8 93 32 00 00       	call   103b49 <outb>
  1008b6:	83 c4 10             	add    $0x10,%esp
  1008b9:	83 ec 0c             	sub    $0xc,%esp
  1008bc:	68 fd 03 00 00       	push   $0x3fd
  1008c1:	e8 34 32 00 00       	call   103afa <inb>
  1008c6:	83 c4 10             	add    $0x10,%esp
  1008c9:	3c ff                	cmp    $0xff,%al
  1008cb:	0f 95 c0             	setne  %al
  1008ce:	88 83 4c 66 00 00    	mov    %al,0x664c(%ebx)
  1008d4:	83 ec 0c             	sub    $0xc,%esp
  1008d7:	68 fa 03 00 00       	push   $0x3fa
  1008dc:	e8 19 32 00 00       	call   103afa <inb>
  1008e1:	83 c4 10             	add    $0x10,%esp
  1008e4:	83 ec 0c             	sub    $0xc,%esp
  1008e7:	68 f8 03 00 00       	push   $0x3f8
  1008ec:	e8 09 32 00 00       	call   103afa <inb>
  1008f1:	83 c4 10             	add    $0x10,%esp
  1008f4:	90                   	nop
  1008f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1008f8:	c9                   	leave
  1008f9:	c3                   	ret

001008fa <serial_intenable>:
  1008fa:	55                   	push   %ebp
  1008fb:	89 e5                	mov    %esp,%ebp
  1008fd:	53                   	push   %ebx
  1008fe:	83 ec 04             	sub    $0x4,%esp
  100901:	e8 b2 fa ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  100906:	05 ee f6 00 00       	add    $0xf6ee,%eax
  10090b:	0f b6 90 4c 66 00 00 	movzbl 0x664c(%eax),%edx
  100912:	84 d2                	test   %dl,%dl
  100914:	74 19                	je     10092f <serial_intenable+0x35>
  100916:	83 ec 08             	sub    $0x8,%esp
  100919:	6a 01                	push   $0x1
  10091b:	68 f9 03 00 00       	push   $0x3f9
  100920:	89 c3                	mov    %eax,%ebx
  100922:	e8 22 32 00 00       	call   103b49 <outb>
  100927:	83 c4 10             	add    $0x10,%esp
  10092a:	e8 ca fd ff ff       	call   1006f9 <serial_intr>
  10092f:	90                   	nop
  100930:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100933:	c9                   	leave
  100934:	c3                   	ret

00100935 <kbd_proc_data>:
  100935:	55                   	push   %ebp
  100936:	89 e5                	mov    %esp,%ebp
  100938:	53                   	push   %ebx
  100939:	83 ec 14             	sub    $0x14,%esp
  10093c:	e8 7f fa ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  100941:	81 c3 b3 f6 00 00    	add    $0xf6b3,%ebx
  100947:	83 ec 0c             	sub    $0xc,%esp
  10094a:	6a 64                	push   $0x64
  10094c:	e8 a9 31 00 00       	call   103afa <inb>
  100951:	83 c4 10             	add    $0x10,%esp
  100954:	0f b6 c0             	movzbl %al,%eax
  100957:	83 e0 01             	and    $0x1,%eax
  10095a:	85 c0                	test   %eax,%eax
  10095c:	75 0a                	jne    100968 <kbd_proc_data+0x33>
  10095e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100963:	e9 69 01 00 00       	jmp    100ad1 <kbd_proc_data+0x19c>
  100968:	83 ec 0c             	sub    $0xc,%esp
  10096b:	6a 60                	push   $0x60
  10096d:	e8 88 31 00 00       	call   103afa <inb>
  100972:	83 c4 10             	add    $0x10,%esp
  100975:	88 45 f3             	mov    %al,-0xd(%ebp)
  100978:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  10097c:	75 19                	jne    100997 <kbd_proc_data+0x62>
  10097e:	8b 83 50 66 00 00    	mov    0x6650(%ebx),%eax
  100984:	83 c8 40             	or     $0x40,%eax
  100987:	89 83 50 66 00 00    	mov    %eax,0x6650(%ebx)
  10098d:	b8 00 00 00 00       	mov    $0x0,%eax
  100992:	e9 3a 01 00 00       	jmp    100ad1 <kbd_proc_data+0x19c>
  100997:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10099b:	84 c0                	test   %al,%al
  10099d:	79 4b                	jns    1009ea <kbd_proc_data+0xb5>
  10099f:	8b 83 50 66 00 00    	mov    0x6650(%ebx),%eax
  1009a5:	83 e0 40             	and    $0x40,%eax
  1009a8:	85 c0                	test   %eax,%eax
  1009aa:	75 09                	jne    1009b5 <kbd_proc_data+0x80>
  1009ac:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1009b0:	83 e0 7f             	and    $0x7f,%eax
  1009b3:	eb 04                	jmp    1009b9 <kbd_proc_data+0x84>
  1009b5:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1009b9:	88 45 f3             	mov    %al,-0xd(%ebp)
  1009bc:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1009c0:	0f b6 84 03 0c 00 00 	movzbl 0xc(%ebx,%eax,1),%eax
  1009c7:	00 
  1009c8:	83 c8 40             	or     $0x40,%eax
  1009cb:	0f b6 c0             	movzbl %al,%eax
  1009ce:	f7 d0                	not    %eax
  1009d0:	89 c2                	mov    %eax,%edx
  1009d2:	8b 83 50 66 00 00    	mov    0x6650(%ebx),%eax
  1009d8:	21 d0                	and    %edx,%eax
  1009da:	89 83 50 66 00 00    	mov    %eax,0x6650(%ebx)
  1009e0:	b8 00 00 00 00       	mov    $0x0,%eax
  1009e5:	e9 e7 00 00 00       	jmp    100ad1 <kbd_proc_data+0x19c>
  1009ea:	8b 83 50 66 00 00    	mov    0x6650(%ebx),%eax
  1009f0:	83 e0 40             	and    $0x40,%eax
  1009f3:	85 c0                	test   %eax,%eax
  1009f5:	74 13                	je     100a0a <kbd_proc_data+0xd5>
  1009f7:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
  1009fb:	8b 83 50 66 00 00    	mov    0x6650(%ebx),%eax
  100a01:	83 e0 bf             	and    $0xffffffbf,%eax
  100a04:	89 83 50 66 00 00    	mov    %eax,0x6650(%ebx)
  100a0a:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100a0e:	0f b6 84 03 0c 00 00 	movzbl 0xc(%ebx,%eax,1),%eax
  100a15:	00 
  100a16:	0f b6 d0             	movzbl %al,%edx
  100a19:	8b 83 50 66 00 00    	mov    0x6650(%ebx),%eax
  100a1f:	09 d0                	or     %edx,%eax
  100a21:	89 83 50 66 00 00    	mov    %eax,0x6650(%ebx)
  100a27:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100a2b:	0f b6 84 03 0c 01 00 	movzbl 0x10c(%ebx,%eax,1),%eax
  100a32:	00 
  100a33:	0f b6 d0             	movzbl %al,%edx
  100a36:	8b 83 50 66 00 00    	mov    0x6650(%ebx),%eax
  100a3c:	31 d0                	xor    %edx,%eax
  100a3e:	89 83 50 66 00 00    	mov    %eax,0x6650(%ebx)
  100a44:	8b 83 50 66 00 00    	mov    0x6650(%ebx),%eax
  100a4a:	83 e0 03             	and    $0x3,%eax
  100a4d:	8b 94 83 0c 05 00 00 	mov    0x50c(%ebx,%eax,4),%edx
  100a54:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100a58:	01 d0                	add    %edx,%eax
  100a5a:	0f b6 00             	movzbl (%eax),%eax
  100a5d:	0f b6 c0             	movzbl %al,%eax
  100a60:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100a63:	8b 83 50 66 00 00    	mov    0x6650(%ebx),%eax
  100a69:	83 e0 08             	and    $0x8,%eax
  100a6c:	85 c0                	test   %eax,%eax
  100a6e:	74 22                	je     100a92 <kbd_proc_data+0x15d>
  100a70:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  100a74:	7e 0c                	jle    100a82 <kbd_proc_data+0x14d>
  100a76:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  100a7a:	7f 06                	jg     100a82 <kbd_proc_data+0x14d>
  100a7c:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  100a80:	eb 10                	jmp    100a92 <kbd_proc_data+0x15d>
  100a82:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  100a86:	7e 0a                	jle    100a92 <kbd_proc_data+0x15d>
  100a88:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  100a8c:	7f 04                	jg     100a92 <kbd_proc_data+0x15d>
  100a8e:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
  100a92:	8b 83 50 66 00 00    	mov    0x6650(%ebx),%eax
  100a98:	f7 d0                	not    %eax
  100a9a:	83 e0 06             	and    $0x6,%eax
  100a9d:	85 c0                	test   %eax,%eax
  100a9f:	75 2d                	jne    100ace <kbd_proc_data+0x199>
  100aa1:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  100aa8:	75 24                	jne    100ace <kbd_proc_data+0x199>
  100aaa:	83 ec 0c             	sub    $0xc,%esp
  100aad:	8d 83 2d 90 ff ff    	lea    -0x6fd3(%ebx),%eax
  100ab3:	50                   	push   %eax
  100ab4:	e8 e3 22 00 00       	call   102d9c <dprintf>
  100ab9:	83 c4 10             	add    $0x10,%esp
  100abc:	83 ec 08             	sub    $0x8,%esp
  100abf:	6a 03                	push   $0x3
  100ac1:	68 92 00 00 00       	push   $0x92
  100ac6:	e8 7e 30 00 00       	call   103b49 <outb>
  100acb:	83 c4 10             	add    $0x10,%esp
  100ace:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ad1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100ad4:	c9                   	leave
  100ad5:	c3                   	ret

00100ad6 <keyboard_intr>:
  100ad6:	55                   	push   %ebp
  100ad7:	89 e5                	mov    %esp,%ebp
  100ad9:	53                   	push   %ebx
  100ada:	83 ec 04             	sub    $0x4,%esp
  100add:	e8 d6 f8 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  100ae2:	05 12 f5 00 00       	add    $0xf512,%eax
  100ae7:	83 ec 0c             	sub    $0xc,%esp
  100aea:	8d 90 41 09 ff ff    	lea    -0xf6bf(%eax),%edx
  100af0:	52                   	push   %edx
  100af1:	89 c3                	mov    %eax,%ebx
  100af3:	e8 07 f9 ff ff       	call   1003ff <cons_intr>
  100af8:	83 c4 10             	add    $0x10,%esp
  100afb:	90                   	nop
  100afc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100aff:	c9                   	leave
  100b00:	c3                   	ret

00100b01 <devinit>:
  100b01:	55                   	push   %ebp
  100b02:	89 e5                	mov    %esp,%ebp
  100b04:	53                   	push   %ebx
  100b05:	83 ec 04             	sub    $0x4,%esp
  100b08:	e8 b3 f8 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  100b0d:	81 c3 e7 f4 00 00    	add    $0xf4e7,%ebx
  100b13:	e8 7c 27 00 00       	call   103294 <seg_init>
  100b18:	e8 21 2e 00 00       	call   10393e <enable_sse>
  100b1d:	e8 a2 f8 ff ff       	call   1003c4 <cons_init>
  100b22:	83 ec 04             	sub    $0x4,%esp
  100b25:	8d 83 39 90 ff ff    	lea    -0x6fc7(%ebx),%eax
  100b2b:	50                   	push   %eax
  100b2c:	6a 12                	push   $0x12
  100b2e:	8d 83 4c 90 ff ff    	lea    -0x6fb4(%ebx),%eax
  100b34:	50                   	push   %eax
  100b35:	e8 8f 1f 00 00       	call   102ac9 <debug_normal>
  100b3a:	83 c4 10             	add    $0x10,%esp
  100b3d:	ff 75 08             	push   0x8(%ebp)
  100b40:	8d 83 5f 90 ff ff    	lea    -0x6fa1(%ebx),%eax
  100b46:	50                   	push   %eax
  100b47:	6a 13                	push   $0x13
  100b49:	8d 83 4c 90 ff ff    	lea    -0x6fb4(%ebx),%eax
  100b4f:	50                   	push   %eax
  100b50:	e8 74 1f 00 00       	call   102ac9 <debug_normal>
  100b55:	83 c4 10             	add    $0x10,%esp
  100b58:	e8 a8 1a 00 00       	call   102605 <intr_init>
  100b5d:	83 ec 0c             	sub    $0xc,%esp
  100b60:	ff 75 08             	push   0x8(%ebp)
  100b63:	e8 a2 03 00 00       	call   100f0a <pmmap_init>
  100b68:	83 c4 10             	add    $0x10,%esp
  100b6b:	90                   	nop
  100b6c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100b6f:	c9                   	leave
  100b70:	c3                   	ret

00100b71 <pmmap_alloc_slot>:
  100b71:	55                   	push   %ebp
  100b72:	89 e5                	mov    %esp,%ebp
  100b74:	e8 43 f8 ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  100b79:	81 c2 7b f4 00 00    	add    $0xf47b,%edx
  100b7f:	8b 82 6c 70 00 00    	mov    0x706c(%edx),%eax
  100b85:	3d 80 00 00 00       	cmp    $0x80,%eax
  100b8a:	0f 94 c0             	sete   %al
  100b8d:	0f b6 c0             	movzbl %al,%eax
  100b90:	85 c0                	test   %eax,%eax
  100b92:	74 07                	je     100b9b <pmmap_alloc_slot+0x2a>
  100b94:	b8 00 00 00 00       	mov    $0x0,%eax
  100b99:	eb 21                	jmp    100bbc <pmmap_alloc_slot+0x4b>
  100b9b:	8b 8a 6c 70 00 00    	mov    0x706c(%edx),%ecx
  100ba1:	8d 41 01             	lea    0x1(%ecx),%eax
  100ba4:	89 82 6c 70 00 00    	mov    %eax,0x706c(%edx)
  100baa:	89 c8                	mov    %ecx,%eax
  100bac:	c1 e0 02             	shl    $0x2,%eax
  100baf:	01 c8                	add    %ecx,%eax
  100bb1:	c1 e0 02             	shl    $0x2,%eax
  100bb4:	8d 92 6c 66 00 00    	lea    0x666c(%edx),%edx
  100bba:	01 d0                	add    %edx,%eax
  100bbc:	5d                   	pop    %ebp
  100bbd:	c3                   	ret

00100bbe <pmmap_insert>:
  100bbe:	55                   	push   %ebp
  100bbf:	89 e5                	mov    %esp,%ebp
  100bc1:	53                   	push   %ebx
  100bc2:	83 ec 14             	sub    $0x14,%esp
  100bc5:	e8 f6 f7 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  100bca:	81 c3 2a f4 00 00    	add    $0xf42a,%ebx
  100bd0:	e8 9c ff ff ff       	call   100b71 <pmmap_alloc_slot>
  100bd5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100bd8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  100bdc:	75 1b                	jne    100bf9 <pmmap_insert+0x3b>
  100bde:	83 ec 04             	sub    $0x4,%esp
  100be1:	8d 83 78 90 ff ff    	lea    -0x6f88(%ebx),%eax
  100be7:	50                   	push   %eax
  100be8:	6a 3c                	push   $0x3c
  100bea:	8d 83 95 90 ff ff    	lea    -0x6f6b(%ebx),%eax
  100bf0:	50                   	push   %eax
  100bf1:	e8 8e 1f 00 00       	call   102b84 <debug_panic>
  100bf6:	83 c4 10             	add    $0x10,%esp
  100bf9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100bfc:	8b 55 08             	mov    0x8(%ebp),%edx
  100bff:	89 10                	mov    %edx,(%eax)
  100c01:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c04:	8b 55 0c             	mov    0xc(%ebp),%edx
  100c07:	89 50 04             	mov    %edx,0x4(%eax)
  100c0a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c0d:	8b 55 10             	mov    0x10(%ebp),%edx
  100c10:	89 50 08             	mov    %edx,0x8(%eax)
  100c13:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  100c1a:	8b 83 70 70 00 00    	mov    0x7070(%ebx),%eax
  100c20:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c23:	eb 19                	jmp    100c3e <pmmap_insert+0x80>
  100c25:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c28:	8b 00                	mov    (%eax),%eax
  100c2a:	39 45 08             	cmp    %eax,0x8(%ebp)
  100c2d:	72 17                	jb     100c46 <pmmap_insert+0x88>
  100c2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c32:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100c35:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c38:	8b 40 0c             	mov    0xc(%eax),%eax
  100c3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c3e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c42:	75 e1                	jne    100c25 <pmmap_insert+0x67>
  100c44:	eb 01                	jmp    100c47 <pmmap_insert+0x89>
  100c46:	90                   	nop
  100c47:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100c4b:	75 17                	jne    100c64 <pmmap_insert+0xa6>
  100c4d:	8b 93 70 70 00 00    	mov    0x7070(%ebx),%edx
  100c53:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c56:	89 50 0c             	mov    %edx,0xc(%eax)
  100c59:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c5c:	89 83 70 70 00 00    	mov    %eax,0x7070(%ebx)
  100c62:	eb 15                	jmp    100c79 <pmmap_insert+0xbb>
  100c64:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100c67:	8b 50 0c             	mov    0xc(%eax),%edx
  100c6a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c6d:	89 50 0c             	mov    %edx,0xc(%eax)
  100c70:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100c73:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100c76:	89 50 0c             	mov    %edx,0xc(%eax)
  100c79:	90                   	nop
  100c7a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100c7d:	c9                   	leave
  100c7e:	c3                   	ret

00100c7f <pmmap_merge>:
  100c7f:	55                   	push   %ebp
  100c80:	89 e5                	mov    %esp,%ebp
  100c82:	53                   	push   %ebx
  100c83:	83 ec 24             	sub    $0x24,%esp
  100c86:	e8 35 f7 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  100c8b:	81 c3 69 f3 00 00    	add    $0xf369,%ebx
  100c91:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  100c98:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  100c9f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100ca6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100cad:	8b 83 70 70 00 00    	mov    0x7070(%ebx),%eax
  100cb3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100cb6:	eb 73                	jmp    100d2b <pmmap_merge+0xac>
  100cb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cbb:	8b 40 0c             	mov    0xc(%eax),%eax
  100cbe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100cc1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100cc5:	74 6c                	je     100d33 <pmmap_merge+0xb4>
  100cc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cca:	8b 00                	mov    (%eax),%eax
  100ccc:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100ccf:	8b 12                	mov    (%edx),%edx
  100cd1:	39 c2                	cmp    %eax,%edx
  100cd3:	72 4d                	jb     100d22 <pmmap_merge+0xa3>
  100cd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cd8:	8b 50 04             	mov    0x4(%eax),%edx
  100cdb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100cde:	8b 00                	mov    (%eax),%eax
  100ce0:	39 c2                	cmp    %eax,%edx
  100ce2:	72 3e                	jb     100d22 <pmmap_merge+0xa3>
  100ce4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ce7:	8b 50 08             	mov    0x8(%eax),%edx
  100cea:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ced:	8b 40 08             	mov    0x8(%eax),%eax
  100cf0:	39 c2                	cmp    %eax,%edx
  100cf2:	75 2e                	jne    100d22 <pmmap_merge+0xa3>
  100cf4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100cf7:	8b 50 04             	mov    0x4(%eax),%edx
  100cfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cfd:	8b 40 04             	mov    0x4(%eax),%eax
  100d00:	83 ec 08             	sub    $0x8,%esp
  100d03:	52                   	push   %edx
  100d04:	50                   	push   %eax
  100d05:	e8 f7 2a 00 00       	call   103801 <max>
  100d0a:	83 c4 10             	add    $0x10,%esp
  100d0d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d10:	89 42 04             	mov    %eax,0x4(%edx)
  100d13:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d16:	8b 40 0c             	mov    0xc(%eax),%eax
  100d19:	8b 50 0c             	mov    0xc(%eax),%edx
  100d1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d1f:	89 50 0c             	mov    %edx,0xc(%eax)
  100d22:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d25:	8b 40 0c             	mov    0xc(%eax),%eax
  100d28:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d2b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100d2f:	75 87                	jne    100cb8 <pmmap_merge+0x39>
  100d31:	eb 01                	jmp    100d34 <pmmap_merge+0xb5>
  100d33:	90                   	nop
  100d34:	8b 83 70 70 00 00    	mov    0x7070(%ebx),%eax
  100d3a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d3d:	e9 cf 00 00 00       	jmp    100e11 <pmmap_merge+0x192>
  100d42:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d45:	8b 40 08             	mov    0x8(%eax),%eax
  100d48:	83 f8 01             	cmp    $0x1,%eax
  100d4b:	74 3d                	je     100d8a <pmmap_merge+0x10b>
  100d4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d50:	8b 40 08             	mov    0x8(%eax),%eax
  100d53:	83 f8 02             	cmp    $0x2,%eax
  100d56:	74 2b                	je     100d83 <pmmap_merge+0x104>
  100d58:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d5b:	8b 40 08             	mov    0x8(%eax),%eax
  100d5e:	83 f8 03             	cmp    $0x3,%eax
  100d61:	74 19                	je     100d7c <pmmap_merge+0xfd>
  100d63:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d66:	8b 40 08             	mov    0x8(%eax),%eax
  100d69:	83 f8 04             	cmp    $0x4,%eax
  100d6c:	75 07                	jne    100d75 <pmmap_merge+0xf6>
  100d6e:	b8 03 00 00 00       	mov    $0x3,%eax
  100d73:	eb 1a                	jmp    100d8f <pmmap_merge+0x110>
  100d75:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100d7a:	eb 13                	jmp    100d8f <pmmap_merge+0x110>
  100d7c:	b8 02 00 00 00       	mov    $0x2,%eax
  100d81:	eb 0c                	jmp    100d8f <pmmap_merge+0x110>
  100d83:	b8 01 00 00 00       	mov    $0x1,%eax
  100d88:	eb 05                	jmp    100d8f <pmmap_merge+0x110>
  100d8a:	b8 00 00 00 00       	mov    $0x0,%eax
  100d8f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100d92:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
  100d96:	75 1f                	jne    100db7 <pmmap_merge+0x138>
  100d98:	8d 83 a6 90 ff ff    	lea    -0x6f5a(%ebx),%eax
  100d9e:	50                   	push   %eax
  100d9f:	8d 83 b7 90 ff ff    	lea    -0x6f49(%ebx),%eax
  100da5:	50                   	push   %eax
  100da6:	6a 6b                	push   $0x6b
  100da8:	8d 83 95 90 ff ff    	lea    -0x6f6b(%ebx),%eax
  100dae:	50                   	push   %eax
  100daf:	e8 d0 1d 00 00       	call   102b84 <debug_panic>
  100db4:	83 c4 10             	add    $0x10,%esp
  100db7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100dba:	8b 44 85 dc          	mov    -0x24(%ebp,%eax,4),%eax
  100dbe:	85 c0                	test   %eax,%eax
  100dc0:	74 1f                	je     100de1 <pmmap_merge+0x162>
  100dc2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100dc5:	8b 44 85 dc          	mov    -0x24(%ebp,%eax,4),%eax
  100dc9:	8b 50 10             	mov    0x10(%eax),%edx
  100dcc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100dcf:	89 50 10             	mov    %edx,0x10(%eax)
  100dd2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100dd5:	8b 44 85 dc          	mov    -0x24(%ebp,%eax,4),%eax
  100dd9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100ddc:	89 50 10             	mov    %edx,0x10(%eax)
  100ddf:	eb 1d                	jmp    100dfe <pmmap_merge+0x17f>
  100de1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100de4:	8b 94 83 74 70 00 00 	mov    0x7074(%ebx,%eax,4),%edx
  100deb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100dee:	89 50 10             	mov    %edx,0x10(%eax)
  100df1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100df4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100df7:	89 94 83 74 70 00 00 	mov    %edx,0x7074(%ebx,%eax,4)
  100dfe:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100e01:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100e04:	89 54 85 dc          	mov    %edx,-0x24(%ebp,%eax,4)
  100e08:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e0b:	8b 40 0c             	mov    0xc(%eax),%eax
  100e0e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100e11:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100e15:	0f 85 27 ff ff ff    	jne    100d42 <pmmap_merge+0xc3>
  100e1b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100e1e:	85 c0                	test   %eax,%eax
  100e20:	74 0c                	je     100e2e <pmmap_merge+0x1af>
  100e22:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100e25:	8b 40 04             	mov    0x4(%eax),%eax
  100e28:	89 83 84 70 00 00    	mov    %eax,0x7084(%ebx)
  100e2e:	90                   	nop
  100e2f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100e32:	c9                   	leave
  100e33:	c3                   	ret

00100e34 <pmmap_dump>:
  100e34:	55                   	push   %ebp
  100e35:	89 e5                	mov    %esp,%ebp
  100e37:	53                   	push   %ebx
  100e38:	83 ec 14             	sub    $0x14,%esp
  100e3b:	e8 80 f5 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  100e40:	81 c3 b4 f1 00 00    	add    $0xf1b4,%ebx
  100e46:	8b 83 70 70 00 00    	mov    0x7070(%ebx),%eax
  100e4c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100e4f:	e9 a5 00 00 00       	jmp    100ef9 <pmmap_dump+0xc5>
  100e54:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e57:	8b 40 08             	mov    0x8(%eax),%eax
  100e5a:	83 f8 01             	cmp    $0x1,%eax
  100e5d:	74 41                	je     100ea0 <pmmap_dump+0x6c>
  100e5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e62:	8b 40 08             	mov    0x8(%eax),%eax
  100e65:	83 f8 02             	cmp    $0x2,%eax
  100e68:	74 2e                	je     100e98 <pmmap_dump+0x64>
  100e6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e6d:	8b 40 08             	mov    0x8(%eax),%eax
  100e70:	83 f8 03             	cmp    $0x3,%eax
  100e73:	74 1b                	je     100e90 <pmmap_dump+0x5c>
  100e75:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e78:	8b 40 08             	mov    0x8(%eax),%eax
  100e7b:	83 f8 04             	cmp    $0x4,%eax
  100e7e:	75 08                	jne    100e88 <pmmap_dump+0x54>
  100e80:	8d 83 d4 90 ff ff    	lea    -0x6f2c(%ebx),%eax
  100e86:	eb 1e                	jmp    100ea6 <pmmap_dump+0x72>
  100e88:	8d 83 dd 90 ff ff    	lea    -0x6f23(%ebx),%eax
  100e8e:	eb 16                	jmp    100ea6 <pmmap_dump+0x72>
  100e90:	8d 83 e5 90 ff ff    	lea    -0x6f1b(%ebx),%eax
  100e96:	eb 0e                	jmp    100ea6 <pmmap_dump+0x72>
  100e98:	8d 83 ef 90 ff ff    	lea    -0x6f11(%ebx),%eax
  100e9e:	eb 06                	jmp    100ea6 <pmmap_dump+0x72>
  100ea0:	8d 83 f8 90 ff ff    	lea    -0x6f08(%ebx),%eax
  100ea6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100ea9:	8b 0a                	mov    (%edx),%ecx
  100eab:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100eae:	8b 52 04             	mov    0x4(%edx),%edx
  100eb1:	39 d1                	cmp    %edx,%ecx
  100eb3:	75 08                	jne    100ebd <pmmap_dump+0x89>
  100eb5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100eb8:	8b 52 04             	mov    0x4(%edx),%edx
  100ebb:	eb 1c                	jmp    100ed9 <pmmap_dump+0xa5>
  100ebd:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100ec0:	8b 52 04             	mov    0x4(%edx),%edx
  100ec3:	83 fa ff             	cmp    $0xffffffff,%edx
  100ec6:	75 08                	jne    100ed0 <pmmap_dump+0x9c>
  100ec8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100ecb:	8b 52 04             	mov    0x4(%edx),%edx
  100ece:	eb 09                	jmp    100ed9 <pmmap_dump+0xa5>
  100ed0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100ed3:	8b 52 04             	mov    0x4(%edx),%edx
  100ed6:	83 ea 01             	sub    $0x1,%edx
  100ed9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  100edc:	8b 09                	mov    (%ecx),%ecx
  100ede:	50                   	push   %eax
  100edf:	52                   	push   %edx
  100ee0:	51                   	push   %ecx
  100ee1:	8d 83 00 91 ff ff    	lea    -0x6f00(%ebx),%eax
  100ee7:	50                   	push   %eax
  100ee8:	e8 ab 1b 00 00       	call   102a98 <debug_info>
  100eed:	83 c4 10             	add    $0x10,%esp
  100ef0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ef3:	8b 40 0c             	mov    0xc(%eax),%eax
  100ef6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100ef9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100efd:	0f 85 51 ff ff ff    	jne    100e54 <pmmap_dump+0x20>
  100f03:	90                   	nop
  100f04:	90                   	nop
  100f05:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100f08:	c9                   	leave
  100f09:	c3                   	ret

00100f0a <pmmap_init>:
  100f0a:	55                   	push   %ebp
  100f0b:	89 e5                	mov    %esp,%ebp
  100f0d:	53                   	push   %ebx
  100f0e:	83 ec 24             	sub    $0x24,%esp
  100f11:	e8 aa f4 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  100f16:	81 c3 de f0 00 00    	add    $0xf0de,%ebx
  100f1c:	83 ec 0c             	sub    $0xc,%esp
  100f1f:	8d 83 21 91 ff ff    	lea    -0x6edf(%ebx),%eax
  100f25:	50                   	push   %eax
  100f26:	e8 6d 1b 00 00       	call   102a98 <debug_info>
  100f2b:	83 c4 10             	add    $0x10,%esp
  100f2e:	8b 45 08             	mov    0x8(%ebp),%eax
  100f31:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100f34:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100f37:	8b 40 30             	mov    0x30(%eax),%eax
  100f3a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100f3d:	c7 83 70 70 00 00 00 	movl   $0x0,0x7070(%ebx)
  100f44:	00 00 00 
  100f47:	c7 83 74 70 00 00 00 	movl   $0x0,0x7074(%ebx)
  100f4e:	00 00 00 
  100f51:	c7 83 78 70 00 00 00 	movl   $0x0,0x7078(%ebx)
  100f58:	00 00 00 
  100f5b:	c7 83 7c 70 00 00 00 	movl   $0x0,0x707c(%ebx)
  100f62:	00 00 00 
  100f65:	c7 83 80 70 00 00 00 	movl   $0x0,0x7080(%ebx)
  100f6c:	00 00 00 
  100f6f:	eb 6c                	jmp    100fdd <pmmap_init+0xd3>
  100f71:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f74:	8b 40 08             	mov    0x8(%eax),%eax
  100f77:	85 c0                	test   %eax,%eax
  100f79:	75 58                	jne    100fd3 <pmmap_init+0xc9>
  100f7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f7e:	8b 40 04             	mov    0x4(%eax),%eax
  100f81:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  100f84:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f87:	8b 40 10             	mov    0x10(%eax),%eax
  100f8a:	85 c0                	test   %eax,%eax
  100f8c:	75 0f                	jne    100f9d <pmmap_init+0x93>
  100f8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f91:	8b 50 0c             	mov    0xc(%eax),%edx
  100f94:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100f97:	f7 d0                	not    %eax
  100f99:	39 c2                	cmp    %eax,%edx
  100f9b:	72 09                	jb     100fa6 <pmmap_init+0x9c>
  100f9d:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
  100fa4:	eb 0e                	jmp    100fb4 <pmmap_init+0xaa>
  100fa6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100fa9:	8b 50 0c             	mov    0xc(%eax),%edx
  100fac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100faf:	01 d0                	add    %edx,%eax
  100fb1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100fb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100fb7:	8b 40 14             	mov    0x14(%eax),%eax
  100fba:	89 45 e0             	mov    %eax,-0x20(%ebp)
  100fbd:	83 ec 04             	sub    $0x4,%esp
  100fc0:	ff 75 e0             	push   -0x20(%ebp)
  100fc3:	ff 75 f0             	push   -0x10(%ebp)
  100fc6:	ff 75 e4             	push   -0x1c(%ebp)
  100fc9:	e8 f0 fb ff ff       	call   100bbe <pmmap_insert>
  100fce:	83 c4 10             	add    $0x10,%esp
  100fd1:	eb 01                	jmp    100fd4 <pmmap_init+0xca>
  100fd3:	90                   	nop
  100fd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100fd7:	83 c0 18             	add    $0x18,%eax
  100fda:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100fdd:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100fe0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100fe3:	8b 40 30             	mov    0x30(%eax),%eax
  100fe6:	29 c2                	sub    %eax,%edx
  100fe8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100feb:	8b 40 2c             	mov    0x2c(%eax),%eax
  100fee:	39 c2                	cmp    %eax,%edx
  100ff0:	0f 82 7b ff ff ff    	jb     100f71 <pmmap_init+0x67>
  100ff6:	e8 84 fc ff ff       	call   100c7f <pmmap_merge>
  100ffb:	e8 34 fe ff ff       	call   100e34 <pmmap_dump>
  101000:	8b 83 70 70 00 00    	mov    0x7070(%ebx),%eax
  101006:	89 45 ec             	mov    %eax,-0x14(%ebp)
  101009:	eb 18                	jmp    101023 <pmmap_init+0x119>
  10100b:	8b 83 8c 70 00 00    	mov    0x708c(%ebx),%eax
  101011:	83 c0 01             	add    $0x1,%eax
  101014:	89 83 8c 70 00 00    	mov    %eax,0x708c(%ebx)
  10101a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10101d:	8b 40 0c             	mov    0xc(%eax),%eax
  101020:	89 45 ec             	mov    %eax,-0x14(%ebp)
  101023:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  101027:	75 e2                	jne    10100b <pmmap_init+0x101>
  101029:	8b 83 84 70 00 00    	mov    0x7084(%ebx),%eax
  10102f:	83 ec 08             	sub    $0x8,%esp
  101032:	68 00 10 00 00       	push   $0x1000
  101037:	50                   	push   %eax
  101038:	e8 f8 27 00 00       	call   103835 <rounddown>
  10103d:	83 c4 10             	add    $0x10,%esp
  101040:	c1 e8 0c             	shr    $0xc,%eax
  101043:	89 83 88 70 00 00    	mov    %eax,0x7088(%ebx)
  101049:	90                   	nop
  10104a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10104d:	c9                   	leave
  10104e:	c3                   	ret

0010104f <get_size>:
  10104f:	55                   	push   %ebp
  101050:	89 e5                	mov    %esp,%ebp
  101052:	e8 61 f3 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  101057:	05 9d ef 00 00       	add    $0xef9d,%eax
  10105c:	8b 80 8c 70 00 00    	mov    0x708c(%eax),%eax
  101062:	5d                   	pop    %ebp
  101063:	c3                   	ret

00101064 <get_mms>:
  101064:	55                   	push   %ebp
  101065:	89 e5                	mov    %esp,%ebp
  101067:	83 ec 10             	sub    $0x10,%esp
  10106a:	e8 49 f3 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  10106f:	05 85 ef 00 00       	add    $0xef85,%eax
  101074:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10107b:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  101082:	8b 90 70 70 00 00    	mov    0x7070(%eax),%edx
  101088:	89 55 f8             	mov    %edx,-0x8(%ebp)
  10108b:	eb 15                	jmp    1010a2 <get_mms+0x3e>
  10108d:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101090:	3b 55 08             	cmp    0x8(%ebp),%edx
  101093:	74 15                	je     1010aa <get_mms+0x46>
  101095:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101099:	8b 55 f8             	mov    -0x8(%ebp),%edx
  10109c:	8b 52 0c             	mov    0xc(%edx),%edx
  10109f:	89 55 f8             	mov    %edx,-0x8(%ebp)
  1010a2:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  1010a6:	75 e5                	jne    10108d <get_mms+0x29>
  1010a8:	eb 01                	jmp    1010ab <get_mms+0x47>
  1010aa:	90                   	nop
  1010ab:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  1010af:	74 0b                	je     1010bc <get_mms+0x58>
  1010b1:	8b 80 8c 70 00 00    	mov    0x708c(%eax),%eax
  1010b7:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1010ba:	75 07                	jne    1010c3 <get_mms+0x5f>
  1010bc:	b8 00 00 00 00       	mov    $0x0,%eax
  1010c1:	eb 05                	jmp    1010c8 <get_mms+0x64>
  1010c3:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1010c6:	8b 00                	mov    (%eax),%eax
  1010c8:	c9                   	leave
  1010c9:	c3                   	ret

001010ca <get_mml>:
  1010ca:	55                   	push   %ebp
  1010cb:	89 e5                	mov    %esp,%ebp
  1010cd:	83 ec 10             	sub    $0x10,%esp
  1010d0:	e8 e3 f2 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  1010d5:	05 1f ef 00 00       	add    $0xef1f,%eax
  1010da:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1010e1:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  1010e8:	8b 90 70 70 00 00    	mov    0x7070(%eax),%edx
  1010ee:	89 55 f8             	mov    %edx,-0x8(%ebp)
  1010f1:	eb 15                	jmp    101108 <get_mml+0x3e>
  1010f3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1010f6:	3b 55 08             	cmp    0x8(%ebp),%edx
  1010f9:	74 15                	je     101110 <get_mml+0x46>
  1010fb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1010ff:	8b 55 f8             	mov    -0x8(%ebp),%edx
  101102:	8b 52 0c             	mov    0xc(%edx),%edx
  101105:	89 55 f8             	mov    %edx,-0x8(%ebp)
  101108:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  10110c:	75 e5                	jne    1010f3 <get_mml+0x29>
  10110e:	eb 01                	jmp    101111 <get_mml+0x47>
  101110:	90                   	nop
  101111:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  101115:	74 0b                	je     101122 <get_mml+0x58>
  101117:	8b 80 8c 70 00 00    	mov    0x708c(%eax),%eax
  10111d:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  101120:	75 07                	jne    101129 <get_mml+0x5f>
  101122:	ba 00 00 00 00       	mov    $0x0,%edx
  101127:	eb 0d                	jmp    101136 <get_mml+0x6c>
  101129:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10112c:	8b 50 04             	mov    0x4(%eax),%edx
  10112f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101132:	8b 00                	mov    (%eax),%eax
  101134:	29 c2                	sub    %eax,%edx
  101136:	89 d0                	mov    %edx,%eax
  101138:	c9                   	leave
  101139:	c3                   	ret

0010113a <is_usable>:
  10113a:	55                   	push   %ebp
  10113b:	89 e5                	mov    %esp,%ebp
  10113d:	83 ec 10             	sub    $0x10,%esp
  101140:	e8 73 f2 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  101145:	05 af ee 00 00       	add    $0xeeaf,%eax
  10114a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101151:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  101158:	8b 90 70 70 00 00    	mov    0x7070(%eax),%edx
  10115e:	89 55 f8             	mov    %edx,-0x8(%ebp)
  101161:	eb 15                	jmp    101178 <is_usable+0x3e>
  101163:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101166:	3b 55 08             	cmp    0x8(%ebp),%edx
  101169:	74 15                	je     101180 <is_usable+0x46>
  10116b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10116f:	8b 55 f8             	mov    -0x8(%ebp),%edx
  101172:	8b 52 0c             	mov    0xc(%edx),%edx
  101175:	89 55 f8             	mov    %edx,-0x8(%ebp)
  101178:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  10117c:	75 e5                	jne    101163 <is_usable+0x29>
  10117e:	eb 01                	jmp    101181 <is_usable+0x47>
  101180:	90                   	nop
  101181:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  101185:	74 0b                	je     101192 <is_usable+0x58>
  101187:	8b 80 8c 70 00 00    	mov    0x708c(%eax),%eax
  10118d:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  101190:	75 07                	jne    101199 <is_usable+0x5f>
  101192:	b8 00 00 00 00       	mov    $0x0,%eax
  101197:	eb 0f                	jmp    1011a8 <is_usable+0x6e>
  101199:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10119c:	8b 40 08             	mov    0x8(%eax),%eax
  10119f:	83 f8 01             	cmp    $0x1,%eax
  1011a2:	0f 94 c0             	sete   %al
  1011a5:	0f b6 c0             	movzbl %al,%eax
  1011a8:	c9                   	leave
  1011a9:	c3                   	ret

001011aa <set_cr3>:
  1011aa:	55                   	push   %ebp
  1011ab:	89 e5                	mov    %esp,%ebp
  1011ad:	53                   	push   %ebx
  1011ae:	83 ec 04             	sub    $0x4,%esp
  1011b1:	e8 02 f2 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  1011b6:	05 3e ee 00 00       	add    $0xee3e,%eax
  1011bb:	8b 55 08             	mov    0x8(%ebp),%edx
  1011be:	83 ec 0c             	sub    $0xc,%esp
  1011c1:	52                   	push   %edx
  1011c2:	89 c3                	mov    %eax,%ebx
  1011c4:	e8 ea 28 00 00       	call   103ab3 <lcr3>
  1011c9:	83 c4 10             	add    $0x10,%esp
  1011cc:	90                   	nop
  1011cd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011d0:	c9                   	leave
  1011d1:	c3                   	ret

001011d2 <enable_paging>:
  1011d2:	55                   	push   %ebp
  1011d3:	89 e5                	mov    %esp,%ebp
  1011d5:	53                   	push   %ebx
  1011d6:	83 ec 14             	sub    $0x14,%esp
  1011d9:	e8 e2 f1 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1011de:	81 c3 16 ee 00 00    	add    $0xee16,%ebx
  1011e4:	e8 f6 28 00 00       	call   103adf <rcr4>
  1011e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1011ec:	81 4d f4 80 00 00 00 	orl    $0x80,-0xc(%ebp)
  1011f3:	83 ec 0c             	sub    $0xc,%esp
  1011f6:	ff 75 f4             	push   -0xc(%ebp)
  1011f9:	e8 cb 28 00 00       	call   103ac9 <lcr4>
  1011fe:	83 c4 10             	add    $0x10,%esp
  101201:	e8 77 28 00 00       	call   103a7d <rcr0>
  101206:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101209:	81 4d f0 23 00 05 80 	orl    $0x80050023,-0x10(%ebp)
  101210:	83 65 f0 f3          	andl   $0xfffffff3,-0x10(%ebp)
  101214:	83 ec 0c             	sub    $0xc,%esp
  101217:	ff 75 f0             	push   -0x10(%ebp)
  10121a:	e8 48 28 00 00       	call   103a67 <lcr0>
  10121f:	83 c4 10             	add    $0x10,%esp
  101222:	90                   	nop
  101223:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101226:	c9                   	leave
  101227:	c3                   	ret

00101228 <enable_pse>:
  101228:	55                   	push   %ebp
  101229:	89 e5                	mov    %esp,%ebp
  10122b:	53                   	push   %ebx
  10122c:	83 ec 14             	sub    $0x14,%esp
  10122f:	e8 8c f1 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  101234:	81 c3 c0 ed 00 00    	add    $0xedc0,%ebx
  10123a:	e8 a0 28 00 00       	call   103adf <rcr4>
  10123f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101242:	83 4d f4 10          	orl    $0x10,-0xc(%ebp)
  101246:	83 ec 0c             	sub    $0xc,%esp
  101249:	ff 75 f4             	push   -0xc(%ebp)
  10124c:	e8 78 28 00 00       	call   103ac9 <lcr4>
  101251:	83 c4 10             	add    $0x10,%esp
  101254:	90                   	nop
  101255:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101258:	c9                   	leave
  101259:	c3                   	ret

0010125a <intr_init_idt>:
  10125a:	55                   	push   %ebp
  10125b:	89 e5                	mov    %esp,%ebp
  10125d:	83 ec 10             	sub    $0x10,%esp
  101260:	e8 53 f1 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  101265:	05 8f ed 00 00       	add    $0xed8f,%eax
  10126a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101271:	e9 bb 00 00 00       	jmp    101331 <intr_init_idt+0xd7>
  101276:	c7 c2 9e 27 10 00    	mov    $0x10279e,%edx
  10127c:	89 d1                	mov    %edx,%ecx
  10127e:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101281:	66 89 8c d0 ac 70 00 	mov    %cx,0x70ac(%eax,%edx,8)
  101288:	00 
  101289:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10128c:	66 c7 84 d0 ae 70 00 	movw   $0x8,0x70ae(%eax,%edx,8)
  101293:	00 08 00 
  101296:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101299:	0f b6 8c d0 b0 70 00 	movzbl 0x70b0(%eax,%edx,8),%ecx
  1012a0:	00 
  1012a1:	83 e1 e0             	and    $0xffffffe0,%ecx
  1012a4:	88 8c d0 b0 70 00 00 	mov    %cl,0x70b0(%eax,%edx,8)
  1012ab:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1012ae:	0f b6 8c d0 b0 70 00 	movzbl 0x70b0(%eax,%edx,8),%ecx
  1012b5:	00 
  1012b6:	83 e1 1f             	and    $0x1f,%ecx
  1012b9:	88 8c d0 b0 70 00 00 	mov    %cl,0x70b0(%eax,%edx,8)
  1012c0:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1012c3:	0f b6 8c d0 b1 70 00 	movzbl 0x70b1(%eax,%edx,8),%ecx
  1012ca:	00 
  1012cb:	83 e1 f0             	and    $0xfffffff0,%ecx
  1012ce:	83 c9 0e             	or     $0xe,%ecx
  1012d1:	88 8c d0 b1 70 00 00 	mov    %cl,0x70b1(%eax,%edx,8)
  1012d8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1012db:	0f b6 8c d0 b1 70 00 	movzbl 0x70b1(%eax,%edx,8),%ecx
  1012e2:	00 
  1012e3:	83 e1 ef             	and    $0xffffffef,%ecx
  1012e6:	88 8c d0 b1 70 00 00 	mov    %cl,0x70b1(%eax,%edx,8)
  1012ed:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1012f0:	0f b6 8c d0 b1 70 00 	movzbl 0x70b1(%eax,%edx,8),%ecx
  1012f7:	00 
  1012f8:	83 e1 9f             	and    $0xffffff9f,%ecx
  1012fb:	88 8c d0 b1 70 00 00 	mov    %cl,0x70b1(%eax,%edx,8)
  101302:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101305:	0f b6 8c d0 b1 70 00 	movzbl 0x70b1(%eax,%edx,8),%ecx
  10130c:	00 
  10130d:	83 c9 80             	or     $0xffffff80,%ecx
  101310:	88 8c d0 b1 70 00 00 	mov    %cl,0x70b1(%eax,%edx,8)
  101317:	c7 c2 9e 27 10 00    	mov    $0x10279e,%edx
  10131d:	c1 ea 10             	shr    $0x10,%edx
  101320:	89 d1                	mov    %edx,%ecx
  101322:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101325:	66 89 8c d0 b2 70 00 	mov    %cx,0x70b2(%eax,%edx,8)
  10132c:	00 
  10132d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101331:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101334:	81 fa ff 00 00 00    	cmp    $0xff,%edx
  10133a:	0f 86 36 ff ff ff    	jbe    101276 <intr_init_idt+0x1c>
  101340:	c7 c2 40 26 10 00    	mov    $0x102640,%edx
  101346:	66 89 90 ac 70 00 00 	mov    %dx,0x70ac(%eax)
  10134d:	66 c7 80 ae 70 00 00 	movw   $0x8,0x70ae(%eax)
  101354:	08 00 
  101356:	0f b6 90 b0 70 00 00 	movzbl 0x70b0(%eax),%edx
  10135d:	83 e2 e0             	and    $0xffffffe0,%edx
  101360:	88 90 b0 70 00 00    	mov    %dl,0x70b0(%eax)
  101366:	0f b6 90 b0 70 00 00 	movzbl 0x70b0(%eax),%edx
  10136d:	83 e2 1f             	and    $0x1f,%edx
  101370:	88 90 b0 70 00 00    	mov    %dl,0x70b0(%eax)
  101376:	0f b6 90 b1 70 00 00 	movzbl 0x70b1(%eax),%edx
  10137d:	83 e2 f0             	and    $0xfffffff0,%edx
  101380:	83 ca 0e             	or     $0xe,%edx
  101383:	88 90 b1 70 00 00    	mov    %dl,0x70b1(%eax)
  101389:	0f b6 90 b1 70 00 00 	movzbl 0x70b1(%eax),%edx
  101390:	83 e2 ef             	and    $0xffffffef,%edx
  101393:	88 90 b1 70 00 00    	mov    %dl,0x70b1(%eax)
  101399:	0f b6 90 b1 70 00 00 	movzbl 0x70b1(%eax),%edx
  1013a0:	83 e2 9f             	and    $0xffffff9f,%edx
  1013a3:	88 90 b1 70 00 00    	mov    %dl,0x70b1(%eax)
  1013a9:	0f b6 90 b1 70 00 00 	movzbl 0x70b1(%eax),%edx
  1013b0:	83 ca 80             	or     $0xffffff80,%edx
  1013b3:	88 90 b1 70 00 00    	mov    %dl,0x70b1(%eax)
  1013b9:	c7 c2 40 26 10 00    	mov    $0x102640,%edx
  1013bf:	c1 ea 10             	shr    $0x10,%edx
  1013c2:	66 89 90 b2 70 00 00 	mov    %dx,0x70b2(%eax)
  1013c9:	c7 c2 4a 26 10 00    	mov    $0x10264a,%edx
  1013cf:	66 89 90 b4 70 00 00 	mov    %dx,0x70b4(%eax)
  1013d6:	66 c7 80 b6 70 00 00 	movw   $0x8,0x70b6(%eax)
  1013dd:	08 00 
  1013df:	0f b6 90 b8 70 00 00 	movzbl 0x70b8(%eax),%edx
  1013e6:	83 e2 e0             	and    $0xffffffe0,%edx
  1013e9:	88 90 b8 70 00 00    	mov    %dl,0x70b8(%eax)
  1013ef:	0f b6 90 b8 70 00 00 	movzbl 0x70b8(%eax),%edx
  1013f6:	83 e2 1f             	and    $0x1f,%edx
  1013f9:	88 90 b8 70 00 00    	mov    %dl,0x70b8(%eax)
  1013ff:	0f b6 90 b9 70 00 00 	movzbl 0x70b9(%eax),%edx
  101406:	83 e2 f0             	and    $0xfffffff0,%edx
  101409:	83 ca 0e             	or     $0xe,%edx
  10140c:	88 90 b9 70 00 00    	mov    %dl,0x70b9(%eax)
  101412:	0f b6 90 b9 70 00 00 	movzbl 0x70b9(%eax),%edx
  101419:	83 e2 ef             	and    $0xffffffef,%edx
  10141c:	88 90 b9 70 00 00    	mov    %dl,0x70b9(%eax)
  101422:	0f b6 90 b9 70 00 00 	movzbl 0x70b9(%eax),%edx
  101429:	83 e2 9f             	and    $0xffffff9f,%edx
  10142c:	88 90 b9 70 00 00    	mov    %dl,0x70b9(%eax)
  101432:	0f b6 90 b9 70 00 00 	movzbl 0x70b9(%eax),%edx
  101439:	83 ca 80             	or     $0xffffff80,%edx
  10143c:	88 90 b9 70 00 00    	mov    %dl,0x70b9(%eax)
  101442:	c7 c2 4a 26 10 00    	mov    $0x10264a,%edx
  101448:	c1 ea 10             	shr    $0x10,%edx
  10144b:	66 89 90 ba 70 00 00 	mov    %dx,0x70ba(%eax)
  101452:	c7 c2 54 26 10 00    	mov    $0x102654,%edx
  101458:	66 89 90 bc 70 00 00 	mov    %dx,0x70bc(%eax)
  10145f:	66 c7 80 be 70 00 00 	movw   $0x8,0x70be(%eax)
  101466:	08 00 
  101468:	0f b6 90 c0 70 00 00 	movzbl 0x70c0(%eax),%edx
  10146f:	83 e2 e0             	and    $0xffffffe0,%edx
  101472:	88 90 c0 70 00 00    	mov    %dl,0x70c0(%eax)
  101478:	0f b6 90 c0 70 00 00 	movzbl 0x70c0(%eax),%edx
  10147f:	83 e2 1f             	and    $0x1f,%edx
  101482:	88 90 c0 70 00 00    	mov    %dl,0x70c0(%eax)
  101488:	0f b6 90 c1 70 00 00 	movzbl 0x70c1(%eax),%edx
  10148f:	83 e2 f0             	and    $0xfffffff0,%edx
  101492:	83 ca 0e             	or     $0xe,%edx
  101495:	88 90 c1 70 00 00    	mov    %dl,0x70c1(%eax)
  10149b:	0f b6 90 c1 70 00 00 	movzbl 0x70c1(%eax),%edx
  1014a2:	83 e2 ef             	and    $0xffffffef,%edx
  1014a5:	88 90 c1 70 00 00    	mov    %dl,0x70c1(%eax)
  1014ab:	0f b6 90 c1 70 00 00 	movzbl 0x70c1(%eax),%edx
  1014b2:	83 e2 9f             	and    $0xffffff9f,%edx
  1014b5:	88 90 c1 70 00 00    	mov    %dl,0x70c1(%eax)
  1014bb:	0f b6 90 c1 70 00 00 	movzbl 0x70c1(%eax),%edx
  1014c2:	83 ca 80             	or     $0xffffff80,%edx
  1014c5:	88 90 c1 70 00 00    	mov    %dl,0x70c1(%eax)
  1014cb:	c7 c2 54 26 10 00    	mov    $0x102654,%edx
  1014d1:	c1 ea 10             	shr    $0x10,%edx
  1014d4:	66 89 90 c2 70 00 00 	mov    %dx,0x70c2(%eax)
  1014db:	c7 c2 5e 26 10 00    	mov    $0x10265e,%edx
  1014e1:	66 89 90 c4 70 00 00 	mov    %dx,0x70c4(%eax)
  1014e8:	66 c7 80 c6 70 00 00 	movw   $0x8,0x70c6(%eax)
  1014ef:	08 00 
  1014f1:	0f b6 90 c8 70 00 00 	movzbl 0x70c8(%eax),%edx
  1014f8:	83 e2 e0             	and    $0xffffffe0,%edx
  1014fb:	88 90 c8 70 00 00    	mov    %dl,0x70c8(%eax)
  101501:	0f b6 90 c8 70 00 00 	movzbl 0x70c8(%eax),%edx
  101508:	83 e2 1f             	and    $0x1f,%edx
  10150b:	88 90 c8 70 00 00    	mov    %dl,0x70c8(%eax)
  101511:	0f b6 90 c9 70 00 00 	movzbl 0x70c9(%eax),%edx
  101518:	83 e2 f0             	and    $0xfffffff0,%edx
  10151b:	83 ca 0e             	or     $0xe,%edx
  10151e:	88 90 c9 70 00 00    	mov    %dl,0x70c9(%eax)
  101524:	0f b6 90 c9 70 00 00 	movzbl 0x70c9(%eax),%edx
  10152b:	83 e2 ef             	and    $0xffffffef,%edx
  10152e:	88 90 c9 70 00 00    	mov    %dl,0x70c9(%eax)
  101534:	0f b6 90 c9 70 00 00 	movzbl 0x70c9(%eax),%edx
  10153b:	83 ca 60             	or     $0x60,%edx
  10153e:	88 90 c9 70 00 00    	mov    %dl,0x70c9(%eax)
  101544:	0f b6 90 c9 70 00 00 	movzbl 0x70c9(%eax),%edx
  10154b:	83 ca 80             	or     $0xffffff80,%edx
  10154e:	88 90 c9 70 00 00    	mov    %dl,0x70c9(%eax)
  101554:	c7 c2 5e 26 10 00    	mov    $0x10265e,%edx
  10155a:	c1 ea 10             	shr    $0x10,%edx
  10155d:	66 89 90 ca 70 00 00 	mov    %dx,0x70ca(%eax)
  101564:	c7 c2 68 26 10 00    	mov    $0x102668,%edx
  10156a:	66 89 90 cc 70 00 00 	mov    %dx,0x70cc(%eax)
  101571:	66 c7 80 ce 70 00 00 	movw   $0x8,0x70ce(%eax)
  101578:	08 00 
  10157a:	0f b6 90 d0 70 00 00 	movzbl 0x70d0(%eax),%edx
  101581:	83 e2 e0             	and    $0xffffffe0,%edx
  101584:	88 90 d0 70 00 00    	mov    %dl,0x70d0(%eax)
  10158a:	0f b6 90 d0 70 00 00 	movzbl 0x70d0(%eax),%edx
  101591:	83 e2 1f             	and    $0x1f,%edx
  101594:	88 90 d0 70 00 00    	mov    %dl,0x70d0(%eax)
  10159a:	0f b6 90 d1 70 00 00 	movzbl 0x70d1(%eax),%edx
  1015a1:	83 e2 f0             	and    $0xfffffff0,%edx
  1015a4:	83 ca 0e             	or     $0xe,%edx
  1015a7:	88 90 d1 70 00 00    	mov    %dl,0x70d1(%eax)
  1015ad:	0f b6 90 d1 70 00 00 	movzbl 0x70d1(%eax),%edx
  1015b4:	83 e2 ef             	and    $0xffffffef,%edx
  1015b7:	88 90 d1 70 00 00    	mov    %dl,0x70d1(%eax)
  1015bd:	0f b6 90 d1 70 00 00 	movzbl 0x70d1(%eax),%edx
  1015c4:	83 ca 60             	or     $0x60,%edx
  1015c7:	88 90 d1 70 00 00    	mov    %dl,0x70d1(%eax)
  1015cd:	0f b6 90 d1 70 00 00 	movzbl 0x70d1(%eax),%edx
  1015d4:	83 ca 80             	or     $0xffffff80,%edx
  1015d7:	88 90 d1 70 00 00    	mov    %dl,0x70d1(%eax)
  1015dd:	c7 c2 68 26 10 00    	mov    $0x102668,%edx
  1015e3:	c1 ea 10             	shr    $0x10,%edx
  1015e6:	66 89 90 d2 70 00 00 	mov    %dx,0x70d2(%eax)
  1015ed:	c7 c2 72 26 10 00    	mov    $0x102672,%edx
  1015f3:	66 89 90 d4 70 00 00 	mov    %dx,0x70d4(%eax)
  1015fa:	66 c7 80 d6 70 00 00 	movw   $0x8,0x70d6(%eax)
  101601:	08 00 
  101603:	0f b6 90 d8 70 00 00 	movzbl 0x70d8(%eax),%edx
  10160a:	83 e2 e0             	and    $0xffffffe0,%edx
  10160d:	88 90 d8 70 00 00    	mov    %dl,0x70d8(%eax)
  101613:	0f b6 90 d8 70 00 00 	movzbl 0x70d8(%eax),%edx
  10161a:	83 e2 1f             	and    $0x1f,%edx
  10161d:	88 90 d8 70 00 00    	mov    %dl,0x70d8(%eax)
  101623:	0f b6 90 d9 70 00 00 	movzbl 0x70d9(%eax),%edx
  10162a:	83 e2 f0             	and    $0xfffffff0,%edx
  10162d:	83 ca 0e             	or     $0xe,%edx
  101630:	88 90 d9 70 00 00    	mov    %dl,0x70d9(%eax)
  101636:	0f b6 90 d9 70 00 00 	movzbl 0x70d9(%eax),%edx
  10163d:	83 e2 ef             	and    $0xffffffef,%edx
  101640:	88 90 d9 70 00 00    	mov    %dl,0x70d9(%eax)
  101646:	0f b6 90 d9 70 00 00 	movzbl 0x70d9(%eax),%edx
  10164d:	83 e2 9f             	and    $0xffffff9f,%edx
  101650:	88 90 d9 70 00 00    	mov    %dl,0x70d9(%eax)
  101656:	0f b6 90 d9 70 00 00 	movzbl 0x70d9(%eax),%edx
  10165d:	83 ca 80             	or     $0xffffff80,%edx
  101660:	88 90 d9 70 00 00    	mov    %dl,0x70d9(%eax)
  101666:	c7 c2 72 26 10 00    	mov    $0x102672,%edx
  10166c:	c1 ea 10             	shr    $0x10,%edx
  10166f:	66 89 90 da 70 00 00 	mov    %dx,0x70da(%eax)
  101676:	c7 c2 7c 26 10 00    	mov    $0x10267c,%edx
  10167c:	66 89 90 dc 70 00 00 	mov    %dx,0x70dc(%eax)
  101683:	66 c7 80 de 70 00 00 	movw   $0x8,0x70de(%eax)
  10168a:	08 00 
  10168c:	0f b6 90 e0 70 00 00 	movzbl 0x70e0(%eax),%edx
  101693:	83 e2 e0             	and    $0xffffffe0,%edx
  101696:	88 90 e0 70 00 00    	mov    %dl,0x70e0(%eax)
  10169c:	0f b6 90 e0 70 00 00 	movzbl 0x70e0(%eax),%edx
  1016a3:	83 e2 1f             	and    $0x1f,%edx
  1016a6:	88 90 e0 70 00 00    	mov    %dl,0x70e0(%eax)
  1016ac:	0f b6 90 e1 70 00 00 	movzbl 0x70e1(%eax),%edx
  1016b3:	83 e2 f0             	and    $0xfffffff0,%edx
  1016b6:	83 ca 0e             	or     $0xe,%edx
  1016b9:	88 90 e1 70 00 00    	mov    %dl,0x70e1(%eax)
  1016bf:	0f b6 90 e1 70 00 00 	movzbl 0x70e1(%eax),%edx
  1016c6:	83 e2 ef             	and    $0xffffffef,%edx
  1016c9:	88 90 e1 70 00 00    	mov    %dl,0x70e1(%eax)
  1016cf:	0f b6 90 e1 70 00 00 	movzbl 0x70e1(%eax),%edx
  1016d6:	83 e2 9f             	and    $0xffffff9f,%edx
  1016d9:	88 90 e1 70 00 00    	mov    %dl,0x70e1(%eax)
  1016df:	0f b6 90 e1 70 00 00 	movzbl 0x70e1(%eax),%edx
  1016e6:	83 ca 80             	or     $0xffffff80,%edx
  1016e9:	88 90 e1 70 00 00    	mov    %dl,0x70e1(%eax)
  1016ef:	c7 c2 7c 26 10 00    	mov    $0x10267c,%edx
  1016f5:	c1 ea 10             	shr    $0x10,%edx
  1016f8:	66 89 90 e2 70 00 00 	mov    %dx,0x70e2(%eax)
  1016ff:	c7 c2 86 26 10 00    	mov    $0x102686,%edx
  101705:	66 89 90 e4 70 00 00 	mov    %dx,0x70e4(%eax)
  10170c:	66 c7 80 e6 70 00 00 	movw   $0x8,0x70e6(%eax)
  101713:	08 00 
  101715:	0f b6 90 e8 70 00 00 	movzbl 0x70e8(%eax),%edx
  10171c:	83 e2 e0             	and    $0xffffffe0,%edx
  10171f:	88 90 e8 70 00 00    	mov    %dl,0x70e8(%eax)
  101725:	0f b6 90 e8 70 00 00 	movzbl 0x70e8(%eax),%edx
  10172c:	83 e2 1f             	and    $0x1f,%edx
  10172f:	88 90 e8 70 00 00    	mov    %dl,0x70e8(%eax)
  101735:	0f b6 90 e9 70 00 00 	movzbl 0x70e9(%eax),%edx
  10173c:	83 e2 f0             	and    $0xfffffff0,%edx
  10173f:	83 ca 0e             	or     $0xe,%edx
  101742:	88 90 e9 70 00 00    	mov    %dl,0x70e9(%eax)
  101748:	0f b6 90 e9 70 00 00 	movzbl 0x70e9(%eax),%edx
  10174f:	83 e2 ef             	and    $0xffffffef,%edx
  101752:	88 90 e9 70 00 00    	mov    %dl,0x70e9(%eax)
  101758:	0f b6 90 e9 70 00 00 	movzbl 0x70e9(%eax),%edx
  10175f:	83 e2 9f             	and    $0xffffff9f,%edx
  101762:	88 90 e9 70 00 00    	mov    %dl,0x70e9(%eax)
  101768:	0f b6 90 e9 70 00 00 	movzbl 0x70e9(%eax),%edx
  10176f:	83 ca 80             	or     $0xffffff80,%edx
  101772:	88 90 e9 70 00 00    	mov    %dl,0x70e9(%eax)
  101778:	c7 c2 86 26 10 00    	mov    $0x102686,%edx
  10177e:	c1 ea 10             	shr    $0x10,%edx
  101781:	66 89 90 ea 70 00 00 	mov    %dx,0x70ea(%eax)
  101788:	c7 c2 90 26 10 00    	mov    $0x102690,%edx
  10178e:	66 89 90 ec 70 00 00 	mov    %dx,0x70ec(%eax)
  101795:	66 c7 80 ee 70 00 00 	movw   $0x8,0x70ee(%eax)
  10179c:	08 00 
  10179e:	0f b6 90 f0 70 00 00 	movzbl 0x70f0(%eax),%edx
  1017a5:	83 e2 e0             	and    $0xffffffe0,%edx
  1017a8:	88 90 f0 70 00 00    	mov    %dl,0x70f0(%eax)
  1017ae:	0f b6 90 f0 70 00 00 	movzbl 0x70f0(%eax),%edx
  1017b5:	83 e2 1f             	and    $0x1f,%edx
  1017b8:	88 90 f0 70 00 00    	mov    %dl,0x70f0(%eax)
  1017be:	0f b6 90 f1 70 00 00 	movzbl 0x70f1(%eax),%edx
  1017c5:	83 e2 f0             	and    $0xfffffff0,%edx
  1017c8:	83 ca 0e             	or     $0xe,%edx
  1017cb:	88 90 f1 70 00 00    	mov    %dl,0x70f1(%eax)
  1017d1:	0f b6 90 f1 70 00 00 	movzbl 0x70f1(%eax),%edx
  1017d8:	83 e2 ef             	and    $0xffffffef,%edx
  1017db:	88 90 f1 70 00 00    	mov    %dl,0x70f1(%eax)
  1017e1:	0f b6 90 f1 70 00 00 	movzbl 0x70f1(%eax),%edx
  1017e8:	83 e2 9f             	and    $0xffffff9f,%edx
  1017eb:	88 90 f1 70 00 00    	mov    %dl,0x70f1(%eax)
  1017f1:	0f b6 90 f1 70 00 00 	movzbl 0x70f1(%eax),%edx
  1017f8:	83 ca 80             	or     $0xffffff80,%edx
  1017fb:	88 90 f1 70 00 00    	mov    %dl,0x70f1(%eax)
  101801:	c7 c2 90 26 10 00    	mov    $0x102690,%edx
  101807:	c1 ea 10             	shr    $0x10,%edx
  10180a:	66 89 90 f2 70 00 00 	mov    %dx,0x70f2(%eax)
  101811:	c7 c2 a2 26 10 00    	mov    $0x1026a2,%edx
  101817:	66 89 90 fc 70 00 00 	mov    %dx,0x70fc(%eax)
  10181e:	66 c7 80 fe 70 00 00 	movw   $0x8,0x70fe(%eax)
  101825:	08 00 
  101827:	0f b6 90 00 71 00 00 	movzbl 0x7100(%eax),%edx
  10182e:	83 e2 e0             	and    $0xffffffe0,%edx
  101831:	88 90 00 71 00 00    	mov    %dl,0x7100(%eax)
  101837:	0f b6 90 00 71 00 00 	movzbl 0x7100(%eax),%edx
  10183e:	83 e2 1f             	and    $0x1f,%edx
  101841:	88 90 00 71 00 00    	mov    %dl,0x7100(%eax)
  101847:	0f b6 90 01 71 00 00 	movzbl 0x7101(%eax),%edx
  10184e:	83 e2 f0             	and    $0xfffffff0,%edx
  101851:	83 ca 0e             	or     $0xe,%edx
  101854:	88 90 01 71 00 00    	mov    %dl,0x7101(%eax)
  10185a:	0f b6 90 01 71 00 00 	movzbl 0x7101(%eax),%edx
  101861:	83 e2 ef             	and    $0xffffffef,%edx
  101864:	88 90 01 71 00 00    	mov    %dl,0x7101(%eax)
  10186a:	0f b6 90 01 71 00 00 	movzbl 0x7101(%eax),%edx
  101871:	83 e2 9f             	and    $0xffffff9f,%edx
  101874:	88 90 01 71 00 00    	mov    %dl,0x7101(%eax)
  10187a:	0f b6 90 01 71 00 00 	movzbl 0x7101(%eax),%edx
  101881:	83 ca 80             	or     $0xffffff80,%edx
  101884:	88 90 01 71 00 00    	mov    %dl,0x7101(%eax)
  10188a:	c7 c2 a2 26 10 00    	mov    $0x1026a2,%edx
  101890:	c1 ea 10             	shr    $0x10,%edx
  101893:	66 89 90 02 71 00 00 	mov    %dx,0x7102(%eax)
  10189a:	c7 c2 aa 26 10 00    	mov    $0x1026aa,%edx
  1018a0:	66 89 90 04 71 00 00 	mov    %dx,0x7104(%eax)
  1018a7:	66 c7 80 06 71 00 00 	movw   $0x8,0x7106(%eax)
  1018ae:	08 00 
  1018b0:	0f b6 90 08 71 00 00 	movzbl 0x7108(%eax),%edx
  1018b7:	83 e2 e0             	and    $0xffffffe0,%edx
  1018ba:	88 90 08 71 00 00    	mov    %dl,0x7108(%eax)
  1018c0:	0f b6 90 08 71 00 00 	movzbl 0x7108(%eax),%edx
  1018c7:	83 e2 1f             	and    $0x1f,%edx
  1018ca:	88 90 08 71 00 00    	mov    %dl,0x7108(%eax)
  1018d0:	0f b6 90 09 71 00 00 	movzbl 0x7109(%eax),%edx
  1018d7:	83 e2 f0             	and    $0xfffffff0,%edx
  1018da:	83 ca 0e             	or     $0xe,%edx
  1018dd:	88 90 09 71 00 00    	mov    %dl,0x7109(%eax)
  1018e3:	0f b6 90 09 71 00 00 	movzbl 0x7109(%eax),%edx
  1018ea:	83 e2 ef             	and    $0xffffffef,%edx
  1018ed:	88 90 09 71 00 00    	mov    %dl,0x7109(%eax)
  1018f3:	0f b6 90 09 71 00 00 	movzbl 0x7109(%eax),%edx
  1018fa:	83 e2 9f             	and    $0xffffff9f,%edx
  1018fd:	88 90 09 71 00 00    	mov    %dl,0x7109(%eax)
  101903:	0f b6 90 09 71 00 00 	movzbl 0x7109(%eax),%edx
  10190a:	83 ca 80             	or     $0xffffff80,%edx
  10190d:	88 90 09 71 00 00    	mov    %dl,0x7109(%eax)
  101913:	c7 c2 aa 26 10 00    	mov    $0x1026aa,%edx
  101919:	c1 ea 10             	shr    $0x10,%edx
  10191c:	66 89 90 0a 71 00 00 	mov    %dx,0x710a(%eax)
  101923:	c7 c2 b2 26 10 00    	mov    $0x1026b2,%edx
  101929:	66 89 90 0c 71 00 00 	mov    %dx,0x710c(%eax)
  101930:	66 c7 80 0e 71 00 00 	movw   $0x8,0x710e(%eax)
  101937:	08 00 
  101939:	0f b6 90 10 71 00 00 	movzbl 0x7110(%eax),%edx
  101940:	83 e2 e0             	and    $0xffffffe0,%edx
  101943:	88 90 10 71 00 00    	mov    %dl,0x7110(%eax)
  101949:	0f b6 90 10 71 00 00 	movzbl 0x7110(%eax),%edx
  101950:	83 e2 1f             	and    $0x1f,%edx
  101953:	88 90 10 71 00 00    	mov    %dl,0x7110(%eax)
  101959:	0f b6 90 11 71 00 00 	movzbl 0x7111(%eax),%edx
  101960:	83 e2 f0             	and    $0xfffffff0,%edx
  101963:	83 ca 0e             	or     $0xe,%edx
  101966:	88 90 11 71 00 00    	mov    %dl,0x7111(%eax)
  10196c:	0f b6 90 11 71 00 00 	movzbl 0x7111(%eax),%edx
  101973:	83 e2 ef             	and    $0xffffffef,%edx
  101976:	88 90 11 71 00 00    	mov    %dl,0x7111(%eax)
  10197c:	0f b6 90 11 71 00 00 	movzbl 0x7111(%eax),%edx
  101983:	83 e2 9f             	and    $0xffffff9f,%edx
  101986:	88 90 11 71 00 00    	mov    %dl,0x7111(%eax)
  10198c:	0f b6 90 11 71 00 00 	movzbl 0x7111(%eax),%edx
  101993:	83 ca 80             	or     $0xffffff80,%edx
  101996:	88 90 11 71 00 00    	mov    %dl,0x7111(%eax)
  10199c:	c7 c2 b2 26 10 00    	mov    $0x1026b2,%edx
  1019a2:	c1 ea 10             	shr    $0x10,%edx
  1019a5:	66 89 90 12 71 00 00 	mov    %dx,0x7112(%eax)
  1019ac:	c7 c2 ba 26 10 00    	mov    $0x1026ba,%edx
  1019b2:	66 89 90 14 71 00 00 	mov    %dx,0x7114(%eax)
  1019b9:	66 c7 80 16 71 00 00 	movw   $0x8,0x7116(%eax)
  1019c0:	08 00 
  1019c2:	0f b6 90 18 71 00 00 	movzbl 0x7118(%eax),%edx
  1019c9:	83 e2 e0             	and    $0xffffffe0,%edx
  1019cc:	88 90 18 71 00 00    	mov    %dl,0x7118(%eax)
  1019d2:	0f b6 90 18 71 00 00 	movzbl 0x7118(%eax),%edx
  1019d9:	83 e2 1f             	and    $0x1f,%edx
  1019dc:	88 90 18 71 00 00    	mov    %dl,0x7118(%eax)
  1019e2:	0f b6 90 19 71 00 00 	movzbl 0x7119(%eax),%edx
  1019e9:	83 e2 f0             	and    $0xfffffff0,%edx
  1019ec:	83 ca 0e             	or     $0xe,%edx
  1019ef:	88 90 19 71 00 00    	mov    %dl,0x7119(%eax)
  1019f5:	0f b6 90 19 71 00 00 	movzbl 0x7119(%eax),%edx
  1019fc:	83 e2 ef             	and    $0xffffffef,%edx
  1019ff:	88 90 19 71 00 00    	mov    %dl,0x7119(%eax)
  101a05:	0f b6 90 19 71 00 00 	movzbl 0x7119(%eax),%edx
  101a0c:	83 e2 9f             	and    $0xffffff9f,%edx
  101a0f:	88 90 19 71 00 00    	mov    %dl,0x7119(%eax)
  101a15:	0f b6 90 19 71 00 00 	movzbl 0x7119(%eax),%edx
  101a1c:	83 ca 80             	or     $0xffffff80,%edx
  101a1f:	88 90 19 71 00 00    	mov    %dl,0x7119(%eax)
  101a25:	c7 c2 ba 26 10 00    	mov    $0x1026ba,%edx
  101a2b:	c1 ea 10             	shr    $0x10,%edx
  101a2e:	66 89 90 1a 71 00 00 	mov    %dx,0x711a(%eax)
  101a35:	c7 c2 c2 26 10 00    	mov    $0x1026c2,%edx
  101a3b:	66 89 90 1c 71 00 00 	mov    %dx,0x711c(%eax)
  101a42:	66 c7 80 1e 71 00 00 	movw   $0x8,0x711e(%eax)
  101a49:	08 00 
  101a4b:	0f b6 90 20 71 00 00 	movzbl 0x7120(%eax),%edx
  101a52:	83 e2 e0             	and    $0xffffffe0,%edx
  101a55:	88 90 20 71 00 00    	mov    %dl,0x7120(%eax)
  101a5b:	0f b6 90 20 71 00 00 	movzbl 0x7120(%eax),%edx
  101a62:	83 e2 1f             	and    $0x1f,%edx
  101a65:	88 90 20 71 00 00    	mov    %dl,0x7120(%eax)
  101a6b:	0f b6 90 21 71 00 00 	movzbl 0x7121(%eax),%edx
  101a72:	83 e2 f0             	and    $0xfffffff0,%edx
  101a75:	83 ca 0e             	or     $0xe,%edx
  101a78:	88 90 21 71 00 00    	mov    %dl,0x7121(%eax)
  101a7e:	0f b6 90 21 71 00 00 	movzbl 0x7121(%eax),%edx
  101a85:	83 e2 ef             	and    $0xffffffef,%edx
  101a88:	88 90 21 71 00 00    	mov    %dl,0x7121(%eax)
  101a8e:	0f b6 90 21 71 00 00 	movzbl 0x7121(%eax),%edx
  101a95:	83 e2 9f             	and    $0xffffff9f,%edx
  101a98:	88 90 21 71 00 00    	mov    %dl,0x7121(%eax)
  101a9e:	0f b6 90 21 71 00 00 	movzbl 0x7121(%eax),%edx
  101aa5:	83 ca 80             	or     $0xffffff80,%edx
  101aa8:	88 90 21 71 00 00    	mov    %dl,0x7121(%eax)
  101aae:	c7 c2 c2 26 10 00    	mov    $0x1026c2,%edx
  101ab4:	c1 ea 10             	shr    $0x10,%edx
  101ab7:	66 89 90 22 71 00 00 	mov    %dx,0x7122(%eax)
  101abe:	c7 c2 d4 26 10 00    	mov    $0x1026d4,%edx
  101ac4:	66 89 90 2c 71 00 00 	mov    %dx,0x712c(%eax)
  101acb:	66 c7 80 2e 71 00 00 	movw   $0x8,0x712e(%eax)
  101ad2:	08 00 
  101ad4:	0f b6 90 30 71 00 00 	movzbl 0x7130(%eax),%edx
  101adb:	83 e2 e0             	and    $0xffffffe0,%edx
  101ade:	88 90 30 71 00 00    	mov    %dl,0x7130(%eax)
  101ae4:	0f b6 90 30 71 00 00 	movzbl 0x7130(%eax),%edx
  101aeb:	83 e2 1f             	and    $0x1f,%edx
  101aee:	88 90 30 71 00 00    	mov    %dl,0x7130(%eax)
  101af4:	0f b6 90 31 71 00 00 	movzbl 0x7131(%eax),%edx
  101afb:	83 e2 f0             	and    $0xfffffff0,%edx
  101afe:	83 ca 0e             	or     $0xe,%edx
  101b01:	88 90 31 71 00 00    	mov    %dl,0x7131(%eax)
  101b07:	0f b6 90 31 71 00 00 	movzbl 0x7131(%eax),%edx
  101b0e:	83 e2 ef             	and    $0xffffffef,%edx
  101b11:	88 90 31 71 00 00    	mov    %dl,0x7131(%eax)
  101b17:	0f b6 90 31 71 00 00 	movzbl 0x7131(%eax),%edx
  101b1e:	83 e2 9f             	and    $0xffffff9f,%edx
  101b21:	88 90 31 71 00 00    	mov    %dl,0x7131(%eax)
  101b27:	0f b6 90 31 71 00 00 	movzbl 0x7131(%eax),%edx
  101b2e:	83 ca 80             	or     $0xffffff80,%edx
  101b31:	88 90 31 71 00 00    	mov    %dl,0x7131(%eax)
  101b37:	c7 c2 d4 26 10 00    	mov    $0x1026d4,%edx
  101b3d:	c1 ea 10             	shr    $0x10,%edx
  101b40:	66 89 90 32 71 00 00 	mov    %dx,0x7132(%eax)
  101b47:	c7 c2 de 26 10 00    	mov    $0x1026de,%edx
  101b4d:	66 89 90 34 71 00 00 	mov    %dx,0x7134(%eax)
  101b54:	66 c7 80 36 71 00 00 	movw   $0x8,0x7136(%eax)
  101b5b:	08 00 
  101b5d:	0f b6 90 38 71 00 00 	movzbl 0x7138(%eax),%edx
  101b64:	83 e2 e0             	and    $0xffffffe0,%edx
  101b67:	88 90 38 71 00 00    	mov    %dl,0x7138(%eax)
  101b6d:	0f b6 90 38 71 00 00 	movzbl 0x7138(%eax),%edx
  101b74:	83 e2 1f             	and    $0x1f,%edx
  101b77:	88 90 38 71 00 00    	mov    %dl,0x7138(%eax)
  101b7d:	0f b6 90 39 71 00 00 	movzbl 0x7139(%eax),%edx
  101b84:	83 e2 f0             	and    $0xfffffff0,%edx
  101b87:	83 ca 0e             	or     $0xe,%edx
  101b8a:	88 90 39 71 00 00    	mov    %dl,0x7139(%eax)
  101b90:	0f b6 90 39 71 00 00 	movzbl 0x7139(%eax),%edx
  101b97:	83 e2 ef             	and    $0xffffffef,%edx
  101b9a:	88 90 39 71 00 00    	mov    %dl,0x7139(%eax)
  101ba0:	0f b6 90 39 71 00 00 	movzbl 0x7139(%eax),%edx
  101ba7:	83 e2 9f             	and    $0xffffff9f,%edx
  101baa:	88 90 39 71 00 00    	mov    %dl,0x7139(%eax)
  101bb0:	0f b6 90 39 71 00 00 	movzbl 0x7139(%eax),%edx
  101bb7:	83 ca 80             	or     $0xffffff80,%edx
  101bba:	88 90 39 71 00 00    	mov    %dl,0x7139(%eax)
  101bc0:	c7 c2 de 26 10 00    	mov    $0x1026de,%edx
  101bc6:	c1 ea 10             	shr    $0x10,%edx
  101bc9:	66 89 90 3a 71 00 00 	mov    %dx,0x713a(%eax)
  101bd0:	c7 c2 e6 26 10 00    	mov    $0x1026e6,%edx
  101bd6:	66 89 90 3c 71 00 00 	mov    %dx,0x713c(%eax)
  101bdd:	66 c7 80 3e 71 00 00 	movw   $0x8,0x713e(%eax)
  101be4:	08 00 
  101be6:	0f b6 90 40 71 00 00 	movzbl 0x7140(%eax),%edx
  101bed:	83 e2 e0             	and    $0xffffffe0,%edx
  101bf0:	88 90 40 71 00 00    	mov    %dl,0x7140(%eax)
  101bf6:	0f b6 90 40 71 00 00 	movzbl 0x7140(%eax),%edx
  101bfd:	83 e2 1f             	and    $0x1f,%edx
  101c00:	88 90 40 71 00 00    	mov    %dl,0x7140(%eax)
  101c06:	0f b6 90 41 71 00 00 	movzbl 0x7141(%eax),%edx
  101c0d:	83 e2 f0             	and    $0xfffffff0,%edx
  101c10:	83 ca 0e             	or     $0xe,%edx
  101c13:	88 90 41 71 00 00    	mov    %dl,0x7141(%eax)
  101c19:	0f b6 90 41 71 00 00 	movzbl 0x7141(%eax),%edx
  101c20:	83 e2 ef             	and    $0xffffffef,%edx
  101c23:	88 90 41 71 00 00    	mov    %dl,0x7141(%eax)
  101c29:	0f b6 90 41 71 00 00 	movzbl 0x7141(%eax),%edx
  101c30:	83 e2 9f             	and    $0xffffff9f,%edx
  101c33:	88 90 41 71 00 00    	mov    %dl,0x7141(%eax)
  101c39:	0f b6 90 41 71 00 00 	movzbl 0x7141(%eax),%edx
  101c40:	83 ca 80             	or     $0xffffff80,%edx
  101c43:	88 90 41 71 00 00    	mov    %dl,0x7141(%eax)
  101c49:	c7 c2 e6 26 10 00    	mov    $0x1026e6,%edx
  101c4f:	c1 ea 10             	shr    $0x10,%edx
  101c52:	66 89 90 42 71 00 00 	mov    %dx,0x7142(%eax)
  101c59:	c7 c2 f0 26 10 00    	mov    $0x1026f0,%edx
  101c5f:	66 89 90 ac 71 00 00 	mov    %dx,0x71ac(%eax)
  101c66:	66 c7 80 ae 71 00 00 	movw   $0x8,0x71ae(%eax)
  101c6d:	08 00 
  101c6f:	0f b6 90 b0 71 00 00 	movzbl 0x71b0(%eax),%edx
  101c76:	83 e2 e0             	and    $0xffffffe0,%edx
  101c79:	88 90 b0 71 00 00    	mov    %dl,0x71b0(%eax)
  101c7f:	0f b6 90 b0 71 00 00 	movzbl 0x71b0(%eax),%edx
  101c86:	83 e2 1f             	and    $0x1f,%edx
  101c89:	88 90 b0 71 00 00    	mov    %dl,0x71b0(%eax)
  101c8f:	0f b6 90 b1 71 00 00 	movzbl 0x71b1(%eax),%edx
  101c96:	83 e2 f0             	and    $0xfffffff0,%edx
  101c99:	83 ca 0e             	or     $0xe,%edx
  101c9c:	88 90 b1 71 00 00    	mov    %dl,0x71b1(%eax)
  101ca2:	0f b6 90 b1 71 00 00 	movzbl 0x71b1(%eax),%edx
  101ca9:	83 e2 ef             	and    $0xffffffef,%edx
  101cac:	88 90 b1 71 00 00    	mov    %dl,0x71b1(%eax)
  101cb2:	0f b6 90 b1 71 00 00 	movzbl 0x71b1(%eax),%edx
  101cb9:	83 e2 9f             	and    $0xffffff9f,%edx
  101cbc:	88 90 b1 71 00 00    	mov    %dl,0x71b1(%eax)
  101cc2:	0f b6 90 b1 71 00 00 	movzbl 0x71b1(%eax),%edx
  101cc9:	83 ca 80             	or     $0xffffff80,%edx
  101ccc:	88 90 b1 71 00 00    	mov    %dl,0x71b1(%eax)
  101cd2:	c7 c2 f0 26 10 00    	mov    $0x1026f0,%edx
  101cd8:	c1 ea 10             	shr    $0x10,%edx
  101cdb:	66 89 90 b2 71 00 00 	mov    %dx,0x71b2(%eax)
  101ce2:	c7 c2 fa 26 10 00    	mov    $0x1026fa,%edx
  101ce8:	66 89 90 b4 71 00 00 	mov    %dx,0x71b4(%eax)
  101cef:	66 c7 80 b6 71 00 00 	movw   $0x8,0x71b6(%eax)
  101cf6:	08 00 
  101cf8:	0f b6 90 b8 71 00 00 	movzbl 0x71b8(%eax),%edx
  101cff:	83 e2 e0             	and    $0xffffffe0,%edx
  101d02:	88 90 b8 71 00 00    	mov    %dl,0x71b8(%eax)
  101d08:	0f b6 90 b8 71 00 00 	movzbl 0x71b8(%eax),%edx
  101d0f:	83 e2 1f             	and    $0x1f,%edx
  101d12:	88 90 b8 71 00 00    	mov    %dl,0x71b8(%eax)
  101d18:	0f b6 90 b9 71 00 00 	movzbl 0x71b9(%eax),%edx
  101d1f:	83 e2 f0             	and    $0xfffffff0,%edx
  101d22:	83 ca 0e             	or     $0xe,%edx
  101d25:	88 90 b9 71 00 00    	mov    %dl,0x71b9(%eax)
  101d2b:	0f b6 90 b9 71 00 00 	movzbl 0x71b9(%eax),%edx
  101d32:	83 e2 ef             	and    $0xffffffef,%edx
  101d35:	88 90 b9 71 00 00    	mov    %dl,0x71b9(%eax)
  101d3b:	0f b6 90 b9 71 00 00 	movzbl 0x71b9(%eax),%edx
  101d42:	83 e2 9f             	and    $0xffffff9f,%edx
  101d45:	88 90 b9 71 00 00    	mov    %dl,0x71b9(%eax)
  101d4b:	0f b6 90 b9 71 00 00 	movzbl 0x71b9(%eax),%edx
  101d52:	83 ca 80             	or     $0xffffff80,%edx
  101d55:	88 90 b9 71 00 00    	mov    %dl,0x71b9(%eax)
  101d5b:	c7 c2 fa 26 10 00    	mov    $0x1026fa,%edx
  101d61:	c1 ea 10             	shr    $0x10,%edx
  101d64:	66 89 90 ba 71 00 00 	mov    %dx,0x71ba(%eax)
  101d6b:	c7 c2 04 27 10 00    	mov    $0x102704,%edx
  101d71:	66 89 90 bc 71 00 00 	mov    %dx,0x71bc(%eax)
  101d78:	66 c7 80 be 71 00 00 	movw   $0x8,0x71be(%eax)
  101d7f:	08 00 
  101d81:	0f b6 90 c0 71 00 00 	movzbl 0x71c0(%eax),%edx
  101d88:	83 e2 e0             	and    $0xffffffe0,%edx
  101d8b:	88 90 c0 71 00 00    	mov    %dl,0x71c0(%eax)
  101d91:	0f b6 90 c0 71 00 00 	movzbl 0x71c0(%eax),%edx
  101d98:	83 e2 1f             	and    $0x1f,%edx
  101d9b:	88 90 c0 71 00 00    	mov    %dl,0x71c0(%eax)
  101da1:	0f b6 90 c1 71 00 00 	movzbl 0x71c1(%eax),%edx
  101da8:	83 e2 f0             	and    $0xfffffff0,%edx
  101dab:	83 ca 0e             	or     $0xe,%edx
  101dae:	88 90 c1 71 00 00    	mov    %dl,0x71c1(%eax)
  101db4:	0f b6 90 c1 71 00 00 	movzbl 0x71c1(%eax),%edx
  101dbb:	83 e2 ef             	and    $0xffffffef,%edx
  101dbe:	88 90 c1 71 00 00    	mov    %dl,0x71c1(%eax)
  101dc4:	0f b6 90 c1 71 00 00 	movzbl 0x71c1(%eax),%edx
  101dcb:	83 e2 9f             	and    $0xffffff9f,%edx
  101dce:	88 90 c1 71 00 00    	mov    %dl,0x71c1(%eax)
  101dd4:	0f b6 90 c1 71 00 00 	movzbl 0x71c1(%eax),%edx
  101ddb:	83 ca 80             	or     $0xffffff80,%edx
  101dde:	88 90 c1 71 00 00    	mov    %dl,0x71c1(%eax)
  101de4:	c7 c2 04 27 10 00    	mov    $0x102704,%edx
  101dea:	c1 ea 10             	shr    $0x10,%edx
  101ded:	66 89 90 c2 71 00 00 	mov    %dx,0x71c2(%eax)
  101df4:	c7 c2 0e 27 10 00    	mov    $0x10270e,%edx
  101dfa:	66 89 90 c4 71 00 00 	mov    %dx,0x71c4(%eax)
  101e01:	66 c7 80 c6 71 00 00 	movw   $0x8,0x71c6(%eax)
  101e08:	08 00 
  101e0a:	0f b6 90 c8 71 00 00 	movzbl 0x71c8(%eax),%edx
  101e11:	83 e2 e0             	and    $0xffffffe0,%edx
  101e14:	88 90 c8 71 00 00    	mov    %dl,0x71c8(%eax)
  101e1a:	0f b6 90 c8 71 00 00 	movzbl 0x71c8(%eax),%edx
  101e21:	83 e2 1f             	and    $0x1f,%edx
  101e24:	88 90 c8 71 00 00    	mov    %dl,0x71c8(%eax)
  101e2a:	0f b6 90 c9 71 00 00 	movzbl 0x71c9(%eax),%edx
  101e31:	83 e2 f0             	and    $0xfffffff0,%edx
  101e34:	83 ca 0e             	or     $0xe,%edx
  101e37:	88 90 c9 71 00 00    	mov    %dl,0x71c9(%eax)
  101e3d:	0f b6 90 c9 71 00 00 	movzbl 0x71c9(%eax),%edx
  101e44:	83 e2 ef             	and    $0xffffffef,%edx
  101e47:	88 90 c9 71 00 00    	mov    %dl,0x71c9(%eax)
  101e4d:	0f b6 90 c9 71 00 00 	movzbl 0x71c9(%eax),%edx
  101e54:	83 e2 9f             	and    $0xffffff9f,%edx
  101e57:	88 90 c9 71 00 00    	mov    %dl,0x71c9(%eax)
  101e5d:	0f b6 90 c9 71 00 00 	movzbl 0x71c9(%eax),%edx
  101e64:	83 ca 80             	or     $0xffffff80,%edx
  101e67:	88 90 c9 71 00 00    	mov    %dl,0x71c9(%eax)
  101e6d:	c7 c2 0e 27 10 00    	mov    $0x10270e,%edx
  101e73:	c1 ea 10             	shr    $0x10,%edx
  101e76:	66 89 90 ca 71 00 00 	mov    %dx,0x71ca(%eax)
  101e7d:	c7 c2 18 27 10 00    	mov    $0x102718,%edx
  101e83:	66 89 90 cc 71 00 00 	mov    %dx,0x71cc(%eax)
  101e8a:	66 c7 80 ce 71 00 00 	movw   $0x8,0x71ce(%eax)
  101e91:	08 00 
  101e93:	0f b6 90 d0 71 00 00 	movzbl 0x71d0(%eax),%edx
  101e9a:	83 e2 e0             	and    $0xffffffe0,%edx
  101e9d:	88 90 d0 71 00 00    	mov    %dl,0x71d0(%eax)
  101ea3:	0f b6 90 d0 71 00 00 	movzbl 0x71d0(%eax),%edx
  101eaa:	83 e2 1f             	and    $0x1f,%edx
  101ead:	88 90 d0 71 00 00    	mov    %dl,0x71d0(%eax)
  101eb3:	0f b6 90 d1 71 00 00 	movzbl 0x71d1(%eax),%edx
  101eba:	83 e2 f0             	and    $0xfffffff0,%edx
  101ebd:	83 ca 0e             	or     $0xe,%edx
  101ec0:	88 90 d1 71 00 00    	mov    %dl,0x71d1(%eax)
  101ec6:	0f b6 90 d1 71 00 00 	movzbl 0x71d1(%eax),%edx
  101ecd:	83 e2 ef             	and    $0xffffffef,%edx
  101ed0:	88 90 d1 71 00 00    	mov    %dl,0x71d1(%eax)
  101ed6:	0f b6 90 d1 71 00 00 	movzbl 0x71d1(%eax),%edx
  101edd:	83 e2 9f             	and    $0xffffff9f,%edx
  101ee0:	88 90 d1 71 00 00    	mov    %dl,0x71d1(%eax)
  101ee6:	0f b6 90 d1 71 00 00 	movzbl 0x71d1(%eax),%edx
  101eed:	83 ca 80             	or     $0xffffff80,%edx
  101ef0:	88 90 d1 71 00 00    	mov    %dl,0x71d1(%eax)
  101ef6:	c7 c2 18 27 10 00    	mov    $0x102718,%edx
  101efc:	c1 ea 10             	shr    $0x10,%edx
  101eff:	66 89 90 d2 71 00 00 	mov    %dx,0x71d2(%eax)
  101f06:	c7 c2 22 27 10 00    	mov    $0x102722,%edx
  101f0c:	66 89 90 d4 71 00 00 	mov    %dx,0x71d4(%eax)
  101f13:	66 c7 80 d6 71 00 00 	movw   $0x8,0x71d6(%eax)
  101f1a:	08 00 
  101f1c:	0f b6 90 d8 71 00 00 	movzbl 0x71d8(%eax),%edx
  101f23:	83 e2 e0             	and    $0xffffffe0,%edx
  101f26:	88 90 d8 71 00 00    	mov    %dl,0x71d8(%eax)
  101f2c:	0f b6 90 d8 71 00 00 	movzbl 0x71d8(%eax),%edx
  101f33:	83 e2 1f             	and    $0x1f,%edx
  101f36:	88 90 d8 71 00 00    	mov    %dl,0x71d8(%eax)
  101f3c:	0f b6 90 d9 71 00 00 	movzbl 0x71d9(%eax),%edx
  101f43:	83 e2 f0             	and    $0xfffffff0,%edx
  101f46:	83 ca 0e             	or     $0xe,%edx
  101f49:	88 90 d9 71 00 00    	mov    %dl,0x71d9(%eax)
  101f4f:	0f b6 90 d9 71 00 00 	movzbl 0x71d9(%eax),%edx
  101f56:	83 e2 ef             	and    $0xffffffef,%edx
  101f59:	88 90 d9 71 00 00    	mov    %dl,0x71d9(%eax)
  101f5f:	0f b6 90 d9 71 00 00 	movzbl 0x71d9(%eax),%edx
  101f66:	83 e2 9f             	and    $0xffffff9f,%edx
  101f69:	88 90 d9 71 00 00    	mov    %dl,0x71d9(%eax)
  101f6f:	0f b6 90 d9 71 00 00 	movzbl 0x71d9(%eax),%edx
  101f76:	83 ca 80             	or     $0xffffff80,%edx
  101f79:	88 90 d9 71 00 00    	mov    %dl,0x71d9(%eax)
  101f7f:	c7 c2 22 27 10 00    	mov    $0x102722,%edx
  101f85:	c1 ea 10             	shr    $0x10,%edx
  101f88:	66 89 90 da 71 00 00 	mov    %dx,0x71da(%eax)
  101f8f:	c7 c2 2c 27 10 00    	mov    $0x10272c,%edx
  101f95:	66 89 90 dc 71 00 00 	mov    %dx,0x71dc(%eax)
  101f9c:	66 c7 80 de 71 00 00 	movw   $0x8,0x71de(%eax)
  101fa3:	08 00 
  101fa5:	0f b6 90 e0 71 00 00 	movzbl 0x71e0(%eax),%edx
  101fac:	83 e2 e0             	and    $0xffffffe0,%edx
  101faf:	88 90 e0 71 00 00    	mov    %dl,0x71e0(%eax)
  101fb5:	0f b6 90 e0 71 00 00 	movzbl 0x71e0(%eax),%edx
  101fbc:	83 e2 1f             	and    $0x1f,%edx
  101fbf:	88 90 e0 71 00 00    	mov    %dl,0x71e0(%eax)
  101fc5:	0f b6 90 e1 71 00 00 	movzbl 0x71e1(%eax),%edx
  101fcc:	83 e2 f0             	and    $0xfffffff0,%edx
  101fcf:	83 ca 0e             	or     $0xe,%edx
  101fd2:	88 90 e1 71 00 00    	mov    %dl,0x71e1(%eax)
  101fd8:	0f b6 90 e1 71 00 00 	movzbl 0x71e1(%eax),%edx
  101fdf:	83 e2 ef             	and    $0xffffffef,%edx
  101fe2:	88 90 e1 71 00 00    	mov    %dl,0x71e1(%eax)
  101fe8:	0f b6 90 e1 71 00 00 	movzbl 0x71e1(%eax),%edx
  101fef:	83 e2 9f             	and    $0xffffff9f,%edx
  101ff2:	88 90 e1 71 00 00    	mov    %dl,0x71e1(%eax)
  101ff8:	0f b6 90 e1 71 00 00 	movzbl 0x71e1(%eax),%edx
  101fff:	83 ca 80             	or     $0xffffff80,%edx
  102002:	88 90 e1 71 00 00    	mov    %dl,0x71e1(%eax)
  102008:	c7 c2 2c 27 10 00    	mov    $0x10272c,%edx
  10200e:	c1 ea 10             	shr    $0x10,%edx
  102011:	66 89 90 e2 71 00 00 	mov    %dx,0x71e2(%eax)
  102018:	c7 c2 32 27 10 00    	mov    $0x102732,%edx
  10201e:	66 89 90 e4 71 00 00 	mov    %dx,0x71e4(%eax)
  102025:	66 c7 80 e6 71 00 00 	movw   $0x8,0x71e6(%eax)
  10202c:	08 00 
  10202e:	0f b6 90 e8 71 00 00 	movzbl 0x71e8(%eax),%edx
  102035:	83 e2 e0             	and    $0xffffffe0,%edx
  102038:	88 90 e8 71 00 00    	mov    %dl,0x71e8(%eax)
  10203e:	0f b6 90 e8 71 00 00 	movzbl 0x71e8(%eax),%edx
  102045:	83 e2 1f             	and    $0x1f,%edx
  102048:	88 90 e8 71 00 00    	mov    %dl,0x71e8(%eax)
  10204e:	0f b6 90 e9 71 00 00 	movzbl 0x71e9(%eax),%edx
  102055:	83 e2 f0             	and    $0xfffffff0,%edx
  102058:	83 ca 0e             	or     $0xe,%edx
  10205b:	88 90 e9 71 00 00    	mov    %dl,0x71e9(%eax)
  102061:	0f b6 90 e9 71 00 00 	movzbl 0x71e9(%eax),%edx
  102068:	83 e2 ef             	and    $0xffffffef,%edx
  10206b:	88 90 e9 71 00 00    	mov    %dl,0x71e9(%eax)
  102071:	0f b6 90 e9 71 00 00 	movzbl 0x71e9(%eax),%edx
  102078:	83 e2 9f             	and    $0xffffff9f,%edx
  10207b:	88 90 e9 71 00 00    	mov    %dl,0x71e9(%eax)
  102081:	0f b6 90 e9 71 00 00 	movzbl 0x71e9(%eax),%edx
  102088:	83 ca 80             	or     $0xffffff80,%edx
  10208b:	88 90 e9 71 00 00    	mov    %dl,0x71e9(%eax)
  102091:	c7 c2 32 27 10 00    	mov    $0x102732,%edx
  102097:	c1 ea 10             	shr    $0x10,%edx
  10209a:	66 89 90 ea 71 00 00 	mov    %dx,0x71ea(%eax)
  1020a1:	c7 c2 38 27 10 00    	mov    $0x102738,%edx
  1020a7:	66 89 90 ec 71 00 00 	mov    %dx,0x71ec(%eax)
  1020ae:	66 c7 80 ee 71 00 00 	movw   $0x8,0x71ee(%eax)
  1020b5:	08 00 
  1020b7:	0f b6 90 f0 71 00 00 	movzbl 0x71f0(%eax),%edx
  1020be:	83 e2 e0             	and    $0xffffffe0,%edx
  1020c1:	88 90 f0 71 00 00    	mov    %dl,0x71f0(%eax)
  1020c7:	0f b6 90 f0 71 00 00 	movzbl 0x71f0(%eax),%edx
  1020ce:	83 e2 1f             	and    $0x1f,%edx
  1020d1:	88 90 f0 71 00 00    	mov    %dl,0x71f0(%eax)
  1020d7:	0f b6 90 f1 71 00 00 	movzbl 0x71f1(%eax),%edx
  1020de:	83 e2 f0             	and    $0xfffffff0,%edx
  1020e1:	83 ca 0e             	or     $0xe,%edx
  1020e4:	88 90 f1 71 00 00    	mov    %dl,0x71f1(%eax)
  1020ea:	0f b6 90 f1 71 00 00 	movzbl 0x71f1(%eax),%edx
  1020f1:	83 e2 ef             	and    $0xffffffef,%edx
  1020f4:	88 90 f1 71 00 00    	mov    %dl,0x71f1(%eax)
  1020fa:	0f b6 90 f1 71 00 00 	movzbl 0x71f1(%eax),%edx
  102101:	83 e2 9f             	and    $0xffffff9f,%edx
  102104:	88 90 f1 71 00 00    	mov    %dl,0x71f1(%eax)
  10210a:	0f b6 90 f1 71 00 00 	movzbl 0x71f1(%eax),%edx
  102111:	83 ca 80             	or     $0xffffff80,%edx
  102114:	88 90 f1 71 00 00    	mov    %dl,0x71f1(%eax)
  10211a:	c7 c2 38 27 10 00    	mov    $0x102738,%edx
  102120:	c1 ea 10             	shr    $0x10,%edx
  102123:	66 89 90 f2 71 00 00 	mov    %dx,0x71f2(%eax)
  10212a:	c7 c2 3e 27 10 00    	mov    $0x10273e,%edx
  102130:	66 89 90 f4 71 00 00 	mov    %dx,0x71f4(%eax)
  102137:	66 c7 80 f6 71 00 00 	movw   $0x8,0x71f6(%eax)
  10213e:	08 00 
  102140:	0f b6 90 f8 71 00 00 	movzbl 0x71f8(%eax),%edx
  102147:	83 e2 e0             	and    $0xffffffe0,%edx
  10214a:	88 90 f8 71 00 00    	mov    %dl,0x71f8(%eax)
  102150:	0f b6 90 f8 71 00 00 	movzbl 0x71f8(%eax),%edx
  102157:	83 e2 1f             	and    $0x1f,%edx
  10215a:	88 90 f8 71 00 00    	mov    %dl,0x71f8(%eax)
  102160:	0f b6 90 f9 71 00 00 	movzbl 0x71f9(%eax),%edx
  102167:	83 e2 f0             	and    $0xfffffff0,%edx
  10216a:	83 ca 0e             	or     $0xe,%edx
  10216d:	88 90 f9 71 00 00    	mov    %dl,0x71f9(%eax)
  102173:	0f b6 90 f9 71 00 00 	movzbl 0x71f9(%eax),%edx
  10217a:	83 e2 ef             	and    $0xffffffef,%edx
  10217d:	88 90 f9 71 00 00    	mov    %dl,0x71f9(%eax)
  102183:	0f b6 90 f9 71 00 00 	movzbl 0x71f9(%eax),%edx
  10218a:	83 e2 9f             	and    $0xffffff9f,%edx
  10218d:	88 90 f9 71 00 00    	mov    %dl,0x71f9(%eax)
  102193:	0f b6 90 f9 71 00 00 	movzbl 0x71f9(%eax),%edx
  10219a:	83 ca 80             	or     $0xffffff80,%edx
  10219d:	88 90 f9 71 00 00    	mov    %dl,0x71f9(%eax)
  1021a3:	c7 c2 3e 27 10 00    	mov    $0x10273e,%edx
  1021a9:	c1 ea 10             	shr    $0x10,%edx
  1021ac:	66 89 90 fa 71 00 00 	mov    %dx,0x71fa(%eax)
  1021b3:	c7 c2 44 27 10 00    	mov    $0x102744,%edx
  1021b9:	66 89 90 fc 71 00 00 	mov    %dx,0x71fc(%eax)
  1021c0:	66 c7 80 fe 71 00 00 	movw   $0x8,0x71fe(%eax)
  1021c7:	08 00 
  1021c9:	0f b6 90 00 72 00 00 	movzbl 0x7200(%eax),%edx
  1021d0:	83 e2 e0             	and    $0xffffffe0,%edx
  1021d3:	88 90 00 72 00 00    	mov    %dl,0x7200(%eax)
  1021d9:	0f b6 90 00 72 00 00 	movzbl 0x7200(%eax),%edx
  1021e0:	83 e2 1f             	and    $0x1f,%edx
  1021e3:	88 90 00 72 00 00    	mov    %dl,0x7200(%eax)
  1021e9:	0f b6 90 01 72 00 00 	movzbl 0x7201(%eax),%edx
  1021f0:	83 e2 f0             	and    $0xfffffff0,%edx
  1021f3:	83 ca 0e             	or     $0xe,%edx
  1021f6:	88 90 01 72 00 00    	mov    %dl,0x7201(%eax)
  1021fc:	0f b6 90 01 72 00 00 	movzbl 0x7201(%eax),%edx
  102203:	83 e2 ef             	and    $0xffffffef,%edx
  102206:	88 90 01 72 00 00    	mov    %dl,0x7201(%eax)
  10220c:	0f b6 90 01 72 00 00 	movzbl 0x7201(%eax),%edx
  102213:	83 e2 9f             	and    $0xffffff9f,%edx
  102216:	88 90 01 72 00 00    	mov    %dl,0x7201(%eax)
  10221c:	0f b6 90 01 72 00 00 	movzbl 0x7201(%eax),%edx
  102223:	83 ca 80             	or     $0xffffff80,%edx
  102226:	88 90 01 72 00 00    	mov    %dl,0x7201(%eax)
  10222c:	c7 c2 44 27 10 00    	mov    $0x102744,%edx
  102232:	c1 ea 10             	shr    $0x10,%edx
  102235:	66 89 90 02 72 00 00 	mov    %dx,0x7202(%eax)
  10223c:	c7 c2 4a 27 10 00    	mov    $0x10274a,%edx
  102242:	66 89 90 04 72 00 00 	mov    %dx,0x7204(%eax)
  102249:	66 c7 80 06 72 00 00 	movw   $0x8,0x7206(%eax)
  102250:	08 00 
  102252:	0f b6 90 08 72 00 00 	movzbl 0x7208(%eax),%edx
  102259:	83 e2 e0             	and    $0xffffffe0,%edx
  10225c:	88 90 08 72 00 00    	mov    %dl,0x7208(%eax)
  102262:	0f b6 90 08 72 00 00 	movzbl 0x7208(%eax),%edx
  102269:	83 e2 1f             	and    $0x1f,%edx
  10226c:	88 90 08 72 00 00    	mov    %dl,0x7208(%eax)
  102272:	0f b6 90 09 72 00 00 	movzbl 0x7209(%eax),%edx
  102279:	83 e2 f0             	and    $0xfffffff0,%edx
  10227c:	83 ca 0e             	or     $0xe,%edx
  10227f:	88 90 09 72 00 00    	mov    %dl,0x7209(%eax)
  102285:	0f b6 90 09 72 00 00 	movzbl 0x7209(%eax),%edx
  10228c:	83 e2 ef             	and    $0xffffffef,%edx
  10228f:	88 90 09 72 00 00    	mov    %dl,0x7209(%eax)
  102295:	0f b6 90 09 72 00 00 	movzbl 0x7209(%eax),%edx
  10229c:	83 e2 9f             	and    $0xffffff9f,%edx
  10229f:	88 90 09 72 00 00    	mov    %dl,0x7209(%eax)
  1022a5:	0f b6 90 09 72 00 00 	movzbl 0x7209(%eax),%edx
  1022ac:	83 ca 80             	or     $0xffffff80,%edx
  1022af:	88 90 09 72 00 00    	mov    %dl,0x7209(%eax)
  1022b5:	c7 c2 4a 27 10 00    	mov    $0x10274a,%edx
  1022bb:	c1 ea 10             	shr    $0x10,%edx
  1022be:	66 89 90 0a 72 00 00 	mov    %dx,0x720a(%eax)
  1022c5:	c7 c2 50 27 10 00    	mov    $0x102750,%edx
  1022cb:	66 89 90 0c 72 00 00 	mov    %dx,0x720c(%eax)
  1022d2:	66 c7 80 0e 72 00 00 	movw   $0x8,0x720e(%eax)
  1022d9:	08 00 
  1022db:	0f b6 90 10 72 00 00 	movzbl 0x7210(%eax),%edx
  1022e2:	83 e2 e0             	and    $0xffffffe0,%edx
  1022e5:	88 90 10 72 00 00    	mov    %dl,0x7210(%eax)
  1022eb:	0f b6 90 10 72 00 00 	movzbl 0x7210(%eax),%edx
  1022f2:	83 e2 1f             	and    $0x1f,%edx
  1022f5:	88 90 10 72 00 00    	mov    %dl,0x7210(%eax)
  1022fb:	0f b6 90 11 72 00 00 	movzbl 0x7211(%eax),%edx
  102302:	83 e2 f0             	and    $0xfffffff0,%edx
  102305:	83 ca 0e             	or     $0xe,%edx
  102308:	88 90 11 72 00 00    	mov    %dl,0x7211(%eax)
  10230e:	0f b6 90 11 72 00 00 	movzbl 0x7211(%eax),%edx
  102315:	83 e2 ef             	and    $0xffffffef,%edx
  102318:	88 90 11 72 00 00    	mov    %dl,0x7211(%eax)
  10231e:	0f b6 90 11 72 00 00 	movzbl 0x7211(%eax),%edx
  102325:	83 e2 9f             	and    $0xffffff9f,%edx
  102328:	88 90 11 72 00 00    	mov    %dl,0x7211(%eax)
  10232e:	0f b6 90 11 72 00 00 	movzbl 0x7211(%eax),%edx
  102335:	83 ca 80             	or     $0xffffff80,%edx
  102338:	88 90 11 72 00 00    	mov    %dl,0x7211(%eax)
  10233e:	c7 c2 50 27 10 00    	mov    $0x102750,%edx
  102344:	c1 ea 10             	shr    $0x10,%edx
  102347:	66 89 90 12 72 00 00 	mov    %dx,0x7212(%eax)
  10234e:	c7 c2 56 27 10 00    	mov    $0x102756,%edx
  102354:	66 89 90 14 72 00 00 	mov    %dx,0x7214(%eax)
  10235b:	66 c7 80 16 72 00 00 	movw   $0x8,0x7216(%eax)
  102362:	08 00 
  102364:	0f b6 90 18 72 00 00 	movzbl 0x7218(%eax),%edx
  10236b:	83 e2 e0             	and    $0xffffffe0,%edx
  10236e:	88 90 18 72 00 00    	mov    %dl,0x7218(%eax)
  102374:	0f b6 90 18 72 00 00 	movzbl 0x7218(%eax),%edx
  10237b:	83 e2 1f             	and    $0x1f,%edx
  10237e:	88 90 18 72 00 00    	mov    %dl,0x7218(%eax)
  102384:	0f b6 90 19 72 00 00 	movzbl 0x7219(%eax),%edx
  10238b:	83 e2 f0             	and    $0xfffffff0,%edx
  10238e:	83 ca 0e             	or     $0xe,%edx
  102391:	88 90 19 72 00 00    	mov    %dl,0x7219(%eax)
  102397:	0f b6 90 19 72 00 00 	movzbl 0x7219(%eax),%edx
  10239e:	83 e2 ef             	and    $0xffffffef,%edx
  1023a1:	88 90 19 72 00 00    	mov    %dl,0x7219(%eax)
  1023a7:	0f b6 90 19 72 00 00 	movzbl 0x7219(%eax),%edx
  1023ae:	83 e2 9f             	and    $0xffffff9f,%edx
  1023b1:	88 90 19 72 00 00    	mov    %dl,0x7219(%eax)
  1023b7:	0f b6 90 19 72 00 00 	movzbl 0x7219(%eax),%edx
  1023be:	83 ca 80             	or     $0xffffff80,%edx
  1023c1:	88 90 19 72 00 00    	mov    %dl,0x7219(%eax)
  1023c7:	c7 c2 56 27 10 00    	mov    $0x102756,%edx
  1023cd:	c1 ea 10             	shr    $0x10,%edx
  1023d0:	66 89 90 1a 72 00 00 	mov    %dx,0x721a(%eax)
  1023d7:	c7 c2 5c 27 10 00    	mov    $0x10275c,%edx
  1023dd:	66 89 90 1c 72 00 00 	mov    %dx,0x721c(%eax)
  1023e4:	66 c7 80 1e 72 00 00 	movw   $0x8,0x721e(%eax)
  1023eb:	08 00 
  1023ed:	0f b6 90 20 72 00 00 	movzbl 0x7220(%eax),%edx
  1023f4:	83 e2 e0             	and    $0xffffffe0,%edx
  1023f7:	88 90 20 72 00 00    	mov    %dl,0x7220(%eax)
  1023fd:	0f b6 90 20 72 00 00 	movzbl 0x7220(%eax),%edx
  102404:	83 e2 1f             	and    $0x1f,%edx
  102407:	88 90 20 72 00 00    	mov    %dl,0x7220(%eax)
  10240d:	0f b6 90 21 72 00 00 	movzbl 0x7221(%eax),%edx
  102414:	83 e2 f0             	and    $0xfffffff0,%edx
  102417:	83 ca 0e             	or     $0xe,%edx
  10241a:	88 90 21 72 00 00    	mov    %dl,0x7221(%eax)
  102420:	0f b6 90 21 72 00 00 	movzbl 0x7221(%eax),%edx
  102427:	83 e2 ef             	and    $0xffffffef,%edx
  10242a:	88 90 21 72 00 00    	mov    %dl,0x7221(%eax)
  102430:	0f b6 90 21 72 00 00 	movzbl 0x7221(%eax),%edx
  102437:	83 e2 9f             	and    $0xffffff9f,%edx
  10243a:	88 90 21 72 00 00    	mov    %dl,0x7221(%eax)
  102440:	0f b6 90 21 72 00 00 	movzbl 0x7221(%eax),%edx
  102447:	83 ca 80             	or     $0xffffff80,%edx
  10244a:	88 90 21 72 00 00    	mov    %dl,0x7221(%eax)
  102450:	c7 c2 5c 27 10 00    	mov    $0x10275c,%edx
  102456:	c1 ea 10             	shr    $0x10,%edx
  102459:	66 89 90 22 72 00 00 	mov    %dx,0x7222(%eax)
  102460:	c7 c2 62 27 10 00    	mov    $0x102762,%edx
  102466:	66 89 90 24 72 00 00 	mov    %dx,0x7224(%eax)
  10246d:	66 c7 80 26 72 00 00 	movw   $0x8,0x7226(%eax)
  102474:	08 00 
  102476:	0f b6 90 28 72 00 00 	movzbl 0x7228(%eax),%edx
  10247d:	83 e2 e0             	and    $0xffffffe0,%edx
  102480:	88 90 28 72 00 00    	mov    %dl,0x7228(%eax)
  102486:	0f b6 90 28 72 00 00 	movzbl 0x7228(%eax),%edx
  10248d:	83 e2 1f             	and    $0x1f,%edx
  102490:	88 90 28 72 00 00    	mov    %dl,0x7228(%eax)
  102496:	0f b6 90 29 72 00 00 	movzbl 0x7229(%eax),%edx
  10249d:	83 e2 f0             	and    $0xfffffff0,%edx
  1024a0:	83 ca 0e             	or     $0xe,%edx
  1024a3:	88 90 29 72 00 00    	mov    %dl,0x7229(%eax)
  1024a9:	0f b6 90 29 72 00 00 	movzbl 0x7229(%eax),%edx
  1024b0:	83 e2 ef             	and    $0xffffffef,%edx
  1024b3:	88 90 29 72 00 00    	mov    %dl,0x7229(%eax)
  1024b9:	0f b6 90 29 72 00 00 	movzbl 0x7229(%eax),%edx
  1024c0:	83 e2 9f             	and    $0xffffff9f,%edx
  1024c3:	88 90 29 72 00 00    	mov    %dl,0x7229(%eax)
  1024c9:	0f b6 90 29 72 00 00 	movzbl 0x7229(%eax),%edx
  1024d0:	83 ca 80             	or     $0xffffff80,%edx
  1024d3:	88 90 29 72 00 00    	mov    %dl,0x7229(%eax)
  1024d9:	c7 c2 62 27 10 00    	mov    $0x102762,%edx
  1024df:	c1 ea 10             	shr    $0x10,%edx
  1024e2:	66 89 90 2a 72 00 00 	mov    %dx,0x722a(%eax)
  1024e9:	c7 c2 98 27 10 00    	mov    $0x102798,%edx
  1024ef:	66 89 90 2c 72 00 00 	mov    %dx,0x722c(%eax)
  1024f6:	66 c7 80 2e 72 00 00 	movw   $0x8,0x722e(%eax)
  1024fd:	08 00 
  1024ff:	0f b6 90 30 72 00 00 	movzbl 0x7230(%eax),%edx
  102506:	83 e2 e0             	and    $0xffffffe0,%edx
  102509:	88 90 30 72 00 00    	mov    %dl,0x7230(%eax)
  10250f:	0f b6 90 30 72 00 00 	movzbl 0x7230(%eax),%edx
  102516:	83 e2 1f             	and    $0x1f,%edx
  102519:	88 90 30 72 00 00    	mov    %dl,0x7230(%eax)
  10251f:	0f b6 90 31 72 00 00 	movzbl 0x7231(%eax),%edx
  102526:	83 e2 f0             	and    $0xfffffff0,%edx
  102529:	83 ca 0e             	or     $0xe,%edx
  10252c:	88 90 31 72 00 00    	mov    %dl,0x7231(%eax)
  102532:	0f b6 90 31 72 00 00 	movzbl 0x7231(%eax),%edx
  102539:	83 e2 ef             	and    $0xffffffef,%edx
  10253c:	88 90 31 72 00 00    	mov    %dl,0x7231(%eax)
  102542:	0f b6 90 31 72 00 00 	movzbl 0x7231(%eax),%edx
  102549:	83 ca 60             	or     $0x60,%edx
  10254c:	88 90 31 72 00 00    	mov    %dl,0x7231(%eax)
  102552:	0f b6 90 31 72 00 00 	movzbl 0x7231(%eax),%edx
  102559:	83 ca 80             	or     $0xffffff80,%edx
  10255c:	88 90 31 72 00 00    	mov    %dl,0x7231(%eax)
  102562:	c7 c2 98 27 10 00    	mov    $0x102798,%edx
  102568:	c1 ea 10             	shr    $0x10,%edx
  10256b:	66 89 90 32 72 00 00 	mov    %dx,0x7232(%eax)
  102572:	c7 c2 9e 27 10 00    	mov    $0x10279e,%edx
  102578:	66 89 90 9c 78 00 00 	mov    %dx,0x789c(%eax)
  10257f:	66 c7 80 9e 78 00 00 	movw   $0x8,0x789e(%eax)
  102586:	08 00 
  102588:	0f b6 90 a0 78 00 00 	movzbl 0x78a0(%eax),%edx
  10258f:	83 e2 e0             	and    $0xffffffe0,%edx
  102592:	88 90 a0 78 00 00    	mov    %dl,0x78a0(%eax)
  102598:	0f b6 90 a0 78 00 00 	movzbl 0x78a0(%eax),%edx
  10259f:	83 e2 1f             	and    $0x1f,%edx
  1025a2:	88 90 a0 78 00 00    	mov    %dl,0x78a0(%eax)
  1025a8:	0f b6 90 a1 78 00 00 	movzbl 0x78a1(%eax),%edx
  1025af:	83 e2 f0             	and    $0xfffffff0,%edx
  1025b2:	83 ca 0e             	or     $0xe,%edx
  1025b5:	88 90 a1 78 00 00    	mov    %dl,0x78a1(%eax)
  1025bb:	0f b6 90 a1 78 00 00 	movzbl 0x78a1(%eax),%edx
  1025c2:	83 e2 ef             	and    $0xffffffef,%edx
  1025c5:	88 90 a1 78 00 00    	mov    %dl,0x78a1(%eax)
  1025cb:	0f b6 90 a1 78 00 00 	movzbl 0x78a1(%eax),%edx
  1025d2:	83 e2 9f             	and    $0xffffff9f,%edx
  1025d5:	88 90 a1 78 00 00    	mov    %dl,0x78a1(%eax)
  1025db:	0f b6 90 a1 78 00 00 	movzbl 0x78a1(%eax),%edx
  1025e2:	83 ca 80             	or     $0xffffff80,%edx
  1025e5:	88 90 a1 78 00 00    	mov    %dl,0x78a1(%eax)
  1025eb:	c7 c2 9e 27 10 00    	mov    $0x10279e,%edx
  1025f1:	c1 ea 10             	shr    $0x10,%edx
  1025f4:	66 89 90 a2 78 00 00 	mov    %dx,0x78a2(%eax)
  1025fb:	0f 01 98 1c 05 00 00 	lidtl  0x51c(%eax)
  102602:	90                   	nop
  102603:	c9                   	leave
  102604:	c3                   	ret

00102605 <intr_init>:
  102605:	55                   	push   %ebp
  102606:	89 e5                	mov    %esp,%ebp
  102608:	53                   	push   %ebx
  102609:	e8 b2 dd ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  10260e:	81 c3 e6 d9 00 00    	add    $0xd9e6,%ebx
  102614:	0f b6 83 ac 78 00 00 	movzbl 0x78ac(%ebx),%eax
  10261b:	3c 01                	cmp    $0x1,%al
  10261d:	74 0e                	je     10262d <intr_init+0x28>
  10261f:	e8 36 ec ff ff       	call   10125a <intr_init_idt>
  102624:	c6 83 ac 78 00 00 01 	movb   $0x1,0x78ac(%ebx)
  10262b:	eb 01                	jmp    10262e <intr_init+0x29>
  10262d:	90                   	nop
  10262e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102631:	c9                   	leave
  102632:	c3                   	ret
  102633:	66 90                	xchg   %ax,%ax
  102635:	66 90                	xchg   %ax,%ax
  102637:	66 90                	xchg   %ax,%ax
  102639:	66 90                	xchg   %ax,%ax
  10263b:	66 90                	xchg   %ax,%ax
  10263d:	66 90                	xchg   %ax,%ax
  10263f:	90                   	nop

00102640 <Xdivide>:
  102640:	6a 00                	push   $0x0
  102642:	6a 00                	push   $0x0
  102644:	e9 67 01 00 00       	jmp    1027b0 <_alltraps>
  102649:	90                   	nop

0010264a <Xdebug>:
  10264a:	6a 00                	push   $0x0
  10264c:	6a 01                	push   $0x1
  10264e:	e9 5d 01 00 00       	jmp    1027b0 <_alltraps>
  102653:	90                   	nop

00102654 <Xnmi>:
  102654:	6a 00                	push   $0x0
  102656:	6a 02                	push   $0x2
  102658:	e9 53 01 00 00       	jmp    1027b0 <_alltraps>
  10265d:	90                   	nop

0010265e <Xbrkpt>:
  10265e:	6a 00                	push   $0x0
  102660:	6a 03                	push   $0x3
  102662:	e9 49 01 00 00       	jmp    1027b0 <_alltraps>
  102667:	90                   	nop

00102668 <Xoflow>:
  102668:	6a 00                	push   $0x0
  10266a:	6a 04                	push   $0x4
  10266c:	e9 3f 01 00 00       	jmp    1027b0 <_alltraps>
  102671:	90                   	nop

00102672 <Xbound>:
  102672:	6a 00                	push   $0x0
  102674:	6a 05                	push   $0x5
  102676:	e9 35 01 00 00       	jmp    1027b0 <_alltraps>
  10267b:	90                   	nop

0010267c <Xillop>:
  10267c:	6a 00                	push   $0x0
  10267e:	6a 06                	push   $0x6
  102680:	e9 2b 01 00 00       	jmp    1027b0 <_alltraps>
  102685:	90                   	nop

00102686 <Xdevice>:
  102686:	6a 00                	push   $0x0
  102688:	6a 07                	push   $0x7
  10268a:	e9 21 01 00 00       	jmp    1027b0 <_alltraps>
  10268f:	90                   	nop

00102690 <Xdblflt>:
  102690:	6a 08                	push   $0x8
  102692:	e9 19 01 00 00       	jmp    1027b0 <_alltraps>
  102697:	90                   	nop

00102698 <Xcoproc>:
  102698:	6a 00                	push   $0x0
  10269a:	6a 09                	push   $0x9
  10269c:	e9 0f 01 00 00       	jmp    1027b0 <_alltraps>
  1026a1:	90                   	nop

001026a2 <Xtss>:
  1026a2:	6a 0a                	push   $0xa
  1026a4:	e9 07 01 00 00       	jmp    1027b0 <_alltraps>
  1026a9:	90                   	nop

001026aa <Xsegnp>:
  1026aa:	6a 0b                	push   $0xb
  1026ac:	e9 ff 00 00 00       	jmp    1027b0 <_alltraps>
  1026b1:	90                   	nop

001026b2 <Xstack>:
  1026b2:	6a 0c                	push   $0xc
  1026b4:	e9 f7 00 00 00       	jmp    1027b0 <_alltraps>
  1026b9:	90                   	nop

001026ba <Xgpflt>:
  1026ba:	6a 0d                	push   $0xd
  1026bc:	e9 ef 00 00 00       	jmp    1027b0 <_alltraps>
  1026c1:	90                   	nop

001026c2 <Xpgflt>:
  1026c2:	6a 0e                	push   $0xe
  1026c4:	e9 e7 00 00 00       	jmp    1027b0 <_alltraps>
  1026c9:	90                   	nop

001026ca <Xres>:
  1026ca:	6a 00                	push   $0x0
  1026cc:	6a 0f                	push   $0xf
  1026ce:	e9 dd 00 00 00       	jmp    1027b0 <_alltraps>
  1026d3:	90                   	nop

001026d4 <Xfperr>:
  1026d4:	6a 00                	push   $0x0
  1026d6:	6a 10                	push   $0x10
  1026d8:	e9 d3 00 00 00       	jmp    1027b0 <_alltraps>
  1026dd:	90                   	nop

001026de <Xalign>:
  1026de:	6a 11                	push   $0x11
  1026e0:	e9 cb 00 00 00       	jmp    1027b0 <_alltraps>
  1026e5:	90                   	nop

001026e6 <Xmchk>:
  1026e6:	6a 00                	push   $0x0
  1026e8:	6a 12                	push   $0x12
  1026ea:	e9 c1 00 00 00       	jmp    1027b0 <_alltraps>
  1026ef:	90                   	nop

001026f0 <Xirq_timer>:
  1026f0:	6a 00                	push   $0x0
  1026f2:	6a 20                	push   $0x20
  1026f4:	e9 b7 00 00 00       	jmp    1027b0 <_alltraps>
  1026f9:	90                   	nop

001026fa <Xirq_kbd>:
  1026fa:	6a 00                	push   $0x0
  1026fc:	6a 21                	push   $0x21
  1026fe:	e9 ad 00 00 00       	jmp    1027b0 <_alltraps>
  102703:	90                   	nop

00102704 <Xirq_slave>:
  102704:	6a 00                	push   $0x0
  102706:	6a 22                	push   $0x22
  102708:	e9 a3 00 00 00       	jmp    1027b0 <_alltraps>
  10270d:	90                   	nop

0010270e <Xirq_serial2>:
  10270e:	6a 00                	push   $0x0
  102710:	6a 23                	push   $0x23
  102712:	e9 99 00 00 00       	jmp    1027b0 <_alltraps>
  102717:	90                   	nop

00102718 <Xirq_serial1>:
  102718:	6a 00                	push   $0x0
  10271a:	6a 24                	push   $0x24
  10271c:	e9 8f 00 00 00       	jmp    1027b0 <_alltraps>
  102721:	90                   	nop

00102722 <Xirq_lpt>:
  102722:	6a 00                	push   $0x0
  102724:	6a 25                	push   $0x25
  102726:	e9 85 00 00 00       	jmp    1027b0 <_alltraps>
  10272b:	90                   	nop

0010272c <Xirq_floppy>:
  10272c:	6a 00                	push   $0x0
  10272e:	6a 26                	push   $0x26
  102730:	eb 7e                	jmp    1027b0 <_alltraps>

00102732 <Xirq_spurious>:
  102732:	6a 00                	push   $0x0
  102734:	6a 27                	push   $0x27
  102736:	eb 78                	jmp    1027b0 <_alltraps>

00102738 <Xirq_rtc>:
  102738:	6a 00                	push   $0x0
  10273a:	6a 28                	push   $0x28
  10273c:	eb 72                	jmp    1027b0 <_alltraps>

0010273e <Xirq9>:
  10273e:	6a 00                	push   $0x0
  102740:	6a 29                	push   $0x29
  102742:	eb 6c                	jmp    1027b0 <_alltraps>

00102744 <Xirq10>:
  102744:	6a 00                	push   $0x0
  102746:	6a 2a                	push   $0x2a
  102748:	eb 66                	jmp    1027b0 <_alltraps>

0010274a <Xirq11>:
  10274a:	6a 00                	push   $0x0
  10274c:	6a 2b                	push   $0x2b
  10274e:	eb 60                	jmp    1027b0 <_alltraps>

00102750 <Xirq_mouse>:
  102750:	6a 00                	push   $0x0
  102752:	6a 2c                	push   $0x2c
  102754:	eb 5a                	jmp    1027b0 <_alltraps>

00102756 <Xirq_coproc>:
  102756:	6a 00                	push   $0x0
  102758:	6a 2d                	push   $0x2d
  10275a:	eb 54                	jmp    1027b0 <_alltraps>

0010275c <Xirq_ide1>:
  10275c:	6a 00                	push   $0x0
  10275e:	6a 2e                	push   $0x2e
  102760:	eb 4e                	jmp    1027b0 <_alltraps>

00102762 <Xirq_ide2>:
  102762:	6a 00                	push   $0x0
  102764:	6a 2f                	push   $0x2f
  102766:	eb 48                	jmp    1027b0 <_alltraps>

00102768 <Xirq_ehci1>:
  102768:	6a 00                	push   $0x0
  10276a:	6a 30                	push   $0x30
  10276c:	eb 42                	jmp    1027b0 <_alltraps>

0010276e <Xirq17>:
  10276e:	6a 00                	push   $0x0
  102770:	6a 31                	push   $0x31
  102772:	eb 3c                	jmp    1027b0 <_alltraps>

00102774 <Xirq18>:
  102774:	6a 00                	push   $0x0
  102776:	6a 32                	push   $0x32
  102778:	eb 36                	jmp    1027b0 <_alltraps>

0010277a <Xirq19>:
  10277a:	6a 00                	push   $0x0
  10277c:	6a 33                	push   $0x33
  10277e:	eb 30                	jmp    1027b0 <_alltraps>

00102780 <Xirq20>:
  102780:	6a 00                	push   $0x0
  102782:	6a 34                	push   $0x34
  102784:	eb 2a                	jmp    1027b0 <_alltraps>

00102786 <Xirq21>:
  102786:	6a 00                	push   $0x0
  102788:	6a 35                	push   $0x35
  10278a:	eb 24                	jmp    1027b0 <_alltraps>

0010278c <Xirq22>:
  10278c:	6a 00                	push   $0x0
  10278e:	6a 36                	push   $0x36
  102790:	eb 1e                	jmp    1027b0 <_alltraps>

00102792 <Xirq_ehci2>:
  102792:	6a 00                	push   $0x0
  102794:	6a 37                	push   $0x37
  102796:	eb 18                	jmp    1027b0 <_alltraps>

00102798 <Xsyscall>:
  102798:	6a 00                	push   $0x0
  10279a:	6a 30                	push   $0x30
  10279c:	eb 12                	jmp    1027b0 <_alltraps>

0010279e <Xdefault>:
  10279e:	68 fe 00 00 00       	push   $0xfe
  1027a3:	eb 0b                	jmp    1027b0 <_alltraps>
  1027a5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1027ac:	00 
  1027ad:	8d 76 00             	lea    0x0(%esi),%esi

001027b0 <_alltraps>:
  1027b0:	fa                   	cli
  1027b1:	1e                   	push   %ds
  1027b2:	06                   	push   %es
  1027b3:	60                   	pusha
  1027b4:	b8 10 00 00 00       	mov    $0x10,%eax
  1027b9:	8e d8                	mov    %eax,%ds
  1027bb:	8e c0                	mov    %eax,%es
  1027bd:	54                   	push   %esp
  1027be:	e8 e1 21 00 00       	call   1049a4 <trap>
  1027c3:	f4                   	hlt
  1027c4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1027cb:	00 
  1027cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001027d0 <trap_return>:
  1027d0:	8b 64 24 04          	mov    0x4(%esp),%esp
  1027d4:	61                   	popa
  1027d5:	07                   	pop    %es
  1027d6:	1f                   	pop    %ds
  1027d7:	83 c4 08             	add    $0x8,%esp
  1027da:	c3                   	ret

001027db <memset>:
  1027db:	55                   	push   %ebp
  1027dc:	89 e5                	mov    %esp,%ebp
  1027de:	57                   	push   %edi
  1027df:	e8 d4 db ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  1027e4:	05 10 d8 00 00       	add    $0xd810,%eax
  1027e9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1027ed:	75 05                	jne    1027f4 <memset+0x19>
  1027ef:	8b 45 08             	mov    0x8(%ebp),%eax
  1027f2:	eb 5c                	jmp    102850 <memset+0x75>
  1027f4:	8b 45 08             	mov    0x8(%ebp),%eax
  1027f7:	83 e0 03             	and    $0x3,%eax
  1027fa:	85 c0                	test   %eax,%eax
  1027fc:	75 41                	jne    10283f <memset+0x64>
  1027fe:	8b 45 10             	mov    0x10(%ebp),%eax
  102801:	83 e0 03             	and    $0x3,%eax
  102804:	85 c0                	test   %eax,%eax
  102806:	75 37                	jne    10283f <memset+0x64>
  102808:	81 65 0c ff 00 00 00 	andl   $0xff,0xc(%ebp)
  10280f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102812:	c1 e0 18             	shl    $0x18,%eax
  102815:	89 c2                	mov    %eax,%edx
  102817:	8b 45 0c             	mov    0xc(%ebp),%eax
  10281a:	c1 e0 10             	shl    $0x10,%eax
  10281d:	09 c2                	or     %eax,%edx
  10281f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102822:	c1 e0 08             	shl    $0x8,%eax
  102825:	09 d0                	or     %edx,%eax
  102827:	09 45 0c             	or     %eax,0xc(%ebp)
  10282a:	8b 45 10             	mov    0x10(%ebp),%eax
  10282d:	c1 e8 02             	shr    $0x2,%eax
  102830:	89 c1                	mov    %eax,%ecx
  102832:	8b 55 08             	mov    0x8(%ebp),%edx
  102835:	8b 45 0c             	mov    0xc(%ebp),%eax
  102838:	89 d7                	mov    %edx,%edi
  10283a:	fc                   	cld
  10283b:	f3 ab                	rep stos %eax,%es:(%edi)
  10283d:	eb 0e                	jmp    10284d <memset+0x72>
  10283f:	8b 55 08             	mov    0x8(%ebp),%edx
  102842:	8b 45 0c             	mov    0xc(%ebp),%eax
  102845:	8b 4d 10             	mov    0x10(%ebp),%ecx
  102848:	89 d7                	mov    %edx,%edi
  10284a:	fc                   	cld
  10284b:	f3 aa                	rep stos %al,%es:(%edi)
  10284d:	8b 45 08             	mov    0x8(%ebp),%eax
  102850:	8b 7d fc             	mov    -0x4(%ebp),%edi
  102853:	c9                   	leave
  102854:	c3                   	ret

00102855 <memmove>:
  102855:	55                   	push   %ebp
  102856:	89 e5                	mov    %esp,%ebp
  102858:	57                   	push   %edi
  102859:	56                   	push   %esi
  10285a:	53                   	push   %ebx
  10285b:	83 ec 10             	sub    $0x10,%esp
  10285e:	e8 55 db ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  102863:	05 91 d7 00 00       	add    $0xd791,%eax
  102868:	8b 45 0c             	mov    0xc(%ebp),%eax
  10286b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10286e:	8b 45 08             	mov    0x8(%ebp),%eax
  102871:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102874:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102877:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10287a:	73 6d                	jae    1028e9 <memmove+0x94>
  10287c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10287f:	8b 45 10             	mov    0x10(%ebp),%eax
  102882:	01 d0                	add    %edx,%eax
  102884:	39 45 ec             	cmp    %eax,-0x14(%ebp)
  102887:	73 60                	jae    1028e9 <memmove+0x94>
  102889:	8b 45 10             	mov    0x10(%ebp),%eax
  10288c:	01 45 f0             	add    %eax,-0x10(%ebp)
  10288f:	8b 45 10             	mov    0x10(%ebp),%eax
  102892:	01 45 ec             	add    %eax,-0x14(%ebp)
  102895:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102898:	83 e0 03             	and    $0x3,%eax
  10289b:	85 c0                	test   %eax,%eax
  10289d:	75 2f                	jne    1028ce <memmove+0x79>
  10289f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1028a2:	83 e0 03             	and    $0x3,%eax
  1028a5:	85 c0                	test   %eax,%eax
  1028a7:	75 25                	jne    1028ce <memmove+0x79>
  1028a9:	8b 45 10             	mov    0x10(%ebp),%eax
  1028ac:	83 e0 03             	and    $0x3,%eax
  1028af:	85 c0                	test   %eax,%eax
  1028b1:	75 1b                	jne    1028ce <memmove+0x79>
  1028b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1028b6:	83 e8 04             	sub    $0x4,%eax
  1028b9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1028bc:	83 ea 04             	sub    $0x4,%edx
  1028bf:	8b 4d 10             	mov    0x10(%ebp),%ecx
  1028c2:	c1 e9 02             	shr    $0x2,%ecx
  1028c5:	89 c7                	mov    %eax,%edi
  1028c7:	89 d6                	mov    %edx,%esi
  1028c9:	fd                   	std
  1028ca:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1028cc:	eb 18                	jmp    1028e6 <memmove+0x91>
  1028ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1028d1:	8d 50 ff             	lea    -0x1(%eax),%edx
  1028d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1028d7:	8d 58 ff             	lea    -0x1(%eax),%ebx
  1028da:	8b 45 10             	mov    0x10(%ebp),%eax
  1028dd:	89 d7                	mov    %edx,%edi
  1028df:	89 de                	mov    %ebx,%esi
  1028e1:	89 c1                	mov    %eax,%ecx
  1028e3:	fd                   	std
  1028e4:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1028e6:	fc                   	cld
  1028e7:	eb 45                	jmp    10292e <memmove+0xd9>
  1028e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1028ec:	83 e0 03             	and    $0x3,%eax
  1028ef:	85 c0                	test   %eax,%eax
  1028f1:	75 2b                	jne    10291e <memmove+0xc9>
  1028f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1028f6:	83 e0 03             	and    $0x3,%eax
  1028f9:	85 c0                	test   %eax,%eax
  1028fb:	75 21                	jne    10291e <memmove+0xc9>
  1028fd:	8b 45 10             	mov    0x10(%ebp),%eax
  102900:	83 e0 03             	and    $0x3,%eax
  102903:	85 c0                	test   %eax,%eax
  102905:	75 17                	jne    10291e <memmove+0xc9>
  102907:	8b 45 10             	mov    0x10(%ebp),%eax
  10290a:	c1 e8 02             	shr    $0x2,%eax
  10290d:	89 c1                	mov    %eax,%ecx
  10290f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102912:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102915:	89 c7                	mov    %eax,%edi
  102917:	89 d6                	mov    %edx,%esi
  102919:	fc                   	cld
  10291a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10291c:	eb 10                	jmp    10292e <memmove+0xd9>
  10291e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102921:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102924:	8b 4d 10             	mov    0x10(%ebp),%ecx
  102927:	89 c7                	mov    %eax,%edi
  102929:	89 d6                	mov    %edx,%esi
  10292b:	fc                   	cld
  10292c:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10292e:	8b 45 08             	mov    0x8(%ebp),%eax
  102931:	83 c4 10             	add    $0x10,%esp
  102934:	5b                   	pop    %ebx
  102935:	5e                   	pop    %esi
  102936:	5f                   	pop    %edi
  102937:	5d                   	pop    %ebp
  102938:	c3                   	ret

00102939 <memcpy>:
  102939:	55                   	push   %ebp
  10293a:	89 e5                	mov    %esp,%ebp
  10293c:	e8 77 da ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  102941:	05 b3 d6 00 00       	add    $0xd6b3,%eax
  102946:	ff 75 10             	push   0x10(%ebp)
  102949:	ff 75 0c             	push   0xc(%ebp)
  10294c:	ff 75 08             	push   0x8(%ebp)
  10294f:	e8 01 ff ff ff       	call   102855 <memmove>
  102954:	83 c4 0c             	add    $0xc,%esp
  102957:	c9                   	leave
  102958:	c3                   	ret

00102959 <strncmp>:
  102959:	55                   	push   %ebp
  10295a:	89 e5                	mov    %esp,%ebp
  10295c:	e8 57 da ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  102961:	05 93 d6 00 00       	add    $0xd693,%eax
  102966:	eb 0c                	jmp    102974 <strncmp+0x1b>
  102968:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10296c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102970:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  102974:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102978:	74 1a                	je     102994 <strncmp+0x3b>
  10297a:	8b 45 08             	mov    0x8(%ebp),%eax
  10297d:	0f b6 00             	movzbl (%eax),%eax
  102980:	84 c0                	test   %al,%al
  102982:	74 10                	je     102994 <strncmp+0x3b>
  102984:	8b 45 08             	mov    0x8(%ebp),%eax
  102987:	0f b6 10             	movzbl (%eax),%edx
  10298a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10298d:	0f b6 00             	movzbl (%eax),%eax
  102990:	38 c2                	cmp    %al,%dl
  102992:	74 d4                	je     102968 <strncmp+0xf>
  102994:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102998:	75 07                	jne    1029a1 <strncmp+0x48>
  10299a:	ba 00 00 00 00       	mov    $0x0,%edx
  10299f:	eb 14                	jmp    1029b5 <strncmp+0x5c>
  1029a1:	8b 45 08             	mov    0x8(%ebp),%eax
  1029a4:	0f b6 00             	movzbl (%eax),%eax
  1029a7:	0f b6 d0             	movzbl %al,%edx
  1029aa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029ad:	0f b6 00             	movzbl (%eax),%eax
  1029b0:	0f b6 c0             	movzbl %al,%eax
  1029b3:	29 c2                	sub    %eax,%edx
  1029b5:	89 d0                	mov    %edx,%eax
  1029b7:	5d                   	pop    %ebp
  1029b8:	c3                   	ret

001029b9 <strnlen>:
  1029b9:	55                   	push   %ebp
  1029ba:	89 e5                	mov    %esp,%ebp
  1029bc:	83 ec 10             	sub    $0x10,%esp
  1029bf:	e8 f4 d9 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  1029c4:	05 30 d6 00 00       	add    $0xd630,%eax
  1029c9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1029d0:	eb 0c                	jmp    1029de <strnlen+0x25>
  1029d2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1029d6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1029da:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
  1029de:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1029e2:	74 0a                	je     1029ee <strnlen+0x35>
  1029e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1029e7:	0f b6 00             	movzbl (%eax),%eax
  1029ea:	84 c0                	test   %al,%al
  1029ec:	75 e4                	jne    1029d2 <strnlen+0x19>
  1029ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1029f1:	c9                   	leave
  1029f2:	c3                   	ret

001029f3 <strcmp>:
  1029f3:	55                   	push   %ebp
  1029f4:	89 e5                	mov    %esp,%ebp
  1029f6:	e8 bd d9 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  1029fb:	05 f9 d5 00 00       	add    $0xd5f9,%eax
  102a00:	eb 08                	jmp    102a0a <strcmp+0x17>
  102a02:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102a06:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  102a0a:	8b 45 08             	mov    0x8(%ebp),%eax
  102a0d:	0f b6 00             	movzbl (%eax),%eax
  102a10:	84 c0                	test   %al,%al
  102a12:	74 10                	je     102a24 <strcmp+0x31>
  102a14:	8b 45 08             	mov    0x8(%ebp),%eax
  102a17:	0f b6 10             	movzbl (%eax),%edx
  102a1a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a1d:	0f b6 00             	movzbl (%eax),%eax
  102a20:	38 c2                	cmp    %al,%dl
  102a22:	74 de                	je     102a02 <strcmp+0xf>
  102a24:	8b 45 08             	mov    0x8(%ebp),%eax
  102a27:	0f b6 00             	movzbl (%eax),%eax
  102a2a:	0f b6 d0             	movzbl %al,%edx
  102a2d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a30:	0f b6 00             	movzbl (%eax),%eax
  102a33:	0f b6 c0             	movzbl %al,%eax
  102a36:	29 c2                	sub    %eax,%edx
  102a38:	89 d0                	mov    %edx,%eax
  102a3a:	5d                   	pop    %ebp
  102a3b:	c3                   	ret

00102a3c <strchr>:
  102a3c:	55                   	push   %ebp
  102a3d:	89 e5                	mov    %esp,%ebp
  102a3f:	83 ec 04             	sub    $0x4,%esp
  102a42:	e8 71 d9 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  102a47:	05 ad d5 00 00       	add    $0xd5ad,%eax
  102a4c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a4f:	88 45 fc             	mov    %al,-0x4(%ebp)
  102a52:	eb 14                	jmp    102a68 <strchr+0x2c>
  102a54:	8b 45 08             	mov    0x8(%ebp),%eax
  102a57:	0f b6 00             	movzbl (%eax),%eax
  102a5a:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102a5d:	75 05                	jne    102a64 <strchr+0x28>
  102a5f:	8b 45 08             	mov    0x8(%ebp),%eax
  102a62:	eb 13                	jmp    102a77 <strchr+0x3b>
  102a64:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102a68:	8b 45 08             	mov    0x8(%ebp),%eax
  102a6b:	0f b6 00             	movzbl (%eax),%eax
  102a6e:	84 c0                	test   %al,%al
  102a70:	75 e2                	jne    102a54 <strchr+0x18>
  102a72:	b8 00 00 00 00       	mov    $0x0,%eax
  102a77:	c9                   	leave
  102a78:	c3                   	ret

00102a79 <memzero>:
  102a79:	55                   	push   %ebp
  102a7a:	89 e5                	mov    %esp,%ebp
  102a7c:	e8 37 d9 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  102a81:	05 73 d5 00 00       	add    $0xd573,%eax
  102a86:	ff 75 0c             	push   0xc(%ebp)
  102a89:	6a 00                	push   $0x0
  102a8b:	ff 75 08             	push   0x8(%ebp)
  102a8e:	e8 48 fd ff ff       	call   1027db <memset>
  102a93:	83 c4 0c             	add    $0xc,%esp
  102a96:	c9                   	leave
  102a97:	c3                   	ret

00102a98 <debug_info>:
  102a98:	55                   	push   %ebp
  102a99:	89 e5                	mov    %esp,%ebp
  102a9b:	53                   	push   %ebx
  102a9c:	83 ec 14             	sub    $0x14,%esp
  102a9f:	e8 14 d9 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  102aa4:	05 50 d5 00 00       	add    $0xd550,%eax
  102aa9:	8d 55 0c             	lea    0xc(%ebp),%edx
  102aac:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102aaf:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ab2:	83 ec 08             	sub    $0x8,%esp
  102ab5:	52                   	push   %edx
  102ab6:	ff 75 08             	push   0x8(%ebp)
  102ab9:	89 c3                	mov    %eax,%ebx
  102abb:	e8 68 02 00 00       	call   102d28 <vdprintf>
  102ac0:	83 c4 10             	add    $0x10,%esp
  102ac3:	90                   	nop
  102ac4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102ac7:	c9                   	leave
  102ac8:	c3                   	ret

00102ac9 <debug_normal>:
  102ac9:	55                   	push   %ebp
  102aca:	89 e5                	mov    %esp,%ebp
  102acc:	53                   	push   %ebx
  102acd:	83 ec 14             	sub    $0x14,%esp
  102ad0:	e8 eb d8 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  102ad5:	81 c3 1f d5 00 00    	add    $0xd51f,%ebx
  102adb:	83 ec 04             	sub    $0x4,%esp
  102ade:	ff 75 0c             	push   0xc(%ebp)
  102ae1:	ff 75 08             	push   0x8(%ebp)
  102ae4:	8d 83 23 91 ff ff    	lea    -0x6edd(%ebx),%eax
  102aea:	50                   	push   %eax
  102aeb:	e8 ac 02 00 00       	call   102d9c <dprintf>
  102af0:	83 c4 10             	add    $0x10,%esp
  102af3:	8d 45 14             	lea    0x14(%ebp),%eax
  102af6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102af9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102afc:	83 ec 08             	sub    $0x8,%esp
  102aff:	50                   	push   %eax
  102b00:	ff 75 10             	push   0x10(%ebp)
  102b03:	e8 20 02 00 00       	call   102d28 <vdprintf>
  102b08:	83 c4 10             	add    $0x10,%esp
  102b0b:	90                   	nop
  102b0c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102b0f:	c9                   	leave
  102b10:	c3                   	ret

00102b11 <debug_trace>:
  102b11:	55                   	push   %ebp
  102b12:	89 e5                	mov    %esp,%ebp
  102b14:	83 ec 10             	sub    $0x10,%esp
  102b17:	e8 9c d8 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  102b1c:	05 d8 d4 00 00       	add    $0xd4d8,%eax
  102b21:	8b 45 08             	mov    0x8(%ebp),%eax
  102b24:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102b27:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  102b2e:	eb 23                	jmp    102b53 <debug_trace+0x42>
  102b30:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b33:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102b3a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b3d:	01 c2                	add    %eax,%edx
  102b3f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102b42:	8b 40 04             	mov    0x4(%eax),%eax
  102b45:	89 02                	mov    %eax,(%edx)
  102b47:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102b4a:	8b 00                	mov    (%eax),%eax
  102b4c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102b4f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102b53:	83 7d fc 09          	cmpl   $0x9,-0x4(%ebp)
  102b57:	7f 21                	jg     102b7a <debug_trace+0x69>
  102b59:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  102b5d:	75 d1                	jne    102b30 <debug_trace+0x1f>
  102b5f:	eb 19                	jmp    102b7a <debug_trace+0x69>
  102b61:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b64:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102b6b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b6e:	01 d0                	add    %edx,%eax
  102b70:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  102b76:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102b7a:	83 7d fc 09          	cmpl   $0x9,-0x4(%ebp)
  102b7e:	7e e1                	jle    102b61 <debug_trace+0x50>
  102b80:	90                   	nop
  102b81:	90                   	nop
  102b82:	c9                   	leave
  102b83:	c3                   	ret

00102b84 <debug_panic>:
  102b84:	55                   	push   %ebp
  102b85:	89 e5                	mov    %esp,%ebp
  102b87:	53                   	push   %ebx
  102b88:	83 ec 44             	sub    $0x44,%esp
  102b8b:	e8 30 d8 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  102b90:	81 c3 64 d4 00 00    	add    $0xd464,%ebx
  102b96:	83 ec 04             	sub    $0x4,%esp
  102b99:	ff 75 0c             	push   0xc(%ebp)
  102b9c:	ff 75 08             	push   0x8(%ebp)
  102b9f:	8d 83 2f 91 ff ff    	lea    -0x6ed1(%ebx),%eax
  102ba5:	50                   	push   %eax
  102ba6:	e8 f1 01 00 00       	call   102d9c <dprintf>
  102bab:	83 c4 10             	add    $0x10,%esp
  102bae:	8d 45 14             	lea    0x14(%ebp),%eax
  102bb1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  102bb4:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  102bb7:	83 ec 08             	sub    $0x8,%esp
  102bba:	50                   	push   %eax
  102bbb:	ff 75 10             	push   0x10(%ebp)
  102bbe:	e8 65 01 00 00       	call   102d28 <vdprintf>
  102bc3:	83 c4 10             	add    $0x10,%esp
  102bc6:	89 e8                	mov    %ebp,%eax
  102bc8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102bcb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bce:	83 ec 08             	sub    $0x8,%esp
  102bd1:	8d 55 c8             	lea    -0x38(%ebp),%edx
  102bd4:	52                   	push   %edx
  102bd5:	50                   	push   %eax
  102bd6:	e8 36 ff ff ff       	call   102b11 <debug_trace>
  102bdb:	83 c4 10             	add    $0x10,%esp
  102bde:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102be5:	eb 1e                	jmp    102c05 <debug_panic+0x81>
  102be7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bea:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
  102bee:	83 ec 08             	sub    $0x8,%esp
  102bf1:	50                   	push   %eax
  102bf2:	8d 83 3b 91 ff ff    	lea    -0x6ec5(%ebx),%eax
  102bf8:	50                   	push   %eax
  102bf9:	e8 9e 01 00 00       	call   102d9c <dprintf>
  102bfe:	83 c4 10             	add    $0x10,%esp
  102c01:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  102c05:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
  102c09:	7f 0b                	jg     102c16 <debug_panic+0x92>
  102c0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c0e:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
  102c12:	85 c0                	test   %eax,%eax
  102c14:	75 d1                	jne    102be7 <debug_panic+0x63>
  102c16:	83 ec 0c             	sub    $0xc,%esp
  102c19:	8d 83 49 91 ff ff    	lea    -0x6eb7(%ebx),%eax
  102c1f:	50                   	push   %eax
  102c20:	e8 77 01 00 00       	call   102d9c <dprintf>
  102c25:	83 c4 10             	add    $0x10,%esp
  102c28:	e8 e0 0c 00 00       	call   10390d <halt>
  102c2d:	90                   	nop
  102c2e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102c31:	c9                   	leave
  102c32:	c3                   	ret

00102c33 <debug_warn>:
  102c33:	55                   	push   %ebp
  102c34:	89 e5                	mov    %esp,%ebp
  102c36:	53                   	push   %ebx
  102c37:	83 ec 14             	sub    $0x14,%esp
  102c3a:	e8 81 d7 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  102c3f:	81 c3 b5 d3 00 00    	add    $0xd3b5,%ebx
  102c45:	83 ec 04             	sub    $0x4,%esp
  102c48:	ff 75 0c             	push   0xc(%ebp)
  102c4b:	ff 75 08             	push   0x8(%ebp)
  102c4e:	8d 83 5b 91 ff ff    	lea    -0x6ea5(%ebx),%eax
  102c54:	50                   	push   %eax
  102c55:	e8 42 01 00 00       	call   102d9c <dprintf>
  102c5a:	83 c4 10             	add    $0x10,%esp
  102c5d:	8d 45 14             	lea    0x14(%ebp),%eax
  102c60:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102c63:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c66:	83 ec 08             	sub    $0x8,%esp
  102c69:	50                   	push   %eax
  102c6a:	ff 75 10             	push   0x10(%ebp)
  102c6d:	e8 b6 00 00 00       	call   102d28 <vdprintf>
  102c72:	83 c4 10             	add    $0x10,%esp
  102c75:	90                   	nop
  102c76:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102c79:	c9                   	leave
  102c7a:	c3                   	ret

00102c7b <cputs>:
  102c7b:	55                   	push   %ebp
  102c7c:	89 e5                	mov    %esp,%ebp
  102c7e:	53                   	push   %ebx
  102c7f:	83 ec 04             	sub    $0x4,%esp
  102c82:	e8 39 d7 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  102c87:	81 c3 6d d3 00 00    	add    $0xd36d,%ebx
  102c8d:	eb 19                	jmp    102ca8 <cputs+0x2d>
  102c8f:	8b 45 08             	mov    0x8(%ebp),%eax
  102c92:	0f b6 00             	movzbl (%eax),%eax
  102c95:	0f be c0             	movsbl %al,%eax
  102c98:	83 ec 0c             	sub    $0xc,%esp
  102c9b:	50                   	push   %eax
  102c9c:	e8 2f d8 ff ff       	call   1004d0 <cons_putc>
  102ca1:	83 c4 10             	add    $0x10,%esp
  102ca4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102ca8:	8b 45 08             	mov    0x8(%ebp),%eax
  102cab:	0f b6 00             	movzbl (%eax),%eax
  102cae:	84 c0                	test   %al,%al
  102cb0:	75 dd                	jne    102c8f <cputs+0x14>
  102cb2:	90                   	nop
  102cb3:	90                   	nop
  102cb4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102cb7:	c9                   	leave
  102cb8:	c3                   	ret

00102cb9 <putch>:
  102cb9:	55                   	push   %ebp
  102cba:	89 e5                	mov    %esp,%ebp
  102cbc:	83 ec 08             	sub    $0x8,%esp
  102cbf:	e8 f4 d6 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  102cc4:	05 30 d3 00 00       	add    $0xd330,%eax
  102cc9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ccc:	8b 00                	mov    (%eax),%eax
  102cce:	8d 48 01             	lea    0x1(%eax),%ecx
  102cd1:	8b 55 0c             	mov    0xc(%ebp),%edx
  102cd4:	89 0a                	mov    %ecx,(%edx)
  102cd6:	8b 55 08             	mov    0x8(%ebp),%edx
  102cd9:	89 d1                	mov    %edx,%ecx
  102cdb:	8b 55 0c             	mov    0xc(%ebp),%edx
  102cde:	88 4c 02 08          	mov    %cl,0x8(%edx,%eax,1)
  102ce2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ce5:	8b 00                	mov    (%eax),%eax
  102ce7:	3d ff 01 00 00       	cmp    $0x1ff,%eax
  102cec:	75 28                	jne    102d16 <putch+0x5d>
  102cee:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cf1:	8b 00                	mov    (%eax),%eax
  102cf3:	8b 55 0c             	mov    0xc(%ebp),%edx
  102cf6:	c6 44 02 08 00       	movb   $0x0,0x8(%edx,%eax,1)
  102cfb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cfe:	83 c0 08             	add    $0x8,%eax
  102d01:	83 ec 0c             	sub    $0xc,%esp
  102d04:	50                   	push   %eax
  102d05:	e8 71 ff ff ff       	call   102c7b <cputs>
  102d0a:	83 c4 10             	add    $0x10,%esp
  102d0d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d10:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  102d16:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d19:	8b 40 04             	mov    0x4(%eax),%eax
  102d1c:	8d 50 01             	lea    0x1(%eax),%edx
  102d1f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d22:	89 50 04             	mov    %edx,0x4(%eax)
  102d25:	90                   	nop
  102d26:	c9                   	leave
  102d27:	c3                   	ret

00102d28 <vdprintf>:
  102d28:	55                   	push   %ebp
  102d29:	89 e5                	mov    %esp,%ebp
  102d2b:	53                   	push   %ebx
  102d2c:	81 ec 14 02 00 00    	sub    $0x214,%esp
  102d32:	e8 81 d6 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  102d37:	05 bd d2 00 00       	add    $0xd2bd,%eax
  102d3c:	c7 85 f0 fd ff ff 00 	movl   $0x0,-0x210(%ebp)
  102d43:	00 00 00 
  102d46:	c7 85 f4 fd ff ff 00 	movl   $0x0,-0x20c(%ebp)
  102d4d:	00 00 00 
  102d50:	ff 75 0c             	push   0xc(%ebp)
  102d53:	ff 75 08             	push   0x8(%ebp)
  102d56:	8d 95 f0 fd ff ff    	lea    -0x210(%ebp),%edx
  102d5c:	52                   	push   %edx
  102d5d:	8d 90 c5 2c ff ff    	lea    -0xd33b(%eax),%edx
  102d63:	52                   	push   %edx
  102d64:	89 c3                	mov    %eax,%ebx
  102d66:	e8 d6 01 00 00       	call   102f41 <vprintfmt>
  102d6b:	83 c4 10             	add    $0x10,%esp
  102d6e:	8b 85 f0 fd ff ff    	mov    -0x210(%ebp),%eax
  102d74:	c6 84 05 f8 fd ff ff 	movb   $0x0,-0x208(%ebp,%eax,1)
  102d7b:	00 
  102d7c:	83 ec 0c             	sub    $0xc,%esp
  102d7f:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  102d85:	83 c0 08             	add    $0x8,%eax
  102d88:	50                   	push   %eax
  102d89:	e8 ed fe ff ff       	call   102c7b <cputs>
  102d8e:	83 c4 10             	add    $0x10,%esp
  102d91:	8b 85 f4 fd ff ff    	mov    -0x20c(%ebp),%eax
  102d97:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102d9a:	c9                   	leave
  102d9b:	c3                   	ret

00102d9c <dprintf>:
  102d9c:	55                   	push   %ebp
  102d9d:	89 e5                	mov    %esp,%ebp
  102d9f:	83 ec 18             	sub    $0x18,%esp
  102da2:	e8 11 d6 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  102da7:	05 4d d2 00 00       	add    $0xd24d,%eax
  102dac:	8d 45 0c             	lea    0xc(%ebp),%eax
  102daf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102db2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102db5:	83 ec 08             	sub    $0x8,%esp
  102db8:	50                   	push   %eax
  102db9:	ff 75 08             	push   0x8(%ebp)
  102dbc:	e8 67 ff ff ff       	call   102d28 <vdprintf>
  102dc1:	83 c4 10             	add    $0x10,%esp
  102dc4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102dc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102dca:	c9                   	leave
  102dcb:	c3                   	ret

00102dcc <printnum>:
  102dcc:	55                   	push   %ebp
  102dcd:	89 e5                	mov    %esp,%ebp
  102dcf:	57                   	push   %edi
  102dd0:	56                   	push   %esi
  102dd1:	53                   	push   %ebx
  102dd2:	83 ec 1c             	sub    $0x1c,%esp
  102dd5:	e8 b2 04 00 00       	call   10328c <__x86.get_pc_thunk.si>
  102dda:	81 c6 1a d2 00 00    	add    $0xd21a,%esi
  102de0:	8b 45 10             	mov    0x10(%ebp),%eax
  102de3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102de6:	8b 45 14             	mov    0x14(%ebp),%eax
  102de9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102dec:	8b 45 18             	mov    0x18(%ebp),%eax
  102def:	ba 00 00 00 00       	mov    $0x0,%edx
  102df4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  102df7:	39 45 e0             	cmp    %eax,-0x20(%ebp)
  102dfa:	19 d1                	sbb    %edx,%ecx
  102dfc:	72 4d                	jb     102e4b <printnum+0x7f>
  102dfe:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102e01:	8d 78 ff             	lea    -0x1(%eax),%edi
  102e04:	8b 45 18             	mov    0x18(%ebp),%eax
  102e07:	ba 00 00 00 00       	mov    $0x0,%edx
  102e0c:	52                   	push   %edx
  102e0d:	50                   	push   %eax
  102e0e:	ff 75 e4             	push   -0x1c(%ebp)
  102e11:	ff 75 e0             	push   -0x20(%ebp)
  102e14:	89 f3                	mov    %esi,%ebx
  102e16:	e8 f5 5c 00 00       	call   108b10 <__udivdi3>
  102e1b:	83 c4 10             	add    $0x10,%esp
  102e1e:	83 ec 04             	sub    $0x4,%esp
  102e21:	ff 75 20             	push   0x20(%ebp)
  102e24:	57                   	push   %edi
  102e25:	ff 75 18             	push   0x18(%ebp)
  102e28:	52                   	push   %edx
  102e29:	50                   	push   %eax
  102e2a:	ff 75 0c             	push   0xc(%ebp)
  102e2d:	ff 75 08             	push   0x8(%ebp)
  102e30:	e8 97 ff ff ff       	call   102dcc <printnum>
  102e35:	83 c4 20             	add    $0x20,%esp
  102e38:	eb 1b                	jmp    102e55 <printnum+0x89>
  102e3a:	83 ec 08             	sub    $0x8,%esp
  102e3d:	ff 75 0c             	push   0xc(%ebp)
  102e40:	ff 75 20             	push   0x20(%ebp)
  102e43:	8b 45 08             	mov    0x8(%ebp),%eax
  102e46:	ff d0                	call   *%eax
  102e48:	83 c4 10             	add    $0x10,%esp
  102e4b:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102e4f:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102e53:	7f e5                	jg     102e3a <printnum+0x6e>
  102e55:	8b 4d 18             	mov    0x18(%ebp),%ecx
  102e58:	bb 00 00 00 00       	mov    $0x0,%ebx
  102e5d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e60:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102e63:	53                   	push   %ebx
  102e64:	51                   	push   %ecx
  102e65:	52                   	push   %edx
  102e66:	50                   	push   %eax
  102e67:	89 f3                	mov    %esi,%ebx
  102e69:	e8 d2 5d 00 00       	call   108c40 <__umoddi3>
  102e6e:	83 c4 10             	add    $0x10,%esp
  102e71:	8d 8e 68 91 ff ff    	lea    -0x6e98(%esi),%ecx
  102e77:	01 c8                	add    %ecx,%eax
  102e79:	0f b6 00             	movzbl (%eax),%eax
  102e7c:	0f be c0             	movsbl %al,%eax
  102e7f:	83 ec 08             	sub    $0x8,%esp
  102e82:	ff 75 0c             	push   0xc(%ebp)
  102e85:	50                   	push   %eax
  102e86:	8b 45 08             	mov    0x8(%ebp),%eax
  102e89:	ff d0                	call   *%eax
  102e8b:	83 c4 10             	add    $0x10,%esp
  102e8e:	90                   	nop
  102e8f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  102e92:	5b                   	pop    %ebx
  102e93:	5e                   	pop    %esi
  102e94:	5f                   	pop    %edi
  102e95:	5d                   	pop    %ebp
  102e96:	c3                   	ret

00102e97 <getuint>:
  102e97:	55                   	push   %ebp
  102e98:	89 e5                	mov    %esp,%ebp
  102e9a:	e8 19 d5 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  102e9f:	05 55 d1 00 00       	add    $0xd155,%eax
  102ea4:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102ea8:	7e 14                	jle    102ebe <getuint+0x27>
  102eaa:	8b 45 08             	mov    0x8(%ebp),%eax
  102ead:	8b 00                	mov    (%eax),%eax
  102eaf:	8d 48 08             	lea    0x8(%eax),%ecx
  102eb2:	8b 55 08             	mov    0x8(%ebp),%edx
  102eb5:	89 0a                	mov    %ecx,(%edx)
  102eb7:	8b 50 04             	mov    0x4(%eax),%edx
  102eba:	8b 00                	mov    (%eax),%eax
  102ebc:	eb 30                	jmp    102eee <getuint+0x57>
  102ebe:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102ec2:	74 16                	je     102eda <getuint+0x43>
  102ec4:	8b 45 08             	mov    0x8(%ebp),%eax
  102ec7:	8b 00                	mov    (%eax),%eax
  102ec9:	8d 48 04             	lea    0x4(%eax),%ecx
  102ecc:	8b 55 08             	mov    0x8(%ebp),%edx
  102ecf:	89 0a                	mov    %ecx,(%edx)
  102ed1:	8b 00                	mov    (%eax),%eax
  102ed3:	ba 00 00 00 00       	mov    $0x0,%edx
  102ed8:	eb 14                	jmp    102eee <getuint+0x57>
  102eda:	8b 45 08             	mov    0x8(%ebp),%eax
  102edd:	8b 00                	mov    (%eax),%eax
  102edf:	8d 48 04             	lea    0x4(%eax),%ecx
  102ee2:	8b 55 08             	mov    0x8(%ebp),%edx
  102ee5:	89 0a                	mov    %ecx,(%edx)
  102ee7:	8b 00                	mov    (%eax),%eax
  102ee9:	ba 00 00 00 00       	mov    $0x0,%edx
  102eee:	5d                   	pop    %ebp
  102eef:	c3                   	ret

00102ef0 <getint>:
  102ef0:	55                   	push   %ebp
  102ef1:	89 e5                	mov    %esp,%ebp
  102ef3:	e8 c0 d4 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  102ef8:	05 fc d0 00 00       	add    $0xd0fc,%eax
  102efd:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102f01:	7e 14                	jle    102f17 <getint+0x27>
  102f03:	8b 45 08             	mov    0x8(%ebp),%eax
  102f06:	8b 00                	mov    (%eax),%eax
  102f08:	8d 48 08             	lea    0x8(%eax),%ecx
  102f0b:	8b 55 08             	mov    0x8(%ebp),%edx
  102f0e:	89 0a                	mov    %ecx,(%edx)
  102f10:	8b 50 04             	mov    0x4(%eax),%edx
  102f13:	8b 00                	mov    (%eax),%eax
  102f15:	eb 28                	jmp    102f3f <getint+0x4f>
  102f17:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102f1b:	74 12                	je     102f2f <getint+0x3f>
  102f1d:	8b 45 08             	mov    0x8(%ebp),%eax
  102f20:	8b 00                	mov    (%eax),%eax
  102f22:	8d 48 04             	lea    0x4(%eax),%ecx
  102f25:	8b 55 08             	mov    0x8(%ebp),%edx
  102f28:	89 0a                	mov    %ecx,(%edx)
  102f2a:	8b 00                	mov    (%eax),%eax
  102f2c:	99                   	cltd
  102f2d:	eb 10                	jmp    102f3f <getint+0x4f>
  102f2f:	8b 45 08             	mov    0x8(%ebp),%eax
  102f32:	8b 00                	mov    (%eax),%eax
  102f34:	8d 48 04             	lea    0x4(%eax),%ecx
  102f37:	8b 55 08             	mov    0x8(%ebp),%edx
  102f3a:	89 0a                	mov    %ecx,(%edx)
  102f3c:	8b 00                	mov    (%eax),%eax
  102f3e:	99                   	cltd
  102f3f:	5d                   	pop    %ebp
  102f40:	c3                   	ret

00102f41 <vprintfmt>:
  102f41:	55                   	push   %ebp
  102f42:	89 e5                	mov    %esp,%ebp
  102f44:	57                   	push   %edi
  102f45:	56                   	push   %esi
  102f46:	53                   	push   %ebx
  102f47:	83 ec 2c             	sub    $0x2c,%esp
  102f4a:	e8 41 03 00 00       	call   103290 <__x86.get_pc_thunk.di>
  102f4f:	81 c7 a5 d0 00 00    	add    $0xd0a5,%edi
  102f55:	eb 17                	jmp    102f6e <vprintfmt+0x2d>
  102f57:	85 db                	test   %ebx,%ebx
  102f59:	0f 84 24 03 00 00    	je     103283 <.L21+0x2d>
  102f5f:	83 ec 08             	sub    $0x8,%esp
  102f62:	ff 75 0c             	push   0xc(%ebp)
  102f65:	53                   	push   %ebx
  102f66:	8b 45 08             	mov    0x8(%ebp),%eax
  102f69:	ff d0                	call   *%eax
  102f6b:	83 c4 10             	add    $0x10,%esp
  102f6e:	8b 45 10             	mov    0x10(%ebp),%eax
  102f71:	8d 50 01             	lea    0x1(%eax),%edx
  102f74:	89 55 10             	mov    %edx,0x10(%ebp)
  102f77:	0f b6 00             	movzbl (%eax),%eax
  102f7a:	0f b6 d8             	movzbl %al,%ebx
  102f7d:	83 fb 25             	cmp    $0x25,%ebx
  102f80:	75 d5                	jne    102f57 <vprintfmt+0x16>
  102f82:	c6 45 cb 20          	movb   $0x20,-0x35(%ebp)
  102f86:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
  102f8d:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  102f94:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  102f9b:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
  102fa2:	eb 04                	jmp    102fa8 <vprintfmt+0x67>
  102fa4:	90                   	nop
  102fa5:	eb 01                	jmp    102fa8 <vprintfmt+0x67>
  102fa7:	90                   	nop
  102fa8:	8b 45 10             	mov    0x10(%ebp),%eax
  102fab:	8d 50 01             	lea    0x1(%eax),%edx
  102fae:	89 55 10             	mov    %edx,0x10(%ebp)
  102fb1:	0f b6 00             	movzbl (%eax),%eax
  102fb4:	0f b6 d8             	movzbl %al,%ebx
  102fb7:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102fba:	83 f8 55             	cmp    $0x55,%eax
  102fbd:	0f 87 93 02 00 00    	ja     103256 <.L21>
  102fc3:	c1 e0 02             	shl    $0x2,%eax
  102fc6:	8b 84 38 80 91 ff ff 	mov    -0x6e80(%eax,%edi,1),%eax
  102fcd:	01 f8                	add    %edi,%eax
  102fcf:	ff e0                	jmp    *%eax

00102fd1 <.L33>:
  102fd1:	c6 45 cb 2d          	movb   $0x2d,-0x35(%ebp)
  102fd5:	eb d1                	jmp    102fa8 <vprintfmt+0x67>

00102fd7 <.L31>:
  102fd7:	c6 45 cb 30          	movb   $0x30,-0x35(%ebp)
  102fdb:	eb cb                	jmp    102fa8 <vprintfmt+0x67>

00102fdd <.L30>:
  102fdd:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
  102fe4:	8b 55 d0             	mov    -0x30(%ebp),%edx
  102fe7:	89 d0                	mov    %edx,%eax
  102fe9:	c1 e0 02             	shl    $0x2,%eax
  102fec:	01 d0                	add    %edx,%eax
  102fee:	01 c0                	add    %eax,%eax
  102ff0:	01 d8                	add    %ebx,%eax
  102ff2:	83 e8 30             	sub    $0x30,%eax
  102ff5:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102ff8:	8b 45 10             	mov    0x10(%ebp),%eax
  102ffb:	0f b6 00             	movzbl (%eax),%eax
  102ffe:	0f be d8             	movsbl %al,%ebx
  103001:	83 fb 2f             	cmp    $0x2f,%ebx
  103004:	7e 3d                	jle    103043 <.L36+0xc>
  103006:	83 fb 39             	cmp    $0x39,%ebx
  103009:	7f 38                	jg     103043 <.L36+0xc>
  10300b:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  10300f:	eb d3                	jmp    102fe4 <.L30+0x7>

00103011 <.L34>:
  103011:	8b 45 14             	mov    0x14(%ebp),%eax
  103014:	8d 50 04             	lea    0x4(%eax),%edx
  103017:	89 55 14             	mov    %edx,0x14(%ebp)
  10301a:	8b 00                	mov    (%eax),%eax
  10301c:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10301f:	eb 23                	jmp    103044 <.L36+0xd>

00103021 <.L32>:
  103021:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  103025:	0f 89 79 ff ff ff    	jns    102fa4 <vprintfmt+0x63>
  10302b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  103032:	e9 6d ff ff ff       	jmp    102fa4 <vprintfmt+0x63>

00103037 <.L36>:
  103037:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
  10303e:	e9 65 ff ff ff       	jmp    102fa8 <vprintfmt+0x67>
  103043:	90                   	nop
  103044:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  103048:	0f 89 59 ff ff ff    	jns    102fa7 <vprintfmt+0x66>
  10304e:	8b 45 d0             	mov    -0x30(%ebp),%eax
  103051:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  103054:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  10305b:	e9 47 ff ff ff       	jmp    102fa7 <vprintfmt+0x66>

00103060 <.L27>:
  103060:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
  103064:	e9 3f ff ff ff       	jmp    102fa8 <vprintfmt+0x67>

00103069 <.L29>:
  103069:	8b 45 14             	mov    0x14(%ebp),%eax
  10306c:	8d 50 04             	lea    0x4(%eax),%edx
  10306f:	89 55 14             	mov    %edx,0x14(%ebp)
  103072:	8b 00                	mov    (%eax),%eax
  103074:	83 ec 08             	sub    $0x8,%esp
  103077:	ff 75 0c             	push   0xc(%ebp)
  10307a:	50                   	push   %eax
  10307b:	8b 45 08             	mov    0x8(%ebp),%eax
  10307e:	ff d0                	call   *%eax
  103080:	83 c4 10             	add    $0x10,%esp
  103083:	e9 f6 01 00 00       	jmp    10327e <.L21+0x28>

00103088 <.L25>:
  103088:	8b 45 14             	mov    0x14(%ebp),%eax
  10308b:	8d 50 04             	lea    0x4(%eax),%edx
  10308e:	89 55 14             	mov    %edx,0x14(%ebp)
  103091:	8b 30                	mov    (%eax),%esi
  103093:	85 f6                	test   %esi,%esi
  103095:	75 06                	jne    10309d <.L25+0x15>
  103097:	8d b7 79 91 ff ff    	lea    -0x6e87(%edi),%esi
  10309d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  1030a1:	7e 71                	jle    103114 <.L25+0x8c>
  1030a3:	80 7d cb 2d          	cmpb   $0x2d,-0x35(%ebp)
  1030a7:	74 6b                	je     103114 <.L25+0x8c>
  1030a9:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1030ac:	83 ec 08             	sub    $0x8,%esp
  1030af:	50                   	push   %eax
  1030b0:	56                   	push   %esi
  1030b1:	89 fb                	mov    %edi,%ebx
  1030b3:	e8 01 f9 ff ff       	call   1029b9 <strnlen>
  1030b8:	83 c4 10             	add    $0x10,%esp
  1030bb:	29 45 d4             	sub    %eax,-0x2c(%ebp)
  1030be:	eb 17                	jmp    1030d7 <.L25+0x4f>
  1030c0:	0f be 45 cb          	movsbl -0x35(%ebp),%eax
  1030c4:	83 ec 08             	sub    $0x8,%esp
  1030c7:	ff 75 0c             	push   0xc(%ebp)
  1030ca:	50                   	push   %eax
  1030cb:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ce:	ff d0                	call   *%eax
  1030d0:	83 c4 10             	add    $0x10,%esp
  1030d3:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
  1030d7:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  1030db:	7f e3                	jg     1030c0 <.L25+0x38>
  1030dd:	eb 35                	jmp    103114 <.L25+0x8c>
  1030df:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
  1030e3:	74 1c                	je     103101 <.L25+0x79>
  1030e5:	83 fb 1f             	cmp    $0x1f,%ebx
  1030e8:	7e 05                	jle    1030ef <.L25+0x67>
  1030ea:	83 fb 7e             	cmp    $0x7e,%ebx
  1030ed:	7e 12                	jle    103101 <.L25+0x79>
  1030ef:	83 ec 08             	sub    $0x8,%esp
  1030f2:	ff 75 0c             	push   0xc(%ebp)
  1030f5:	6a 3f                	push   $0x3f
  1030f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1030fa:	ff d0                	call   *%eax
  1030fc:	83 c4 10             	add    $0x10,%esp
  1030ff:	eb 0f                	jmp    103110 <.L25+0x88>
  103101:	83 ec 08             	sub    $0x8,%esp
  103104:	ff 75 0c             	push   0xc(%ebp)
  103107:	53                   	push   %ebx
  103108:	8b 45 08             	mov    0x8(%ebp),%eax
  10310b:	ff d0                	call   *%eax
  10310d:	83 c4 10             	add    $0x10,%esp
  103110:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
  103114:	89 f0                	mov    %esi,%eax
  103116:	8d 70 01             	lea    0x1(%eax),%esi
  103119:	0f b6 00             	movzbl (%eax),%eax
  10311c:	0f be d8             	movsbl %al,%ebx
  10311f:	85 db                	test   %ebx,%ebx
  103121:	74 26                	je     103149 <.L25+0xc1>
  103123:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
  103127:	78 b6                	js     1030df <.L25+0x57>
  103129:	83 6d d0 01          	subl   $0x1,-0x30(%ebp)
  10312d:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
  103131:	79 ac                	jns    1030df <.L25+0x57>
  103133:	eb 14                	jmp    103149 <.L25+0xc1>
  103135:	83 ec 08             	sub    $0x8,%esp
  103138:	ff 75 0c             	push   0xc(%ebp)
  10313b:	6a 20                	push   $0x20
  10313d:	8b 45 08             	mov    0x8(%ebp),%eax
  103140:	ff d0                	call   *%eax
  103142:	83 c4 10             	add    $0x10,%esp
  103145:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
  103149:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  10314d:	7f e6                	jg     103135 <.L25+0xad>
  10314f:	e9 2a 01 00 00       	jmp    10327e <.L21+0x28>

00103154 <.L28>:
  103154:	83 ec 08             	sub    $0x8,%esp
  103157:	ff 75 d8             	push   -0x28(%ebp)
  10315a:	8d 45 14             	lea    0x14(%ebp),%eax
  10315d:	50                   	push   %eax
  10315e:	e8 8d fd ff ff       	call   102ef0 <getint>
  103163:	83 c4 10             	add    $0x10,%esp
  103166:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103169:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  10316c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10316f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103172:	85 d2                	test   %edx,%edx
  103174:	79 23                	jns    103199 <.L28+0x45>
  103176:	83 ec 08             	sub    $0x8,%esp
  103179:	ff 75 0c             	push   0xc(%ebp)
  10317c:	6a 2d                	push   $0x2d
  10317e:	8b 45 08             	mov    0x8(%ebp),%eax
  103181:	ff d0                	call   *%eax
  103183:	83 c4 10             	add    $0x10,%esp
  103186:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103189:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10318c:	f7 d8                	neg    %eax
  10318e:	83 d2 00             	adc    $0x0,%edx
  103191:	f7 da                	neg    %edx
  103193:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103196:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  103199:	c7 45 dc 0a 00 00 00 	movl   $0xa,-0x24(%ebp)
  1031a0:	eb 7e                	jmp    103220 <.L22+0x1f>

001031a2 <.L24>:
  1031a2:	83 ec 08             	sub    $0x8,%esp
  1031a5:	ff 75 d8             	push   -0x28(%ebp)
  1031a8:	8d 45 14             	lea    0x14(%ebp),%eax
  1031ab:	50                   	push   %eax
  1031ac:	e8 e6 fc ff ff       	call   102e97 <getuint>
  1031b1:	83 c4 10             	add    $0x10,%esp
  1031b4:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1031b7:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  1031ba:	c7 45 dc 0a 00 00 00 	movl   $0xa,-0x24(%ebp)
  1031c1:	eb 5d                	jmp    103220 <.L22+0x1f>

001031c3 <.L26>:
  1031c3:	83 ec 08             	sub    $0x8,%esp
  1031c6:	ff 75 0c             	push   0xc(%ebp)
  1031c9:	6a 30                	push   $0x30
  1031cb:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ce:	ff d0                	call   *%eax
  1031d0:	83 c4 10             	add    $0x10,%esp
  1031d3:	83 ec 08             	sub    $0x8,%esp
  1031d6:	ff 75 0c             	push   0xc(%ebp)
  1031d9:	6a 78                	push   $0x78
  1031db:	8b 45 08             	mov    0x8(%ebp),%eax
  1031de:	ff d0                	call   *%eax
  1031e0:	83 c4 10             	add    $0x10,%esp
  1031e3:	8b 45 14             	mov    0x14(%ebp),%eax
  1031e6:	8d 50 04             	lea    0x4(%eax),%edx
  1031e9:	89 55 14             	mov    %edx,0x14(%ebp)
  1031ec:	8b 00                	mov    (%eax),%eax
  1031ee:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1031f1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1031f8:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
  1031ff:	eb 1f                	jmp    103220 <.L22+0x1f>

00103201 <.L22>:
  103201:	83 ec 08             	sub    $0x8,%esp
  103204:	ff 75 d8             	push   -0x28(%ebp)
  103207:	8d 45 14             	lea    0x14(%ebp),%eax
  10320a:	50                   	push   %eax
  10320b:	e8 87 fc ff ff       	call   102e97 <getuint>
  103210:	83 c4 10             	add    $0x10,%esp
  103213:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103216:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  103219:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
  103220:	0f be 55 cb          	movsbl -0x35(%ebp),%edx
  103224:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103227:	83 ec 04             	sub    $0x4,%esp
  10322a:	52                   	push   %edx
  10322b:	ff 75 d4             	push   -0x2c(%ebp)
  10322e:	50                   	push   %eax
  10322f:	ff 75 e4             	push   -0x1c(%ebp)
  103232:	ff 75 e0             	push   -0x20(%ebp)
  103235:	ff 75 0c             	push   0xc(%ebp)
  103238:	ff 75 08             	push   0x8(%ebp)
  10323b:	e8 8c fb ff ff       	call   102dcc <printnum>
  103240:	83 c4 20             	add    $0x20,%esp
  103243:	eb 39                	jmp    10327e <.L21+0x28>

00103245 <.L35>:
  103245:	83 ec 08             	sub    $0x8,%esp
  103248:	ff 75 0c             	push   0xc(%ebp)
  10324b:	53                   	push   %ebx
  10324c:	8b 45 08             	mov    0x8(%ebp),%eax
  10324f:	ff d0                	call   *%eax
  103251:	83 c4 10             	add    $0x10,%esp
  103254:	eb 28                	jmp    10327e <.L21+0x28>

00103256 <.L21>:
  103256:	83 ec 08             	sub    $0x8,%esp
  103259:	ff 75 0c             	push   0xc(%ebp)
  10325c:	6a 25                	push   $0x25
  10325e:	8b 45 08             	mov    0x8(%ebp),%eax
  103261:	ff d0                	call   *%eax
  103263:	83 c4 10             	add    $0x10,%esp
  103266:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10326a:	eb 04                	jmp    103270 <.L21+0x1a>
  10326c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103270:	8b 45 10             	mov    0x10(%ebp),%eax
  103273:	83 e8 01             	sub    $0x1,%eax
  103276:	0f b6 00             	movzbl (%eax),%eax
  103279:	3c 25                	cmp    $0x25,%al
  10327b:	75 ef                	jne    10326c <.L21+0x16>
  10327d:	90                   	nop
  10327e:	e9 eb fc ff ff       	jmp    102f6e <vprintfmt+0x2d>
  103283:	90                   	nop
  103284:	8d 65 f4             	lea    -0xc(%ebp),%esp
  103287:	5b                   	pop    %ebx
  103288:	5e                   	pop    %esi
  103289:	5f                   	pop    %edi
  10328a:	5d                   	pop    %ebp
  10328b:	c3                   	ret

0010328c <__x86.get_pc_thunk.si>:
  10328c:	8b 34 24             	mov    (%esp),%esi
  10328f:	c3                   	ret

00103290 <__x86.get_pc_thunk.di>:
  103290:	8b 3c 24             	mov    (%esp),%edi
  103293:	c3                   	ret

00103294 <seg_init>:
  103294:	55                   	push   %ebp
  103295:	89 e5                	mov    %esp,%ebp
  103297:	53                   	push   %ebx
  103298:	83 ec 14             	sub    $0x14,%esp
  10329b:	e8 20 d1 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1032a0:	81 c3 54 cd 00 00    	add    $0xcd54,%ebx
  1032a6:	8d 83 0c 80 00 00    	lea    0x800c(%ebx),%eax
  1032ac:	c7 c2 f4 58 11 00    	mov    $0x1158f4,%edx
  1032b2:	29 d0                	sub    %edx,%eax
  1032b4:	83 ec 08             	sub    $0x8,%esp
  1032b7:	50                   	push   %eax
  1032b8:	c7 c0 f4 58 11 00    	mov    $0x1158f4,%eax
  1032be:	50                   	push   %eax
  1032bf:	e8 b5 f7 ff ff       	call   102a79 <memzero>
  1032c4:	83 c4 10             	add    $0x10,%esp
  1032c7:	c7 c0 00 e1 d9 01    	mov    $0x1d9e100,%eax
  1032cd:	89 c2                	mov    %eax,%edx
  1032cf:	8d 83 0c 80 00 00    	lea    0x800c(%ebx),%eax
  1032d5:	29 c2                	sub    %eax,%edx
  1032d7:	8d 82 00 f0 ff ff    	lea    -0x1000(%edx),%eax
  1032dd:	89 c2                	mov    %eax,%edx
  1032df:	8d 83 0c 90 00 00    	lea    0x900c(%ebx),%eax
  1032e5:	83 ec 08             	sub    $0x8,%esp
  1032e8:	52                   	push   %edx
  1032e9:	50                   	push   %eax
  1032ea:	e8 8a f7 ff ff       	call   102a79 <memzero>
  1032ef:	83 c4 10             	add    $0x10,%esp
  1032f2:	c7 83 0c 90 04 00 00 	movl   $0x0,0x4900c(%ebx)
  1032f9:	00 00 00 
  1032fc:	c7 83 10 90 04 00 00 	movl   $0x0,0x49010(%ebx)
  103303:	00 00 00 
  103306:	66 c7 83 14 90 04 00 	movw   $0xffff,0x49014(%ebx)
  10330d:	ff ff 
  10330f:	66 c7 83 16 90 04 00 	movw   $0x0,0x49016(%ebx)
  103316:	00 00 
  103318:	c6 83 18 90 04 00 00 	movb   $0x0,0x49018(%ebx)
  10331f:	0f b6 83 19 90 04 00 	movzbl 0x49019(%ebx),%eax
  103326:	83 e0 f0             	and    $0xfffffff0,%eax
  103329:	83 c8 0a             	or     $0xa,%eax
  10332c:	88 83 19 90 04 00    	mov    %al,0x49019(%ebx)
  103332:	0f b6 83 19 90 04 00 	movzbl 0x49019(%ebx),%eax
  103339:	83 c8 10             	or     $0x10,%eax
  10333c:	88 83 19 90 04 00    	mov    %al,0x49019(%ebx)
  103342:	0f b6 83 19 90 04 00 	movzbl 0x49019(%ebx),%eax
  103349:	83 e0 9f             	and    $0xffffff9f,%eax
  10334c:	88 83 19 90 04 00    	mov    %al,0x49019(%ebx)
  103352:	0f b6 83 19 90 04 00 	movzbl 0x49019(%ebx),%eax
  103359:	83 c8 80             	or     $0xffffff80,%eax
  10335c:	88 83 19 90 04 00    	mov    %al,0x49019(%ebx)
  103362:	0f b6 83 1a 90 04 00 	movzbl 0x4901a(%ebx),%eax
  103369:	83 c8 0f             	or     $0xf,%eax
  10336c:	88 83 1a 90 04 00    	mov    %al,0x4901a(%ebx)
  103372:	0f b6 83 1a 90 04 00 	movzbl 0x4901a(%ebx),%eax
  103379:	83 e0 ef             	and    $0xffffffef,%eax
  10337c:	88 83 1a 90 04 00    	mov    %al,0x4901a(%ebx)
  103382:	0f b6 83 1a 90 04 00 	movzbl 0x4901a(%ebx),%eax
  103389:	83 e0 df             	and    $0xffffffdf,%eax
  10338c:	88 83 1a 90 04 00    	mov    %al,0x4901a(%ebx)
  103392:	0f b6 83 1a 90 04 00 	movzbl 0x4901a(%ebx),%eax
  103399:	83 c8 40             	or     $0x40,%eax
  10339c:	88 83 1a 90 04 00    	mov    %al,0x4901a(%ebx)
  1033a2:	0f b6 83 1a 90 04 00 	movzbl 0x4901a(%ebx),%eax
  1033a9:	83 c8 80             	or     $0xffffff80,%eax
  1033ac:	88 83 1a 90 04 00    	mov    %al,0x4901a(%ebx)
  1033b2:	c6 83 1b 90 04 00 00 	movb   $0x0,0x4901b(%ebx)
  1033b9:	66 c7 83 1c 90 04 00 	movw   $0xffff,0x4901c(%ebx)
  1033c0:	ff ff 
  1033c2:	66 c7 83 1e 90 04 00 	movw   $0x0,0x4901e(%ebx)
  1033c9:	00 00 
  1033cb:	c6 83 20 90 04 00 00 	movb   $0x0,0x49020(%ebx)
  1033d2:	0f b6 83 21 90 04 00 	movzbl 0x49021(%ebx),%eax
  1033d9:	83 e0 f0             	and    $0xfffffff0,%eax
  1033dc:	83 c8 02             	or     $0x2,%eax
  1033df:	88 83 21 90 04 00    	mov    %al,0x49021(%ebx)
  1033e5:	0f b6 83 21 90 04 00 	movzbl 0x49021(%ebx),%eax
  1033ec:	83 c8 10             	or     $0x10,%eax
  1033ef:	88 83 21 90 04 00    	mov    %al,0x49021(%ebx)
  1033f5:	0f b6 83 21 90 04 00 	movzbl 0x49021(%ebx),%eax
  1033fc:	83 e0 9f             	and    $0xffffff9f,%eax
  1033ff:	88 83 21 90 04 00    	mov    %al,0x49021(%ebx)
  103405:	0f b6 83 21 90 04 00 	movzbl 0x49021(%ebx),%eax
  10340c:	83 c8 80             	or     $0xffffff80,%eax
  10340f:	88 83 21 90 04 00    	mov    %al,0x49021(%ebx)
  103415:	0f b6 83 22 90 04 00 	movzbl 0x49022(%ebx),%eax
  10341c:	83 c8 0f             	or     $0xf,%eax
  10341f:	88 83 22 90 04 00    	mov    %al,0x49022(%ebx)
  103425:	0f b6 83 22 90 04 00 	movzbl 0x49022(%ebx),%eax
  10342c:	83 e0 ef             	and    $0xffffffef,%eax
  10342f:	88 83 22 90 04 00    	mov    %al,0x49022(%ebx)
  103435:	0f b6 83 22 90 04 00 	movzbl 0x49022(%ebx),%eax
  10343c:	83 e0 df             	and    $0xffffffdf,%eax
  10343f:	88 83 22 90 04 00    	mov    %al,0x49022(%ebx)
  103445:	0f b6 83 22 90 04 00 	movzbl 0x49022(%ebx),%eax
  10344c:	83 c8 40             	or     $0x40,%eax
  10344f:	88 83 22 90 04 00    	mov    %al,0x49022(%ebx)
  103455:	0f b6 83 22 90 04 00 	movzbl 0x49022(%ebx),%eax
  10345c:	83 c8 80             	or     $0xffffff80,%eax
  10345f:	88 83 22 90 04 00    	mov    %al,0x49022(%ebx)
  103465:	c6 83 23 90 04 00 00 	movb   $0x0,0x49023(%ebx)
  10346c:	66 c7 83 24 90 04 00 	movw   $0xffff,0x49024(%ebx)
  103473:	ff ff 
  103475:	66 c7 83 26 90 04 00 	movw   $0x0,0x49026(%ebx)
  10347c:	00 00 
  10347e:	c6 83 28 90 04 00 00 	movb   $0x0,0x49028(%ebx)
  103485:	0f b6 83 29 90 04 00 	movzbl 0x49029(%ebx),%eax
  10348c:	83 e0 f0             	and    $0xfffffff0,%eax
  10348f:	83 c8 0a             	or     $0xa,%eax
  103492:	88 83 29 90 04 00    	mov    %al,0x49029(%ebx)
  103498:	0f b6 83 29 90 04 00 	movzbl 0x49029(%ebx),%eax
  10349f:	83 c8 10             	or     $0x10,%eax
  1034a2:	88 83 29 90 04 00    	mov    %al,0x49029(%ebx)
  1034a8:	0f b6 83 29 90 04 00 	movzbl 0x49029(%ebx),%eax
  1034af:	83 c8 60             	or     $0x60,%eax
  1034b2:	88 83 29 90 04 00    	mov    %al,0x49029(%ebx)
  1034b8:	0f b6 83 29 90 04 00 	movzbl 0x49029(%ebx),%eax
  1034bf:	83 c8 80             	or     $0xffffff80,%eax
  1034c2:	88 83 29 90 04 00    	mov    %al,0x49029(%ebx)
  1034c8:	0f b6 83 2a 90 04 00 	movzbl 0x4902a(%ebx),%eax
  1034cf:	83 c8 0f             	or     $0xf,%eax
  1034d2:	88 83 2a 90 04 00    	mov    %al,0x4902a(%ebx)
  1034d8:	0f b6 83 2a 90 04 00 	movzbl 0x4902a(%ebx),%eax
  1034df:	83 e0 ef             	and    $0xffffffef,%eax
  1034e2:	88 83 2a 90 04 00    	mov    %al,0x4902a(%ebx)
  1034e8:	0f b6 83 2a 90 04 00 	movzbl 0x4902a(%ebx),%eax
  1034ef:	83 e0 df             	and    $0xffffffdf,%eax
  1034f2:	88 83 2a 90 04 00    	mov    %al,0x4902a(%ebx)
  1034f8:	0f b6 83 2a 90 04 00 	movzbl 0x4902a(%ebx),%eax
  1034ff:	83 c8 40             	or     $0x40,%eax
  103502:	88 83 2a 90 04 00    	mov    %al,0x4902a(%ebx)
  103508:	0f b6 83 2a 90 04 00 	movzbl 0x4902a(%ebx),%eax
  10350f:	83 c8 80             	or     $0xffffff80,%eax
  103512:	88 83 2a 90 04 00    	mov    %al,0x4902a(%ebx)
  103518:	c6 83 2b 90 04 00 00 	movb   $0x0,0x4902b(%ebx)
  10351f:	66 c7 83 2c 90 04 00 	movw   $0xffff,0x4902c(%ebx)
  103526:	ff ff 
  103528:	66 c7 83 2e 90 04 00 	movw   $0x0,0x4902e(%ebx)
  10352f:	00 00 
  103531:	c6 83 30 90 04 00 00 	movb   $0x0,0x49030(%ebx)
  103538:	0f b6 83 31 90 04 00 	movzbl 0x49031(%ebx),%eax
  10353f:	83 e0 f0             	and    $0xfffffff0,%eax
  103542:	83 c8 02             	or     $0x2,%eax
  103545:	88 83 31 90 04 00    	mov    %al,0x49031(%ebx)
  10354b:	0f b6 83 31 90 04 00 	movzbl 0x49031(%ebx),%eax
  103552:	83 c8 10             	or     $0x10,%eax
  103555:	88 83 31 90 04 00    	mov    %al,0x49031(%ebx)
  10355b:	0f b6 83 31 90 04 00 	movzbl 0x49031(%ebx),%eax
  103562:	83 c8 60             	or     $0x60,%eax
  103565:	88 83 31 90 04 00    	mov    %al,0x49031(%ebx)
  10356b:	0f b6 83 31 90 04 00 	movzbl 0x49031(%ebx),%eax
  103572:	83 c8 80             	or     $0xffffff80,%eax
  103575:	88 83 31 90 04 00    	mov    %al,0x49031(%ebx)
  10357b:	0f b6 83 32 90 04 00 	movzbl 0x49032(%ebx),%eax
  103582:	83 c8 0f             	or     $0xf,%eax
  103585:	88 83 32 90 04 00    	mov    %al,0x49032(%ebx)
  10358b:	0f b6 83 32 90 04 00 	movzbl 0x49032(%ebx),%eax
  103592:	83 e0 ef             	and    $0xffffffef,%eax
  103595:	88 83 32 90 04 00    	mov    %al,0x49032(%ebx)
  10359b:	0f b6 83 32 90 04 00 	movzbl 0x49032(%ebx),%eax
  1035a2:	83 e0 df             	and    $0xffffffdf,%eax
  1035a5:	88 83 32 90 04 00    	mov    %al,0x49032(%ebx)
  1035ab:	0f b6 83 32 90 04 00 	movzbl 0x49032(%ebx),%eax
  1035b2:	83 c8 40             	or     $0x40,%eax
  1035b5:	88 83 32 90 04 00    	mov    %al,0x49032(%ebx)
  1035bb:	0f b6 83 32 90 04 00 	movzbl 0x49032(%ebx),%eax
  1035c2:	83 c8 80             	or     $0xffffff80,%eax
  1035c5:	88 83 32 90 04 00    	mov    %al,0x49032(%ebx)
  1035cb:	c6 83 33 90 04 00 00 	movb   $0x0,0x49033(%ebx)
  1035d2:	8d 83 0c 80 00 00    	lea    0x800c(%ebx),%eax
  1035d8:	05 00 10 00 00       	add    $0x1000,%eax
  1035dd:	89 83 50 cb 04 00    	mov    %eax,0x4cb50(%ebx)
  1035e3:	66 c7 83 54 cb 04 00 	movw   $0x10,0x4cb54(%ebx)
  1035ea:	10 00 
  1035ec:	66 c7 83 34 90 04 00 	movw   $0xeb,0x49034(%ebx)
  1035f3:	eb 00 
  1035f5:	8d 83 4c cb 04 00    	lea    0x4cb4c(%ebx),%eax
  1035fb:	66 89 83 36 90 04 00 	mov    %ax,0x49036(%ebx)
  103602:	8d 83 4c cb 04 00    	lea    0x4cb4c(%ebx),%eax
  103608:	c1 e8 10             	shr    $0x10,%eax
  10360b:	88 83 38 90 04 00    	mov    %al,0x49038(%ebx)
  103611:	0f b6 83 39 90 04 00 	movzbl 0x49039(%ebx),%eax
  103618:	83 e0 f0             	and    $0xfffffff0,%eax
  10361b:	83 c8 09             	or     $0x9,%eax
  10361e:	88 83 39 90 04 00    	mov    %al,0x49039(%ebx)
  103624:	0f b6 83 39 90 04 00 	movzbl 0x49039(%ebx),%eax
  10362b:	83 c8 10             	or     $0x10,%eax
  10362e:	88 83 39 90 04 00    	mov    %al,0x49039(%ebx)
  103634:	0f b6 83 39 90 04 00 	movzbl 0x49039(%ebx),%eax
  10363b:	83 e0 9f             	and    $0xffffff9f,%eax
  10363e:	88 83 39 90 04 00    	mov    %al,0x49039(%ebx)
  103644:	0f b6 83 39 90 04 00 	movzbl 0x49039(%ebx),%eax
  10364b:	83 c8 80             	or     $0xffffff80,%eax
  10364e:	88 83 39 90 04 00    	mov    %al,0x49039(%ebx)
  103654:	0f b6 83 3a 90 04 00 	movzbl 0x4903a(%ebx),%eax
  10365b:	83 e0 f0             	and    $0xfffffff0,%eax
  10365e:	88 83 3a 90 04 00    	mov    %al,0x4903a(%ebx)
  103664:	0f b6 83 3a 90 04 00 	movzbl 0x4903a(%ebx),%eax
  10366b:	83 e0 ef             	and    $0xffffffef,%eax
  10366e:	88 83 3a 90 04 00    	mov    %al,0x4903a(%ebx)
  103674:	0f b6 83 3a 90 04 00 	movzbl 0x4903a(%ebx),%eax
  10367b:	83 e0 df             	and    $0xffffffdf,%eax
  10367e:	88 83 3a 90 04 00    	mov    %al,0x4903a(%ebx)
  103684:	0f b6 83 3a 90 04 00 	movzbl 0x4903a(%ebx),%eax
  10368b:	83 c8 40             	or     $0x40,%eax
  10368e:	88 83 3a 90 04 00    	mov    %al,0x4903a(%ebx)
  103694:	0f b6 83 3a 90 04 00 	movzbl 0x4903a(%ebx),%eax
  10369b:	83 e0 7f             	and    $0x7f,%eax
  10369e:	88 83 3a 90 04 00    	mov    %al,0x4903a(%ebx)
  1036a4:	8d 83 4c cb 04 00    	lea    0x4cb4c(%ebx),%eax
  1036aa:	c1 e8 18             	shr    $0x18,%eax
  1036ad:	88 83 3b 90 04 00    	mov    %al,0x4903b(%ebx)
  1036b3:	0f b6 83 39 90 04 00 	movzbl 0x49039(%ebx),%eax
  1036ba:	83 e0 ef             	and    $0xffffffef,%eax
  1036bd:	88 83 39 90 04 00    	mov    %al,0x49039(%ebx)
  1036c3:	66 c7 45 ee 2f 00    	movw   $0x2f,-0x12(%ebp)
  1036c9:	8d 83 0c 90 04 00    	lea    0x4900c(%ebx),%eax
  1036cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1036d2:	0f 01 55 ee          	lgdtl  -0x12(%ebp)
  1036d6:	b8 10 00 00 00       	mov    $0x10,%eax
  1036db:	8e e8                	mov    %eax,%gs
  1036dd:	b8 10 00 00 00       	mov    $0x10,%eax
  1036e2:	8e e0                	mov    %eax,%fs
  1036e4:	b8 10 00 00 00       	mov    $0x10,%eax
  1036e9:	8e c0                	mov    %eax,%es
  1036eb:	b8 10 00 00 00       	mov    $0x10,%eax
  1036f0:	8e d8                	mov    %eax,%ds
  1036f2:	b8 10 00 00 00       	mov    $0x10,%eax
  1036f7:	8e d0                	mov    %eax,%ss
  1036f9:	ea 00 37 10 00 08 00 	ljmp   $0x8,$0x103700
  103700:	83 ec 0c             	sub    $0xc,%esp
  103703:	6a 00                	push   $0x0
  103705:	e8 70 01 00 00       	call   10387a <lldt>
  10370a:	83 c4 10             	add    $0x10,%esp
  10370d:	83 ec 0c             	sub    $0xc,%esp
  103710:	6a 28                	push   $0x28
  103712:	e8 2f 03 00 00       	call   103a46 <ltr>
  103717:	83 c4 10             	add    $0x10,%esp
  10371a:	83 ec 08             	sub    $0x8,%esp
  10371d:	68 00 3b 00 00       	push   $0x3b00
  103722:	8d 83 4c 90 04 00    	lea    0x4904c(%ebx),%eax
  103728:	50                   	push   %eax
  103729:	e8 4b f3 ff ff       	call   102a79 <memzero>
  10372e:	83 c4 10             	add    $0x10,%esp
  103731:	83 ec 08             	sub    $0x8,%esp
  103734:	68 00 00 04 00       	push   $0x40000
  103739:	8d 83 0c 90 00 00    	lea    0x900c(%ebx),%eax
  10373f:	50                   	push   %eax
  103740:	e8 34 f3 ff ff       	call   102a79 <memzero>
  103745:	83 c4 10             	add    $0x10,%esp
  103748:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10374f:	e9 9d 00 00 00       	jmp    1037f1 <seg_init+0x55d>
  103754:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103757:	c1 e0 0c             	shl    $0xc,%eax
  10375a:	89 c2                	mov    %eax,%edx
  10375c:	8d 83 0c 90 00 00    	lea    0x900c(%ebx),%eax
  103762:	01 d0                	add    %edx,%eax
  103764:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
  10376a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  10376d:	8d 83 50 90 04 00    	lea    0x49050(%ebx),%eax
  103773:	69 c9 ec 00 00 00    	imul   $0xec,%ecx,%ecx
  103779:	01 c8                	add    %ecx,%eax
  10377b:	89 10                	mov    %edx,(%eax)
  10377d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103780:	8d 83 54 90 04 00    	lea    0x49054(%ebx),%eax
  103786:	69 d2 ec 00 00 00    	imul   $0xec,%edx,%edx
  10378c:	01 d0                	add    %edx,%eax
  10378e:	66 c7 00 10 00       	movw   $0x10,(%eax)
  103793:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103796:	8d 83 52 90 04 00    	lea    0x49052(%ebx),%eax
  10379c:	69 d2 ec 00 00 00    	imul   $0xec,%edx,%edx
  1037a2:	01 d0                	add    %edx,%eax
  1037a4:	83 c0 60             	add    $0x60,%eax
  1037a7:	66 c7 00 68 00       	movw   $0x68,(%eax)
  1037ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1037af:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  1037b5:	8d 50 60             	lea    0x60(%eax),%edx
  1037b8:	8d 83 4c 90 04 00    	lea    0x4904c(%ebx),%eax
  1037be:	01 d0                	add    %edx,%eax
  1037c0:	83 c0 08             	add    $0x8,%eax
  1037c3:	83 ec 08             	sub    $0x8,%esp
  1037c6:	68 80 00 00 00       	push   $0x80
  1037cb:	50                   	push   %eax
  1037cc:	e8 a8 f2 ff ff       	call   102a79 <memzero>
  1037d1:	83 c4 10             	add    $0x10,%esp
  1037d4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1037d7:	8d 83 54 90 04 00    	lea    0x49054(%ebx),%eax
  1037dd:	69 d2 ec 00 00 00    	imul   $0xec,%edx,%edx
  1037e3:	01 d0                	add    %edx,%eax
  1037e5:	05 e0 00 00 00       	add    $0xe0,%eax
  1037ea:	c6 00 ff             	movb   $0xff,(%eax)
  1037ed:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1037f1:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
  1037f5:	0f 86 59 ff ff ff    	jbe    103754 <seg_init+0x4c0>
  1037fb:	90                   	nop
  1037fc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1037ff:	c9                   	leave
  103800:	c3                   	ret

00103801 <max>:
  103801:	55                   	push   %ebp
  103802:	89 e5                	mov    %esp,%ebp
  103804:	e8 af cb ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103809:	05 eb c7 00 00       	add    $0xc7eb,%eax
  10380e:	8b 55 0c             	mov    0xc(%ebp),%edx
  103811:	8b 45 08             	mov    0x8(%ebp),%eax
  103814:	39 c2                	cmp    %eax,%edx
  103816:	0f 43 c2             	cmovae %edx,%eax
  103819:	5d                   	pop    %ebp
  10381a:	c3                   	ret

0010381b <min>:
  10381b:	55                   	push   %ebp
  10381c:	89 e5                	mov    %esp,%ebp
  10381e:	e8 95 cb ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103823:	05 d1 c7 00 00       	add    $0xc7d1,%eax
  103828:	8b 55 0c             	mov    0xc(%ebp),%edx
  10382b:	8b 45 08             	mov    0x8(%ebp),%eax
  10382e:	39 c2                	cmp    %eax,%edx
  103830:	0f 46 c2             	cmovbe %edx,%eax
  103833:	5d                   	pop    %ebp
  103834:	c3                   	ret

00103835 <rounddown>:
  103835:	55                   	push   %ebp
  103836:	89 e5                	mov    %esp,%ebp
  103838:	e8 7b cb ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  10383d:	05 b7 c7 00 00       	add    $0xc7b7,%eax
  103842:	8b 45 08             	mov    0x8(%ebp),%eax
  103845:	ba 00 00 00 00       	mov    $0x0,%edx
  10384a:	f7 75 0c             	divl   0xc(%ebp)
  10384d:	8b 45 08             	mov    0x8(%ebp),%eax
  103850:	29 d0                	sub    %edx,%eax
  103852:	5d                   	pop    %ebp
  103853:	c3                   	ret

00103854 <roundup>:
  103854:	55                   	push   %ebp
  103855:	89 e5                	mov    %esp,%ebp
  103857:	e8 5c cb ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  10385c:	05 98 c7 00 00       	add    $0xc798,%eax
  103861:	8b 55 08             	mov    0x8(%ebp),%edx
  103864:	8b 45 0c             	mov    0xc(%ebp),%eax
  103867:	01 d0                	add    %edx,%eax
  103869:	83 e8 01             	sub    $0x1,%eax
  10386c:	ff 75 0c             	push   0xc(%ebp)
  10386f:	50                   	push   %eax
  103870:	e8 c0 ff ff ff       	call   103835 <rounddown>
  103875:	83 c4 08             	add    $0x8,%esp
  103878:	c9                   	leave
  103879:	c3                   	ret

0010387a <lldt>:
  10387a:	55                   	push   %ebp
  10387b:	89 e5                	mov    %esp,%ebp
  10387d:	83 ec 04             	sub    $0x4,%esp
  103880:	e8 33 cb ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103885:	05 6f c7 00 00       	add    $0xc76f,%eax
  10388a:	8b 45 08             	mov    0x8(%ebp),%eax
  10388d:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  103891:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  103895:	0f 00 d0             	lldt   %eax
  103898:	90                   	nop
  103899:	c9                   	leave
  10389a:	c3                   	ret

0010389b <cli>:
  10389b:	55                   	push   %ebp
  10389c:	89 e5                	mov    %esp,%ebp
  10389e:	e8 15 cb ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  1038a3:	05 51 c7 00 00       	add    $0xc751,%eax
  1038a8:	fa                   	cli
  1038a9:	90                   	nop
  1038aa:	5d                   	pop    %ebp
  1038ab:	c3                   	ret

001038ac <sti>:
  1038ac:	55                   	push   %ebp
  1038ad:	89 e5                	mov    %esp,%ebp
  1038af:	e8 04 cb ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  1038b4:	05 40 c7 00 00       	add    $0xc740,%eax
  1038b9:	fb                   	sti
  1038ba:	90                   	nop
  1038bb:	90                   	nop
  1038bc:	5d                   	pop    %ebp
  1038bd:	c3                   	ret

001038be <rdmsr>:
  1038be:	55                   	push   %ebp
  1038bf:	89 e5                	mov    %esp,%ebp
  1038c1:	83 ec 10             	sub    $0x10,%esp
  1038c4:	e8 ef ca ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  1038c9:	05 2b c7 00 00       	add    $0xc72b,%eax
  1038ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1038d1:	89 c1                	mov    %eax,%ecx
  1038d3:	0f 32                	rdmsr
  1038d5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1038d8:	89 55 fc             	mov    %edx,-0x4(%ebp)
  1038db:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1038de:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1038e1:	c9                   	leave
  1038e2:	c3                   	ret

001038e3 <wrmsr>:
  1038e3:	55                   	push   %ebp
  1038e4:	89 e5                	mov    %esp,%ebp
  1038e6:	83 ec 08             	sub    $0x8,%esp
  1038e9:	e8 ca ca ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  1038ee:	05 06 c7 00 00       	add    $0xc706,%eax
  1038f3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1038f6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1038f9:	8b 45 10             	mov    0x10(%ebp),%eax
  1038fc:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1038ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103902:	8b 55 fc             	mov    -0x4(%ebp),%edx
  103905:	8b 4d 08             	mov    0x8(%ebp),%ecx
  103908:	0f 30                	wrmsr
  10390a:	90                   	nop
  10390b:	c9                   	leave
  10390c:	c3                   	ret

0010390d <halt>:
  10390d:	55                   	push   %ebp
  10390e:	89 e5                	mov    %esp,%ebp
  103910:	e8 a3 ca ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103915:	05 df c6 00 00       	add    $0xc6df,%eax
  10391a:	f4                   	hlt
  10391b:	90                   	nop
  10391c:	5d                   	pop    %ebp
  10391d:	c3                   	ret

0010391e <rdtsc>:
  10391e:	55                   	push   %ebp
  10391f:	89 e5                	mov    %esp,%ebp
  103921:	83 ec 10             	sub    $0x10,%esp
  103924:	e8 8f ca ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103929:	05 cb c6 00 00       	add    $0xc6cb,%eax
  10392e:	0f 31                	rdtsc
  103930:	89 45 f8             	mov    %eax,-0x8(%ebp)
  103933:	89 55 fc             	mov    %edx,-0x4(%ebp)
  103936:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103939:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10393c:	c9                   	leave
  10393d:	c3                   	ret

0010393e <enable_sse>:
  10393e:	55                   	push   %ebp
  10393f:	89 e5                	mov    %esp,%ebp
  103941:	83 ec 20             	sub    $0x20,%esp
  103944:	e8 6f ca ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103949:	05 ab c6 00 00       	add    $0xc6ab,%eax
  10394e:	0f 20 e0             	mov    %cr4,%eax
  103951:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103954:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103957:	80 cc 06             	or     $0x6,%ah
  10395a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10395d:	0f ae f0             	mfence
  103960:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103963:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103966:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103969:	0f 22 e0             	mov    %eax,%cr4
  10396c:	90                   	nop
  10396d:	0f 20 c0             	mov    %cr0,%eax
  103970:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103973:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103976:	83 c8 02             	or     $0x2,%eax
  103979:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10397c:	0f ae f0             	mfence
  10397f:	83 65 f8 f3          	andl   $0xfffffff3,-0x8(%ebp)
  103983:	90                   	nop
  103984:	c9                   	leave
  103985:	c3                   	ret

00103986 <cpuid>:
  103986:	55                   	push   %ebp
  103987:	89 e5                	mov    %esp,%ebp
  103989:	53                   	push   %ebx
  10398a:	83 ec 10             	sub    $0x10,%esp
  10398d:	e8 26 ca ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103992:	05 62 c6 00 00       	add    $0xc662,%eax
  103997:	8b 45 08             	mov    0x8(%ebp),%eax
  10399a:	0f a2                	cpuid
  10399c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10399f:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  1039a2:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  1039a5:	89 55 ec             	mov    %edx,-0x14(%ebp)
  1039a8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1039ac:	74 08                	je     1039b6 <cpuid+0x30>
  1039ae:	8b 45 0c             	mov    0xc(%ebp),%eax
  1039b1:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1039b4:	89 10                	mov    %edx,(%eax)
  1039b6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1039ba:	74 08                	je     1039c4 <cpuid+0x3e>
  1039bc:	8b 45 10             	mov    0x10(%ebp),%eax
  1039bf:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1039c2:	89 10                	mov    %edx,(%eax)
  1039c4:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  1039c8:	74 08                	je     1039d2 <cpuid+0x4c>
  1039ca:	8b 45 14             	mov    0x14(%ebp),%eax
  1039cd:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1039d0:	89 10                	mov    %edx,(%eax)
  1039d2:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
  1039d6:	74 08                	je     1039e0 <cpuid+0x5a>
  1039d8:	8b 45 18             	mov    0x18(%ebp),%eax
  1039db:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1039de:	89 10                	mov    %edx,(%eax)
  1039e0:	90                   	nop
  1039e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1039e4:	c9                   	leave
  1039e5:	c3                   	ret

001039e6 <rcr3>:
  1039e6:	55                   	push   %ebp
  1039e7:	89 e5                	mov    %esp,%ebp
  1039e9:	83 ec 10             	sub    $0x10,%esp
  1039ec:	e8 c7 c9 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  1039f1:	05 03 c6 00 00       	add    $0xc603,%eax
  1039f6:	0f 20 d8             	mov    %cr3,%eax
  1039f9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1039fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1039ff:	c9                   	leave
  103a00:	c3                   	ret

00103a01 <outl>:
  103a01:	55                   	push   %ebp
  103a02:	89 e5                	mov    %esp,%ebp
  103a04:	e8 af c9 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103a09:	05 eb c5 00 00       	add    $0xc5eb,%eax
  103a0e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103a11:	8b 55 08             	mov    0x8(%ebp),%edx
  103a14:	ef                   	out    %eax,(%dx)
  103a15:	90                   	nop
  103a16:	5d                   	pop    %ebp
  103a17:	c3                   	ret

00103a18 <inl>:
  103a18:	55                   	push   %ebp
  103a19:	89 e5                	mov    %esp,%ebp
  103a1b:	83 ec 10             	sub    $0x10,%esp
  103a1e:	e8 95 c9 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103a23:	05 d1 c5 00 00       	add    $0xc5d1,%eax
  103a28:	8b 45 08             	mov    0x8(%ebp),%eax
  103a2b:	89 c2                	mov    %eax,%edx
  103a2d:	ed                   	in     (%dx),%eax
  103a2e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  103a31:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103a34:	c9                   	leave
  103a35:	c3                   	ret

00103a36 <smp_wmb>:
  103a36:	55                   	push   %ebp
  103a37:	89 e5                	mov    %esp,%ebp
  103a39:	e8 7a c9 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103a3e:	05 b6 c5 00 00       	add    $0xc5b6,%eax
  103a43:	90                   	nop
  103a44:	5d                   	pop    %ebp
  103a45:	c3                   	ret

00103a46 <ltr>:
  103a46:	55                   	push   %ebp
  103a47:	89 e5                	mov    %esp,%ebp
  103a49:	83 ec 04             	sub    $0x4,%esp
  103a4c:	e8 67 c9 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103a51:	05 a3 c5 00 00       	add    $0xc5a3,%eax
  103a56:	8b 45 08             	mov    0x8(%ebp),%eax
  103a59:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  103a5d:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  103a61:	0f 00 d8             	ltr    %eax
  103a64:	90                   	nop
  103a65:	c9                   	leave
  103a66:	c3                   	ret

00103a67 <lcr0>:
  103a67:	55                   	push   %ebp
  103a68:	89 e5                	mov    %esp,%ebp
  103a6a:	e8 49 c9 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103a6f:	05 85 c5 00 00       	add    $0xc585,%eax
  103a74:	8b 45 08             	mov    0x8(%ebp),%eax
  103a77:	0f 22 c0             	mov    %eax,%cr0
  103a7a:	90                   	nop
  103a7b:	5d                   	pop    %ebp
  103a7c:	c3                   	ret

00103a7d <rcr0>:
  103a7d:	55                   	push   %ebp
  103a7e:	89 e5                	mov    %esp,%ebp
  103a80:	83 ec 10             	sub    $0x10,%esp
  103a83:	e8 30 c9 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103a88:	05 6c c5 00 00       	add    $0xc56c,%eax
  103a8d:	0f 20 c0             	mov    %cr0,%eax
  103a90:	89 45 fc             	mov    %eax,-0x4(%ebp)
  103a93:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103a96:	c9                   	leave
  103a97:	c3                   	ret

00103a98 <rcr2>:
  103a98:	55                   	push   %ebp
  103a99:	89 e5                	mov    %esp,%ebp
  103a9b:	83 ec 10             	sub    $0x10,%esp
  103a9e:	e8 15 c9 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103aa3:	05 51 c5 00 00       	add    $0xc551,%eax
  103aa8:	0f 20 d0             	mov    %cr2,%eax
  103aab:	89 45 fc             	mov    %eax,-0x4(%ebp)
  103aae:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103ab1:	c9                   	leave
  103ab2:	c3                   	ret

00103ab3 <lcr3>:
  103ab3:	55                   	push   %ebp
  103ab4:	89 e5                	mov    %esp,%ebp
  103ab6:	e8 fd c8 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103abb:	05 39 c5 00 00       	add    $0xc539,%eax
  103ac0:	8b 45 08             	mov    0x8(%ebp),%eax
  103ac3:	0f 22 d8             	mov    %eax,%cr3
  103ac6:	90                   	nop
  103ac7:	5d                   	pop    %ebp
  103ac8:	c3                   	ret

00103ac9 <lcr4>:
  103ac9:	55                   	push   %ebp
  103aca:	89 e5                	mov    %esp,%ebp
  103acc:	e8 e7 c8 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103ad1:	05 23 c5 00 00       	add    $0xc523,%eax
  103ad6:	8b 45 08             	mov    0x8(%ebp),%eax
  103ad9:	0f 22 e0             	mov    %eax,%cr4
  103adc:	90                   	nop
  103add:	5d                   	pop    %ebp
  103ade:	c3                   	ret

00103adf <rcr4>:
  103adf:	55                   	push   %ebp
  103ae0:	89 e5                	mov    %esp,%ebp
  103ae2:	83 ec 10             	sub    $0x10,%esp
  103ae5:	e8 ce c8 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103aea:	05 0a c5 00 00       	add    $0xc50a,%eax
  103aef:	0f 20 e0             	mov    %cr4,%eax
  103af2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  103af5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103af8:	c9                   	leave
  103af9:	c3                   	ret

00103afa <inb>:
  103afa:	55                   	push   %ebp
  103afb:	89 e5                	mov    %esp,%ebp
  103afd:	83 ec 10             	sub    $0x10,%esp
  103b00:	e8 b3 c8 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103b05:	05 ef c4 00 00       	add    $0xc4ef,%eax
  103b0a:	8b 45 08             	mov    0x8(%ebp),%eax
  103b0d:	89 c2                	mov    %eax,%edx
  103b0f:	ec                   	in     (%dx),%al
  103b10:	88 45 ff             	mov    %al,-0x1(%ebp)
  103b13:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  103b17:	c9                   	leave
  103b18:	c3                   	ret

00103b19 <insl>:
  103b19:	55                   	push   %ebp
  103b1a:	89 e5                	mov    %esp,%ebp
  103b1c:	57                   	push   %edi
  103b1d:	53                   	push   %ebx
  103b1e:	e8 95 c8 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103b23:	05 d1 c4 00 00       	add    $0xc4d1,%eax
  103b28:	8b 55 08             	mov    0x8(%ebp),%edx
  103b2b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  103b2e:	8b 45 10             	mov    0x10(%ebp),%eax
  103b31:	89 cb                	mov    %ecx,%ebx
  103b33:	89 df                	mov    %ebx,%edi
  103b35:	89 c1                	mov    %eax,%ecx
  103b37:	fc                   	cld
  103b38:	f2 6d                	repnz insl (%dx),%es:(%edi)
  103b3a:	89 c8                	mov    %ecx,%eax
  103b3c:	89 fb                	mov    %edi,%ebx
  103b3e:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  103b41:	89 45 10             	mov    %eax,0x10(%ebp)
  103b44:	90                   	nop
  103b45:	5b                   	pop    %ebx
  103b46:	5f                   	pop    %edi
  103b47:	5d                   	pop    %ebp
  103b48:	c3                   	ret

00103b49 <outb>:
  103b49:	55                   	push   %ebp
  103b4a:	89 e5                	mov    %esp,%ebp
  103b4c:	83 ec 04             	sub    $0x4,%esp
  103b4f:	e8 64 c8 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103b54:	05 a0 c4 00 00       	add    $0xc4a0,%eax
  103b59:	8b 45 0c             	mov    0xc(%ebp),%eax
  103b5c:	88 45 fc             	mov    %al,-0x4(%ebp)
  103b5f:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  103b63:	8b 55 08             	mov    0x8(%ebp),%edx
  103b66:	ee                   	out    %al,(%dx)
  103b67:	90                   	nop
  103b68:	c9                   	leave
  103b69:	c3                   	ret

00103b6a <outsw>:
  103b6a:	55                   	push   %ebp
  103b6b:	89 e5                	mov    %esp,%ebp
  103b6d:	56                   	push   %esi
  103b6e:	53                   	push   %ebx
  103b6f:	e8 44 c8 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103b74:	05 80 c4 00 00       	add    $0xc480,%eax
  103b79:	8b 55 08             	mov    0x8(%ebp),%edx
  103b7c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  103b7f:	8b 45 10             	mov    0x10(%ebp),%eax
  103b82:	89 cb                	mov    %ecx,%ebx
  103b84:	89 de                	mov    %ebx,%esi
  103b86:	89 c1                	mov    %eax,%ecx
  103b88:	fc                   	cld
  103b89:	f2 66 6f             	repnz outsw %ds:(%esi),(%dx)
  103b8c:	89 c8                	mov    %ecx,%eax
  103b8e:	89 f3                	mov    %esi,%ebx
  103b90:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  103b93:	89 45 10             	mov    %eax,0x10(%ebp)
  103b96:	90                   	nop
  103b97:	5b                   	pop    %ebx
  103b98:	5e                   	pop    %esi
  103b99:	5d                   	pop    %ebp
  103b9a:	c3                   	ret

00103b9b <mon_help>:
  103b9b:	55                   	push   %ebp
  103b9c:	89 e5                	mov    %esp,%ebp
  103b9e:	56                   	push   %esi
  103b9f:	53                   	push   %ebx
  103ba0:	83 ec 10             	sub    $0x10,%esp
  103ba3:	e8 18 c8 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  103ba8:	81 c3 4c c4 00 00    	add    $0xc44c,%ebx
  103bae:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103bb5:	eb 44                	jmp    103bfb <mon_help+0x60>
  103bb7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103bba:	8d 8b 30 05 00 00    	lea    0x530(%ebx),%ecx
  103bc0:	89 d0                	mov    %edx,%eax
  103bc2:	01 c0                	add    %eax,%eax
  103bc4:	01 d0                	add    %edx,%eax
  103bc6:	c1 e0 02             	shl    $0x2,%eax
  103bc9:	01 c8                	add    %ecx,%eax
  103bcb:	8b 08                	mov    (%eax),%ecx
  103bcd:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103bd0:	8d b3 2c 05 00 00    	lea    0x52c(%ebx),%esi
  103bd6:	89 d0                	mov    %edx,%eax
  103bd8:	01 c0                	add    %eax,%eax
  103bda:	01 d0                	add    %edx,%eax
  103bdc:	c1 e0 02             	shl    $0x2,%eax
  103bdf:	01 f0                	add    %esi,%eax
  103be1:	8b 00                	mov    (%eax),%eax
  103be3:	83 ec 04             	sub    $0x4,%esp
  103be6:	51                   	push   %ecx
  103be7:	50                   	push   %eax
  103be8:	8d 83 4c 93 ff ff    	lea    -0x6cb4(%ebx),%eax
  103bee:	50                   	push   %eax
  103bef:	e8 a8 f1 ff ff       	call   102d9c <dprintf>
  103bf4:	83 c4 10             	add    $0x10,%esp
  103bf7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103bfb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103bfe:	83 f8 02             	cmp    $0x2,%eax
  103c01:	76 b4                	jbe    103bb7 <mon_help+0x1c>
  103c03:	b8 00 00 00 00       	mov    $0x0,%eax
  103c08:	8d 65 f8             	lea    -0x8(%ebp),%esp
  103c0b:	5b                   	pop    %ebx
  103c0c:	5e                   	pop    %esi
  103c0d:	5d                   	pop    %ebp
  103c0e:	c3                   	ret

00103c0f <mon_kerninfo>:
  103c0f:	55                   	push   %ebp
  103c10:	89 e5                	mov    %esp,%ebp
  103c12:	53                   	push   %ebx
  103c13:	83 ec 14             	sub    $0x14,%esp
  103c16:	e8 a5 c7 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  103c1b:	81 c3 d9 c3 00 00    	add    $0xc3d9,%ebx
  103c21:	83 ec 0c             	sub    $0xc,%esp
  103c24:	8d 83 55 93 ff ff    	lea    -0x6cab(%ebx),%eax
  103c2a:	50                   	push   %eax
  103c2b:	e8 6c f1 ff ff       	call   102d9c <dprintf>
  103c30:	83 c4 10             	add    $0x10,%esp
  103c33:	83 ec 08             	sub    $0x8,%esp
  103c36:	c7 c0 94 4d 10 00    	mov    $0x104d94,%eax
  103c3c:	50                   	push   %eax
  103c3d:	8d 83 6e 93 ff ff    	lea    -0x6c92(%ebx),%eax
  103c43:	50                   	push   %eax
  103c44:	e8 53 f1 ff ff       	call   102d9c <dprintf>
  103c49:	83 c4 10             	add    $0x10,%esp
  103c4c:	83 ec 08             	sub    $0x8,%esp
  103c4f:	c7 c0 86 8d 10 00    	mov    $0x108d86,%eax
  103c55:	50                   	push   %eax
  103c56:	8d 83 7d 93 ff ff    	lea    -0x6c83(%ebx),%eax
  103c5c:	50                   	push   %eax
  103c5d:	e8 3a f1 ff ff       	call   102d9c <dprintf>
  103c62:	83 c4 10             	add    $0x10,%esp
  103c65:	83 ec 08             	sub    $0x8,%esp
  103c68:	c7 c0 f4 58 11 00    	mov    $0x1158f4,%eax
  103c6e:	50                   	push   %eax
  103c6f:	8d 83 8c 93 ff ff    	lea    -0x6c74(%ebx),%eax
  103c75:	50                   	push   %eax
  103c76:	e8 21 f1 ff ff       	call   102d9c <dprintf>
  103c7b:	83 c4 10             	add    $0x10,%esp
  103c7e:	83 ec 08             	sub    $0x8,%esp
  103c81:	c7 c0 00 e1 d9 01    	mov    $0x1d9e100,%eax
  103c87:	50                   	push   %eax
  103c88:	8d 83 9b 93 ff ff    	lea    -0x6c65(%ebx),%eax
  103c8e:	50                   	push   %eax
  103c8f:	e8 08 f1 ff ff       	call   102d9c <dprintf>
  103c94:	83 c4 10             	add    $0x10,%esp
  103c97:	c7 c0 00 e1 d9 01    	mov    $0x1d9e100,%eax
  103c9d:	89 c1                	mov    %eax,%ecx
  103c9f:	c7 c0 94 4d 10 00    	mov    $0x104d94,%eax
  103ca5:	89 c2                	mov    %eax,%edx
  103ca7:	89 c8                	mov    %ecx,%eax
  103ca9:	29 d0                	sub    %edx,%eax
  103cab:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103cae:	c7 45 f0 00 04 00 00 	movl   $0x400,-0x10(%ebp)
  103cb5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103cb8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103cbb:	01 d0                	add    %edx,%eax
  103cbd:	83 e8 01             	sub    $0x1,%eax
  103cc0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103cc3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103cc6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103cc9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103ccc:	99                   	cltd
  103ccd:	f7 7d e8             	idivl  -0x18(%ebp)
  103cd0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103cd3:	29 d0                	sub    %edx,%eax
  103cd5:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  103cdb:	85 c0                	test   %eax,%eax
  103cdd:	0f 48 c2             	cmovs  %edx,%eax
  103ce0:	c1 f8 0a             	sar    $0xa,%eax
  103ce3:	83 ec 08             	sub    $0x8,%esp
  103ce6:	50                   	push   %eax
  103ce7:	8d 83 ac 93 ff ff    	lea    -0x6c54(%ebx),%eax
  103ced:	50                   	push   %eax
  103cee:	e8 a9 f0 ff ff       	call   102d9c <dprintf>
  103cf3:	83 c4 10             	add    $0x10,%esp
  103cf6:	b8 00 00 00 00       	mov    $0x0,%eax
  103cfb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103cfe:	c9                   	leave
  103cff:	c3                   	ret

00103d00 <mon_backtrace>:
  103d00:	55                   	push   %ebp
  103d01:	89 e5                	mov    %esp,%ebp
  103d03:	e8 b0 c6 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  103d08:	05 ec c2 00 00       	add    $0xc2ec,%eax
  103d0d:	b8 00 00 00 00       	mov    $0x0,%eax
  103d12:	5d                   	pop    %ebp
  103d13:	c3                   	ret

00103d14 <mon_start_user>:
  103d14:	55                   	push   %ebp
  103d15:	89 e5                	mov    %esp,%ebp
  103d17:	53                   	push   %ebx
  103d18:	83 ec 14             	sub    $0x14,%esp
  103d1b:	e8 a0 c6 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  103d20:	81 c3 d4 c2 00 00    	add    $0xc2d4,%ebx
  103d26:	8b 83 38 cc 04 00    	mov    0x4cc38(%ebx),%eax
  103d2c:	85 c0                	test   %eax,%eax
  103d2e:	74 1c                	je     103d4c <mon_start_user+0x38>
  103d30:	83 ec 0c             	sub    $0xc,%esp
  103d33:	8d 83 d8 93 ff ff    	lea    -0x6c28(%ebx),%eax
  103d39:	50                   	push   %eax
  103d3a:	e8 5d f0 ff ff       	call   102d9c <dprintf>
  103d3f:	83 c4 10             	add    $0x10,%esp
  103d42:	b8 00 00 00 00       	mov    $0x0,%eax
  103d47:	e9 81 00 00 00       	jmp    103dcd <mon_start_user+0xb9>
  103d4c:	c7 c0 00 20 11 00    	mov    $0x112000,%eax
  103d52:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103d55:	83 ec 0c             	sub    $0xc,%esp
  103d58:	6a 00                	push   $0x0
  103d5a:	e8 e1 26 00 00       	call   106440 <container_get_quota>
  103d5f:	83 c4 10             	add    $0x10,%esp
  103d62:	83 ec 08             	sub    $0x8,%esp
  103d65:	50                   	push   %eax
  103d66:	6a 00                	push   $0x0
  103d68:	e8 e3 48 00 00       	call   108650 <alloc_mem_quota>
  103d6d:	83 c4 10             	add    $0x10,%esp
  103d70:	89 83 38 cc 04 00    	mov    %eax,0x4cc38(%ebx)
  103d76:	8b 83 38 cc 04 00    	mov    0x4cc38(%ebx),%eax
  103d7c:	83 ec 08             	sub    $0x8,%esp
  103d7f:	50                   	push   %eax
  103d80:	ff 75 f4             	push   -0xc(%ebp)
  103d83:	e8 48 05 00 00       	call   1042d0 <elf_load>
  103d88:	83 c4 10             	add    $0x10,%esp
  103d8b:	83 ec 08             	sub    $0x8,%esp
  103d8e:	ff 75 f4             	push   -0xc(%ebp)
  103d91:	8d 83 34 94 ff ff    	lea    -0x6bcc(%ebx),%eax
  103d97:	50                   	push   %eax
  103d98:	e8 ff ef ff ff       	call   102d9c <dprintf>
  103d9d:	83 c4 10             	add    $0x10,%esp
  103da0:	8b 83 38 cc 04 00    	mov    0x4cc38(%ebx),%eax
  103da6:	83 ec 0c             	sub    $0xc,%esp
  103da9:	50                   	push   %eax
  103daa:	e8 c1 2f 00 00       	call   106d70 <set_pdir_base>
  103daf:	83 c4 10             	add    $0x10,%esp
  103db2:	83 ec 0c             	sub    $0xc,%esp
  103db5:	ff 75 f4             	push   -0xc(%ebp)
  103db8:	e8 d3 07 00 00       	call   104590 <elf_entry>
  103dbd:	83 c4 10             	add    $0x10,%esp
  103dc0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103dc3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103dc6:	ff d0                	call   *%eax
  103dc8:	b8 00 00 00 00       	mov    $0x0,%eax
  103dcd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103dd0:	c9                   	leave
  103dd1:	c3                   	ret

00103dd2 <runcmd>:
  103dd2:	55                   	push   %ebp
  103dd3:	89 e5                	mov    %esp,%ebp
  103dd5:	53                   	push   %ebx
  103dd6:	83 ec 54             	sub    $0x54,%esp
  103dd9:	e8 e2 c5 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  103dde:	81 c3 16 c2 00 00    	add    $0xc216,%ebx
  103de4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103deb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103dee:	c7 44 85 b0 00 00 00 	movl   $0x0,-0x50(%ebp,%eax,4)
  103df5:	00 
  103df6:	eb 0c                	jmp    103e04 <runcmd+0x32>
  103df8:	8b 45 08             	mov    0x8(%ebp),%eax
  103dfb:	8d 50 01             	lea    0x1(%eax),%edx
  103dfe:	89 55 08             	mov    %edx,0x8(%ebp)
  103e01:	c6 00 00             	movb   $0x0,(%eax)
  103e04:	8b 45 08             	mov    0x8(%ebp),%eax
  103e07:	0f b6 00             	movzbl (%eax),%eax
  103e0a:	84 c0                	test   %al,%al
  103e0c:	74 20                	je     103e2e <runcmd+0x5c>
  103e0e:	8b 45 08             	mov    0x8(%ebp),%eax
  103e11:	0f b6 00             	movzbl (%eax),%eax
  103e14:	0f be c0             	movsbl %al,%eax
  103e17:	83 ec 08             	sub    $0x8,%esp
  103e1a:	50                   	push   %eax
  103e1b:	8d 83 4f 94 ff ff    	lea    -0x6bb1(%ebx),%eax
  103e21:	50                   	push   %eax
  103e22:	e8 15 ec ff ff       	call   102a3c <strchr>
  103e27:	83 c4 10             	add    $0x10,%esp
  103e2a:	85 c0                	test   %eax,%eax
  103e2c:	75 ca                	jne    103df8 <runcmd+0x26>
  103e2e:	8b 45 08             	mov    0x8(%ebp),%eax
  103e31:	0f b6 00             	movzbl (%eax),%eax
  103e34:	84 c0                	test   %al,%al
  103e36:	74 69                	je     103ea1 <runcmd+0xcf>
  103e38:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  103e3c:	75 1e                	jne    103e5c <runcmd+0x8a>
  103e3e:	83 ec 08             	sub    $0x8,%esp
  103e41:	6a 10                	push   $0x10
  103e43:	8d 83 54 94 ff ff    	lea    -0x6bac(%ebx),%eax
  103e49:	50                   	push   %eax
  103e4a:	e8 4d ef ff ff       	call   102d9c <dprintf>
  103e4f:	83 c4 10             	add    $0x10,%esp
  103e52:	b8 00 00 00 00       	mov    $0x0,%eax
  103e57:	e9 e5 00 00 00       	jmp    103f41 <runcmd+0x16f>
  103e5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103e5f:	8d 50 01             	lea    0x1(%eax),%edx
  103e62:	89 55 f4             	mov    %edx,-0xc(%ebp)
  103e65:	8b 55 08             	mov    0x8(%ebp),%edx
  103e68:	89 54 85 b0          	mov    %edx,-0x50(%ebp,%eax,4)
  103e6c:	eb 04                	jmp    103e72 <runcmd+0xa0>
  103e6e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103e72:	8b 45 08             	mov    0x8(%ebp),%eax
  103e75:	0f b6 00             	movzbl (%eax),%eax
  103e78:	84 c0                	test   %al,%al
  103e7a:	74 88                	je     103e04 <runcmd+0x32>
  103e7c:	8b 45 08             	mov    0x8(%ebp),%eax
  103e7f:	0f b6 00             	movzbl (%eax),%eax
  103e82:	0f be c0             	movsbl %al,%eax
  103e85:	83 ec 08             	sub    $0x8,%esp
  103e88:	50                   	push   %eax
  103e89:	8d 83 4f 94 ff ff    	lea    -0x6bb1(%ebx),%eax
  103e8f:	50                   	push   %eax
  103e90:	e8 a7 eb ff ff       	call   102a3c <strchr>
  103e95:	83 c4 10             	add    $0x10,%esp
  103e98:	85 c0                	test   %eax,%eax
  103e9a:	74 d2                	je     103e6e <runcmd+0x9c>
  103e9c:	e9 63 ff ff ff       	jmp    103e04 <runcmd+0x32>
  103ea1:	90                   	nop
  103ea2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103ea5:	c7 44 85 b0 00 00 00 	movl   $0x0,-0x50(%ebp,%eax,4)
  103eac:	00 
  103ead:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103eb1:	75 0a                	jne    103ebd <runcmd+0xeb>
  103eb3:	b8 00 00 00 00       	mov    $0x0,%eax
  103eb8:	e9 84 00 00 00       	jmp    103f41 <runcmd+0x16f>
  103ebd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  103ec4:	eb 58                	jmp    103f1e <runcmd+0x14c>
  103ec6:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103ec9:	8d 8b 2c 05 00 00    	lea    0x52c(%ebx),%ecx
  103ecf:	89 d0                	mov    %edx,%eax
  103ed1:	01 c0                	add    %eax,%eax
  103ed3:	01 d0                	add    %edx,%eax
  103ed5:	c1 e0 02             	shl    $0x2,%eax
  103ed8:	01 c8                	add    %ecx,%eax
  103eda:	8b 10                	mov    (%eax),%edx
  103edc:	8b 45 b0             	mov    -0x50(%ebp),%eax
  103edf:	83 ec 08             	sub    $0x8,%esp
  103ee2:	52                   	push   %edx
  103ee3:	50                   	push   %eax
  103ee4:	e8 0a eb ff ff       	call   1029f3 <strcmp>
  103ee9:	83 c4 10             	add    $0x10,%esp
  103eec:	85 c0                	test   %eax,%eax
  103eee:	75 2a                	jne    103f1a <runcmd+0x148>
  103ef0:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103ef3:	8d 8b 34 05 00 00    	lea    0x534(%ebx),%ecx
  103ef9:	89 d0                	mov    %edx,%eax
  103efb:	01 c0                	add    %eax,%eax
  103efd:	01 d0                	add    %edx,%eax
  103eff:	c1 e0 02             	shl    $0x2,%eax
  103f02:	01 c8                	add    %ecx,%eax
  103f04:	8b 00                	mov    (%eax),%eax
  103f06:	83 ec 04             	sub    $0x4,%esp
  103f09:	ff 75 0c             	push   0xc(%ebp)
  103f0c:	8d 55 b0             	lea    -0x50(%ebp),%edx
  103f0f:	52                   	push   %edx
  103f10:	ff 75 f4             	push   -0xc(%ebp)
  103f13:	ff d0                	call   *%eax
  103f15:	83 c4 10             	add    $0x10,%esp
  103f18:	eb 27                	jmp    103f41 <runcmd+0x16f>
  103f1a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  103f1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103f21:	83 f8 02             	cmp    $0x2,%eax
  103f24:	76 a0                	jbe    103ec6 <runcmd+0xf4>
  103f26:	8b 45 b0             	mov    -0x50(%ebp),%eax
  103f29:	83 ec 08             	sub    $0x8,%esp
  103f2c:	50                   	push   %eax
  103f2d:	8d 83 71 94 ff ff    	lea    -0x6b8f(%ebx),%eax
  103f33:	50                   	push   %eax
  103f34:	e8 63 ee ff ff       	call   102d9c <dprintf>
  103f39:	83 c4 10             	add    $0x10,%esp
  103f3c:	b8 00 00 00 00       	mov    $0x0,%eax
  103f41:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103f44:	c9                   	leave
  103f45:	c3                   	ret

00103f46 <monitor>:
  103f46:	55                   	push   %ebp
  103f47:	89 e5                	mov    %esp,%ebp
  103f49:	53                   	push   %ebx
  103f4a:	83 ec 14             	sub    $0x14,%esp
  103f4d:	e8 6e c4 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  103f52:	81 c3 a2 c0 00 00    	add    $0xc0a2,%ebx
  103f58:	83 ec 0c             	sub    $0xc,%esp
  103f5b:	8d 83 88 94 ff ff    	lea    -0x6b78(%ebx),%eax
  103f61:	50                   	push   %eax
  103f62:	e8 35 ee ff ff       	call   102d9c <dprintf>
  103f67:	83 c4 10             	add    $0x10,%esp
  103f6a:	83 ec 0c             	sub    $0xc,%esp
  103f6d:	8d 83 b4 94 ff ff    	lea    -0x6b4c(%ebx),%eax
  103f73:	50                   	push   %eax
  103f74:	e8 23 ee ff ff       	call   102d9c <dprintf>
  103f79:	83 c4 10             	add    $0x10,%esp
  103f7c:	83 ec 0c             	sub    $0xc,%esp
  103f7f:	8d 83 88 94 ff ff    	lea    -0x6b78(%ebx),%eax
  103f85:	50                   	push   %eax
  103f86:	e8 11 ee ff ff       	call   102d9c <dprintf>
  103f8b:	83 c4 10             	add    $0x10,%esp
  103f8e:	83 ec 0c             	sub    $0xc,%esp
  103f91:	8d 83 e0 94 ff ff    	lea    -0x6b20(%ebx),%eax
  103f97:	50                   	push   %eax
  103f98:	e8 ff ed ff ff       	call   102d9c <dprintf>
  103f9d:	83 c4 10             	add    $0x10,%esp
  103fa0:	83 ec 0c             	sub    $0xc,%esp
  103fa3:	8d 83 05 95 ff ff    	lea    -0x6afb(%ebx),%eax
  103fa9:	50                   	push   %eax
  103faa:	e8 ad c5 ff ff       	call   10055c <readline>
  103faf:	83 c4 10             	add    $0x10,%esp
  103fb2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103fb5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103fb9:	74 e5                	je     103fa0 <monitor+0x5a>
  103fbb:	83 ec 08             	sub    $0x8,%esp
  103fbe:	ff 75 08             	push   0x8(%ebp)
  103fc1:	ff 75 f4             	push   -0xc(%ebp)
  103fc4:	e8 09 fe ff ff       	call   103dd2 <runcmd>
  103fc9:	83 c4 10             	add    $0x10,%esp
  103fcc:	85 c0                	test   %eax,%eax
  103fce:	78 02                	js     103fd2 <monitor+0x8c>
  103fd0:	eb ce                	jmp    103fa0 <monitor+0x5a>
  103fd2:	90                   	nop
  103fd3:	90                   	nop
  103fd4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103fd7:	c9                   	leave
  103fd8:	c3                   	ret

00103fd9 <pt_copyin>:
  103fd9:	55                   	push   %ebp
  103fda:	89 e5                	mov    %esp,%ebp
  103fdc:	53                   	push   %ebx
  103fdd:	83 ec 14             	sub    $0x14,%esp
  103fe0:	e8 db c3 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  103fe5:	81 c3 0f c0 00 00    	add    $0xc00f,%ebx
  103feb:	81 7d 0c ff ff ff 3f 	cmpl   $0x3fffffff,0xc(%ebp)
  103ff2:	76 0f                	jbe    104003 <pt_copyin+0x2a>
  103ff4:	8b 55 0c             	mov    0xc(%ebp),%edx
  103ff7:	8b 45 14             	mov    0x14(%ebp),%eax
  103ffa:	01 d0                	add    %edx,%eax
  103ffc:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  104001:	76 0a                	jbe    10400d <pt_copyin+0x34>
  104003:	b8 00 00 00 00       	mov    $0x0,%eax
  104008:	e9 d7 00 00 00       	jmp    1040e4 <pt_copyin+0x10b>
  10400d:	8b 55 10             	mov    0x10(%ebp),%edx
  104010:	8b 45 14             	mov    0x14(%ebp),%eax
  104013:	01 d0                	add    %edx,%eax
  104015:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  10401a:	76 0a                	jbe    104026 <pt_copyin+0x4d>
  10401c:	b8 00 00 00 00       	mov    $0x0,%eax
  104021:	e9 be 00 00 00       	jmp    1040e4 <pt_copyin+0x10b>
  104026:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10402d:	e9 a5 00 00 00       	jmp    1040d7 <pt_copyin+0xfe>
  104032:	83 ec 08             	sub    $0x8,%esp
  104035:	ff 75 0c             	push   0xc(%ebp)
  104038:	ff 75 08             	push   0x8(%ebp)
  10403b:	e8 50 34 00 00       	call   107490 <get_ptbl_entry_by_va>
  104040:	83 c4 10             	add    $0x10,%esp
  104043:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104046:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104049:	83 e0 01             	and    $0x1,%eax
  10404c:	85 c0                	test   %eax,%eax
  10404e:	75 27                	jne    104077 <pt_copyin+0x9e>
  104050:	83 ec 04             	sub    $0x4,%esp
  104053:	6a 07                	push   $0x7
  104055:	ff 75 0c             	push   0xc(%ebp)
  104058:	ff 75 08             	push   0x8(%ebp)
  10405b:	e8 d0 41 00 00       	call   108230 <alloc_page>
  104060:	83 c4 10             	add    $0x10,%esp
  104063:	83 ec 08             	sub    $0x8,%esp
  104066:	ff 75 0c             	push   0xc(%ebp)
  104069:	ff 75 08             	push   0x8(%ebp)
  10406c:	e8 1f 34 00 00       	call   107490 <get_ptbl_entry_by_va>
  104071:	83 c4 10             	add    $0x10,%esp
  104074:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104077:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10407a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  10407f:	89 c2                	mov    %eax,%edx
  104081:	8b 45 0c             	mov    0xc(%ebp),%eax
  104084:	25 ff 0f 00 00       	and    $0xfff,%eax
  104089:	09 d0                	or     %edx,%eax
  10408b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10408e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104091:	25 ff 0f 00 00       	and    $0xfff,%eax
  104096:	89 c2                	mov    %eax,%edx
  104098:	b8 00 10 00 00       	mov    $0x1000,%eax
  10409d:	29 d0                	sub    %edx,%eax
  10409f:	8b 55 14             	mov    0x14(%ebp),%edx
  1040a2:	39 c2                	cmp    %eax,%edx
  1040a4:	0f 46 c2             	cmovbe %edx,%eax
  1040a7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1040aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1040ad:	83 ec 04             	sub    $0x4,%esp
  1040b0:	ff 75 ec             	push   -0x14(%ebp)
  1040b3:	50                   	push   %eax
  1040b4:	ff 75 10             	push   0x10(%ebp)
  1040b7:	e8 7d e8 ff ff       	call   102939 <memcpy>
  1040bc:	83 c4 10             	add    $0x10,%esp
  1040bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1040c2:	29 45 14             	sub    %eax,0x14(%ebp)
  1040c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1040c8:	01 45 0c             	add    %eax,0xc(%ebp)
  1040cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1040ce:	01 45 10             	add    %eax,0x10(%ebp)
  1040d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1040d4:	01 45 f4             	add    %eax,-0xc(%ebp)
  1040d7:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  1040db:	0f 85 51 ff ff ff    	jne    104032 <pt_copyin+0x59>
  1040e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1040e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1040e7:	c9                   	leave
  1040e8:	c3                   	ret

001040e9 <pt_copyout>:
  1040e9:	55                   	push   %ebp
  1040ea:	89 e5                	mov    %esp,%ebp
  1040ec:	53                   	push   %ebx
  1040ed:	83 ec 14             	sub    $0x14,%esp
  1040f0:	e8 cb c2 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1040f5:	81 c3 ff be 00 00    	add    $0xbeff,%ebx
  1040fb:	81 7d 10 ff ff ff 3f 	cmpl   $0x3fffffff,0x10(%ebp)
  104102:	76 0f                	jbe    104113 <pt_copyout+0x2a>
  104104:	8b 55 10             	mov    0x10(%ebp),%edx
  104107:	8b 45 14             	mov    0x14(%ebp),%eax
  10410a:	01 d0                	add    %edx,%eax
  10410c:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  104111:	76 0a                	jbe    10411d <pt_copyout+0x34>
  104113:	b8 00 00 00 00       	mov    $0x0,%eax
  104118:	e9 d7 00 00 00       	jmp    1041f4 <pt_copyout+0x10b>
  10411d:	8b 55 08             	mov    0x8(%ebp),%edx
  104120:	8b 45 14             	mov    0x14(%ebp),%eax
  104123:	01 d0                	add    %edx,%eax
  104125:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  10412a:	76 0a                	jbe    104136 <pt_copyout+0x4d>
  10412c:	b8 00 00 00 00       	mov    $0x0,%eax
  104131:	e9 be 00 00 00       	jmp    1041f4 <pt_copyout+0x10b>
  104136:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10413d:	e9 a5 00 00 00       	jmp    1041e7 <pt_copyout+0xfe>
  104142:	83 ec 08             	sub    $0x8,%esp
  104145:	ff 75 10             	push   0x10(%ebp)
  104148:	ff 75 0c             	push   0xc(%ebp)
  10414b:	e8 40 33 00 00       	call   107490 <get_ptbl_entry_by_va>
  104150:	83 c4 10             	add    $0x10,%esp
  104153:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104156:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104159:	83 e0 01             	and    $0x1,%eax
  10415c:	85 c0                	test   %eax,%eax
  10415e:	75 27                	jne    104187 <pt_copyout+0x9e>
  104160:	83 ec 04             	sub    $0x4,%esp
  104163:	6a 07                	push   $0x7
  104165:	ff 75 10             	push   0x10(%ebp)
  104168:	ff 75 0c             	push   0xc(%ebp)
  10416b:	e8 c0 40 00 00       	call   108230 <alloc_page>
  104170:	83 c4 10             	add    $0x10,%esp
  104173:	83 ec 08             	sub    $0x8,%esp
  104176:	ff 75 10             	push   0x10(%ebp)
  104179:	ff 75 0c             	push   0xc(%ebp)
  10417c:	e8 0f 33 00 00       	call   107490 <get_ptbl_entry_by_va>
  104181:	83 c4 10             	add    $0x10,%esp
  104184:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104187:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10418a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  10418f:	89 c2                	mov    %eax,%edx
  104191:	8b 45 10             	mov    0x10(%ebp),%eax
  104194:	25 ff 0f 00 00       	and    $0xfff,%eax
  104199:	09 d0                	or     %edx,%eax
  10419b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10419e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1041a1:	25 ff 0f 00 00       	and    $0xfff,%eax
  1041a6:	89 c2                	mov    %eax,%edx
  1041a8:	b8 00 10 00 00       	mov    $0x1000,%eax
  1041ad:	29 d0                	sub    %edx,%eax
  1041af:	8b 55 14             	mov    0x14(%ebp),%edx
  1041b2:	39 c2                	cmp    %eax,%edx
  1041b4:	0f 46 c2             	cmovbe %edx,%eax
  1041b7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1041ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1041bd:	83 ec 04             	sub    $0x4,%esp
  1041c0:	ff 75 ec             	push   -0x14(%ebp)
  1041c3:	ff 75 08             	push   0x8(%ebp)
  1041c6:	50                   	push   %eax
  1041c7:	e8 6d e7 ff ff       	call   102939 <memcpy>
  1041cc:	83 c4 10             	add    $0x10,%esp
  1041cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1041d2:	29 45 14             	sub    %eax,0x14(%ebp)
  1041d5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1041d8:	01 45 10             	add    %eax,0x10(%ebp)
  1041db:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1041de:	01 45 08             	add    %eax,0x8(%ebp)
  1041e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1041e4:	01 45 f4             	add    %eax,-0xc(%ebp)
  1041e7:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  1041eb:	0f 85 51 ff ff ff    	jne    104142 <pt_copyout+0x59>
  1041f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1041f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1041f7:	c9                   	leave
  1041f8:	c3                   	ret

001041f9 <pt_memset>:
  1041f9:	55                   	push   %ebp
  1041fa:	89 e5                	mov    %esp,%ebp
  1041fc:	53                   	push   %ebx
  1041fd:	83 ec 24             	sub    $0x24,%esp
  104200:	e8 bb c1 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  104205:	81 c3 ef bd 00 00    	add    $0xbdef,%ebx
  10420b:	8b 45 10             	mov    0x10(%ebp),%eax
  10420e:	88 45 e4             	mov    %al,-0x1c(%ebp)
  104211:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  104218:	e9 a1 00 00 00       	jmp    1042be <pt_memset+0xc5>
  10421d:	83 ec 08             	sub    $0x8,%esp
  104220:	ff 75 0c             	push   0xc(%ebp)
  104223:	ff 75 08             	push   0x8(%ebp)
  104226:	e8 65 32 00 00       	call   107490 <get_ptbl_entry_by_va>
  10422b:	83 c4 10             	add    $0x10,%esp
  10422e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104231:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104234:	83 e0 01             	and    $0x1,%eax
  104237:	85 c0                	test   %eax,%eax
  104239:	75 27                	jne    104262 <pt_memset+0x69>
  10423b:	83 ec 04             	sub    $0x4,%esp
  10423e:	6a 07                	push   $0x7
  104240:	ff 75 0c             	push   0xc(%ebp)
  104243:	ff 75 08             	push   0x8(%ebp)
  104246:	e8 e5 3f 00 00       	call   108230 <alloc_page>
  10424b:	83 c4 10             	add    $0x10,%esp
  10424e:	83 ec 08             	sub    $0x8,%esp
  104251:	ff 75 0c             	push   0xc(%ebp)
  104254:	ff 75 08             	push   0x8(%ebp)
  104257:	e8 34 32 00 00       	call   107490 <get_ptbl_entry_by_va>
  10425c:	83 c4 10             	add    $0x10,%esp
  10425f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104262:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104265:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  10426a:	89 c2                	mov    %eax,%edx
  10426c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10426f:	25 ff 0f 00 00       	and    $0xfff,%eax
  104274:	09 d0                	or     %edx,%eax
  104276:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104279:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10427c:	25 ff 0f 00 00       	and    $0xfff,%eax
  104281:	89 c2                	mov    %eax,%edx
  104283:	b8 00 10 00 00       	mov    $0x1000,%eax
  104288:	29 d0                	sub    %edx,%eax
  10428a:	8b 55 14             	mov    0x14(%ebp),%edx
  10428d:	39 c2                	cmp    %eax,%edx
  10428f:	0f 46 c2             	cmovbe %edx,%eax
  104292:	89 45 ec             	mov    %eax,-0x14(%ebp)
  104295:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
  104299:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10429c:	83 ec 04             	sub    $0x4,%esp
  10429f:	ff 75 ec             	push   -0x14(%ebp)
  1042a2:	52                   	push   %edx
  1042a3:	50                   	push   %eax
  1042a4:	e8 32 e5 ff ff       	call   1027db <memset>
  1042a9:	83 c4 10             	add    $0x10,%esp
  1042ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1042af:	29 45 14             	sub    %eax,0x14(%ebp)
  1042b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1042b5:	01 45 0c             	add    %eax,0xc(%ebp)
  1042b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1042bb:	01 45 f4             	add    %eax,-0xc(%ebp)
  1042be:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  1042c2:	0f 85 55 ff ff ff    	jne    10421d <pt_memset+0x24>
  1042c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1042cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1042ce:	c9                   	leave
  1042cf:	c3                   	ret

001042d0 <elf_load>:
  1042d0:	55                   	push   %ebp
  1042d1:	89 e5                	mov    %esp,%ebp
  1042d3:	53                   	push   %ebx
  1042d4:	83 ec 34             	sub    $0x34,%esp
  1042d7:	e8 e4 c0 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1042dc:	81 c3 18 bd 00 00    	add    $0xbd18,%ebx
  1042e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1042e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1042e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1042eb:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1042ee:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1042f1:	8b 00                	mov    (%eax),%eax
  1042f3:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  1042f8:	74 1f                	je     104319 <elf_load+0x49>
  1042fa:	8d 83 0c 95 ff ff    	lea    -0x6af4(%ebx),%eax
  104300:	50                   	push   %eax
  104301:	8d 83 25 95 ff ff    	lea    -0x6adb(%ebx),%eax
  104307:	50                   	push   %eax
  104308:	6a 26                	push   $0x26
  10430a:	8d 83 42 95 ff ff    	lea    -0x6abe(%ebx),%eax
  104310:	50                   	push   %eax
  104311:	e8 6e e8 ff ff       	call   102b84 <debug_panic>
  104316:	83 c4 10             	add    $0x10,%esp
  104319:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10431c:	0f b7 40 32          	movzwl 0x32(%eax),%eax
  104320:	66 85 c0             	test   %ax,%ax
  104323:	75 1f                	jne    104344 <elf_load+0x74>
  104325:	8d 83 54 95 ff ff    	lea    -0x6aac(%ebx),%eax
  10432b:	50                   	push   %eax
  10432c:	8d 83 25 95 ff ff    	lea    -0x6adb(%ebx),%eax
  104332:	50                   	push   %eax
  104333:	6a 27                	push   $0x27
  104335:	8d 83 42 95 ff ff    	lea    -0x6abe(%ebx),%eax
  10433b:	50                   	push   %eax
  10433c:	e8 43 e8 ff ff       	call   102b84 <debug_panic>
  104341:	83 c4 10             	add    $0x10,%esp
  104344:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104347:	8b 50 20             	mov    0x20(%eax),%edx
  10434a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10434d:	01 d0                	add    %edx,%eax
  10434f:	89 45 dc             	mov    %eax,-0x24(%ebp)
  104352:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104355:	0f b7 40 30          	movzwl 0x30(%eax),%eax
  104359:	0f b7 d0             	movzwl %ax,%edx
  10435c:	89 d0                	mov    %edx,%eax
  10435e:	c1 e0 02             	shl    $0x2,%eax
  104361:	01 d0                	add    %edx,%eax
  104363:	c1 e0 03             	shl    $0x3,%eax
  104366:	89 c2                	mov    %eax,%edx
  104368:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10436b:	01 d0                	add    %edx,%eax
  10436d:	89 45 d8             	mov    %eax,-0x28(%ebp)
  104370:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104373:	0f b7 40 32          	movzwl 0x32(%eax),%eax
  104377:	0f b7 d0             	movzwl %ax,%edx
  10437a:	89 d0                	mov    %edx,%eax
  10437c:	c1 e0 02             	shl    $0x2,%eax
  10437f:	01 d0                	add    %edx,%eax
  104381:	c1 e0 03             	shl    $0x3,%eax
  104384:	89 c2                	mov    %eax,%edx
  104386:	8b 45 dc             	mov    -0x24(%ebp),%eax
  104389:	01 d0                	add    %edx,%eax
  10438b:	8b 50 10             	mov    0x10(%eax),%edx
  10438e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  104391:	01 d0                	add    %edx,%eax
  104393:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  104396:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104399:	0f b7 40 32          	movzwl 0x32(%eax),%eax
  10439d:	0f b7 d0             	movzwl %ax,%edx
  1043a0:	89 d0                	mov    %edx,%eax
  1043a2:	c1 e0 02             	shl    $0x2,%eax
  1043a5:	01 d0                	add    %edx,%eax
  1043a7:	c1 e0 03             	shl    $0x3,%eax
  1043aa:	89 c2                	mov    %eax,%edx
  1043ac:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1043af:	01 d0                	add    %edx,%eax
  1043b1:	8b 40 04             	mov    0x4(%eax),%eax
  1043b4:	83 f8 03             	cmp    $0x3,%eax
  1043b7:	74 1f                	je     1043d8 <elf_load+0x108>
  1043b9:	8d 83 74 95 ff ff    	lea    -0x6a8c(%ebx),%eax
  1043bf:	50                   	push   %eax
  1043c0:	8d 83 25 95 ff ff    	lea    -0x6adb(%ebx),%eax
  1043c6:	50                   	push   %eax
  1043c7:	6a 2d                	push   $0x2d
  1043c9:	8d 83 42 95 ff ff    	lea    -0x6abe(%ebx),%eax
  1043cf:	50                   	push   %eax
  1043d0:	e8 af e7 ff ff       	call   102b84 <debug_panic>
  1043d5:	83 c4 10             	add    $0x10,%esp
  1043d8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1043db:	8b 50 1c             	mov    0x1c(%eax),%edx
  1043de:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1043e1:	01 d0                	add    %edx,%eax
  1043e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1043e6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1043e9:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  1043ed:	0f b7 c0             	movzwl %ax,%eax
  1043f0:	c1 e0 05             	shl    $0x5,%eax
  1043f3:	89 c2                	mov    %eax,%edx
  1043f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1043f8:	01 d0                	add    %edx,%eax
  1043fa:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1043fd:	e9 5f 01 00 00       	jmp    104561 <elf_load+0x291>
  104402:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104405:	8b 00                	mov    (%eax),%eax
  104407:	83 f8 01             	cmp    $0x1,%eax
  10440a:	0f 85 4c 01 00 00    	jne    10455c <elf_load+0x28c>
  104410:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104413:	8b 40 04             	mov    0x4(%eax),%eax
  104416:	83 ec 08             	sub    $0x8,%esp
  104419:	68 00 10 00 00       	push   $0x1000
  10441e:	50                   	push   %eax
  10441f:	e8 11 f4 ff ff       	call   103835 <rounddown>
  104424:	83 c4 10             	add    $0x10,%esp
  104427:	8b 55 e0             	mov    -0x20(%ebp),%edx
  10442a:	01 d0                	add    %edx,%eax
  10442c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10442f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104432:	8b 40 08             	mov    0x8(%eax),%eax
  104435:	83 ec 08             	sub    $0x8,%esp
  104438:	68 00 10 00 00       	push   $0x1000
  10443d:	50                   	push   %eax
  10443e:	e8 f2 f3 ff ff       	call   103835 <rounddown>
  104443:	83 c4 10             	add    $0x10,%esp
  104446:	89 45 ec             	mov    %eax,-0x14(%ebp)
  104449:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10444c:	8b 50 08             	mov    0x8(%eax),%edx
  10444f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104452:	8b 40 10             	mov    0x10(%eax),%eax
  104455:	01 d0                	add    %edx,%eax
  104457:	89 45 cc             	mov    %eax,-0x34(%ebp)
  10445a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10445d:	8b 50 08             	mov    0x8(%eax),%edx
  104460:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104463:	8b 40 14             	mov    0x14(%eax),%eax
  104466:	01 d0                	add    %edx,%eax
  104468:	83 ec 08             	sub    $0x8,%esp
  10446b:	68 00 10 00 00       	push   $0x1000
  104470:	50                   	push   %eax
  104471:	e8 de f3 ff ff       	call   103854 <roundup>
  104476:	83 c4 10             	add    $0x10,%esp
  104479:	89 45 c8             	mov    %eax,-0x38(%ebp)
  10447c:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
  104483:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104486:	8b 40 18             	mov    0x18(%eax),%eax
  104489:	83 e0 02             	and    $0x2,%eax
  10448c:	85 c0                	test   %eax,%eax
  10448e:	0f 84 ba 00 00 00    	je     10454e <elf_load+0x27e>
  104494:	83 4d e8 02          	orl    $0x2,-0x18(%ebp)
  104498:	e9 b1 00 00 00       	jmp    10454e <elf_load+0x27e>
  10449d:	8b 45 0c             	mov    0xc(%ebp),%eax
  1044a0:	83 ec 04             	sub    $0x4,%esp
  1044a3:	ff 75 e8             	push   -0x18(%ebp)
  1044a6:	ff 75 ec             	push   -0x14(%ebp)
  1044a9:	50                   	push   %eax
  1044aa:	e8 81 3d 00 00       	call   108230 <alloc_page>
  1044af:	83 c4 10             	add    $0x10,%esp
  1044b2:	83 ec 08             	sub    $0x8,%esp
  1044b5:	68 00 10 00 00       	push   $0x1000
  1044ba:	ff 75 cc             	push   -0x34(%ebp)
  1044bd:	e8 73 f3 ff ff       	call   103835 <rounddown>
  1044c2:	83 c4 10             	add    $0x10,%esp
  1044c5:	39 45 ec             	cmp    %eax,-0x14(%ebp)
  1044c8:	73 1a                	jae    1044e4 <elf_load+0x214>
  1044ca:	8b 55 0c             	mov    0xc(%ebp),%edx
  1044cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1044d0:	68 00 10 00 00       	push   $0x1000
  1044d5:	ff 75 ec             	push   -0x14(%ebp)
  1044d8:	52                   	push   %edx
  1044d9:	50                   	push   %eax
  1044da:	e8 0a fc ff ff       	call   1040e9 <pt_copyout>
  1044df:	83 c4 10             	add    $0x10,%esp
  1044e2:	eb 5c                	jmp    104540 <elf_load+0x270>
  1044e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1044e7:	3b 45 cc             	cmp    -0x34(%ebp),%eax
  1044ea:	73 3e                	jae    10452a <elf_load+0x25a>
  1044ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1044ef:	8b 40 10             	mov    0x10(%eax),%eax
  1044f2:	85 c0                	test   %eax,%eax
  1044f4:	74 34                	je     10452a <elf_load+0x25a>
  1044f6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1044f9:	68 00 10 00 00       	push   $0x1000
  1044fe:	6a 00                	push   $0x0
  104500:	ff 75 ec             	push   -0x14(%ebp)
  104503:	50                   	push   %eax
  104504:	e8 f0 fc ff ff       	call   1041f9 <pt_memset>
  104509:	83 c4 10             	add    $0x10,%esp
  10450c:	8b 45 cc             	mov    -0x34(%ebp),%eax
  10450f:	2b 45 ec             	sub    -0x14(%ebp),%eax
  104512:	89 c1                	mov    %eax,%ecx
  104514:	8b 55 0c             	mov    0xc(%ebp),%edx
  104517:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10451a:	51                   	push   %ecx
  10451b:	ff 75 ec             	push   -0x14(%ebp)
  10451e:	52                   	push   %edx
  10451f:	50                   	push   %eax
  104520:	e8 c4 fb ff ff       	call   1040e9 <pt_copyout>
  104525:	83 c4 10             	add    $0x10,%esp
  104528:	eb 16                	jmp    104540 <elf_load+0x270>
  10452a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10452d:	68 00 10 00 00       	push   $0x1000
  104532:	6a 00                	push   $0x0
  104534:	ff 75 ec             	push   -0x14(%ebp)
  104537:	50                   	push   %eax
  104538:	e8 bc fc ff ff       	call   1041f9 <pt_memset>
  10453d:	83 c4 10             	add    $0x10,%esp
  104540:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
  104547:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
  10454e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104551:	3b 45 c8             	cmp    -0x38(%ebp),%eax
  104554:	0f 82 43 ff ff ff    	jb     10449d <elf_load+0x1cd>
  10455a:	eb 01                	jmp    10455d <elf_load+0x28d>
  10455c:	90                   	nop
  10455d:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
  104561:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104564:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  104567:	0f 82 95 fe ff ff    	jb     104402 <elf_load+0x132>
  10456d:	8b 45 0c             	mov    0xc(%ebp),%eax
  104570:	68 00 10 00 00       	push   $0x1000
  104575:	68 00 00 00 e0       	push   $0xe0000000
  10457a:	50                   	push   %eax
  10457b:	8d 83 0c 10 00 00    	lea    0x100c(%ebx),%eax
  104581:	50                   	push   %eax
  104582:	e8 62 fb ff ff       	call   1040e9 <pt_copyout>
  104587:	83 c4 10             	add    $0x10,%esp
  10458a:	90                   	nop
  10458b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10458e:	c9                   	leave
  10458f:	c3                   	ret

00104590 <elf_entry>:
  104590:	55                   	push   %ebp
  104591:	89 e5                	mov    %esp,%ebp
  104593:	53                   	push   %ebx
  104594:	83 ec 14             	sub    $0x14,%esp
  104597:	e8 1c be ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  10459c:	05 58 ba 00 00       	add    $0xba58,%eax
  1045a1:	8b 55 08             	mov    0x8(%ebp),%edx
  1045a4:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1045a7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1045aa:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1045ad:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1045b0:	8b 12                	mov    (%edx),%edx
  1045b2:	81 fa 7f 45 4c 46    	cmp    $0x464c457f,%edx
  1045b8:	74 21                	je     1045db <elf_entry+0x4b>
  1045ba:	8d 90 0c 95 ff ff    	lea    -0x6af4(%eax),%edx
  1045c0:	52                   	push   %edx
  1045c1:	8d 90 25 95 ff ff    	lea    -0x6adb(%eax),%edx
  1045c7:	52                   	push   %edx
  1045c8:	6a 5b                	push   $0x5b
  1045ca:	8d 90 42 95 ff ff    	lea    -0x6abe(%eax),%edx
  1045d0:	52                   	push   %edx
  1045d1:	89 c3                	mov    %eax,%ebx
  1045d3:	e8 ac e5 ff ff       	call   102b84 <debug_panic>
  1045d8:	83 c4 10             	add    $0x10,%esp
  1045db:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1045de:	8b 40 18             	mov    0x18(%eax),%eax
  1045e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1045e4:	c9                   	leave
  1045e5:	c3                   	ret

001045e6 <trap_dump>:
  1045e6:	55                   	push   %ebp
  1045e7:	89 e5                	mov    %esp,%ebp
  1045e9:	53                   	push   %ebx
  1045ea:	83 ec 14             	sub    $0x14,%esp
  1045ed:	e8 ce bd ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1045f2:	81 c3 02 ba 00 00    	add    $0xba02,%ebx
  1045f8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1045fc:	0f 84 4f 02 00 00    	je     104851 <trap_dump+0x26b>
  104602:	8b 45 08             	mov    0x8(%ebp),%eax
  104605:	89 45 f4             	mov    %eax,-0xc(%ebp)
  104608:	ff 75 f4             	push   -0xc(%ebp)
  10460b:	8d 83 a4 95 ff ff    	lea    -0x6a5c(%ebx),%eax
  104611:	50                   	push   %eax
  104612:	6a 12                	push   $0x12
  104614:	8d 83 b5 95 ff ff    	lea    -0x6a4b(%ebx),%eax
  10461a:	50                   	push   %eax
  10461b:	e8 a9 e4 ff ff       	call   102ac9 <debug_normal>
  104620:	83 c4 10             	add    $0x10,%esp
  104623:	8b 45 08             	mov    0x8(%ebp),%eax
  104626:	8b 10                	mov    (%eax),%edx
  104628:	8b 45 08             	mov    0x8(%ebp),%eax
  10462b:	83 ec 04             	sub    $0x4,%esp
  10462e:	52                   	push   %edx
  10462f:	50                   	push   %eax
  104630:	8d 83 c5 95 ff ff    	lea    -0x6a3b(%ebx),%eax
  104636:	50                   	push   %eax
  104637:	e8 5c e4 ff ff       	call   102a98 <debug_info>
  10463c:	83 c4 10             	add    $0x10,%esp
  10463f:	8b 45 08             	mov    0x8(%ebp),%eax
  104642:	8b 40 04             	mov    0x4(%eax),%eax
  104645:	8b 55 08             	mov    0x8(%ebp),%edx
  104648:	83 c2 04             	add    $0x4,%edx
  10464b:	83 ec 04             	sub    $0x4,%esp
  10464e:	50                   	push   %eax
  10464f:	52                   	push   %edx
  104650:	8d 83 db 95 ff ff    	lea    -0x6a25(%ebx),%eax
  104656:	50                   	push   %eax
  104657:	e8 3c e4 ff ff       	call   102a98 <debug_info>
  10465c:	83 c4 10             	add    $0x10,%esp
  10465f:	8b 45 08             	mov    0x8(%ebp),%eax
  104662:	8b 40 08             	mov    0x8(%eax),%eax
  104665:	8b 55 08             	mov    0x8(%ebp),%edx
  104668:	83 c2 08             	add    $0x8,%edx
  10466b:	83 ec 04             	sub    $0x4,%esp
  10466e:	50                   	push   %eax
  10466f:	52                   	push   %edx
  104670:	8d 83 f1 95 ff ff    	lea    -0x6a0f(%ebx),%eax
  104676:	50                   	push   %eax
  104677:	e8 1c e4 ff ff       	call   102a98 <debug_info>
  10467c:	83 c4 10             	add    $0x10,%esp
  10467f:	8b 45 08             	mov    0x8(%ebp),%eax
  104682:	8b 40 0c             	mov    0xc(%eax),%eax
  104685:	8b 55 08             	mov    0x8(%ebp),%edx
  104688:	83 c2 0c             	add    $0xc,%edx
  10468b:	83 ec 04             	sub    $0x4,%esp
  10468e:	50                   	push   %eax
  10468f:	52                   	push   %edx
  104690:	8d 83 07 96 ff ff    	lea    -0x69f9(%ebx),%eax
  104696:	50                   	push   %eax
  104697:	e8 fc e3 ff ff       	call   102a98 <debug_info>
  10469c:	83 c4 10             	add    $0x10,%esp
  10469f:	8b 45 08             	mov    0x8(%ebp),%eax
  1046a2:	8b 40 10             	mov    0x10(%eax),%eax
  1046a5:	8b 55 08             	mov    0x8(%ebp),%edx
  1046a8:	83 c2 10             	add    $0x10,%edx
  1046ab:	83 ec 04             	sub    $0x4,%esp
  1046ae:	50                   	push   %eax
  1046af:	52                   	push   %edx
  1046b0:	8d 83 1d 96 ff ff    	lea    -0x69e3(%ebx),%eax
  1046b6:	50                   	push   %eax
  1046b7:	e8 dc e3 ff ff       	call   102a98 <debug_info>
  1046bc:	83 c4 10             	add    $0x10,%esp
  1046bf:	8b 45 08             	mov    0x8(%ebp),%eax
  1046c2:	8b 40 14             	mov    0x14(%eax),%eax
  1046c5:	8b 55 08             	mov    0x8(%ebp),%edx
  1046c8:	83 c2 14             	add    $0x14,%edx
  1046cb:	83 ec 04             	sub    $0x4,%esp
  1046ce:	50                   	push   %eax
  1046cf:	52                   	push   %edx
  1046d0:	8d 83 33 96 ff ff    	lea    -0x69cd(%ebx),%eax
  1046d6:	50                   	push   %eax
  1046d7:	e8 bc e3 ff ff       	call   102a98 <debug_info>
  1046dc:	83 c4 10             	add    $0x10,%esp
  1046df:	8b 45 08             	mov    0x8(%ebp),%eax
  1046e2:	8b 40 18             	mov    0x18(%eax),%eax
  1046e5:	8b 55 08             	mov    0x8(%ebp),%edx
  1046e8:	83 c2 18             	add    $0x18,%edx
  1046eb:	83 ec 04             	sub    $0x4,%esp
  1046ee:	50                   	push   %eax
  1046ef:	52                   	push   %edx
  1046f0:	8d 83 49 96 ff ff    	lea    -0x69b7(%ebx),%eax
  1046f6:	50                   	push   %eax
  1046f7:	e8 9c e3 ff ff       	call   102a98 <debug_info>
  1046fc:	83 c4 10             	add    $0x10,%esp
  1046ff:	8b 45 08             	mov    0x8(%ebp),%eax
  104702:	8b 40 1c             	mov    0x1c(%eax),%eax
  104705:	8b 55 08             	mov    0x8(%ebp),%edx
  104708:	83 c2 1c             	add    $0x1c,%edx
  10470b:	83 ec 04             	sub    $0x4,%esp
  10470e:	50                   	push   %eax
  10470f:	52                   	push   %edx
  104710:	8d 83 5f 96 ff ff    	lea    -0x69a1(%ebx),%eax
  104716:	50                   	push   %eax
  104717:	e8 7c e3 ff ff       	call   102a98 <debug_info>
  10471c:	83 c4 10             	add    $0x10,%esp
  10471f:	8b 45 08             	mov    0x8(%ebp),%eax
  104722:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  104726:	0f b7 c0             	movzwl %ax,%eax
  104729:	8b 55 08             	mov    0x8(%ebp),%edx
  10472c:	83 c2 20             	add    $0x20,%edx
  10472f:	83 ec 04             	sub    $0x4,%esp
  104732:	50                   	push   %eax
  104733:	52                   	push   %edx
  104734:	8d 83 75 96 ff ff    	lea    -0x698b(%ebx),%eax
  10473a:	50                   	push   %eax
  10473b:	e8 58 e3 ff ff       	call   102a98 <debug_info>
  104740:	83 c4 10             	add    $0x10,%esp
  104743:	8b 45 08             	mov    0x8(%ebp),%eax
  104746:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  10474a:	0f b7 c0             	movzwl %ax,%eax
  10474d:	8b 55 08             	mov    0x8(%ebp),%edx
  104750:	83 c2 24             	add    $0x24,%edx
  104753:	83 ec 04             	sub    $0x4,%esp
  104756:	50                   	push   %eax
  104757:	52                   	push   %edx
  104758:	8d 83 8b 96 ff ff    	lea    -0x6975(%ebx),%eax
  10475e:	50                   	push   %eax
  10475f:	e8 34 e3 ff ff       	call   102a98 <debug_info>
  104764:	83 c4 10             	add    $0x10,%esp
  104767:	8b 45 08             	mov    0x8(%ebp),%eax
  10476a:	8b 40 28             	mov    0x28(%eax),%eax
  10476d:	8b 55 08             	mov    0x8(%ebp),%edx
  104770:	83 c2 28             	add    $0x28,%edx
  104773:	83 ec 04             	sub    $0x4,%esp
  104776:	50                   	push   %eax
  104777:	52                   	push   %edx
  104778:	8d 83 a1 96 ff ff    	lea    -0x695f(%ebx),%eax
  10477e:	50                   	push   %eax
  10477f:	e8 14 e3 ff ff       	call   102a98 <debug_info>
  104784:	83 c4 10             	add    $0x10,%esp
  104787:	8b 45 08             	mov    0x8(%ebp),%eax
  10478a:	8b 40 2c             	mov    0x2c(%eax),%eax
  10478d:	8b 55 08             	mov    0x8(%ebp),%edx
  104790:	83 c2 2c             	add    $0x2c,%edx
  104793:	83 ec 04             	sub    $0x4,%esp
  104796:	50                   	push   %eax
  104797:	52                   	push   %edx
  104798:	8d 83 b7 96 ff ff    	lea    -0x6949(%ebx),%eax
  10479e:	50                   	push   %eax
  10479f:	e8 f4 e2 ff ff       	call   102a98 <debug_info>
  1047a4:	83 c4 10             	add    $0x10,%esp
  1047a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1047aa:	8b 40 30             	mov    0x30(%eax),%eax
  1047ad:	8b 55 08             	mov    0x8(%ebp),%edx
  1047b0:	83 c2 30             	add    $0x30,%edx
  1047b3:	83 ec 04             	sub    $0x4,%esp
  1047b6:	50                   	push   %eax
  1047b7:	52                   	push   %edx
  1047b8:	8d 83 cd 96 ff ff    	lea    -0x6933(%ebx),%eax
  1047be:	50                   	push   %eax
  1047bf:	e8 d4 e2 ff ff       	call   102a98 <debug_info>
  1047c4:	83 c4 10             	add    $0x10,%esp
  1047c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1047ca:	0f b7 40 34          	movzwl 0x34(%eax),%eax
  1047ce:	0f b7 c0             	movzwl %ax,%eax
  1047d1:	8b 55 08             	mov    0x8(%ebp),%edx
  1047d4:	83 c2 34             	add    $0x34,%edx
  1047d7:	83 ec 04             	sub    $0x4,%esp
  1047da:	50                   	push   %eax
  1047db:	52                   	push   %edx
  1047dc:	8d 83 e3 96 ff ff    	lea    -0x691d(%ebx),%eax
  1047e2:	50                   	push   %eax
  1047e3:	e8 b0 e2 ff ff       	call   102a98 <debug_info>
  1047e8:	83 c4 10             	add    $0x10,%esp
  1047eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1047ee:	8b 40 38             	mov    0x38(%eax),%eax
  1047f1:	8b 55 08             	mov    0x8(%ebp),%edx
  1047f4:	83 c2 38             	add    $0x38,%edx
  1047f7:	83 ec 04             	sub    $0x4,%esp
  1047fa:	50                   	push   %eax
  1047fb:	52                   	push   %edx
  1047fc:	8d 83 f9 96 ff ff    	lea    -0x6907(%ebx),%eax
  104802:	50                   	push   %eax
  104803:	e8 90 e2 ff ff       	call   102a98 <debug_info>
  104808:	83 c4 10             	add    $0x10,%esp
  10480b:	8b 45 08             	mov    0x8(%ebp),%eax
  10480e:	8b 40 3c             	mov    0x3c(%eax),%eax
  104811:	8b 55 08             	mov    0x8(%ebp),%edx
  104814:	83 c2 3c             	add    $0x3c,%edx
  104817:	83 ec 04             	sub    $0x4,%esp
  10481a:	50                   	push   %eax
  10481b:	52                   	push   %edx
  10481c:	8d 83 07 96 ff ff    	lea    -0x69f9(%ebx),%eax
  104822:	50                   	push   %eax
  104823:	e8 70 e2 ff ff       	call   102a98 <debug_info>
  104828:	83 c4 10             	add    $0x10,%esp
  10482b:	8b 45 08             	mov    0x8(%ebp),%eax
  10482e:	0f b7 40 40          	movzwl 0x40(%eax),%eax
  104832:	0f b7 c0             	movzwl %ax,%eax
  104835:	8b 55 08             	mov    0x8(%ebp),%edx
  104838:	83 c2 40             	add    $0x40,%edx
  10483b:	83 ec 04             	sub    $0x4,%esp
  10483e:	50                   	push   %eax
  10483f:	52                   	push   %edx
  104840:	8d 83 0f 97 ff ff    	lea    -0x68f1(%ebx),%eax
  104846:	50                   	push   %eax
  104847:	e8 4c e2 ff ff       	call   102a98 <debug_info>
  10484c:	83 c4 10             	add    $0x10,%esp
  10484f:	eb 01                	jmp    104852 <trap_dump+0x26c>
  104851:	90                   	nop
  104852:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104855:	c9                   	leave
  104856:	c3                   	ret

00104857 <pgflt_handler>:
  104857:	55                   	push   %ebp
  104858:	89 e5                	mov    %esp,%ebp
  10485a:	53                   	push   %ebx
  10485b:	83 ec 14             	sub    $0x14,%esp
  10485e:	e8 5d bb ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  104863:	81 c3 91 b7 00 00    	add    $0xb791,%ebx
  104869:	8b 45 08             	mov    0x8(%ebp),%eax
  10486c:	8b 40 2c             	mov    0x2c(%eax),%eax
  10486f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  104872:	e8 21 f2 ff ff       	call   103a98 <rcr2>
  104877:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10487a:	8b 45 08             	mov    0x8(%ebp),%eax
  10487d:	8b 50 30             	mov    0x30(%eax),%edx
  104880:	c7 c0 2c cc 15 00    	mov    $0x15cc2c,%eax
  104886:	8b 00                	mov    (%eax),%eax
  104888:	83 ec 0c             	sub    $0xc,%esp
  10488b:	52                   	push   %edx
  10488c:	50                   	push   %eax
  10488d:	ff 75 f4             	push   -0xc(%ebp)
  104890:	ff 75 f0             	push   -0x10(%ebp)
  104893:	8d 83 28 97 ff ff    	lea    -0x68d8(%ebx),%eax
  104899:	50                   	push   %eax
  10489a:	e8 fd e4 ff ff       	call   102d9c <dprintf>
  10489f:	83 c4 20             	add    $0x20,%esp
  1048a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1048a5:	8b 40 2c             	mov    0x2c(%eax),%eax
  1048a8:	83 e0 01             	and    $0x1,%eax
  1048ab:	85 c0                	test   %eax,%eax
  1048ad:	74 23                	je     1048d2 <pgflt_handler+0x7b>
  1048af:	83 ec 0c             	sub    $0xc,%esp
  1048b2:	ff 75 f4             	push   -0xc(%ebp)
  1048b5:	ff 75 f0             	push   -0x10(%ebp)
  1048b8:	8d 83 6c 97 ff ff    	lea    -0x6894(%ebx),%eax
  1048be:	50                   	push   %eax
  1048bf:	6a 32                	push   $0x32
  1048c1:	8d 83 b5 95 ff ff    	lea    -0x6a4b(%ebx),%eax
  1048c7:	50                   	push   %eax
  1048c8:	e8 b7 e2 ff ff       	call   102b84 <debug_panic>
  1048cd:	83 c4 20             	add    $0x20,%esp
  1048d0:	eb 2a                	jmp    1048fc <pgflt_handler+0xa5>
  1048d2:	83 ec 08             	sub    $0x8,%esp
  1048d5:	68 00 10 00 00       	push   $0x1000
  1048da:	ff 75 f0             	push   -0x10(%ebp)
  1048dd:	e8 53 ef ff ff       	call   103835 <rounddown>
  1048e2:	83 c4 10             	add    $0x10,%esp
  1048e5:	c7 c2 2c cc 15 00    	mov    $0x15cc2c,%edx
  1048eb:	8b 12                	mov    (%edx),%edx
  1048ed:	83 ec 04             	sub    $0x4,%esp
  1048f0:	6a 07                	push   $0x7
  1048f2:	50                   	push   %eax
  1048f3:	52                   	push   %edx
  1048f4:	e8 37 39 00 00       	call   108230 <alloc_page>
  1048f9:	83 c4 10             	add    $0x10,%esp
  1048fc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1048ff:	c9                   	leave
  104900:	c3                   	ret

00104901 <checkpoint>:
  104901:	55                   	push   %ebp
  104902:	89 e5                	mov    %esp,%ebp
  104904:	53                   	push   %ebx
  104905:	83 ec 04             	sub    $0x4,%esp
  104908:	e8 ab ba ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  10490d:	05 e7 b6 00 00       	add    $0xb6e7,%eax
  104912:	83 ec 0c             	sub    $0xc,%esp
  104915:	8d 90 9d 97 ff ff    	lea    -0x6863(%eax),%edx
  10491b:	52                   	push   %edx
  10491c:	89 c3                	mov    %eax,%ebx
  10491e:	e8 75 e1 ff ff       	call   102a98 <debug_info>
  104923:	83 c4 10             	add    $0x10,%esp
  104926:	90                   	nop
  104927:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10492a:	c9                   	leave
  10492b:	c3                   	ret

0010492c <syscall_handler>:
  10492c:	55                   	push   %ebp
  10492d:	89 e5                	mov    %esp,%ebp
  10492f:	53                   	push   %ebx
  104930:	83 ec 14             	sub    $0x14,%esp
  104933:	e8 80 ba ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  104938:	05 bc b6 00 00       	add    $0xb6bc,%eax
  10493d:	8b 55 08             	mov    0x8(%ebp),%edx
  104940:	8b 52 1c             	mov    0x1c(%edx),%edx
  104943:	89 55 f4             	mov    %edx,-0xc(%ebp)
  104946:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
  10494a:	75 2a                	jne    104976 <syscall_handler+0x4a>
  10494c:	8b 55 08             	mov    0x8(%ebp),%edx
  10494f:	8b 52 10             	mov    0x10(%edx),%edx
  104952:	89 55 f0             	mov    %edx,-0x10(%ebp)
  104955:	c7 c2 2c cc 15 00    	mov    $0x15cc2c,%edx
  10495b:	8b 12                	mov    (%edx),%edx
  10495d:	83 ec 08             	sub    $0x8,%esp
  104960:	ff 75 f0             	push   -0x10(%ebp)
  104963:	52                   	push   %edx
  104964:	89 c3                	mov    %eax,%ebx
  104966:	e8 95 3b 00 00       	call   108500 <sys_brk>
  10496b:	83 c4 10             	add    $0x10,%esp
  10496e:	8b 55 08             	mov    0x8(%ebp),%edx
  104971:	89 42 1c             	mov    %eax,0x1c(%edx)
  104974:	eb 28                	jmp    10499e <syscall_handler+0x72>
  104976:	8b 55 08             	mov    0x8(%ebp),%edx
  104979:	c7 42 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%edx)
  104980:	ff 75 f4             	push   -0xc(%ebp)
  104983:	8d 90 aa 97 ff ff    	lea    -0x6856(%eax),%edx
  104989:	52                   	push   %edx
  10498a:	6a 52                	push   $0x52
  10498c:	8d 90 b5 95 ff ff    	lea    -0x6a4b(%eax),%edx
  104992:	52                   	push   %edx
  104993:	89 c3                	mov    %eax,%ebx
  104995:	e8 2f e1 ff ff       	call   102ac9 <debug_normal>
  10499a:	83 c4 10             	add    $0x10,%esp
  10499d:	90                   	nop
  10499e:	90                   	nop
  10499f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1049a2:	c9                   	leave
  1049a3:	c3                   	ret

001049a4 <trap>:
  1049a4:	55                   	push   %ebp
  1049a5:	89 e5                	mov    %esp,%ebp
  1049a7:	53                   	push   %ebx
  1049a8:	83 ec 04             	sub    $0x4,%esp
  1049ab:	e8 10 ba ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1049b0:	81 c3 44 b6 00 00    	add    $0xb644,%ebx
  1049b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1049b9:	8b 40 28             	mov    0x28(%eax),%eax
  1049bc:	83 f8 0e             	cmp    $0xe,%eax
  1049bf:	75 1d                	jne    1049de <trap+0x3a>
  1049c1:	83 ec 0c             	sub    $0xc,%esp
  1049c4:	6a 00                	push   $0x0
  1049c6:	e8 a5 23 00 00       	call   106d70 <set_pdir_base>
  1049cb:	83 c4 10             	add    $0x10,%esp
  1049ce:	83 ec 0c             	sub    $0xc,%esp
  1049d1:	ff 75 08             	push   0x8(%ebp)
  1049d4:	e8 7e fe ff ff       	call   104857 <pgflt_handler>
  1049d9:	83 c4 10             	add    $0x10,%esp
  1049dc:	eb 70                	jmp    104a4e <trap+0xaa>
  1049de:	8b 45 08             	mov    0x8(%ebp),%eax
  1049e1:	8b 40 28             	mov    0x28(%eax),%eax
  1049e4:	83 f8 30             	cmp    $0x30,%eax
  1049e7:	75 1d                	jne    104a06 <trap+0x62>
  1049e9:	83 ec 0c             	sub    $0xc,%esp
  1049ec:	6a 00                	push   $0x0
  1049ee:	e8 7d 23 00 00       	call   106d70 <set_pdir_base>
  1049f3:	83 c4 10             	add    $0x10,%esp
  1049f6:	83 ec 0c             	sub    $0xc,%esp
  1049f9:	ff 75 08             	push   0x8(%ebp)
  1049fc:	e8 2b ff ff ff       	call   10492c <syscall_handler>
  104a01:	83 c4 10             	add    $0x10,%esp
  104a04:	eb 48                	jmp    104a4e <trap+0xaa>
  104a06:	8b 45 08             	mov    0x8(%ebp),%eax
  104a09:	8b 40 28             	mov    0x28(%eax),%eax
  104a0c:	50                   	push   %eax
  104a0d:	8d 83 bf 97 ff ff    	lea    -0x6841(%ebx),%eax
  104a13:	50                   	push   %eax
  104a14:	6a 60                	push   $0x60
  104a16:	8d 83 b5 95 ff ff    	lea    -0x6a4b(%ebx),%eax
  104a1c:	50                   	push   %eax
  104a1d:	e8 a7 e0 ff ff       	call   102ac9 <debug_normal>
  104a22:	83 c4 10             	add    $0x10,%esp
  104a25:	83 ec 0c             	sub    $0xc,%esp
  104a28:	ff 75 08             	push   0x8(%ebp)
  104a2b:	e8 b6 fb ff ff       	call   1045e6 <trap_dump>
  104a30:	83 c4 10             	add    $0x10,%esp
  104a33:	83 ec 04             	sub    $0x4,%esp
  104a36:	8d 83 d3 97 ff ff    	lea    -0x682d(%ebx),%eax
  104a3c:	50                   	push   %eax
  104a3d:	6a 62                	push   $0x62
  104a3f:	8d 83 b5 95 ff ff    	lea    -0x6a4b(%ebx),%eax
  104a45:	50                   	push   %eax
  104a46:	e8 39 e1 ff ff       	call   102b84 <debug_panic>
  104a4b:	83 c4 10             	add    $0x10,%esp
  104a4e:	c7 c0 2c cc 15 00    	mov    $0x15cc2c,%eax
  104a54:	8b 00                	mov    (%eax),%eax
  104a56:	83 ec 0c             	sub    $0xc,%esp
  104a59:	50                   	push   %eax
  104a5a:	e8 11 23 00 00       	call   106d70 <set_pdir_base>
  104a5f:	83 c4 10             	add    $0x10,%esp
  104a62:	83 ec 0c             	sub    $0xc,%esp
  104a65:	ff 75 08             	push   0x8(%ebp)
  104a68:	e8 63 dd ff ff       	call   1027d0 <trap_return>
  104a6d:	83 c4 10             	add    $0x10,%esp
  104a70:	90                   	nop
  104a71:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104a74:	c9                   	leave
  104a75:	c3                   	ret
  104a76:	66 90                	xchg   %ax,%ax
  104a78:	66 90                	xchg   %ax,%ax
  104a7a:	66 90                	xchg   %ax,%ax
  104a7c:	66 90                	xchg   %ax,%ax
  104a7e:	66 90                	xchg   %ax,%ax

00104a80 <kern_init>:
    monitor(NULL);
#endif
}

void kern_init(uintptr_t mbi_addr)
{
  104a80:	56                   	push   %esi
  104a81:	53                   	push   %ebx
  104a82:	e8 39 b9 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  104a87:	81 c3 6d b5 00 00    	add    $0xb56d,%ebx
  104a8d:	83 ec 10             	sub    $0x10,%esp
#ifdef TEST
    pdir_init_kern(mbi_addr);
  104a90:	ff 74 24 1c          	push   0x1c(%esp)
  104a94:	e8 87 31 00 00       	call   107c20 <pdir_init_kern>
#else
    paging_init(mbi_addr);
#endif

    KERN_DEBUG("Kernel initialized.\n");
  104a99:	8d b3 ef 97 ff ff    	lea    -0x6811(%ebx),%esi
  104a9f:	83 c4 0c             	add    $0xc,%esp
  104aa2:	8d 83 da 97 ff ff    	lea    -0x6826(%ebx),%eax
  104aa8:	50                   	push   %eax
  104aa9:	6a 5e                	push   $0x5e
  104aab:	56                   	push   %esi
  104aac:	e8 18 e0 ff ff       	call   102ac9 <debug_normal>
    KERN_DEBUG("In kernel main.\n\n");
  104ab1:	83 c4 0c             	add    $0xc,%esp
  104ab4:	8d 83 00 98 ff ff    	lea    -0x6800(%ebx),%eax
  104aba:	50                   	push   %eax
  104abb:	6a 17                	push   $0x17
  104abd:	56                   	push   %esi
  104abe:	e8 06 e0 ff ff       	call   102ac9 <debug_normal>
    dprintf("Testing the MATIntro layer...\n");
  104ac3:	8d 83 7c 9c ff ff    	lea    -0x6384(%ebx),%eax
  104ac9:	89 04 24             	mov    %eax,(%esp)
  104acc:	e8 cb e2 ff ff       	call   102d9c <dprintf>
    if (test_MATIntro() == 0)
  104ad1:	e8 9a 09 00 00       	call   105470 <test_MATIntro>
  104ad6:	83 c4 10             	add    $0x10,%esp
  104ad9:	84 c0                	test   %al,%al
  104adb:	0f 85 bf 01 00 00    	jne    104ca0 <kern_init+0x220>
        dprintf("All tests passed.\n");
  104ae1:	83 ec 0c             	sub    $0xc,%esp
  104ae4:	8d 83 12 98 ff ff    	lea    -0x67ee(%ebx),%eax
  104aea:	50                   	push   %eax
  104aeb:	e8 ac e2 ff ff       	call   102d9c <dprintf>
  104af0:	83 c4 10             	add    $0x10,%esp
    dprintf("\n");
  104af3:	83 ec 0c             	sub    $0xc,%esp
  104af6:	8d b3 10 98 ff ff    	lea    -0x67f0(%ebx),%esi
  104afc:	56                   	push   %esi
  104afd:	e8 9a e2 ff ff       	call   102d9c <dprintf>
    dprintf("Testing the MATOp layer...\n");
  104b02:	8d 83 33 98 ff ff    	lea    -0x67cd(%ebx),%eax
  104b08:	89 04 24             	mov    %eax,(%esp)
  104b0b:	e8 8c e2 ff ff       	call   102d9c <dprintf>
    if (test_MATOp() == 0)
  104b10:	e8 eb 17 00 00       	call   106300 <test_MATOp>
  104b15:	83 c4 10             	add    $0x10,%esp
  104b18:	84 c0                	test   %al,%al
  104b1a:	0f 85 50 02 00 00    	jne    104d70 <kern_init+0x2f0>
        dprintf("All tests passed.\n");
  104b20:	83 ec 0c             	sub    $0xc,%esp
  104b23:	8d 83 12 98 ff ff    	lea    -0x67ee(%ebx),%eax
  104b29:	50                   	push   %eax
  104b2a:	e8 6d e2 ff ff       	call   102d9c <dprintf>
  104b2f:	83 c4 10             	add    $0x10,%esp
    dprintf("\n");
  104b32:	83 ec 0c             	sub    $0xc,%esp
  104b35:	56                   	push   %esi
  104b36:	e8 61 e2 ff ff       	call   102d9c <dprintf>
    dprintf("Testing the MContainer layer...\n");
  104b3b:	8d 83 9c 9c ff ff    	lea    -0x6364(%ebx),%eax
  104b41:	89 04 24             	mov    %eax,(%esp)
  104b44:	e8 53 e2 ff ff       	call   102d9c <dprintf>
    if (test_MContainer() == 0)
  104b49:	e8 e2 21 00 00       	call   106d30 <test_MContainer>
  104b4e:	83 c4 10             	add    $0x10,%esp
  104b51:	84 c0                	test   %al,%al
  104b53:	0f 85 f7 01 00 00    	jne    104d50 <kern_init+0x2d0>
        dprintf("All tests passed.\n");
  104b59:	83 ec 0c             	sub    $0xc,%esp
  104b5c:	8d 83 12 98 ff ff    	lea    -0x67ee(%ebx),%eax
  104b62:	50                   	push   %eax
  104b63:	e8 34 e2 ff ff       	call   102d9c <dprintf>
  104b68:	83 c4 10             	add    $0x10,%esp
    dprintf("\n");
  104b6b:	83 ec 0c             	sub    $0xc,%esp
  104b6e:	56                   	push   %esi
  104b6f:	e8 28 e2 ff ff       	call   102d9c <dprintf>
    dprintf("Testing the MPTIntro layer...\n");
  104b74:	8d 83 c0 9c ff ff    	lea    -0x6340(%ebx),%eax
  104b7a:	89 04 24             	mov    %eax,(%esp)
  104b7d:	e8 1a e2 ff ff       	call   102d9c <dprintf>
    if (test_MPTIntro() == 0)
  104b82:	e8 d9 28 00 00       	call   107460 <test_MPTIntro>
  104b87:	83 c4 10             	add    $0x10,%esp
  104b8a:	84 c0                	test   %al,%al
  104b8c:	0f 85 9e 01 00 00    	jne    104d30 <kern_init+0x2b0>
        dprintf("All tests passed.\n");
  104b92:	83 ec 0c             	sub    $0xc,%esp
  104b95:	8d 83 12 98 ff ff    	lea    -0x67ee(%ebx),%eax
  104b9b:	50                   	push   %eax
  104b9c:	e8 fb e1 ff ff       	call   102d9c <dprintf>
  104ba1:	83 c4 10             	add    $0x10,%esp
    dprintf("\n");
  104ba4:	83 ec 0c             	sub    $0xc,%esp
  104ba7:	56                   	push   %esi
  104ba8:	e8 ef e1 ff ff       	call   102d9c <dprintf>
    dprintf("Testing the MPTOp layer...\n");
  104bad:	8d 83 4f 98 ff ff    	lea    -0x67b1(%ebx),%eax
  104bb3:	89 04 24             	mov    %eax,(%esp)
  104bb6:	e8 e1 e1 ff ff       	call   102d9c <dprintf>
    if (test_MPTOp() == 0)
  104bbb:	e8 00 2d 00 00       	call   1078c0 <test_MPTOp>
  104bc0:	83 c4 10             	add    $0x10,%esp
  104bc3:	84 c0                	test   %al,%al
  104bc5:	0f 85 45 01 00 00    	jne    104d10 <kern_init+0x290>
        dprintf("All tests passed.\n");
  104bcb:	83 ec 0c             	sub    $0xc,%esp
  104bce:	8d 83 12 98 ff ff    	lea    -0x67ee(%ebx),%eax
  104bd4:	50                   	push   %eax
  104bd5:	e8 c2 e1 ff ff       	call   102d9c <dprintf>
  104bda:	83 c4 10             	add    $0x10,%esp
    dprintf("\n");
  104bdd:	83 ec 0c             	sub    $0xc,%esp
  104be0:	56                   	push   %esi
  104be1:	e8 b6 e1 ff ff       	call   102d9c <dprintf>
    dprintf("Testing the MPTComm layer...\n");
  104be6:	8d 83 6b 98 ff ff    	lea    -0x6795(%ebx),%eax
  104bec:	89 04 24             	mov    %eax,(%esp)
  104bef:	e8 a8 e1 ff ff       	call   102d9c <dprintf>
    if (test_MPTComm() == 0)
  104bf4:	e8 07 30 00 00       	call   107c00 <test_MPTComm>
  104bf9:	83 c4 10             	add    $0x10,%esp
  104bfc:	84 c0                	test   %al,%al
  104bfe:	0f 85 ec 00 00 00    	jne    104cf0 <kern_init+0x270>
        dprintf("All tests passed.\n");
  104c04:	83 ec 0c             	sub    $0xc,%esp
  104c07:	8d 83 12 98 ff ff    	lea    -0x67ee(%ebx),%eax
  104c0d:	50                   	push   %eax
  104c0e:	e8 89 e1 ff ff       	call   102d9c <dprintf>
  104c13:	83 c4 10             	add    $0x10,%esp
    dprintf("\n");
  104c16:	83 ec 0c             	sub    $0xc,%esp
  104c19:	56                   	push   %esi
  104c1a:	e8 7d e1 ff ff       	call   102d9c <dprintf>
    dprintf("Testing the MPTKern layer...\n");
  104c1f:	8d 83 89 98 ff ff    	lea    -0x6777(%ebx),%eax
  104c25:	89 04 24             	mov    %eax,(%esp)
  104c28:	e8 6f e1 ff ff       	call   102d9c <dprintf>
    if (test_MPTKern() == 0)
  104c2d:	e8 4e 35 00 00       	call   108180 <test_MPTKern>
  104c32:	83 c4 10             	add    $0x10,%esp
  104c35:	84 c0                	test   %al,%al
  104c37:	0f 85 9b 00 00 00    	jne    104cd8 <kern_init+0x258>
        dprintf("All tests passed.\n");
  104c3d:	83 ec 0c             	sub    $0xc,%esp
  104c40:	8d 83 12 98 ff ff    	lea    -0x67ee(%ebx),%eax
  104c46:	50                   	push   %eax
  104c47:	e8 50 e1 ff ff       	call   102d9c <dprintf>
  104c4c:	83 c4 10             	add    $0x10,%esp
    dprintf("\n");
  104c4f:	83 ec 0c             	sub    $0xc,%esp
  104c52:	56                   	push   %esi
  104c53:	e8 44 e1 ff ff       	call   102d9c <dprintf>
    dprintf("Testing the MPTNew layer...\n");
  104c58:	8d 83 a7 98 ff ff    	lea    -0x6759(%ebx),%eax
  104c5e:	89 04 24             	mov    %eax,(%esp)
  104c61:	e8 36 e1 ff ff       	call   102d9c <dprintf>
    if (test_MPTNew() == 0)
  104c66:	e8 75 3e 00 00       	call   108ae0 <test_MPTNew>
  104c6b:	83 c4 10             	add    $0x10,%esp
  104c6e:	84 c0                	test   %al,%al
  104c70:	75 4e                	jne    104cc0 <kern_init+0x240>
        dprintf("All tests passed.\n");
  104c72:	83 ec 0c             	sub    $0xc,%esp
  104c75:	8d 83 12 98 ff ff    	lea    -0x67ee(%ebx),%eax
  104c7b:	50                   	push   %eax
  104c7c:	e8 1b e1 ff ff       	call   102d9c <dprintf>
  104c81:	83 c4 10             	add    $0x10,%esp
    dprintf("\nTest complete. Please Use Ctrl-a x to exit qemu.");
  104c84:	83 ec 0c             	sub    $0xc,%esp
  104c87:	8d 83 e0 9c ff ff    	lea    -0x6320(%ebx),%eax
  104c8d:	50                   	push   %eax
  104c8e:	e8 09 e1 ff ff       	call   102d9c <dprintf>

    kern_main();
}
  104c93:	83 c4 14             	add    $0x14,%esp
  104c96:	5b                   	pop    %ebx
  104c97:	5e                   	pop    %esi
  104c98:	c3                   	ret
  104c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        dprintf("Test failed.\n");
  104ca0:	83 ec 0c             	sub    $0xc,%esp
  104ca3:	8d 83 25 98 ff ff    	lea    -0x67db(%ebx),%eax
  104ca9:	50                   	push   %eax
  104caa:	e8 ed e0 ff ff       	call   102d9c <dprintf>
  104caf:	83 c4 10             	add    $0x10,%esp
  104cb2:	e9 3c fe ff ff       	jmp    104af3 <kern_init+0x73>
  104cb7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104cbe:	00 
  104cbf:	90                   	nop
        dprintf("Test failed.\n");
  104cc0:	83 ec 0c             	sub    $0xc,%esp
  104cc3:	8d 83 25 98 ff ff    	lea    -0x67db(%ebx),%eax
  104cc9:	50                   	push   %eax
  104cca:	e8 cd e0 ff ff       	call   102d9c <dprintf>
  104ccf:	83 c4 10             	add    $0x10,%esp
  104cd2:	eb b0                	jmp    104c84 <kern_init+0x204>
  104cd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        dprintf("Test failed.\n");
  104cd8:	83 ec 0c             	sub    $0xc,%esp
  104cdb:	8d 83 25 98 ff ff    	lea    -0x67db(%ebx),%eax
  104ce1:	50                   	push   %eax
  104ce2:	e8 b5 e0 ff ff       	call   102d9c <dprintf>
  104ce7:	83 c4 10             	add    $0x10,%esp
  104cea:	e9 60 ff ff ff       	jmp    104c4f <kern_init+0x1cf>
  104cef:	90                   	nop
        dprintf("Test failed.\n");
  104cf0:	83 ec 0c             	sub    $0xc,%esp
  104cf3:	8d 83 25 98 ff ff    	lea    -0x67db(%ebx),%eax
  104cf9:	50                   	push   %eax
  104cfa:	e8 9d e0 ff ff       	call   102d9c <dprintf>
  104cff:	83 c4 10             	add    $0x10,%esp
  104d02:	e9 0f ff ff ff       	jmp    104c16 <kern_init+0x196>
  104d07:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104d0e:	00 
  104d0f:	90                   	nop
        dprintf("Test failed.\n");
  104d10:	83 ec 0c             	sub    $0xc,%esp
  104d13:	8d 83 25 98 ff ff    	lea    -0x67db(%ebx),%eax
  104d19:	50                   	push   %eax
  104d1a:	e8 7d e0 ff ff       	call   102d9c <dprintf>
  104d1f:	83 c4 10             	add    $0x10,%esp
  104d22:	e9 b6 fe ff ff       	jmp    104bdd <kern_init+0x15d>
  104d27:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104d2e:	00 
  104d2f:	90                   	nop
        dprintf("Test failed.\n");
  104d30:	83 ec 0c             	sub    $0xc,%esp
  104d33:	8d 83 25 98 ff ff    	lea    -0x67db(%ebx),%eax
  104d39:	50                   	push   %eax
  104d3a:	e8 5d e0 ff ff       	call   102d9c <dprintf>
  104d3f:	83 c4 10             	add    $0x10,%esp
  104d42:	e9 5d fe ff ff       	jmp    104ba4 <kern_init+0x124>
  104d47:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104d4e:	00 
  104d4f:	90                   	nop
        dprintf("Test failed.\n");
  104d50:	83 ec 0c             	sub    $0xc,%esp
  104d53:	8d 83 25 98 ff ff    	lea    -0x67db(%ebx),%eax
  104d59:	50                   	push   %eax
  104d5a:	e8 3d e0 ff ff       	call   102d9c <dprintf>
  104d5f:	83 c4 10             	add    $0x10,%esp
  104d62:	e9 04 fe ff ff       	jmp    104b6b <kern_init+0xeb>
  104d67:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104d6e:	00 
  104d6f:	90                   	nop
        dprintf("Test failed.\n");
  104d70:	83 ec 0c             	sub    $0xc,%esp
  104d73:	8d 83 25 98 ff ff    	lea    -0x67db(%ebx),%eax
  104d79:	50                   	push   %eax
  104d7a:	e8 1d e0 ff ff       	call   102d9c <dprintf>
  104d7f:	83 c4 10             	add    $0x10,%esp
  104d82:	e9 ab fd ff ff       	jmp    104b32 <kern_init+0xb2>
  104d87:	90                   	nop
  104d88:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
  104d8e:	00 00                	add    %al,(%eax)
  104d90:	fb                   	sti
  104d91:	4f                   	dec    %edi
  104d92:	52                   	push   %edx
  104d93:	e4                   	.byte 0xe4

00104d94 <start>:
  104d94:	fa                   	cli
  104d95:	3d 02 b0 ad 2b       	cmp    $0x2badb002,%eax
  104d9a:	75 27                	jne    104dc3 <spin>
  104d9c:	89 1d c4 4d 10 00    	mov    %ebx,0x104dc4
  104da2:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
  104da9:	34 12 
  104dab:	6a 02                	push   $0x2
  104dad:	9d                   	popf
  104dae:	bd 00 00 00 00       	mov    $0x0,%ebp
  104db3:	bc 00 90 11 00       	mov    $0x119000,%esp
  104db8:	ff 35 c4 4d 10 00    	push   0x104dc4
  104dbe:	e8 bd fc ff ff       	call   104a80 <kern_init>

00104dc3 <spin>:
  104dc3:	f4                   	hlt

00104dc4 <multiboot_ptr>:
  104dc4:	00 00                	add    %al,(%eax)
  104dc6:	00 00                	add    %al,(%eax)
  104dc8:	66 90                	xchg   %ax,%ax
  104dca:	66 90                	xchg   %ax,%ax
  104dcc:	66 90                	xchg   %ax,%ax
  104dce:	66 90                	xchg   %ax,%ax

00104dd0 <get_nps>:
static struct ATStruct AT[1 << 20];

// The getter function for NUM_PAGES.
unsigned int get_nps(void)
{
    return NUM_PAGES;
  104dd0:	e8 e3 b5 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  104dd5:	05 1f b2 00 00       	add    $0xb21f,%eax
  104dda:	8b 80 4c cc 04 01    	mov    0x104cc4c(%eax),%eax
}
  104de0:	c3                   	ret
  104de1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104de8:	00 
  104de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104df0 <set_nps>:

// The setter function for NUM_PAGES.
void set_nps(unsigned int nps)
{
    NUM_PAGES = nps;
  104df0:	e8 c3 b5 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  104df5:	05 ff b1 00 00       	add    $0xb1ff,%eax
  104dfa:	8b 54 24 04          	mov    0x4(%esp),%edx
  104dfe:	89 90 4c cc 04 01    	mov    %edx,0x104cc4c(%eax)
}
  104e04:	c3                   	ret
  104e05:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104e0c:	00 
  104e0d:	8d 76 00             	lea    0x0(%esi),%esi

00104e10 <at_is_norm>:
 * If the page with the given index has the normal permission,
 * then returns 1, otherwise returns 0.
 */
unsigned int at_is_norm(unsigned int page_index)
{
    if (AT[page_index].perm > 1) return 1;
  104e10:	e8 a7 b5 ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  104e15:	81 c2 df b1 00 00    	add    $0xb1df,%edx
  104e1b:	8b 44 24 04          	mov    0x4(%esp),%eax
  104e1f:	c1 e0 04             	shl    $0x4,%eax
  104e22:	83 bc 02 4c cc 04 00 	cmpl   $0x1,0x4cc4c(%edx,%eax,1)
  104e29:	01 
  104e2a:	0f 97 c0             	seta   %al
  104e2d:	0f b6 c0             	movzbl %al,%eax
    else return 0;
}
  104e30:	c3                   	ret
  104e31:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104e38:	00 
  104e39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104e40 <at_set_perm>:
 * Sets the permission of the page with given index.
 * It also marks the page as unallocated.
 */
void at_set_perm(unsigned int page_index, unsigned int perm)
{
    AT[page_index].perm = perm;
  104e40:	e8 77 b5 ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  104e45:	81 c2 af b1 00 00    	add    $0xb1af,%edx
  104e4b:	8b 44 24 04          	mov    0x4(%esp),%eax
  104e4f:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  104e53:	c1 e0 04             	shl    $0x4,%eax
  104e56:	89 8c 02 4c cc 04 00 	mov    %ecx,0x4cc4c(%edx,%eax,1)
}
  104e5d:	c3                   	ret
  104e5e:	66 90                	xchg   %ax,%ax

00104e60 <at_is_allocated>:
 * The getter function for the physical page allocation flag.
 * Returns 0 if the page is not allocated, otherwise returns 1.
 */
unsigned int at_is_allocated(unsigned int page_index)
{
    if (AT[page_index].allocated == 0) return 0;
  104e60:	e8 57 b5 ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  104e65:	81 c2 8f b1 00 00    	add    $0xb18f,%edx
  104e6b:	8b 44 24 04          	mov    0x4(%esp),%eax
  104e6f:	c1 e0 04             	shl    $0x4,%eax
  104e72:	8b 84 02 50 cc 04 00 	mov    0x4cc50(%edx,%eax,1),%eax
  104e79:	85 c0                	test   %eax,%eax
  104e7b:	0f 95 c0             	setne  %al
  104e7e:	0f b6 c0             	movzbl %al,%eax
    else return 1;
}
  104e81:	c3                   	ret
  104e82:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104e89:	00 
  104e8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104e90 <at_set_allocated>:
 * The setter function for the physical page allocation flag.
 * Set the flag of the page with given index to the given value.
 */
void at_set_allocated(unsigned int page_index, unsigned int allocated)
{
    AT[page_index].allocated = allocated;
  104e90:	e8 27 b5 ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  104e95:	81 c2 5f b1 00 00    	add    $0xb15f,%edx
  104e9b:	8b 44 24 04          	mov    0x4(%esp),%eax
  104e9f:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  104ea3:	c1 e0 04             	shl    $0x4,%eax
  104ea6:	89 8c 02 50 cc 04 00 	mov    %ecx,0x4cc50(%edx,%eax,1)
}
  104ead:	c3                   	ret
  104eae:	66 90                	xchg   %ax,%ax

00104eb0 <at_get_order>:
 * The getter function for the buddy order of a page.
 * Returns the buddy order stored for the given page index.
 */
unsigned int at_get_order(unsigned int page_index)
{
    return AT[page_index].order;
  104eb0:	e8 07 b5 ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  104eb5:	81 c2 3f b1 00 00    	add    $0xb13f,%edx
  104ebb:	8b 44 24 04          	mov    0x4(%esp),%eax
  104ebf:	c1 e0 04             	shl    $0x4,%eax
  104ec2:	8b 84 02 54 cc 04 00 	mov    0x4cc54(%edx,%eax,1),%eax
}
  104ec9:	c3                   	ret
  104eca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104ed0 <at_set_order>:
/**
 * The setter function for the buddy order of a page.
 */
void at_set_order(unsigned int page_index, unsigned int order)
{
    AT[page_index].order = order;
  104ed0:	e8 e7 b4 ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  104ed5:	81 c2 1f b1 00 00    	add    $0xb11f,%edx
  104edb:	8b 44 24 04          	mov    0x4(%esp),%eax
  104edf:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  104ee3:	c1 e0 04             	shl    $0x4,%eax
  104ee6:	89 8c 02 54 cc 04 00 	mov    %ecx,0x4cc54(%edx,%eax,1)
}
  104eed:	c3                   	ret
  104eee:	66 90                	xchg   %ax,%ax

00104ef0 <at_is_head>:
 * The getter function for the head flag of a page.
 * Returns 1 if the page is a block head, 0 otherwise.
 */
unsigned int at_is_head(unsigned int page_index)
{
    return AT[page_index].is_head;
  104ef0:	e8 c7 b4 ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  104ef5:	81 c2 ff b0 00 00    	add    $0xb0ff,%edx
  104efb:	8b 44 24 04          	mov    0x4(%esp),%eax
  104eff:	c1 e0 04             	shl    $0x4,%eax
  104f02:	8b 84 02 58 cc 04 00 	mov    0x4cc58(%edx,%eax,1),%eax
}
  104f09:	c3                   	ret
  104f0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104f10 <at_set_head>:
/**
 * The setter function for the head flag of a page.
 */
void at_set_head(unsigned int page_index, unsigned int head)
{
    AT[page_index].is_head = head;
  104f10:	e8 a7 b4 ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  104f15:	81 c2 df b0 00 00    	add    $0xb0df,%edx
  104f1b:	8b 44 24 04          	mov    0x4(%esp),%eax
  104f1f:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  104f23:	c1 e0 04             	shl    $0x4,%eax
  104f26:	89 8c 02 58 cc 04 00 	mov    %ecx,0x4cc58(%edx,%eax,1)
}
  104f2d:	c3                   	ret
  104f2e:	66 90                	xchg   %ax,%ax

00104f30 <MATIntro_test1>:
#include <lib/debug.h>
#include "export.h"

int MATIntro_test1()
{
  104f30:	55                   	push   %ebp
  104f31:	57                   	push   %edi
  104f32:	56                   	push   %esi
    int rn10[] = { 1, 3, 5, 6, 78, 3576, 32, 8, 0, 100 };
    int i;
    int nps = get_nps();
    for (i = 0; i < 10; i++) {
  104f33:	31 f6                	xor    %esi,%esi
{
  104f35:	53                   	push   %ebx
  104f36:	e8 85 b4 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  104f3b:	81 c3 b9 b0 00 00    	add    $0xb0b9,%ebx
  104f41:	83 ec 4c             	sub    $0x4c,%esp
    int rn10[] = { 1, 3, 5, 6, 78, 3576, 32, 8, 0, 100 };
  104f44:	c7 44 24 18 01 00 00 	movl   $0x1,0x18(%esp)
  104f4b:	00 
  104f4c:	8d 7c 24 18          	lea    0x18(%esp),%edi
  104f50:	c7 44 24 1c 03 00 00 	movl   $0x3,0x1c(%esp)
  104f57:	00 
  104f58:	c7 44 24 20 05 00 00 	movl   $0x5,0x20(%esp)
  104f5f:	00 
  104f60:	c7 44 24 24 06 00 00 	movl   $0x6,0x24(%esp)
  104f67:	00 
  104f68:	c7 44 24 28 4e 00 00 	movl   $0x4e,0x28(%esp)
  104f6f:	00 
  104f70:	c7 44 24 2c f8 0d 00 	movl   $0xdf8,0x2c(%esp)
  104f77:	00 
  104f78:	c7 44 24 30 20 00 00 	movl   $0x20,0x30(%esp)
  104f7f:	00 
  104f80:	c7 44 24 34 08 00 00 	movl   $0x8,0x34(%esp)
  104f87:	00 
  104f88:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%esp)
  104f8f:	00 
  104f90:	c7 44 24 3c 64 00 00 	movl   $0x64,0x3c(%esp)
  104f97:	00 
    int nps = get_nps();
  104f98:	e8 33 fe ff ff       	call   104dd0 <get_nps>
  104f9d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    for (i = 0; i < 10; i++) {
  104fa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        set_nps(rn10[i]);
  104fa8:	8b 2c b7             	mov    (%edi,%esi,4),%ebp
  104fab:	83 ec 0c             	sub    $0xc,%esp
  104fae:	55                   	push   %ebp
  104faf:	e8 3c fe ff ff       	call   104df0 <set_nps>
        if (get_nps() != rn10[i]) {
  104fb4:	e8 17 fe ff ff       	call   104dd0 <get_nps>
  104fb9:	83 c4 10             	add    $0x10,%esp
  104fbc:	39 c5                	cmp    %eax,%ebp
  104fbe:	75 30                	jne    104ff0 <MATIntro_test1+0xc0>
    for (i = 0; i < 10; i++) {
  104fc0:	83 c6 01             	add    $0x1,%esi
  104fc3:	83 fe 0a             	cmp    $0xa,%esi
  104fc6:	75 e0                	jne    104fa8 <MATIntro_test1+0x78>
            dprintf("test 1.1 failed (i = %d): (%d != %d)\n", i, get_nps(), rn10[i]);
            set_nps(nps);
            return 1;
        }
    }
    set_nps(nps);
  104fc8:	83 ec 0c             	sub    $0xc,%esp
  104fcb:	ff 74 24 18          	push   0x18(%esp)
  104fcf:	e8 1c fe ff ff       	call   104df0 <set_nps>
    dprintf("test 1 passed.\n");
  104fd4:	8d 83 c4 98 ff ff    	lea    -0x673c(%ebx),%eax
  104fda:	89 04 24             	mov    %eax,(%esp)
  104fdd:	e8 ba dd ff ff       	call   102d9c <dprintf>
    return 0;
  104fe2:	83 c4 10             	add    $0x10,%esp
  104fe5:	31 c0                	xor    %eax,%eax
}
  104fe7:	83 c4 4c             	add    $0x4c,%esp
  104fea:	5b                   	pop    %ebx
  104feb:	5e                   	pop    %esi
  104fec:	5f                   	pop    %edi
  104fed:	5d                   	pop    %ebp
  104fee:	c3                   	ret
  104fef:	90                   	nop
            dprintf("test 1.1 failed (i = %d): (%d != %d)\n", i, get_nps(), rn10[i]);
  104ff0:	e8 db fd ff ff       	call   104dd0 <get_nps>
  104ff5:	55                   	push   %ebp
  104ff6:	50                   	push   %eax
  104ff7:	8d 83 14 9d ff ff    	lea    -0x62ec(%ebx),%eax
  104ffd:	56                   	push   %esi
  104ffe:	50                   	push   %eax
  104fff:	e8 98 dd ff ff       	call   102d9c <dprintf>
            set_nps(nps);
  105004:	58                   	pop    %eax
  105005:	ff 74 24 18          	push   0x18(%esp)
  105009:	e8 e2 fd ff ff       	call   104df0 <set_nps>
            return 1;
  10500e:	83 c4 10             	add    $0x10,%esp
  105011:	b8 01 00 00 00       	mov    $0x1,%eax
}
  105016:	83 c4 4c             	add    $0x4c,%esp
  105019:	5b                   	pop    %ebx
  10501a:	5e                   	pop    %esi
  10501b:	5f                   	pop    %edi
  10501c:	5d                   	pop    %ebp
  10501d:	c3                   	ret
  10501e:	66 90                	xchg   %ax,%ax

00105020 <MATIntro_test2>:

int MATIntro_test2()
{
  105020:	56                   	push   %esi
  105021:	53                   	push   %ebx
  105022:	e8 99 b3 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  105027:	81 c3 cd af 00 00    	add    $0xafcd,%ebx
  10502d:	83 ec 0c             	sub    $0xc,%esp
    at_set_perm(0, 0);
  105030:	6a 00                	push   $0x0
  105032:	6a 00                	push   $0x0
  105034:	e8 07 fe ff ff       	call   104e40 <at_set_perm>
    if (at_is_norm(0) != 0 || at_is_allocated(0) != 0) {
  105039:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  105040:	e8 cb fd ff ff       	call   104e10 <at_is_norm>
  105045:	83 c4 10             	add    $0x10,%esp
  105048:	85 c0                	test   %eax,%eax
  10504a:	75 11                	jne    10505d <MATIntro_test2+0x3d>
  10504c:	83 ec 0c             	sub    $0xc,%esp
  10504f:	6a 00                	push   $0x0
  105051:	e8 0a fe ff ff       	call   104e60 <at_is_allocated>
  105056:	83 c4 10             	add    $0x10,%esp
  105059:	85 c0                	test   %eax,%eax
  10505b:	74 43                	je     1050a0 <MATIntro_test2+0x80>
        dprintf("test 2.1 failed: (%d != 0 || %d != 0)\n", at_is_norm(0), at_is_allocated(0));
  10505d:	83 ec 0c             	sub    $0xc,%esp
  105060:	6a 00                	push   $0x0
  105062:	e8 f9 fd ff ff       	call   104e60 <at_is_allocated>
  105067:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10506e:	89 c6                	mov    %eax,%esi
  105070:	e8 9b fd ff ff       	call   104e10 <at_is_norm>
  105075:	83 c4 0c             	add    $0xc,%esp
  105078:	56                   	push   %esi
  105079:	50                   	push   %eax
  10507a:	8d 83 3c 9d ff ff    	lea    -0x62c4(%ebx),%eax
        at_set_perm(0, 0);
        return 1;
    }
    at_set_perm(0, 1);
    if (at_is_norm(0) != 0 || at_is_allocated(0) != 0) {
        dprintf("test 2.2 failed: (%d != 0 || %d != 0)\n", at_is_norm(0), at_is_allocated(0));
  105080:	50                   	push   %eax
  105081:	e8 16 dd ff ff       	call   102d9c <dprintf>
        at_set_perm(0, 0);
  105086:	58                   	pop    %eax
  105087:	5a                   	pop    %edx
  105088:	6a 00                	push   $0x0
  10508a:	6a 00                	push   $0x0
  10508c:	e8 af fd ff ff       	call   104e40 <at_set_perm>
        return 1;
  105091:	83 c4 10             	add    $0x10,%esp
        return 1;
  105094:	b8 01 00 00 00       	mov    $0x1,%eax
        return 1;
    }
    at_set_perm(0, 0);
    dprintf("test 2 passed.\n");
    return 0;
}
  105099:	83 c4 04             	add    $0x4,%esp
  10509c:	5b                   	pop    %ebx
  10509d:	5e                   	pop    %esi
  10509e:	c3                   	ret
  10509f:	90                   	nop
    at_set_perm(0, 1);
  1050a0:	83 ec 08             	sub    $0x8,%esp
  1050a3:	6a 01                	push   $0x1
  1050a5:	6a 00                	push   $0x0
  1050a7:	e8 94 fd ff ff       	call   104e40 <at_set_perm>
    if (at_is_norm(0) != 0 || at_is_allocated(0) != 0) {
  1050ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1050b3:	e8 58 fd ff ff       	call   104e10 <at_is_norm>
  1050b8:	83 c4 10             	add    $0x10,%esp
  1050bb:	85 c0                	test   %eax,%eax
  1050bd:	75 11                	jne    1050d0 <MATIntro_test2+0xb0>
  1050bf:	83 ec 0c             	sub    $0xc,%esp
  1050c2:	6a 00                	push   $0x0
  1050c4:	e8 97 fd ff ff       	call   104e60 <at_is_allocated>
  1050c9:	83 c4 10             	add    $0x10,%esp
  1050cc:	85 c0                	test   %eax,%eax
  1050ce:	74 28                	je     1050f8 <MATIntro_test2+0xd8>
        dprintf("test 2.2 failed: (%d != 0 || %d != 0)\n", at_is_norm(0), at_is_allocated(0));
  1050d0:	83 ec 0c             	sub    $0xc,%esp
  1050d3:	6a 00                	push   $0x0
  1050d5:	e8 86 fd ff ff       	call   104e60 <at_is_allocated>
  1050da:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1050e1:	89 c6                	mov    %eax,%esi
  1050e3:	e8 28 fd ff ff       	call   104e10 <at_is_norm>
  1050e8:	83 c4 0c             	add    $0xc,%esp
  1050eb:	56                   	push   %esi
  1050ec:	50                   	push   %eax
  1050ed:	8d 83 64 9d ff ff    	lea    -0x629c(%ebx),%eax
  1050f3:	eb 8b                	jmp    105080 <MATIntro_test2+0x60>
  1050f5:	8d 76 00             	lea    0x0(%esi),%esi
    at_set_perm(0, 2);
  1050f8:	83 ec 08             	sub    $0x8,%esp
  1050fb:	6a 02                	push   $0x2
  1050fd:	6a 00                	push   $0x0
  1050ff:	e8 3c fd ff ff       	call   104e40 <at_set_perm>
    if (at_is_norm(0) != 1 || at_is_allocated(0) != 0) {
  105104:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10510b:	e8 00 fd ff ff       	call   104e10 <at_is_norm>
  105110:	83 c4 10             	add    $0x10,%esp
  105113:	83 f8 01             	cmp    $0x1,%eax
  105116:	75 11                	jne    105129 <MATIntro_test2+0x109>
  105118:	83 ec 0c             	sub    $0xc,%esp
  10511b:	6a 00                	push   $0x0
  10511d:	e8 3e fd ff ff       	call   104e60 <at_is_allocated>
  105122:	83 c4 10             	add    $0x10,%esp
  105125:	85 c0                	test   %eax,%eax
  105127:	74 2f                	je     105158 <MATIntro_test2+0x138>
        dprintf("test 2.3 failed: (%d != 1 || %d != 0)\n", at_is_norm(0), at_is_allocated(0));
  105129:	83 ec 0c             	sub    $0xc,%esp
  10512c:	6a 00                	push   $0x0
  10512e:	e8 2d fd ff ff       	call   104e60 <at_is_allocated>
  105133:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10513a:	89 c6                	mov    %eax,%esi
  10513c:	e8 cf fc ff ff       	call   104e10 <at_is_norm>
  105141:	83 c4 0c             	add    $0xc,%esp
  105144:	56                   	push   %esi
  105145:	50                   	push   %eax
  105146:	8d 83 8c 9d ff ff    	lea    -0x6274(%ebx),%eax
  10514c:	e9 2f ff ff ff       	jmp    105080 <MATIntro_test2+0x60>
  105151:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    at_set_perm(0, 100);
  105158:	83 ec 08             	sub    $0x8,%esp
  10515b:	6a 64                	push   $0x64
  10515d:	6a 00                	push   $0x0
  10515f:	e8 dc fc ff ff       	call   104e40 <at_set_perm>
    if (at_is_norm(0) != 1 || at_is_allocated(0) != 0) {
  105164:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10516b:	e8 a0 fc ff ff       	call   104e10 <at_is_norm>
  105170:	83 c4 10             	add    $0x10,%esp
  105173:	83 f8 01             	cmp    $0x1,%eax
  105176:	75 38                	jne    1051b0 <MATIntro_test2+0x190>
  105178:	83 ec 0c             	sub    $0xc,%esp
  10517b:	6a 00                	push   $0x0
  10517d:	e8 de fc ff ff       	call   104e60 <at_is_allocated>
  105182:	83 c4 10             	add    $0x10,%esp
  105185:	85 c0                	test   %eax,%eax
  105187:	75 27                	jne    1051b0 <MATIntro_test2+0x190>
    at_set_perm(0, 0);
  105189:	83 ec 08             	sub    $0x8,%esp
  10518c:	6a 00                	push   $0x0
  10518e:	6a 00                	push   $0x0
  105190:	e8 ab fc ff ff       	call   104e40 <at_set_perm>
    dprintf("test 2 passed.\n");
  105195:	8d 83 d4 98 ff ff    	lea    -0x672c(%ebx),%eax
  10519b:	89 04 24             	mov    %eax,(%esp)
  10519e:	e8 f9 db ff ff       	call   102d9c <dprintf>
    return 0;
  1051a3:	83 c4 10             	add    $0x10,%esp
  1051a6:	31 c0                	xor    %eax,%eax
  1051a8:	e9 ec fe ff ff       	jmp    105099 <MATIntro_test2+0x79>
  1051ad:	8d 76 00             	lea    0x0(%esi),%esi
        dprintf("test 2.4 failed: (%d != 1 || %d != 0)\n", at_is_norm(0), at_is_allocated(0));
  1051b0:	83 ec 0c             	sub    $0xc,%esp
  1051b3:	6a 00                	push   $0x0
  1051b5:	e8 a6 fc ff ff       	call   104e60 <at_is_allocated>
  1051ba:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1051c1:	89 c6                	mov    %eax,%esi
  1051c3:	e8 48 fc ff ff       	call   104e10 <at_is_norm>
  1051c8:	83 c4 0c             	add    $0xc,%esp
  1051cb:	56                   	push   %esi
  1051cc:	50                   	push   %eax
  1051cd:	8d 83 b4 9d ff ff    	lea    -0x624c(%ebx),%eax
  1051d3:	e9 a8 fe ff ff       	jmp    105080 <MATIntro_test2+0x60>
  1051d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1051df:	00 

001051e0 <MATIntro_test3>:

int MATIntro_test3()
{
  1051e0:	53                   	push   %ebx
  1051e1:	e8 da b1 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1051e6:	81 c3 0e ae 00 00    	add    $0xae0e,%ebx
  1051ec:	83 ec 10             	sub    $0x10,%esp
    at_set_allocated(1, 0);
  1051ef:	6a 00                	push   $0x0
  1051f1:	6a 01                	push   $0x1
  1051f3:	e8 98 fc ff ff       	call   104e90 <at_set_allocated>
    if (at_is_allocated(1) != 0) {
  1051f8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1051ff:	e8 5c fc ff ff       	call   104e60 <at_is_allocated>
  105204:	83 c4 10             	add    $0x10,%esp
  105207:	85 c0                	test   %eax,%eax
  105209:	0f 85 89 00 00 00    	jne    105298 <MATIntro_test3+0xb8>
        dprintf("test 3.1 failed: (%d != 0)\n", at_is_allocated(1));
        at_set_allocated(1, 0);
        return 1;
    }
    at_set_allocated(1, 1);
  10520f:	83 ec 08             	sub    $0x8,%esp
  105212:	6a 01                	push   $0x1
  105214:	6a 01                	push   $0x1
  105216:	e8 75 fc ff ff       	call   104e90 <at_set_allocated>
    if (at_is_allocated(1) != 1) {
  10521b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  105222:	e8 39 fc ff ff       	call   104e60 <at_is_allocated>
  105227:	83 c4 10             	add    $0x10,%esp
  10522a:	83 f8 01             	cmp    $0x1,%eax
  10522d:	74 31                	je     105260 <MATIntro_test3+0x80>
        dprintf("test 3.2 failed: (%d != 1)\n", at_is_allocated(1));
  10522f:	83 ec 0c             	sub    $0xc,%esp
  105232:	6a 01                	push   $0x1
  105234:	e8 27 fc ff ff       	call   104e60 <at_is_allocated>
  105239:	59                   	pop    %ecx
  10523a:	5a                   	pop    %edx
  10523b:	50                   	push   %eax
  10523c:	8d 83 00 99 ff ff    	lea    -0x6700(%ebx),%eax
  105242:	50                   	push   %eax
  105243:	e8 54 db ff ff       	call   102d9c <dprintf>
        at_set_allocated(1, 0);
  105248:	58                   	pop    %eax
  105249:	5a                   	pop    %edx
  10524a:	6a 00                	push   $0x0
  10524c:	6a 01                	push   $0x1
  10524e:	e8 3d fc ff ff       	call   104e90 <at_set_allocated>
        return 1;
  105253:	83 c4 10             	add    $0x10,%esp
        return 1;
  105256:	b8 01 00 00 00       	mov    $0x1,%eax
        return 1;
    }
    at_set_allocated(1, 0);
    dprintf("test 3 passed.\n");
    return 0;
}
  10525b:	83 c4 08             	add    $0x8,%esp
  10525e:	5b                   	pop    %ebx
  10525f:	c3                   	ret
    at_set_allocated(1, 100);
  105260:	83 ec 08             	sub    $0x8,%esp
  105263:	6a 64                	push   $0x64
  105265:	6a 01                	push   $0x1
  105267:	e8 24 fc ff ff       	call   104e90 <at_set_allocated>
    if (at_is_allocated(1) != 1) {
  10526c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  105273:	e8 e8 fb ff ff       	call   104e60 <at_is_allocated>
  105278:	83 c4 10             	add    $0x10,%esp
  10527b:	83 f8 01             	cmp    $0x1,%eax
  10527e:	74 30                	je     1052b0 <MATIntro_test3+0xd0>
        dprintf("test 3.3 failed: (%d != 1)\n", at_is_allocated(1));
  105280:	83 ec 0c             	sub    $0xc,%esp
  105283:	6a 01                	push   $0x1
  105285:	e8 d6 fb ff ff       	call   104e60 <at_is_allocated>
  10528a:	5a                   	pop    %edx
  10528b:	59                   	pop    %ecx
  10528c:	50                   	push   %eax
  10528d:	8d 83 1c 99 ff ff    	lea    -0x66e4(%ebx),%eax
  105293:	eb ad                	jmp    105242 <MATIntro_test3+0x62>
  105295:	8d 76 00             	lea    0x0(%esi),%esi
        dprintf("test 3.1 failed: (%d != 0)\n", at_is_allocated(1));
  105298:	83 ec 0c             	sub    $0xc,%esp
  10529b:	6a 01                	push   $0x1
  10529d:	e8 be fb ff ff       	call   104e60 <at_is_allocated>
  1052a2:	59                   	pop    %ecx
  1052a3:	5a                   	pop    %edx
  1052a4:	50                   	push   %eax
  1052a5:	8d 83 e4 98 ff ff    	lea    -0x671c(%ebx),%eax
  1052ab:	eb 95                	jmp    105242 <MATIntro_test3+0x62>
  1052ad:	8d 76 00             	lea    0x0(%esi),%esi
    at_set_allocated(1, 0);
  1052b0:	83 ec 08             	sub    $0x8,%esp
  1052b3:	6a 00                	push   $0x0
  1052b5:	6a 01                	push   $0x1
  1052b7:	e8 d4 fb ff ff       	call   104e90 <at_set_allocated>
    dprintf("test 3 passed.\n");
  1052bc:	8d 83 38 99 ff ff    	lea    -0x66c8(%ebx),%eax
  1052c2:	89 04 24             	mov    %eax,(%esp)
  1052c5:	e8 d2 da ff ff       	call   102d9c <dprintf>
    return 0;
  1052ca:	83 c4 10             	add    $0x10,%esp
  1052cd:	31 c0                	xor    %eax,%eax
}
  1052cf:	83 c4 08             	add    $0x8,%esp
  1052d2:	5b                   	pop    %ebx
  1052d3:	c3                   	ret
  1052d4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1052db:	00 
  1052dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001052e0 <MATIntro_test_own>:
 * Be extra careful to make sure that if you overwrite some of the kernel data, they are set back to
 * the original value. O.w., it may make the future test scripts to fail even if you implement all
 * the functions correctly.
 */
int MATIntro_test_own()
{
  1052e0:	55                   	push   %ebp
  1052e1:	57                   	push   %edi
  1052e2:	56                   	push   %esi
    unsigned int test_orders[] = { 0, 1, 5, 10, 3, 7 };
    unsigned int page_idx = 2;  /* use page 2 to avoid clobbering pages 0/1 used above */

    /* --- Test at_set_order / at_get_order round-trip --- */
    unsigned int orig_order = at_get_order(page_idx);
    for (i = 0; i < 6; i++) {
  1052e3:	31 f6                	xor    %esi,%esi
{
  1052e5:	53                   	push   %ebx
  1052e6:	e8 d5 b0 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1052eb:	81 c3 09 ad 00 00    	add    $0xad09,%ebx
  1052f1:	83 ec 48             	sub    $0x48,%esp
    unsigned int test_orders[] = { 0, 1, 5, 10, 3, 7 };
  1052f4:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
  1052fb:	00 
  1052fc:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%esp)
  105303:	00 
  105304:	c7 44 24 2c 05 00 00 	movl   $0x5,0x2c(%esp)
  10530b:	00 
  10530c:	c7 44 24 30 0a 00 00 	movl   $0xa,0x30(%esp)
  105313:	00 
  105314:	c7 44 24 34 03 00 00 	movl   $0x3,0x34(%esp)
  10531b:	00 
  10531c:	c7 44 24 38 07 00 00 	movl   $0x7,0x38(%esp)
  105323:	00 
    unsigned int orig_order = at_get_order(page_idx);
  105324:	6a 02                	push   $0x2
  105326:	e8 85 fb ff ff       	call   104eb0 <at_get_order>
  10532b:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  10532f:	83 c4 10             	add    $0x10,%esp
  105332:	8d 7c 24 18          	lea    0x18(%esp),%edi
        at_set_order(page_idx, test_orders[i]);
  105336:	8b 2c b7             	mov    (%edi,%esi,4),%ebp
  105339:	83 ec 08             	sub    $0x8,%esp
  10533c:	55                   	push   %ebp
  10533d:	6a 02                	push   $0x2
  10533f:	e8 8c fb ff ff       	call   104ed0 <at_set_order>
        if (at_get_order(page_idx) != test_orders[i]) {
  105344:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  10534b:	e8 60 fb ff ff       	call   104eb0 <at_get_order>
  105350:	83 c4 10             	add    $0x10,%esp
  105353:	39 c5                	cmp    %eax,%ebp
  105355:	0f 85 c5 00 00 00    	jne    105420 <MATIntro_test_own+0x140>
    for (i = 0; i < 6; i++) {
  10535b:	83 c6 01             	add    $0x1,%esi
  10535e:	83 fe 06             	cmp    $0x6,%esi
  105361:	75 d3                	jne    105336 <MATIntro_test_own+0x56>
                    i, at_get_order(page_idx), test_orders[i]);
            at_set_order(page_idx, orig_order);
            return 1;
        }
    }
    at_set_order(page_idx, orig_order);
  105363:	83 ec 08             	sub    $0x8,%esp
  105366:	ff 74 24 14          	push   0x14(%esp)
  10536a:	6a 02                	push   $0x2
  10536c:	e8 5f fb ff ff       	call   104ed0 <at_set_order>

    /* --- Test at_set_head / at_is_head round-trip --- */
    unsigned int orig_head = at_is_head(page_idx);
  105371:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  105378:	e8 73 fb ff ff       	call   104ef0 <at_is_head>
    at_set_head(page_idx, 1);
  10537d:	5f                   	pop    %edi
  10537e:	5d                   	pop    %ebp
  10537f:	6a 01                	push   $0x1
  105381:	6a 02                	push   $0x2
    unsigned int orig_head = at_is_head(page_idx);
  105383:	89 c6                	mov    %eax,%esi
    at_set_head(page_idx, 1);
  105385:	e8 86 fb ff ff       	call   104f10 <at_set_head>
    if (at_is_head(page_idx) != 1) {
  10538a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  105391:	e8 5a fb ff ff       	call   104ef0 <at_is_head>
  105396:	83 c4 10             	add    $0x10,%esp
  105399:	83 f8 01             	cmp    $0x1,%eax
  10539c:	74 3a                	je     1053d8 <MATIntro_test_own+0xf8>
        dprintf("own test head failed: (%d != 1)\n", at_is_head(page_idx));
  10539e:	83 ec 0c             	sub    $0xc,%esp
  1053a1:	6a 02                	push   $0x2
  1053a3:	e8 48 fb ff ff       	call   104ef0 <at_is_head>
  1053a8:	5a                   	pop    %edx
  1053a9:	59                   	pop    %ecx
  1053aa:	50                   	push   %eax
  1053ab:	8d 83 08 9e ff ff    	lea    -0x61f8(%ebx),%eax
  1053b1:	50                   	push   %eax
  1053b2:	e8 e5 d9 ff ff       	call   102d9c <dprintf>
        at_set_head(page_idx, orig_head);
  1053b7:	5f                   	pop    %edi
  1053b8:	5d                   	pop    %ebp
  1053b9:	56                   	push   %esi
  1053ba:	6a 02                	push   $0x2
  1053bc:	e8 4f fb ff ff       	call   104f10 <at_set_head>
        return 1;
  1053c1:	83 c4 10             	add    $0x10,%esp
    }
    at_set_head(page_idx, orig_head);

    dprintf("own test passed.\n");
    return 0;
}
  1053c4:	83 c4 3c             	add    $0x3c,%esp
            return 1;
  1053c7:	b8 01 00 00 00       	mov    $0x1,%eax
}
  1053cc:	5b                   	pop    %ebx
  1053cd:	5e                   	pop    %esi
  1053ce:	5f                   	pop    %edi
  1053cf:	5d                   	pop    %ebp
  1053d0:	c3                   	ret
  1053d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    at_set_head(page_idx, 0);
  1053d8:	83 ec 08             	sub    $0x8,%esp
  1053db:	6a 00                	push   $0x0
  1053dd:	6a 02                	push   $0x2
  1053df:	e8 2c fb ff ff       	call   104f10 <at_set_head>
    if (at_is_head(page_idx) != 0) {
  1053e4:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1053eb:	e8 00 fb ff ff       	call   104ef0 <at_is_head>
  1053f0:	83 c4 10             	add    $0x10,%esp
  1053f3:	85 c0                	test   %eax,%eax
  1053f5:	75 59                	jne    105450 <MATIntro_test_own+0x170>
    at_set_head(page_idx, orig_head);
  1053f7:	83 ec 08             	sub    $0x8,%esp
  1053fa:	56                   	push   %esi
  1053fb:	6a 02                	push   $0x2
  1053fd:	e8 0e fb ff ff       	call   104f10 <at_set_head>
    dprintf("own test passed.\n");
  105402:	8d 83 48 99 ff ff    	lea    -0x66b8(%ebx),%eax
  105408:	89 04 24             	mov    %eax,(%esp)
  10540b:	e8 8c d9 ff ff       	call   102d9c <dprintf>
    return 0;
  105410:	83 c4 10             	add    $0x10,%esp
  105413:	31 c0                	xor    %eax,%eax
}
  105415:	83 c4 3c             	add    $0x3c,%esp
  105418:	5b                   	pop    %ebx
  105419:	5e                   	pop    %esi
  10541a:	5f                   	pop    %edi
  10541b:	5d                   	pop    %ebp
  10541c:	c3                   	ret
  10541d:	8d 76 00             	lea    0x0(%esi),%esi
            dprintf("own test order failed (i = %d): (%d != %d)\n",
  105420:	83 ec 0c             	sub    $0xc,%esp
  105423:	6a 02                	push   $0x2
  105425:	e8 86 fa ff ff       	call   104eb0 <at_get_order>
  10542a:	55                   	push   %ebp
  10542b:	50                   	push   %eax
  10542c:	8d 83 dc 9d ff ff    	lea    -0x6224(%ebx),%eax
  105432:	56                   	push   %esi
  105433:	50                   	push   %eax
  105434:	e8 63 d9 ff ff       	call   102d9c <dprintf>
            at_set_order(page_idx, orig_order);
  105439:	83 c4 18             	add    $0x18,%esp
  10543c:	ff 74 24 14          	push   0x14(%esp)
  105440:	6a 02                	push   $0x2
  105442:	e8 89 fa ff ff       	call   104ed0 <at_set_order>
            return 1;
  105447:	83 c4 10             	add    $0x10,%esp
  10544a:	e9 75 ff ff ff       	jmp    1053c4 <MATIntro_test_own+0xe4>
  10544f:	90                   	nop
        dprintf("own test head failed: (%d != 0)\n", at_is_head(page_idx));
  105450:	83 ec 0c             	sub    $0xc,%esp
  105453:	6a 02                	push   $0x2
  105455:	e8 96 fa ff ff       	call   104ef0 <at_is_head>
  10545a:	5a                   	pop    %edx
  10545b:	59                   	pop    %ecx
  10545c:	50                   	push   %eax
  10545d:	8d 83 2c 9e ff ff    	lea    -0x61d4(%ebx),%eax
  105463:	e9 49 ff ff ff       	jmp    1053b1 <MATIntro_test_own+0xd1>
  105468:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10546f:	00 

00105470 <test_MATIntro>:

int test_MATIntro()
{
  105470:	53                   	push   %ebx
  105471:	83 ec 08             	sub    $0x8,%esp
    return MATIntro_test1() + MATIntro_test2() + MATIntro_test3() + MATIntro_test_own();
  105474:	e8 b7 fa ff ff       	call   104f30 <MATIntro_test1>
  105479:	89 c3                	mov    %eax,%ebx
  10547b:	e8 a0 fb ff ff       	call   105020 <MATIntro_test2>
  105480:	01 c3                	add    %eax,%ebx
  105482:	e8 59 fd ff ff       	call   1051e0 <MATIntro_test3>
  105487:	01 c3                	add    %eax,%ebx
  105489:	e8 52 fe ff ff       	call   1052e0 <MATIntro_test_own>
}
  10548e:	83 c4 08             	add    $0x8,%esp
    return MATIntro_test1() + MATIntro_test2() + MATIntro_test3() + MATIntro_test_own();
  105491:	01 d8                	add    %ebx,%eax
}
  105493:	5b                   	pop    %ebx
  105494:	c3                   	ret
  105495:	66 90                	xchg   %ax,%ax
  105497:	66 90                	xchg   %ax,%ax
  105499:	66 90                	xchg   %ax,%ax
  10549b:	66 90                	xchg   %ax,%ax
  10549d:	66 90                	xchg   %ax,%ax
  10549f:	90                   	nop

001054a0 <pmem_init>:
 *    based on the information available in the physical memory map table.
 *    Review import.h in the current directory for the list of available
 *    getter and setter functions.
 */
void pmem_init(unsigned int mbi_addr)
{
  1054a0:	55                   	push   %ebp
  1054a1:	57                   	push   %edi
  1054a2:	56                   	push   %esi
  1054a3:	53                   	push   %ebx
  1054a4:	e8 17 af ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1054a9:	81 c3 4b ab 00 00    	add    $0xab4b,%ebx
  1054af:	83 ec 38             	sub    $0x38,%esp

    // TODO: Define your local variables here.

    // Calls the lower layer initialization primitive.
    // The parameter mbi_addr should not be used in the further code.
    devinit(mbi_addr);
  1054b2:	ff 74 24 4c          	push   0x4c(%esp)
  1054b6:	e8 46 b6 ff ff       	call   100b01 <devinit>
     * store it into the local variable nps.
     * Hint: Think of it as the highest address in the ranges of the memory map table,
     *       divided by the page size.
     */

    pmmap_size = get_size();
  1054bb:	e8 8f bb ff ff       	call   10104f <get_size>
    highest_addr = get_mms(pmmap_size-1) + get_mml(pmmap_size-1) - 1;
  1054c0:	8d 78 ff             	lea    -0x1(%eax),%edi
    pmmap_size = get_size();
  1054c3:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    highest_addr = get_mms(pmmap_size-1) + get_mml(pmmap_size-1) - 1;
  1054c7:	89 3c 24             	mov    %edi,(%esp)
  1054ca:	e8 95 bb ff ff       	call   101064 <get_mms>
  1054cf:	89 3c 24             	mov    %edi,(%esp)
  1054d2:	89 c6                	mov    %eax,%esi
  1054d4:	e8 f1 bb ff ff       	call   1010ca <get_mml>
  1054d9:	8d 44 06 ff          	lea    -0x1(%esi,%eax,1),%eax
    nps = highest_addr / PAGESIZE;
  1054dd:	c1 e8 0c             	shr    $0xc,%eax
  1054e0:	89 44 24 24          	mov    %eax,0x24(%esp)
  1054e4:	89 c7                	mov    %eax,%edi

    set_nps(nps);  // Setting the value computed above to NUM_PAGES.
  1054e6:	89 04 24             	mov    %eax,(%esp)
  1054e9:	e8 02 f9 ff ff       	call   104df0 <set_nps>
     *    the addresses are in a usable range. Currently, we do not utilize partial pages,
     *    so in that case, you should consider those pages as unavailable.
     */

     pg_idx = 0;
    while (pg_idx < nps) {
  1054ee:	83 c4 10             	add    $0x10,%esp
  1054f1:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  1054f8:	00 
  1054f9:	85 ff                	test   %edi,%edi
  1054fb:	0f 84 be 00 00 00    	je     1055bf <pmem_init+0x11f>
  105501:	31 ff                	xor    %edi,%edi
  105503:	eb 25                	jmp    10552a <pmem_init+0x8a>
  105505:	8d 76 00             	lea    0x0(%esi),%esi
        if (pg_idx < VM_USERLO_PI || VM_USERHI_PI <= pg_idx) {
            at_set_perm(pg_idx, 1);
  105508:	83 ec 08             	sub    $0x8,%esp
  10550b:	6a 01                	push   $0x1
  10550d:	51                   	push   %ecx
  10550e:	e8 2d f9 ff ff       	call   104e40 <at_set_perm>
  105513:	83 c4 10             	add    $0x10,%esp
    while (pg_idx < nps) {
  105516:	8b 44 24 14          	mov    0x14(%esp),%eax
  10551a:	81 44 24 08 00 10 00 	addl   $0x1000,0x8(%esp)
  105521:	00 
  105522:	39 c7                	cmp    %eax,%edi
  105524:	0f 84 95 00 00 00    	je     1055bf <pmem_init+0x11f>
        if (pg_idx < VM_USERLO_PI || VM_USERHI_PI <= pg_idx) {
  10552a:	89 f9                	mov    %edi,%ecx
            isnorm = 0;
            while (entry_idx < pmmap_size && !flag) {
                isnorm = is_usable(entry_idx);
                start = get_mms(entry_idx);
                len = get_mml(entry_idx);
                if (start <= pg_idx * PAGESIZE && (pg_idx + 1) * PAGESIZE <= start + len) {
  10552c:	83 c7 01             	add    $0x1,%edi
        if (pg_idx < VM_USERLO_PI || VM_USERHI_PI <= pg_idx) {
  10552f:	8d 81 00 00 fc ff    	lea    -0x40000(%ecx),%eax
  105535:	3d ff ff 0a 00       	cmp    $0xaffff,%eax
  10553a:	77 cc                	ja     105508 <pmem_init+0x68>
            while (entry_idx < pmmap_size && !flag) {
  10553c:	89 f8                	mov    %edi,%eax
            entry_idx = 0;
  10553e:	31 f6                	xor    %esi,%esi
  105540:	c1 e0 0c             	shl    $0xc,%eax
  105543:	89 44 24 10          	mov    %eax,0x10(%esp)
            while (entry_idx < pmmap_size && !flag) {
  105547:	8b 44 24 0c          	mov    0xc(%esp),%eax
  10554b:	85 c0                	test   %eax,%eax
  10554d:	0f 84 8e 00 00 00    	je     1055e1 <pmem_init+0x141>
  105553:	89 7c 24 18          	mov    %edi,0x18(%esp)
  105557:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
  10555b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                isnorm = is_usable(entry_idx);
  105560:	83 ec 0c             	sub    $0xc,%esp
  105563:	56                   	push   %esi
  105564:	e8 d1 bb ff ff       	call   10113a <is_usable>
                start = get_mms(entry_idx);
  105569:	89 34 24             	mov    %esi,(%esp)
                isnorm = is_usable(entry_idx);
  10556c:	89 c5                	mov    %eax,%ebp
                start = get_mms(entry_idx);
  10556e:	e8 f1 ba ff ff       	call   101064 <get_mms>
                len = get_mml(entry_idx);
  105573:	89 34 24             	mov    %esi,(%esp)
                start = get_mms(entry_idx);
  105576:	89 c7                	mov    %eax,%edi
                len = get_mml(entry_idx);
  105578:	e8 4d bb ff ff       	call   1010ca <get_mml>
                if (start <= pg_idx * PAGESIZE && (pg_idx + 1) * PAGESIZE <= start + len) {
  10557d:	83 c4 10             	add    $0x10,%esp
  105580:	39 7c 24 08          	cmp    %edi,0x8(%esp)
  105584:	72 4a                	jb     1055d0 <pmem_init+0x130>
  105586:	8d 14 07             	lea    (%edi,%eax,1),%edx
  105589:	8b 44 24 10          	mov    0x10(%esp),%eax
  10558d:	39 c2                	cmp    %eax,%edx
  10558f:	72 3f                	jb     1055d0 <pmem_init+0x130>
                    flag = 1;
                }
                entry_idx++;
            }

            if (flag && isnorm) {
  105591:	8b 7c 24 18          	mov    0x18(%esp),%edi
  105595:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
  105599:	85 ed                	test   %ebp,%ebp
  10559b:	74 44                	je     1055e1 <pmem_init+0x141>
                at_set_perm(pg_idx, 2);
  10559d:	83 ec 08             	sub    $0x8,%esp
  1055a0:	6a 02                	push   $0x2
  1055a2:	51                   	push   %ecx
  1055a3:	e8 98 f8 ff ff       	call   104e40 <at_set_perm>
    while (pg_idx < nps) {
  1055a8:	8b 44 24 24          	mov    0x24(%esp),%eax
  1055ac:	83 c4 10             	add    $0x10,%esp
  1055af:	81 44 24 08 00 10 00 	addl   $0x1000,0x8(%esp)
  1055b6:	00 
  1055b7:	39 c7                	cmp    %eax,%edi
  1055b9:	0f 85 6b ff ff ff    	jne    10552a <pmem_init+0x8a>
        }
        pg_idx++;
    }
     
    
}
  1055bf:	83 c4 2c             	add    $0x2c,%esp
  1055c2:	5b                   	pop    %ebx
  1055c3:	5e                   	pop    %esi
  1055c4:	5f                   	pop    %edi
  1055c5:	5d                   	pop    %ebp
  1055c6:	c3                   	ret
  1055c7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1055ce:	00 
  1055cf:	90                   	nop
                entry_idx++;
  1055d0:	83 c6 01             	add    $0x1,%esi
            while (entry_idx < pmmap_size && !flag) {
  1055d3:	39 74 24 0c          	cmp    %esi,0xc(%esp)
  1055d7:	75 87                	jne    105560 <pmem_init+0xc0>
  1055d9:	8b 7c 24 18          	mov    0x18(%esp),%edi
  1055dd:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
                at_set_perm(pg_idx, 0);
  1055e1:	83 ec 08             	sub    $0x8,%esp
  1055e4:	6a 00                	push   $0x0
  1055e6:	51                   	push   %ecx
  1055e7:	e8 54 f8 ff ff       	call   104e40 <at_set_perm>
  1055ec:	83 c4 10             	add    $0x10,%esp
  1055ef:	e9 22 ff ff ff       	jmp    105516 <pmem_init+0x76>
  1055f4:	66 90                	xchg   %ax,%ax
  1055f6:	66 90                	xchg   %ax,%ax
  1055f8:	66 90                	xchg   %ax,%ax
  1055fa:	66 90                	xchg   %ax,%ax
  1055fc:	66 90                	xchg   %ax,%ax
  1055fe:	66 90                	xchg   %ax,%ax

00105600 <MATInit_test1>:
#define VM_USERHI    0xF0000000
#define VM_USERLO_PI (VM_USERLO / PAGESIZE)
#define VM_USERHI_PI (VM_USERHI / PAGESIZE)

int MATInit_test1()
{
  105600:	57                   	push   %edi
  105601:	56                   	push   %esi
  105602:	31 f6                	xor    %esi,%esi
  105604:	53                   	push   %ebx
  105605:	e8 b6 ad ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  10560a:	81 c3 ea a9 00 00    	add    $0xa9ea,%ebx
    int i;
    int nps = get_nps();
  105610:	e8 bb f7 ff ff       	call   104dd0 <get_nps>
  105615:	89 c7                	mov    %eax,%edi
    if (nps <= 1000) {
  105617:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  10561c:	7f 11                	jg     10562f <MATInit_test1+0x2f>
  10561e:	e9 ad 00 00 00       	jmp    1056d0 <MATInit_test1+0xd0>
  105623:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        dprintf("test 1.1 failed: (%d <= 1000)\n", nps);
        return 1;
    }
    for (i = 0; i < nps; i++) {
  105628:	83 c6 01             	add    $0x1,%esi
  10562b:	39 f7                	cmp    %esi,%edi
  10562d:	74 51                	je     105680 <MATInit_test1+0x80>
        if (at_is_allocated(i) != 0) {
  10562f:	83 ec 0c             	sub    $0xc,%esp
  105632:	56                   	push   %esi
  105633:	e8 28 f8 ff ff       	call   104e60 <at_is_allocated>
  105638:	83 c4 10             	add    $0x10,%esp
  10563b:	85 c0                	test   %eax,%eax
  10563d:	75 61                	jne    1056a0 <MATInit_test1+0xa0>
            dprintf("test 1.2 failed (i = %d): (%d != 0)\n", i, at_is_allocated(i));
            return 1;
        }
        if ((i < VM_USERLO_PI || VM_USERHI_PI <= i)
  10563f:	8d 86 00 00 fc ff    	lea    -0x40000(%esi),%eax
  105645:	3d ff ff 0a 00       	cmp    $0xaffff,%eax
  10564a:	76 dc                	jbe    105628 <MATInit_test1+0x28>
            && at_is_norm(i) != 0) {
  10564c:	83 ec 0c             	sub    $0xc,%esp
  10564f:	56                   	push   %esi
  105650:	e8 bb f7 ff ff       	call   104e10 <at_is_norm>
  105655:	83 c4 10             	add    $0x10,%esp
  105658:	85 c0                	test   %eax,%eax
  10565a:	74 cc                	je     105628 <MATInit_test1+0x28>
            dprintf("test 1.3 failed (i = %d): (%d != 0)\n", i, at_is_norm(i));
  10565c:	83 ec 0c             	sub    $0xc,%esp
  10565f:	56                   	push   %esi
  105660:	e8 ab f7 ff ff       	call   104e10 <at_is_norm>
  105665:	83 c4 0c             	add    $0xc,%esp
  105668:	50                   	push   %eax
  105669:	8d 83 98 9e ff ff    	lea    -0x6168(%ebx),%eax
  10566f:	56                   	push   %esi
  105670:	50                   	push   %eax
  105671:	e8 26 d7 ff ff       	call   102d9c <dprintf>
            return 1;
  105676:	83 c4 10             	add    $0x10,%esp
  105679:	eb 42                	jmp    1056bd <MATInit_test1+0xbd>
  10567b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        }
    }
    dprintf("test 1 passed.\n");
  105680:	83 ec 0c             	sub    $0xc,%esp
  105683:	8d 83 c4 98 ff ff    	lea    -0x673c(%ebx),%eax
  105689:	50                   	push   %eax
  10568a:	e8 0d d7 ff ff       	call   102d9c <dprintf>
    return 0;
  10568f:	83 c4 10             	add    $0x10,%esp
  105692:	31 c0                	xor    %eax,%eax
}
  105694:	5b                   	pop    %ebx
  105695:	5e                   	pop    %esi
  105696:	5f                   	pop    %edi
  105697:	c3                   	ret
  105698:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10569f:	00 
            dprintf("test 1.2 failed (i = %d): (%d != 0)\n", i, at_is_allocated(i));
  1056a0:	83 ec 0c             	sub    $0xc,%esp
  1056a3:	56                   	push   %esi
  1056a4:	e8 b7 f7 ff ff       	call   104e60 <at_is_allocated>
  1056a9:	83 c4 0c             	add    $0xc,%esp
  1056ac:	50                   	push   %eax
  1056ad:	8d 83 70 9e ff ff    	lea    -0x6190(%ebx),%eax
  1056b3:	56                   	push   %esi
  1056b4:	50                   	push   %eax
  1056b5:	e8 e2 d6 ff ff       	call   102d9c <dprintf>
            return 1;
  1056ba:	83 c4 10             	add    $0x10,%esp
}
  1056bd:	5b                   	pop    %ebx
        return 1;
  1056be:	b8 01 00 00 00       	mov    $0x1,%eax
}
  1056c3:	5e                   	pop    %esi
  1056c4:	5f                   	pop    %edi
  1056c5:	c3                   	ret
  1056c6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1056cd:	00 
  1056ce:	66 90                	xchg   %ax,%ax
        dprintf("test 1.1 failed: (%d <= 1000)\n", nps);
  1056d0:	83 ec 08             	sub    $0x8,%esp
  1056d3:	50                   	push   %eax
  1056d4:	8d 83 50 9e ff ff    	lea    -0x61b0(%ebx),%eax
  1056da:	50                   	push   %eax
  1056db:	e8 bc d6 ff ff       	call   102d9c <dprintf>
        return 1;
  1056e0:	83 c4 10             	add    $0x10,%esp
  1056e3:	eb d8                	jmp    1056bd <MATInit_test1+0xbd>
  1056e5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1056ec:	00 
  1056ed:	8d 76 00             	lea    0x0(%esi),%esi

001056f0 <MATInit_test_own>:
int MATInit_test_own()
{
    // TODO (optional)
    // dprintf("own test passed.\n");
    return 0;
}
  1056f0:	31 c0                	xor    %eax,%eax
  1056f2:	c3                   	ret
  1056f3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1056fa:	00 
  1056fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00105700 <test_MATInit>:

int test_MATInit()
{
    return MATInit_test1() + MATInit_test_own();
  105700:	e9 fb fe ff ff       	jmp    105600 <MATInit_test1>
  105705:	66 90                	xchg   %ax,%ax
  105707:	66 90                	xchg   %ax,%ax
  105709:	66 90                	xchg   %ax,%ax
  10570b:	66 90                	xchg   %ax,%ax
  10570d:	66 90                	xchg   %ax,%ax
  10570f:	90                   	nop

00105710 <fl_remove>:
/* ------------------------------------------------------------------ */

/** Remove page_index from its order's free list. */
static void fl_remove(unsigned int page_index, unsigned int order)
{
    unsigned int p = free_nodes[page_index].prev;
  105710:	e8 86 05 00 00       	call   105c9b <__x86.get_pc_thunk.cx>
  105715:	81 c1 df a8 00 00    	add    $0xa8df,%ecx
{
  10571b:	55                   	push   %ebp
  10571c:	89 d5                	mov    %edx,%ebp
    unsigned int p = free_nodes[page_index].prev;
  10571e:	8d 15 ac cc 04 01    	lea    0x104ccac,%edx
{
  105724:	57                   	push   %edi
  105725:	56                   	push   %esi
    unsigned int n = free_nodes[page_index].next;
  105726:	8d 34 c5 00 00 00 00 	lea    0x0(,%eax,8),%esi
{
  10572d:	53                   	push   %ebx
    unsigned int p = free_nodes[page_index].prev;
  10572e:	8d 1c 0a             	lea    (%edx,%ecx,1),%ebx
{
  105731:	83 ec 04             	sub    $0x4,%esp
    unsigned int p = free_nodes[page_index].prev;
  105734:	8b 3c c3             	mov    (%ebx,%eax,8),%edi
    unsigned int n = free_nodes[page_index].next;
  105737:	89 34 24             	mov    %esi,(%esp)
  10573a:	01 ce                	add    %ecx,%esi
  10573c:	8b 74 32 04          	mov    0x4(%edx,%esi,1),%esi

    if (p != 0)
  105740:	85 ff                	test   %edi,%edi
  105742:	74 2c                	je     105770 <fl_remove+0x60>
        free_nodes[p].next = n;
  105744:	8d 2c f9             	lea    (%ecx,%edi,8),%ebp
  105747:	89 74 2a 04          	mov    %esi,0x4(%edx,%ebp,1)
    else
        free_list_head[order] = n;  /* was the head */

    if (n != 0)
  10574b:	85 f6                	test   %esi,%esi
  10574d:	74 03                	je     105752 <fl_remove+0x42>
        free_nodes[n].prev = p;
  10574f:	89 3c f3             	mov    %edi,(%ebx,%esi,8)

    free_nodes[page_index].prev = 0;
  105752:	c7 04 c3 00 00 00 00 	movl   $0x0,(%ebx,%eax,8)
    free_nodes[page_index].next = 0;
  105759:	8b 04 24             	mov    (%esp),%eax
  10575c:	01 c8                	add    %ecx,%eax
  10575e:	c7 44 02 04 00 00 00 	movl   $0x0,0x4(%edx,%eax,1)
  105765:	00 
}
  105766:	83 c4 04             	add    $0x4,%esp
  105769:	5b                   	pop    %ebx
  10576a:	5e                   	pop    %esi
  10576b:	5f                   	pop    %edi
  10576c:	5d                   	pop    %ebp
  10576d:	c3                   	ret
  10576e:	66 90                	xchg   %ax,%ax
        free_list_head[order] = n;  /* was the head */
  105770:	89 b4 a9 6c cc 04 01 	mov    %esi,0x104cc6c(%ecx,%ebp,4)
  105777:	eb d2                	jmp    10574b <fl_remove+0x3b>
  105779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105780 <pfree_n.part.0>:
/**
 * pfree_n — free a 2^order block starting at page_index.
 *
 * Coalesces with the buddy if the buddy is free and at the same order.
 */
void pfree_n(unsigned int page_index, unsigned int order)
  105780:	55                   	push   %ebp

    if (order > MAX_ORDER)
        return;

    /* Mark all pages as unallocated. */
    block_size = 1u << order;
  105781:	89 d1                	mov    %edx,%ecx
void pfree_n(unsigned int page_index, unsigned int order)
  105783:	57                   	push   %edi
  105784:	89 c7                	mov    %eax,%edi
    block_size = 1u << order;
  105786:	b8 01 00 00 00       	mov    $0x1,%eax
void pfree_n(unsigned int page_index, unsigned int order)
  10578b:	56                   	push   %esi
    block_size = 1u << order;
  10578c:	d3 e0                	shl    %cl,%eax
void pfree_n(unsigned int page_index, unsigned int order)
  10578e:	89 d6                	mov    %edx,%esi
    block_size = 1u << order;
  105790:	89 fd                	mov    %edi,%ebp
void pfree_n(unsigned int page_index, unsigned int order)
  105792:	53                   	push   %ebx
  105793:	e8 28 ac ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  105798:	81 c3 5c a8 00 00    	add    $0xa85c,%ebx
  10579e:	83 ec 1c             	sub    $0x1c,%esp
    block_size = 1u << order;
  1057a1:	89 44 24 0c          	mov    %eax,0xc(%esp)
    for (i = 0; i < block_size; i++)
  1057a5:	01 f8                	add    %edi,%eax
  1057a7:	89 44 24 08          	mov    %eax,0x8(%esp)
  1057ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        at_set_allocated(page_index + i, 0);
  1057b0:	83 ec 08             	sub    $0x8,%esp
  1057b3:	6a 00                	push   $0x0
  1057b5:	55                   	push   %ebp
    for (i = 0; i < block_size; i++)
  1057b6:	83 c5 01             	add    $0x1,%ebp
        at_set_allocated(page_index + i, 0);
  1057b9:	e8 d2 f6 ff ff       	call   104e90 <at_set_allocated>
    for (i = 0; i < block_size; i++)
  1057be:	8b 44 24 18          	mov    0x18(%esp),%eax
  1057c2:	83 c4 10             	add    $0x10,%esp
  1057c5:	39 c5                	cmp    %eax,%ebp
  1057c7:	75 e7                	jne    1057b0 <pfree_n.part.0+0x30>

    /* Coalesce with buddy while possible. */
    while (order < MAX_ORDER) {
  1057c9:	83 fe 0a             	cmp    $0xa,%esi
  1057cc:	74 7a                	je     105848 <pfree_n.part.0+0xc8>
        buddy = page_index ^ (1u << order);
  1057ce:	8b 44 24 0c          	mov    0xc(%esp),%eax
  1057d2:	89 c5                	mov    %eax,%ebp
  1057d4:	31 fd                	xor    %edi,%ebp

        /* Buddy must be in user range */
        if (buddy < VM_USERLO_PI || buddy + (1u << order) > VM_USERHI_PI)
  1057d6:	81 fd ff ff 03 00    	cmp    $0x3ffff,%ebp
  1057dc:	77 5d                	ja     10583b <pfree_n.part.0+0xbb>
  1057de:	eb 68                	jmp    105848 <pfree_n.part.0+0xc8>
            break;

        /* Buddy must be free, same order, and a head */
        if (at_is_allocated(buddy))
  1057e0:	83 ec 0c             	sub    $0xc,%esp
  1057e3:	55                   	push   %ebp
  1057e4:	e8 77 f6 ff ff       	call   104e60 <at_is_allocated>
  1057e9:	83 c4 10             	add    $0x10,%esp
  1057ec:	85 c0                	test   %eax,%eax
  1057ee:	75 58                	jne    105848 <pfree_n.part.0+0xc8>
            break;
        if (!at_is_head(buddy))
  1057f0:	83 ec 0c             	sub    $0xc,%esp
  1057f3:	55                   	push   %ebp
  1057f4:	e8 f7 f6 ff ff       	call   104ef0 <at_is_head>
  1057f9:	83 c4 10             	add    $0x10,%esp
  1057fc:	85 c0                	test   %eax,%eax
  1057fe:	74 48                	je     105848 <pfree_n.part.0+0xc8>
            break;
        if (at_get_order(buddy) != order)
  105800:	83 ec 0c             	sub    $0xc,%esp
  105803:	55                   	push   %ebp
  105804:	e8 a7 f6 ff ff       	call   104eb0 <at_get_order>
  105809:	83 c4 10             	add    $0x10,%esp
  10580c:	39 f0                	cmp    %esi,%eax
  10580e:	75 38                	jne    105848 <pfree_n.part.0+0xc8>
            break;

        /* Remove buddy from its free list and merge */
        fl_remove(buddy, order);
  105810:	89 f2                	mov    %esi,%edx
  105812:	89 e8                	mov    %ebp,%eax
  105814:	e8 f7 fe ff ff       	call   105710 <fl_remove>

        /* The merged block starts at the lower of the two */
        if (buddy < page_index)
  105819:	39 ef                	cmp    %ebp,%edi
  10581b:	0f 47 fd             	cmova  %ebp,%edi
            page_index = buddy;

        order++;
  10581e:	83 c6 01             	add    $0x1,%esi
    while (order < MAX_ORDER) {
  105821:	83 fe 0a             	cmp    $0xa,%esi
  105824:	74 22                	je     105848 <pfree_n.part.0+0xc8>
        buddy = page_index ^ (1u << order);
  105826:	b8 01 00 00 00       	mov    $0x1,%eax
  10582b:	89 f1                	mov    %esi,%ecx
  10582d:	d3 e0                	shl    %cl,%eax
  10582f:	89 c5                	mov    %eax,%ebp
  105831:	31 fd                	xor    %edi,%ebp
        if (buddy < VM_USERLO_PI || buddy + (1u << order) > VM_USERHI_PI)
  105833:	81 fd ff ff 03 00    	cmp    $0x3ffff,%ebp
  105839:	76 0d                	jbe    105848 <pfree_n.part.0+0xc8>
  10583b:	01 e8                	add    %ebp,%eax
  10583d:	3d 00 00 0f 00       	cmp    $0xf0000,%eax
  105842:	76 9c                	jbe    1057e0 <pfree_n.part.0+0x60>
  105844:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }

    /* Set metadata on the (possibly merged) block head */
    at_set_order(page_index, order);
  105848:	83 ec 08             	sub    $0x8,%esp
  10584b:	56                   	push   %esi
  10584c:	57                   	push   %edi
  10584d:	e8 7e f6 ff ff       	call   104ed0 <at_set_order>
    at_set_head(page_index, 1);
  105852:	58                   	pop    %eax
  105853:	5a                   	pop    %edx
  105854:	6a 01                	push   $0x1
  105856:	57                   	push   %edi
  105857:	e8 b4 f6 ff ff       	call   104f10 <at_set_head>
    unsigned int old_head = free_list_head[order];
  10585c:	8d 93 6c cc 04 01    	lea    0x104cc6c(%ebx),%edx
    free_nodes[page_index].prev = 0;
  105862:	8d 0d ac cc 04 01    	lea    0x104ccac,%ecx
    if (old_head != 0)
  105868:	83 c4 10             	add    $0x10,%esp
    unsigned int old_head = free_list_head[order];
  10586b:	8b 04 b2             	mov    (%edx,%esi,4),%eax
    free_nodes[page_index].prev = 0;
  10586e:	8d 2c 0b             	lea    (%ebx,%ecx,1),%ebp
    free_nodes[page_index].next = old_head;
  105871:	8d 1c fb             	lea    (%ebx,%edi,8),%ebx
    free_nodes[page_index].prev = 0;
  105874:	c7 44 fd 00 00 00 00 	movl   $0x0,0x0(%ebp,%edi,8)
  10587b:	00 
    free_nodes[page_index].next = old_head;
  10587c:	89 44 19 04          	mov    %eax,0x4(%ecx,%ebx,1)
    if (old_head != 0)
  105880:	85 c0                	test   %eax,%eax
  105882:	74 04                	je     105888 <pfree_n.part.0+0x108>
        free_nodes[old_head].prev = page_index;
  105884:	89 7c c5 00          	mov    %edi,0x0(%ebp,%eax,8)
    free_list_head[order] = page_index;
  105888:	89 3c b2             	mov    %edi,(%edx,%esi,4)

    fl_insert(page_index, order);
}
  10588b:	83 c4 1c             	add    $0x1c,%esp
  10588e:	5b                   	pop    %ebx
  10588f:	5e                   	pop    %esi
  105890:	5f                   	pop    %edi
  105891:	5d                   	pop    %ebp
  105892:	c3                   	ret
  105893:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10589a:	00 
  10589b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

001058a0 <palloc_n.part.0>:
unsigned int palloc_n(unsigned int order)
  1058a0:	55                   	push   %ebp
  1058a1:	57                   	push   %edi
  1058a2:	56                   	push   %esi
  1058a3:	53                   	push   %ebx
  1058a4:	e8 17 ab ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1058a9:	81 c3 4b a7 00 00    	add    $0xa74b,%ebx
  1058af:	83 ec 2c             	sub    $0x2c,%esp
  1058b2:	89 44 24 10          	mov    %eax,0x10(%esp)
    for (current_order = order; current_order <= MAX_ORDER; current_order++) {
  1058b6:	83 f8 0b             	cmp    $0xb,%eax
  1058b9:	0f 84 40 01 00 00    	je     1059ff <palloc_n.part.0+0x15f>
  1058bf:	89 c6                	mov    %eax,%esi
  1058c1:	eb 11                	jmp    1058d4 <palloc_n.part.0+0x34>
  1058c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1058c8:	83 c6 01             	add    $0x1,%esi
  1058cb:	83 fe 0b             	cmp    $0xb,%esi
  1058ce:	0f 84 21 01 00 00    	je     1059f5 <palloc_n.part.0+0x155>
        if (free_list_head[current_order] != 0)
  1058d4:	8b ac b3 6c cc 04 01 	mov    0x104cc6c(%ebx,%esi,4),%ebp
  1058db:	85 ed                	test   %ebp,%ebp
  1058dd:	74 e9                	je     1058c8 <palloc_n.part.0+0x28>
    page_index = free_list_head[current_order];
  1058df:	8b ac b3 6c cc 04 01 	mov    0x104cc6c(%ebx,%esi,4),%ebp
    fl_remove(page_index, current_order);
  1058e6:	89 f2                	mov    %esi,%edx
  1058e8:	89 e8                	mov    %ebp,%eax
  1058ea:	e8 21 fe ff ff       	call   105710 <fl_remove>
    block_size = 1u << order;
  1058ef:	8b 54 24 10          	mov    0x10(%esp),%edx
  1058f3:	b8 01 00 00 00       	mov    $0x1,%eax
  1058f8:	89 d1                	mov    %edx,%ecx
  1058fa:	d3 e0                	shl    %cl,%eax
  1058fc:	89 c7                	mov    %eax,%edi
  1058fe:	8d 05 ac cc 04 01    	lea    0x104ccac,%eax
  105904:	89 44 24 18          	mov    %eax,0x18(%esp)
  105908:	8d 83 ac cc 04 01    	lea    0x104ccac(%ebx),%eax
    while (current_order > order) {
  10590e:	39 f2                	cmp    %esi,%edx
  105910:	73 7d                	jae    10598f <palloc_n.part.0+0xef>
  105912:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
  105916:	89 6c 24 14          	mov    %ebp,0x14(%esp)
  10591a:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10591e:	66 90                	xchg   %ax,%ax
        current_order--;
  105920:	83 ee 01             	sub    $0x1,%esi
            unsigned int buddy = page_index + (1u << current_order);
  105923:	8b 44 24 14          	mov    0x14(%esp),%eax
  105927:	bf 01 00 00 00       	mov    $0x1,%edi
            at_set_order(buddy, current_order);
  10592c:	83 ec 08             	sub    $0x8,%esp
            unsigned int buddy = page_index + (1u << current_order);
  10592f:	89 f1                	mov    %esi,%ecx
            at_set_order(buddy, current_order);
  105931:	56                   	push   %esi
            unsigned int buddy = page_index + (1u << current_order);
  105932:	d3 e7                	shl    %cl,%edi
  105934:	01 c7                	add    %eax,%edi
            at_set_order(buddy, current_order);
  105936:	57                   	push   %edi
  105937:	e8 94 f5 ff ff       	call   104ed0 <at_set_order>
            at_set_head(buddy, 1);
  10593c:	5d                   	pop    %ebp
  10593d:	58                   	pop    %eax
  10593e:	6a 01                	push   $0x1
  105940:	57                   	push   %edi
  105941:	e8 ca f5 ff ff       	call   104f10 <at_set_head>
    free_nodes[page_index].prev = 0;
  105946:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    unsigned int old_head = free_list_head[order];
  10594a:	8d 14 b5 00 00 00 00 	lea    0x0(,%esi,4),%edx
    free_nodes[page_index].next = old_head;
  105951:	8b 6c 24 28          	mov    0x28(%esp),%ebp
    unsigned int old_head = free_list_head[order];
  105955:	8b 84 1a 6c cc 04 01 	mov    0x104cc6c(%edx,%ebx,1),%eax
    if (old_head != 0)
  10595c:	83 c4 10             	add    $0x10,%esp
    free_nodes[page_index].prev = 0;
  10595f:	c7 04 f9 00 00 00 00 	movl   $0x0,(%ecx,%edi,8)
    free_nodes[page_index].next = old_head;
  105966:	8d 0c fb             	lea    (%ebx,%edi,8),%ecx
  105969:	89 44 0d 04          	mov    %eax,0x4(%ebp,%ecx,1)
    if (old_head != 0)
  10596d:	85 c0                	test   %eax,%eax
  10596f:	74 07                	je     105978 <palloc_n.part.0+0xd8>
        free_nodes[old_head].prev = page_index;
  105971:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  105975:	89 3c c1             	mov    %edi,(%ecx,%eax,8)
    while (current_order > order) {
  105978:	8b 44 24 10          	mov    0x10(%esp),%eax
    free_list_head[order] = page_index;
  10597c:	89 bc 1a 6c cc 04 01 	mov    %edi,0x104cc6c(%edx,%ebx,1)
    while (current_order > order) {
  105983:	39 c6                	cmp    %eax,%esi
  105985:	75 99                	jne    105920 <palloc_n.part.0+0x80>
  105987:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
  10598b:	8b 6c 24 14          	mov    0x14(%esp),%ebp
    at_set_order(page_index, order);
  10598f:	83 ec 08             	sub    $0x8,%esp
    for (i = 0; i < block_size; i++)
  105992:	31 f6                	xor    %esi,%esi
    at_set_order(page_index, order);
  105994:	ff 74 24 18          	push   0x18(%esp)
  105998:	55                   	push   %ebp
  105999:	e8 32 f5 ff ff       	call   104ed0 <at_set_order>
    at_set_head(page_index, 1);
  10599e:	5a                   	pop    %edx
  10599f:	59                   	pop    %ecx
  1059a0:	6a 01                	push   $0x1
  1059a2:	55                   	push   %ebp
  1059a3:	e8 68 f5 ff ff       	call   104f10 <at_set_head>
  1059a8:	83 c4 10             	add    $0x10,%esp
  1059ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        at_set_allocated(page_index + i, 1);
  1059b0:	83 ec 08             	sub    $0x8,%esp
  1059b3:	8d 44 35 00          	lea    0x0(%ebp,%esi,1),%eax
    for (i = 0; i < block_size; i++)
  1059b7:	83 c6 01             	add    $0x1,%esi
        at_set_allocated(page_index + i, 1);
  1059ba:	6a 01                	push   $0x1
  1059bc:	50                   	push   %eax
  1059bd:	e8 ce f4 ff ff       	call   104e90 <at_set_allocated>
    for (i = 0; i < block_size; i++)
  1059c2:	83 c4 10             	add    $0x10,%esp
  1059c5:	39 fe                	cmp    %edi,%esi
  1059c7:	72 e7                	jb     1059b0 <palloc_n.part.0+0x110>
    for (i = 1; i < block_size; i++)
  1059c9:	8b 44 24 10          	mov    0x10(%esp),%eax
  1059cd:	85 c0                	test   %eax,%eax
  1059cf:	74 24                	je     1059f5 <palloc_n.part.0+0x155>
  1059d1:	8d 75 01             	lea    0x1(%ebp),%esi
  1059d4:	01 ef                	add    %ebp,%edi
  1059d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1059dd:	00 
  1059de:	66 90                	xchg   %ax,%ax
        at_set_head(page_index + i, 0);
  1059e0:	83 ec 08             	sub    $0x8,%esp
  1059e3:	6a 00                	push   $0x0
  1059e5:	56                   	push   %esi
    for (i = 1; i < block_size; i++)
  1059e6:	83 c6 01             	add    $0x1,%esi
        at_set_head(page_index + i, 0);
  1059e9:	e8 22 f5 ff ff       	call   104f10 <at_set_head>
    for (i = 1; i < block_size; i++)
  1059ee:	83 c4 10             	add    $0x10,%esp
  1059f1:	39 f7                	cmp    %esi,%edi
  1059f3:	75 eb                	jne    1059e0 <palloc_n.part.0+0x140>
}
  1059f5:	83 c4 2c             	add    $0x2c,%esp
  1059f8:	89 e8                	mov    %ebp,%eax
  1059fa:	5b                   	pop    %ebx
  1059fb:	5e                   	pop    %esi
  1059fc:	5f                   	pop    %edi
  1059fd:	5d                   	pop    %ebp
  1059fe:	c3                   	ret
        return 0;
  1059ff:	31 ed                	xor    %ebp,%ebp
  105a01:	eb f2                	jmp    1059f5 <palloc_n.part.0+0x155>
  105a03:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105a0a:	00 
  105a0b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00105a10 <buddy_init>:
{
  105a10:	55                   	push   %ebp
  105a11:	57                   	push   %edi
  105a12:	56                   	push   %esi
  105a13:	53                   	push   %ebx
  105a14:	e8 a7 a9 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  105a19:	81 c3 db a5 00 00    	add    $0xa5db,%ebx
  105a1f:	83 ec 2c             	sub    $0x2c,%esp
  105a22:	8d 83 ac cc 04 01    	lea    0x104ccac(%ebx),%eax
  105a28:	89 44 24 18          	mov    %eax,0x18(%esp)
  105a2c:	8d 90 00 00 80 00    	lea    0x800000(%eax),%edx
  105a32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        free_nodes[i].prev = 0;
  105a38:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    for (i = 0; i < (1u << 20); i++) {
  105a3e:	83 c0 08             	add    $0x8,%eax
        free_nodes[i].next = 0;
  105a41:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
    for (i = 0; i < (1u << 20); i++) {
  105a48:	39 d0                	cmp    %edx,%eax
  105a4a:	75 ec                	jne    105a38 <buddy_init+0x28>
  105a4c:	8d ab 6c cc 04 01    	lea    0x104cc6c(%ebx),%ebp
        free_list_head[i] = 0;
  105a52:	c7 45 00 00 00 00 00 	movl   $0x0,0x0(%ebp)
  105a59:	8d 55 2c             	lea    0x2c(%ebp),%edx
    for (i = 0; i <= MAX_ORDER; i++)
  105a5c:	8d 45 04             	lea    0x4(%ebp),%eax
  105a5f:	90                   	nop
        free_list_head[i] = 0;
  105a60:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    for (i = 0; i <= MAX_ORDER; i++)
  105a66:	83 c0 08             	add    $0x8,%eax
        free_list_head[i] = 0;
  105a69:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
    for (i = 0; i <= MAX_ORDER; i++)
  105a70:	39 d0                	cmp    %edx,%eax
  105a72:	75 ec                	jne    105a60 <buddy_init+0x50>
    free_nodes[page_index].prev = 0;
  105a74:	8d 05 ac cc 04 01    	lea    0x104ccac,%eax
  105a7a:	89 6c 24 14          	mov    %ebp,0x14(%esp)
    i = VM_USERLO_PI;
  105a7e:	bf 00 00 04 00       	mov    $0x40000,%edi
    free_nodes[page_index].prev = 0;
  105a83:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  105a87:	eb 16                	jmp    105a9f <buddy_init+0x8f>
  105a89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            i++;
  105a90:	83 c7 01             	add    $0x1,%edi
    while (i < VM_USERHI_PI) {
  105a93:	81 ff ff ff 0e 00    	cmp    $0xeffff,%edi
  105a99:	0f 87 49 01 00 00    	ja     105be8 <buddy_init+0x1d8>
        if (!at_is_norm(i) || at_is_allocated(i)) {
  105a9f:	83 ec 0c             	sub    $0xc,%esp
  105aa2:	57                   	push   %edi
  105aa3:	e8 68 f3 ff ff       	call   104e10 <at_is_norm>
  105aa8:	83 c4 10             	add    $0x10,%esp
  105aab:	85 c0                	test   %eax,%eax
  105aad:	74 e1                	je     105a90 <buddy_init+0x80>
  105aaf:	83 ec 0c             	sub    $0xc,%esp
  105ab2:	57                   	push   %edi
  105ab3:	e8 a8 f3 ff ff       	call   104e60 <at_is_allocated>
  105ab8:	83 c4 10             	add    $0x10,%esp
  105abb:	85 c0                	test   %eax,%eax
  105abd:	75 d1                	jne    105a90 <buddy_init+0x80>
  105abf:	89 fa                	mov    %edi,%edx
  105ac1:	89 c7                	mov    %eax,%edi
  105ac3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
            unsigned int next_order = order + 1;
  105ac8:	89 fe                	mov    %edi,%esi
  105aca:	89 7c 24 04          	mov    %edi,0x4(%esp)
  105ace:	83 c7 01             	add    $0x1,%edi
            block_size = 1u << next_order;
  105ad1:	bd 01 00 00 00       	mov    $0x1,%ebp
  105ad6:	89 f9                	mov    %edi,%ecx
                for (j = i + (1u << order); j < i + block_size; j++) {
  105ad8:	b8 01 00 00 00       	mov    $0x1,%eax
            block_size = 1u << next_order;
  105add:	d3 e5                	shl    %cl,%ebp
                for (j = i + (1u << order); j < i + block_size; j++) {
  105adf:	89 f1                	mov    %esi,%ecx
  105ae1:	d3 e0                	shl    %cl,%eax
  105ae3:	89 c1                	mov    %eax,%ecx
            if ((i & (block_size - 1)) != 0)
  105ae5:	8d 45 ff             	lea    -0x1(%ebp),%eax
        i += block_size;
  105ae8:	01 d1                	add    %edx,%ecx
  105aea:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
            if ((i & (block_size - 1)) != 0)
  105aee:	85 d0                	test   %edx,%eax
  105af0:	0f 85 3e 01 00 00    	jne    105c34 <buddy_init+0x224>
            if (i + block_size > VM_USERHI_PI)
  105af6:	01 d5                	add    %edx,%ebp
  105af8:	81 fd 00 00 0f 00    	cmp    $0xf0000,%ebp
  105afe:	0f 87 30 01 00 00    	ja     105c34 <buddy_init+0x224>
                for (j = i + (1u << order); j < i + block_size; j++) {
  105b04:	89 ce                	mov    %ecx,%esi
  105b06:	39 e9                	cmp    %ebp,%ecx
  105b08:	0f 83 e8 00 00 00    	jae    105bf6 <buddy_init+0x1e6>
  105b0e:	89 7c 24 10          	mov    %edi,0x10(%esp)
  105b12:	89 d7                	mov    %edx,%edi
  105b14:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  105b18:	eb 21                	jmp    105b3b <buddy_init+0x12b>
  105b1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                    if (!at_is_norm(j) || at_is_allocated(j)) {
  105b20:	83 ec 0c             	sub    $0xc,%esp
  105b23:	56                   	push   %esi
  105b24:	e8 37 f3 ff ff       	call   104e60 <at_is_allocated>
  105b29:	83 c4 10             	add    $0x10,%esp
  105b2c:	85 c0                	test   %eax,%eax
  105b2e:	75 1b                	jne    105b4b <buddy_init+0x13b>
                for (j = i + (1u << order); j < i + block_size; j++) {
  105b30:	83 c6 01             	add    $0x1,%esi
  105b33:	39 f5                	cmp    %esi,%ebp
  105b35:	0f 84 b5 00 00 00    	je     105bf0 <buddy_init+0x1e0>
                    if (!at_is_norm(j) || at_is_allocated(j)) {
  105b3b:	83 ec 0c             	sub    $0xc,%esp
  105b3e:	56                   	push   %esi
  105b3f:	e8 cc f2 ff ff       	call   104e10 <at_is_norm>
  105b44:	83 c4 10             	add    $0x10,%esp
  105b47:	85 c0                	test   %eax,%eax
  105b49:	75 d5                	jne    105b20 <buddy_init+0x110>
  105b4b:	8b 54 24 08          	mov    0x8(%esp),%edx
  105b4f:	89 54 24 08          	mov    %edx,0x8(%esp)
        at_set_order(i, order);
  105b53:	83 ec 08             	sub    $0x8,%esp
  105b56:	8b 74 24 0c          	mov    0xc(%esp),%esi
  105b5a:	56                   	push   %esi
  105b5b:	57                   	push   %edi
  105b5c:	e8 6f f3 ff ff       	call   104ed0 <at_set_order>
        at_set_head(i, 1);
  105b61:	59                   	pop    %ecx
  105b62:	5d                   	pop    %ebp
  105b63:	6a 01                	push   $0x1
  105b65:	57                   	push   %edi
  105b66:	e8 a5 f3 ff ff       	call   104f10 <at_set_head>
            for (j = 1; j < block_size; j++) {
  105b6b:	83 c4 10             	add    $0x10,%esp
  105b6e:	85 f6                	test   %esi,%esi
  105b70:	8b 54 24 08          	mov    0x8(%esp),%edx
  105b74:	74 2b                	je     105ba1 <buddy_init+0x191>
  105b76:	8d 77 01             	lea    0x1(%edi),%esi
  105b79:	89 fd                	mov    %edi,%ebp
  105b7b:	89 f7                	mov    %esi,%edi
  105b7d:	89 d6                	mov    %edx,%esi
  105b7f:	90                   	nop
                at_set_order(i + j, 0);
  105b80:	83 ec 08             	sub    $0x8,%esp
  105b83:	6a 00                	push   $0x0
  105b85:	57                   	push   %edi
  105b86:	e8 45 f3 ff ff       	call   104ed0 <at_set_order>
                at_set_head(i + j, 0);
  105b8b:	58                   	pop    %eax
  105b8c:	5a                   	pop    %edx
  105b8d:	6a 00                	push   $0x0
  105b8f:	57                   	push   %edi
            for (j = 1; j < block_size; j++) {
  105b90:	83 c7 01             	add    $0x1,%edi
                at_set_head(i + j, 0);
  105b93:	e8 78 f3 ff ff       	call   104f10 <at_set_head>
            for (j = 1; j < block_size; j++) {
  105b98:	83 c4 10             	add    $0x10,%esp
  105b9b:	39 f7                	cmp    %esi,%edi
  105b9d:	75 e1                	jne    105b80 <buddy_init+0x170>
  105b9f:	89 ef                	mov    %ebp,%edi
    unsigned int old_head = free_list_head[order];
  105ba1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  105ba5:	8b 44 24 14          	mov    0x14(%esp),%eax
    free_nodes[page_index].next = old_head;
  105ba9:	8d 14 fb             	lea    (%ebx,%edi,8),%edx
    unsigned int old_head = free_list_head[order];
  105bac:	8b 04 88             	mov    (%eax,%ecx,4),%eax
    free_nodes[page_index].prev = 0;
  105baf:	8b 4c 24 18          	mov    0x18(%esp),%ecx
  105bb3:	c7 04 f9 00 00 00 00 	movl   $0x0,(%ecx,%edi,8)
    free_nodes[page_index].next = old_head;
  105bba:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
  105bbe:	89 44 11 04          	mov    %eax,0x4(%ecx,%edx,1)
    if (old_head != 0)
  105bc2:	85 c0                	test   %eax,%eax
  105bc4:	74 07                	je     105bcd <buddy_init+0x1bd>
        free_nodes[old_head].prev = page_index;
  105bc6:	8b 4c 24 18          	mov    0x18(%esp),%ecx
  105bca:	89 3c c1             	mov    %edi,(%ecx,%eax,8)
    free_list_head[order] = page_index;
  105bcd:	8b 44 24 14          	mov    0x14(%esp),%eax
  105bd1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  105bd5:	89 3c 88             	mov    %edi,(%eax,%ecx,4)
        i += block_size;
  105bd8:	8b 7c 24 0c          	mov    0xc(%esp),%edi
    while (i < VM_USERHI_PI) {
  105bdc:	81 ff ff ff 0e 00    	cmp    $0xeffff,%edi
  105be2:	0f 86 b7 fe ff ff    	jbe    105a9f <buddy_init+0x8f>
}
  105be8:	83 c4 2c             	add    $0x2c,%esp
  105beb:	5b                   	pop    %ebx
  105bec:	5e                   	pop    %esi
  105bed:	5f                   	pop    %edi
  105bee:	5d                   	pop    %ebp
  105bef:	c3                   	ret
  105bf0:	89 fa                	mov    %edi,%edx
  105bf2:	8b 7c 24 10          	mov    0x10(%esp),%edi
        while (order < MAX_ORDER) {
  105bf6:	83 ff 0a             	cmp    $0xa,%edi
  105bf9:	0f 85 c9 fe ff ff    	jne    105ac8 <buddy_init+0xb8>
        i += block_size;
  105bff:	8d 82 00 04 00 00    	lea    0x400(%edx),%eax
        at_set_order(i, order);
  105c05:	83 ec 08             	sub    $0x8,%esp
  105c08:	89 d7                	mov    %edx,%edi
        i += block_size;
  105c0a:	89 44 24 14          	mov    %eax,0x14(%esp)
  105c0e:	89 c6                	mov    %eax,%esi
        at_set_order(i, order);
  105c10:	6a 0a                	push   $0xa
  105c12:	52                   	push   %edx
  105c13:	e8 b8 f2 ff ff       	call   104ed0 <at_set_order>
        at_set_head(i, 1);
  105c18:	58                   	pop    %eax
  105c19:	5a                   	pop    %edx
  105c1a:	6a 01                	push   $0x1
  105c1c:	57                   	push   %edi
  105c1d:	e8 ee f2 ff ff       	call   104f10 <at_set_head>
  105c22:	83 c4 10             	add    $0x10,%esp
  105c25:	89 f2                	mov    %esi,%edx
  105c27:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  105c2e:	00 
  105c2f:	e9 42 ff ff ff       	jmp    105b76 <buddy_init+0x166>
  105c34:	89 d7                	mov    %edx,%edi
  105c36:	89 ca                	mov    %ecx,%edx
  105c38:	e9 12 ff ff ff       	jmp    105b4f <buddy_init+0x13f>
  105c3d:	8d 76 00             	lea    0x0(%esi),%esi

00105c40 <palloc_n>:
{
  105c40:	8b 44 24 04          	mov    0x4(%esp),%eax
    if (order > MAX_ORDER)
  105c44:	83 f8 0a             	cmp    $0xa,%eax
  105c47:	77 07                	ja     105c50 <palloc_n+0x10>
  105c49:	e9 52 fc ff ff       	jmp    1058a0 <palloc_n.part.0>
  105c4e:	66 90                	xchg   %ax,%ax
}
  105c50:	31 c0                	xor    %eax,%eax
  105c52:	c3                   	ret
  105c53:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105c5a:	00 
  105c5b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00105c60 <pfree_n>:
{
  105c60:	8b 54 24 08          	mov    0x8(%esp),%edx
  105c64:	8b 44 24 04          	mov    0x4(%esp),%eax
    if (order > MAX_ORDER)
  105c68:	83 fa 0a             	cmp    $0xa,%edx
  105c6b:	77 0b                	ja     105c78 <pfree_n+0x18>
  105c6d:	e9 0e fb ff ff       	jmp    105780 <pfree_n.part.0>
  105c72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
}
  105c78:	c3                   	ret
  105c79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105c80 <palloc>:
    if (order > MAX_ORDER)
  105c80:	31 c0                	xor    %eax,%eax
  105c82:	e9 19 fc ff ff       	jmp    1058a0 <palloc_n.part.0>
  105c87:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105c8e:	00 
  105c8f:	90                   	nop

00105c90 <pfree>:
    if (order > MAX_ORDER)
  105c90:	8b 44 24 04          	mov    0x4(%esp),%eax
  105c94:	31 d2                	xor    %edx,%edx
  105c96:	e9 e5 fa ff ff       	jmp    105780 <pfree_n.part.0>

00105c9b <__x86.get_pc_thunk.cx>:
  105c9b:	8b 0c 24             	mov    (%esp),%ecx
  105c9e:	c3                   	ret
  105c9f:	90                   	nop

00105ca0 <MATOp_test1>:

/**
 * Original test — single-page palloc/pfree via backward-compatible wrappers.
 */
int MATOp_test1()
{
  105ca0:	56                   	push   %esi
  105ca1:	53                   	push   %ebx
  105ca2:	e8 19 a7 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  105ca7:	81 c3 4d a3 00 00    	add    $0xa34d,%ebx
  105cad:	83 ec 04             	sub    $0x4,%esp
    int page_index = palloc();
  105cb0:	e8 cb ff ff ff       	call   105c80 <palloc>
  105cb5:	89 c6                	mov    %eax,%esi
    if (page_index < VM_USERLO_PI || VM_USERHI_PI <= page_index) {
  105cb7:	2d 00 00 04 00       	sub    $0x40000,%eax
  105cbc:	3d ff ff 0a 00       	cmp    $0xaffff,%eax
  105cc1:	0f 87 91 00 00 00    	ja     105d58 <MATOp_test1+0xb8>
        dprintf("test 1.1 failed: (%d < VM_USERLO_PI || VM_USERHI_PI <= %d)\n", page_index, page_index);
        pfree(page_index);
        return 1;
    }
    if (at_is_norm(page_index) != 1) {
  105cc7:	83 ec 0c             	sub    $0xc,%esp
  105cca:	56                   	push   %esi
  105ccb:	e8 40 f1 ff ff       	call   104e10 <at_is_norm>
  105cd0:	83 c4 10             	add    $0x10,%esp
  105cd3:	83 f8 01             	cmp    $0x1,%eax
  105cd6:	74 38                	je     105d10 <MATOp_test1+0x70>
        dprintf("test 1.2 failed: (%d != 1)\n", at_is_norm(page_index));
  105cd8:	83 ec 0c             	sub    $0xc,%esp
  105cdb:	56                   	push   %esi
  105cdc:	e8 2f f1 ff ff       	call   104e10 <at_is_norm>
  105ce1:	5a                   	pop    %edx
  105ce2:	59                   	pop    %ecx
  105ce3:	50                   	push   %eax
  105ce4:	8d 83 5a 99 ff ff    	lea    -0x66a6(%ebx),%eax
  105cea:	50                   	push   %eax
  105ceb:	e8 ac d0 ff ff       	call   102d9c <dprintf>
        pfree(page_index);
  105cf0:	89 34 24             	mov    %esi,(%esp)
  105cf3:	e8 98 ff ff ff       	call   105c90 <pfree>
        return 1;
  105cf8:	83 c4 10             	add    $0x10,%esp
        dprintf("test 1.4 failed: (%d != 0)\n", at_is_allocated(page_index));
        return 1;
    }
    dprintf("test 1 passed.\n");
    return 0;
}
  105cfb:	83 c4 04             	add    $0x4,%esp
        return 1;
  105cfe:	b8 01 00 00 00       	mov    $0x1,%eax
}
  105d03:	5b                   	pop    %ebx
  105d04:	5e                   	pop    %esi
  105d05:	c3                   	ret
  105d06:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105d0d:	00 
  105d0e:	66 90                	xchg   %ax,%ax
    if (at_is_allocated(page_index) != 1) {
  105d10:	83 ec 0c             	sub    $0xc,%esp
  105d13:	56                   	push   %esi
  105d14:	e8 47 f1 ff ff       	call   104e60 <at_is_allocated>
  105d19:	83 c4 10             	add    $0x10,%esp
  105d1c:	83 f8 01             	cmp    $0x1,%eax
  105d1f:	75 47                	jne    105d68 <MATOp_test1+0xc8>
    pfree(page_index);
  105d21:	83 ec 0c             	sub    $0xc,%esp
  105d24:	56                   	push   %esi
  105d25:	e8 66 ff ff ff       	call   105c90 <pfree>
    if (at_is_allocated(page_index) != 0) {
  105d2a:	89 34 24             	mov    %esi,(%esp)
  105d2d:	e8 2e f1 ff ff       	call   104e60 <at_is_allocated>
  105d32:	83 c4 10             	add    $0x10,%esp
  105d35:	85 c0                	test   %eax,%eax
  105d37:	75 47                	jne    105d80 <MATOp_test1+0xe0>
    dprintf("test 1 passed.\n");
  105d39:	83 ec 0c             	sub    $0xc,%esp
  105d3c:	8d 83 c4 98 ff ff    	lea    -0x673c(%ebx),%eax
  105d42:	50                   	push   %eax
  105d43:	e8 54 d0 ff ff       	call   102d9c <dprintf>
    return 0;
  105d48:	83 c4 10             	add    $0x10,%esp
  105d4b:	31 c0                	xor    %eax,%eax
}
  105d4d:	83 c4 04             	add    $0x4,%esp
  105d50:	5b                   	pop    %ebx
  105d51:	5e                   	pop    %esi
  105d52:	c3                   	ret
  105d53:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        dprintf("test 1.1 failed: (%d < VM_USERLO_PI || VM_USERHI_PI <= %d)\n", page_index, page_index);
  105d58:	83 ec 04             	sub    $0x4,%esp
  105d5b:	8d 83 c0 9e ff ff    	lea    -0x6140(%ebx),%eax
  105d61:	56                   	push   %esi
  105d62:	56                   	push   %esi
  105d63:	eb 85                	jmp    105cea <MATOp_test1+0x4a>
  105d65:	8d 76 00             	lea    0x0(%esi),%esi
        dprintf("test 1.3 failed: (%d != 1)\n", at_is_allocated(page_index));
  105d68:	83 ec 0c             	sub    $0xc,%esp
  105d6b:	56                   	push   %esi
  105d6c:	e8 ef f0 ff ff       	call   104e60 <at_is_allocated>
  105d71:	5a                   	pop    %edx
  105d72:	59                   	pop    %ecx
  105d73:	50                   	push   %eax
  105d74:	8d 83 76 99 ff ff    	lea    -0x668a(%ebx),%eax
  105d7a:	e9 6b ff ff ff       	jmp    105cea <MATOp_test1+0x4a>
  105d7f:	90                   	nop
        dprintf("test 1.4 failed: (%d != 0)\n", at_is_allocated(page_index));
  105d80:	83 ec 0c             	sub    $0xc,%esp
  105d83:	56                   	push   %esi
  105d84:	e8 d7 f0 ff ff       	call   104e60 <at_is_allocated>
  105d89:	5a                   	pop    %edx
  105d8a:	59                   	pop    %ecx
  105d8b:	50                   	push   %eax
  105d8c:	8d 83 92 99 ff ff    	lea    -0x666e(%ebx),%eax
  105d92:	50                   	push   %eax
  105d93:	e8 04 d0 ff ff       	call   102d9c <dprintf>
        return 1;
  105d98:	83 c4 10             	add    $0x10,%esp
  105d9b:	e9 5b ff ff ff       	jmp    105cfb <MATOp_test1+0x5b>

00105da0 <MATOp_test_palloc_n_orders>:
/**
 * Test palloc_n at orders 0, 1, and 10.
 * Verifies correct alignment, allocation flags, user range, and successful free.
 */
int MATOp_test_palloc_n_orders()
{
  105da0:	55                   	push   %ebp
  105da1:	57                   	push   %edi
  105da2:	56                   	push   %esi
  105da3:	53                   	push   %ebx
  105da4:	e8 17 a6 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  105da9:	81 c3 4b a2 00 00    	add    $0xa24b,%ebx
  105daf:	83 ec 2c             	sub    $0x2c,%esp
  105db2:	8d 44 24 14          	lea    0x14(%esp),%eax
    unsigned int orders[] = {0, 1, 10};
  105db6:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  105dbd:	00 
  105dbe:	89 44 24 04          	mov    %eax,0x4(%esp)
  105dc2:	8d 44 24 20          	lea    0x20(%esp),%eax
  105dc6:	c7 44 24 18 01 00 00 	movl   $0x1,0x18(%esp)
  105dcd:	00 
  105dce:	c7 44 24 1c 0a 00 00 	movl   $0xa,0x1c(%esp)
  105dd5:	00 
    unsigned int num_orders = 3;
    unsigned int idx, pi, block_size, i, order;

    for (idx = 0; idx < num_orders; idx++) {
  105dd6:	89 44 24 0c          	mov    %eax,0xc(%esp)
        order = orders[idx];
  105dda:	8b 44 24 04          	mov    0x4(%esp),%eax
        block_size = 1u << order;

        pi = palloc_n(order);
  105dde:	83 ec 0c             	sub    $0xc,%esp
        block_size = 1u << order;
  105de1:	bf 01 00 00 00       	mov    $0x1,%edi
        order = orders[idx];
  105de6:	8b 00                	mov    (%eax),%eax
  105de8:	89 44 24 14          	mov    %eax,0x14(%esp)
        block_size = 1u << order;
  105dec:	89 c1                	mov    %eax,%ecx
        pi = palloc_n(order);
  105dee:	50                   	push   %eax
        block_size = 1u << order;
  105def:	d3 e7                	shl    %cl,%edi
        pi = palloc_n(order);
  105df1:	e8 4a fe ff ff       	call   105c40 <palloc_n>
        if (pi == 0) {
  105df6:	83 c4 10             	add    $0x10,%esp
        pi = palloc_n(order);
  105df9:	89 c5                	mov    %eax,%ebp
        if (pi == 0) {
  105dfb:	85 c0                	test   %eax,%eax
  105dfd:	0f 84 3a 01 00 00    	je     105f3d <MATOp_test_palloc_n_orders+0x19d>
            dprintf("test palloc_n_orders failed: palloc_n(%u) returned 0\n", order);
            return 1;
        }
        /* Must be in user range */
        if (pi < VM_USERLO_PI || pi + block_size > VM_USERHI_PI) {
  105e03:	3d ff ff 03 00       	cmp    $0x3ffff,%eax
  105e08:	0f 86 1b 01 00 00    	jbe    105f29 <MATOp_test_palloc_n_orders+0x189>
  105e0e:	8d 34 07             	lea    (%edi,%eax,1),%esi
  105e11:	81 fe 00 00 0f 00    	cmp    $0xf0000,%esi
  105e17:	0f 87 0c 01 00 00    	ja     105f29 <MATOp_test_palloc_n_orders+0x189>
            dprintf("test palloc_n_orders failed: order %u, pi %u out of user range\n", order, pi);
            pfree_n(pi, order);
            return 1;
        }
        /* Must be aligned to 2^order */
        if ((pi & (block_size - 1)) != 0) {
  105e1d:	8d 57 ff             	lea    -0x1(%edi),%edx
  105e20:	85 c2                	test   %eax,%edx
  105e22:	0f 85 30 01 00 00    	jne    105f58 <MATOp_test_palloc_n_orders+0x1b8>
  105e28:	89 c7                	mov    %eax,%edi
  105e2a:	eb 0b                	jmp    105e37 <MATOp_test_palloc_n_orders+0x97>
  105e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            dprintf("test palloc_n_orders failed: order %u, pi %u not aligned\n", order, pi);
            pfree_n(pi, order);
            return 1;
        }
        /* All pages must be allocated */
        for (i = 0; i < block_size; i++) {
  105e30:	83 c7 01             	add    $0x1,%edi
  105e33:	39 fe                	cmp    %edi,%esi
  105e35:	74 49                	je     105e80 <MATOp_test_palloc_n_orders+0xe0>
            if (at_is_allocated(pi + i) != 1) {
  105e37:	83 ec 0c             	sub    $0xc,%esp
  105e3a:	57                   	push   %edi
  105e3b:	e8 20 f0 ff ff       	call   104e60 <at_is_allocated>
  105e40:	83 c4 10             	add    $0x10,%esp
  105e43:	83 f8 01             	cmp    $0x1,%eax
  105e46:	74 e8                	je     105e30 <MATOp_test_palloc_n_orders+0x90>
                dprintf("test palloc_n_orders failed: order %u, page %u not allocated\n", order, pi + i);
  105e48:	83 ec 04             	sub    $0x4,%esp
  105e4b:	8d 83 b0 9f ff ff    	lea    -0x6050(%ebx),%eax
  105e51:	57                   	push   %edi
  105e52:	8b 74 24 10          	mov    0x10(%esp),%esi
  105e56:	56                   	push   %esi
                return 1;
            }
        }
        /* Head page metadata */
        if (at_is_head(pi) != 1) {
            dprintf("test palloc_n_orders failed: order %u, pi %u not marked as head\n", order, pi);
  105e57:	50                   	push   %eax
  105e58:	e8 3f cf ff ff       	call   102d9c <dprintf>
            pfree_n(pi, order);
  105e5d:	58                   	pop    %eax
  105e5e:	5a                   	pop    %edx
  105e5f:	56                   	push   %esi
  105e60:	55                   	push   %ebp
  105e61:	e8 fa fd ff ff       	call   105c60 <pfree_n>
            return 1;
  105e66:	83 c4 10             	add    $0x10,%esp
        }
    }

    dprintf("test palloc_n_orders passed.\n");
    return 0;
}
  105e69:	83 c4 2c             	add    $0x2c,%esp
            return 1;
  105e6c:	b8 01 00 00 00       	mov    $0x1,%eax
}
  105e71:	5b                   	pop    %ebx
  105e72:	5e                   	pop    %esi
  105e73:	5f                   	pop    %edi
  105e74:	5d                   	pop    %ebp
  105e75:	c3                   	ret
  105e76:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105e7d:	00 
  105e7e:	66 90                	xchg   %ax,%ax
        if (at_is_head(pi) != 1) {
  105e80:	83 ec 0c             	sub    $0xc,%esp
  105e83:	55                   	push   %ebp
  105e84:	e8 67 f0 ff ff       	call   104ef0 <at_is_head>
  105e89:	83 c4 10             	add    $0x10,%esp
  105e8c:	83 f8 01             	cmp    $0x1,%eax
  105e8f:	0f 85 d7 00 00 00    	jne    105f6c <MATOp_test_palloc_n_orders+0x1cc>
        if (at_get_order(pi) != order) {
  105e95:	83 ec 0c             	sub    $0xc,%esp
  105e98:	55                   	push   %ebp
  105e99:	e8 12 f0 ff ff       	call   104eb0 <at_get_order>
  105e9e:	8b 54 24 18          	mov    0x18(%esp),%edx
  105ea2:	83 c4 10             	add    $0x10,%esp
  105ea5:	39 d0                	cmp    %edx,%eax
  105ea7:	0f 85 d3 00 00 00    	jne    105f80 <MATOp_test_palloc_n_orders+0x1e0>
        pfree_n(pi, order);
  105ead:	83 ec 08             	sub    $0x8,%esp
  105eb0:	ff 74 24 10          	push   0x10(%esp)
  105eb4:	55                   	push   %ebp
  105eb5:	e8 a6 fd ff ff       	call   105c60 <pfree_n>
  105eba:	83 c4 10             	add    $0x10,%esp
  105ebd:	eb 08                	jmp    105ec7 <MATOp_test_palloc_n_orders+0x127>
  105ebf:	90                   	nop
        for (i = 0; i < block_size; i++) {
  105ec0:	83 c5 01             	add    $0x1,%ebp
  105ec3:	39 ee                	cmp    %ebp,%esi
  105ec5:	74 31                	je     105ef8 <MATOp_test_palloc_n_orders+0x158>
            if (at_is_allocated(pi + i) != 0) {
  105ec7:	83 ec 0c             	sub    $0xc,%esp
  105eca:	55                   	push   %ebp
  105ecb:	e8 90 ef ff ff       	call   104e60 <at_is_allocated>
  105ed0:	83 c4 10             	add    $0x10,%esp
  105ed3:	85 c0                	test   %eax,%eax
  105ed5:	74 e9                	je     105ec0 <MATOp_test_palloc_n_orders+0x120>
                dprintf("test palloc_n_orders failed: order %u, page %u still allocated after free\n", order, pi + i);
  105ed7:	83 ec 04             	sub    $0x4,%esp
  105eda:	8d 83 74 a0 ff ff    	lea    -0x5f8c(%ebx),%eax
  105ee0:	55                   	push   %ebp
  105ee1:	ff 74 24 10          	push   0x10(%esp)
  105ee5:	50                   	push   %eax
  105ee6:	e8 b1 ce ff ff       	call   102d9c <dprintf>
                return 1;
  105eeb:	83 c4 10             	add    $0x10,%esp
  105eee:	e9 76 ff ff ff       	jmp    105e69 <MATOp_test_palloc_n_orders+0xc9>
  105ef3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    for (idx = 0; idx < num_orders; idx++) {
  105ef8:	83 44 24 04 04       	addl   $0x4,0x4(%esp)
  105efd:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  105f01:	8b 44 24 04          	mov    0x4(%esp),%eax
  105f05:	39 c8                	cmp    %ecx,%eax
  105f07:	0f 85 cd fe ff ff    	jne    105dda <MATOp_test_palloc_n_orders+0x3a>
    dprintf("test palloc_n_orders passed.\n");
  105f0d:	83 ec 0c             	sub    $0xc,%esp
  105f10:	8d 83 ae 99 ff ff    	lea    -0x6652(%ebx),%eax
  105f16:	50                   	push   %eax
  105f17:	e8 80 ce ff ff       	call   102d9c <dprintf>
    return 0;
  105f1c:	83 c4 10             	add    $0x10,%esp
  105f1f:	31 c0                	xor    %eax,%eax
}
  105f21:	83 c4 2c             	add    $0x2c,%esp
  105f24:	5b                   	pop    %ebx
  105f25:	5e                   	pop    %esi
  105f26:	5f                   	pop    %edi
  105f27:	5d                   	pop    %ebp
  105f28:	c3                   	ret
            dprintf("test palloc_n_orders failed: order %u, pi %u out of user range\n", order, pi);
  105f29:	83 ec 04             	sub    $0x4,%esp
  105f2c:	8d 83 34 9f ff ff    	lea    -0x60cc(%ebx),%eax
  105f32:	55                   	push   %ebp
  105f33:	8b 74 24 10          	mov    0x10(%esp),%esi
  105f37:	56                   	push   %esi
  105f38:	e9 1a ff ff ff       	jmp    105e57 <MATOp_test_palloc_n_orders+0xb7>
            dprintf("test palloc_n_orders failed: palloc_n(%u) returned 0\n", order);
  105f3d:	83 ec 08             	sub    $0x8,%esp
  105f40:	8d 83 fc 9e ff ff    	lea    -0x6104(%ebx),%eax
  105f46:	ff 74 24 10          	push   0x10(%esp)
  105f4a:	50                   	push   %eax
  105f4b:	e8 4c ce ff ff       	call   102d9c <dprintf>
            return 1;
  105f50:	83 c4 10             	add    $0x10,%esp
  105f53:	e9 11 ff ff ff       	jmp    105e69 <MATOp_test_palloc_n_orders+0xc9>
            dprintf("test palloc_n_orders failed: order %u, pi %u not aligned\n", order, pi);
  105f58:	83 ec 04             	sub    $0x4,%esp
  105f5b:	50                   	push   %eax
  105f5c:	8b 74 24 10          	mov    0x10(%esp),%esi
  105f60:	8d 83 74 9f ff ff    	lea    -0x608c(%ebx),%eax
  105f66:	56                   	push   %esi
  105f67:	e9 eb fe ff ff       	jmp    105e57 <MATOp_test_palloc_n_orders+0xb7>
            dprintf("test palloc_n_orders failed: order %u, pi %u not marked as head\n", order, pi);
  105f6c:	83 ec 04             	sub    $0x4,%esp
  105f6f:	8d 83 f0 9f ff ff    	lea    -0x6010(%ebx),%eax
  105f75:	55                   	push   %ebp
  105f76:	8b 74 24 10          	mov    0x10(%esp),%esi
  105f7a:	56                   	push   %esi
  105f7b:	e9 d7 fe ff ff       	jmp    105e57 <MATOp_test_palloc_n_orders+0xb7>
            dprintf("test palloc_n_orders failed: order %u, pi %u order mismatch %u\n", order, pi, at_get_order(pi));
  105f80:	83 ec 0c             	sub    $0xc,%esp
  105f83:	55                   	push   %ebp
  105f84:	e8 27 ef ff ff       	call   104eb0 <at_get_order>
  105f89:	50                   	push   %eax
  105f8a:	8d 83 34 a0 ff ff    	lea    -0x5fcc(%ebx),%eax
  105f90:	55                   	push   %ebp
  105f91:	8b 74 24 20          	mov    0x20(%esp),%esi
  105f95:	56                   	push   %esi
  105f96:	50                   	push   %eax
  105f97:	e8 00 ce ff ff       	call   102d9c <dprintf>
            pfree_n(pi, order);
  105f9c:	83 c4 18             	add    $0x18,%esp
  105f9f:	56                   	push   %esi
  105fa0:	55                   	push   %ebp
  105fa1:	e8 ba fc ff ff       	call   105c60 <pfree_n>
            return 1;
  105fa6:	83 c4 10             	add    $0x10,%esp
  105fa9:	e9 bb fe ff ff       	jmp    105e69 <MATOp_test_palloc_n_orders+0xc9>
  105fae:	66 90                	xchg   %ax,%ax

00105fb0 <MATOp_test_split_coalesce>:
 * Test split and coalesce.
 * Allocates order-1, frees it, then allocates two order-0 blocks (should be
 * the two halves). Frees both and verifies they coalesce back to order-1.
 */
int MATOp_test_split_coalesce()
{
  105fb0:	57                   	push   %edi
  105fb1:	56                   	push   %esi
  105fb2:	53                   	push   %ebx
  105fb3:	e8 08 a4 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  105fb8:	81 c3 3c a0 00 00    	add    $0xa03c,%ebx
    unsigned int pi1, pa, pb;

    /* Allocate an order-1 block (2 consecutive pages) */
    pi1 = palloc_n(1);
  105fbe:	83 ec 0c             	sub    $0xc,%esp
  105fc1:	6a 01                	push   $0x1
  105fc3:	e8 78 fc ff ff       	call   105c40 <palloc_n>
    if (pi1 == 0) {
  105fc8:	83 c4 10             	add    $0x10,%esp
  105fcb:	85 c0                	test   %eax,%eax
  105fcd:	0f 84 ad 00 00 00    	je     106080 <MATOp_test_split_coalesce+0xd0>
  105fd3:	89 c6                	mov    %eax,%esi
        dprintf("test split_coalesce failed: initial palloc_n(1) returned 0\n");
        return 1;
    }
    if ((pi1 & 1) != 0) {
  105fd5:	a8 01                	test   $0x1,%al
  105fd7:	75 7f                	jne    106058 <MATOp_test_split_coalesce+0xa8>
        pfree_n(pi1, 1);
        return 1;
    }

    /* Free to return it to the pool */
    pfree_n(pi1, 1);
  105fd9:	83 ec 08             	sub    $0x8,%esp
  105fdc:	6a 01                	push   $0x1
  105fde:	50                   	push   %eax
  105fdf:	e8 7c fc ff ff       	call   105c60 <pfree_n>

    /* Now allocate two order-0 blocks — they should come from the split
     * of the block we just freed (or an equivalent one). */
    pa = palloc_n(0);
  105fe4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  105feb:	e8 50 fc ff ff       	call   105c40 <palloc_n>
    pb = palloc_n(0);
  105ff0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    pa = palloc_n(0);
  105ff7:	89 c6                	mov    %eax,%esi
    pb = palloc_n(0);
  105ff9:	e8 42 fc ff ff       	call   105c40 <palloc_n>
    if (pa == 0 || pb == 0) {
  105ffe:	83 c4 10             	add    $0x10,%esp
    pb = palloc_n(0);
  106001:	89 c7                	mov    %eax,%edi
    if (pa == 0 || pb == 0) {
  106003:	85 f6                	test   %esi,%esi
  106005:	0f 84 1d 01 00 00    	je     106128 <MATOp_test_split_coalesce+0x178>
  10600b:	85 c0                	test   %eax,%eax
  10600d:	0f 84 15 01 00 00    	je     106128 <MATOp_test_split_coalesce+0x178>
        if (pb) pfree_n(pb, 0);
        return 1;
    }

    /* Both must be allocated */
    if (at_is_allocated(pa) != 1 || at_is_allocated(pb) != 1) {
  106013:	83 ec 0c             	sub    $0xc,%esp
  106016:	56                   	push   %esi
  106017:	e8 44 ee ff ff       	call   104e60 <at_is_allocated>
  10601c:	83 c4 10             	add    $0x10,%esp
  10601f:	83 f8 01             	cmp    $0x1,%eax
  106022:	74 74                	je     106098 <MATOp_test_split_coalesce+0xe8>
        dprintf("test split_coalesce failed: pages not marked allocated\n");
  106024:	83 ec 0c             	sub    $0xc,%esp
  106027:	8d 83 70 a1 ff ff    	lea    -0x5e90(%ebx),%eax
  10602d:	50                   	push   %eax
  10602e:	e8 69 cd ff ff       	call   102d9c <dprintf>
        pfree_n(pa, 0);
  106033:	59                   	pop    %ecx
  106034:	58                   	pop    %eax
  106035:	6a 00                	push   $0x0
  106037:	56                   	push   %esi
  106038:	e8 23 fc ff ff       	call   105c60 <pfree_n>
        pfree_n(pb, 0);
  10603d:	58                   	pop    %eax
  10603e:	5a                   	pop    %edx
  10603f:	6a 00                	push   $0x0
  106041:	57                   	push   %edi
  106042:	e8 19 fc ff ff       	call   105c60 <pfree_n>
        return 1;
  106047:	83 c4 10             	add    $0x10,%esp
        return 1;
  10604a:	b8 01 00 00 00       	mov    $0x1,%eax
    }
    pfree_n(pi1, 1);

    dprintf("test split_coalesce passed.\n");
    return 0;
}
  10604f:	5b                   	pop    %ebx
  106050:	5e                   	pop    %esi
  106051:	5f                   	pop    %edi
  106052:	c3                   	ret
  106053:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        dprintf("test split_coalesce failed: order-1 block %u not 2-aligned\n", pi1);
  106058:	83 ec 08             	sub    $0x8,%esp
  10605b:	50                   	push   %eax
  10605c:	8d 83 fc a0 ff ff    	lea    -0x5f04(%ebx),%eax
  106062:	50                   	push   %eax
  106063:	e8 34 cd ff ff       	call   102d9c <dprintf>
        pfree_n(pi1, 1);
  106068:	59                   	pop    %ecx
  106069:	5f                   	pop    %edi
  10606a:	6a 01                	push   $0x1
  10606c:	56                   	push   %esi
  10606d:	e8 ee fb ff ff       	call   105c60 <pfree_n>
        return 1;
  106072:	83 c4 10             	add    $0x10,%esp
  106075:	eb d3                	jmp    10604a <MATOp_test_split_coalesce+0x9a>
  106077:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10607e:	00 
  10607f:	90                   	nop
        dprintf("test split_coalesce failed: initial palloc_n(1) returned 0\n");
  106080:	83 ec 0c             	sub    $0xc,%esp
  106083:	8d 83 c0 a0 ff ff    	lea    -0x5f40(%ebx),%eax
  106089:	50                   	push   %eax
  10608a:	e8 0d cd ff ff       	call   102d9c <dprintf>
        return 1;
  10608f:	83 c4 10             	add    $0x10,%esp
  106092:	eb b6                	jmp    10604a <MATOp_test_split_coalesce+0x9a>
  106094:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (at_is_allocated(pa) != 1 || at_is_allocated(pb) != 1) {
  106098:	83 ec 0c             	sub    $0xc,%esp
  10609b:	57                   	push   %edi
  10609c:	e8 bf ed ff ff       	call   104e60 <at_is_allocated>
  1060a1:	83 c4 10             	add    $0x10,%esp
  1060a4:	83 f8 01             	cmp    $0x1,%eax
  1060a7:	0f 85 77 ff ff ff    	jne    106024 <MATOp_test_split_coalesce+0x74>
    pfree_n(pa, 0);
  1060ad:	83 ec 08             	sub    $0x8,%esp
  1060b0:	6a 00                	push   $0x0
  1060b2:	56                   	push   %esi
  1060b3:	e8 a8 fb ff ff       	call   105c60 <pfree_n>
    pfree_n(pb, 0);
  1060b8:	58                   	pop    %eax
  1060b9:	5a                   	pop    %edx
  1060ba:	6a 00                	push   $0x0
  1060bc:	57                   	push   %edi
  1060bd:	e8 9e fb ff ff       	call   105c60 <pfree_n>
    if (at_is_allocated(pa) != 0 || at_is_allocated(pb) != 0) {
  1060c2:	89 34 24             	mov    %esi,(%esp)
  1060c5:	e8 96 ed ff ff       	call   104e60 <at_is_allocated>
  1060ca:	83 c4 10             	add    $0x10,%esp
  1060cd:	85 c0                	test   %eax,%eax
  1060cf:	0f 85 9b 00 00 00    	jne    106170 <MATOp_test_split_coalesce+0x1c0>
  1060d5:	83 ec 0c             	sub    $0xc,%esp
  1060d8:	57                   	push   %edi
  1060d9:	e8 82 ed ff ff       	call   104e60 <at_is_allocated>
  1060de:	83 c4 10             	add    $0x10,%esp
  1060e1:	85 c0                	test   %eax,%eax
  1060e3:	0f 85 87 00 00 00    	jne    106170 <MATOp_test_split_coalesce+0x1c0>
    pi1 = palloc_n(1);
  1060e9:	83 ec 0c             	sub    $0xc,%esp
  1060ec:	6a 01                	push   $0x1
  1060ee:	e8 4d fb ff ff       	call   105c40 <palloc_n>
    if (pi1 == 0) {
  1060f3:	83 c4 10             	add    $0x10,%esp
  1060f6:	85 c0                	test   %eax,%eax
  1060f8:	0f 84 89 00 00 00    	je     106187 <MATOp_test_split_coalesce+0x1d7>
    pfree_n(pi1, 1);
  1060fe:	83 ec 08             	sub    $0x8,%esp
  106101:	6a 01                	push   $0x1
  106103:	50                   	push   %eax
  106104:	e8 57 fb ff ff       	call   105c60 <pfree_n>
    dprintf("test split_coalesce passed.\n");
  106109:	8d 83 cc 99 ff ff    	lea    -0x6634(%ebx),%eax
  10610f:	89 04 24             	mov    %eax,(%esp)
  106112:	e8 85 cc ff ff       	call   102d9c <dprintf>
    return 0;
  106117:	83 c4 10             	add    $0x10,%esp
  10611a:	31 c0                	xor    %eax,%eax
  10611c:	e9 2e ff ff ff       	jmp    10604f <MATOp_test_split_coalesce+0x9f>
  106121:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        dprintf("test split_coalesce failed: order-0 alloc returned 0\n");
  106128:	83 ec 0c             	sub    $0xc,%esp
  10612b:	8d 83 38 a1 ff ff    	lea    -0x5ec8(%ebx),%eax
  106131:	50                   	push   %eax
  106132:	e8 65 cc ff ff       	call   102d9c <dprintf>
        if (pa) pfree_n(pa, 0);
  106137:	83 c4 10             	add    $0x10,%esp
  10613a:	85 f6                	test   %esi,%esi
  10613c:	75 22                	jne    106160 <MATOp_test_split_coalesce+0x1b0>
        if (pb) pfree_n(pb, 0);
  10613e:	85 ff                	test   %edi,%edi
  106140:	0f 84 04 ff ff ff    	je     10604a <MATOp_test_split_coalesce+0x9a>
  106146:	83 ec 08             	sub    $0x8,%esp
  106149:	6a 00                	push   $0x0
  10614b:	57                   	push   %edi
  10614c:	e8 0f fb ff ff       	call   105c60 <pfree_n>
  106151:	83 c4 10             	add    $0x10,%esp
  106154:	e9 f1 fe ff ff       	jmp    10604a <MATOp_test_split_coalesce+0x9a>
  106159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (pa) pfree_n(pa, 0);
  106160:	83 ec 08             	sub    $0x8,%esp
  106163:	6a 00                	push   $0x0
  106165:	56                   	push   %esi
  106166:	e8 f5 fa ff ff       	call   105c60 <pfree_n>
  10616b:	83 c4 10             	add    $0x10,%esp
  10616e:	eb ce                	jmp    10613e <MATOp_test_split_coalesce+0x18e>
        dprintf("test split_coalesce failed: pages still allocated after free\n");
  106170:	83 ec 0c             	sub    $0xc,%esp
  106173:	8d 83 a8 a1 ff ff    	lea    -0x5e58(%ebx),%eax
  106179:	50                   	push   %eax
  10617a:	e8 1d cc ff ff       	call   102d9c <dprintf>
        return 1;
  10617f:	83 c4 10             	add    $0x10,%esp
  106182:	e9 c3 fe ff ff       	jmp    10604a <MATOp_test_split_coalesce+0x9a>
        dprintf("test split_coalesce failed: re-alloc order-1 returned 0 (coalesce broken?)\n");
  106187:	83 ec 0c             	sub    $0xc,%esp
  10618a:	8d 83 e8 a1 ff ff    	lea    -0x5e18(%ebx),%eax
  106190:	50                   	push   %eax
  106191:	e8 06 cc ff ff       	call   102d9c <dprintf>
        return 1;
  106196:	83 c4 10             	add    $0x10,%esp
  106199:	e9 ac fe ff ff       	jmp    10604a <MATOp_test_split_coalesce+0x9a>
  10619e:	66 90                	xchg   %ax,%ax

001061a0 <MATOp_test_backward_compat>:
/**
 * Test backward compatibility: palloc() and pfree() still behave as
 * single-page allocators.
 */
int MATOp_test_backward_compat()
{
  1061a0:	57                   	push   %edi
  1061a1:	56                   	push   %esi
  1061a2:	53                   	push   %ebx
  1061a3:	e8 18 a2 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1061a8:	81 c3 4c 9e 00 00    	add    $0x9e4c,%ebx
    unsigned int p1, p2;

    p1 = palloc();
  1061ae:	e8 cd fa ff ff       	call   105c80 <palloc>
    if (p1 == 0) {
  1061b3:	85 c0                	test   %eax,%eax
  1061b5:	0f 84 c5 00 00 00    	je     106280 <MATOp_test_backward_compat+0xe0>
  1061bb:	89 c6                	mov    %eax,%esi
        dprintf("test backward_compat failed: palloc() returned 0\n");
        return 1;
    }
    if (p1 < VM_USERLO_PI || p1 >= VM_USERHI_PI) {
  1061bd:	8d 80 00 00 fc ff    	lea    -0x40000(%eax),%eax
  1061c3:	3d ff ff 0a 00       	cmp    $0xaffff,%eax
  1061c8:	0f 87 a2 00 00 00    	ja     106270 <MATOp_test_backward_compat+0xd0>
        dprintf("test backward_compat failed: palloc() out of range (%u)\n", p1);
        pfree(p1);
        return 1;
    }
    if (at_is_allocated(p1) != 1) {
  1061ce:	83 ec 0c             	sub    $0xc,%esp
  1061d1:	56                   	push   %esi
  1061d2:	e8 89 ec ff ff       	call   104e60 <at_is_allocated>
  1061d7:	83 c4 10             	add    $0x10,%esp
  1061da:	83 f8 01             	cmp    $0x1,%eax
  1061dd:	74 29                	je     106208 <MATOp_test_backward_compat+0x68>
        dprintf("test backward_compat failed: page %u not allocated\n", p1);
  1061df:	83 ec 08             	sub    $0x8,%esp
  1061e2:	8d 83 a4 a2 ff ff    	lea    -0x5d5c(%ebx),%eax
  1061e8:	56                   	push   %esi
        dprintf("test backward_compat failed: palloc() out of range (%u)\n", p1);
  1061e9:	50                   	push   %eax
  1061ea:	e8 ad cb ff ff       	call   102d9c <dprintf>
        pfree(p1);
  1061ef:	89 34 24             	mov    %esi,(%esp)
  1061f2:	e8 99 fa ff ff       	call   105c90 <pfree>
        return 1;
  1061f7:	83 c4 10             	add    $0x10,%esp
        return 1;
  1061fa:	b8 01 00 00 00       	mov    $0x1,%eax
        return 1;
    }

    dprintf("test backward_compat passed.\n");
    return 0;
}
  1061ff:	5b                   	pop    %ebx
  106200:	5e                   	pop    %esi
  106201:	5f                   	pop    %edi
  106202:	c3                   	ret
  106203:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    p2 = palloc();
  106208:	e8 73 fa ff ff       	call   105c80 <palloc>
  10620d:	89 c7                	mov    %eax,%edi
    if (p2 == 0 || p2 == p1) {
  10620f:	85 c0                	test   %eax,%eax
  106211:	0f 84 89 00 00 00    	je     1062a0 <MATOp_test_backward_compat+0x100>
  106217:	39 c6                	cmp    %eax,%esi
  106219:	0f 84 81 00 00 00    	je     1062a0 <MATOp_test_backward_compat+0x100>
    pfree(p1);
  10621f:	83 ec 0c             	sub    $0xc,%esp
  106222:	56                   	push   %esi
  106223:	e8 68 fa ff ff       	call   105c90 <pfree>
    pfree(p2);
  106228:	89 3c 24             	mov    %edi,(%esp)
  10622b:	e8 60 fa ff ff       	call   105c90 <pfree>
    if (at_is_allocated(p1) != 0 || at_is_allocated(p2) != 0) {
  106230:	89 34 24             	mov    %esi,(%esp)
  106233:	e8 28 ec ff ff       	call   104e60 <at_is_allocated>
  106238:	83 c4 10             	add    $0x10,%esp
  10623b:	85 c0                	test   %eax,%eax
  10623d:	0f 85 9d 00 00 00    	jne    1062e0 <MATOp_test_backward_compat+0x140>
  106243:	83 ec 0c             	sub    $0xc,%esp
  106246:	57                   	push   %edi
  106247:	e8 14 ec ff ff       	call   104e60 <at_is_allocated>
  10624c:	83 c4 10             	add    $0x10,%esp
  10624f:	85 c0                	test   %eax,%eax
  106251:	0f 85 89 00 00 00    	jne    1062e0 <MATOp_test_backward_compat+0x140>
    dprintf("test backward_compat passed.\n");
  106257:	83 ec 0c             	sub    $0xc,%esp
  10625a:	8d 83 e9 99 ff ff    	lea    -0x6617(%ebx),%eax
  106260:	50                   	push   %eax
  106261:	e8 36 cb ff ff       	call   102d9c <dprintf>
    return 0;
  106266:	83 c4 10             	add    $0x10,%esp
  106269:	31 c0                	xor    %eax,%eax
  10626b:	eb 92                	jmp    1061ff <MATOp_test_backward_compat+0x5f>
  10626d:	8d 76 00             	lea    0x0(%esi),%esi
        dprintf("test backward_compat failed: palloc() out of range (%u)\n", p1);
  106270:	83 ec 08             	sub    $0x8,%esp
  106273:	8d 83 68 a2 ff ff    	lea    -0x5d98(%ebx),%eax
  106279:	56                   	push   %esi
  10627a:	e9 6a ff ff ff       	jmp    1061e9 <MATOp_test_backward_compat+0x49>
  10627f:	90                   	nop
        dprintf("test backward_compat failed: palloc() returned 0\n");
  106280:	83 ec 0c             	sub    $0xc,%esp
  106283:	8d 83 34 a2 ff ff    	lea    -0x5dcc(%ebx),%eax
  106289:	50                   	push   %eax
  10628a:	e8 0d cb ff ff       	call   102d9c <dprintf>
        return 1;
  10628f:	83 c4 10             	add    $0x10,%esp
  106292:	e9 63 ff ff ff       	jmp    1061fa <MATOp_test_backward_compat+0x5a>
  106297:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10629e:	00 
  10629f:	90                   	nop
        dprintf("test backward_compat failed: second palloc() returned %u (first was %u)\n", p2, p1);
  1062a0:	83 ec 04             	sub    $0x4,%esp
  1062a3:	8d 83 d8 a2 ff ff    	lea    -0x5d28(%ebx),%eax
  1062a9:	56                   	push   %esi
  1062aa:	57                   	push   %edi
  1062ab:	50                   	push   %eax
  1062ac:	e8 eb ca ff ff       	call   102d9c <dprintf>
        pfree(p1);
  1062b1:	89 34 24             	mov    %esi,(%esp)
  1062b4:	e8 d7 f9 ff ff       	call   105c90 <pfree>
        if (p2 && p2 != p1) pfree(p2);
  1062b9:	83 c4 10             	add    $0x10,%esp
  1062bc:	85 ff                	test   %edi,%edi
  1062be:	0f 84 36 ff ff ff    	je     1061fa <MATOp_test_backward_compat+0x5a>
  1062c4:	39 fe                	cmp    %edi,%esi
  1062c6:	0f 84 2e ff ff ff    	je     1061fa <MATOp_test_backward_compat+0x5a>
  1062cc:	83 ec 0c             	sub    $0xc,%esp
  1062cf:	57                   	push   %edi
  1062d0:	e8 bb f9 ff ff       	call   105c90 <pfree>
  1062d5:	83 c4 10             	add    $0x10,%esp
  1062d8:	e9 1d ff ff ff       	jmp    1061fa <MATOp_test_backward_compat+0x5a>
  1062dd:	8d 76 00             	lea    0x0(%esi),%esi
        dprintf("test backward_compat failed: pages still allocated after pfree\n");
  1062e0:	83 ec 0c             	sub    $0xc,%esp
  1062e3:	8d 83 24 a3 ff ff    	lea    -0x5cdc(%ebx),%eax
  1062e9:	50                   	push   %eax
  1062ea:	e8 ad ca ff ff       	call   102d9c <dprintf>
        return 1;
  1062ef:	83 c4 10             	add    $0x10,%esp
  1062f2:	e9 03 ff ff ff       	jmp    1061fa <MATOp_test_backward_compat+0x5a>
  1062f7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1062fe:	00 
  1062ff:	90                   	nop

00106300 <test_MATOp>:

int test_MATOp()
{
  106300:	53                   	push   %ebx
  106301:	83 ec 08             	sub    $0x8,%esp
    return MATOp_test1()
  106304:	e8 97 f9 ff ff       	call   105ca0 <MATOp_test1>
  106309:	89 c3                	mov    %eax,%ebx
         + MATOp_test_palloc_n_orders()
  10630b:	e8 90 fa ff ff       	call   105da0 <MATOp_test_palloc_n_orders>
  106310:	01 c3                	add    %eax,%ebx
         + MATOp_test_split_coalesce()
  106312:	e8 99 fc ff ff       	call   105fb0 <MATOp_test_split_coalesce>
  106317:	01 c3                	add    %eax,%ebx
         + MATOp_test_backward_compat();
  106319:	e8 82 fe ff ff       	call   1061a0 <MATOp_test_backward_compat>
}
  10631e:	83 c4 08             	add    $0x8,%esp
         + MATOp_test_backward_compat();
  106321:	01 d8                	add    %ebx,%eax
}
  106323:	5b                   	pop    %ebx
  106324:	c3                   	ret
  106325:	66 90                	xchg   %ax,%ax
  106327:	66 90                	xchg   %ax,%ax
  106329:	66 90                	xchg   %ax,%ax
  10632b:	66 90                	xchg   %ax,%ax
  10632d:	66 90                	xchg   %ax,%ax
  10632f:	90                   	nop

00106330 <container_init>:
/**
 * Initializes the container data for the root process (the one with index 0).
 * The root process is the one that gets spawned first by the kernel.
 */
void container_init(unsigned int mbi_addr)
{
  106330:	55                   	push   %ebp
  106331:	57                   	push   %edi
  106332:	56                   	push   %esi
  106333:	53                   	push   %ebx
  106334:	e8 87 a0 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  106339:	81 c3 bb 9c 00 00    	add    $0x9cbb,%ebx
  10633f:	83 ec 18             	sub    $0x18,%esp
    unsigned int real_quota;
    // TODO: define your local variables here.
    unsigned int nps, idx;
   

    pmem_init(mbi_addr);
  106342:	ff 74 24 2c          	push   0x2c(%esp)
  106346:	e8 55 f1 ff ff       	call   1054a0 <pmem_init>
    buddy_init();  // Build buddy free lists from the AT after pmem_init
  10634b:	e8 c0 f6 ff ff       	call   105a10 <buddy_init>
    /**
     * TODO: Compute the available quota and store it into the variable real_quota.
     * It should be the number of the unallocated pages with the normal permission
     * in the physical memory allocation table.
     */
    nps = get_nps();
  106350:	e8 7b ea ff ff       	call   104dd0 <get_nps>
    for (idx = 0; idx < nps; idx++) {
  106355:	83 c4 10             	add    $0x10,%esp
  106358:	85 c0                	test   %eax,%eax
  10635a:	0f 84 90 00 00 00    	je     1063f0 <container_init+0xc0>
  106360:	89 c7                	mov    %eax,%edi
  106362:	31 f6                	xor    %esi,%esi
    real_quota = 0;
  106364:	31 ed                	xor    %ebp,%ebp
  106366:	eb 0f                	jmp    106377 <container_init+0x47>
  106368:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10636f:	00 
    for (idx = 0; idx < nps; idx++) {
  106370:	83 c6 01             	add    $0x1,%esi
  106373:	39 f7                	cmp    %esi,%edi
  106375:	74 29                	je     1063a0 <container_init+0x70>
        if (at_is_norm(idx) && !at_is_allocated(idx)) {
  106377:	83 ec 0c             	sub    $0xc,%esp
  10637a:	56                   	push   %esi
  10637b:	e8 90 ea ff ff       	call   104e10 <at_is_norm>
  106380:	83 c4 10             	add    $0x10,%esp
  106383:	85 c0                	test   %eax,%eax
  106385:	74 e9                	je     106370 <container_init+0x40>
  106387:	83 ec 0c             	sub    $0xc,%esp
  10638a:	56                   	push   %esi
  10638b:	e8 d0 ea ff ff       	call   104e60 <at_is_allocated>
  106390:	83 c4 10             	add    $0x10,%esp
            real_quota++;
  106393:	83 f8 01             	cmp    $0x1,%eax
  106396:	83 d5 00             	adc    $0x0,%ebp
    for (idx = 0; idx < nps; idx++) {
  106399:	83 c6 01             	add    $0x1,%esi
  10639c:	39 f7                	cmp    %esi,%edi
  10639e:	75 d7                	jne    106377 <container_init+0x47>
        }
    }

    KERN_DEBUG("\nreal quota: %d\n\n", real_quota);

    CONTAINER[0].quota = real_quota;
  1063a0:	89 ee                	mov    %ebp,%esi
    KERN_DEBUG("\nreal quota: %d\n\n", real_quota);
  1063a2:	8d 83 07 9a ff ff    	lea    -0x65f9(%ebx),%eax
  1063a8:	55                   	push   %ebp
  1063a9:	50                   	push   %eax
  1063aa:	8d 83 64 a3 ff ff    	lea    -0x5c9c(%ebx),%eax
  1063b0:	6a 2b                	push   $0x2b
  1063b2:	50                   	push   %eax
  1063b3:	e8 11 c7 ff ff       	call   102ac9 <debug_normal>
    CONTAINER[0].quota = real_quota;
  1063b8:	89 b3 ac cc 84 01    	mov    %esi,0x184ccac(%ebx)
    CONTAINER[0].usage = 0;
  1063be:	c7 83 b0 cc 84 01 00 	movl   $0x0,0x184ccb0(%ebx)
  1063c5:	00 00 00 
    CONTAINER[0].parent = 0;
  1063c8:	c7 83 b4 cc 84 01 00 	movl   $0x0,0x184ccb4(%ebx)
  1063cf:	00 00 00 
    CONTAINER[0].nchildren = 0;
  1063d2:	c7 83 b8 cc 84 01 00 	movl   $0x0,0x184ccb8(%ebx)
  1063d9:	00 00 00 
    CONTAINER[0].used = 1;
  1063dc:	c7 83 bc cc 84 01 01 	movl   $0x1,0x184ccbc(%ebx)
  1063e3:	00 00 00 
}
  1063e6:	83 c4 1c             	add    $0x1c,%esp
  1063e9:	5b                   	pop    %ebx
  1063ea:	5e                   	pop    %esi
  1063eb:	5f                   	pop    %edi
  1063ec:	5d                   	pop    %ebp
  1063ed:	c3                   	ret
  1063ee:	66 90                	xchg   %ax,%ax
    real_quota = 0;
  1063f0:	31 ed                	xor    %ebp,%ebp
    for (idx = 0; idx < nps; idx++) {
  1063f2:	31 f6                	xor    %esi,%esi
  1063f4:	eb ac                	jmp    1063a2 <container_init+0x72>
  1063f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1063fd:	00 
  1063fe:	66 90                	xchg   %ax,%ax

00106400 <container_get_parent>:

// Get the id of parent process of process # [id].
unsigned int container_get_parent(unsigned int id)
{
    // TODO
    return CONTAINER[id].parent;
  106400:	e8 b7 9f ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  106405:	81 c2 ef 9b 00 00    	add    $0x9bef,%edx
{
  10640b:	8b 44 24 04          	mov    0x4(%esp),%eax
    return CONTAINER[id].parent;
  10640f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  106412:	8b 84 82 b4 cc 84 01 	mov    0x184ccb4(%edx,%eax,4),%eax
}
  106419:	c3                   	ret
  10641a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00106420 <container_get_nchildren>:

// Get the number of children of process # [id].
unsigned int container_get_nchildren(unsigned int id)
{
    // TODO
    return CONTAINER[id].nchildren;
  106420:	e8 97 9f ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  106425:	81 c2 cf 9b 00 00    	add    $0x9bcf,%edx
{
  10642b:	8b 44 24 04          	mov    0x4(%esp),%eax
    return CONTAINER[id].nchildren;
  10642f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  106432:	8b 84 82 b8 cc 84 01 	mov    0x184ccb8(%edx,%eax,4),%eax
}
  106439:	c3                   	ret
  10643a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00106440 <container_get_quota>:

// Get the maximum memory quota of process # [id].
unsigned int container_get_quota(unsigned int id)
{
    // TODO
    return CONTAINER[id].quota;
  106440:	e8 77 9f ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  106445:	81 c2 af 9b 00 00    	add    $0x9baf,%edx
{
  10644b:	8b 44 24 04          	mov    0x4(%esp),%eax
    return CONTAINER[id].quota;
  10644f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  106452:	8b 84 82 ac cc 84 01 	mov    0x184ccac(%edx,%eax,4),%eax
}
  106459:	c3                   	ret
  10645a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00106460 <container_get_usage>:

// Get the current memory usage of process # [id].
unsigned int container_get_usage(unsigned int id)
{
    // TODO
    return CONTAINER[id].usage;
  106460:	e8 57 9f ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  106465:	81 c2 8f 9b 00 00    	add    $0x9b8f,%edx
{
  10646b:	8b 44 24 04          	mov    0x4(%esp),%eax
    return CONTAINER[id].usage;
  10646f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  106472:	8b 84 82 b0 cc 84 01 	mov    0x184ccb0(%edx,%eax,4),%eax
}
  106479:	c3                   	ret
  10647a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00106480 <container_can_consume>:
// Determines whether the process # [id] can consume an extra
// [n] pages of memory. If so, returns 1, otherwise, returns 0.
unsigned int container_can_consume(unsigned int id, unsigned int n)
{
    // TODO
    return (CONTAINER[id].quota - CONTAINER[id].usage >= n) ? 1 : 0;
  106480:	e8 37 9f ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  106485:	81 c2 6f 9b 00 00    	add    $0x9b6f,%edx
{
  10648b:	8b 44 24 04          	mov    0x4(%esp),%eax
    return (CONTAINER[id].quota - CONTAINER[id].usage >= n) ? 1 : 0;
  10648f:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
  106492:	8b 84 8a ac cc 84 01 	mov    0x184ccac(%edx,%ecx,4),%eax
  106499:	2b 84 8a b0 cc 84 01 	sub    0x184ccb0(%edx,%ecx,4),%eax
  1064a0:	3b 44 24 08          	cmp    0x8(%esp),%eax
  1064a4:	0f 93 c0             	setae  %al
  1064a7:	0f b6 c0             	movzbl %al,%eax
}
  1064aa:	c3                   	ret
  1064ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

001064b0 <container_split>:
 * You can assume it is safe to allocate [quota] pages
 * (the check is already done outside before calling this function).
 * Returns the container index for the new child process.
 */
unsigned int container_split(unsigned int id, unsigned int quota)
{
  1064b0:	57                   	push   %edi
  1064b1:	56                   	push   %esi
  1064b2:	53                   	push   %ebx
  1064b3:	8b 54 24 10          	mov    0x10(%esp),%edx
  1064b7:	e8 04 9f ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1064bc:	81 c3 38 9b 00 00    	add    $0x9b38,%ebx
  1064c2:	8b 74 24 14          	mov    0x14(%esp),%esi
    unsigned int child, nc;

    nc = CONTAINER[id].nchildren;
  1064c6:	8d 04 92             	lea    (%edx,%edx,4),%eax
  1064c9:	8d 8c 83 ac cc 84 01 	lea    0x184ccac(%ebx,%eax,4),%ecx
    child = id * MAX_CHILDREN + 1 + nc;  // container index for the child process
  1064d0:	8d 44 52 01          	lea    0x1(%edx,%edx,2),%eax
    nc = CONTAINER[id].nchildren;
  1064d4:	8b 79 0c             	mov    0xc(%ecx),%edi
    child = id * MAX_CHILDREN + 1 + nc;  // container index for the child process
  1064d7:	01 f8                	add    %edi,%eax

    if (NUM_IDS <= child) {
  1064d9:	83 f8 3f             	cmp    $0x3f,%eax
  1064dc:	77 3a                	ja     106518 <container_split+0x68>

    /**
     * TODO: Update the container structure of both parent and child process appropriately.
     */
    // update parent
    CONTAINER[id].nchildren++;
  1064de:	83 c7 01             	add    $0x1,%edi
    CONTAINER[id].usage += quota;
  1064e1:	01 71 04             	add    %esi,0x4(%ecx)
    CONTAINER[id].nchildren++;
  1064e4:	89 79 0c             	mov    %edi,0xc(%ecx)

    //update child
    CONTAINER[child].quota = quota;
  1064e7:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
  1064ea:	c1 e1 02             	shl    $0x2,%ecx
  1064ed:	8d bc 0b ac cc 84 01 	lea    0x184ccac(%ebx,%ecx,1),%edi
  1064f4:	89 37                	mov    %esi,(%edi)
    CONTAINER[child].usage = 0;
  1064f6:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%edi)
    CONTAINER[child].parent = id;
  1064fd:	89 57 08             	mov    %edx,0x8(%edi)
    CONTAINER[child].nchildren = 0;
  106500:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
    CONTAINER[child].used = 1;
  106507:	c7 47 10 01 00 00 00 	movl   $0x1,0x10(%edi)

    return child;
}
  10650e:	5b                   	pop    %ebx
  10650f:	5e                   	pop    %esi
  106510:	5f                   	pop    %edi
  106511:	c3                   	ret
  106512:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106518:	5b                   	pop    %ebx
        return NUM_IDS;
  106519:	b8 40 00 00 00       	mov    $0x40,%eax
}
  10651e:	5e                   	pop    %esi
  10651f:	5f                   	pop    %edi
  106520:	c3                   	ret
  106521:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106528:	00 
  106529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00106530 <container_alloc>:
 * Allocates one more page for process # [id], given that this will not exceed the quota.
 * The container structure should be updated accordingly after the allocation.
 * Returns the page index of the allocated page, or 0 in the case of failure.
 */
unsigned int container_alloc(unsigned int id)
{
  106530:	56                   	push   %esi
  106531:	53                   	push   %ebx
  106532:	e8 89 9e ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  106537:	81 c3 bd 9a 00 00    	add    $0x9abd,%ebx
  10653d:	83 ec 04             	sub    $0x4,%esp
  106540:	8b 74 24 10          	mov    0x10(%esp),%esi
    /*
     * TODO: Implement the function here.
     */
    unsigned int pid; //page id
    pid = palloc();
  106544:	e8 37 f7 ff ff       	call   105c80 <palloc>

    if (pid==0) return 0; //process failed
  106549:	85 c0                	test   %eax,%eax
  10654b:	74 0b                	je     106558 <container_alloc+0x28>
    CONTAINER[id].usage++;
  10654d:	8d 14 b6             	lea    (%esi,%esi,4),%edx
  106550:	83 84 93 b0 cc 84 01 	addl   $0x1,0x184ccb0(%ebx,%edx,4)
  106557:	01 


    return pid;
}
  106558:	83 c4 04             	add    $0x4,%esp
  10655b:	5b                   	pop    %ebx
  10655c:	5e                   	pop    %esi
  10655d:	c3                   	ret
  10655e:	66 90                	xchg   %ax,%ax

00106560 <container_free>:

// Frees the physical page and reduces the usage by 1.
void container_free(unsigned int id, unsigned int page_index)
{
  106560:	56                   	push   %esi
  106561:	53                   	push   %ebx
  106562:	e8 59 9e ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  106567:	81 c3 8d 9a 00 00    	add    $0x9a8d,%ebx
  10656d:	83 ec 10             	sub    $0x10,%esp
  106570:	8b 74 24 1c          	mov    0x1c(%esp),%esi
    // TODO
    pfree(page_index);
  106574:	ff 74 24 20          	push   0x20(%esp)
  106578:	e8 13 f7 ff ff       	call   105c90 <pfree>
    CONTAINER[id].usage--;
  10657d:	8d 04 b6             	lea    (%esi,%esi,4),%eax
  106580:	83 ac 83 b0 cc 84 01 	subl   $0x1,0x184ccb0(%ebx,%eax,4)
  106587:	01 

}
  106588:	83 c4 14             	add    $0x14,%esp
  10658b:	5b                   	pop    %ebx
  10658c:	5e                   	pop    %esi
  10658d:	c3                   	ret
  10658e:	66 90                	xchg   %ax,%ax

00106590 <container_alloc_n>:
 * Allocates 2^order consecutive, aligned physical pages for process # [id].
 * Checks the quota before allocating.
 * Returns the starting page index, or 0 on failure.
 */
unsigned int container_alloc_n(unsigned int id, unsigned int order)
{
  106590:	57                   	push   %edi
  106591:	56                   	push   %esi
    unsigned int count = 1u << order;
  106592:	be 01 00 00 00       	mov    $0x1,%esi
{
  106597:	53                   	push   %ebx
  106598:	8b 44 24 10          	mov    0x10(%esp),%eax
  10659c:	e8 1f 9e ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1065a1:	81 c3 53 9a 00 00    	add    $0x9a53,%ebx
  1065a7:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    return (CONTAINER[id].quota - CONTAINER[id].usage >= n) ? 1 : 0;
  1065ab:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1065ae:	c1 e0 02             	shl    $0x2,%eax
    unsigned int count = 1u << order;
  1065b1:	d3 e6                	shl    %cl,%esi
    return (CONTAINER[id].quota - CONTAINER[id].usage >= n) ? 1 : 0;
  1065b3:	8d bc 03 ac cc 84 01 	lea    0x184ccac(%ebx,%eax,1),%edi
  1065ba:	8b 94 03 ac cc 84 01 	mov    0x184ccac(%ebx,%eax,1),%edx
    unsigned int pid;

    if (!container_can_consume(id, count))
        return 0;
  1065c1:	31 c0                	xor    %eax,%eax
    return (CONTAINER[id].quota - CONTAINER[id].usage >= n) ? 1 : 0;
  1065c3:	2b 57 04             	sub    0x4(%edi),%edx
    if (!container_can_consume(id, count))
  1065c6:	39 f2                	cmp    %esi,%edx
  1065c8:	73 06                	jae    1065d0 <container_alloc_n+0x40>
    if (pid == 0)
        return 0;

    CONTAINER[id].usage += count;
    return pid;
}
  1065ca:	5b                   	pop    %ebx
  1065cb:	5e                   	pop    %esi
  1065cc:	5f                   	pop    %edi
  1065cd:	c3                   	ret
  1065ce:	66 90                	xchg   %ax,%ax
    pid = palloc_n(order);
  1065d0:	83 ec 0c             	sub    $0xc,%esp
  1065d3:	51                   	push   %ecx
  1065d4:	e8 67 f6 ff ff       	call   105c40 <palloc_n>
    if (pid == 0)
  1065d9:	83 c4 10             	add    $0x10,%esp
  1065dc:	85 c0                	test   %eax,%eax
  1065de:	74 ea                	je     1065ca <container_alloc_n+0x3a>
    CONTAINER[id].usage += count;
  1065e0:	01 77 04             	add    %esi,0x4(%edi)
}
  1065e3:	5b                   	pop    %ebx
  1065e4:	5e                   	pop    %esi
  1065e5:	5f                   	pop    %edi
  1065e6:	c3                   	ret
  1065e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1065ee:	00 
  1065ef:	90                   	nop

001065f0 <container_free_n>:

/**
 * Frees a 2^order block of physical pages and reduces usage accordingly.
 */
void container_free_n(unsigned int id, unsigned int page_index, unsigned int order)
{
  1065f0:	57                   	push   %edi
  1065f1:	56                   	push   %esi
  1065f2:	53                   	push   %ebx
  1065f3:	8b 74 24 18          	mov    0x18(%esp),%esi
    unsigned int count = 1u << order;
    pfree_n(page_index, order);
  1065f7:	e8 c4 9d ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1065fc:	81 c3 f8 99 00 00    	add    $0x99f8,%ebx
{
  106602:	8b 7c 24 10          	mov    0x10(%esp),%edi
    pfree_n(page_index, order);
  106606:	83 ec 08             	sub    $0x8,%esp
  106609:	56                   	push   %esi
  10660a:	ff 74 24 20          	push   0x20(%esp)
  10660e:	e8 4d f6 ff ff       	call   105c60 <pfree_n>
    CONTAINER[id].usage -= count;
}
  106613:	83 c4 10             	add    $0x10,%esp
    CONTAINER[id].usage -= count;
  106616:	8d 14 bf             	lea    (%edi,%edi,4),%edx
    unsigned int count = 1u << order;
  106619:	89 f1                	mov    %esi,%ecx
  10661b:	b8 01 00 00 00       	mov    $0x1,%eax
  106620:	d3 e0                	shl    %cl,%eax
    CONTAINER[id].usage -= count;
  106622:	29 84 93 b0 cc 84 01 	sub    %eax,0x184ccb0(%ebx,%edx,4)
}
  106629:	5b                   	pop    %ebx
  10662a:	5e                   	pop    %esi
  10662b:	5f                   	pop    %edi
  10662c:	c3                   	ret
  10662d:	66 90                	xchg   %ax,%ax
  10662f:	90                   	nop

00106630 <MContainer_test1>:
#include <lib/debug.h>
#include "export.h"

int MContainer_test1()
{
  106630:	53                   	push   %ebx
  106631:	e8 8a 9d ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  106636:	81 c3 be 99 00 00    	add    $0x99be,%ebx
  10663c:	83 ec 14             	sub    $0x14,%esp
    if (container_get_quota(0) <= 10000) {
  10663f:	6a 00                	push   $0x0
  106641:	e8 fa fd ff ff       	call   106440 <container_get_quota>
  106646:	83 c4 10             	add    $0x10,%esp
  106649:	3d 10 27 00 00       	cmp    $0x2710,%eax
  10664e:	0f 86 7c 00 00 00    	jbe    1066d0 <MContainer_test1+0xa0>
        dprintf("test 1.1 failed: (%d <= 10000)\n", container_get_quota(0));
        return 1;
    }
    if (container_can_consume(0, 10000) != 1) {
  106654:	83 ec 08             	sub    $0x8,%esp
  106657:	68 10 27 00 00       	push   $0x2710
  10665c:	6a 00                	push   $0x0
  10665e:	e8 1d fe ff ff       	call   106480 <container_can_consume>
  106663:	83 c4 10             	add    $0x10,%esp
  106666:	83 f8 01             	cmp    $0x1,%eax
  106669:	75 35                	jne    1066a0 <MContainer_test1+0x70>
        dprintf("test 1.2 failed: (%d != 1)\n", container_can_consume(0, 10000));
        return 1;
    }
    if (container_can_consume(0, 10000000) != 0) {
  10666b:	83 ec 08             	sub    $0x8,%esp
  10666e:	68 80 96 98 00       	push   $0x989680
  106673:	6a 00                	push   $0x0
  106675:	e8 06 fe ff ff       	call   106480 <container_can_consume>
  10667a:	83 c4 10             	add    $0x10,%esp
  10667d:	85 c0                	test   %eax,%eax
  10667f:	75 6f                	jne    1066f0 <MContainer_test1+0xc0>
        dprintf("test 1.3 failed: (%d != 0)\n", container_can_consume(0, 10000000));
        return 1;
    }
    dprintf("test 1 passed.\n");
  106681:	83 ec 0c             	sub    $0xc,%esp
  106684:	8d 83 c4 98 ff ff    	lea    -0x673c(%ebx),%eax
  10668a:	50                   	push   %eax
  10668b:	e8 0c c7 ff ff       	call   102d9c <dprintf>
    return 0;
  106690:	83 c4 10             	add    $0x10,%esp
  106693:	31 c0                	xor    %eax,%eax
}
  106695:	83 c4 08             	add    $0x8,%esp
  106698:	5b                   	pop    %ebx
  106699:	c3                   	ret
  10669a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        dprintf("test 1.2 failed: (%d != 1)\n", container_can_consume(0, 10000));
  1066a0:	83 ec 08             	sub    $0x8,%esp
  1066a3:	68 10 27 00 00       	push   $0x2710
  1066a8:	6a 00                	push   $0x0
  1066aa:	e8 d1 fd ff ff       	call   106480 <container_can_consume>
  1066af:	5a                   	pop    %edx
  1066b0:	59                   	pop    %ecx
  1066b1:	50                   	push   %eax
  1066b2:	8d 83 5a 99 ff ff    	lea    -0x66a6(%ebx),%eax
  1066b8:	50                   	push   %eax
  1066b9:	e8 de c6 ff ff       	call   102d9c <dprintf>
        return 1;
  1066be:	83 c4 10             	add    $0x10,%esp
}
  1066c1:	83 c4 08             	add    $0x8,%esp
        return 1;
  1066c4:	b8 01 00 00 00       	mov    $0x1,%eax
}
  1066c9:	5b                   	pop    %ebx
  1066ca:	c3                   	ret
  1066cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        dprintf("test 1.1 failed: (%d <= 10000)\n", container_get_quota(0));
  1066d0:	83 ec 0c             	sub    $0xc,%esp
  1066d3:	6a 00                	push   $0x0
  1066d5:	e8 66 fd ff ff       	call   106440 <container_get_quota>
  1066da:	5a                   	pop    %edx
  1066db:	59                   	pop    %ecx
  1066dc:	50                   	push   %eax
  1066dd:	8d 83 88 a3 ff ff    	lea    -0x5c78(%ebx),%eax
  1066e3:	50                   	push   %eax
  1066e4:	e8 b3 c6 ff ff       	call   102d9c <dprintf>
        return 1;
  1066e9:	83 c4 10             	add    $0x10,%esp
  1066ec:	eb d3                	jmp    1066c1 <MContainer_test1+0x91>
  1066ee:	66 90                	xchg   %ax,%ax
        dprintf("test 1.3 failed: (%d != 0)\n", container_can_consume(0, 10000000));
  1066f0:	83 ec 08             	sub    $0x8,%esp
  1066f3:	68 80 96 98 00       	push   $0x989680
  1066f8:	6a 00                	push   $0x0
  1066fa:	e8 81 fd ff ff       	call   106480 <container_can_consume>
  1066ff:	5a                   	pop    %edx
  106700:	59                   	pop    %ecx
  106701:	50                   	push   %eax
  106702:	8d 83 19 9a ff ff    	lea    -0x65e7(%ebx),%eax
  106708:	50                   	push   %eax
  106709:	e8 8e c6 ff ff       	call   102d9c <dprintf>
        return 1;
  10670e:	83 c4 10             	add    $0x10,%esp
  106711:	eb ae                	jmp    1066c1 <MContainer_test1+0x91>
  106713:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10671a:	00 
  10671b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00106720 <MContainer_test2>:

int MContainer_test2()
{
  106720:	55                   	push   %ebp
  106721:	57                   	push   %edi
  106722:	56                   	push   %esi
  106723:	53                   	push   %ebx
  106724:	e8 97 9c ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  106729:	81 c3 cb 98 00 00    	add    $0x98cb,%ebx
  10672f:	83 ec 38             	sub    $0x38,%esp
    unsigned int old_usage = container_get_usage(0);
  106732:	6a 00                	push   $0x0
  106734:	e8 27 fd ff ff       	call   106460 <container_get_usage>
    unsigned int old_nchildren = container_get_nchildren(0);
  106739:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    unsigned int old_usage = container_get_usage(0);
  106740:	89 c5                	mov    %eax,%ebp
    unsigned int old_nchildren = container_get_nchildren(0);
  106742:	e8 d9 fc ff ff       	call   106420 <container_get_nchildren>
  106747:	89 c7                	mov    %eax,%edi
    unsigned int chid = container_split(0, 100);
  106749:	58                   	pop    %eax
  10674a:	5a                   	pop    %edx
  10674b:	6a 64                	push   $0x64
  10674d:	6a 00                	push   $0x0
  10674f:	e8 5c fd ff ff       	call   1064b0 <container_split>
    if (container_get_quota(chid) != 100
  106754:	89 04 24             	mov    %eax,(%esp)
    unsigned int chid = container_split(0, 100);
  106757:	89 c6                	mov    %eax,%esi
    if (container_get_quota(chid) != 100
  106759:	e8 e2 fc ff ff       	call   106440 <container_get_quota>
  10675e:	83 c4 10             	add    $0x10,%esp
  106761:	83 f8 64             	cmp    $0x64,%eax
  106764:	0f 84 8e 00 00 00    	je     1067f8 <MContainer_test2+0xd8>
        || container_get_parent(chid) != 0
        || container_get_usage(chid) != 0
        || container_get_nchildren(chid) != 0
        || container_get_usage(0) != old_usage + 100
  10676a:	8d 45 64             	lea    0x64(%ebp),%eax
  10676d:	89 44 24 10          	mov    %eax,0x10(%esp)
        || container_get_nchildren(0) != old_nchildren + 1) {
  106771:	8d 47 01             	lea    0x1(%edi),%eax
  106774:	89 44 24 0c          	mov    %eax,0xc(%esp)
        dprintf("test 2.1 failed:\n"
  106778:	83 ec 0c             	sub    $0xc,%esp
  10677b:	6a 00                	push   $0x0
  10677d:	e8 9e fc ff ff       	call   106420 <container_get_nchildren>
  106782:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  106789:	89 44 24 2c          	mov    %eax,0x2c(%esp)
  10678d:	e8 ce fc ff ff       	call   106460 <container_get_usage>
  106792:	89 34 24             	mov    %esi,(%esp)
  106795:	89 44 24 28          	mov    %eax,0x28(%esp)
  106799:	e8 82 fc ff ff       	call   106420 <container_get_nchildren>
  10679e:	89 34 24             	mov    %esi,(%esp)
  1067a1:	89 44 24 24          	mov    %eax,0x24(%esp)
  1067a5:	e8 b6 fc ff ff       	call   106460 <container_get_usage>
  1067aa:	89 34 24             	mov    %esi,(%esp)
  1067ad:	89 c5                	mov    %eax,%ebp
  1067af:	e8 4c fc ff ff       	call   106400 <container_get_parent>
  1067b4:	89 34 24             	mov    %esi,(%esp)
  1067b7:	89 c7                	mov    %eax,%edi
  1067b9:	e8 82 fc ff ff       	call   106440 <container_get_quota>
  1067be:	5e                   	pop    %esi
  1067bf:	ff 74 24 18          	push   0x18(%esp)
  1067c3:	8b 54 24 2c          	mov    0x2c(%esp),%edx
  1067c7:	52                   	push   %edx
  1067c8:	ff 74 24 24          	push   0x24(%esp)
  1067cc:	8b 4c 24 30          	mov    0x30(%esp),%ecx
  1067d0:	51                   	push   %ecx
  1067d1:	ff 74 24 30          	push   0x30(%esp)
  1067d5:	55                   	push   %ebp
  1067d6:	57                   	push   %edi
  1067d7:	50                   	push   %eax
  1067d8:	8d 83 a8 a3 ff ff    	lea    -0x5c58(%ebx),%eax
  1067de:	50                   	push   %eax
  1067df:	e8 b8 c5 ff ff       	call   102d9c <dprintf>
                container_get_parent(chid),
                container_get_usage(chid),
                container_get_nchildren(chid),
                container_get_usage(0), old_usage + 100,
                container_get_nchildren(0), old_nchildren + 1);
        return 1;
  1067e4:	83 c4 30             	add    $0x30,%esp
  1067e7:	b8 01 00 00 00       	mov    $0x1,%eax
        dprintf("test 2.2 failed: (%d != 1)\n", container_get_usage(chid));
        return 1;
    }
    dprintf("test 2 passed.\n");
    return 0;
}
  1067ec:	83 c4 2c             	add    $0x2c,%esp
  1067ef:	5b                   	pop    %ebx
  1067f0:	5e                   	pop    %esi
  1067f1:	5f                   	pop    %edi
  1067f2:	5d                   	pop    %ebp
  1067f3:	c3                   	ret
  1067f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        || container_get_parent(chid) != 0
  1067f8:	83 ec 0c             	sub    $0xc,%esp
        || container_get_usage(0) != old_usage + 100
  1067fb:	83 c5 64             	add    $0x64,%ebp
        || container_get_parent(chid) != 0
  1067fe:	56                   	push   %esi
  1067ff:	e8 fc fb ff ff       	call   106400 <container_get_parent>
        || container_get_nchildren(0) != old_nchildren + 1) {
  106804:	8d 57 01             	lea    0x1(%edi),%edx
        || container_get_usage(0) != old_usage + 100
  106807:	89 6c 24 20          	mov    %ebp,0x20(%esp)
        || container_get_nchildren(0) != old_nchildren + 1) {
  10680b:	89 54 24 1c          	mov    %edx,0x1c(%esp)
        || container_get_parent(chid) != 0
  10680f:	83 c4 10             	add    $0x10,%esp
  106812:	85 c0                	test   %eax,%eax
  106814:	0f 85 5e ff ff ff    	jne    106778 <MContainer_test2+0x58>
        || container_get_usage(chid) != 0
  10681a:	83 ec 0c             	sub    $0xc,%esp
  10681d:	56                   	push   %esi
  10681e:	e8 3d fc ff ff       	call   106460 <container_get_usage>
  106823:	83 c4 10             	add    $0x10,%esp
  106826:	85 c0                	test   %eax,%eax
  106828:	0f 85 4a ff ff ff    	jne    106778 <MContainer_test2+0x58>
        || container_get_nchildren(chid) != 0
  10682e:	83 ec 0c             	sub    $0xc,%esp
  106831:	56                   	push   %esi
  106832:	e8 e9 fb ff ff       	call   106420 <container_get_nchildren>
  106837:	83 c4 10             	add    $0x10,%esp
  10683a:	85 c0                	test   %eax,%eax
  10683c:	0f 85 36 ff ff ff    	jne    106778 <MContainer_test2+0x58>
        || container_get_usage(0) != old_usage + 100
  106842:	83 ec 0c             	sub    $0xc,%esp
  106845:	6a 00                	push   $0x0
  106847:	e8 14 fc ff ff       	call   106460 <container_get_usage>
  10684c:	83 c4 10             	add    $0x10,%esp
  10684f:	39 e8                	cmp    %ebp,%eax
  106851:	0f 85 21 ff ff ff    	jne    106778 <MContainer_test2+0x58>
        || container_get_nchildren(0) != old_nchildren + 1) {
  106857:	83 ec 0c             	sub    $0xc,%esp
  10685a:	6a 00                	push   $0x0
  10685c:	e8 bf fb ff ff       	call   106420 <container_get_nchildren>
  106861:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
  106865:	83 c4 10             	add    $0x10,%esp
  106868:	39 c8                	cmp    %ecx,%eax
  10686a:	0f 85 08 ff ff ff    	jne    106778 <MContainer_test2+0x58>
    container_alloc(chid);
  106870:	83 ec 0c             	sub    $0xc,%esp
  106873:	56                   	push   %esi
  106874:	e8 b7 fc ff ff       	call   106530 <container_alloc>
    if (container_get_usage(chid) != 1) {
  106879:	89 34 24             	mov    %esi,(%esp)
  10687c:	e8 df fb ff ff       	call   106460 <container_get_usage>
  106881:	83 c4 10             	add    $0x10,%esp
  106884:	83 f8 01             	cmp    $0x1,%eax
  106887:	74 20                	je     1068a9 <MContainer_test2+0x189>
        dprintf("test 2.2 failed: (%d != 1)\n", container_get_usage(chid));
  106889:	83 ec 0c             	sub    $0xc,%esp
  10688c:	56                   	push   %esi
  10688d:	e8 ce fb ff ff       	call   106460 <container_get_usage>
  106892:	5a                   	pop    %edx
  106893:	59                   	pop    %ecx
  106894:	50                   	push   %eax
  106895:	8d 83 35 9a ff ff    	lea    -0x65cb(%ebx),%eax
  10689b:	50                   	push   %eax
  10689c:	e8 fb c4 ff ff       	call   102d9c <dprintf>
        return 1;
  1068a1:	83 c4 10             	add    $0x10,%esp
  1068a4:	e9 3e ff ff ff       	jmp    1067e7 <MContainer_test2+0xc7>
    dprintf("test 2 passed.\n");
  1068a9:	83 ec 0c             	sub    $0xc,%esp
  1068ac:	8d 83 d4 98 ff ff    	lea    -0x672c(%ebx),%eax
  1068b2:	50                   	push   %eax
  1068b3:	e8 e4 c4 ff ff       	call   102d9c <dprintf>
    return 0;
  1068b8:	83 c4 10             	add    $0x10,%esp
  1068bb:	31 c0                	xor    %eax,%eax
  1068bd:	e9 2a ff ff ff       	jmp    1067ec <MContainer_test2+0xcc>
  1068c2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1068c9:	00 
  1068ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001068d0 <MContainer_test_alloc_n>:
/**
 * Test container_alloc_n: allocate 2^3 = 8 pages, verify usage deducted
 * and a valid page index returned.
 */
int MContainer_test_alloc_n()
{
  1068d0:	57                   	push   %edi
  1068d1:	56                   	push   %esi
  1068d2:	53                   	push   %ebx
  1068d3:	e8 e8 9a ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1068d8:	81 c3 1c 97 00 00    	add    $0x971c,%ebx
    unsigned int chid, old_usage_0, pi;

    /* Create a child with quota 100 for isolated testing */
    old_usage_0 = container_get_usage(0);
  1068de:	83 ec 0c             	sub    $0xc,%esp
  1068e1:	6a 00                	push   $0x0
  1068e3:	e8 78 fb ff ff       	call   106460 <container_get_usage>
    chid = container_split(0, 100);
  1068e8:	5e                   	pop    %esi
  1068e9:	5f                   	pop    %edi
  1068ea:	6a 64                	push   $0x64
  1068ec:	6a 00                	push   $0x0
  1068ee:	e8 bd fb ff ff       	call   1064b0 <container_split>
    if (chid >= 64) {
  1068f3:	83 c4 10             	add    $0x10,%esp
    chid = container_split(0, 100);
  1068f6:	89 c6                	mov    %eax,%esi
    if (chid >= 64) {
  1068f8:	83 f8 3f             	cmp    $0x3f,%eax
  1068fb:	77 73                	ja     106970 <MContainer_test_alloc_n+0xa0>
        dprintf("test alloc_n failed: container_split returned %u\n", chid);
        return 1;
    }

    pi = container_alloc_n(chid, 3);  /* 2^3 = 8 pages */
  1068fd:	83 ec 08             	sub    $0x8,%esp
  106900:	6a 03                	push   $0x3
  106902:	50                   	push   %eax
  106903:	e8 88 fc ff ff       	call   106590 <container_alloc_n>
    if (pi == 0) {
  106908:	83 c4 10             	add    $0x10,%esp
    pi = container_alloc_n(chid, 3);  /* 2^3 = 8 pages */
  10690b:	89 c7                	mov    %eax,%edi
    if (pi == 0) {
  10690d:	85 c0                	test   %eax,%eax
  10690f:	74 47                	je     106958 <MContainer_test_alloc_n+0x88>
        dprintf("test alloc_n failed: container_alloc_n returned 0\n");
        return 1;
    }
    if (container_get_usage(chid) != 8) {
  106911:	83 ec 0c             	sub    $0xc,%esp
  106914:	56                   	push   %esi
  106915:	e8 46 fb ff ff       	call   106460 <container_get_usage>
  10691a:	83 c4 10             	add    $0x10,%esp
  10691d:	83 f8 08             	cmp    $0x8,%eax
  106920:	74 66                	je     106988 <MContainer_test_alloc_n+0xb8>
        dprintf("test alloc_n failed: usage = %d, expected 8\n", container_get_usage(chid));
  106922:	83 ec 0c             	sub    $0xc,%esp
  106925:	56                   	push   %esi
  106926:	e8 35 fb ff ff       	call   106460 <container_get_usage>
  10692b:	5a                   	pop    %edx
  10692c:	59                   	pop    %ecx
  10692d:	50                   	push   %eax
  10692e:	8d 83 68 a4 ff ff    	lea    -0x5b98(%ebx),%eax
  106934:	50                   	push   %eax
  106935:	e8 62 c4 ff ff       	call   102d9c <dprintf>
        container_free_n(chid, pi, 3);
  10693a:	83 c4 0c             	add    $0xc,%esp
  10693d:	6a 03                	push   $0x3
  10693f:	57                   	push   %edi
  106940:	56                   	push   %esi
  106941:	e8 aa fc ff ff       	call   1065f0 <container_free_n>
        return 1;
  106946:	83 c4 10             	add    $0x10,%esp
        return 1;
    }

    dprintf("test alloc_n passed.\n");
    return 0;
}
  106949:	5b                   	pop    %ebx
        return 1;
  10694a:	b8 01 00 00 00       	mov    $0x1,%eax
}
  10694f:	5e                   	pop    %esi
  106950:	5f                   	pop    %edi
  106951:	c3                   	ret
  106952:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        dprintf("test alloc_n failed: container_alloc_n returned 0\n");
  106958:	83 ec 0c             	sub    $0xc,%esp
  10695b:	8d 83 34 a4 ff ff    	lea    -0x5bcc(%ebx),%eax
  106961:	50                   	push   %eax
  106962:	e8 35 c4 ff ff       	call   102d9c <dprintf>
        return 1;
  106967:	83 c4 10             	add    $0x10,%esp
  10696a:	eb dd                	jmp    106949 <MContainer_test_alloc_n+0x79>
  10696c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        dprintf("test alloc_n failed: container_split returned %u\n", chid);
  106970:	83 ec 08             	sub    $0x8,%esp
  106973:	50                   	push   %eax
  106974:	8d 83 00 a4 ff ff    	lea    -0x5c00(%ebx),%eax
  10697a:	50                   	push   %eax
  10697b:	e8 1c c4 ff ff       	call   102d9c <dprintf>
        return 1;
  106980:	83 c4 10             	add    $0x10,%esp
  106983:	eb c4                	jmp    106949 <MContainer_test_alloc_n+0x79>
  106985:	8d 76 00             	lea    0x0(%esi),%esi
    container_free_n(chid, pi, 3);
  106988:	83 ec 04             	sub    $0x4,%esp
  10698b:	6a 03                	push   $0x3
  10698d:	57                   	push   %edi
  10698e:	56                   	push   %esi
  10698f:	e8 5c fc ff ff       	call   1065f0 <container_free_n>
    if (container_get_usage(chid) != 0) {
  106994:	89 34 24             	mov    %esi,(%esp)
  106997:	e8 c4 fa ff ff       	call   106460 <container_get_usage>
  10699c:	83 c4 10             	add    $0x10,%esp
  10699f:	85 c0                	test   %eax,%eax
  1069a1:	75 1d                	jne    1069c0 <MContainer_test_alloc_n+0xf0>
    dprintf("test alloc_n passed.\n");
  1069a3:	83 ec 0c             	sub    $0xc,%esp
  1069a6:	8d 83 51 9a ff ff    	lea    -0x65af(%ebx),%eax
  1069ac:	50                   	push   %eax
  1069ad:	e8 ea c3 ff ff       	call   102d9c <dprintf>
    return 0;
  1069b2:	83 c4 10             	add    $0x10,%esp
  1069b5:	31 c0                	xor    %eax,%eax
}
  1069b7:	5b                   	pop    %ebx
  1069b8:	5e                   	pop    %esi
  1069b9:	5f                   	pop    %edi
  1069ba:	c3                   	ret
  1069bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        dprintf("test alloc_n failed: usage after free = %d, expected 0\n", container_get_usage(chid));
  1069c0:	83 ec 0c             	sub    $0xc,%esp
  1069c3:	56                   	push   %esi
  1069c4:	e8 97 fa ff ff       	call   106460 <container_get_usage>
  1069c9:	5a                   	pop    %edx
  1069ca:	59                   	pop    %ecx
  1069cb:	50                   	push   %eax
  1069cc:	8d 83 98 a4 ff ff    	lea    -0x5b68(%ebx),%eax
  1069d2:	50                   	push   %eax
  1069d3:	e8 c4 c3 ff ff       	call   102d9c <dprintf>
        return 1;
  1069d8:	83 c4 10             	add    $0x10,%esp
  1069db:	e9 69 ff ff ff       	jmp    106949 <MContainer_test_alloc_n+0x79>

001069e0 <MContainer_test_free_n>:

/**
 * Test container_free_n: allocate then free, verify usage returns to previous value.
 */
int MContainer_test_free_n()
{
  1069e0:	55                   	push   %ebp
  1069e1:	57                   	push   %edi
  1069e2:	56                   	push   %esi
  1069e3:	53                   	push   %ebx
  1069e4:	e8 d7 99 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1069e9:	81 c3 0b 96 00 00    	add    $0x960b,%ebx
  1069ef:	83 ec 24             	sub    $0x24,%esp
    unsigned int chid, pi, usage_before;

    /* Create a child with quota 64 */
    chid = container_split(0, 64);
  1069f2:	6a 40                	push   $0x40
  1069f4:	6a 00                	push   $0x0
  1069f6:	e8 b5 fa ff ff       	call   1064b0 <container_split>
    if (chid >= 64) {
  1069fb:	83 c4 10             	add    $0x10,%esp
    chid = container_split(0, 64);
  1069fe:	89 c6                	mov    %eax,%esi
    if (chid >= 64) {
  106a00:	83 f8 3f             	cmp    $0x3f,%eax
  106a03:	0f 87 8f 00 00 00    	ja     106a98 <MContainer_test_free_n+0xb8>
        dprintf("test free_n failed: container_split returned %u\n", chid);
        return 1;
    }

    usage_before = container_get_usage(chid);  /* should be 0 */
  106a09:	83 ec 0c             	sub    $0xc,%esp
  106a0c:	50                   	push   %eax
  106a0d:	e8 4e fa ff ff       	call   106460 <container_get_usage>
  106a12:	89 c7                	mov    %eax,%edi

    pi = container_alloc_n(chid, 2);  /* 2^2 = 4 pages */
  106a14:	58                   	pop    %eax
  106a15:	5a                   	pop    %edx
  106a16:	6a 02                	push   $0x2
  106a18:	56                   	push   %esi
  106a19:	e8 72 fb ff ff       	call   106590 <container_alloc_n>
    if (pi == 0) {
  106a1e:	83 c4 10             	add    $0x10,%esp
    pi = container_alloc_n(chid, 2);  /* 2^2 = 4 pages */
  106a21:	89 c5                	mov    %eax,%ebp
    if (pi == 0) {
  106a23:	85 c0                	test   %eax,%eax
  106a25:	74 59                	je     106a80 <MContainer_test_free_n+0xa0>
        dprintf("test free_n failed: container_alloc_n returned 0\n");
        return 1;
    }
    if (container_get_usage(chid) != usage_before + 4) {
  106a27:	83 ec 0c             	sub    $0xc,%esp
  106a2a:	56                   	push   %esi
  106a2b:	e8 30 fa ff ff       	call   106460 <container_get_usage>
  106a30:	8d 57 04             	lea    0x4(%edi),%edx
  106a33:	83 c4 10             	add    $0x10,%esp
  106a36:	39 d0                	cmp    %edx,%eax
  106a38:	89 54 24 0c          	mov    %edx,0xc(%esp)
  106a3c:	74 72                	je     106ab0 <MContainer_test_free_n+0xd0>
        dprintf("test free_n failed: usage = %d, expected %d\n",
  106a3e:	83 ec 0c             	sub    $0xc,%esp
  106a41:	56                   	push   %esi
  106a42:	e8 19 fa ff ff       	call   106460 <container_get_usage>
  106a47:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  106a4b:	83 c4 0c             	add    $0xc,%esp
  106a4e:	52                   	push   %edx
  106a4f:	50                   	push   %eax
  106a50:	8d 83 38 a5 ff ff    	lea    -0x5ac8(%ebx),%eax
  106a56:	50                   	push   %eax
  106a57:	e8 40 c3 ff ff       	call   102d9c <dprintf>
                container_get_usage(chid), usage_before + 4);
        container_free_n(chid, pi, 2);
  106a5c:	83 c4 0c             	add    $0xc,%esp
  106a5f:	6a 02                	push   $0x2
  106a61:	55                   	push   %ebp
  106a62:	56                   	push   %esi
  106a63:	e8 88 fb ff ff       	call   1065f0 <container_free_n>
        return 1;
  106a68:	83 c4 10             	add    $0x10,%esp
        return 1;
    }

    dprintf("test free_n passed.\n");
    return 0;
}
  106a6b:	83 c4 1c             	add    $0x1c,%esp
        return 1;
  106a6e:	b8 01 00 00 00       	mov    $0x1,%eax
}
  106a73:	5b                   	pop    %ebx
  106a74:	5e                   	pop    %esi
  106a75:	5f                   	pop    %edi
  106a76:	5d                   	pop    %ebp
  106a77:	c3                   	ret
  106a78:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106a7f:	00 
        dprintf("test free_n failed: container_alloc_n returned 0\n");
  106a80:	83 ec 0c             	sub    $0xc,%esp
  106a83:	8d 83 04 a5 ff ff    	lea    -0x5afc(%ebx),%eax
  106a89:	50                   	push   %eax
  106a8a:	e8 0d c3 ff ff       	call   102d9c <dprintf>
        return 1;
  106a8f:	83 c4 10             	add    $0x10,%esp
  106a92:	eb d7                	jmp    106a6b <MContainer_test_free_n+0x8b>
  106a94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        dprintf("test free_n failed: container_split returned %u\n", chid);
  106a98:	83 ec 08             	sub    $0x8,%esp
  106a9b:	50                   	push   %eax
  106a9c:	8d 83 d0 a4 ff ff    	lea    -0x5b30(%ebx),%eax
  106aa2:	50                   	push   %eax
  106aa3:	e8 f4 c2 ff ff       	call   102d9c <dprintf>
        return 1;
  106aa8:	83 c4 10             	add    $0x10,%esp
  106aab:	eb be                	jmp    106a6b <MContainer_test_free_n+0x8b>
  106aad:	8d 76 00             	lea    0x0(%esi),%esi
    container_free_n(chid, pi, 2);
  106ab0:	83 ec 04             	sub    $0x4,%esp
  106ab3:	6a 02                	push   $0x2
  106ab5:	55                   	push   %ebp
  106ab6:	56                   	push   %esi
  106ab7:	e8 34 fb ff ff       	call   1065f0 <container_free_n>
    if (container_get_usage(chid) != usage_before) {
  106abc:	89 34 24             	mov    %esi,(%esp)
  106abf:	e8 9c f9 ff ff       	call   106460 <container_get_usage>
  106ac4:	83 c4 10             	add    $0x10,%esp
  106ac7:	39 f8                	cmp    %edi,%eax
  106ac9:	74 25                	je     106af0 <MContainer_test_free_n+0x110>
        dprintf("test free_n failed: usage after free = %d, expected %d\n",
  106acb:	83 ec 0c             	sub    $0xc,%esp
  106ace:	56                   	push   %esi
  106acf:	e8 8c f9 ff ff       	call   106460 <container_get_usage>
  106ad4:	83 c4 0c             	add    $0xc,%esp
  106ad7:	57                   	push   %edi
  106ad8:	50                   	push   %eax
  106ad9:	8d 83 68 a5 ff ff    	lea    -0x5a98(%ebx),%eax
  106adf:	50                   	push   %eax
  106ae0:	e8 b7 c2 ff ff       	call   102d9c <dprintf>
        return 1;
  106ae5:	83 c4 10             	add    $0x10,%esp
  106ae8:	eb 81                	jmp    106a6b <MContainer_test_free_n+0x8b>
  106aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    dprintf("test free_n passed.\n");
  106af0:	83 ec 0c             	sub    $0xc,%esp
  106af3:	8d 83 67 9a ff ff    	lea    -0x6599(%ebx),%eax
  106af9:	50                   	push   %eax
  106afa:	e8 9d c2 ff ff       	call   102d9c <dprintf>
    return 0;
  106aff:	83 c4 10             	add    $0x10,%esp
  106b02:	31 c0                	xor    %eax,%eax
}
  106b04:	83 c4 1c             	add    $0x1c,%esp
  106b07:	5b                   	pop    %ebx
  106b08:	5e                   	pop    %esi
  106b09:	5f                   	pop    %edi
  106b0a:	5d                   	pop    %ebp
  106b0b:	c3                   	ret
  106b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00106b10 <MContainer_test_quota_limit>:
/**
 * Test quota limit: allocation fails when quota - usage < count;
 * usage must remain unchanged on failure.
 */
int MContainer_test_quota_limit()
{
  106b10:	55                   	push   %ebp
  106b11:	57                   	push   %edi
  106b12:	56                   	push   %esi
  106b13:	53                   	push   %ebx
  106b14:	e8 a7 98 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  106b19:	81 c3 db 94 00 00    	add    $0x94db,%ebx
  106b1f:	83 ec 14             	sub    $0x14,%esp
    unsigned int chid, pi, usage_before;

    /* Create a child with quota 4 — just enough for order-2 but not order-3 */
    chid = container_split(0, 4);
  106b22:	6a 04                	push   $0x4
  106b24:	6a 00                	push   $0x0
  106b26:	e8 85 f9 ff ff       	call   1064b0 <container_split>
    if (chid >= 64) {
  106b2b:	83 c4 10             	add    $0x10,%esp
    chid = container_split(0, 4);
  106b2e:	89 c6                	mov    %eax,%esi
    if (chid >= 64) {
  106b30:	83 f8 3f             	cmp    $0x3f,%eax
  106b33:	0f 87 7f 00 00 00    	ja     106bb8 <MContainer_test_quota_limit+0xa8>
        dprintf("test quota_limit failed: container_split returned %u\n", chid);
        return 1;
    }

    usage_before = container_get_usage(chid);  /* 0 */
  106b39:	83 ec 0c             	sub    $0xc,%esp
  106b3c:	50                   	push   %eax
  106b3d:	e8 1e f9 ff ff       	call   106460 <container_get_usage>

    /* order-3 needs 8 pages, quota is only 4 — must fail */
    pi = container_alloc_n(chid, 3);
  106b42:	5d                   	pop    %ebp
    usage_before = container_get_usage(chid);  /* 0 */
  106b43:	89 c7                	mov    %eax,%edi
    pi = container_alloc_n(chid, 3);
  106b45:	58                   	pop    %eax
  106b46:	6a 03                	push   $0x3
  106b48:	56                   	push   %esi
  106b49:	e8 42 fa ff ff       	call   106590 <container_alloc_n>
    if (pi != 0) {
  106b4e:	83 c4 10             	add    $0x10,%esp
    pi = container_alloc_n(chid, 3);
  106b51:	89 c5                	mov    %eax,%ebp
    if (pi != 0) {
  106b53:	85 c0                	test   %eax,%eax
  106b55:	75 39                	jne    106b90 <MContainer_test_quota_limit+0x80>
        dprintf("test quota_limit failed: alloc should have returned 0 but got %u\n", pi);
        container_free_n(chid, pi, 3);
        return 1;
    }
    if (container_get_usage(chid) != usage_before) {
  106b57:	83 ec 0c             	sub    $0xc,%esp
  106b5a:	56                   	push   %esi
  106b5b:	e8 00 f9 ff ff       	call   106460 <container_get_usage>
  106b60:	83 c4 10             	add    $0x10,%esp
  106b63:	39 f8                	cmp    %edi,%eax
  106b65:	74 69                	je     106bd0 <MContainer_test_quota_limit+0xc0>
        dprintf("test quota_limit failed: usage changed to %d after failed alloc\n",
  106b67:	83 ec 0c             	sub    $0xc,%esp
  106b6a:	56                   	push   %esi
  106b6b:	e8 f0 f8 ff ff       	call   106460 <container_get_usage>
  106b70:	5a                   	pop    %edx
  106b71:	59                   	pop    %ecx
  106b72:	50                   	push   %eax
  106b73:	8d 83 1c a6 ff ff    	lea    -0x59e4(%ebx),%eax
  106b79:	50                   	push   %eax
  106b7a:	e8 1d c2 ff ff       	call   102d9c <dprintf>
                container_get_usage(chid));
        return 1;
  106b7f:	83 c4 10             	add    $0x10,%esp
    }
    container_free_n(chid, pi, 2);

    dprintf("test quota_limit passed.\n");
    return 0;
}
  106b82:	83 c4 0c             	add    $0xc,%esp
        return 1;
  106b85:	b8 01 00 00 00       	mov    $0x1,%eax
}
  106b8a:	5b                   	pop    %ebx
  106b8b:	5e                   	pop    %esi
  106b8c:	5f                   	pop    %edi
  106b8d:	5d                   	pop    %ebp
  106b8e:	c3                   	ret
  106b8f:	90                   	nop
        dprintf("test quota_limit failed: alloc should have returned 0 but got %u\n", pi);
  106b90:	83 ec 08             	sub    $0x8,%esp
  106b93:	50                   	push   %eax
  106b94:	8d 83 d8 a5 ff ff    	lea    -0x5a28(%ebx),%eax
  106b9a:	50                   	push   %eax
  106b9b:	e8 fc c1 ff ff       	call   102d9c <dprintf>
        container_free_n(chid, pi, 3);
  106ba0:	83 c4 0c             	add    $0xc,%esp
  106ba3:	6a 03                	push   $0x3
  106ba5:	55                   	push   %ebp
  106ba6:	56                   	push   %esi
  106ba7:	e8 44 fa ff ff       	call   1065f0 <container_free_n>
        return 1;
  106bac:	83 c4 10             	add    $0x10,%esp
  106baf:	eb d1                	jmp    106b82 <MContainer_test_quota_limit+0x72>
  106bb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        dprintf("test quota_limit failed: container_split returned %u\n", chid);
  106bb8:	83 ec 08             	sub    $0x8,%esp
  106bbb:	50                   	push   %eax
  106bbc:	8d 83 a0 a5 ff ff    	lea    -0x5a60(%ebx),%eax
  106bc2:	50                   	push   %eax
  106bc3:	e8 d4 c1 ff ff       	call   102d9c <dprintf>
        return 1;
  106bc8:	83 c4 10             	add    $0x10,%esp
  106bcb:	eb b5                	jmp    106b82 <MContainer_test_quota_limit+0x72>
  106bcd:	8d 76 00             	lea    0x0(%esi),%esi
    pi = container_alloc_n(chid, 2);
  106bd0:	83 ec 08             	sub    $0x8,%esp
  106bd3:	6a 02                	push   $0x2
  106bd5:	56                   	push   %esi
  106bd6:	e8 b5 f9 ff ff       	call   106590 <container_alloc_n>
    if (pi == 0) {
  106bdb:	83 c4 10             	add    $0x10,%esp
  106bde:	85 c0                	test   %eax,%eax
  106be0:	74 2e                	je     106c10 <MContainer_test_quota_limit+0x100>
    container_free_n(chid, pi, 2);
  106be2:	83 ec 04             	sub    $0x4,%esp
  106be5:	6a 02                	push   $0x2
  106be7:	50                   	push   %eax
  106be8:	56                   	push   %esi
  106be9:	e8 02 fa ff ff       	call   1065f0 <container_free_n>
    dprintf("test quota_limit passed.\n");
  106bee:	8d 83 7c 9a ff ff    	lea    -0x6584(%ebx),%eax
  106bf4:	89 04 24             	mov    %eax,(%esp)
  106bf7:	e8 a0 c1 ff ff       	call   102d9c <dprintf>
    return 0;
  106bfc:	83 c4 10             	add    $0x10,%esp
  106bff:	31 c0                	xor    %eax,%eax
}
  106c01:	83 c4 0c             	add    $0xc,%esp
  106c04:	5b                   	pop    %ebx
  106c05:	5e                   	pop    %esi
  106c06:	5f                   	pop    %edi
  106c07:	5d                   	pop    %ebp
  106c08:	c3                   	ret
  106c09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        dprintf("test quota_limit failed: order-2 alloc returned 0\n");
  106c10:	83 ec 0c             	sub    $0xc,%esp
  106c13:	8d 83 60 a6 ff ff    	lea    -0x59a0(%ebx),%eax
  106c19:	50                   	push   %eax
  106c1a:	e8 7d c1 ff ff       	call   102d9c <dprintf>
        return 1;
  106c1f:	83 c4 10             	add    $0x10,%esp
  106c22:	e9 5b ff ff ff       	jmp    106b82 <MContainer_test_quota_limit+0x72>
  106c27:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106c2e:	00 
  106c2f:	90                   	nop

00106c30 <MContainer_test_backward_compat>:

/**
 * Test backward compatibility: container_alloc / container_free still work.
 */
int MContainer_test_backward_compat()
{
  106c30:	57                   	push   %edi
  106c31:	56                   	push   %esi
  106c32:	53                   	push   %ebx
  106c33:	e8 88 97 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  106c38:	81 c3 bc 93 00 00    	add    $0x93bc,%ebx
    unsigned int chid, pi, usage_after_alloc;

    chid = container_split(0, 50);
  106c3e:	83 ec 08             	sub    $0x8,%esp
  106c41:	6a 32                	push   $0x32
  106c43:	6a 00                	push   $0x0
  106c45:	e8 66 f8 ff ff       	call   1064b0 <container_split>
    if (chid >= 64) {
  106c4a:	83 c4 10             	add    $0x10,%esp
    chid = container_split(0, 50);
  106c4d:	89 c6                	mov    %eax,%esi
    if (chid >= 64) {
  106c4f:	83 f8 3f             	cmp    $0x3f,%eax
  106c52:	77 64                	ja     106cb8 <MContainer_test_backward_compat+0x88>
        dprintf("test backward_compat failed: container_split returned %u\n", chid);
        return 1;
    }

    pi = container_alloc(chid);
  106c54:	83 ec 0c             	sub    $0xc,%esp
  106c57:	50                   	push   %eax
  106c58:	e8 d3 f8 ff ff       	call   106530 <container_alloc>
    if (pi == 0) {
  106c5d:	83 c4 10             	add    $0x10,%esp
    pi = container_alloc(chid);
  106c60:	89 c7                	mov    %eax,%edi
    if (pi == 0) {
  106c62:	85 c0                	test   %eax,%eax
  106c64:	74 3a                	je     106ca0 <MContainer_test_backward_compat+0x70>
        dprintf("test backward_compat failed: container_alloc returned 0\n");
        return 1;
    }
    usage_after_alloc = container_get_usage(chid);
  106c66:	83 ec 0c             	sub    $0xc,%esp
  106c69:	56                   	push   %esi
  106c6a:	e8 f1 f7 ff ff       	call   106460 <container_get_usage>
    if (usage_after_alloc != 1) {
  106c6f:	83 c4 10             	add    $0x10,%esp
  106c72:	83 f8 01             	cmp    $0x1,%eax
  106c75:	74 59                	je     106cd0 <MContainer_test_backward_compat+0xa0>
        dprintf("test backward_compat failed: usage = %d, expected 1\n", usage_after_alloc);
  106c77:	83 ec 08             	sub    $0x8,%esp
  106c7a:	50                   	push   %eax
  106c7b:	8d 83 0c a7 ff ff    	lea    -0x58f4(%ebx),%eax
  106c81:	50                   	push   %eax
  106c82:	e8 15 c1 ff ff       	call   102d9c <dprintf>
        container_free(chid, pi);
  106c87:	58                   	pop    %eax
  106c88:	5a                   	pop    %edx
  106c89:	57                   	push   %edi
  106c8a:	56                   	push   %esi
  106c8b:	e8 d0 f8 ff ff       	call   106560 <container_free>
        return 1;
  106c90:	83 c4 10             	add    $0x10,%esp
        return 1;
    }

    dprintf("test backward_compat passed.\n");
    return 0;
}
  106c93:	5b                   	pop    %ebx
        return 1;
  106c94:	b8 01 00 00 00       	mov    $0x1,%eax
}
  106c99:	5e                   	pop    %esi
  106c9a:	5f                   	pop    %edi
  106c9b:	c3                   	ret
  106c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        dprintf("test backward_compat failed: container_alloc returned 0\n");
  106ca0:	83 ec 0c             	sub    $0xc,%esp
  106ca3:	8d 83 d0 a6 ff ff    	lea    -0x5930(%ebx),%eax
  106ca9:	50                   	push   %eax
  106caa:	e8 ed c0 ff ff       	call   102d9c <dprintf>
        return 1;
  106caf:	83 c4 10             	add    $0x10,%esp
  106cb2:	eb df                	jmp    106c93 <MContainer_test_backward_compat+0x63>
  106cb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        dprintf("test backward_compat failed: container_split returned %u\n", chid);
  106cb8:	83 ec 08             	sub    $0x8,%esp
  106cbb:	50                   	push   %eax
  106cbc:	8d 83 94 a6 ff ff    	lea    -0x596c(%ebx),%eax
  106cc2:	50                   	push   %eax
  106cc3:	e8 d4 c0 ff ff       	call   102d9c <dprintf>
        return 1;
  106cc8:	83 c4 10             	add    $0x10,%esp
  106ccb:	eb c6                	jmp    106c93 <MContainer_test_backward_compat+0x63>
  106ccd:	8d 76 00             	lea    0x0(%esi),%esi
    container_free(chid, pi);
  106cd0:	83 ec 08             	sub    $0x8,%esp
  106cd3:	57                   	push   %edi
  106cd4:	56                   	push   %esi
  106cd5:	e8 86 f8 ff ff       	call   106560 <container_free>
    if (container_get_usage(chid) != 0) {
  106cda:	89 34 24             	mov    %esi,(%esp)
  106cdd:	e8 7e f7 ff ff       	call   106460 <container_get_usage>
  106ce2:	83 c4 10             	add    $0x10,%esp
  106ce5:	85 c0                	test   %eax,%eax
  106ce7:	75 1f                	jne    106d08 <MContainer_test_backward_compat+0xd8>
    dprintf("test backward_compat passed.\n");
  106ce9:	83 ec 0c             	sub    $0xc,%esp
  106cec:	8d 83 e9 99 ff ff    	lea    -0x6617(%ebx),%eax
  106cf2:	50                   	push   %eax
  106cf3:	e8 a4 c0 ff ff       	call   102d9c <dprintf>
    return 0;
  106cf8:	83 c4 10             	add    $0x10,%esp
  106cfb:	31 c0                	xor    %eax,%eax
}
  106cfd:	5b                   	pop    %ebx
  106cfe:	5e                   	pop    %esi
  106cff:	5f                   	pop    %edi
  106d00:	c3                   	ret
  106d01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        dprintf("test backward_compat failed: usage after free = %d\n", container_get_usage(chid));
  106d08:	83 ec 0c             	sub    $0xc,%esp
  106d0b:	56                   	push   %esi
  106d0c:	e8 4f f7 ff ff       	call   106460 <container_get_usage>
  106d11:	5a                   	pop    %edx
  106d12:	59                   	pop    %ecx
  106d13:	50                   	push   %eax
  106d14:	8d 83 44 a7 ff ff    	lea    -0x58bc(%ebx),%eax
  106d1a:	50                   	push   %eax
  106d1b:	e8 7c c0 ff ff       	call   102d9c <dprintf>
        return 1;
  106d20:	83 c4 10             	add    $0x10,%esp
  106d23:	e9 6b ff ff ff       	jmp    106c93 <MContainer_test_backward_compat+0x63>
  106d28:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106d2f:	00 

00106d30 <test_MContainer>:

int test_MContainer()
{
  106d30:	53                   	push   %ebx
  106d31:	83 ec 08             	sub    $0x8,%esp
    return MContainer_test1()
  106d34:	e8 f7 f8 ff ff       	call   106630 <MContainer_test1>
  106d39:	89 c3                	mov    %eax,%ebx
         + MContainer_test2()
  106d3b:	e8 e0 f9 ff ff       	call   106720 <MContainer_test2>
  106d40:	01 c3                	add    %eax,%ebx
         + MContainer_test_alloc_n()
  106d42:	e8 89 fb ff ff       	call   1068d0 <MContainer_test_alloc_n>
  106d47:	01 c3                	add    %eax,%ebx
         + MContainer_test_free_n()
  106d49:	e8 92 fc ff ff       	call   1069e0 <MContainer_test_free_n>
  106d4e:	01 c3                	add    %eax,%ebx
         + MContainer_test_quota_limit()
  106d50:	e8 bb fd ff ff       	call   106b10 <MContainer_test_quota_limit>
  106d55:	01 c3                	add    %eax,%ebx
         + MContainer_test_backward_compat();
  106d57:	e8 d4 fe ff ff       	call   106c30 <MContainer_test_backward_compat>
}
  106d5c:	83 c4 08             	add    $0x8,%esp
         + MContainer_test_backward_compat();
  106d5f:	01 d8                	add    %ebx,%eax
}
  106d61:	5b                   	pop    %ebx
  106d62:	c3                   	ret
  106d63:	66 90                	xchg   %ax,%ax
  106d65:	66 90                	xchg   %ax,%ax
  106d67:	66 90                	xchg   %ax,%ax
  106d69:	66 90                	xchg   %ax,%ax
  106d6b:	66 90                	xchg   %ax,%ax
  106d6d:	66 90                	xchg   %ax,%ax
  106d6f:	90                   	nop

00106d70 <set_pdir_base>:
 */
unsigned int IDPTbl[1024][1024] gcc_aligned(PAGESIZE);

// Sets the CR3 register with the start address of the page structure for process # [index].
void set_pdir_base(unsigned int index)
{
  106d70:	53                   	push   %ebx
  106d71:	e8 4a 96 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  106d76:	81 c3 7e 92 00 00    	add    $0x927e,%ebx
  106d7c:	83 ec 14             	sub    $0x14,%esp
    // TODO
    set_cr3(PDirPool[index]);
  106d7f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  106d83:	c1 e0 0c             	shl    $0xc,%eax
  106d86:	8d 84 03 0c e0 c4 01 	lea    0x1c4e00c(%ebx,%eax,1),%eax
  106d8d:	50                   	push   %eax
  106d8e:	e8 17 a4 ff ff       	call   1011aa <set_cr3>
}
  106d93:	83 c4 18             	add    $0x18,%esp
  106d96:	5b                   	pop    %ebx
  106d97:	c3                   	ret
  106d98:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106d9f:	00 

00106da0 <get_pdir_entry>:
// Returns the page directory entry # [pde_index] of the process # [proc_index].
// This can be used to test whether the page directory entry is mapped.
unsigned int get_pdir_entry(unsigned int proc_index, unsigned int pde_index)
{
    // TODO
    return (unsigned int)(PDirPool[proc_index][pde_index]);
  106da0:	e8 17 96 ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  106da5:	81 c2 4f 92 00 00    	add    $0x924f,%edx
  106dab:	8b 44 24 04          	mov    0x4(%esp),%eax
  106daf:	c1 e0 0a             	shl    $0xa,%eax
  106db2:	03 44 24 08          	add    0x8(%esp),%eax
  106db6:	8b 84 82 0c e0 c4 01 	mov    0x1c4e00c(%edx,%eax,4),%eax
}
  106dbd:	c3                   	ret
  106dbe:	66 90                	xchg   %ax,%ax

00106dc0 <set_pdir_entry>:
                    unsigned int page_index)
{
    // TODO
    // bit 31-12 is the base address of the page table
    unsigned int value = (page_index << 12) | PTE_P | PTE_W | PTE_U;
    PDirPool[proc_index][pde_index] = (unsigned int *)value;
  106dc0:	e8 d6 ee ff ff       	call   105c9b <__x86.get_pc_thunk.cx>
  106dc5:	81 c1 2f 92 00 00    	add    $0x922f,%ecx
    unsigned int value = (page_index << 12) | PTE_P | PTE_W | PTE_U;
  106dcb:	8b 54 24 0c          	mov    0xc(%esp),%edx
    PDirPool[proc_index][pde_index] = (unsigned int *)value;
  106dcf:	8b 44 24 04          	mov    0x4(%esp),%eax
    unsigned int value = (page_index << 12) | PTE_P | PTE_W | PTE_U;
  106dd3:	c1 e2 0c             	shl    $0xc,%edx
    PDirPool[proc_index][pde_index] = (unsigned int *)value;
  106dd6:	c1 e0 0a             	shl    $0xa,%eax
  106dd9:	03 44 24 08          	add    0x8(%esp),%eax
    unsigned int value = (page_index << 12) | PTE_P | PTE_W | PTE_U;
  106ddd:	83 ca 07             	or     $0x7,%edx
  106de0:	89 94 81 0c e0 c4 01 	mov    %edx,0x1c4e00c(%ecx,%eax,4)
}
  106de7:	c3                   	ret
  106de8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106def:	00 

00106df0 <set_pdir_entry_identity>:
// You should also set the permissions PTE_P, PTE_W, and PTE_U.
// This will be used to map a page directory entry to an identity page table.
void set_pdir_entry_identity(unsigned int proc_index, unsigned int pde_index)
{
    // TODO
    unsigned int value = (unsigned int)IDPTbl[pde_index];
  106df0:	e8 a6 ee ff ff       	call   105c9b <__x86.get_pc_thunk.cx>
  106df5:	81 c1 ff 91 00 00    	add    $0x91ff,%ecx
{
  106dfb:	53                   	push   %ebx
  106dfc:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
    unsigned int value = (unsigned int)IDPTbl[pde_index];
  106e00:	89 d8                	mov    %ebx,%eax
  106e02:	c1 e0 0c             	shl    $0xc,%eax
  106e05:	8d 94 01 0c e0 84 01 	lea    0x184e00c(%ecx,%eax,1),%edx
    value |= PT_PERM_PTU;
    PDirPool[proc_index][pde_index]= (char *) value;
  106e0c:	8b 44 24 08          	mov    0x8(%esp),%eax
    value |= PT_PERM_PTU;
  106e10:	83 ca 07             	or     $0x7,%edx
    PDirPool[proc_index][pde_index]= (char *) value;
  106e13:	c1 e0 0a             	shl    $0xa,%eax
  106e16:	01 d8                	add    %ebx,%eax
}
  106e18:	5b                   	pop    %ebx
    value |= PT_PERM_PTU;
  106e19:	89 94 81 0c e0 c4 01 	mov    %edx,0x1c4e00c(%ecx,%eax,4)
}
  106e20:	c3                   	ret
  106e21:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106e28:	00 
  106e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00106e30 <rmv_pdir_entry>:
// Removes the specified page directory entry (sets the page directory entry to 0).
// Don't forget to cast the value to (unsigned int *).
void rmv_pdir_entry(unsigned int proc_index, unsigned int pde_index)
{
    // TODO
    PDirPool[proc_index][pde_index]=(char *)0x00000000;
  106e30:	e8 87 95 ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  106e35:	81 c2 bf 91 00 00    	add    $0x91bf,%edx
  106e3b:	8b 44 24 04          	mov    0x4(%esp),%eax
  106e3f:	c1 e0 0a             	shl    $0xa,%eax
  106e42:	03 44 24 08          	add    0x8(%esp),%eax
  106e46:	c7 84 82 0c e0 c4 01 	movl   $0x0,0x1c4e00c(%edx,%eax,4)
  106e4d:	00 00 00 00 
}
  106e51:	c3                   	ret
  106e52:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106e59:	00 
  106e5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00106e60 <get_ptbl_entry>:
// Do not forget that the permission info is also stored in the page directory entries.
unsigned int get_ptbl_entry(unsigned int proc_index, unsigned int pde_index,
                            unsigned int pte_index)
{
    // TODO
    unsigned int pte_addr=(unsigned int)PDirPool[proc_index][pde_index];
  106e60:	e8 57 95 ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  106e65:	81 c2 8f 91 00 00    	add    $0x918f,%edx
  106e6b:	8b 44 24 04          	mov    0x4(%esp),%eax
  106e6f:	c1 e0 0a             	shl    $0xa,%eax
  106e72:	03 44 24 08          	add    0x8(%esp),%eax
  106e76:	8b 84 82 0c e0 c4 01 	mov    0x1c4e00c(%edx,%eax,4),%eax
    pte_addr &= 0xfffff000;
    pte_addr += pte_index << 2;  // pte_index * 4 means each page table entry is 4 byte.
    return *(unsigned int *)pte_addr; 
  106e7d:	8b 54 24 0c          	mov    0xc(%esp),%edx
    pte_addr &= 0xfffff000;
  106e81:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    return *(unsigned int *)pte_addr; 
  106e86:	8b 04 90             	mov    (%eax,%edx,4),%eax
}
  106e89:	c3                   	ret
  106e8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00106e90 <set_ptbl_entry>:
                    unsigned int pte_index, unsigned int page_index,
                    unsigned int perm)
{
    // TODO
    unsigned int* pte;
    unsigned int pte_addr = (unsigned int)PDirPool[proc_index][pde_index];
  106e90:	e8 27 95 ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  106e95:	81 c2 5f 91 00 00    	add    $0x915f,%edx
  106e9b:	8b 44 24 04          	mov    0x4(%esp),%eax
    pte_addr += pte_index << 2;

    pte = (unsigned int *)pte_addr;
    *pte &= 0x00000000;
    *pte = page_index << 12;
    *pte |= (perm & 0x00000fff);
  106e9f:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    unsigned int pte_addr = (unsigned int)PDirPool[proc_index][pde_index];
  106ea3:	c1 e0 0a             	shl    $0xa,%eax
  106ea6:	03 44 24 08          	add    0x8(%esp),%eax
    *pte |= (perm & 0x00000fff);
  106eaa:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
    unsigned int pte_addr = (unsigned int)PDirPool[proc_index][pde_index];
  106eb0:	8b 94 82 0c e0 c4 01 	mov    0x1c4e00c(%edx,%eax,4),%edx
    *pte = page_index << 12;
  106eb7:	8b 44 24 10          	mov    0x10(%esp),%eax
  106ebb:	c1 e0 0c             	shl    $0xc,%eax
    pte_addr &= 0xfffff000;//rmove perm bits
  106ebe:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
    *pte |= (perm & 0x00000fff);
  106ec4:	09 c8                	or     %ecx,%eax
  106ec6:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  106eca:	89 04 8a             	mov    %eax,(%edx,%ecx,4)

}
  106ecd:	c3                   	ret
  106ece:	66 90                	xchg   %ax,%ax

00106ed0 <set_ptbl_entry_identity>:
void set_ptbl_entry_identity(unsigned int pde_index, unsigned int pte_index,
                             unsigned int perm)
{
    // TODO
    IDPTbl[pde_index][pte_index] = ((pde_index << 10) + pte_index) << 12;
    IDPTbl[pde_index][pte_index] |= perm;
  106ed0:	e8 c6 ed ff ff       	call   105c9b <__x86.get_pc_thunk.cx>
  106ed5:	81 c1 1f 91 00 00    	add    $0x911f,%ecx
  106edb:	8b 44 24 04          	mov    0x4(%esp),%eax
  106edf:	c1 e0 0a             	shl    $0xa,%eax
  106ee2:	03 44 24 08          	add    0x8(%esp),%eax
    IDPTbl[pde_index][pte_index] = ((pde_index << 10) + pte_index) << 12;
  106ee6:	89 c2                	mov    %eax,%edx
  106ee8:	c1 e2 0c             	shl    $0xc,%edx
    IDPTbl[pde_index][pte_index] |= perm;
  106eeb:	0b 54 24 0c          	or     0xc(%esp),%edx
  106eef:	89 94 81 0c e0 84 01 	mov    %edx,0x184e00c(%ecx,%eax,4)
}
  106ef6:	c3                   	ret
  106ef7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106efe:	00 
  106eff:	90                   	nop

00106f00 <rmv_ptbl_entry>:
void rmv_ptbl_entry(unsigned int proc_index, unsigned int pde_index,
                    unsigned int pte_index)
{
    // TODO
     unsigned int * pte;
    unsigned int pte_addr = (unsigned int)PDirPool[proc_index][pde_index];
  106f00:	e8 b7 94 ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  106f05:	81 c2 ef 90 00 00    	add    $0x90ef,%edx
  106f0b:	8b 44 24 04          	mov    0x4(%esp),%eax
  106f0f:	c1 e0 0a             	shl    $0xa,%eax
  106f12:	03 44 24 08          	add    0x8(%esp),%eax
  106f16:	8b 84 82 0c e0 c4 01 	mov    0x1c4e00c(%edx,%eax,4),%eax
    pte_addr &= 0xfffff000;//remove perm bits
    pte_addr += pte_index << 2;
    pte = (unsigned int *)pte_addr;
    *pte &= 0x00000000;
  106f1d:	8b 54 24 0c          	mov    0xc(%esp),%edx
    pte_addr &= 0xfffff000;//remove perm bits
  106f21:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    *pte &= 0x00000000;
  106f26:	c7 04 90 00 00 00 00 	movl   $0x0,(%eax,%edx,4)
}
  106f2d:	c3                   	ret
  106f2e:	66 90                	xchg   %ax,%ax

00106f30 <set_pdir_entry_superpage>:
                              unsigned int pde_index,
                              unsigned int page_index,
                              unsigned int perm)
{
    unsigned int value = (page_index << 12) | PTE_PS | perm;
    PDirPool[proc_index][pde_index] = (unsigned int *)value;
  106f30:	e8 66 ed ff ff       	call   105c9b <__x86.get_pc_thunk.cx>
  106f35:	81 c1 bf 90 00 00    	add    $0x90bf,%ecx
    unsigned int value = (page_index << 12) | PTE_PS | perm;
  106f3b:	8b 44 24 0c          	mov    0xc(%esp),%eax
    PDirPool[proc_index][pde_index] = (unsigned int *)value;
  106f3f:	8b 54 24 04          	mov    0x4(%esp),%edx
    unsigned int value = (page_index << 12) | PTE_PS | perm;
  106f43:	c1 e0 0c             	shl    $0xc,%eax
  106f46:	0b 44 24 10          	or     0x10(%esp),%eax
    PDirPool[proc_index][pde_index] = (unsigned int *)value;
  106f4a:	c1 e2 0a             	shl    $0xa,%edx
  106f4d:	03 54 24 08          	add    0x8(%esp),%edx
    unsigned int value = (page_index << 12) | PTE_PS | perm;
  106f51:	0c 80                	or     $0x80,%al
  106f53:	89 84 91 0c e0 c4 01 	mov    %eax,0x1c4e00c(%ecx,%edx,4)
}
  106f5a:	c3                   	ret
  106f5b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00106f60 <is_superpage>:
 * (has PTE_PS bit set), 0 otherwise.
 */
unsigned int is_superpage(unsigned int proc_index, unsigned int pde_index)
{
    unsigned int pde = (unsigned int)PDirPool[proc_index][pde_index];
    return (pde & PTE_PS) ? 1 : 0;
  106f60:	e8 57 94 ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  106f65:	81 c2 8f 90 00 00    	add    $0x908f,%edx
    unsigned int pde = (unsigned int)PDirPool[proc_index][pde_index];
  106f6b:	8b 44 24 04          	mov    0x4(%esp),%eax
  106f6f:	c1 e0 0a             	shl    $0xa,%eax
  106f72:	03 44 24 08          	add    0x8(%esp),%eax
    return (pde & PTE_PS) ? 1 : 0;
  106f76:	8b 84 82 0c e0 c4 01 	mov    0x1c4e00c(%edx,%eax,4),%eax
  106f7d:	c1 e8 07             	shr    $0x7,%eax
  106f80:	83 e0 01             	and    $0x1,%eax
}
  106f83:	c3                   	ret
  106f84:	66 90                	xchg   %ax,%ax
  106f86:	66 90                	xchg   %ax,%ax
  106f88:	66 90                	xchg   %ax,%ax
  106f8a:	66 90                	xchg   %ax,%ax
  106f8c:	66 90                	xchg   %ax,%ax
  106f8e:	66 90                	xchg   %ax,%ax

00106f90 <MPTIntro_test1>:

extern char *PDirPool[NUM_IDS][1024];
extern unsigned int IDPTbl[1024][1024];

int MPTIntro_test1()
{
  106f90:	56                   	push   %esi
  106f91:	53                   	push   %ebx
  106f92:	e8 29 94 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  106f97:	81 c3 5d 90 00 00    	add    $0x905d,%ebx
  106f9d:	83 ec 10             	sub    $0x10,%esp
    set_pdir_base(0);
  106fa0:	6a 00                	push   $0x0
  106fa2:	e8 c9 fd ff ff       	call   106d70 <set_pdir_base>
    if ((unsigned int) PDirPool[0] != rcr3()) {
  106fa7:	e8 3a ca ff ff       	call   1039e6 <rcr3>
  106fac:	c7 c6 00 e0 d5 01    	mov    $0x1d5e000,%esi
  106fb2:	83 c4 10             	add    $0x10,%esp
  106fb5:	39 f0                	cmp    %esi,%eax
  106fb7:	74 27                	je     106fe0 <MPTIntro_test1+0x50>
        dprintf("test 1.1 failed: (%d != %d)\n",
  106fb9:	e8 28 ca ff ff       	call   1039e6 <rcr3>
  106fbe:	83 ec 04             	sub    $0x4,%esp
  106fc1:	50                   	push   %eax
  106fc2:	8d 83 96 9a ff ff    	lea    -0x656a(%ebx),%eax
  106fc8:	56                   	push   %esi
  106fc9:	50                   	push   %eax
  106fca:	e8 cd bd ff ff       	call   102d9c <dprintf>
                (unsigned int) PDirPool[0], rcr3());
        return 1;
  106fcf:	83 c4 10             	add    $0x10,%esp
  106fd2:	b8 01 00 00 00       	mov    $0x1,%eax
                get_pdir_entry(1, 1), get_pdir_entry(1, 2));
        return 1;
    }
    dprintf("test 1 passed.\n");
    return 0;
}
  106fd7:	83 c4 04             	add    $0x4,%esp
  106fda:	5b                   	pop    %ebx
  106fdb:	5e                   	pop    %esi
  106fdc:	c3                   	ret
  106fdd:	8d 76 00             	lea    0x0(%esi),%esi
    set_pdir_entry_identity(1, 1);
  106fe0:	83 ec 08             	sub    $0x8,%esp
  106fe3:	6a 01                	push   $0x1
  106fe5:	6a 01                	push   $0x1
  106fe7:	e8 04 fe ff ff       	call   106df0 <set_pdir_entry_identity>
    set_pdir_entry(1, 2, 100);
  106fec:	83 c4 0c             	add    $0xc,%esp
  106fef:	6a 64                	push   $0x64
  106ff1:	6a 02                	push   $0x2
  106ff3:	6a 01                	push   $0x1
  106ff5:	e8 c6 fd ff ff       	call   106dc0 <set_pdir_entry>
    if (get_pdir_entry(1, 1) != (unsigned int) IDPTbl[1] + 7) {
  106ffa:	58                   	pop    %eax
  106ffb:	5a                   	pop    %edx
  106ffc:	6a 01                	push   $0x1
  106ffe:	6a 01                	push   $0x1
  107000:	e8 9b fd ff ff       	call   106da0 <get_pdir_entry>
  107005:	c7 c6 00 e0 95 01    	mov    $0x195e000,%esi
  10700b:	83 c4 10             	add    $0x10,%esp
  10700e:	81 c6 07 10 00 00    	add    $0x1007,%esi
  107014:	39 c6                	cmp    %eax,%esi
  107016:	74 28                	je     107040 <MPTIntro_test1+0xb0>
        dprintf("test 1.2 failed: (%d != %d)\n",
  107018:	83 ec 08             	sub    $0x8,%esp
  10701b:	6a 01                	push   $0x1
  10701d:	6a 01                	push   $0x1
  10701f:	e8 7c fd ff ff       	call   106da0 <get_pdir_entry>
  107024:	83 c4 0c             	add    $0xc,%esp
  107027:	56                   	push   %esi
  107028:	50                   	push   %eax
  107029:	8d 83 b3 9a ff ff    	lea    -0x654d(%ebx),%eax
  10702f:	50                   	push   %eax
  107030:	e8 67 bd ff ff       	call   102d9c <dprintf>
        return 1;
  107035:	83 c4 10             	add    $0x10,%esp
  107038:	eb 98                	jmp    106fd2 <MPTIntro_test1+0x42>
  10703a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (get_pdir_entry(1, 2) != 409607) {
  107040:	83 ec 08             	sub    $0x8,%esp
  107043:	6a 02                	push   $0x2
  107045:	6a 01                	push   $0x1
  107047:	e8 54 fd ff ff       	call   106da0 <get_pdir_entry>
  10704c:	83 c4 10             	add    $0x10,%esp
  10704f:	3d 07 40 06 00       	cmp    $0x64007,%eax
  107054:	75 72                	jne    1070c8 <MPTIntro_test1+0x138>
    rmv_pdir_entry(1, 1);
  107056:	83 ec 08             	sub    $0x8,%esp
  107059:	6a 01                	push   $0x1
  10705b:	6a 01                	push   $0x1
  10705d:	e8 ce fd ff ff       	call   106e30 <rmv_pdir_entry>
    rmv_pdir_entry(1, 2);
  107062:	59                   	pop    %ecx
  107063:	5e                   	pop    %esi
  107064:	6a 02                	push   $0x2
  107066:	6a 01                	push   $0x1
  107068:	e8 c3 fd ff ff       	call   106e30 <rmv_pdir_entry>
    if (get_pdir_entry(1, 1) != 0 || get_pdir_entry(1, 2) != 0) {
  10706d:	58                   	pop    %eax
  10706e:	5a                   	pop    %edx
  10706f:	6a 01                	push   $0x1
  107071:	6a 01                	push   $0x1
  107073:	e8 28 fd ff ff       	call   106da0 <get_pdir_entry>
  107078:	83 c4 10             	add    $0x10,%esp
  10707b:	85 c0                	test   %eax,%eax
  10707d:	75 13                	jne    107092 <MPTIntro_test1+0x102>
  10707f:	83 ec 08             	sub    $0x8,%esp
  107082:	6a 02                	push   $0x2
  107084:	6a 01                	push   $0x1
  107086:	e8 15 fd ff ff       	call   106da0 <get_pdir_entry>
  10708b:	83 c4 10             	add    $0x10,%esp
  10708e:	85 c0                	test   %eax,%eax
  107090:	74 5e                	je     1070f0 <MPTIntro_test1+0x160>
        dprintf("test 1.4 failed: (%d != 0 || %d != 0)\n",
  107092:	83 ec 08             	sub    $0x8,%esp
  107095:	6a 02                	push   $0x2
  107097:	6a 01                	push   $0x1
  107099:	e8 02 fd ff ff       	call   106da0 <get_pdir_entry>
  10709e:	89 c6                	mov    %eax,%esi
  1070a0:	58                   	pop    %eax
  1070a1:	5a                   	pop    %edx
  1070a2:	6a 01                	push   $0x1
  1070a4:	6a 01                	push   $0x1
  1070a6:	e8 f5 fc ff ff       	call   106da0 <get_pdir_entry>
  1070ab:	83 c4 0c             	add    $0xc,%esp
  1070ae:	56                   	push   %esi
  1070af:	50                   	push   %eax
  1070b0:	8d 83 9c a7 ff ff    	lea    -0x5864(%ebx),%eax
  1070b6:	50                   	push   %eax
  1070b7:	e8 e0 bc ff ff       	call   102d9c <dprintf>
        return 1;
  1070bc:	83 c4 10             	add    $0x10,%esp
  1070bf:	e9 0e ff ff ff       	jmp    106fd2 <MPTIntro_test1+0x42>
  1070c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        dprintf("test 1.3 failed: (%d != 409607)\n", get_pdir_entry(1, 2));
  1070c8:	83 ec 08             	sub    $0x8,%esp
  1070cb:	6a 02                	push   $0x2
  1070cd:	6a 01                	push   $0x1
  1070cf:	e8 cc fc ff ff       	call   106da0 <get_pdir_entry>
  1070d4:	59                   	pop    %ecx
  1070d5:	5e                   	pop    %esi
  1070d6:	50                   	push   %eax
  1070d7:	8d 83 78 a7 ff ff    	lea    -0x5888(%ebx),%eax
  1070dd:	50                   	push   %eax
  1070de:	e8 b9 bc ff ff       	call   102d9c <dprintf>
        return 1;
  1070e3:	83 c4 10             	add    $0x10,%esp
  1070e6:	e9 e7 fe ff ff       	jmp    106fd2 <MPTIntro_test1+0x42>
  1070eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    dprintf("test 1 passed.\n");
  1070f0:	83 ec 0c             	sub    $0xc,%esp
  1070f3:	8d 83 c4 98 ff ff    	lea    -0x673c(%ebx),%eax
  1070f9:	50                   	push   %eax
  1070fa:	e8 9d bc ff ff       	call   102d9c <dprintf>
    return 0;
  1070ff:	83 c4 10             	add    $0x10,%esp
  107102:	31 c0                	xor    %eax,%eax
  107104:	e9 ce fe ff ff       	jmp    106fd7 <MPTIntro_test1+0x47>
  107109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00107110 <MPTIntro_test2>:

int MPTIntro_test2()
{
  107110:	53                   	push   %ebx
  107111:	e8 aa 92 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  107116:	81 c3 de 8e 00 00    	add    $0x8ede,%ebx
  10711c:	83 ec 0c             	sub    $0xc,%esp
    set_pdir_entry(1, 1, 10000);
  10711f:	68 10 27 00 00       	push   $0x2710
  107124:	6a 01                	push   $0x1
  107126:	6a 01                	push   $0x1
  107128:	e8 93 fc ff ff       	call   106dc0 <set_pdir_entry>
    set_ptbl_entry(1, 1, 1, 10000, 259);
  10712d:	c7 04 24 03 01 00 00 	movl   $0x103,(%esp)
  107134:	68 10 27 00 00       	push   $0x2710
  107139:	6a 01                	push   $0x1
  10713b:	6a 01                	push   $0x1
  10713d:	6a 01                	push   $0x1
  10713f:	e8 4c fd ff ff       	call   106e90 <set_ptbl_entry>
    if (get_ptbl_entry(1, 1, 1) != 40960259) {
  107144:	83 c4 1c             	add    $0x1c,%esp
  107147:	6a 01                	push   $0x1
  107149:	6a 01                	push   $0x1
  10714b:	6a 01                	push   $0x1
  10714d:	e8 0e fd ff ff       	call   106e60 <get_ptbl_entry>
  107152:	83 c4 10             	add    $0x10,%esp
  107155:	3d 03 01 71 02       	cmp    $0x2710103,%eax
  10715a:	74 34                	je     107190 <MPTIntro_test2+0x80>
        dprintf("test 2.1 failed: (%d != 40960259)\n", get_ptbl_entry(1, 1, 1));
  10715c:	83 ec 04             	sub    $0x4,%esp
  10715f:	6a 01                	push   $0x1
  107161:	6a 01                	push   $0x1
  107163:	6a 01                	push   $0x1
  107165:	e8 f6 fc ff ff       	call   106e60 <get_ptbl_entry>
  10716a:	5a                   	pop    %edx
  10716b:	59                   	pop    %ecx
  10716c:	50                   	push   %eax
  10716d:	8d 83 c4 a7 ff ff    	lea    -0x583c(%ebx),%eax
  107173:	50                   	push   %eax
  107174:	e8 23 bc ff ff       	call   102d9c <dprintf>
        return 1;
  107179:	83 c4 10             	add    $0x10,%esp
        return 1;
    }
    rmv_pdir_entry(1, 1);
    dprintf("test 2 passed.\n");
    return 0;
}
  10717c:	83 c4 08             	add    $0x8,%esp
        return 1;
  10717f:	b8 01 00 00 00       	mov    $0x1,%eax
}
  107184:	5b                   	pop    %ebx
  107185:	c3                   	ret
  107186:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10718d:	00 
  10718e:	66 90                	xchg   %ax,%ax
    rmv_ptbl_entry(1, 1, 1);
  107190:	83 ec 04             	sub    $0x4,%esp
  107193:	6a 01                	push   $0x1
  107195:	6a 01                	push   $0x1
  107197:	6a 01                	push   $0x1
  107199:	e8 62 fd ff ff       	call   106f00 <rmv_ptbl_entry>
    if (get_ptbl_entry(1, 1, 1) != 0) {
  10719e:	83 c4 0c             	add    $0xc,%esp
  1071a1:	6a 01                	push   $0x1
  1071a3:	6a 01                	push   $0x1
  1071a5:	6a 01                	push   $0x1
  1071a7:	e8 b4 fc ff ff       	call   106e60 <get_ptbl_entry>
  1071ac:	83 c4 10             	add    $0x10,%esp
  1071af:	85 c0                	test   %eax,%eax
  1071b1:	75 2d                	jne    1071e0 <MPTIntro_test2+0xd0>
    rmv_pdir_entry(1, 1);
  1071b3:	83 ec 08             	sub    $0x8,%esp
  1071b6:	6a 01                	push   $0x1
  1071b8:	6a 01                	push   $0x1
  1071ba:	e8 71 fc ff ff       	call   106e30 <rmv_pdir_entry>
    dprintf("test 2 passed.\n");
  1071bf:	8d 83 d4 98 ff ff    	lea    -0x672c(%ebx),%eax
  1071c5:	89 04 24             	mov    %eax,(%esp)
  1071c8:	e8 cf bb ff ff       	call   102d9c <dprintf>
    return 0;
  1071cd:	83 c4 10             	add    $0x10,%esp
  1071d0:	31 c0                	xor    %eax,%eax
}
  1071d2:	83 c4 08             	add    $0x8,%esp
  1071d5:	5b                   	pop    %ebx
  1071d6:	c3                   	ret
  1071d7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1071de:	00 
  1071df:	90                   	nop
        dprintf("test 2.2 failed: (%d != 0)\n", get_ptbl_entry(1, 1, 1));
  1071e0:	83 ec 04             	sub    $0x4,%esp
  1071e3:	6a 01                	push   $0x1
  1071e5:	6a 01                	push   $0x1
  1071e7:	6a 01                	push   $0x1
  1071e9:	e8 72 fc ff ff       	call   106e60 <get_ptbl_entry>
  1071ee:	5a                   	pop    %edx
  1071ef:	59                   	pop    %ecx
  1071f0:	50                   	push   %eax
  1071f1:	8d 83 d0 9a ff ff    	lea    -0x6530(%ebx),%eax
  1071f7:	50                   	push   %eax
  1071f8:	e8 9f bb ff ff       	call   102d9c <dprintf>
        return 1;
  1071fd:	83 c4 10             	add    $0x10,%esp
  107200:	e9 77 ff ff ff       	jmp    10717c <MPTIntro_test2+0x6c>
  107205:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10720c:	00 
  10720d:	8d 76 00             	lea    0x0(%esi),%esi

00107210 <MPTIntro_test_superpage_pde>:
/**
 * Test set_pdir_entry_superpage sets PDE with PTE_PS bit;
 * is_superpage returns 1.
 */
int MPTIntro_test_superpage_pde()
{
  107210:	53                   	push   %ebx
  107211:	e8 aa 91 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  107216:	81 c3 de 8d 00 00    	add    $0x8dde,%ebx
  10721c:	83 ec 08             	sub    $0x8,%esp
    unsigned int pde;

    /* Use proc 2, pde 256 (VA 0x40000000) for isolation */
    set_pdir_entry_superpage(2, 256, 0x40000, PTE_P | PTE_W | PTE_U);
  10721f:	6a 07                	push   $0x7
  107221:	68 00 00 04 00       	push   $0x40000
  107226:	68 00 01 00 00       	push   $0x100
  10722b:	6a 02                	push   $0x2
  10722d:	e8 fe fc ff ff       	call   106f30 <set_pdir_entry_superpage>

    pde = get_pdir_entry(2, 256);
  107232:	59                   	pop    %ecx
  107233:	58                   	pop    %eax
  107234:	68 00 01 00 00       	push   $0x100
  107239:	6a 02                	push   $0x2
  10723b:	e8 60 fb ff ff       	call   106da0 <get_pdir_entry>
    if (!(pde & PTE_PS)) {
  107240:	83 c4 10             	add    $0x10,%esp
  107243:	a8 80                	test   $0x80,%al
  107245:	74 79                	je     1072c0 <MPTIntro_test_superpage_pde+0xb0>
        dprintf("test superpage_pde failed: PTE_PS not set (pde=0x%x)\n", pde);
        rmv_pdir_entry(2, 256);
        return 1;
    }
    if (is_superpage(2, 256) != 1) {
  107247:	83 ec 08             	sub    $0x8,%esp
  10724a:	68 00 01 00 00       	push   $0x100
  10724f:	6a 02                	push   $0x2
  107251:	e8 0a fd ff ff       	call   106f60 <is_superpage>
  107256:	83 c4 10             	add    $0x10,%esp
  107259:	83 f8 01             	cmp    $0x1,%eax
  10725c:	74 32                	je     107290 <MPTIntro_test_superpage_pde+0x80>
        dprintf("test superpage_pde failed: is_superpage returned 0\n");
  10725e:	83 ec 0c             	sub    $0xc,%esp
  107261:	8d 83 20 a8 ff ff    	lea    -0x57e0(%ebx),%eax
  107267:	50                   	push   %eax
  107268:	e8 2f bb ff ff       	call   102d9c <dprintf>
        rmv_pdir_entry(2, 256);
  10726d:	58                   	pop    %eax
  10726e:	5a                   	pop    %edx
  10726f:	68 00 01 00 00       	push   $0x100
  107274:	6a 02                	push   $0x2
  107276:	e8 b5 fb ff ff       	call   106e30 <rmv_pdir_entry>
        return 1;
  10727b:	83 c4 10             	add    $0x10,%esp
        return 1;
  10727e:	b8 01 00 00 00       	mov    $0x1,%eax
    }

    rmv_pdir_entry(2, 256);
    dprintf("test superpage_pde passed.\n");
    return 0;
}
  107283:	83 c4 08             	add    $0x8,%esp
  107286:	5b                   	pop    %ebx
  107287:	c3                   	ret
  107288:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10728f:	00 
    rmv_pdir_entry(2, 256);
  107290:	83 ec 08             	sub    $0x8,%esp
  107293:	68 00 01 00 00       	push   $0x100
  107298:	6a 02                	push   $0x2
  10729a:	e8 91 fb ff ff       	call   106e30 <rmv_pdir_entry>
    dprintf("test superpage_pde passed.\n");
  10729f:	8d 83 ec 9a ff ff    	lea    -0x6514(%ebx),%eax
  1072a5:	89 04 24             	mov    %eax,(%esp)
  1072a8:	e8 ef ba ff ff       	call   102d9c <dprintf>
    return 0;
  1072ad:	83 c4 10             	add    $0x10,%esp
  1072b0:	31 c0                	xor    %eax,%eax
}
  1072b2:	83 c4 08             	add    $0x8,%esp
  1072b5:	5b                   	pop    %ebx
  1072b6:	c3                   	ret
  1072b7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1072be:	00 
  1072bf:	90                   	nop
        dprintf("test superpage_pde failed: PTE_PS not set (pde=0x%x)\n", pde);
  1072c0:	83 ec 08             	sub    $0x8,%esp
  1072c3:	50                   	push   %eax
  1072c4:	8d 83 e8 a7 ff ff    	lea    -0x5818(%ebx),%eax
  1072ca:	eb 9b                	jmp    107267 <MPTIntro_test_superpage_pde+0x57>
  1072cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001072d0 <MPTIntro_test_superpage_addr>:
/**
 * Test that the PDE encodes the correct physical address (page_index << 12)
 * and permission bits alongside the PS bit.
 */
int MPTIntro_test_superpage_addr()
{
  1072d0:	53                   	push   %ebx
  1072d1:	e8 ea 90 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1072d6:	81 c3 1e 8d 00 00    	add    $0x8d1e,%ebx
  1072dc:	83 ec 08             	sub    $0x8,%esp
    unsigned int pde, expected_addr, perm;

    /* page_index = 0x40000 (1024-page aligned), perm = P|W|U = 7 */
    set_pdir_entry_superpage(2, 257, 0x40000, PTE_P | PTE_W | PTE_U);
  1072df:	6a 07                	push   $0x7
  1072e1:	68 00 00 04 00       	push   $0x40000
  1072e6:	68 01 01 00 00       	push   $0x101
  1072eb:	6a 02                	push   $0x2
  1072ed:	e8 3e fc ff ff       	call   106f30 <set_pdir_entry_superpage>

    pde = get_pdir_entry(2, 257);
  1072f2:	59                   	pop    %ecx
  1072f3:	58                   	pop    %eax
  1072f4:	68 01 01 00 00       	push   $0x101
  1072f9:	6a 02                	push   $0x2
  1072fb:	e8 a0 fa ff ff       	call   106da0 <get_pdir_entry>
    expected_addr = 0x40000 << 12;  /* = 0x40000000 */
    perm = PTE_P | PTE_W | PTE_U | PTE_PS;  /* 0x087 */

    if ((pde & 0xFFFFF000) != expected_addr) {
  107300:	83 c4 10             	add    $0x10,%esp
  107303:	89 c2                	mov    %eax,%edx
  107305:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  10730b:	81 fa 00 00 00 40    	cmp    $0x40000000,%edx
  107311:	75 6d                	jne    107380 <MPTIntro_test_superpage_addr+0xb0>
        dprintf("test superpage_addr failed: addr 0x%x != 0x%x\n",
                pde & 0xFFFFF000, expected_addr);
        rmv_pdir_entry(2, 257);
        return 1;
    }
    if ((pde & 0xFFF) != perm) {
  107313:	25 ff 0f 00 00       	and    $0xfff,%eax
  107318:	3d 87 00 00 00       	cmp    $0x87,%eax
  10731d:	74 31                	je     107350 <MPTIntro_test_superpage_addr+0x80>
        dprintf("test superpage_addr failed: perm 0x%x != 0x%x\n",
  10731f:	83 ec 04             	sub    $0x4,%esp
  107322:	68 87 00 00 00       	push   $0x87
  107327:	50                   	push   %eax
  107328:	8d 83 84 a8 ff ff    	lea    -0x577c(%ebx),%eax
  10732e:	50                   	push   %eax
  10732f:	e8 68 ba ff ff       	call   102d9c <dprintf>
                pde & 0xFFF, perm);
        rmv_pdir_entry(2, 257);
  107334:	58                   	pop    %eax
  107335:	5a                   	pop    %edx
  107336:	68 01 01 00 00       	push   $0x101
  10733b:	6a 02                	push   $0x2
  10733d:	e8 ee fa ff ff       	call   106e30 <rmv_pdir_entry>
        return 1;
  107342:	83 c4 10             	add    $0x10,%esp
        return 1;
  107345:	b8 01 00 00 00       	mov    $0x1,%eax
    }

    rmv_pdir_entry(2, 257);
    dprintf("test superpage_addr passed.\n");
    return 0;
}
  10734a:	83 c4 08             	add    $0x8,%esp
  10734d:	5b                   	pop    %ebx
  10734e:	c3                   	ret
  10734f:	90                   	nop
    rmv_pdir_entry(2, 257);
  107350:	83 ec 08             	sub    $0x8,%esp
  107353:	68 01 01 00 00       	push   $0x101
  107358:	6a 02                	push   $0x2
  10735a:	e8 d1 fa ff ff       	call   106e30 <rmv_pdir_entry>
    dprintf("test superpage_addr passed.\n");
  10735f:	8d 83 08 9b ff ff    	lea    -0x64f8(%ebx),%eax
  107365:	89 04 24             	mov    %eax,(%esp)
  107368:	e8 2f ba ff ff       	call   102d9c <dprintf>
    return 0;
  10736d:	83 c4 10             	add    $0x10,%esp
  107370:	31 c0                	xor    %eax,%eax
}
  107372:	83 c4 08             	add    $0x8,%esp
  107375:	5b                   	pop    %ebx
  107376:	c3                   	ret
  107377:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10737e:	00 
  10737f:	90                   	nop
        dprintf("test superpage_addr failed: addr 0x%x != 0x%x\n",
  107380:	83 ec 04             	sub    $0x4,%esp
  107383:	8d 83 54 a8 ff ff    	lea    -0x57ac(%ebx),%eax
  107389:	68 00 00 00 40       	push   $0x40000000
  10738e:	52                   	push   %edx
  10738f:	eb 9d                	jmp    10732e <MPTIntro_test_superpage_addr+0x5e>
  107391:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107398:	00 
  107399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001073a0 <MPTIntro_test_not_superpage>:
/**
 * Test that a regular set_pdir_entry does NOT set PTE_PS;
 * is_superpage returns 0.
 */
int MPTIntro_test_not_superpage()
{
  1073a0:	53                   	push   %ebx
  1073a1:	e8 1a 90 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1073a6:	81 c3 4e 8c 00 00    	add    $0x8c4e,%ebx
  1073ac:	83 ec 0c             	sub    $0xc,%esp
    unsigned int pde;

    set_pdir_entry(2, 258, 10000);
  1073af:	68 10 27 00 00       	push   $0x2710
  1073b4:	68 02 01 00 00       	push   $0x102
  1073b9:	6a 02                	push   $0x2
  1073bb:	e8 00 fa ff ff       	call   106dc0 <set_pdir_entry>

    pde = get_pdir_entry(2, 258);
  1073c0:	59                   	pop    %ecx
  1073c1:	58                   	pop    %eax
  1073c2:	68 02 01 00 00       	push   $0x102
  1073c7:	6a 02                	push   $0x2
  1073c9:	e8 d2 f9 ff ff       	call   106da0 <get_pdir_entry>
    if (pde & PTE_PS) {
  1073ce:	83 c4 10             	add    $0x10,%esp
  1073d1:	a8 80                	test   $0x80,%al
  1073d3:	75 73                	jne    107448 <MPTIntro_test_not_superpage+0xa8>
        dprintf("test not_superpage failed: PTE_PS is set on regular entry (pde=0x%x)\n", pde);
        rmv_pdir_entry(2, 258);
        return 1;
    }
    if (is_superpage(2, 258) != 0) {
  1073d5:	83 ec 08             	sub    $0x8,%esp
  1073d8:	68 02 01 00 00       	push   $0x102
  1073dd:	6a 02                	push   $0x2
  1073df:	e8 7c fb ff ff       	call   106f60 <is_superpage>
  1073e4:	83 c4 10             	add    $0x10,%esp
  1073e7:	85 c0                	test   %eax,%eax
  1073e9:	75 2d                	jne    107418 <MPTIntro_test_not_superpage+0x78>
        dprintf("test not_superpage failed: is_superpage returned 1\n");
        rmv_pdir_entry(2, 258);
        return 1;
    }

    rmv_pdir_entry(2, 258);
  1073eb:	83 ec 08             	sub    $0x8,%esp
  1073ee:	68 02 01 00 00       	push   $0x102
  1073f3:	6a 02                	push   $0x2
  1073f5:	e8 36 fa ff ff       	call   106e30 <rmv_pdir_entry>
    dprintf("test not_superpage passed.\n");
  1073fa:	8d 83 25 9b ff ff    	lea    -0x64db(%ebx),%eax
  107400:	89 04 24             	mov    %eax,(%esp)
  107403:	e8 94 b9 ff ff       	call   102d9c <dprintf>
    return 0;
  107408:	83 c4 10             	add    $0x10,%esp
  10740b:	31 c0                	xor    %eax,%eax
}
  10740d:	83 c4 08             	add    $0x8,%esp
  107410:	5b                   	pop    %ebx
  107411:	c3                   	ret
  107412:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        dprintf("test not_superpage failed: is_superpage returned 1\n");
  107418:	83 ec 0c             	sub    $0xc,%esp
  10741b:	8d 83 fc a8 ff ff    	lea    -0x5704(%ebx),%eax
  107421:	50                   	push   %eax
  107422:	e8 75 b9 ff ff       	call   102d9c <dprintf>
        rmv_pdir_entry(2, 258);
  107427:	58                   	pop    %eax
  107428:	5a                   	pop    %edx
  107429:	68 02 01 00 00       	push   $0x102
  10742e:	6a 02                	push   $0x2
  107430:	e8 fb f9 ff ff       	call   106e30 <rmv_pdir_entry>
        return 1;
  107435:	83 c4 10             	add    $0x10,%esp
        return 1;
  107438:	b8 01 00 00 00       	mov    $0x1,%eax
}
  10743d:	83 c4 08             	add    $0x8,%esp
  107440:	5b                   	pop    %ebx
  107441:	c3                   	ret
  107442:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        dprintf("test not_superpage failed: PTE_PS is set on regular entry (pde=0x%x)\n", pde);
  107448:	83 ec 08             	sub    $0x8,%esp
  10744b:	50                   	push   %eax
  10744c:	8d 83 b4 a8 ff ff    	lea    -0x574c(%ebx),%eax
  107452:	eb cd                	jmp    107421 <MPTIntro_test_not_superpage+0x81>
  107454:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10745b:	00 
  10745c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00107460 <test_MPTIntro>:

int test_MPTIntro()
{
  107460:	53                   	push   %ebx
  107461:	83 ec 08             	sub    $0x8,%esp
    return MPTIntro_test1() + MPTIntro_test2()
  107464:	e8 27 fb ff ff       	call   106f90 <MPTIntro_test1>
  107469:	89 c3                	mov    %eax,%ebx
  10746b:	e8 a0 fc ff ff       	call   107110 <MPTIntro_test2>
  107470:	01 c3                	add    %eax,%ebx
         + MPTIntro_test_superpage_pde()
  107472:	e8 99 fd ff ff       	call   107210 <MPTIntro_test_superpage_pde>
  107477:	01 c3                	add    %eax,%ebx
         + MPTIntro_test_superpage_addr()
  107479:	e8 52 fe ff ff       	call   1072d0 <MPTIntro_test_superpage_addr>
  10747e:	01 c3                	add    %eax,%ebx
         + MPTIntro_test_not_superpage();
  107480:	e8 1b ff ff ff       	call   1073a0 <MPTIntro_test_not_superpage>
}
  107485:	83 c4 08             	add    $0x8,%esp
         + MPTIntro_test_not_superpage();
  107488:	01 d8                	add    %ebx,%eax
}
  10748a:	5b                   	pop    %ebx
  10748b:	c3                   	ret
  10748c:	66 90                	xchg   %ax,%ax
  10748e:	66 90                	xchg   %ax,%ax

00107490 <get_ptbl_entry_by_va>:
 * Returns the page table entry corresponding to the virtual address,
 * according to the page structure of process # [proc_index].
 * Returns 0 if the mapping does not exist.
 */
unsigned int get_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  107490:	55                   	push   %ebp
  107491:	57                   	push   %edi
  107492:	56                   	push   %esi
  107493:	53                   	push   %ebx
  107494:	e8 27 8f ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  107499:	81 c3 5b 8b 00 00    	add    $0x8b5b,%ebx
  10749f:	83 ec 14             	sub    $0x14,%esp
  1074a2:	8b 74 24 2c          	mov    0x2c(%esp),%esi
  1074a6:	8b 7c 24 28          	mov    0x28(%esp),%edi
    // TODO
    unsigned int pde_index = (vaddr & VA_PDIR_MASK) >> 22;
  1074aa:	89 f5                	mov    %esi,%ebp
  1074ac:	c1 ed 16             	shr    $0x16,%ebp
    unsigned int pte_index = (vaddr & VA_PTBL_MASK) >> 12;
    unsigned int pde = get_pdir_entry(proc_index, pde_index);
  1074af:	55                   	push   %ebp
  1074b0:	57                   	push   %edi
  1074b1:	e8 ea f8 ff ff       	call   106da0 <get_pdir_entry>

    if ((pde & PTE_P)==0) { // page directory entry not present
  1074b6:	83 c4 10             	add    $0x10,%esp
  1074b9:	a8 01                	test   $0x1,%al
  1074bb:	75 13                	jne    1074d0 <get_ptbl_entry_by_va+0x40>
        return 0;
    }


    return pte;
}
  1074bd:	83 c4 0c             	add    $0xc,%esp
        return 0;
  1074c0:	31 c0                	xor    %eax,%eax
}
  1074c2:	5b                   	pop    %ebx
  1074c3:	5e                   	pop    %esi
  1074c4:	5f                   	pop    %edi
  1074c5:	5d                   	pop    %ebp
  1074c6:	c3                   	ret
  1074c7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1074ce:	00 
  1074cf:	90                   	nop
    unsigned int pte_index = (vaddr & VA_PTBL_MASK) >> 12;
  1074d0:	c1 ee 0c             	shr    $0xc,%esi
    unsigned int pte = get_ptbl_entry(proc_index, pde_index, pte_index);
  1074d3:	83 ec 04             	sub    $0x4,%esp
    unsigned int pte_index = (vaddr & VA_PTBL_MASK) >> 12;
  1074d6:	81 e6 ff 03 00 00    	and    $0x3ff,%esi
    unsigned int pte = get_ptbl_entry(proc_index, pde_index, pte_index);
  1074dc:	56                   	push   %esi
  1074dd:	55                   	push   %ebp
  1074de:	57                   	push   %edi
  1074df:	e8 7c f9 ff ff       	call   106e60 <get_ptbl_entry>
    if ((pte & PTE_P)==0) { //page table entry not present
  1074e4:	83 c4 10             	add    $0x10,%esp
  1074e7:	a8 01                	test   $0x1,%al
  1074e9:	74 d2                	je     1074bd <get_ptbl_entry_by_va+0x2d>
}
  1074eb:	83 c4 0c             	add    $0xc,%esp
  1074ee:	5b                   	pop    %ebx
  1074ef:	5e                   	pop    %esi
  1074f0:	5f                   	pop    %edi
  1074f1:	5d                   	pop    %ebp
  1074f2:	c3                   	ret
  1074f3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1074fa:	00 
  1074fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00107500 <get_pdir_entry_by_va>:

// Returns the page directory entry corresponding to the given virtual address.
unsigned int get_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  107500:	53                   	push   %ebx
  107501:	e8 ba 8e ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  107506:	81 c3 ee 8a 00 00    	add    $0x8aee,%ebx
  10750c:	83 ec 10             	sub    $0x10,%esp
    // TODO
    unsigned int pde_index = (vaddr & VA_PDIR_MASK) >> 22;
  10750f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  107513:	c1 e8 16             	shr    $0x16,%eax
    unsigned int pde = get_pdir_entry(proc_index, pde_index);
  107516:	50                   	push   %eax
  107517:	ff 74 24 1c          	push   0x1c(%esp)
  10751b:	e8 80 f8 ff ff       	call   106da0 <get_pdir_entry>
    return pde;

    
}
  107520:	83 c4 18             	add    $0x18,%esp
  107523:	5b                   	pop    %ebx
  107524:	c3                   	ret
  107525:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10752c:	00 
  10752d:	8d 76 00             	lea    0x0(%esi),%esi

00107530 <rmv_ptbl_entry_by_va>:

// Removes the page table entry for the given virtual address.
void rmv_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  107530:	55                   	push   %ebp
  107531:	57                   	push   %edi
  107532:	56                   	push   %esi
  107533:	53                   	push   %ebx
  107534:	e8 87 8e ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  107539:	81 c3 bb 8a 00 00    	add    $0x8abb,%ebx
  10753f:	83 ec 14             	sub    $0x14,%esp
  107542:	8b 74 24 2c          	mov    0x2c(%esp),%esi
  107546:	8b 7c 24 28          	mov    0x28(%esp),%edi
    // TODO
    unsigned int pde_index = (vaddr & VA_PDIR_MASK) >> 22;
  10754a:	89 f5                	mov    %esi,%ebp
  10754c:	c1 ed 16             	shr    $0x16,%ebp
    unsigned int pte_index = (vaddr & VA_PTBL_MASK) >> 12;

    unsigned int pde = get_pdir_entry(proc_index, pde_index);
  10754f:	55                   	push   %ebp
  107550:	57                   	push   %edi
  107551:	e8 4a f8 ff ff       	call   106da0 <get_pdir_entry>

    if ((pde & PTE_P) == 0) {
  107556:	83 c4 10             	add    $0x10,%esp
  107559:	a8 01                	test   $0x1,%al
  10755b:	74 17                	je     107574 <rmv_ptbl_entry_by_va+0x44>
    unsigned int pte_index = (vaddr & VA_PTBL_MASK) >> 12;
  10755d:	c1 ee 0c             	shr    $0xc,%esi
        return; // page directory entry not valid for address translation here
    }
    rmv_ptbl_entry(proc_index, pde_index, pte_index);
  107560:	83 ec 04             	sub    $0x4,%esp
    unsigned int pte_index = (vaddr & VA_PTBL_MASK) >> 12;
  107563:	81 e6 ff 03 00 00    	and    $0x3ff,%esi
    rmv_ptbl_entry(proc_index, pde_index, pte_index);
  107569:	56                   	push   %esi
  10756a:	55                   	push   %ebp
  10756b:	57                   	push   %edi
  10756c:	e8 8f f9 ff ff       	call   106f00 <rmv_ptbl_entry>
  107571:	83 c4 10             	add    $0x10,%esp
}
  107574:	83 c4 0c             	add    $0xc,%esp
  107577:	5b                   	pop    %ebx
  107578:	5e                   	pop    %esi
  107579:	5f                   	pop    %edi
  10757a:	5d                   	pop    %ebp
  10757b:	c3                   	ret
  10757c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00107580 <rmv_pdir_entry_by_va>:

// Removes the page directory entry for the given virtual address.
void rmv_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  107580:	53                   	push   %ebx
  107581:	e8 3a 8e ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  107586:	81 c3 6e 8a 00 00    	add    $0x8a6e,%ebx
  10758c:	83 ec 10             	sub    $0x10,%esp
    // TODO
    unsigned int pde_index = (vaddr & VA_PDIR_MASK) >> 22;
  10758f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  107593:	c1 e8 16             	shr    $0x16,%eax
    rmv_pdir_entry(proc_index, pde_index);
  107596:	50                   	push   %eax
  107597:	ff 74 24 1c          	push   0x1c(%esp)
  10759b:	e8 90 f8 ff ff       	call   106e30 <rmv_pdir_entry>
}
  1075a0:	83 c4 18             	add    $0x18,%esp
  1075a3:	5b                   	pop    %ebx
  1075a4:	c3                   	ret
  1075a5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1075ac:	00 
  1075ad:	8d 76 00             	lea    0x0(%esi),%esi

001075b0 <set_ptbl_entry_by_va>:

// Maps the virtual address [vaddr] to the physical page # [page_index] with permission [perm].
// You do not need to worry about the page directory entry. just map the page table entry.
void set_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr,
                          unsigned int page_index, unsigned int perm)
{
  1075b0:	53                   	push   %ebx
  1075b1:	e8 0a 8e ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1075b6:	81 c3 3e 8a 00 00    	add    $0x8a3e,%ebx
  1075bc:	83 ec 14             	sub    $0x14,%esp
  1075bf:	8b 44 24 20          	mov    0x20(%esp),%eax
    // TODO
    unsigned int pde_index = (vaddr & VA_PDIR_MASK) >> 22;
    unsigned int pte_index = (vaddr & VA_PTBL_MASK) >> 12;
    set_ptbl_entry(proc_index, pde_index, pte_index, page_index, perm);
  1075c3:	ff 74 24 28          	push   0x28(%esp)
  1075c7:	ff 74 24 28          	push   0x28(%esp)
    unsigned int pte_index = (vaddr & VA_PTBL_MASK) >> 12;
  1075cb:	89 c2                	mov    %eax,%edx
    unsigned int pde_index = (vaddr & VA_PDIR_MASK) >> 22;
  1075cd:	c1 e8 16             	shr    $0x16,%eax
    unsigned int pte_index = (vaddr & VA_PTBL_MASK) >> 12;
  1075d0:	c1 ea 0c             	shr    $0xc,%edx
  1075d3:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
    set_ptbl_entry(proc_index, pde_index, pte_index, page_index, perm);
  1075d9:	52                   	push   %edx
  1075da:	50                   	push   %eax
  1075db:	ff 74 24 2c          	push   0x2c(%esp)
  1075df:	e8 ac f8 ff ff       	call   106e90 <set_ptbl_entry>
}
  1075e4:	83 c4 28             	add    $0x28,%esp
  1075e7:	5b                   	pop    %ebx
  1075e8:	c3                   	ret
  1075e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001075f0 <set_pdir_entry_by_va>:

// Registers the mapping from [vaddr] to physical page # [page_index] in the page directory.
void set_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr,
                          unsigned int page_index)
{
  1075f0:	53                   	push   %ebx
  1075f1:	e8 ca 8d ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1075f6:	81 c3 fe 89 00 00    	add    $0x89fe,%ebx
  1075fc:	83 ec 0c             	sub    $0xc,%esp
    // TODO
    unsigned int pde_index = (vaddr & VA_PDIR_MASK) >> 22;
    set_pdir_entry(proc_index, pde_index, page_index);
  1075ff:	ff 74 24 1c          	push   0x1c(%esp)
    unsigned int pde_index = (vaddr & VA_PDIR_MASK) >> 22;
  107603:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  107607:	c1 e8 16             	shr    $0x16,%eax
    set_pdir_entry(proc_index, pde_index, page_index);
  10760a:	50                   	push   %eax
  10760b:	ff 74 24 1c          	push   0x1c(%esp)
  10760f:	e8 ac f7 ff ff       	call   106dc0 <set_pdir_entry>
}
  107614:	83 c4 18             	add    $0x18,%esp
  107617:	5b                   	pop    %ebx
  107618:	c3                   	ret
  107619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00107620 <idptbl_init>:

// Initializes the identity page table.
// The permission for the kernel memory should be PTE_P, PTE_W, and PTE_G,
// While the permission for the rest should be PTE_P and PTE_W.
void idptbl_init(unsigned int mbi_addr)
{
  107620:	56                   	push   %esi

    container_init(mbi_addr);

    // TODO
    unsigned int addr;
    for (addr = 0; addr < 0xFFFFF000; addr += PAGESIZE) {
  107621:	31 f6                	xor    %esi,%esi
{
  107623:	53                   	push   %ebx
  107624:	e8 97 8d ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  107629:	81 c3 cb 89 00 00    	add    $0x89cb,%ebx
  10762f:	83 ec 10             	sub    $0x10,%esp
    container_init(mbi_addr);
  107632:	ff 74 24 1c          	push   0x1c(%esp)
  107636:	e8 f5 ec ff ff       	call   106330 <container_init>
  10763b:	83 c4 10             	add    $0x10,%esp
  10763e:	66 90                	xchg   %ax,%ax
        unsigned int pde_index = (addr & VA_PDIR_MASK) >> 22;
        unsigned int pte_index = (addr & VA_PTBL_MASK) >> 12;
  107640:	89 f0                	mov    %esi,%eax
        unsigned int pde_index = (addr & VA_PDIR_MASK) >> 22;
  107642:	89 f2                	mov    %esi,%edx
        if (addr < VM_USERLO || addr >= VM_USERHI) {
  107644:	8d 8e 00 00 00 c0    	lea    -0x40000000(%esi),%ecx
        unsigned int pte_index = (addr & VA_PTBL_MASK) >> 12;
  10764a:	c1 e8 0c             	shr    $0xc,%eax
        unsigned int pde_index = (addr & VA_PDIR_MASK) >> 22;
  10764d:	c1 ea 16             	shr    $0x16,%edx
        unsigned int pte_index = (addr & VA_PTBL_MASK) >> 12;
  107650:	25 ff 03 00 00       	and    $0x3ff,%eax
        if (addr < VM_USERLO || addr >= VM_USERHI) {
  107655:	81 f9 ff ff ff af    	cmp    $0xafffffff,%ecx
  10765b:	76 26                	jbe    107683 <idptbl_init+0x63>
            //kernel pages
            set_ptbl_entry_identity(pde_index, pte_index, PT_PERM_PWG);
  10765d:	83 ec 04             	sub    $0x4,%esp
    for (addr = 0; addr < 0xFFFFF000; addr += PAGESIZE) {
  107660:	81 c6 00 10 00 00    	add    $0x1000,%esi
            set_ptbl_entry_identity(pde_index, pte_index, PT_PERM_PWG);
  107666:	68 03 01 00 00       	push   $0x103
  10766b:	50                   	push   %eax
  10766c:	52                   	push   %edx
  10766d:	e8 5e f8 ff ff       	call   106ed0 <set_ptbl_entry_identity>
    for (addr = 0; addr < 0xFFFFF000; addr += PAGESIZE) {
  107672:	83 c4 10             	add    $0x10,%esp
  107675:	81 fe 00 f0 ff ff    	cmp    $0xfffff000,%esi
  10767b:	75 c3                	jne    107640 <idptbl_init+0x20>
        }else {
            //not kernel pages
            set_ptbl_entry_identity(pde_index, pte_index, PT_PERM_PW);
        }
    }
}
  10767d:	83 c4 04             	add    $0x4,%esp
  107680:	5b                   	pop    %ebx
  107681:	5e                   	pop    %esi
  107682:	c3                   	ret
            set_ptbl_entry_identity(pde_index, pte_index, PT_PERM_PW);
  107683:	51                   	push   %ecx
    for (addr = 0; addr < 0xFFFFF000; addr += PAGESIZE) {
  107684:	81 c6 00 10 00 00    	add    $0x1000,%esi
            set_ptbl_entry_identity(pde_index, pte_index, PT_PERM_PW);
  10768a:	6a 03                	push   $0x3
  10768c:	50                   	push   %eax
  10768d:	52                   	push   %edx
  10768e:	e8 3d f8 ff ff       	call   106ed0 <set_ptbl_entry_identity>
    for (addr = 0; addr < 0xFFFFF000; addr += PAGESIZE) {
  107693:	83 c4 10             	add    $0x10,%esp
  107696:	eb a8                	jmp    107640 <idptbl_init+0x20>
  107698:	66 90                	xchg   %ax,%ax
  10769a:	66 90                	xchg   %ax,%ax
  10769c:	66 90                	xchg   %ax,%ax
  10769e:	66 90                	xchg   %ax,%ax

001076a0 <MPTOp_test1>:
#include <lib/debug.h>
#include "export.h"

int MPTOp_test1()
{
  1076a0:	53                   	push   %ebx
  1076a1:	e8 1a 8d ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1076a6:	81 c3 4e 89 00 00    	add    $0x894e,%ebx
  1076ac:	83 ec 10             	sub    $0x10,%esp
    unsigned int vaddr = 4096 * 1024 * 300;
    if (get_ptbl_entry_by_va(10, vaddr) != 0) {
  1076af:	68 00 00 00 4b       	push   $0x4b000000
  1076b4:	6a 0a                	push   $0xa
  1076b6:	e8 d5 fd ff ff       	call   107490 <get_ptbl_entry_by_va>
  1076bb:	83 c4 10             	add    $0x10,%esp
  1076be:	85 c0                	test   %eax,%eax
  1076c0:	0f 85 0a 01 00 00    	jne    1077d0 <MPTOp_test1+0x130>
        dprintf("test 1.1 failed: (%d != 0)\n", get_ptbl_entry_by_va(10, vaddr));
        return 1;
    }
    if (get_pdir_entry_by_va(10, vaddr) != 0) {
  1076c6:	83 ec 08             	sub    $0x8,%esp
  1076c9:	68 00 00 00 4b       	push   $0x4b000000
  1076ce:	6a 0a                	push   $0xa
  1076d0:	e8 2b fe ff ff       	call   107500 <get_pdir_entry_by_va>
  1076d5:	83 c4 10             	add    $0x10,%esp
  1076d8:	85 c0                	test   %eax,%eax
  1076da:	0f 85 c0 00 00 00    	jne    1077a0 <MPTOp_test1+0x100>
        dprintf("test 1.2 failed: (%d != 0)\n", get_pdir_entry_by_va(10, vaddr));
        return 1;
    }
    set_pdir_entry_by_va(10, vaddr, 100);
  1076e0:	83 ec 04             	sub    $0x4,%esp
  1076e3:	6a 64                	push   $0x64
  1076e5:	68 00 00 00 4b       	push   $0x4b000000
  1076ea:	6a 0a                	push   $0xa
  1076ec:	e8 ff fe ff ff       	call   1075f0 <set_pdir_entry_by_va>
    set_ptbl_entry_by_va(10, vaddr, 100, 259);
  1076f1:	68 03 01 00 00       	push   $0x103
  1076f6:	6a 64                	push   $0x64
  1076f8:	68 00 00 00 4b       	push   $0x4b000000
  1076fd:	6a 0a                	push   $0xa
  1076ff:	e8 ac fe ff ff       	call   1075b0 <set_ptbl_entry_by_va>
    if (get_ptbl_entry_by_va(10, vaddr) == 0) {
  107704:	83 c4 18             	add    $0x18,%esp
  107707:	68 00 00 00 4b       	push   $0x4b000000
  10770c:	6a 0a                	push   $0xa
  10770e:	e8 7d fd ff ff       	call   107490 <get_ptbl_entry_by_va>
  107713:	83 c4 10             	add    $0x10,%esp
  107716:	85 c0                	test   %eax,%eax
  107718:	0f 84 02 01 00 00    	je     107820 <MPTOp_test1+0x180>
        dprintf("test 1.3 failed: (%d == 0)\n", get_ptbl_entry_by_va(10, vaddr));
        return 1;
    }
    if (get_pdir_entry_by_va(10, vaddr) == 0) {
  10771e:	83 ec 08             	sub    $0x8,%esp
  107721:	68 00 00 00 4b       	push   $0x4b000000
  107726:	6a 0a                	push   $0xa
  107728:	e8 d3 fd ff ff       	call   107500 <get_pdir_entry_by_va>
  10772d:	83 c4 10             	add    $0x10,%esp
  107730:	85 c0                	test   %eax,%eax
  107732:	0f 84 c0 00 00 00    	je     1077f8 <MPTOp_test1+0x158>
        dprintf("test 1.4 failed: (%d == 0)\n", get_pdir_entry_by_va(10, vaddr));
        return 1;
    }
    rmv_ptbl_entry_by_va(10, vaddr);
  107738:	83 ec 08             	sub    $0x8,%esp
  10773b:	68 00 00 00 4b       	push   $0x4b000000
  107740:	6a 0a                	push   $0xa
  107742:	e8 e9 fd ff ff       	call   107530 <rmv_ptbl_entry_by_va>
    rmv_pdir_entry_by_va(10, vaddr);
  107747:	58                   	pop    %eax
  107748:	5a                   	pop    %edx
  107749:	68 00 00 00 4b       	push   $0x4b000000
  10774e:	6a 0a                	push   $0xa
  107750:	e8 2b fe ff ff       	call   107580 <rmv_pdir_entry_by_va>
    if (get_ptbl_entry_by_va(10, vaddr) != 0) {
  107755:	59                   	pop    %ecx
  107756:	58                   	pop    %eax
  107757:	68 00 00 00 4b       	push   $0x4b000000
  10775c:	6a 0a                	push   $0xa
  10775e:	e8 2d fd ff ff       	call   107490 <get_ptbl_entry_by_va>
  107763:	83 c4 10             	add    $0x10,%esp
  107766:	85 c0                	test   %eax,%eax
  107768:	0f 85 e2 00 00 00    	jne    107850 <MPTOp_test1+0x1b0>
        dprintf("test 1.5 failed: (%d != 0)\n", get_ptbl_entry_by_va(10, vaddr));
        return 1;
    }
    if (get_pdir_entry_by_va(10, vaddr) != 0) {
  10776e:	83 ec 08             	sub    $0x8,%esp
  107771:	68 00 00 00 4b       	push   $0x4b000000
  107776:	6a 0a                	push   $0xa
  107778:	e8 83 fd ff ff       	call   107500 <get_pdir_entry_by_va>
  10777d:	83 c4 10             	add    $0x10,%esp
  107780:	85 c0                	test   %eax,%eax
  107782:	0f 85 f8 00 00 00    	jne    107880 <MPTOp_test1+0x1e0>
        dprintf("test 1.6 failed: (%d != 0)\n", get_pdir_entry_by_va(10, vaddr));
        return 1;
    }
    dprintf("test 1 passed.\n");
  107788:	83 ec 0c             	sub    $0xc,%esp
  10778b:	8d 83 c4 98 ff ff    	lea    -0x673c(%ebx),%eax
  107791:	50                   	push   %eax
  107792:	e8 05 b6 ff ff       	call   102d9c <dprintf>
    return 0;
  107797:	83 c4 10             	add    $0x10,%esp
  10779a:	31 c0                	xor    %eax,%eax
  10779c:	eb 28                	jmp    1077c6 <MPTOp_test1+0x126>
  10779e:	66 90                	xchg   %ax,%ax
        dprintf("test 1.2 failed: (%d != 0)\n", get_pdir_entry_by_va(10, vaddr));
  1077a0:	83 ec 08             	sub    $0x8,%esp
  1077a3:	68 00 00 00 4b       	push   $0x4b000000
  1077a8:	6a 0a                	push   $0xa
  1077aa:	e8 51 fd ff ff       	call   107500 <get_pdir_entry_by_va>
  1077af:	5a                   	pop    %edx
  1077b0:	59                   	pop    %ecx
  1077b1:	50                   	push   %eax
  1077b2:	8d 83 5d 9b ff ff    	lea    -0x64a3(%ebx),%eax
  1077b8:	50                   	push   %eax
  1077b9:	e8 de b5 ff ff       	call   102d9c <dprintf>
        return 1;
  1077be:	83 c4 10             	add    $0x10,%esp
        return 1;
  1077c1:	b8 01 00 00 00       	mov    $0x1,%eax
}
  1077c6:	83 c4 08             	add    $0x8,%esp
  1077c9:	5b                   	pop    %ebx
  1077ca:	c3                   	ret
  1077cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        dprintf("test 1.1 failed: (%d != 0)\n", get_ptbl_entry_by_va(10, vaddr));
  1077d0:	83 ec 08             	sub    $0x8,%esp
  1077d3:	68 00 00 00 4b       	push   $0x4b000000
  1077d8:	6a 0a                	push   $0xa
  1077da:	e8 b1 fc ff ff       	call   107490 <get_ptbl_entry_by_va>
  1077df:	5a                   	pop    %edx
  1077e0:	59                   	pop    %ecx
  1077e1:	50                   	push   %eax
  1077e2:	8d 83 41 9b ff ff    	lea    -0x64bf(%ebx),%eax
  1077e8:	50                   	push   %eax
  1077e9:	e8 ae b5 ff ff       	call   102d9c <dprintf>
        return 1;
  1077ee:	83 c4 10             	add    $0x10,%esp
  1077f1:	eb ce                	jmp    1077c1 <MPTOp_test1+0x121>
  1077f3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        dprintf("test 1.4 failed: (%d == 0)\n", get_pdir_entry_by_va(10, vaddr));
  1077f8:	83 ec 08             	sub    $0x8,%esp
  1077fb:	68 00 00 00 4b       	push   $0x4b000000
  107800:	6a 0a                	push   $0xa
  107802:	e8 f9 fc ff ff       	call   107500 <get_pdir_entry_by_va>
  107807:	5a                   	pop    %edx
  107808:	59                   	pop    %ecx
  107809:	50                   	push   %eax
  10780a:	8d 83 95 9b ff ff    	lea    -0x646b(%ebx),%eax
  107810:	50                   	push   %eax
  107811:	e8 86 b5 ff ff       	call   102d9c <dprintf>
        return 1;
  107816:	83 c4 10             	add    $0x10,%esp
  107819:	eb a6                	jmp    1077c1 <MPTOp_test1+0x121>
  10781b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        dprintf("test 1.3 failed: (%d == 0)\n", get_ptbl_entry_by_va(10, vaddr));
  107820:	83 ec 08             	sub    $0x8,%esp
  107823:	68 00 00 00 4b       	push   $0x4b000000
  107828:	6a 0a                	push   $0xa
  10782a:	e8 61 fc ff ff       	call   107490 <get_ptbl_entry_by_va>
  10782f:	5a                   	pop    %edx
  107830:	59                   	pop    %ecx
  107831:	50                   	push   %eax
  107832:	8d 83 79 9b ff ff    	lea    -0x6487(%ebx),%eax
  107838:	50                   	push   %eax
  107839:	e8 5e b5 ff ff       	call   102d9c <dprintf>
        return 1;
  10783e:	83 c4 10             	add    $0x10,%esp
  107841:	e9 7b ff ff ff       	jmp    1077c1 <MPTOp_test1+0x121>
  107846:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10784d:	00 
  10784e:	66 90                	xchg   %ax,%ax
        dprintf("test 1.5 failed: (%d != 0)\n", get_ptbl_entry_by_va(10, vaddr));
  107850:	83 ec 08             	sub    $0x8,%esp
  107853:	68 00 00 00 4b       	push   $0x4b000000
  107858:	6a 0a                	push   $0xa
  10785a:	e8 31 fc ff ff       	call   107490 <get_ptbl_entry_by_va>
  10785f:	5a                   	pop    %edx
  107860:	59                   	pop    %ecx
  107861:	50                   	push   %eax
  107862:	8d 83 b1 9b ff ff    	lea    -0x644f(%ebx),%eax
  107868:	50                   	push   %eax
  107869:	e8 2e b5 ff ff       	call   102d9c <dprintf>
        return 1;
  10786e:	83 c4 10             	add    $0x10,%esp
  107871:	e9 4b ff ff ff       	jmp    1077c1 <MPTOp_test1+0x121>
  107876:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10787d:	00 
  10787e:	66 90                	xchg   %ax,%ax
        dprintf("test 1.6 failed: (%d != 0)\n", get_pdir_entry_by_va(10, vaddr));
  107880:	83 ec 08             	sub    $0x8,%esp
  107883:	68 00 00 00 4b       	push   $0x4b000000
  107888:	6a 0a                	push   $0xa
  10788a:	e8 71 fc ff ff       	call   107500 <get_pdir_entry_by_va>
  10788f:	5a                   	pop    %edx
  107890:	59                   	pop    %ecx
  107891:	50                   	push   %eax
  107892:	8d 83 cd 9b ff ff    	lea    -0x6433(%ebx),%eax
  107898:	50                   	push   %eax
  107899:	e8 fe b4 ff ff       	call   102d9c <dprintf>
        return 1;
  10789e:	83 c4 10             	add    $0x10,%esp
  1078a1:	e9 1b ff ff ff       	jmp    1077c1 <MPTOp_test1+0x121>
  1078a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1078ad:	00 
  1078ae:	66 90                	xchg   %ax,%ax

001078b0 <MPTOp_test_own>:
int MPTOp_test_own()
{
    // TODO (optional)
    // dprintf("own test passed.\n");
    return 0;
}
  1078b0:	31 c0                	xor    %eax,%eax
  1078b2:	c3                   	ret
  1078b3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1078ba:	00 
  1078bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

001078c0 <test_MPTOp>:

int test_MPTOp()
{
    return MPTOp_test1() + MPTOp_test_own();
  1078c0:	e9 db fd ff ff       	jmp    1076a0 <MPTOp_test1>
  1078c5:	66 90                	xchg   %ax,%ax
  1078c7:	66 90                	xchg   %ax,%ax
  1078c9:	66 90                	xchg   %ax,%ax
  1078cb:	66 90                	xchg   %ax,%ax
  1078cd:	66 90                	xchg   %ax,%ax
  1078cf:	90                   	nop

001078d0 <pdir_init>:
 * For each process from id 0 to NUM_IDS - 1,
 * set up the page directory entries so that the kernel portion of the map is
 * the identity map, and the rest of the page directories are unmapped.
 */
void pdir_init(unsigned int mbi_adr)
{
  1078d0:	57                   	push   %edi
    int i, j;
    
    idptbl_init(mbi_adr);

    //set other processes
    for(i = 0; i < NUM_IDS; i++){
  1078d1:	31 ff                	xor    %edi,%edi
{
  1078d3:	56                   	push   %esi
  1078d4:	53                   	push   %ebx
  1078d5:	e8 e6 8a ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1078da:	81 c3 1a 87 00 00    	add    $0x871a,%ebx
    idptbl_init(mbi_adr);
  1078e0:	83 ec 0c             	sub    $0xc,%esp
  1078e3:	ff 74 24 1c          	push   0x1c(%esp)
  1078e7:	e8 34 fd ff ff       	call   107620 <idptbl_init>
  1078ec:	83 c4 10             	add    $0x10,%esp
  1078ef:	90                   	nop
      //kernel address, set to identity
      for(j = 0; j < (VM_USERLO_PI >> 10); j++){
  1078f0:	31 f6                	xor    %esi,%esi
  1078f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        set_pdir_entry_identity(i, j);
  1078f8:	83 ec 08             	sub    $0x8,%esp
  1078fb:	56                   	push   %esi
      for(j = 0; j < (VM_USERLO_PI >> 10); j++){
  1078fc:	83 c6 01             	add    $0x1,%esi
        set_pdir_entry_identity(i, j);
  1078ff:	57                   	push   %edi
  107900:	e8 eb f4 ff ff       	call   106df0 <set_pdir_entry_identity>
      for(j = 0; j < (VM_USERLO_PI >> 10); j++){
  107905:	83 c4 10             	add    $0x10,%esp
  107908:	81 fe 00 01 00 00    	cmp    $0x100,%esi
  10790e:	75 e8                	jne    1078f8 <pdir_init+0x28>
      }
      //normal address, set to unmap
      for(j = VM_USERLO_PI >> 10; j < VM_USERHI_PI >> 10; j++){
        rmv_pdir_entry(i, j);
  107910:	83 ec 08             	sub    $0x8,%esp
  107913:	56                   	push   %esi
      for(j = VM_USERLO_PI >> 10; j < VM_USERHI_PI >> 10; j++){
  107914:	83 c6 01             	add    $0x1,%esi
        rmv_pdir_entry(i, j);
  107917:	57                   	push   %edi
  107918:	e8 13 f5 ff ff       	call   106e30 <rmv_pdir_entry>
      for(j = VM_USERLO_PI >> 10; j < VM_USERHI_PI >> 10; j++){
  10791d:	83 c4 10             	add    $0x10,%esp
  107920:	81 fe c0 03 00 00    	cmp    $0x3c0,%esi
  107926:	75 e8                	jne    107910 <pdir_init+0x40>
  107928:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10792f:	00 
      }
      //kernel address, set to identity
      for(j = VM_USERHI_PI >> 10; j < 1024; j++){
        set_pdir_entry_identity(i, j);
  107930:	83 ec 08             	sub    $0x8,%esp
  107933:	56                   	push   %esi
      for(j = VM_USERHI_PI >> 10; j < 1024; j++){
  107934:	83 c6 01             	add    $0x1,%esi
        set_pdir_entry_identity(i, j);
  107937:	57                   	push   %edi
  107938:	e8 b3 f4 ff ff       	call   106df0 <set_pdir_entry_identity>
      for(j = VM_USERHI_PI >> 10; j < 1024; j++){
  10793d:	83 c4 10             	add    $0x10,%esp
  107940:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  107946:	75 e8                	jne    107930 <pdir_init+0x60>
    for(i = 0; i < NUM_IDS; i++){
  107948:	83 c7 01             	add    $0x1,%edi
  10794b:	83 ff 40             	cmp    $0x40,%edi
  10794e:	75 a0                	jne    1078f0 <pdir_init+0x20>
      }
    }
    
}
  107950:	5b                   	pop    %ebx
  107951:	5e                   	pop    %esi
  107952:	5f                   	pop    %edi
  107953:	c3                   	ret
  107954:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10795b:	00 
  10795c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00107960 <alloc_ptbl>:
 * and clears (set to 0) all page table entries for this newly mapped page table.
 * It returns the page index of the newly allocated physical page.
 * In the case when there's no physical page available, it returns 0.
 */
unsigned int alloc_ptbl(unsigned int proc_index, unsigned int vadr)
{
  107960:	57                   	push   %edi
  107961:	56                   	push   %esi
  107962:	53                   	push   %ebx
  107963:	8b 7c 24 10          	mov    0x10(%esp),%edi
  107967:	e8 54 8a ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  10796c:	81 c3 88 86 00 00    	add    $0x8688,%ebx
  // TODO
  unsigned int addr;
  unsigned int page_index;
  page_index = container_alloc(proc_index);
  107972:	83 ec 0c             	sub    $0xc,%esp
  107975:	57                   	push   %edi
  107976:	e8 b5 eb ff ff       	call   106530 <container_alloc>
  if(page_index == 0) return 0;//no physical page vailable
  10797b:	83 c4 10             	add    $0x10,%esp
  page_index = container_alloc(proc_index);
  10797e:	89 c6                	mov    %eax,%esi
  if(page_index == 0) return 0;//no physical page vailable
  107980:	85 c0                	test   %eax,%eax
  107982:	75 0c                	jne    107990 <alloc_ptbl+0x30>
  // addr increases 4 per step, since entry is 4 bytes
  for(addr = page_index << 12; addr < (page_index + 1) << 12; addr += 4){
    *(unsigned int *)addr &= 0x00000000; 
  }
  return page_index;
}
  107984:	89 f0                	mov    %esi,%eax
  107986:	5b                   	pop    %ebx
  107987:	5e                   	pop    %esi
  107988:	5f                   	pop    %edi
  107989:	c3                   	ret
  10798a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  set_pdir_entry_by_va(proc_index, vadr, page_index);
  107990:	83 ec 04             	sub    $0x4,%esp
  107993:	50                   	push   %eax
  107994:	ff 74 24 1c          	push   0x1c(%esp)
  107998:	57                   	push   %edi
  107999:	e8 52 fc ff ff       	call   1075f0 <set_pdir_entry_by_va>
  for(addr = page_index << 12; addr < (page_index + 1) << 12; addr += 4){
  10799e:	89 f0                	mov    %esi,%eax
  1079a0:	8d 56 01             	lea    0x1(%esi),%edx
  1079a3:	83 c4 10             	add    $0x10,%esp
  1079a6:	c1 e0 0c             	shl    $0xc,%eax
  1079a9:	c1 e2 0c             	shl    $0xc,%edx
  1079ac:	39 d0                	cmp    %edx,%eax
  1079ae:	73 d4                	jae    107984 <alloc_ptbl+0x24>
    *(unsigned int *)addr &= 0x00000000; 
  1079b0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(addr = page_index << 12; addr < (page_index + 1) << 12; addr += 4){
  1079b6:	83 c0 04             	add    $0x4,%eax
  1079b9:	39 d0                	cmp    %edx,%eax
  1079bb:	73 c7                	jae    107984 <alloc_ptbl+0x24>
  1079bd:	b9 01 00 00 00       	mov    $0x1,%ecx
  1079c2:	85 c9                	test   %ecx,%ecx
  1079c4:	74 12                	je     1079d8 <alloc_ptbl+0x78>
    *(unsigned int *)addr &= 0x00000000; 
  1079c6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(addr = page_index << 12; addr < (page_index + 1) << 12; addr += 4){
  1079cc:	83 c0 04             	add    $0x4,%eax
  1079cf:	39 d0                	cmp    %edx,%eax
  1079d1:	73 b1                	jae    107984 <alloc_ptbl+0x24>
  1079d3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    *(unsigned int *)addr &= 0x00000000; 
  1079d8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(addr = page_index << 12; addr < (page_index + 1) << 12; addr += 4){
  1079de:	83 c0 08             	add    $0x8,%eax
    *(unsigned int *)addr &= 0x00000000; 
  1079e1:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
  for(addr = page_index << 12; addr < (page_index + 1) << 12; addr += 4){
  1079e8:	39 d0                	cmp    %edx,%eax
  1079ea:	72 ec                	jb     1079d8 <alloc_ptbl+0x78>
  1079ec:	eb 96                	jmp    107984 <alloc_ptbl+0x24>
  1079ee:	66 90                	xchg   %ax,%ax

001079f0 <free_ptbl>:

// Reverse operation of alloc_ptbl.
// Removes corresponding the page directory entry,
// and frees the page for the page table entries (with container_free).
void free_ptbl(unsigned int proc_index, unsigned int vadr)
{
  1079f0:	55                   	push   %ebp
  1079f1:	57                   	push   %edi
  1079f2:	56                   	push   %esi
  1079f3:	53                   	push   %ebx
  1079f4:	e8 c7 89 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1079f9:	81 c3 fb 85 00 00    	add    $0x85fb,%ebx
  1079ff:	83 ec 14             	sub    $0x14,%esp
  107a02:	8b 7c 24 28          	mov    0x28(%esp),%edi
  107a06:	8b 6c 24 2c          	mov    0x2c(%esp),%ebp
  // TODO
  unsigned int pdir_entry;
  unsigned int page_index;
  pdir_entry = get_pdir_entry_by_va(proc_index, vadr);
  107a0a:	55                   	push   %ebp
  107a0b:	57                   	push   %edi
  107a0c:	e8 ef fa ff ff       	call   107500 <get_pdir_entry_by_va>
  107a11:	89 c6                	mov    %eax,%esi
  page_index = pdir_entry >> 12;
  // remove page directory entry
  rmv_pdir_entry_by_va(proc_index, vadr);
  107a13:	58                   	pop    %eax
  107a14:	5a                   	pop    %edx
  107a15:	55                   	push   %ebp
  107a16:	57                   	push   %edi
  page_index = pdir_entry >> 12;
  107a17:	c1 ee 0c             	shr    $0xc,%esi
  rmv_pdir_entry_by_va(proc_index, vadr);
  107a1a:	e8 61 fb ff ff       	call   107580 <rmv_pdir_entry_by_va>

  //free the page for the page table entities
  container_free(proc_index, page_index);
  107a1f:	59                   	pop    %ecx
  107a20:	5d                   	pop    %ebp
  107a21:	56                   	push   %esi
  107a22:	57                   	push   %edi
  107a23:	e8 38 eb ff ff       	call   106560 <container_free>
}
  107a28:	83 c4 1c             	add    $0x1c,%esp
  107a2b:	5b                   	pop    %ebx
  107a2c:	5e                   	pop    %esi
  107a2d:	5f                   	pop    %edi
  107a2e:	5d                   	pop    %ebp
  107a2f:	c3                   	ret

00107a30 <MPTComm_test1>:
#include <pmm/MContainer/export.h>
#include <vmm/MPTOp/export.h>
#include "export.h"

int MPTComm_test1()
{
  107a30:	55                   	push   %ebp
  107a31:	57                   	push   %edi
  107a32:	bf 03 01 00 00       	mov    $0x103,%edi
  107a37:	56                   	push   %esi
    unsigned int i;
    for (i = 0; i < 1024; i++) {
  107a38:	31 f6                	xor    %esi,%esi
{
  107a3a:	53                   	push   %ebx
  107a3b:	e8 80 89 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  107a40:	81 c3 b4 85 00 00    	add    $0x85b4,%ebx
  107a46:	83 ec 0c             	sub    $0xc,%esp
  107a49:	eb 0e                	jmp    107a59 <MPTComm_test1+0x29>
  107a4b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    for (i = 0; i < 1024; i++) {
  107a50:	83 c6 01             	add    $0x1,%esi
  107a53:	81 c7 00 00 40 00    	add    $0x400000,%edi
        if (i < 256 || i >= 960) {
  107a59:	8d 86 00 ff ff ff    	lea    -0x100(%esi),%eax
  107a5f:	3d bf 02 00 00       	cmp    $0x2bf,%eax
  107a64:	76 ea                	jbe    107a50 <MPTComm_test1+0x20>
            if (get_ptbl_entry_by_va(10, i * 4096 * 1024) !=
  107a66:	89 f5                	mov    %esi,%ebp
  107a68:	52                   	push   %edx
  107a69:	c1 e5 16             	shl    $0x16,%ebp
  107a6c:	52                   	push   %edx
  107a6d:	55                   	push   %ebp
  107a6e:	6a 0a                	push   $0xa
  107a70:	e8 1b fa ff ff       	call   107490 <get_ptbl_entry_by_va>
  107a75:	83 c4 10             	add    $0x10,%esp
  107a78:	39 f8                	cmp    %edi,%eax
  107a7a:	75 2d                	jne    107aa9 <MPTComm_test1+0x79>
    for (i = 0; i < 1024; i++) {
  107a7c:	83 c6 01             	add    $0x1,%esi
  107a7f:	81 c7 00 00 40 00    	add    $0x400000,%edi
  107a85:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  107a8b:	75 cc                	jne    107a59 <MPTComm_test1+0x29>
                        i * 4096 * 1024 + 259);
                return 1;
            }
        }
    }
    dprintf("test 1 passed.\n");
  107a8d:	83 ec 0c             	sub    $0xc,%esp
  107a90:	8d 83 c4 98 ff ff    	lea    -0x673c(%ebx),%eax
  107a96:	50                   	push   %eax
  107a97:	e8 00 b3 ff ff       	call   102d9c <dprintf>
    return 0;
  107a9c:	83 c4 10             	add    $0x10,%esp
  107a9f:	31 c0                	xor    %eax,%eax
}
  107aa1:	83 c4 0c             	add    $0xc,%esp
  107aa4:	5b                   	pop    %ebx
  107aa5:	5e                   	pop    %esi
  107aa6:	5f                   	pop    %edi
  107aa7:	5d                   	pop    %ebp
  107aa8:	c3                   	ret
                dprintf("test 1.1 failed (i = %d): (%d != %d)\n",
  107aa9:	50                   	push   %eax
  107aaa:	50                   	push   %eax
  107aab:	55                   	push   %ebp
  107aac:	6a 0a                	push   $0xa
  107aae:	e8 dd f9 ff ff       	call   107490 <get_ptbl_entry_by_va>
  107ab3:	57                   	push   %edi
  107ab4:	50                   	push   %eax
  107ab5:	8d 83 14 9d ff ff    	lea    -0x62ec(%ebx),%eax
  107abb:	56                   	push   %esi
  107abc:	50                   	push   %eax
  107abd:	e8 da b2 ff ff       	call   102d9c <dprintf>
                return 1;
  107ac2:	83 c4 20             	add    $0x20,%esp
  107ac5:	b8 01 00 00 00       	mov    $0x1,%eax
  107aca:	eb d5                	jmp    107aa1 <MPTComm_test1+0x71>
  107acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00107ad0 <MPTComm_test2>:

int MPTComm_test2()
{
  107ad0:	53                   	push   %ebx
  107ad1:	e8 ea 88 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  107ad6:	81 c3 1e 85 00 00    	add    $0x851e,%ebx
  107adc:	83 ec 10             	sub    $0x10,%esp
    unsigned int vaddr = 300 * 4096 * 1024;
    container_split(0, 100);
  107adf:	6a 64                	push   $0x64
  107ae1:	6a 00                	push   $0x0
  107ae3:	e8 c8 e9 ff ff       	call   1064b0 <container_split>
    alloc_ptbl(1, vaddr);
  107ae8:	59                   	pop    %ecx
  107ae9:	58                   	pop    %eax
  107aea:	68 00 00 00 4b       	push   $0x4b000000
  107aef:	6a 01                	push   $0x1
  107af1:	e8 6a fe ff ff       	call   107960 <alloc_ptbl>
    if (get_pdir_entry_by_va(1, vaddr) == 0) {
  107af6:	58                   	pop    %eax
  107af7:	5a                   	pop    %edx
  107af8:	68 00 00 00 4b       	push   $0x4b000000
  107afd:	6a 01                	push   $0x1
  107aff:	e8 fc f9 ff ff       	call   107500 <get_pdir_entry_by_va>
  107b04:	83 c4 10             	add    $0x10,%esp
  107b07:	85 c0                	test   %eax,%eax
  107b09:	0f 84 89 00 00 00    	je     107b98 <MPTComm_test2+0xc8>
        dprintf("test 2.1 failed: (%d == 0)\n", get_pdir_entry_by_va(1, vaddr));
        return 1;
    }
    if (get_ptbl_entry_by_va(1, vaddr) != 0) {
  107b0f:	83 ec 08             	sub    $0x8,%esp
  107b12:	68 00 00 00 4b       	push   $0x4b000000
  107b17:	6a 01                	push   $0x1
  107b19:	e8 72 f9 ff ff       	call   107490 <get_ptbl_entry_by_va>
  107b1e:	83 c4 10             	add    $0x10,%esp
  107b21:	85 c0                	test   %eax,%eax
  107b23:	75 43                	jne    107b68 <MPTComm_test2+0x98>
        dprintf("test 2.2 failed: (%d != 0)\n", get_ptbl_entry_by_va(1, vaddr));
        return 1;
    }
    free_ptbl(1, vaddr);
  107b25:	83 ec 08             	sub    $0x8,%esp
  107b28:	68 00 00 00 4b       	push   $0x4b000000
  107b2d:	6a 01                	push   $0x1
  107b2f:	e8 bc fe ff ff       	call   1079f0 <free_ptbl>
    if (get_pdir_entry_by_va(1, vaddr) != 0) {
  107b34:	58                   	pop    %eax
  107b35:	5a                   	pop    %edx
  107b36:	68 00 00 00 4b       	push   $0x4b000000
  107b3b:	6a 01                	push   $0x1
  107b3d:	e8 be f9 ff ff       	call   107500 <get_pdir_entry_by_va>
  107b42:	83 c4 10             	add    $0x10,%esp
  107b45:	85 c0                	test   %eax,%eax
  107b47:	75 77                	jne    107bc0 <MPTComm_test2+0xf0>
        dprintf("test 2.3 failed: (%d != 0)\n", get_pdir_entry_by_va(1, vaddr));
        return 1;
    }
    dprintf("test 2 passed.\n");
  107b49:	83 ec 0c             	sub    $0xc,%esp
  107b4c:	8d 83 d4 98 ff ff    	lea    -0x672c(%ebx),%eax
  107b52:	50                   	push   %eax
  107b53:	e8 44 b2 ff ff       	call   102d9c <dprintf>
    return 0;
  107b58:	83 c4 10             	add    $0x10,%esp
  107b5b:	31 c0                	xor    %eax,%eax
}
  107b5d:	83 c4 08             	add    $0x8,%esp
  107b60:	5b                   	pop    %ebx
  107b61:	c3                   	ret
  107b62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        dprintf("test 2.2 failed: (%d != 0)\n", get_ptbl_entry_by_va(1, vaddr));
  107b68:	83 ec 08             	sub    $0x8,%esp
  107b6b:	68 00 00 00 4b       	push   $0x4b000000
  107b70:	6a 01                	push   $0x1
  107b72:	e8 19 f9 ff ff       	call   107490 <get_ptbl_entry_by_va>
  107b77:	59                   	pop    %ecx
  107b78:	5a                   	pop    %edx
  107b79:	50                   	push   %eax
  107b7a:	8d 83 d0 9a ff ff    	lea    -0x6530(%ebx),%eax
  107b80:	50                   	push   %eax
  107b81:	e8 16 b2 ff ff       	call   102d9c <dprintf>
        return 1;
  107b86:	83 c4 10             	add    $0x10,%esp
}
  107b89:	83 c4 08             	add    $0x8,%esp
        return 1;
  107b8c:	b8 01 00 00 00       	mov    $0x1,%eax
}
  107b91:	5b                   	pop    %ebx
  107b92:	c3                   	ret
  107b93:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        dprintf("test 2.1 failed: (%d == 0)\n", get_pdir_entry_by_va(1, vaddr));
  107b98:	83 ec 08             	sub    $0x8,%esp
  107b9b:	68 00 00 00 4b       	push   $0x4b000000
  107ba0:	6a 01                	push   $0x1
  107ba2:	e8 59 f9 ff ff       	call   107500 <get_pdir_entry_by_va>
  107ba7:	59                   	pop    %ecx
  107ba8:	5a                   	pop    %edx
  107ba9:	50                   	push   %eax
  107baa:	8d 83 e9 9b ff ff    	lea    -0x6417(%ebx),%eax
  107bb0:	50                   	push   %eax
  107bb1:	e8 e6 b1 ff ff       	call   102d9c <dprintf>
        return 1;
  107bb6:	83 c4 10             	add    $0x10,%esp
  107bb9:	eb ce                	jmp    107b89 <MPTComm_test2+0xb9>
  107bbb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        dprintf("test 2.3 failed: (%d != 0)\n", get_pdir_entry_by_va(1, vaddr));
  107bc0:	83 ec 08             	sub    $0x8,%esp
  107bc3:	68 00 00 00 4b       	push   $0x4b000000
  107bc8:	6a 01                	push   $0x1
  107bca:	e8 31 f9 ff ff       	call   107500 <get_pdir_entry_by_va>
  107bcf:	5a                   	pop    %edx
  107bd0:	59                   	pop    %ecx
  107bd1:	50                   	push   %eax
  107bd2:	8d 83 05 9c ff ff    	lea    -0x63fb(%ebx),%eax
  107bd8:	50                   	push   %eax
  107bd9:	e8 be b1 ff ff       	call   102d9c <dprintf>
        return 1;
  107bde:	83 c4 10             	add    $0x10,%esp
  107be1:	eb a6                	jmp    107b89 <MPTComm_test2+0xb9>
  107be3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107bea:	00 
  107beb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00107bf0 <MPTComm_test_own>:
int MPTComm_test_own()
{
    // TODO (optional)
    // dprintf("own test passed.\n");
    return 0;
}
  107bf0:	31 c0                	xor    %eax,%eax
  107bf2:	c3                   	ret
  107bf3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107bfa:	00 
  107bfb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00107c00 <test_MPTComm>:

int test_MPTComm()
{
  107c00:	53                   	push   %ebx
  107c01:	83 ec 08             	sub    $0x8,%esp
    return MPTComm_test1() + MPTComm_test2() + MPTComm_test_own();
  107c04:	e8 27 fe ff ff       	call   107a30 <MPTComm_test1>
  107c09:	89 c3                	mov    %eax,%ebx
  107c0b:	e8 c0 fe ff ff       	call   107ad0 <MPTComm_test2>
}
  107c10:	83 c4 08             	add    $0x8,%esp
    return MPTComm_test1() + MPTComm_test2() + MPTComm_test_own();
  107c13:	01 d8                	add    %ebx,%eax
}
  107c15:	5b                   	pop    %ebx
  107c16:	c3                   	ret
  107c17:	66 90                	xchg   %ax,%ax
  107c19:	66 90                	xchg   %ax,%ax
  107c1b:	66 90                	xchg   %ax,%ax
  107c1d:	66 90                	xchg   %ax,%ax
  107c1f:	90                   	nop

00107c20 <pdir_init_kern>:
/**
 * Sets the entire page map for process 0 as the identity map.
 * Note that part of the task is already completed by pdir_init.
 */
void pdir_init_kern(unsigned int mbi_addr)
{
  107c20:	56                   	push   %esi
    // TODO: Define your local variables here.

    pdir_init(mbi_addr);

    //TODO
    unsigned int pde_index = 0;
  107c21:	31 f6                	xor    %esi,%esi
{
  107c23:	53                   	push   %ebx
  107c24:	e8 97 87 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  107c29:	81 c3 cb 83 00 00    	add    $0x83cb,%ebx
  107c2f:	83 ec 10             	sub    $0x10,%esp
    pdir_init(mbi_addr);
  107c32:	ff 74 24 1c          	push   0x1c(%esp)
  107c36:	e8 95 fc ff ff       	call   1078d0 <pdir_init>
  107c3b:	83 c4 10             	add    $0x10,%esp
  107c3e:	66 90                	xchg   %ax,%ax
    for (; pde_index < 1024; pde_index++) {
        set_pdir_entry_identity(0, pde_index);
  107c40:	83 ec 08             	sub    $0x8,%esp
  107c43:	56                   	push   %esi
    for (; pde_index < 1024; pde_index++) {
  107c44:	83 c6 01             	add    $0x1,%esi
        set_pdir_entry_identity(0, pde_index);
  107c47:	6a 00                	push   $0x0
  107c49:	e8 a2 f1 ff ff       	call   106df0 <set_pdir_entry_identity>
    for (; pde_index < 1024; pde_index++) {
  107c4e:	83 c4 10             	add    $0x10,%esp
  107c51:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  107c57:	75 e7                	jne    107c40 <pdir_init_kern+0x20>
    }
}
  107c59:	83 c4 04             	add    $0x4,%esp
  107c5c:	5b                   	pop    %ebx
  107c5d:	5e                   	pop    %esi
  107c5e:	c3                   	ret
  107c5f:	90                   	nop

00107c60 <map_page>:
 * In the case of error, it returns the constant MagicNumber defined in lib/x86.h,
 * otherwise, it returns the physical page index registered in the page directory,
 * (the return value of get_pdir_entry_by_va or alloc_ptbl).
 */
unsigned int map_page(unsigned int proc_index, unsigned int vadr, unsigned int page_index, unsigned int perm)
{   
  107c60:	57                   	push   %edi
  107c61:	56                   	push   %esi
  107c62:	53                   	push   %ebx
  107c63:	8b 74 24 10          	mov    0x10(%esp),%esi
  107c67:	e8 54 87 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  107c6c:	81 c3 88 83 00 00    	add    $0x8388,%ebx
  107c72:	8b 7c 24 14          	mov    0x14(%esp),%edi
  // TODO
  unsigned int pde = get_pdir_entry_by_va(proc_index, vadr);
  107c76:	83 ec 08             	sub    $0x8,%esp
  107c79:	57                   	push   %edi
  107c7a:	56                   	push   %esi
  107c7b:	e8 80 f8 ff ff       	call   107500 <get_pdir_entry_by_va>
  unsigned int ptbl;
  if ((pde & PTE_P) == 0) {
  107c80:	83 c4 10             	add    $0x10,%esp
  107c83:	a8 01                	test   $0x1,%al
  107c85:	75 11                	jne    107c98 <map_page+0x38>
    ptbl = alloc_ptbl(proc_index, vadr);
  107c87:	83 ec 08             	sub    $0x8,%esp
  107c8a:	57                   	push   %edi
  107c8b:	56                   	push   %esi
  107c8c:	e8 cf fc ff ff       	call   107960 <alloc_ptbl>
    if (ptbl == 0) {
  107c91:	83 c4 10             	add    $0x10,%esp
  107c94:	85 c0                	test   %eax,%eax
  107c96:	74 28                	je     107cc0 <map_page+0x60>
      //no physical page available
      return MagicNumber;
    }
  }
  set_ptbl_entry_by_va(proc_index, vadr, page_index, perm);
  107c98:	ff 74 24 1c          	push   0x1c(%esp)
  107c9c:	ff 74 24 1c          	push   0x1c(%esp)
  107ca0:	57                   	push   %edi
  107ca1:	56                   	push   %esi
  107ca2:	e8 09 f9 ff ff       	call   1075b0 <set_ptbl_entry_by_va>
  pde = get_pdir_entry_by_va(proc_index, vadr);
  107ca7:	58                   	pop    %eax
  107ca8:	5a                   	pop    %edx
  107ca9:	57                   	push   %edi
  107caa:	56                   	push   %esi
  107cab:	e8 50 f8 ff ff       	call   107500 <get_pdir_entry_by_va>
  return pde >> 12;
  107cb0:	83 c4 10             	add    $0x10,%esp
}
  107cb3:	5b                   	pop    %ebx
  return pde >> 12;
  107cb4:	c1 e8 0c             	shr    $0xc,%eax
}
  107cb7:	5e                   	pop    %esi
  107cb8:	5f                   	pop    %edi
  107cb9:	c3                   	ret
  107cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  107cc0:	5b                   	pop    %ebx
      return MagicNumber;
  107cc1:	b8 01 00 10 00       	mov    $0x100001,%eax
}
  107cc6:	5e                   	pop    %esi
  107cc7:	5f                   	pop    %edi
  107cc8:	c3                   	ret
  107cc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00107cd0 <unmap_page>:
 * Nothing should be done if the mapping no longer exists.
 * You do not need to unmap the page table from the page directory.
 * It should return the corresponding page table entry.
 */
unsigned int unmap_page(unsigned int proc_index, unsigned int vadr)
{
  107cd0:	57                   	push   %edi
  107cd1:	56                   	push   %esi
  107cd2:	53                   	push   %ebx
  107cd3:	8b 74 24 10          	mov    0x10(%esp),%esi
  107cd7:	e8 e4 86 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  107cdc:	81 c3 18 83 00 00    	add    $0x8318,%ebx
  107ce2:	8b 7c 24 14          	mov    0x14(%esp),%edi
  // TODO
  unsigned int pte = get_ptbl_entry_by_va(proc_index, vadr);
  107ce6:	83 ec 08             	sub    $0x8,%esp
  107ce9:	57                   	push   %edi
  107cea:	56                   	push   %esi
  107ceb:	e8 a0 f7 ff ff       	call   107490 <get_ptbl_entry_by_va>
  if ((pte & PTE_P) == 0) {
  107cf0:	83 c4 10             	add    $0x10,%esp
  107cf3:	a8 01                	test   $0x1,%al
  107cf5:	74 16                	je     107d0d <unmap_page+0x3d>
    return pte;
  }
  rmv_ptbl_entry_by_va(proc_index, vadr);
  107cf7:	83 ec 08             	sub    $0x8,%esp
  107cfa:	57                   	push   %edi
  107cfb:	56                   	push   %esi
  107cfc:	e8 2f f8 ff ff       	call   107530 <rmv_ptbl_entry_by_va>
  pte = get_ptbl_entry_by_va(proc_index, vadr);
  107d01:	58                   	pop    %eax
  107d02:	5a                   	pop    %edx
  107d03:	57                   	push   %edi
  107d04:	56                   	push   %esi
  107d05:	e8 86 f7 ff ff       	call   107490 <get_ptbl_entry_by_va>
  return pte;
  107d0a:	83 c4 10             	add    $0x10,%esp
}
  107d0d:	5b                   	pop    %ebx
  107d0e:	5e                   	pop    %esi
  107d0f:	5f                   	pop    %edi
  107d10:	c3                   	ret
  107d11:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107d18:	00 
  107d19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00107d20 <map_superpage>:
 * Map a 4 MB super-page: vaddr must be 4 MB aligned, page_index must be
 * 1024-page aligned.
 */
unsigned int map_superpage(unsigned int proc_index, unsigned int vaddr,
                           unsigned int page_index, unsigned int perm)
{
  107d20:	56                   	push   %esi
  107d21:	53                   	push   %ebx
  107d22:	e8 99 86 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  107d27:	81 c3 cd 82 00 00    	add    $0x82cd,%ebx
  107d2d:	83 ec 04             	sub    $0x4,%esp
  107d30:	8b 74 24 18          	mov    0x18(%esp),%esi
    unsigned int pde_index = vaddr >> 22;
    set_pdir_entry_superpage(proc_index, pde_index, page_index, perm);
  107d34:	ff 74 24 1c          	push   0x1c(%esp)
  107d38:	56                   	push   %esi
    unsigned int pde_index = vaddr >> 22;
  107d39:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  107d3d:	c1 e8 16             	shr    $0x16,%eax
    set_pdir_entry_superpage(proc_index, pde_index, page_index, perm);
  107d40:	50                   	push   %eax
  107d41:	ff 74 24 1c          	push   0x1c(%esp)
  107d45:	e8 e6 f1 ff ff       	call   106f30 <set_pdir_entry_superpage>
    return page_index;
}
  107d4a:	83 c4 14             	add    $0x14,%esp
  107d4d:	89 f0                	mov    %esi,%eax
  107d4f:	5b                   	pop    %ebx
  107d50:	5e                   	pop    %esi
  107d51:	c3                   	ret
  107d52:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107d59:	00 
  107d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00107d60 <unmap_superpage>:

/**
 * Unmap a 4 MB super-page at the given 4 MB-aligned vaddr.
 */
void unmap_superpage(unsigned int proc_index, unsigned int vaddr)
{
  107d60:	53                   	push   %ebx
  107d61:	e8 5a 86 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  107d66:	81 c3 8e 82 00 00    	add    $0x828e,%ebx
  107d6c:	83 ec 10             	sub    $0x10,%esp
    unsigned int pde_index = vaddr >> 22;
  107d6f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  107d73:	c1 e8 16             	shr    $0x16,%eax
    rmv_pdir_entry(proc_index, pde_index);
  107d76:	50                   	push   %eax
  107d77:	ff 74 24 1c          	push   0x1c(%esp)
  107d7b:	e8 b0 f0 ff ff       	call   106e30 <rmv_pdir_entry>
}
  107d80:	83 c4 18             	add    $0x18,%esp
  107d83:	5b                   	pop    %ebx
  107d84:	c3                   	ret
  107d85:	66 90                	xchg   %ax,%ax
  107d87:	66 90                	xchg   %ax,%ax
  107d89:	66 90                	xchg   %ax,%ax
  107d8b:	66 90                	xchg   %ax,%ax
  107d8d:	66 90                	xchg   %ax,%ax
  107d8f:	90                   	nop

00107d90 <MPTKern_test1>:
#include <vmm/MPTOp/export.h>
#include <vmm/MPTIntro/export.h>
#include "export.h"

int MPTKern_test1()
{
  107d90:	53                   	push   %ebx
  107d91:	e8 2a 86 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  107d96:	81 c3 5e 82 00 00    	add    $0x825e,%ebx
  107d9c:	83 ec 10             	sub    $0x10,%esp
    unsigned int vaddr = 4096 * 1024 * 300;
    container_split(0, 100);
  107d9f:	6a 64                	push   $0x64
  107da1:	6a 00                	push   $0x0
  107da3:	e8 08 e7 ff ff       	call   1064b0 <container_split>
    if (get_ptbl_entry_by_va(1, vaddr) != 0) {
  107da8:	58                   	pop    %eax
  107da9:	5a                   	pop    %edx
  107daa:	68 00 00 00 4b       	push   $0x4b000000
  107daf:	6a 01                	push   $0x1
  107db1:	e8 da f6 ff ff       	call   107490 <get_ptbl_entry_by_va>
  107db6:	83 c4 10             	add    $0x10,%esp
  107db9:	85 c0                	test   %eax,%eax
  107dbb:	0f 85 cf 00 00 00    	jne    107e90 <MPTKern_test1+0x100>
        dprintf("test 1.1 failed: (%d != 0)\n", get_ptbl_entry_by_va(1, vaddr));
        return 1;
    }
    if (get_pdir_entry_by_va(1, vaddr) != 0) {
  107dc1:	83 ec 08             	sub    $0x8,%esp
  107dc4:	68 00 00 00 4b       	push   $0x4b000000
  107dc9:	6a 01                	push   $0x1
  107dcb:	e8 30 f7 ff ff       	call   107500 <get_pdir_entry_by_va>
  107dd0:	83 c4 10             	add    $0x10,%esp
  107dd3:	85 c0                	test   %eax,%eax
  107dd5:	0f 85 85 00 00 00    	jne    107e60 <MPTKern_test1+0xd0>
        dprintf("test 1.2 failed: (%d != 0)\n", get_pdir_entry_by_va(1, vaddr));
        return 1;
    }
    map_page(1, vaddr, 100, 7);
  107ddb:	6a 07                	push   $0x7
  107ddd:	6a 64                	push   $0x64
  107ddf:	68 00 00 00 4b       	push   $0x4b000000
  107de4:	6a 01                	push   $0x1
  107de6:	e8 75 fe ff ff       	call   107c60 <map_page>
    if (get_ptbl_entry_by_va(1, vaddr) == 0) {
  107deb:	59                   	pop    %ecx
  107dec:	58                   	pop    %eax
  107ded:	68 00 00 00 4b       	push   $0x4b000000
  107df2:	6a 01                	push   $0x1
  107df4:	e8 97 f6 ff ff       	call   107490 <get_ptbl_entry_by_va>
  107df9:	83 c4 10             	add    $0x10,%esp
  107dfc:	85 c0                	test   %eax,%eax
  107dfe:	0f 84 dc 00 00 00    	je     107ee0 <MPTKern_test1+0x150>
        dprintf("test 1.3 failed: (%d == 0)\n", get_ptbl_entry_by_va(1, vaddr));
        return 1;
    }
    if (get_pdir_entry_by_va(1, vaddr) == 0) {
  107e04:	83 ec 08             	sub    $0x8,%esp
  107e07:	68 00 00 00 4b       	push   $0x4b000000
  107e0c:	6a 01                	push   $0x1
  107e0e:	e8 ed f6 ff ff       	call   107500 <get_pdir_entry_by_va>
  107e13:	83 c4 10             	add    $0x10,%esp
  107e16:	85 c0                	test   %eax,%eax
  107e18:	0f 84 9a 00 00 00    	je     107eb8 <MPTKern_test1+0x128>
        dprintf("test 1.4 failed: (%d == 0)\n", get_pdir_entry_by_va(1, vaddr));
        return 1;
    }
    unmap_page(1, vaddr);
  107e1e:	83 ec 08             	sub    $0x8,%esp
  107e21:	68 00 00 00 4b       	push   $0x4b000000
  107e26:	6a 01                	push   $0x1
  107e28:	e8 a3 fe ff ff       	call   107cd0 <unmap_page>
    if (get_ptbl_entry_by_va(1, vaddr) != 0) {
  107e2d:	58                   	pop    %eax
  107e2e:	5a                   	pop    %edx
  107e2f:	68 00 00 00 4b       	push   $0x4b000000
  107e34:	6a 01                	push   $0x1
  107e36:	e8 55 f6 ff ff       	call   107490 <get_ptbl_entry_by_va>
  107e3b:	83 c4 10             	add    $0x10,%esp
  107e3e:	85 c0                	test   %eax,%eax
  107e40:	0f 85 ca 00 00 00    	jne    107f10 <MPTKern_test1+0x180>
        dprintf("test 1.5 failed: (%d != 0)\n", get_ptbl_entry_by_va(1, vaddr));
        return 1;
    }
    dprintf("test 1 passed.\n");
  107e46:	83 ec 0c             	sub    $0xc,%esp
  107e49:	8d 83 c4 98 ff ff    	lea    -0x673c(%ebx),%eax
  107e4f:	50                   	push   %eax
  107e50:	e8 47 af ff ff       	call   102d9c <dprintf>
    return 0;
  107e55:	83 c4 10             	add    $0x10,%esp
  107e58:	31 c0                	xor    %eax,%eax
}
  107e5a:	83 c4 08             	add    $0x8,%esp
  107e5d:	5b                   	pop    %ebx
  107e5e:	c3                   	ret
  107e5f:	90                   	nop
        dprintf("test 1.2 failed: (%d != 0)\n", get_pdir_entry_by_va(1, vaddr));
  107e60:	83 ec 08             	sub    $0x8,%esp
  107e63:	68 00 00 00 4b       	push   $0x4b000000
  107e68:	6a 01                	push   $0x1
  107e6a:	e8 91 f6 ff ff       	call   107500 <get_pdir_entry_by_va>
  107e6f:	5a                   	pop    %edx
  107e70:	59                   	pop    %ecx
  107e71:	50                   	push   %eax
  107e72:	8d 83 5d 9b ff ff    	lea    -0x64a3(%ebx),%eax
  107e78:	50                   	push   %eax
  107e79:	e8 1e af ff ff       	call   102d9c <dprintf>
        return 1;
  107e7e:	83 c4 10             	add    $0x10,%esp
}
  107e81:	83 c4 08             	add    $0x8,%esp
        return 1;
  107e84:	b8 01 00 00 00       	mov    $0x1,%eax
}
  107e89:	5b                   	pop    %ebx
  107e8a:	c3                   	ret
  107e8b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        dprintf("test 1.1 failed: (%d != 0)\n", get_ptbl_entry_by_va(1, vaddr));
  107e90:	83 ec 08             	sub    $0x8,%esp
  107e93:	68 00 00 00 4b       	push   $0x4b000000
  107e98:	6a 01                	push   $0x1
  107e9a:	e8 f1 f5 ff ff       	call   107490 <get_ptbl_entry_by_va>
  107e9f:	5a                   	pop    %edx
  107ea0:	59                   	pop    %ecx
  107ea1:	50                   	push   %eax
  107ea2:	8d 83 41 9b ff ff    	lea    -0x64bf(%ebx),%eax
  107ea8:	50                   	push   %eax
  107ea9:	e8 ee ae ff ff       	call   102d9c <dprintf>
        return 1;
  107eae:	83 c4 10             	add    $0x10,%esp
  107eb1:	eb ce                	jmp    107e81 <MPTKern_test1+0xf1>
  107eb3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        dprintf("test 1.4 failed: (%d == 0)\n", get_pdir_entry_by_va(1, vaddr));
  107eb8:	83 ec 08             	sub    $0x8,%esp
  107ebb:	68 00 00 00 4b       	push   $0x4b000000
  107ec0:	6a 01                	push   $0x1
  107ec2:	e8 39 f6 ff ff       	call   107500 <get_pdir_entry_by_va>
  107ec7:	59                   	pop    %ecx
  107ec8:	5a                   	pop    %edx
  107ec9:	50                   	push   %eax
  107eca:	8d 83 95 9b ff ff    	lea    -0x646b(%ebx),%eax
  107ed0:	50                   	push   %eax
  107ed1:	e8 c6 ae ff ff       	call   102d9c <dprintf>
        return 1;
  107ed6:	83 c4 10             	add    $0x10,%esp
  107ed9:	eb a6                	jmp    107e81 <MPTKern_test1+0xf1>
  107edb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        dprintf("test 1.3 failed: (%d == 0)\n", get_ptbl_entry_by_va(1, vaddr));
  107ee0:	83 ec 08             	sub    $0x8,%esp
  107ee3:	68 00 00 00 4b       	push   $0x4b000000
  107ee8:	6a 01                	push   $0x1
  107eea:	e8 a1 f5 ff ff       	call   107490 <get_ptbl_entry_by_va>
  107eef:	59                   	pop    %ecx
  107ef0:	5a                   	pop    %edx
  107ef1:	50                   	push   %eax
  107ef2:	8d 83 79 9b ff ff    	lea    -0x6487(%ebx),%eax
  107ef8:	50                   	push   %eax
  107ef9:	e8 9e ae ff ff       	call   102d9c <dprintf>
        return 1;
  107efe:	83 c4 10             	add    $0x10,%esp
  107f01:	e9 7b ff ff ff       	jmp    107e81 <MPTKern_test1+0xf1>
  107f06:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107f0d:	00 
  107f0e:	66 90                	xchg   %ax,%ax
        dprintf("test 1.5 failed: (%d != 0)\n", get_ptbl_entry_by_va(1, vaddr));
  107f10:	83 ec 08             	sub    $0x8,%esp
  107f13:	68 00 00 00 4b       	push   $0x4b000000
  107f18:	6a 01                	push   $0x1
  107f1a:	e8 71 f5 ff ff       	call   107490 <get_ptbl_entry_by_va>
  107f1f:	5a                   	pop    %edx
  107f20:	59                   	pop    %ecx
  107f21:	50                   	push   %eax
  107f22:	8d 83 b1 9b ff ff    	lea    -0x644f(%ebx),%eax
  107f28:	50                   	push   %eax
  107f29:	e8 6e ae ff ff       	call   102d9c <dprintf>
        return 1;
  107f2e:	83 c4 10             	add    $0x10,%esp
  107f31:	e9 4b ff ff ff       	jmp    107e81 <MPTKern_test1+0xf1>
  107f36:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107f3d:	00 
  107f3e:	66 90                	xchg   %ax,%ax

00107f40 <MPTKern_test2>:

int MPTKern_test2()
{
  107f40:	57                   	push   %edi
  107f41:	56                   	push   %esi
  107f42:	be 03 00 00 40       	mov    $0x40000003,%esi
  107f47:	53                   	push   %ebx
  107f48:	e8 73 84 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  107f4d:	81 c3 a7 80 00 00    	add    $0x80a7,%ebx
  107f53:	eb 11                	jmp    107f66 <MPTKern_test2+0x26>
  107f55:	8d 76 00             	lea    0x0(%esi),%esi
    unsigned int i;
    for (i = 256; i < 960; i++) {
  107f58:	81 c6 00 00 40 00    	add    $0x400000,%esi
  107f5e:	81 fe 03 00 00 f0    	cmp    $0xf0000003,%esi
  107f64:	74 3d                	je     107fa3 <MPTKern_test2+0x63>
        if (get_ptbl_entry_by_va(0, i * 4096 * 1024L) !=
  107f66:	83 ec 08             	sub    $0x8,%esp
  107f69:	8d 7e fd             	lea    -0x3(%esi),%edi
  107f6c:	57                   	push   %edi
  107f6d:	6a 00                	push   $0x0
  107f6f:	e8 1c f5 ff ff       	call   107490 <get_ptbl_entry_by_va>
  107f74:	83 c4 10             	add    $0x10,%esp
  107f77:	39 f0                	cmp    %esi,%eax
  107f79:	74 dd                	je     107f58 <MPTKern_test2+0x18>
            i * 4096 * 1024L + 3) {
            dprintf("test 2.1 failed (i = %d): (%d != %d)\n",
  107f7b:	83 ec 08             	sub    $0x8,%esp
  107f7e:	57                   	push   %edi
  107f7f:	6a 00                	push   $0x0
  107f81:	e8 0a f5 ff ff       	call   107490 <get_ptbl_entry_by_va>
  107f86:	83 c4 0c             	add    $0xc,%esp
  107f89:	56                   	push   %esi
  107f8a:	50                   	push   %eax
  107f8b:	8d 83 30 a9 ff ff    	lea    -0x56d0(%ebx),%eax
  107f91:	50                   	push   %eax
  107f92:	e8 05 ae ff ff       	call   102d9c <dprintf>
                    get_ptbl_entry_by_va(0, i * 4096 * 1024L),
                    i * 4096 * 1024L + 3);
            return 1;
  107f97:	83 c4 10             	add    $0x10,%esp
  107f9a:	b8 01 00 00 00       	mov    $0x1,%eax
        }
    }
    dprintf("test 2 passed.\n");
    return 0;
}
  107f9f:	5b                   	pop    %ebx
  107fa0:	5e                   	pop    %esi
  107fa1:	5f                   	pop    %edi
  107fa2:	c3                   	ret
    dprintf("test 2 passed.\n");
  107fa3:	83 ec 0c             	sub    $0xc,%esp
  107fa6:	8d 83 d4 98 ff ff    	lea    -0x672c(%ebx),%eax
  107fac:	50                   	push   %eax
  107fad:	e8 ea ad ff ff       	call   102d9c <dprintf>
    return 0;
  107fb2:	83 c4 10             	add    $0x10,%esp
  107fb5:	31 c0                	xor    %eax,%eax
}
  107fb7:	5b                   	pop    %ebx
  107fb8:	5e                   	pop    %esi
  107fb9:	5f                   	pop    %edi
  107fba:	c3                   	ret
  107fbb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00107fc0 <MPTKern_test_map_superpage>:
 */
/**
 * Test map_superpage: sets PDE with PS bit and correct physical address.
 */
int MPTKern_test_map_superpage()
{
  107fc0:	56                   	push   %esi
  107fc1:	53                   	push   %ebx
  107fc2:	e8 f9 83 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  107fc7:	81 c3 2d 80 00 00    	add    $0x802d,%ebx
  107fcd:	83 ec 04             	sub    $0x4,%esp
    unsigned int pde, page_index, pde_index;
    unsigned int vaddr = 4096 * 1024 * 256;  /* 0x40000000, PDE index 256 */

    page_index = 0x40000;  /* 1024-page aligned = 0x40000000 physical */

    map_superpage(2, vaddr, page_index, PTE_P | PTE_W | PTE_U);
  107fd0:	6a 07                	push   $0x7
  107fd2:	68 00 00 04 00       	push   $0x40000
  107fd7:	68 00 00 00 40       	push   $0x40000000
  107fdc:	6a 02                	push   $0x2
  107fde:	e8 3d fd ff ff       	call   107d20 <map_superpage>

    pde_index = vaddr >> 22;  /* = 256 */
    pde = get_pdir_entry(2, pde_index);
  107fe3:	59                   	pop    %ecx
  107fe4:	5e                   	pop    %esi
  107fe5:	68 00 01 00 00       	push   $0x100
  107fea:	6a 02                	push   $0x2
  107fec:	e8 af ed ff ff       	call   106da0 <get_pdir_entry>

    /* PDE must have PTE_PS set */
    if (!(pde & PTE_PS)) {
  107ff1:	83 c4 10             	add    $0x10,%esp
    pde = get_pdir_entry(2, pde_index);
  107ff4:	89 c6                	mov    %eax,%esi
    if (!(pde & PTE_PS)) {
  107ff6:	a8 80                	test   $0x80,%al
  107ff8:	74 66                	je     108060 <MPTKern_test_map_superpage+0xa0>
        rmv_pdir_entry(2, pde_index);
        return 1;
    }

    /* is_superpage must return 1 */
    if (is_superpage(2, pde_index) != 1) {
  107ffa:	83 ec 08             	sub    $0x8,%esp
  107ffd:	68 00 01 00 00       	push   $0x100
  108002:	6a 02                	push   $0x2
  108004:	e8 57 ef ff ff       	call   106f60 <is_superpage>
  108009:	83 c4 10             	add    $0x10,%esp
  10800c:	83 f8 01             	cmp    $0x1,%eax
  10800f:	75 3f                	jne    108050 <MPTKern_test_map_superpage+0x90>
        rmv_pdir_entry(2, pde_index);
        return 1;
    }

    /* Physical address must be page_index << 12 */
    if ((pde & 0xFFFFF000) != (page_index << 12)) {
  108011:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  108017:	81 fe 00 00 00 40    	cmp    $0x40000000,%esi
  10801d:	74 51                	je     108070 <MPTKern_test_map_superpage+0xb0>
        dprintf("test map_superpage failed: addr 0x%x != 0x%x\n",
  10801f:	83 ec 04             	sub    $0x4,%esp
  108022:	8d 83 c4 a9 ff ff    	lea    -0x563c(%ebx),%eax
  108028:	68 00 00 00 40       	push   $0x40000000
  10802d:	56                   	push   %esi
        dprintf("test map_superpage failed: is_superpage returned 0\n");
  10802e:	50                   	push   %eax
  10802f:	e8 68 ad ff ff       	call   102d9c <dprintf>
        rmv_pdir_entry(2, pde_index);
  108034:	58                   	pop    %eax
  108035:	5a                   	pop    %edx
  108036:	68 00 01 00 00       	push   $0x100
  10803b:	6a 02                	push   $0x2
  10803d:	e8 ee ed ff ff       	call   106e30 <rmv_pdir_entry>
        return 1;
  108042:	83 c4 10             	add    $0x10,%esp
        return 1;
  108045:	b8 01 00 00 00       	mov    $0x1,%eax
    }

    rmv_pdir_entry(2, pde_index);
    dprintf("test map_superpage passed.\n");
    return 0;
}
  10804a:	83 c4 04             	add    $0x4,%esp
  10804d:	5b                   	pop    %ebx
  10804e:	5e                   	pop    %esi
  10804f:	c3                   	ret
        dprintf("test map_superpage failed: is_superpage returned 0\n");
  108050:	83 ec 0c             	sub    $0xc,%esp
  108053:	8d 83 90 a9 ff ff    	lea    -0x5670(%ebx),%eax
  108059:	eb d3                	jmp    10802e <MPTKern_test_map_superpage+0x6e>
  10805b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        dprintf("test map_superpage failed: PTE_PS not set (pde=0x%x)\n", pde);
  108060:	83 ec 08             	sub    $0x8,%esp
  108063:	50                   	push   %eax
  108064:	8d 83 58 a9 ff ff    	lea    -0x56a8(%ebx),%eax
  10806a:	eb c2                	jmp    10802e <MPTKern_test_map_superpage+0x6e>
  10806c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    rmv_pdir_entry(2, pde_index);
  108070:	83 ec 08             	sub    $0x8,%esp
  108073:	68 00 01 00 00       	push   $0x100
  108078:	6a 02                	push   $0x2
  10807a:	e8 b1 ed ff ff       	call   106e30 <rmv_pdir_entry>
    dprintf("test map_superpage passed.\n");
  10807f:	8d 83 21 9c ff ff    	lea    -0x63df(%ebx),%eax
  108085:	89 04 24             	mov    %eax,(%esp)
  108088:	e8 0f ad ff ff       	call   102d9c <dprintf>
    return 0;
  10808d:	83 c4 10             	add    $0x10,%esp
  108090:	31 c0                	xor    %eax,%eax
}
  108092:	83 c4 04             	add    $0x4,%esp
  108095:	5b                   	pop    %ebx
  108096:	5e                   	pop    %esi
  108097:	c3                   	ret
  108098:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10809f:	00 

001080a0 <MPTKern_test_unmap_superpage>:

/**
 * Test unmap_superpage: clears the PDE entry.
 */
int MPTKern_test_unmap_superpage()
{
  1080a0:	53                   	push   %ebx
  1080a1:	e8 1a 83 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1080a6:	81 c3 4e 7f 00 00    	add    $0x7f4e,%ebx
  1080ac:	83 ec 08             	sub    $0x8,%esp
    unsigned int pde, pde_index;
    unsigned int vaddr = 4096 * 1024 * 257;  /* PDE index 257 */
    unsigned int page_index = 0x40400;  /* 1024-aligned */

    map_superpage(2, vaddr, page_index, PTE_P | PTE_W | PTE_U);
  1080af:	6a 07                	push   $0x7
  1080b1:	68 00 04 04 00       	push   $0x40400
  1080b6:	68 00 00 40 40       	push   $0x40400000
  1080bb:	6a 02                	push   $0x2
  1080bd:	e8 5e fc ff ff       	call   107d20 <map_superpage>

    pde_index = vaddr >> 22;  /* = 257 */

    /* Verify it's mapped first */
    pde = get_pdir_entry(2, pde_index);
  1080c2:	59                   	pop    %ecx
  1080c3:	58                   	pop    %eax
  1080c4:	68 01 01 00 00       	push   $0x101
  1080c9:	6a 02                	push   $0x2
  1080cb:	e8 d0 ec ff ff       	call   106da0 <get_pdir_entry>
    if (pde == 0) {
  1080d0:	83 c4 10             	add    $0x10,%esp
  1080d3:	85 c0                	test   %eax,%eax
  1080d5:	74 79                	je     108150 <MPTKern_test_unmap_superpage+0xb0>
        dprintf("test unmap_superpage failed: PDE not set after map\n");
        return 1;
    }

    /* Now unmap */
    unmap_superpage(2, vaddr);
  1080d7:	83 ec 08             	sub    $0x8,%esp
  1080da:	68 00 00 40 40       	push   $0x40400000
  1080df:	6a 02                	push   $0x2
  1080e1:	e8 7a fc ff ff       	call   107d60 <unmap_superpage>

    pde = get_pdir_entry(2, pde_index);
  1080e6:	58                   	pop    %eax
  1080e7:	5a                   	pop    %edx
  1080e8:	68 01 01 00 00       	push   $0x101
  1080ed:	6a 02                	push   $0x2
  1080ef:	e8 ac ec ff ff       	call   106da0 <get_pdir_entry>
    if (pde != 0) {
  1080f4:	83 c4 10             	add    $0x10,%esp
  1080f7:	85 c0                	test   %eax,%eax
  1080f9:	75 35                	jne    108130 <MPTKern_test_unmap_superpage+0x90>
        dprintf("test unmap_superpage failed: PDE not cleared (pde=0x%x)\n", pde);
        return 1;
    }

    if (is_superpage(2, pde_index) != 0) {
  1080fb:	83 ec 08             	sub    $0x8,%esp
  1080fe:	68 01 01 00 00       	push   $0x101
  108103:	6a 02                	push   $0x2
  108105:	e8 56 ee ff ff       	call   106f60 <is_superpage>
  10810a:	83 c4 10             	add    $0x10,%esp
  10810d:	85 c0                	test   %eax,%eax
  10810f:	75 57                	jne    108168 <MPTKern_test_unmap_superpage+0xc8>
        dprintf("test unmap_superpage failed: is_superpage still 1 after unmap\n");
        return 1;
    }

    dprintf("test unmap_superpage passed.\n");
  108111:	83 ec 0c             	sub    $0xc,%esp
  108114:	8d 83 3d 9c ff ff    	lea    -0x63c3(%ebx),%eax
  10811a:	50                   	push   %eax
  10811b:	e8 7c ac ff ff       	call   102d9c <dprintf>
    return 0;
  108120:	83 c4 10             	add    $0x10,%esp
  108123:	31 c0                	xor    %eax,%eax
}
  108125:	83 c4 08             	add    $0x8,%esp
  108128:	5b                   	pop    %ebx
  108129:	c3                   	ret
  10812a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        dprintf("test unmap_superpage failed: PDE not cleared (pde=0x%x)\n", pde);
  108130:	83 ec 08             	sub    $0x8,%esp
  108133:	50                   	push   %eax
  108134:	8d 83 28 aa ff ff    	lea    -0x55d8(%ebx),%eax
  10813a:	50                   	push   %eax
  10813b:	e8 5c ac ff ff       	call   102d9c <dprintf>
        return 1;
  108140:	83 c4 10             	add    $0x10,%esp
}
  108143:	83 c4 08             	add    $0x8,%esp
        return 1;
  108146:	b8 01 00 00 00       	mov    $0x1,%eax
}
  10814b:	5b                   	pop    %ebx
  10814c:	c3                   	ret
  10814d:	8d 76 00             	lea    0x0(%esi),%esi
        dprintf("test unmap_superpage failed: PDE not set after map\n");
  108150:	83 ec 0c             	sub    $0xc,%esp
  108153:	8d 83 f4 a9 ff ff    	lea    -0x560c(%ebx),%eax
  108159:	50                   	push   %eax
  10815a:	e8 3d ac ff ff       	call   102d9c <dprintf>
        return 1;
  10815f:	83 c4 10             	add    $0x10,%esp
  108162:	eb df                	jmp    108143 <MPTKern_test_unmap_superpage+0xa3>
  108164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        dprintf("test unmap_superpage failed: is_superpage still 1 after unmap\n");
  108168:	83 ec 0c             	sub    $0xc,%esp
  10816b:	8d 83 64 aa ff ff    	lea    -0x559c(%ebx),%eax
  108171:	50                   	push   %eax
  108172:	e8 25 ac ff ff       	call   102d9c <dprintf>
        return 1;
  108177:	83 c4 10             	add    $0x10,%esp
  10817a:	eb c7                	jmp    108143 <MPTKern_test_unmap_superpage+0xa3>
  10817c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00108180 <test_MPTKern>:

int test_MPTKern()
{
  108180:	53                   	push   %ebx
  108181:	83 ec 08             	sub    $0x8,%esp
    return MPTKern_test1() + MPTKern_test2()
  108184:	e8 07 fc ff ff       	call   107d90 <MPTKern_test1>
  108189:	89 c3                	mov    %eax,%ebx
  10818b:	e8 b0 fd ff ff       	call   107f40 <MPTKern_test2>
  108190:	01 c3                	add    %eax,%ebx
         + MPTKern_test_map_superpage()
  108192:	e8 29 fe ff ff       	call   107fc0 <MPTKern_test_map_superpage>
  108197:	01 c3                	add    %eax,%ebx
         + MPTKern_test_unmap_superpage();
  108199:	e8 02 ff ff ff       	call   1080a0 <MPTKern_test_unmap_superpage>
}
  10819e:	83 c4 08             	add    $0x8,%esp
         + MPTKern_test_unmap_superpage();
  1081a1:	01 d8                	add    %ebx,%eax
}
  1081a3:	5b                   	pop    %ebx
  1081a4:	c3                   	ret
  1081a5:	66 90                	xchg   %ax,%ax
  1081a7:	66 90                	xchg   %ax,%ax
  1081a9:	66 90                	xchg   %ax,%ax
  1081ab:	66 90                	xchg   %ax,%ax
  1081ad:	66 90                	xchg   %ax,%ax
  1081af:	90                   	nop

001081b0 <paging_init>:
/**
 * Initializes the page structures, enables PSE for super-page support,
 * moves to the kernel page structure (0), and turns on the paging.
 */
void paging_init(unsigned int mbi_addr)
{
  1081b0:	53                   	push   %ebx
  1081b1:	e8 0a 82 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1081b6:	81 c3 3e 7e 00 00    	add    $0x7e3e,%ebx
  1081bc:	83 ec 14             	sub    $0x14,%esp
    pdir_init_kern(mbi_addr);
  1081bf:	ff 74 24 1c          	push   0x1c(%esp)
  1081c3:	e8 58 fa ff ff       	call   107c20 <pdir_init_kern>
    enable_pse();   /* Enable 4 MB page support (Phase 4) */
  1081c8:	e8 5b 90 ff ff       	call   101228 <enable_pse>
    brk_init();     /* Initialise per-process program breaks (Phase 6) */
  1081cd:	e8 1e 00 00 00       	call   1081f0 <brk_init>
    set_pdir_base(0);
  1081d2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1081d9:	e8 92 eb ff ff       	call   106d70 <set_pdir_base>
    enable_paging();
  1081de:	e8 ef 8f ff ff       	call   1011d2 <enable_paging>
}
  1081e3:	83 c4 18             	add    $0x18,%esp
  1081e6:	5b                   	pop    %ebx
  1081e7:	c3                   	ret
  1081e8:	66 90                	xchg   %ax,%ax
  1081ea:	66 90                	xchg   %ax,%ax
  1081ec:	66 90                	xchg   %ax,%ax
  1081ee:	66 90                	xchg   %ax,%ax

001081f0 <brk_init>:
 * Called once from paging_init after the memory subsystem is ready.
 */
void brk_init(void)
{
    unsigned int i;
    for (i = 0; i < NUM_IDS; i++)
  1081f0:	e8 c3 81 ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  1081f5:	05 ff 7d 00 00       	add    $0x7dff,%eax
  1081fa:	8d 80 0c e0 c8 01    	lea    0x1c8e00c(%eax),%eax
  108200:	8d 90 00 01 00 00    	lea    0x100(%eax),%edx
  108206:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10820d:	00 
  10820e:	66 90                	xchg   %ax,%ax
        proc_brk[i] = VM_USERLO;
  108210:	c7 00 00 00 00 40    	movl   $0x40000000,(%eax)
    for (i = 0; i < NUM_IDS; i++)
  108216:	83 c0 08             	add    $0x8,%eax
        proc_brk[i] = VM_USERLO;
  108219:	c7 40 fc 00 00 00 40 	movl   $0x40000000,-0x4(%eax)
    for (i = 0; i < NUM_IDS; i++)
  108220:	39 d0                	cmp    %edx,%eax
  108222:	75 ec                	jne    108210 <brk_init+0x20>
}
  108224:	c3                   	ret
  108225:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10822c:	00 
  10822d:	8d 76 00             	lea    0x0(%esi),%esi

00108230 <alloc_page>:
 * Called by the page-fault handler.  Returns the PDE value on success
 * or MagicNumber on failure.
 */
unsigned int alloc_page(unsigned int proc_index, unsigned int vaddr,
                        unsigned int perm)
{
  108230:	56                   	push   %esi
  108231:	53                   	push   %ebx
  108232:	e8 89 81 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  108237:	81 c3 bd 7d 00 00    	add    $0x7dbd,%ebx
  10823d:	83 ec 10             	sub    $0x10,%esp
  108240:	8b 74 24 1c          	mov    0x1c(%esp),%esi
    unsigned int page_index = container_alloc(proc_index);
  108244:	56                   	push   %esi
  108245:	e8 e6 e2 ff ff       	call   106530 <container_alloc>
    if (page_index == 0)
  10824a:	83 c4 10             	add    $0x10,%esp
  10824d:	ba 01 00 10 00       	mov    $0x100001,%edx
  108252:	85 c0                	test   %eax,%eax
  108254:	74 14                	je     10826a <alloc_page+0x3a>
        return MagicNumber;
    return map_page(proc_index, vaddr, page_index, perm);
  108256:	ff 74 24 18          	push   0x18(%esp)
  10825a:	50                   	push   %eax
  10825b:	ff 74 24 1c          	push   0x1c(%esp)
  10825f:	56                   	push   %esi
  108260:	e8 fb f9 ff ff       	call   107c60 <map_page>
  108265:	83 c4 10             	add    $0x10,%esp
  108268:	89 c2                	mov    %eax,%edx
}
  10826a:	83 c4 04             	add    $0x4,%esp
  10826d:	89 d0                	mov    %edx,%eax
  10826f:	5b                   	pop    %ebx
  108270:	5e                   	pop    %esi
  108271:	c3                   	ret
  108272:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  108279:	00 
  10827a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00108280 <alloc_pages>:
 * Returns the starting physical page index on success, or MagicNumber on
 * failure (with any partial mappings rolled back).
 */
unsigned int alloc_pages(unsigned int proc_index, unsigned int vaddr,
                         unsigned int perm, unsigned int order)
{
  108280:	55                   	push   %ebp
  108281:	57                   	push   %edi
  108282:	56                   	push   %esi
  108283:	53                   	push   %ebx
  108284:	e8 37 81 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  108289:	81 c3 6b 7d 00 00    	add    $0x7d6b,%ebx
  10828f:	83 ec 24             	sub    $0x24,%esp
    unsigned int count = 1u << order;
    unsigned int page_index, i;

    page_index = container_alloc_n(proc_index, order);
  108292:	ff 74 24 44          	push   0x44(%esp)
  108296:	ff 74 24 3c          	push   0x3c(%esp)
  10829a:	e8 f1 e2 ff ff       	call   106590 <container_alloc_n>
    if (page_index == 0)
  10829f:	83 c4 10             	add    $0x10,%esp
  1082a2:	85 c0                	test   %eax,%eax
  1082a4:	0f 84 9b 00 00 00    	je     108345 <alloc_pages+0xc5>
        return MagicNumber;

    /* Super-page fast path: order 10, 4 MB-aligned virtual address */
    if (order == MAX_ORDER && (vaddr & 0x3FFFFFu) == 0) {
  1082aa:	83 7c 24 3c 0a       	cmpl   $0xa,0x3c(%esp)
  1082af:	89 c5                	mov    %eax,%ebp
  1082b1:	0f 84 a1 00 00 00    	je     108358 <alloc_pages+0xd8>
    unsigned int count = 1u << order;
  1082b7:	0f b6 4c 24 3c       	movzbl 0x3c(%esp),%ecx
  1082bc:	b8 01 00 00 00       	mov    $0x1,%eax
  1082c1:	8b 7c 24 34          	mov    0x34(%esp),%edi
  1082c5:	31 f6                	xor    %esi,%esi
  1082c7:	d3 e0                	shl    %cl,%eax
  1082c9:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1082cd:	eb 10                	jmp    1082df <alloc_pages+0x5f>
  1082cf:	90                   	nop
        map_superpage(proc_index, vaddr, page_index, perm);
        return page_index;
    }

    /* Regular path: map each page individually */
    for (i = 0; i < count; i++) {
  1082d0:	83 c6 01             	add    $0x1,%esi
  1082d3:	81 c7 00 10 00 00    	add    $0x1000,%edi
  1082d9:	39 74 24 0c          	cmp    %esi,0xc(%esp)
  1082dd:	74 6b                	je     10834a <alloc_pages+0xca>
        unsigned int va = vaddr + i * PAGESIZE;
        unsigned int result = map_page(proc_index, va, page_index + i, perm);
  1082df:	8d 44 35 00          	lea    0x0(%ebp,%esi,1),%eax
  1082e3:	ff 74 24 38          	push   0x38(%esp)
  1082e7:	50                   	push   %eax
  1082e8:	57                   	push   %edi
  1082e9:	ff 74 24 3c          	push   0x3c(%esp)
  1082ed:	e8 6e f9 ff ff       	call   107c60 <map_page>
        if (result == MagicNumber) {
  1082f2:	83 c4 10             	add    $0x10,%esp
  1082f5:	3d 01 00 10 00       	cmp    $0x100001,%eax
  1082fa:	75 d4                	jne    1082d0 <alloc_pages+0x50>
            /* Rollback: unmap pages already mapped */
            unsigned int j;
            for (j = 0; j < i; j++)
  1082fc:	85 f6                	test   %esi,%esi
  1082fe:	74 31                	je     108331 <alloc_pages+0xb1>
  108300:	31 c9                	xor    %ecx,%ecx
  108302:	8b 7c 24 34          	mov    0x34(%esp),%edi
  108306:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
  10830a:	89 cd                	mov    %ecx,%ebp
  10830c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
                unmap_page(proc_index, vaddr + j * PAGESIZE);
  108310:	83 ec 08             	sub    $0x8,%esp
            for (j = 0; j < i; j++)
  108313:	83 c5 01             	add    $0x1,%ebp
                unmap_page(proc_index, vaddr + j * PAGESIZE);
  108316:	57                   	push   %edi
            for (j = 0; j < i; j++)
  108317:	81 c7 00 10 00 00    	add    $0x1000,%edi
                unmap_page(proc_index, vaddr + j * PAGESIZE);
  10831d:	ff 74 24 3c          	push   0x3c(%esp)
  108321:	e8 aa f9 ff ff       	call   107cd0 <unmap_page>
            for (j = 0; j < i; j++)
  108326:	83 c4 10             	add    $0x10,%esp
  108329:	39 f5                	cmp    %esi,%ebp
  10832b:	75 e3                	jne    108310 <alloc_pages+0x90>
  10832d:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
            container_free_n(proc_index, page_index, order);
  108331:	83 ec 04             	sub    $0x4,%esp
  108334:	ff 74 24 40          	push   0x40(%esp)
  108338:	55                   	push   %ebp
  108339:	ff 74 24 3c          	push   0x3c(%esp)
  10833d:	e8 ae e2 ff ff       	call   1065f0 <container_free_n>
            return MagicNumber;
  108342:	83 c4 10             	add    $0x10,%esp
        return MagicNumber;
  108345:	bd 01 00 10 00       	mov    $0x100001,%ebp
        }
    }
    return page_index;
}
  10834a:	83 c4 1c             	add    $0x1c,%esp
  10834d:	89 e8                	mov    %ebp,%eax
  10834f:	5b                   	pop    %ebx
  108350:	5e                   	pop    %esi
  108351:	5f                   	pop    %edi
  108352:	5d                   	pop    %ebp
  108353:	c3                   	ret
  108354:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (order == MAX_ORDER && (vaddr & 0x3FFFFFu) == 0) {
  108358:	f7 44 24 34 ff ff 3f 	testl  $0x3fffff,0x34(%esp)
  10835f:	00 
  108360:	0f 85 51 ff ff ff    	jne    1082b7 <alloc_pages+0x37>
        map_superpage(proc_index, vaddr, page_index, perm);
  108366:	ff 74 24 38          	push   0x38(%esp)
  10836a:	50                   	push   %eax
  10836b:	ff 74 24 3c          	push   0x3c(%esp)
  10836f:	ff 74 24 3c          	push   0x3c(%esp)
  108373:	e8 a8 f9 ff ff       	call   107d20 <map_superpage>
        return page_index;
  108378:	83 c4 10             	add    $0x10,%esp
  10837b:	eb cd                	jmp    10834a <alloc_pages+0xca>
  10837d:	8d 76 00             	lea    0x0(%esi),%esi

00108380 <free_pages>:
 *
 * Detects super-page mappings automatically via is_superpage().
 */
void free_pages(unsigned int proc_index, unsigned int vaddr,
                unsigned int order)
{
  108380:	55                   	push   %ebp
  108381:	57                   	push   %edi
    unsigned int count = 1u << order;
  108382:	bf 01 00 00 00       	mov    $0x1,%edi
{
  108387:	56                   	push   %esi
  108388:	53                   	push   %ebx
  108389:	e8 32 80 ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  10838e:	81 c3 66 7c 00 00    	add    $0x7c66,%ebx
  108394:	83 ec 1c             	sub    $0x1c,%esp
    unsigned int count = 1u << order;
  108397:	0f b6 4c 24 38       	movzbl 0x38(%esp),%ecx
{
  10839c:	8b 74 24 34          	mov    0x34(%esp),%esi
    unsigned int count = 1u << order;
  1083a0:	d3 e7                	shl    %cl,%edi
    unsigned int pde_index = vaddr >> 22;
    unsigned int i, page_index;

    /* Super-page case */
    if (order == MAX_ORDER && is_superpage(proc_index, pde_index)) {
  1083a2:	83 7c 24 38 0a       	cmpl   $0xa,0x38(%esp)
  1083a7:	74 5f                	je     108408 <free_pages+0x88>
        return;
    }

    /* Regular multi-page: resolve physical base from first PTE */
    {
        unsigned int pte = get_ptbl_entry_by_va(proc_index, vaddr);
  1083a9:	83 ec 08             	sub    $0x8,%esp
        page_index = pte >> 12;
    }
    for (i = 0; i < count; i++)
  1083ac:	31 ed                	xor    %ebp,%ebp
        unsigned int pte = get_ptbl_entry_by_va(proc_index, vaddr);
  1083ae:	56                   	push   %esi
  1083af:	ff 74 24 3c          	push   0x3c(%esp)
  1083b3:	e8 d8 f0 ff ff       	call   107490 <get_ptbl_entry_by_va>
        page_index = pte >> 12;
  1083b8:	83 c4 10             	add    $0x10,%esp
  1083bb:	c1 e8 0c             	shr    $0xc,%eax
    for (i = 0; i < count; i++)
  1083be:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1083c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        unmap_page(proc_index, vaddr + i * PAGESIZE);
  1083c8:	83 ec 08             	sub    $0x8,%esp
    for (i = 0; i < count; i++)
  1083cb:	83 c5 01             	add    $0x1,%ebp
        unmap_page(proc_index, vaddr + i * PAGESIZE);
  1083ce:	56                   	push   %esi
    for (i = 0; i < count; i++)
  1083cf:	81 c6 00 10 00 00    	add    $0x1000,%esi
        unmap_page(proc_index, vaddr + i * PAGESIZE);
  1083d5:	ff 74 24 3c          	push   0x3c(%esp)
  1083d9:	e8 f2 f8 ff ff       	call   107cd0 <unmap_page>
    for (i = 0; i < count; i++)
  1083de:	83 c4 10             	add    $0x10,%esp
  1083e1:	39 ef                	cmp    %ebp,%edi
  1083e3:	75 e3                	jne    1083c8 <free_pages+0x48>
    container_free_n(proc_index, page_index, order);
  1083e5:	8b 44 24 0c          	mov    0xc(%esp),%eax
  1083e9:	83 ec 04             	sub    $0x4,%esp
  1083ec:	ff 74 24 3c          	push   0x3c(%esp)
  1083f0:	50                   	push   %eax
  1083f1:	ff 74 24 3c          	push   0x3c(%esp)
  1083f5:	e8 f6 e1 ff ff       	call   1065f0 <container_free_n>
  1083fa:	83 c4 10             	add    $0x10,%esp
}
  1083fd:	83 c4 1c             	add    $0x1c,%esp
  108400:	5b                   	pop    %ebx
  108401:	5e                   	pop    %esi
  108402:	5f                   	pop    %edi
  108403:	5d                   	pop    %ebp
  108404:	c3                   	ret
  108405:	8d 76 00             	lea    0x0(%esi),%esi
    unsigned int pde_index = vaddr >> 22;
  108408:	89 f5                	mov    %esi,%ebp
    if (order == MAX_ORDER && is_superpage(proc_index, pde_index)) {
  10840a:	83 ec 08             	sub    $0x8,%esp
    unsigned int pde_index = vaddr >> 22;
  10840d:	c1 ed 16             	shr    $0x16,%ebp
    if (order == MAX_ORDER && is_superpage(proc_index, pde_index)) {
  108410:	55                   	push   %ebp
  108411:	ff 74 24 3c          	push   0x3c(%esp)
  108415:	e8 46 eb ff ff       	call   106f60 <is_superpage>
  10841a:	83 c4 10             	add    $0x10,%esp
  10841d:	85 c0                	test   %eax,%eax
  10841f:	74 88                	je     1083a9 <free_pages+0x29>
        unsigned int pde = get_pdir_entry(proc_index, pde_index);
  108421:	83 ec 08             	sub    $0x8,%esp
  108424:	55                   	push   %ebp
  108425:	ff 74 24 3c          	push   0x3c(%esp)
  108429:	e8 72 e9 ff ff       	call   106da0 <get_pdir_entry>
  10842e:	89 c7                	mov    %eax,%edi
        unmap_superpage(proc_index, vaddr);
  108430:	58                   	pop    %eax
  108431:	5a                   	pop    %edx
  108432:	56                   	push   %esi
  108433:	ff 74 24 3c          	push   0x3c(%esp)
        page_index = pde >> 12;
  108437:	c1 ef 0c             	shr    $0xc,%edi
        unmap_superpage(proc_index, vaddr);
  10843a:	e8 21 f9 ff ff       	call   107d60 <unmap_superpage>
        container_free_n(proc_index, page_index, order);
  10843f:	83 c4 0c             	add    $0xc,%esp
  108442:	6a 0a                	push   $0xa
  108444:	57                   	push   %edi
  108445:	ff 74 24 3c          	push   0x3c(%esp)
  108449:	e8 a2 e1 ff ff       	call   1065f0 <container_free_n>
        return;
  10844e:	83 c4 10             	add    $0x10,%esp
  108451:	eb aa                	jmp    1083fd <free_pages+0x7d>
  108453:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10845a:	00 
  10845b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00108460 <free_range>:
 * the AT and frees the corresponding block.  Used by sys_brk for rollback
 * and shrink operations.
 */
void free_range(unsigned int proc_index, unsigned int start, unsigned int end)
{
    unsigned int addr = start;
  108460:	e8 53 7f ff ff       	call   1003b8 <__x86.get_pc_thunk.ax>
  108465:	05 8f 7b 00 00       	add    $0x7b8f,%eax
{
  10846a:	55                   	push   %ebp
  10846b:	bd 00 10 00 00       	mov    $0x1000,%ebp
  108470:	57                   	push   %edi
  108471:	56                   	push   %esi
  108472:	53                   	push   %ebx
  108473:	83 ec 1c             	sub    $0x1c,%esp
  108476:	8b 74 24 34          	mov    0x34(%esp),%esi
  10847a:	8b 7c 24 38          	mov    0x38(%esp),%edi
  10847e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    while (addr < end) {
  108482:	39 fe                	cmp    %edi,%esi
  108484:	73 62                	jae    1084e8 <free_range+0x88>
  108486:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10848d:	00 
  10848e:	66 90                	xchg   %ax,%ax
        unsigned int pi = addr / PAGESIZE;
  108490:	89 f0                	mov    %esi,%eax
        unsigned int order = at_get_order(pi);
  108492:	83 ec 0c             	sub    $0xc,%esp
        unsigned int pi = addr / PAGESIZE;
  108495:	c1 e8 0c             	shr    $0xc,%eax
        unsigned int order = at_get_order(pi);
  108498:	50                   	push   %eax
  108499:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
  10849d:	e8 0e ca ff ff       	call   104eb0 <at_get_order>
        unsigned int block_bytes = (1u << order) * PAGESIZE;

        /* Clamp: don't free beyond [end) */
        while (order > 0 && addr + block_bytes > end) {
  1084a2:	83 c4 10             	add    $0x10,%esp
        unsigned int order = at_get_order(pi);
  1084a5:	89 c1                	mov    %eax,%ecx
        unsigned int block_bytes = (1u << order) * PAGESIZE;
  1084a7:	89 e8                	mov    %ebp,%eax
  1084a9:	d3 e0                	shl    %cl,%eax
        while (order > 0 && addr + block_bytes > end) {
  1084ab:	85 c9                	test   %ecx,%ecx
  1084ad:	74 41                	je     1084f0 <free_range+0x90>
  1084af:	8d 1c 30             	lea    (%eax,%esi,1),%ebx
  1084b2:	eb 12                	jmp    1084c6 <free_range+0x66>
  1084b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            order--;
  1084b8:	83 e9 01             	sub    $0x1,%ecx
            block_bytes = (1u << order) * PAGESIZE;
  1084bb:	89 e8                	mov    %ebp,%eax
  1084bd:	d3 e0                	shl    %cl,%eax
        while (order > 0 && addr + block_bytes > end) {
  1084bf:	8d 1c 30             	lea    (%eax,%esi,1),%ebx
  1084c2:	85 c9                	test   %ecx,%ecx
  1084c4:	74 04                	je     1084ca <free_range+0x6a>
  1084c6:	39 df                	cmp    %ebx,%edi
  1084c8:	72 ee                	jb     1084b8 <free_range+0x58>
        }

        free_pages(proc_index, addr, order);
  1084ca:	83 ec 04             	sub    $0x4,%esp
  1084cd:	51                   	push   %ecx
  1084ce:	56                   	push   %esi
  1084cf:	ff 74 24 3c          	push   0x3c(%esp)
  1084d3:	e8 a8 fe ff ff       	call   108380 <free_pages>
    while (addr < end) {
  1084d8:	83 c4 10             	add    $0x10,%esp
  1084db:	39 fb                	cmp    %edi,%ebx
  1084dd:	73 09                	jae    1084e8 <free_range+0x88>
  1084df:	89 de                	mov    %ebx,%esi
  1084e1:	eb ad                	jmp    108490 <free_range+0x30>
  1084e3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        addr += block_bytes;
    }
}
  1084e8:	83 c4 1c             	add    $0x1c,%esp
  1084eb:	5b                   	pop    %ebx
  1084ec:	5e                   	pop    %esi
  1084ed:	5f                   	pop    %edi
  1084ee:	5d                   	pop    %ebp
  1084ef:	c3                   	ret
        while (order > 0 && addr + block_bytes > end) {
  1084f0:	8d 9e 00 10 00 00    	lea    0x1000(%esi),%ebx
  1084f6:	eb d2                	jmp    1084ca <free_range+0x6a>
  1084f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1084ff:	00 

00108500 <sys_brk>:
unsigned int sys_brk(unsigned int proc_index, unsigned int new_brk)
{
    unsigned int old_brk, addr, remaining, order, block_pages, block_bytes;

    /* Query */
    if (new_brk == 0)
  108500:	e8 b7 7e ff ff       	call   1003bc <__x86.get_pc_thunk.dx>
  108505:	81 c2 ef 7a 00 00    	add    $0x7aef,%edx
{
  10850b:	55                   	push   %ebp
  10850c:	57                   	push   %edi
  10850d:	56                   	push   %esi
  10850e:	53                   	push   %ebx
  10850f:	83 ec 1c             	sub    $0x1c,%esp
  108512:	8b 44 24 34          	mov    0x34(%esp),%eax
    if (new_brk == 0)
  108516:	85 c0                	test   %eax,%eax
  108518:	0f 84 d2 00 00 00    	je     1085f0 <sys_brk+0xf0>
        return proc_brk[proc_index];

    /* Range check */
    if (new_brk < VM_USERLO || new_brk > VM_USERHI)
  10851e:	8d 88 00 00 00 c0    	lea    -0x40000000(%eax),%ecx
  108524:	81 f9 00 00 00 b0    	cmp    $0xb0000000,%ecx
  10852a:	0f 87 0c 01 00 00    	ja     10863c <sys_brk+0x13c>
        return 0;

    /* Page-align upward */
    new_brk = (new_brk + PAGESIZE - 1) & ~(PAGESIZE - 1);
  108530:	05 ff 0f 00 00       	add    $0xfff,%eax

    old_brk = proc_brk[proc_index];
  108535:	8d 92 0c e0 c8 01    	lea    0x1c8e00c(%edx),%edx
    new_brk = (new_brk + PAGESIZE - 1) & ~(PAGESIZE - 1);
  10853b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  108540:	89 c5                	mov    %eax,%ebp
    old_brk = proc_brk[proc_index];
  108542:	8b 44 24 30          	mov    0x30(%esp),%eax
  108546:	8b 3c 82             	mov    (%edx,%eax,4),%edi

    if (new_brk > old_brk) {
  108549:	39 ef                	cmp    %ebp,%edi
  10854b:	0f 83 b7 00 00 00    	jae    108608 <sys_brk+0x108>
            remaining = (new_brk - addr) / PAGESIZE;
            order = 0;
            /* Pick the largest order that fits alignment and remaining count */
            while (order < MAX_ORDER) {
                unsigned int next_order = order + 1;
                unsigned int next_count = 1u << next_order;
  108551:	89 7c 24 08          	mov    %edi,0x8(%esp)
        addr = old_brk;
  108555:	89 fb                	mov    %edi,%ebx
                unsigned int next_count = 1u << next_order;
  108557:	be 01 00 00 00       	mov    $0x1,%esi
  10855c:	89 6c 24 04          	mov    %ebp,0x4(%esp)
  108560:	89 54 24 0c          	mov    %edx,0xc(%esp)
  108564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            remaining = (new_brk - addr) / PAGESIZE;
  108568:	8b 44 24 04          	mov    0x4(%esp),%eax
                if (next_count > remaining)
                    break;
                if ((addr / PAGESIZE) & (next_count - 1))
  10856c:	89 df                	mov    %ebx,%edi
            order = 0;
  10856e:	31 c9                	xor    %ecx,%ecx
                if ((addr / PAGESIZE) & (next_count - 1))
  108570:	c1 ef 0c             	shr    $0xc,%edi
            remaining = (new_brk - addr) / PAGESIZE;
  108573:	29 d8                	sub    %ebx,%eax
  108575:	c1 e8 0c             	shr    $0xc,%eax
            while (order < MAX_ORDER) {
  108578:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10857f:	00 
                unsigned int next_order = order + 1;
  108580:	89 ca                	mov    %ecx,%edx
                unsigned int next_count = 1u << next_order;
  108582:	89 f5                	mov    %esi,%ebp
                unsigned int next_order = order + 1;
  108584:	83 c1 01             	add    $0x1,%ecx
                unsigned int next_count = 1u << next_order;
  108587:	d3 e5                	shl    %cl,%ebp
                if (next_count > remaining)
  108589:	39 e8                	cmp    %ebp,%eax
  10858b:	72 53                	jb     1085e0 <sys_brk+0xe0>
                if ((addr / PAGESIZE) & (next_count - 1))
  10858d:	83 ed 01             	sub    $0x1,%ebp
  108590:	85 fd                	test   %edi,%ebp
  108592:	75 4c                	jne    1085e0 <sys_brk+0xe0>
            while (order < MAX_ORDER) {
  108594:	83 f9 0a             	cmp    $0xa,%ecx
  108597:	75 e7                	jne    108580 <sys_brk+0x80>
  108599:	bf 00 00 40 00       	mov    $0x400000,%edi
                    break;
                order = next_order;
            }
            block_bytes = (1u << order) * PAGESIZE;

            if (alloc_pages(proc_index, addr,
  10859e:	51                   	push   %ecx
  10859f:	6a 07                	push   $0x7
  1085a1:	53                   	push   %ebx
  1085a2:	ff 74 24 3c          	push   0x3c(%esp)
  1085a6:	e8 d5 fc ff ff       	call   108280 <alloc_pages>
  1085ab:	83 c4 10             	add    $0x10,%esp
  1085ae:	3d 01 00 10 00       	cmp    $0x100001,%eax
  1085b3:	74 72                	je     108627 <sys_brk+0x127>
        while (addr < new_brk) {
  1085b5:	8b 44 24 04          	mov    0x4(%esp),%eax
                            PTE_P | PTE_W | PTE_U, order) == MagicNumber) {
                /* OOM: roll back everything allocated this call */
                free_range(proc_index, old_brk, addr);
                return 0;
            }
            addr += block_bytes;
  1085b9:	01 fb                	add    %edi,%ebx
        while (addr < new_brk) {
  1085bb:	39 c3                	cmp    %eax,%ebx
  1085bd:	72 a9                	jb     108568 <sys_brk+0x68>
  1085bf:	8b 54 24 0c          	mov    0xc(%esp),%edx
  1085c3:	89 c5                	mov    %eax,%ebp
    } else if (new_brk < old_brk) {
        /* SHRINK: free pages from new_brk up to old_brk */
        free_range(proc_index, new_brk, old_brk);
    }

    proc_brk[proc_index] = new_brk;
  1085c5:	8b 44 24 30          	mov    0x30(%esp),%eax
  1085c9:	89 2c 82             	mov    %ebp,(%edx,%eax,4)
    return new_brk;
}
  1085cc:	83 c4 1c             	add    $0x1c,%esp
  1085cf:	89 e8                	mov    %ebp,%eax
  1085d1:	5b                   	pop    %ebx
  1085d2:	5e                   	pop    %esi
  1085d3:	5f                   	pop    %edi
  1085d4:	5d                   	pop    %ebp
  1085d5:	c3                   	ret
  1085d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1085dd:	00 
  1085de:	66 90                	xchg   %ax,%ax
            block_bytes = (1u << order) * PAGESIZE;
  1085e0:	89 d1                	mov    %edx,%ecx
  1085e2:	bf 00 10 00 00       	mov    $0x1000,%edi
  1085e7:	d3 e7                	shl    %cl,%edi
  1085e9:	89 d1                	mov    %edx,%ecx
  1085eb:	eb b1                	jmp    10859e <sys_brk+0x9e>
  1085ed:	8d 76 00             	lea    0x0(%esi),%esi
        return proc_brk[proc_index];
  1085f0:	8b 44 24 30          	mov    0x30(%esp),%eax
  1085f4:	8b ac 82 0c e0 c8 01 	mov    0x1c8e00c(%edx,%eax,4),%ebp
}
  1085fb:	83 c4 1c             	add    $0x1c,%esp
  1085fe:	5b                   	pop    %ebx
  1085ff:	5e                   	pop    %esi
  108600:	89 e8                	mov    %ebp,%eax
  108602:	5f                   	pop    %edi
  108603:	5d                   	pop    %ebp
  108604:	c3                   	ret
  108605:	8d 76 00             	lea    0x0(%esi),%esi
    } else if (new_brk < old_brk) {
  108608:	39 fd                	cmp    %edi,%ebp
  10860a:	73 b9                	jae    1085c5 <sys_brk+0xc5>
  10860c:	89 54 24 04          	mov    %edx,0x4(%esp)
        free_range(proc_index, new_brk, old_brk);
  108610:	83 ec 04             	sub    $0x4,%esp
  108613:	57                   	push   %edi
  108614:	55                   	push   %ebp
  108615:	ff 74 24 3c          	push   0x3c(%esp)
  108619:	e8 42 fe ff ff       	call   108460 <free_range>
  10861e:	83 c4 10             	add    $0x10,%esp
  108621:	8b 54 24 04          	mov    0x4(%esp),%edx
  108625:	eb 9e                	jmp    1085c5 <sys_brk+0xc5>
                free_range(proc_index, old_brk, addr);
  108627:	8b 7c 24 08          	mov    0x8(%esp),%edi
  10862b:	83 ec 04             	sub    $0x4,%esp
  10862e:	53                   	push   %ebx
  10862f:	57                   	push   %edi
  108630:	ff 74 24 3c          	push   0x3c(%esp)
  108634:	e8 27 fe ff ff       	call   108460 <free_range>
                return 0;
  108639:	83 c4 10             	add    $0x10,%esp
}
  10863c:	83 c4 1c             	add    $0x1c,%esp
        return 0;
  10863f:	31 ed                	xor    %ebp,%ebp
}
  108641:	5b                   	pop    %ebx
  108642:	89 e8                	mov    %ebp,%eax
  108644:	5e                   	pop    %esi
  108645:	5f                   	pop    %edi
  108646:	5d                   	pop    %ebp
  108647:	c3                   	ret
  108648:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10864f:	00 

00108650 <alloc_mem_quota>:

/**
 * alloc_mem_quota — designate memory quota for a new child process.
 */
unsigned int alloc_mem_quota(unsigned int id, unsigned int quota)
{
  108650:	53                   	push   %ebx
  108651:	e8 6a 7d ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  108656:	81 c3 9e 79 00 00    	add    $0x799e,%ebx
  10865c:	83 ec 10             	sub    $0x10,%esp
    return container_split(id, quota);
  10865f:	ff 74 24 1c          	push   0x1c(%esp)
  108663:	ff 74 24 1c          	push   0x1c(%esp)
  108667:	e8 44 de ff ff       	call   1064b0 <container_split>
}
  10866c:	83 c4 18             	add    $0x18,%esp
  10866f:	5b                   	pop    %ebx
  108670:	c3                   	ret
  108671:	66 90                	xchg   %ax,%ax
  108673:	66 90                	xchg   %ax,%ax
  108675:	66 90                	xchg   %ax,%ax
  108677:	66 90                	xchg   %ax,%ax
  108679:	66 90                	xchg   %ax,%ax
  10867b:	66 90                	xchg   %ax,%ax
  10867d:	66 90                	xchg   %ax,%ax
  10867f:	90                   	nop

00108680 <MPTNew_test1>:
#include <vmm/MPTIntro/export.h>
#include <vmm/MPTNew/export.h>
#include "export.h"

int MPTNew_test1()
{
  108680:	53                   	push   %ebx
  108681:	e8 3a 7d ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  108686:	81 c3 6e 79 00 00    	add    $0x796e,%ebx
  10868c:	83 ec 10             	sub    $0x10,%esp
    unsigned int vaddr = 4096 * 1024 * 400;
    container_split(0, 100);
  10868f:	6a 64                	push   $0x64
  108691:	6a 00                	push   $0x0
  108693:	e8 18 de ff ff       	call   1064b0 <container_split>
    if (get_ptbl_entry_by_va(1, vaddr) != 0) {
  108698:	59                   	pop    %ecx
  108699:	58                   	pop    %eax
  10869a:	68 00 00 00 64       	push   $0x64000000
  10869f:	6a 01                	push   $0x1
  1086a1:	e8 ea ed ff ff       	call   107490 <get_ptbl_entry_by_va>
  1086a6:	83 c4 10             	add    $0x10,%esp
  1086a9:	85 c0                	test   %eax,%eax
  1086ab:	0f 85 9f 00 00 00    	jne    108750 <MPTNew_test1+0xd0>
        dprintf("test 1.1 failed: (%d != 0)\n", get_ptbl_entry_by_va(1, vaddr));
        return 1;
    }
    if (get_pdir_entry_by_va(1, vaddr) != 0) {
  1086b1:	83 ec 08             	sub    $0x8,%esp
  1086b4:	68 00 00 00 64       	push   $0x64000000
  1086b9:	6a 01                	push   $0x1
  1086bb:	e8 40 ee ff ff       	call   107500 <get_pdir_entry_by_va>
  1086c0:	83 c4 10             	add    $0x10,%esp
  1086c3:	85 c0                	test   %eax,%eax
  1086c5:	75 59                	jne    108720 <MPTNew_test1+0xa0>
        dprintf("test 1.2 failed: (%d != 0)\n", get_pdir_entry_by_va(1, vaddr));
        return 1;
    }
    alloc_page(1, vaddr, 7);
  1086c7:	83 ec 04             	sub    $0x4,%esp
  1086ca:	6a 07                	push   $0x7
  1086cc:	68 00 00 00 64       	push   $0x64000000
  1086d1:	6a 01                	push   $0x1
  1086d3:	e8 58 fb ff ff       	call   108230 <alloc_page>
    if (get_ptbl_entry_by_va(1, vaddr) == 0) {
  1086d8:	58                   	pop    %eax
  1086d9:	5a                   	pop    %edx
  1086da:	68 00 00 00 64       	push   $0x64000000
  1086df:	6a 01                	push   $0x1
  1086e1:	e8 aa ed ff ff       	call   107490 <get_ptbl_entry_by_va>
  1086e6:	83 c4 10             	add    $0x10,%esp
  1086e9:	85 c0                	test   %eax,%eax
  1086eb:	0f 84 af 00 00 00    	je     1087a0 <MPTNew_test1+0x120>
        dprintf("test 1.3 failed: (%d == 0)\n", get_ptbl_entry_by_va(1, vaddr));
        return 1;
    }
    if (get_pdir_entry_by_va(1, vaddr) == 0) {
  1086f1:	83 ec 08             	sub    $0x8,%esp
  1086f4:	68 00 00 00 64       	push   $0x64000000
  1086f9:	6a 01                	push   $0x1
  1086fb:	e8 00 ee ff ff       	call   107500 <get_pdir_entry_by_va>
  108700:	83 c4 10             	add    $0x10,%esp
  108703:	85 c0                	test   %eax,%eax
  108705:	74 71                	je     108778 <MPTNew_test1+0xf8>
        dprintf("test 1.4 failed: (%d == 0)\n", get_pdir_entry_by_va(1, vaddr));
        return 1;
    }
    dprintf("test 1 passed.\n");
  108707:	83 ec 0c             	sub    $0xc,%esp
  10870a:	8d 83 c4 98 ff ff    	lea    -0x673c(%ebx),%eax
  108710:	50                   	push   %eax
  108711:	e8 86 a6 ff ff       	call   102d9c <dprintf>
    return 0;
  108716:	83 c4 10             	add    $0x10,%esp
  108719:	31 c0                	xor    %eax,%eax
}
  10871b:	83 c4 08             	add    $0x8,%esp
  10871e:	5b                   	pop    %ebx
  10871f:	c3                   	ret
        dprintf("test 1.2 failed: (%d != 0)\n", get_pdir_entry_by_va(1, vaddr));
  108720:	83 ec 08             	sub    $0x8,%esp
  108723:	68 00 00 00 64       	push   $0x64000000
  108728:	6a 01                	push   $0x1
  10872a:	e8 d1 ed ff ff       	call   107500 <get_pdir_entry_by_va>
  10872f:	59                   	pop    %ecx
  108730:	5a                   	pop    %edx
  108731:	50                   	push   %eax
  108732:	8d 83 5d 9b ff ff    	lea    -0x64a3(%ebx),%eax
  108738:	50                   	push   %eax
  108739:	e8 5e a6 ff ff       	call   102d9c <dprintf>
        return 1;
  10873e:	83 c4 10             	add    $0x10,%esp
}
  108741:	83 c4 08             	add    $0x8,%esp
        return 1;
  108744:	b8 01 00 00 00       	mov    $0x1,%eax
}
  108749:	5b                   	pop    %ebx
  10874a:	c3                   	ret
  10874b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        dprintf("test 1.1 failed: (%d != 0)\n", get_ptbl_entry_by_va(1, vaddr));
  108750:	83 ec 08             	sub    $0x8,%esp
  108753:	68 00 00 00 64       	push   $0x64000000
  108758:	6a 01                	push   $0x1
  10875a:	e8 31 ed ff ff       	call   107490 <get_ptbl_entry_by_va>
  10875f:	59                   	pop    %ecx
  108760:	5a                   	pop    %edx
  108761:	50                   	push   %eax
  108762:	8d 83 41 9b ff ff    	lea    -0x64bf(%ebx),%eax
  108768:	50                   	push   %eax
  108769:	e8 2e a6 ff ff       	call   102d9c <dprintf>
        return 1;
  10876e:	83 c4 10             	add    $0x10,%esp
  108771:	eb ce                	jmp    108741 <MPTNew_test1+0xc1>
  108773:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        dprintf("test 1.4 failed: (%d == 0)\n", get_pdir_entry_by_va(1, vaddr));
  108778:	83 ec 08             	sub    $0x8,%esp
  10877b:	68 00 00 00 64       	push   $0x64000000
  108780:	6a 01                	push   $0x1
  108782:	e8 79 ed ff ff       	call   107500 <get_pdir_entry_by_va>
  108787:	5a                   	pop    %edx
  108788:	59                   	pop    %ecx
  108789:	50                   	push   %eax
  10878a:	8d 83 95 9b ff ff    	lea    -0x646b(%ebx),%eax
  108790:	50                   	push   %eax
  108791:	e8 06 a6 ff ff       	call   102d9c <dprintf>
        return 1;
  108796:	83 c4 10             	add    $0x10,%esp
  108799:	eb a6                	jmp    108741 <MPTNew_test1+0xc1>
  10879b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        dprintf("test 1.3 failed: (%d == 0)\n", get_ptbl_entry_by_va(1, vaddr));
  1087a0:	83 ec 08             	sub    $0x8,%esp
  1087a3:	68 00 00 00 64       	push   $0x64000000
  1087a8:	6a 01                	push   $0x1
  1087aa:	e8 e1 ec ff ff       	call   107490 <get_ptbl_entry_by_va>
  1087af:	5a                   	pop    %edx
  1087b0:	59                   	pop    %ecx
  1087b1:	50                   	push   %eax
  1087b2:	8d 83 79 9b ff ff    	lea    -0x6487(%ebx),%eax
  1087b8:	50                   	push   %eax
  1087b9:	e8 de a5 ff ff       	call   102d9c <dprintf>
        return 1;
  1087be:	83 c4 10             	add    $0x10,%esp
  1087c1:	e9 7b ff ff ff       	jmp    108741 <MPTNew_test1+0xc1>
  1087c6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1087cd:	00 
  1087ce:	66 90                	xchg   %ax,%ax

001087d0 <MPTNew_test_alloc_free_pages>:
 * By the time this runs, MPTNew_test1 has already done container_split(0, 100)
 * creating child 7 (proc 0 has nchildren == 7 after earlier test suites).
 * We create our own child with container_split(0, 200).
 */
int MPTNew_test_alloc_free_pages()
{
  1087d0:	57                   	push   %edi
  1087d1:	56                   	push   %esi
  1087d2:	53                   	push   %ebx
  1087d3:	e8 e8 7b ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  1087d8:	81 c3 1c 78 00 00    	add    $0x781c,%ebx
    unsigned int vaddr = 0x50000000;  /* PDE 320 — well inside user range */
    unsigned int i, pte, result;
    unsigned int chid;

    /* Create a fresh child container with enough quota */
    chid = container_split(0, 200);
  1087de:	83 ec 08             	sub    $0x8,%esp
  1087e1:	68 c8 00 00 00       	push   $0xc8
  1087e6:	6a 00                	push   $0x0
  1087e8:	e8 c3 dc ff ff       	call   1064b0 <container_split>
    if (chid >= NUM_IDS) {
  1087ed:	83 c4 10             	add    $0x10,%esp
    chid = container_split(0, 200);
  1087f0:	89 c6                	mov    %eax,%esi
    if (chid >= NUM_IDS) {
  1087f2:	83 f8 3f             	cmp    $0x3f,%eax
  1087f5:	0f 87 95 00 00 00    	ja     108890 <MPTNew_test_alloc_free_pages+0xc0>
        dprintf("test alloc_free_pages failed: container_split returned %u\n", chid);
        return 1;
    }

    result = alloc_pages(chid, vaddr, PTE_P | PTE_W | PTE_U, 2);
  1087fb:	6a 02                	push   $0x2
        dprintf("test alloc_free_pages failed: alloc_pages order-2 returned MagicNumber\n");
        return 1;
    }

    /* All 4 PTEs must be present */
    for (i = 0; i < 4; i++) {
  1087fd:	31 ff                	xor    %edi,%edi
    result = alloc_pages(chid, vaddr, PTE_P | PTE_W | PTE_U, 2);
  1087ff:	6a 07                	push   $0x7
  108801:	68 00 00 00 50       	push   $0x50000000
  108806:	50                   	push   %eax
  108807:	e8 74 fa ff ff       	call   108280 <alloc_pages>
    if (result == MagicNumber) {
  10880c:	83 c4 10             	add    $0x10,%esp
  10880f:	3d 01 00 10 00       	cmp    $0x100001,%eax
  108814:	0f 84 de 00 00 00    	je     1088f8 <MPTNew_test_alloc_free_pages+0x128>
        pte = get_ptbl_entry_by_va(chid, vaddr + i * 4096);
  10881a:	89 f8                	mov    %edi,%eax
  10881c:	83 ec 08             	sub    $0x8,%esp
  10881f:	c1 e0 0c             	shl    $0xc,%eax
  108822:	05 00 00 00 50       	add    $0x50000000,%eax
  108827:	50                   	push   %eax
  108828:	56                   	push   %esi
  108829:	e8 62 ec ff ff       	call   107490 <get_ptbl_entry_by_va>
        if (!(pte & PTE_P)) {
  10882e:	83 c4 10             	add    $0x10,%esp
  108831:	a8 01                	test   $0x1,%al
  108833:	74 7b                	je     1088b0 <MPTNew_test_alloc_free_pages+0xe0>
    for (i = 0; i < 4; i++) {
  108835:	83 c7 01             	add    $0x1,%edi
  108838:	83 ff 04             	cmp    $0x4,%edi
  10883b:	75 dd                	jne    10881a <MPTNew_test_alloc_free_pages+0x4a>
            free_pages(chid, vaddr, 2);
            return 1;
        }
    }

    free_pages(chid, vaddr, 2);
  10883d:	83 ec 04             	sub    $0x4,%esp

    /* After freeing, PTEs must be cleared */
    for (i = 0; i < 4; i++) {
  108840:	31 ff                	xor    %edi,%edi
    free_pages(chid, vaddr, 2);
  108842:	6a 02                	push   $0x2
  108844:	68 00 00 00 50       	push   $0x50000000
  108849:	56                   	push   %esi
  10884a:	e8 31 fb ff ff       	call   108380 <free_pages>
  10884f:	83 c4 10             	add    $0x10,%esp
        pte = get_ptbl_entry_by_va(chid, vaddr + i * 4096);
  108852:	89 f8                	mov    %edi,%eax
  108854:	83 ec 08             	sub    $0x8,%esp
  108857:	c1 e0 0c             	shl    $0xc,%eax
  10885a:	05 00 00 00 50       	add    $0x50000000,%eax
  10885f:	50                   	push   %eax
  108860:	56                   	push   %esi
  108861:	e8 2a ec ff ff       	call   107490 <get_ptbl_entry_by_va>
        if (pte & PTE_P) {
  108866:	83 c4 10             	add    $0x10,%esp
  108869:	a8 01                	test   $0x1,%al
  10886b:	75 73                	jne    1088e0 <MPTNew_test_alloc_free_pages+0x110>
    for (i = 0; i < 4; i++) {
  10886d:	83 c7 01             	add    $0x1,%edi
  108870:	83 ff 04             	cmp    $0x4,%edi
  108873:	75 dd                	jne    108852 <MPTNew_test_alloc_free_pages+0x82>
            dprintf("test alloc_free_pages failed: page %u still mapped after free\n", i);
            return 1;
        }
    }

    dprintf("test alloc_free_pages passed.\n");
  108875:	83 ec 0c             	sub    $0xc,%esp
  108878:	8d 83 a8 ab ff ff    	lea    -0x5458(%ebx),%eax
  10887e:	50                   	push   %eax
  10887f:	e8 18 a5 ff ff       	call   102d9c <dprintf>
    return 0;
  108884:	83 c4 10             	add    $0x10,%esp
  108887:	31 c0                	xor    %eax,%eax
}
  108889:	5b                   	pop    %ebx
  10888a:	5e                   	pop    %esi
  10888b:	5f                   	pop    %edi
  10888c:	c3                   	ret
  10888d:	8d 76 00             	lea    0x0(%esi),%esi
        dprintf("test alloc_free_pages failed: container_split returned %u\n", chid);
  108890:	83 ec 08             	sub    $0x8,%esp
  108893:	50                   	push   %eax
  108894:	8d 83 a4 aa ff ff    	lea    -0x555c(%ebx),%eax
  10889a:	50                   	push   %eax
  10889b:	e8 fc a4 ff ff       	call   102d9c <dprintf>
        return 1;
  1088a0:	83 c4 10             	add    $0x10,%esp
  1088a3:	b8 01 00 00 00       	mov    $0x1,%eax
  1088a8:	eb df                	jmp    108889 <MPTNew_test_alloc_free_pages+0xb9>
  1088aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            dprintf("test alloc_free_pages failed: page %u not mapped (pte=0x%x)\n", i, pte);
  1088b0:	83 ec 04             	sub    $0x4,%esp
  1088b3:	50                   	push   %eax
  1088b4:	8d 83 28 ab ff ff    	lea    -0x54d8(%ebx),%eax
  1088ba:	57                   	push   %edi
  1088bb:	50                   	push   %eax
  1088bc:	e8 db a4 ff ff       	call   102d9c <dprintf>
            free_pages(chid, vaddr, 2);
  1088c1:	83 c4 0c             	add    $0xc,%esp
  1088c4:	6a 02                	push   $0x2
  1088c6:	68 00 00 00 50       	push   $0x50000000
  1088cb:	56                   	push   %esi
  1088cc:	e8 af fa ff ff       	call   108380 <free_pages>
            return 1;
  1088d1:	83 c4 10             	add    $0x10,%esp
  1088d4:	eb cd                	jmp    1088a3 <MPTNew_test_alloc_free_pages+0xd3>
  1088d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1088dd:	00 
  1088de:	66 90                	xchg   %ax,%ax
            dprintf("test alloc_free_pages failed: page %u still mapped after free\n", i);
  1088e0:	83 ec 08             	sub    $0x8,%esp
  1088e3:	8d 83 68 ab ff ff    	lea    -0x5498(%ebx),%eax
  1088e9:	57                   	push   %edi
  1088ea:	50                   	push   %eax
  1088eb:	e8 ac a4 ff ff       	call   102d9c <dprintf>
            return 1;
  1088f0:	83 c4 10             	add    $0x10,%esp
  1088f3:	eb ae                	jmp    1088a3 <MPTNew_test_alloc_free_pages+0xd3>
  1088f5:	8d 76 00             	lea    0x0(%esi),%esi
        dprintf("test alloc_free_pages failed: alloc_pages order-2 returned MagicNumber\n");
  1088f8:	83 ec 0c             	sub    $0xc,%esp
  1088fb:	8d 83 e0 aa ff ff    	lea    -0x5520(%ebx),%eax
  108901:	50                   	push   %eax
  108902:	e8 95 a4 ff ff       	call   102d9c <dprintf>
        return 1;
  108907:	83 c4 10             	add    $0x10,%esp
  10890a:	eb 97                	jmp    1088a3 <MPTNew_test_alloc_free_pages+0xd3>
  10890c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00108910 <MPTNew_test_brk_grow_shrink>:
 *
 * We call brk_init() first so proc_brk[] is initialised to VM_USERLO,
 * since the TEST build path does not call paging_init().
 */
int MPTNew_test_brk_grow_shrink()
{
  108910:	57                   	push   %edi
  108911:	56                   	push   %esi
  108912:	53                   	push   %ebx
  108913:	e8 a8 7a ff ff       	call   1003c0 <__x86.get_pc_thunk.bx>
  108918:	81 c3 dc 76 00 00    	add    $0x76dc,%ebx
    unsigned int brk0, brk1, brk2, i, pte;
    unsigned int chid;

    /* Initialise proc_brk[] — needed because TEST mode skips paging_init */
    brk_init();
  10891e:	e8 cd f8 ff ff       	call   1081f0 <brk_init>

    /* Create a fresh child container */
    chid = container_split(0, 300);
  108923:	83 ec 08             	sub    $0x8,%esp
  108926:	68 2c 01 00 00       	push   $0x12c
  10892b:	6a 00                	push   $0x0
  10892d:	e8 7e db ff ff       	call   1064b0 <container_split>
    if (chid >= NUM_IDS) {
  108932:	83 c4 10             	add    $0x10,%esp
    chid = container_split(0, 300);
  108935:	89 c6                	mov    %eax,%esi
    if (chid >= NUM_IDS) {
  108937:	83 f8 3f             	cmp    $0x3f,%eax
  10893a:	0f 87 e0 00 00 00    	ja     108a20 <MPTNew_test_brk_grow_shrink+0x110>
        dprintf("test brk_grow_shrink failed: container_split returned %u\n", chid);
        return 1;
    }

    /* Query current break — should be VM_USERLO after brk_init */
    brk0 = sys_brk(chid, 0);
  108940:	83 ec 08             	sub    $0x8,%esp
  108943:	6a 00                	push   $0x0
  108945:	50                   	push   %eax
  108946:	e8 b5 fb ff ff       	call   108500 <sys_brk>
    if (brk0 != 0x40000000) {
  10894b:	83 c4 10             	add    $0x10,%esp
  10894e:	3d 00 00 00 40       	cmp    $0x40000000,%eax
  108953:	74 23                	je     108978 <MPTNew_test_brk_grow_shrink+0x68>
        dprintf("test brk_grow_shrink failed: initial query returned 0x%x, expected 0x40000000\n", brk0);
  108955:	83 ec 08             	sub    $0x8,%esp
  108958:	50                   	push   %eax
  108959:	8d 83 04 ac ff ff    	lea    -0x53fc(%ebx),%eax
  10895f:	50                   	push   %eax
  108960:	e8 37 a4 ff ff       	call   102d9c <dprintf>
        return 1;
  108965:	83 c4 10             	add    $0x10,%esp
        return 1;
  108968:	b8 01 00 00 00       	mov    $0x1,%eax
        }
    }

    dprintf("test brk_grow_shrink passed.\n");
    return 0;
}
  10896d:	5b                   	pop    %ebx
  10896e:	5e                   	pop    %esi
  10896f:	5f                   	pop    %edi
  108970:	c3                   	ret
  108971:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    brk1 = sys_brk(chid, brk0 + 4 * 4096);
  108978:	83 ec 08             	sub    $0x8,%esp
    for (i = 0; i < 4; i++) {
  10897b:	31 ff                	xor    %edi,%edi
    brk1 = sys_brk(chid, brk0 + 4 * 4096);
  10897d:	68 00 40 00 40       	push   $0x40004000
  108982:	56                   	push   %esi
  108983:	e8 78 fb ff ff       	call   108500 <sys_brk>
    if (brk1 != brk0 + 4 * 4096) {
  108988:	83 c4 10             	add    $0x10,%esp
  10898b:	3d 00 40 00 40       	cmp    $0x40004000,%eax
  108990:	0f 85 aa 00 00 00    	jne    108a40 <MPTNew_test_brk_grow_shrink+0x130>
        pte = get_ptbl_entry_by_va(chid, brk0 + i * 4096);
  108996:	89 f8                	mov    %edi,%eax
  108998:	83 ec 08             	sub    $0x8,%esp
  10899b:	c1 e0 0c             	shl    $0xc,%eax
  10899e:	05 00 00 00 40       	add    $0x40000000,%eax
  1089a3:	50                   	push   %eax
  1089a4:	56                   	push   %esi
  1089a5:	e8 e6 ea ff ff       	call   107490 <get_ptbl_entry_by_va>
        if (!(pte & PTE_P)) {
  1089aa:	83 c4 10             	add    $0x10,%esp
  1089ad:	a8 01                	test   $0x1,%al
  1089af:	0f 84 cb 00 00 00    	je     108a80 <MPTNew_test_brk_grow_shrink+0x170>
    for (i = 0; i < 4; i++) {
  1089b5:	83 c7 01             	add    $0x1,%edi
  1089b8:	83 ff 04             	cmp    $0x4,%edi
  1089bb:	75 d9                	jne    108996 <MPTNew_test_brk_grow_shrink+0x86>
    brk2 = sys_brk(chid, brk0);
  1089bd:	83 ec 08             	sub    $0x8,%esp
    for (i = 0; i < 4; i++) {
  1089c0:	31 ff                	xor    %edi,%edi
    brk2 = sys_brk(chid, brk0);
  1089c2:	68 00 00 00 40       	push   $0x40000000
  1089c7:	56                   	push   %esi
  1089c8:	e8 33 fb ff ff       	call   108500 <sys_brk>
    if (brk2 != brk0) {
  1089cd:	83 c4 10             	add    $0x10,%esp
  1089d0:	3d 00 00 00 40       	cmp    $0x40000000,%eax
  1089d5:	0f 85 85 00 00 00    	jne    108a60 <MPTNew_test_brk_grow_shrink+0x150>
        pte = get_ptbl_entry_by_va(chid, brk0 + i * 4096);
  1089db:	89 f8                	mov    %edi,%eax
  1089dd:	83 ec 08             	sub    $0x8,%esp
  1089e0:	c1 e0 0c             	shl    $0xc,%eax
  1089e3:	05 00 00 00 40       	add    $0x40000000,%eax
  1089e8:	50                   	push   %eax
  1089e9:	56                   	push   %esi
  1089ea:	e8 a1 ea ff ff       	call   107490 <get_ptbl_entry_by_va>
        if (pte & PTE_P) {
  1089ef:	83 c4 10             	add    $0x10,%esp
  1089f2:	a8 01                	test   $0x1,%al
  1089f4:	0f 85 ae 00 00 00    	jne    108aa8 <MPTNew_test_brk_grow_shrink+0x198>
    for (i = 0; i < 4; i++) {
  1089fa:	83 c7 01             	add    $0x1,%edi
  1089fd:	83 ff 04             	cmp    $0x4,%edi
  108a00:	75 d9                	jne    1089db <MPTNew_test_brk_grow_shrink+0xcb>
    dprintf("test brk_grow_shrink passed.\n");
  108a02:	83 ec 0c             	sub    $0xc,%esp
  108a05:	8d 83 5b 9c ff ff    	lea    -0x63a5(%ebx),%eax
  108a0b:	50                   	push   %eax
  108a0c:	e8 8b a3 ff ff       	call   102d9c <dprintf>
    return 0;
  108a11:	83 c4 10             	add    $0x10,%esp
  108a14:	31 c0                	xor    %eax,%eax
  108a16:	e9 52 ff ff ff       	jmp    10896d <MPTNew_test_brk_grow_shrink+0x5d>
  108a1b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        dprintf("test brk_grow_shrink failed: container_split returned %u\n", chid);
  108a20:	83 ec 08             	sub    $0x8,%esp
  108a23:	50                   	push   %eax
  108a24:	8d 83 c8 ab ff ff    	lea    -0x5438(%ebx),%eax
  108a2a:	50                   	push   %eax
  108a2b:	e8 6c a3 ff ff       	call   102d9c <dprintf>
        return 1;
  108a30:	83 c4 10             	add    $0x10,%esp
  108a33:	e9 30 ff ff ff       	jmp    108968 <MPTNew_test_brk_grow_shrink+0x58>
  108a38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  108a3f:	00 
        dprintf("test brk_grow_shrink failed: grow returned 0x%x, expected 0x%x\n",
  108a40:	83 ec 04             	sub    $0x4,%esp
  108a43:	68 00 40 00 40       	push   $0x40004000
  108a48:	50                   	push   %eax
  108a49:	8d 83 54 ac ff ff    	lea    -0x53ac(%ebx),%eax
  108a4f:	50                   	push   %eax
  108a50:	e8 47 a3 ff ff       	call   102d9c <dprintf>
        return 1;
  108a55:	83 c4 10             	add    $0x10,%esp
  108a58:	e9 0b ff ff ff       	jmp    108968 <MPTNew_test_brk_grow_shrink+0x58>
  108a5d:	8d 76 00             	lea    0x0(%esi),%esi
        dprintf("test brk_grow_shrink failed: shrink returned 0x%x, expected 0x%x\n",
  108a60:	83 ec 04             	sub    $0x4,%esp
  108a63:	68 00 00 00 40       	push   $0x40000000
  108a68:	50                   	push   %eax
  108a69:	8d 83 d0 ac ff ff    	lea    -0x5330(%ebx),%eax
  108a6f:	50                   	push   %eax
  108a70:	e8 27 a3 ff ff       	call   102d9c <dprintf>
        return 1;
  108a75:	83 c4 10             	add    $0x10,%esp
  108a78:	e9 eb fe ff ff       	jmp    108968 <MPTNew_test_brk_grow_shrink+0x58>
  108a7d:	8d 76 00             	lea    0x0(%esi),%esi
            dprintf("test brk_grow_shrink failed: page %u not mapped after grow\n", i);
  108a80:	83 ec 08             	sub    $0x8,%esp
  108a83:	8d 83 94 ac ff ff    	lea    -0x536c(%ebx),%eax
  108a89:	57                   	push   %edi
  108a8a:	50                   	push   %eax
  108a8b:	e8 0c a3 ff ff       	call   102d9c <dprintf>
            sys_brk(chid, brk0);
  108a90:	58                   	pop    %eax
  108a91:	5a                   	pop    %edx
  108a92:	68 00 00 00 40       	push   $0x40000000
  108a97:	56                   	push   %esi
  108a98:	e8 63 fa ff ff       	call   108500 <sys_brk>
            return 1;
  108a9d:	83 c4 10             	add    $0x10,%esp
  108aa0:	e9 c3 fe ff ff       	jmp    108968 <MPTNew_test_brk_grow_shrink+0x58>
  108aa5:	8d 76 00             	lea    0x0(%esi),%esi
            dprintf("test brk_grow_shrink failed: page %u still mapped after shrink\n", i);
  108aa8:	83 ec 08             	sub    $0x8,%esp
  108aab:	8d 83 14 ad ff ff    	lea    -0x52ec(%ebx),%eax
  108ab1:	57                   	push   %edi
  108ab2:	50                   	push   %eax
  108ab3:	e8 e4 a2 ff ff       	call   102d9c <dprintf>
            return 1;
  108ab8:	83 c4 10             	add    $0x10,%esp
  108abb:	e9 a8 fe ff ff       	jmp    108968 <MPTNew_test_brk_grow_shrink+0x58>

00108ac0 <MPTNew_test_own>:

int MPTNew_test_own()
{
  108ac0:	53                   	push   %ebx
  108ac1:	83 ec 08             	sub    $0x8,%esp
    return MPTNew_test_alloc_free_pages() + MPTNew_test_brk_grow_shrink();
  108ac4:	e8 07 fd ff ff       	call   1087d0 <MPTNew_test_alloc_free_pages>
  108ac9:	89 c3                	mov    %eax,%ebx
  108acb:	e8 40 fe ff ff       	call   108910 <MPTNew_test_brk_grow_shrink>
}
  108ad0:	83 c4 08             	add    $0x8,%esp
    return MPTNew_test_alloc_free_pages() + MPTNew_test_brk_grow_shrink();
  108ad3:	01 d8                	add    %ebx,%eax
}
  108ad5:	5b                   	pop    %ebx
  108ad6:	c3                   	ret
  108ad7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  108ade:	00 
  108adf:	90                   	nop

00108ae0 <test_MPTNew>:

int test_MPTNew()
{
  108ae0:	56                   	push   %esi
  108ae1:	53                   	push   %ebx
  108ae2:	83 ec 04             	sub    $0x4,%esp
    return MPTNew_test1() + MPTNew_test_own();
  108ae5:	e8 96 fb ff ff       	call   108680 <MPTNew_test1>
  108aea:	89 c6                	mov    %eax,%esi
    return MPTNew_test_alloc_free_pages() + MPTNew_test_brk_grow_shrink();
  108aec:	e8 df fc ff ff       	call   1087d0 <MPTNew_test_alloc_free_pages>
  108af1:	89 c3                	mov    %eax,%ebx
  108af3:	e8 18 fe ff ff       	call   108910 <MPTNew_test_brk_grow_shrink>
}
  108af8:	83 c4 04             	add    $0x4,%esp
    return MPTNew_test_alloc_free_pages() + MPTNew_test_brk_grow_shrink();
  108afb:	01 d8                	add    %ebx,%eax
}
  108afd:	5b                   	pop    %ebx
    return MPTNew_test1() + MPTNew_test_own();
  108afe:	01 f0                	add    %esi,%eax
}
  108b00:	5e                   	pop    %esi
  108b01:	c3                   	ret
  108b02:	66 90                	xchg   %ax,%ax
  108b04:	66 90                	xchg   %ax,%ax
  108b06:	66 90                	xchg   %ax,%ax
  108b08:	66 90                	xchg   %ax,%ax
  108b0a:	66 90                	xchg   %ax,%ax
  108b0c:	66 90                	xchg   %ax,%ax
  108b0e:	66 90                	xchg   %ax,%ax

00108b10 <__udivdi3>:
  108b10:	f3 0f 1e fb          	endbr32
  108b14:	55                   	push   %ebp
  108b15:	89 e5                	mov    %esp,%ebp
  108b17:	57                   	push   %edi
  108b18:	56                   	push   %esi
  108b19:	53                   	push   %ebx
  108b1a:	83 ec 1c             	sub    $0x1c,%esp
  108b1d:	8b 7d 08             	mov    0x8(%ebp),%edi
  108b20:	8b 45 14             	mov    0x14(%ebp),%eax
  108b23:	8b 75 0c             	mov    0xc(%ebp),%esi
  108b26:	8b 5d 10             	mov    0x10(%ebp),%ebx
  108b29:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  108b2c:	85 c0                	test   %eax,%eax
  108b2e:	75 20                	jne    108b50 <__udivdi3+0x40>
  108b30:	39 de                	cmp    %ebx,%esi
  108b32:	73 54                	jae    108b88 <__udivdi3+0x78>
  108b34:	89 f8                	mov    %edi,%eax
  108b36:	31 ff                	xor    %edi,%edi
  108b38:	89 f2                	mov    %esi,%edx
  108b3a:	f7 f3                	div    %ebx
  108b3c:	89 fa                	mov    %edi,%edx
  108b3e:	83 c4 1c             	add    $0x1c,%esp
  108b41:	5b                   	pop    %ebx
  108b42:	5e                   	pop    %esi
  108b43:	5f                   	pop    %edi
  108b44:	5d                   	pop    %ebp
  108b45:	c3                   	ret
  108b46:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  108b4d:	00 
  108b4e:	66 90                	xchg   %ax,%ax
  108b50:	39 c6                	cmp    %eax,%esi
  108b52:	73 14                	jae    108b68 <__udivdi3+0x58>
  108b54:	31 ff                	xor    %edi,%edi
  108b56:	31 c0                	xor    %eax,%eax
  108b58:	89 fa                	mov    %edi,%edx
  108b5a:	83 c4 1c             	add    $0x1c,%esp
  108b5d:	5b                   	pop    %ebx
  108b5e:	5e                   	pop    %esi
  108b5f:	5f                   	pop    %edi
  108b60:	5d                   	pop    %ebp
  108b61:	c3                   	ret
  108b62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  108b68:	0f bd f8             	bsr    %eax,%edi
  108b6b:	83 f7 1f             	xor    $0x1f,%edi
  108b6e:	75 48                	jne    108bb8 <__udivdi3+0xa8>
  108b70:	39 f0                	cmp    %esi,%eax
  108b72:	72 07                	jb     108b7b <__udivdi3+0x6b>
  108b74:	31 c0                	xor    %eax,%eax
  108b76:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
  108b79:	72 dd                	jb     108b58 <__udivdi3+0x48>
  108b7b:	b8 01 00 00 00       	mov    $0x1,%eax
  108b80:	eb d6                	jmp    108b58 <__udivdi3+0x48>
  108b82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  108b88:	89 d9                	mov    %ebx,%ecx
  108b8a:	85 db                	test   %ebx,%ebx
  108b8c:	75 0b                	jne    108b99 <__udivdi3+0x89>
  108b8e:	b8 01 00 00 00       	mov    $0x1,%eax
  108b93:	31 d2                	xor    %edx,%edx
  108b95:	f7 f3                	div    %ebx
  108b97:	89 c1                	mov    %eax,%ecx
  108b99:	31 d2                	xor    %edx,%edx
  108b9b:	89 f0                	mov    %esi,%eax
  108b9d:	f7 f1                	div    %ecx
  108b9f:	89 c6                	mov    %eax,%esi
  108ba1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  108ba4:	89 f7                	mov    %esi,%edi
  108ba6:	f7 f1                	div    %ecx
  108ba8:	89 fa                	mov    %edi,%edx
  108baa:	83 c4 1c             	add    $0x1c,%esp
  108bad:	5b                   	pop    %ebx
  108bae:	5e                   	pop    %esi
  108baf:	5f                   	pop    %edi
  108bb0:	5d                   	pop    %ebp
  108bb1:	c3                   	ret
  108bb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  108bb8:	89 f9                	mov    %edi,%ecx
  108bba:	ba 20 00 00 00       	mov    $0x20,%edx
  108bbf:	29 fa                	sub    %edi,%edx
  108bc1:	d3 e0                	shl    %cl,%eax
  108bc3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  108bc6:	89 d1                	mov    %edx,%ecx
  108bc8:	89 d8                	mov    %ebx,%eax
  108bca:	d3 e8                	shr    %cl,%eax
  108bcc:	89 c1                	mov    %eax,%ecx
  108bce:	8b 45 e0             	mov    -0x20(%ebp),%eax
  108bd1:	09 c1                	or     %eax,%ecx
  108bd3:	89 f0                	mov    %esi,%eax
  108bd5:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  108bd8:	89 f9                	mov    %edi,%ecx
  108bda:	d3 e3                	shl    %cl,%ebx
  108bdc:	89 d1                	mov    %edx,%ecx
  108bde:	d3 e8                	shr    %cl,%eax
  108be0:	89 5d dc             	mov    %ebx,-0x24(%ebp)
  108be3:	89 f9                	mov    %edi,%ecx
  108be5:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
  108be8:	d3 e6                	shl    %cl,%esi
  108bea:	89 d1                	mov    %edx,%ecx
  108bec:	d3 eb                	shr    %cl,%ebx
  108bee:	09 f3                	or     %esi,%ebx
  108bf0:	89 c6                	mov    %eax,%esi
  108bf2:	89 f2                	mov    %esi,%edx
  108bf4:	89 d8                	mov    %ebx,%eax
  108bf6:	f7 75 e0             	divl   -0x20(%ebp)
  108bf9:	89 d6                	mov    %edx,%esi
  108bfb:	89 c3                	mov    %eax,%ebx
  108bfd:	f7 65 dc             	mull   -0x24(%ebp)
  108c00:	89 55 e0             	mov    %edx,-0x20(%ebp)
  108c03:	39 d6                	cmp    %edx,%esi
  108c05:	72 21                	jb     108c28 <__udivdi3+0x118>
  108c07:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  108c0a:	89 f9                	mov    %edi,%ecx
  108c0c:	d3 e2                	shl    %cl,%edx
  108c0e:	39 c2                	cmp    %eax,%edx
  108c10:	73 07                	jae    108c19 <__udivdi3+0x109>
  108c12:	8b 55 e0             	mov    -0x20(%ebp),%edx
  108c15:	39 d6                	cmp    %edx,%esi
  108c17:	74 0f                	je     108c28 <__udivdi3+0x118>
  108c19:	89 d8                	mov    %ebx,%eax
  108c1b:	31 ff                	xor    %edi,%edi
  108c1d:	e9 36 ff ff ff       	jmp    108b58 <__udivdi3+0x48>
  108c22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  108c28:	8d 43 ff             	lea    -0x1(%ebx),%eax
  108c2b:	31 ff                	xor    %edi,%edi
  108c2d:	e9 26 ff ff ff       	jmp    108b58 <__udivdi3+0x48>
  108c32:	66 90                	xchg   %ax,%ax
  108c34:	66 90                	xchg   %ax,%ax
  108c36:	66 90                	xchg   %ax,%ax
  108c38:	66 90                	xchg   %ax,%ax
  108c3a:	66 90                	xchg   %ax,%ax
  108c3c:	66 90                	xchg   %ax,%ax
  108c3e:	66 90                	xchg   %ax,%ax

00108c40 <__umoddi3>:
  108c40:	f3 0f 1e fb          	endbr32
  108c44:	55                   	push   %ebp
  108c45:	89 e5                	mov    %esp,%ebp
  108c47:	57                   	push   %edi
  108c48:	56                   	push   %esi
  108c49:	53                   	push   %ebx
  108c4a:	83 ec 2c             	sub    $0x2c,%esp
  108c4d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  108c50:	8b 45 14             	mov    0x14(%ebp),%eax
  108c53:	8b 75 08             	mov    0x8(%ebp),%esi
  108c56:	8b 7d 10             	mov    0x10(%ebp),%edi
  108c59:	89 da                	mov    %ebx,%edx
  108c5b:	85 c0                	test   %eax,%eax
  108c5d:	75 19                	jne    108c78 <__umoddi3+0x38>
  108c5f:	39 fb                	cmp    %edi,%ebx
  108c61:	73 5d                	jae    108cc0 <__umoddi3+0x80>
  108c63:	89 f0                	mov    %esi,%eax
  108c65:	f7 f7                	div    %edi
  108c67:	89 d0                	mov    %edx,%eax
  108c69:	31 d2                	xor    %edx,%edx
  108c6b:	83 c4 2c             	add    $0x2c,%esp
  108c6e:	5b                   	pop    %ebx
  108c6f:	5e                   	pop    %esi
  108c70:	5f                   	pop    %edi
  108c71:	5d                   	pop    %ebp
  108c72:	c3                   	ret
  108c73:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  108c78:	89 75 e0             	mov    %esi,-0x20(%ebp)
  108c7b:	39 c3                	cmp    %eax,%ebx
  108c7d:	73 11                	jae    108c90 <__umoddi3+0x50>
  108c7f:	89 f0                	mov    %esi,%eax
  108c81:	83 c4 2c             	add    $0x2c,%esp
  108c84:	5b                   	pop    %ebx
  108c85:	5e                   	pop    %esi
  108c86:	5f                   	pop    %edi
  108c87:	5d                   	pop    %ebp
  108c88:	c3                   	ret
  108c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  108c90:	0f bd c8             	bsr    %eax,%ecx
  108c93:	83 f1 1f             	xor    $0x1f,%ecx
  108c96:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  108c99:	75 45                	jne    108ce0 <__umoddi3+0xa0>
  108c9b:	39 d8                	cmp    %ebx,%eax
  108c9d:	0f 82 d5 00 00 00    	jb     108d78 <__umoddi3+0x138>
  108ca3:	39 fe                	cmp    %edi,%esi
  108ca5:	0f 83 cd 00 00 00    	jae    108d78 <__umoddi3+0x138>
  108cab:	8b 45 e0             	mov    -0x20(%ebp),%eax
  108cae:	83 c4 2c             	add    $0x2c,%esp
  108cb1:	5b                   	pop    %ebx
  108cb2:	5e                   	pop    %esi
  108cb3:	5f                   	pop    %edi
  108cb4:	5d                   	pop    %ebp
  108cb5:	c3                   	ret
  108cb6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  108cbd:	00 
  108cbe:	66 90                	xchg   %ax,%ax
  108cc0:	89 f9                	mov    %edi,%ecx
  108cc2:	85 ff                	test   %edi,%edi
  108cc4:	75 0b                	jne    108cd1 <__umoddi3+0x91>
  108cc6:	b8 01 00 00 00       	mov    $0x1,%eax
  108ccb:	31 d2                	xor    %edx,%edx
  108ccd:	f7 f7                	div    %edi
  108ccf:	89 c1                	mov    %eax,%ecx
  108cd1:	89 d8                	mov    %ebx,%eax
  108cd3:	31 d2                	xor    %edx,%edx
  108cd5:	f7 f1                	div    %ecx
  108cd7:	89 f0                	mov    %esi,%eax
  108cd9:	f7 f1                	div    %ecx
  108cdb:	eb 8a                	jmp    108c67 <__umoddi3+0x27>
  108cdd:	8d 76 00             	lea    0x0(%esi),%esi
  108ce0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  108ce3:	ba 20 00 00 00       	mov    $0x20,%edx
  108ce8:	29 ca                	sub    %ecx,%edx
  108cea:	d3 e0                	shl    %cl,%eax
  108cec:	89 45 dc             	mov    %eax,-0x24(%ebp)
  108cef:	89 d1                	mov    %edx,%ecx
  108cf1:	89 f8                	mov    %edi,%eax
  108cf3:	d3 e8                	shr    %cl,%eax
  108cf5:	89 55 e0             	mov    %edx,-0x20(%ebp)
  108cf8:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
  108cfc:	89 c2                	mov    %eax,%edx
  108cfe:	8b 45 dc             	mov    -0x24(%ebp),%eax
  108d01:	d3 e7                	shl    %cl,%edi
  108d03:	09 c2                	or     %eax,%edx
  108d05:	8b 45 e0             	mov    -0x20(%ebp),%eax
  108d08:	89 7d d8             	mov    %edi,-0x28(%ebp)
  108d0b:	89 f7                	mov    %esi,%edi
  108d0d:	89 55 dc             	mov    %edx,-0x24(%ebp)
  108d10:	89 da                	mov    %ebx,%edx
  108d12:	89 c1                	mov    %eax,%ecx
  108d14:	d3 ea                	shr    %cl,%edx
  108d16:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
  108d1a:	d3 e3                	shl    %cl,%ebx
  108d1c:	89 c1                	mov    %eax,%ecx
  108d1e:	d3 ef                	shr    %cl,%edi
  108d20:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
  108d24:	89 f8                	mov    %edi,%eax
  108d26:	d3 e6                	shl    %cl,%esi
  108d28:	09 d8                	or     %ebx,%eax
  108d2a:	f7 75 dc             	divl   -0x24(%ebp)
  108d2d:	89 d3                	mov    %edx,%ebx
  108d2f:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  108d32:	89 f7                	mov    %esi,%edi
  108d34:	f7 65 d8             	mull   -0x28(%ebp)
  108d37:	89 c6                	mov    %eax,%esi
  108d39:	89 d1                	mov    %edx,%ecx
  108d3b:	39 d3                	cmp    %edx,%ebx
  108d3d:	72 06                	jb     108d45 <__umoddi3+0x105>
  108d3f:	75 0e                	jne    108d4f <__umoddi3+0x10f>
  108d41:	39 c7                	cmp    %eax,%edi
  108d43:	73 0a                	jae    108d4f <__umoddi3+0x10f>
  108d45:	2b 45 d8             	sub    -0x28(%ebp),%eax
  108d48:	1b 55 dc             	sbb    -0x24(%ebp),%edx
  108d4b:	89 d1                	mov    %edx,%ecx
  108d4d:	89 c6                	mov    %eax,%esi
  108d4f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  108d52:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  108d55:	29 f0                	sub    %esi,%eax
  108d57:	19 cb                	sbb    %ecx,%ebx
  108d59:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
  108d5d:	89 da                	mov    %ebx,%edx
  108d5f:	d3 e2                	shl    %cl,%edx
  108d61:	89 f9                	mov    %edi,%ecx
  108d63:	d3 e8                	shr    %cl,%eax
  108d65:	d3 eb                	shr    %cl,%ebx
  108d67:	09 d0                	or     %edx,%eax
  108d69:	89 da                	mov    %ebx,%edx
  108d6b:	83 c4 2c             	add    $0x2c,%esp
  108d6e:	5b                   	pop    %ebx
  108d6f:	5e                   	pop    %esi
  108d70:	5f                   	pop    %edi
  108d71:	5d                   	pop    %ebp
  108d72:	c3                   	ret
  108d73:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  108d78:	89 da                	mov    %ebx,%edx
  108d7a:	29 fe                	sub    %edi,%esi
  108d7c:	19 c2                	sbb    %eax,%edx
  108d7e:	89 75 e0             	mov    %esi,-0x20(%ebp)
  108d81:	e9 25 ff ff ff       	jmp    108cab <__umoddi3+0x6b>
