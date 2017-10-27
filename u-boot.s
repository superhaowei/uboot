
u-boot:     file format elf32-littlearm


Disassembly of section .text:

08000298 <default_isr>:
 8000298:	4668      	mov	r0, sp
 800029a:	f000 f82b 	bl	80002f4 <dump_ctx>
 800029e:	e7fe      	b.n	800029e <default_isr+0x6>

080002a0 <_start>:
 80002a0:	b508      	push	{r3, lr}
 80002a2:	f000 fcf3 	bl	8000c8c <wdt_disable>
 80002a6:	b672      	cpsid	i
 80002a8:	4809      	ldr	r0, [pc, #36]	; (80002d0 <_start+0x30>)
 80002aa:	4a0a      	ldr	r2, [pc, #40]	; (80002d4 <_start+0x34>)
 80002ac:	490a      	ldr	r1, [pc, #40]	; (80002d8 <_start+0x38>)
 80002ae:	1a12      	subs	r2, r2, r0
 80002b0:	f000 fa4e 	bl	8000750 <memcpy>
 80002b4:	4809      	ldr	r0, [pc, #36]	; (80002dc <_start+0x3c>)
 80002b6:	4a0a      	ldr	r2, [pc, #40]	; (80002e0 <_start+0x40>)
 80002b8:	2100      	movs	r1, #0
 80002ba:	1a12      	subs	r2, r2, r0
 80002bc:	f000 fa08 	bl	80006d0 <memset>
 80002c0:	4b08      	ldr	r3, [pc, #32]	; (80002e4 <_start+0x44>)
 80002c2:	4a09      	ldr	r2, [pc, #36]	; (80002e8 <_start+0x48>)
 80002c4:	601a      	str	r2, [r3, #0]
 80002c6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80002ca:	f000 bde7 	b.w	8000e9c <start_armboot>
 80002ce:	bf00      	nop
 80002d0:	20000000 	.word	0x20000000
 80002d4:	20000cb8 	.word	0x20000cb8
 80002d8:	0800fbf0 	.word	0x0800fbf0
 80002dc:	20000cb8 	.word	0x20000cb8
 80002e0:	20003c1c 	.word	0x20003c1c
 80002e4:	20000cb8 	.word	0x20000cb8
 80002e8:	2001f000 	.word	0x2001f000

080002ec <__enable_irq>:
 80002ec:	b662      	cpsie	i
 80002ee:	4770      	bx	lr

080002f0 <__disable_irq>:
 80002f0:	b672      	cpsid	i
 80002f2:	4770      	bx	lr

080002f4 <dump_ctx>:
 80002f4:	e92d 42f0 	stmdb	sp!, {r4, r5, r6, r7, r9, lr}
 80002f8:	4605      	mov	r5, r0
 80002fa:	f000 fafd 	bl	80008f8 <cortex_m3_irq_vec_get>
 80002fe:	4604      	mov	r4, r0
 8000300:	4817      	ldr	r0, [pc, #92]	; (8000360 <dump_ctx+0x6c>)
 8000302:	f005 f829 	bl	8005358 <printf>
 8000306:	2c0f      	cmp	r4, #15
 8000308:	d823      	bhi.n	8000352 <dump_ctx+0x5e>
 800030a:	4b16      	ldr	r3, [pc, #88]	; (8000364 <dump_ctx+0x70>)
 800030c:	4816      	ldr	r0, [pc, #88]	; (8000368 <dump_ctx+0x74>)
 800030e:	f853 1024 	ldr.w	r1, [r3, r4, lsl #2]
 8000312:	f005 f821 	bl	8005358 <printf>
 8000316:	682a      	ldr	r2, [r5, #0]
 8000318:	4914      	ldr	r1, [pc, #80]	; (800036c <dump_ctx+0x78>)
 800031a:	4815      	ldr	r0, [pc, #84]	; (8000370 <dump_ctx+0x7c>)
 800031c:	f005 f81c 	bl	8005358 <printf>
 8000320:	2401      	movs	r4, #1
 8000322:	4e14      	ldr	r6, [pc, #80]	; (8000374 <dump_ctx+0x80>)
 8000324:	4f12      	ldr	r7, [pc, #72]	; (8000370 <dump_ctx+0x7c>)
 8000326:	f8df 9054 	ldr.w	r9, [pc, #84]	; 800037c <dump_ctx+0x88>
 800032a:	e001      	b.n	8000330 <dump_ctx+0x3c>
 800032c:	2c08      	cmp	r4, #8
 800032e:	d00e      	beq.n	800034e <dump_ctx+0x5a>
 8000330:	3401      	adds	r4, #1
 8000332:	f855 2f04 	ldr.w	r2, [r5, #4]!
 8000336:	f856 1b04 	ldr.w	r1, [r6], #4
 800033a:	4638      	mov	r0, r7
 800033c:	f005 f80c 	bl	8005358 <printf>
 8000340:	07e3      	lsls	r3, r4, #31
 8000342:	d4f3      	bmi.n	800032c <dump_ctx+0x38>
 8000344:	4648      	mov	r0, r9
 8000346:	f005 f807 	bl	8005358 <printf>
 800034a:	2c08      	cmp	r4, #8
 800034c:	d1f0      	bne.n	8000330 <dump_ctx+0x3c>
 800034e:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 8000352:	f1a4 0110 	sub.w	r1, r4, #16
 8000356:	4808      	ldr	r0, [pc, #32]	; (8000378 <dump_ctx+0x84>)
 8000358:	f004 fffe 	bl	8005358 <printf>
 800035c:	e7db      	b.n	8000316 <dump_ctx+0x22>
 800035e:	bf00      	nop
 8000360:	0800c180 	.word	0x0800c180
 8000364:	0800c120 	.word	0x0800c120
 8000368:	0800fbe0 	.word	0x0800fbe0
 800036c:	0800c1a4 	.word	0x0800c1a4
 8000370:	0800c1a8 	.word	0x0800c1a8
 8000374:	0800c164 	.word	0x0800c164
 8000378:	0800c198 	.word	0x0800c198
 800037c:	0800dcc4 	.word	0x0800dcc4

08000380 <strcpy>:
 8000380:	1e42      	subs	r2, r0, #1
 8000382:	f911 3b01 	ldrsb.w	r3, [r1], #1
 8000386:	f802 3f01 	strb.w	r3, [r2, #1]!
 800038a:	2b00      	cmp	r3, #0
 800038c:	d1f9      	bne.n	8000382 <strcpy+0x2>
 800038e:	4770      	bx	lr

08000390 <strncpy>:
 8000390:	b410      	push	{r4}
 8000392:	440a      	add	r2, r1
 8000394:	1e44      	subs	r4, r0, #1
 8000396:	e004      	b.n	80003a2 <strncpy+0x12>
 8000398:	f911 3b01 	ldrsb.w	r3, [r1], #1
 800039c:	f804 3f01 	strb.w	r3, [r4, #1]!
 80003a0:	b10b      	cbz	r3, 80003a6 <strncpy+0x16>
 80003a2:	4291      	cmp	r1, r2
 80003a4:	d1f8      	bne.n	8000398 <strncpy+0x8>
 80003a6:	bc10      	pop	{r4}
 80003a8:	4770      	bx	lr
 80003aa:	bf00      	nop

080003ac <strcat>:
 80003ac:	f990 3000 	ldrsb.w	r3, [r0]
 80003b0:	b163      	cbz	r3, 80003cc <strcat+0x20>
 80003b2:	4603      	mov	r3, r0
 80003b4:	f913 2f01 	ldrsb.w	r2, [r3, #1]!
 80003b8:	2a00      	cmp	r2, #0
 80003ba:	d1fb      	bne.n	80003b4 <strcat+0x8>
 80003bc:	3b01      	subs	r3, #1
 80003be:	f911 2b01 	ldrsb.w	r2, [r1], #1
 80003c2:	f803 2f01 	strb.w	r2, [r3, #1]!
 80003c6:	2a00      	cmp	r2, #0
 80003c8:	d1f9      	bne.n	80003be <strcat+0x12>
 80003ca:	4770      	bx	lr
 80003cc:	4603      	mov	r3, r0
 80003ce:	e7f5      	b.n	80003bc <strcat+0x10>

080003d0 <strncat>:
 80003d0:	b19a      	cbz	r2, 80003fa <strncat+0x2a>
 80003d2:	f990 3000 	ldrsb.w	r3, [r0]
 80003d6:	b410      	push	{r4}
 80003d8:	b19b      	cbz	r3, 8000402 <strncat+0x32>
 80003da:	4603      	mov	r3, r0
 80003dc:	f913 4f01 	ldrsb.w	r4, [r3, #1]!
 80003e0:	2c00      	cmp	r4, #0
 80003e2:	d1fb      	bne.n	80003dc <strncat+0xc>
 80003e4:	441a      	add	r2, r3
 80003e6:	e001      	b.n	80003ec <strncat+0x1c>
 80003e8:	4293      	cmp	r3, r2
 80003ea:	d007      	beq.n	80003fc <strncat+0x2c>
 80003ec:	f911 4b01 	ldrsb.w	r4, [r1], #1
 80003f0:	f803 4b01 	strb.w	r4, [r3], #1
 80003f4:	2c00      	cmp	r4, #0
 80003f6:	d1f7      	bne.n	80003e8 <strncat+0x18>
 80003f8:	bc10      	pop	{r4}
 80003fa:	4770      	bx	lr
 80003fc:	2200      	movs	r2, #0
 80003fe:	701a      	strb	r2, [r3, #0]
 8000400:	e7fa      	b.n	80003f8 <strncat+0x28>
 8000402:	4603      	mov	r3, r0
 8000404:	e7ee      	b.n	80003e4 <strncat+0x14>
 8000406:	bf00      	nop

08000408 <strcmp>:
 8000408:	1e42      	subs	r2, r0, #1
 800040a:	e000      	b.n	800040e <strcmp+0x6>
 800040c:	b148      	cbz	r0, 8000422 <strcmp+0x1a>
 800040e:	f912 0f01 	ldrsb.w	r0, [r2, #1]!
 8000412:	f811 3b01 	ldrb.w	r3, [r1], #1
 8000416:	1ac3      	subs	r3, r0, r3
 8000418:	b25b      	sxtb	r3, r3
 800041a:	2b00      	cmp	r3, #0
 800041c:	d0f6      	beq.n	800040c <strcmp+0x4>
 800041e:	4618      	mov	r0, r3
 8000420:	4770      	bx	lr
 8000422:	4770      	bx	lr

08000424 <strncmp>:
 8000424:	b1da      	cbz	r2, 800045e <strncmp+0x3a>
 8000426:	b430      	push	{r4, r5}
 8000428:	780d      	ldrb	r5, [r1, #0]
 800042a:	f990 3000 	ldrsb.w	r3, [r0]
 800042e:	1c4c      	adds	r4, r1, #1
 8000430:	1b5d      	subs	r5, r3, r5
 8000432:	b26d      	sxtb	r5, r5
 8000434:	b9ad      	cbnz	r5, 8000462 <strncmp+0x3e>
 8000436:	b17b      	cbz	r3, 8000458 <strncmp+0x34>
 8000438:	4605      	mov	r5, r0
 800043a:	440a      	add	r2, r1
 800043c:	e007      	b.n	800044e <strncmp+0x2a>
 800043e:	f915 0f01 	ldrsb.w	r0, [r5, #1]!
 8000442:	f814 3b01 	ldrb.w	r3, [r4], #1
 8000446:	1ac3      	subs	r3, r0, r3
 8000448:	b25b      	sxtb	r3, r3
 800044a:	b92b      	cbnz	r3, 8000458 <strncmp+0x34>
 800044c:	b110      	cbz	r0, 8000454 <strncmp+0x30>
 800044e:	42a2      	cmp	r2, r4
 8000450:	d1f5      	bne.n	800043e <strncmp+0x1a>
 8000452:	2000      	movs	r0, #0
 8000454:	bc30      	pop	{r4, r5}
 8000456:	4770      	bx	lr
 8000458:	4618      	mov	r0, r3
 800045a:	bc30      	pop	{r4, r5}
 800045c:	4770      	bx	lr
 800045e:	4610      	mov	r0, r2
 8000460:	4770      	bx	lr
 8000462:	4628      	mov	r0, r5
 8000464:	e7f6      	b.n	8000454 <strncmp+0x30>
 8000466:	bf00      	nop

08000468 <strchr>:
 8000468:	f990 3000 	ldrsb.w	r3, [r0]
 800046c:	b249      	sxtb	r1, r1
 800046e:	428b      	cmp	r3, r1
 8000470:	d006      	beq.n	8000480 <strchr+0x18>
 8000472:	b123      	cbz	r3, 800047e <strchr+0x16>
 8000474:	f910 3f01 	ldrsb.w	r3, [r0, #1]!
 8000478:	428b      	cmp	r3, r1
 800047a:	d1fa      	bne.n	8000472 <strchr+0xa>
 800047c:	4770      	bx	lr
 800047e:	4618      	mov	r0, r3
 8000480:	4770      	bx	lr
 8000482:	bf00      	nop

08000484 <strrchr>:
 8000484:	f990 3000 	ldrsb.w	r3, [r0]
 8000488:	b193      	cbz	r3, 80004b0 <strrchr+0x2c>
 800048a:	4603      	mov	r3, r0
 800048c:	f913 2f01 	ldrsb.w	r2, [r3, #1]!
 8000490:	2a00      	cmp	r2, #0
 8000492:	d1fb      	bne.n	800048c <strrchr+0x8>
 8000494:	2200      	movs	r2, #0
 8000496:	b249      	sxtb	r1, r1
 8000498:	e004      	b.n	80004a4 <strrchr+0x20>
 800049a:	3b01      	subs	r3, #1
 800049c:	4298      	cmp	r0, r3
 800049e:	d805      	bhi.n	80004ac <strrchr+0x28>
 80004a0:	f993 2000 	ldrsb.w	r2, [r3]
 80004a4:	428a      	cmp	r2, r1
 80004a6:	d1f8      	bne.n	800049a <strrchr+0x16>
 80004a8:	4618      	mov	r0, r3
 80004aa:	4770      	bx	lr
 80004ac:	2000      	movs	r0, #0
 80004ae:	4770      	bx	lr
 80004b0:	4603      	mov	r3, r0
 80004b2:	e7ef      	b.n	8000494 <strrchr+0x10>

080004b4 <strlen>:
 80004b4:	f990 3000 	ldrsb.w	r3, [r0]
 80004b8:	b133      	cbz	r3, 80004c8 <strlen+0x14>
 80004ba:	4603      	mov	r3, r0
 80004bc:	f913 2f01 	ldrsb.w	r2, [r3, #1]!
 80004c0:	2a00      	cmp	r2, #0
 80004c2:	d1fb      	bne.n	80004bc <strlen+0x8>
 80004c4:	1a18      	subs	r0, r3, r0
 80004c6:	4770      	bx	lr
 80004c8:	4618      	mov	r0, r3
 80004ca:	4770      	bx	lr

080004cc <strnlen>:
 80004cc:	b1c9      	cbz	r1, 8000502 <strnlen+0x36>
 80004ce:	f990 3000 	ldrsb.w	r3, [r0]
 80004d2:	b1c3      	cbz	r3, 8000506 <strnlen+0x3a>
 80004d4:	4401      	add	r1, r0
 80004d6:	1c43      	adds	r3, r0, #1
 80004d8:	4299      	cmp	r1, r3
 80004da:	d016      	beq.n	800050a <strnlen+0x3e>
 80004dc:	b410      	push	{r4}
 80004de:	f993 2000 	ldrsb.w	r2, [r3]
 80004e2:	1c5c      	adds	r4, r3, #1
 80004e4:	b13a      	cbz	r2, 80004f6 <strnlen+0x2a>
 80004e6:	42a1      	cmp	r1, r4
 80004e8:	4623      	mov	r3, r4
 80004ea:	d007      	beq.n	80004fc <strnlen+0x30>
 80004ec:	f993 2000 	ldrsb.w	r2, [r3]
 80004f0:	1c5c      	adds	r4, r3, #1
 80004f2:	2a00      	cmp	r2, #0
 80004f4:	d1f7      	bne.n	80004e6 <strnlen+0x1a>
 80004f6:	1a18      	subs	r0, r3, r0
 80004f8:	bc10      	pop	{r4}
 80004fa:	4770      	bx	lr
 80004fc:	1a08      	subs	r0, r1, r0
 80004fe:	bc10      	pop	{r4}
 8000500:	4770      	bx	lr
 8000502:	4608      	mov	r0, r1
 8000504:	4770      	bx	lr
 8000506:	4618      	mov	r0, r3
 8000508:	4770      	bx	lr
 800050a:	1a08      	subs	r0, r1, r0
 800050c:	4770      	bx	lr
 800050e:	bf00      	nop

08000510 <strdup>:
 8000510:	b1c8      	cbz	r0, 8000546 <strdup+0x36>
 8000512:	b510      	push	{r4, lr}
 8000514:	f990 3000 	ldrsb.w	r3, [r0]
 8000518:	4604      	mov	r4, r0
 800051a:	b183      	cbz	r3, 800053e <strdup+0x2e>
 800051c:	f910 3f01 	ldrsb.w	r3, [r0, #1]!
 8000520:	2b00      	cmp	r3, #0
 8000522:	d1fb      	bne.n	800051c <strdup+0xc>
 8000524:	1b00      	subs	r0, r0, r4
 8000526:	3001      	adds	r0, #1
 8000528:	f005 f9ac 	bl	8005884 <malloc>
 800052c:	b148      	cbz	r0, 8000542 <strdup+0x32>
 800052e:	1e42      	subs	r2, r0, #1
 8000530:	f914 3b01 	ldrsb.w	r3, [r4], #1
 8000534:	f802 3f01 	strb.w	r3, [r2, #1]!
 8000538:	2b00      	cmp	r3, #0
 800053a:	d1f9      	bne.n	8000530 <strdup+0x20>
 800053c:	bd10      	pop	{r4, pc}
 800053e:	2001      	movs	r0, #1
 8000540:	e7f2      	b.n	8000528 <strdup+0x18>
 8000542:	2000      	movs	r0, #0
 8000544:	bd10      	pop	{r4, pc}
 8000546:	2000      	movs	r0, #0
 8000548:	4770      	bx	lr
 800054a:	bf00      	nop

0800054c <strspn>:
 800054c:	b470      	push	{r4, r5, r6}
 800054e:	f990 4000 	ldrsb.w	r4, [r0]
 8000552:	b1bc      	cbz	r4, 8000584 <strspn+0x38>
 8000554:	4605      	mov	r5, r0
 8000556:	2000      	movs	r0, #0
 8000558:	f991 6000 	ldrsb.w	r6, [r1]
 800055c:	b14e      	cbz	r6, 8000572 <strspn+0x26>
 800055e:	42b4      	cmp	r4, r6
 8000560:	d009      	beq.n	8000576 <strspn+0x2a>
 8000562:	460a      	mov	r2, r1
 8000564:	e001      	b.n	800056a <strspn+0x1e>
 8000566:	42a3      	cmp	r3, r4
 8000568:	d005      	beq.n	8000576 <strspn+0x2a>
 800056a:	f912 3f01 	ldrsb.w	r3, [r2, #1]!
 800056e:	2b00      	cmp	r3, #0
 8000570:	d1f9      	bne.n	8000566 <strspn+0x1a>
 8000572:	bc70      	pop	{r4, r5, r6}
 8000574:	4770      	bx	lr
 8000576:	f915 4f01 	ldrsb.w	r4, [r5, #1]!
 800057a:	3001      	adds	r0, #1
 800057c:	2c00      	cmp	r4, #0
 800057e:	d1ed      	bne.n	800055c <strspn+0x10>
 8000580:	bc70      	pop	{r4, r5, r6}
 8000582:	4770      	bx	lr
 8000584:	4620      	mov	r0, r4
 8000586:	e7f4      	b.n	8000572 <strspn+0x26>

08000588 <strpbrk>:
 8000588:	b430      	push	{r4, r5}
 800058a:	f990 4000 	ldrsb.w	r4, [r0]
 800058e:	b184      	cbz	r4, 80005b2 <strpbrk+0x2a>
 8000590:	f991 5000 	ldrsb.w	r5, [r1]
 8000594:	b14d      	cbz	r5, 80005aa <strpbrk+0x22>
 8000596:	42a5      	cmp	r5, r4
 8000598:	d00c      	beq.n	80005b4 <strpbrk+0x2c>
 800059a:	460a      	mov	r2, r1
 800059c:	e001      	b.n	80005a2 <strpbrk+0x1a>
 800059e:	42a3      	cmp	r3, r4
 80005a0:	d008      	beq.n	80005b4 <strpbrk+0x2c>
 80005a2:	f912 3f01 	ldrsb.w	r3, [r2, #1]!
 80005a6:	2b00      	cmp	r3, #0
 80005a8:	d1f9      	bne.n	800059e <strpbrk+0x16>
 80005aa:	f910 4f01 	ldrsb.w	r4, [r0, #1]!
 80005ae:	2c00      	cmp	r4, #0
 80005b0:	d1f0      	bne.n	8000594 <strpbrk+0xc>
 80005b2:	4620      	mov	r0, r4
 80005b4:	bc30      	pop	{r4, r5}
 80005b6:	4770      	bx	lr

080005b8 <strtok>:
 80005b8:	b5f0      	push	{r4, r5, r6, r7, lr}
 80005ba:	f8df e09c 	ldr.w	lr, [pc, #156]	; 8000658 <strtok+0xa0>
 80005be:	2800      	cmp	r0, #0
 80005c0:	d044      	beq.n	800064c <strtok+0x94>
 80005c2:	f990 4000 	ldrsb.w	r4, [r0]
 80005c6:	2c00      	cmp	r4, #0
 80005c8:	d03c      	beq.n	8000644 <strtok+0x8c>
 80005ca:	4607      	mov	r7, r0
 80005cc:	2600      	movs	r6, #0
 80005ce:	f991 5000 	ldrsb.w	r5, [r1]
 80005d2:	b14d      	cbz	r5, 80005e8 <strtok+0x30>
 80005d4:	42ac      	cmp	r4, r5
 80005d6:	d01d      	beq.n	8000614 <strtok+0x5c>
 80005d8:	460a      	mov	r2, r1
 80005da:	e001      	b.n	80005e0 <strtok+0x28>
 80005dc:	42a3      	cmp	r3, r4
 80005de:	d019      	beq.n	8000614 <strtok+0x5c>
 80005e0:	f912 3f01 	ldrsb.w	r3, [r2, #1]!
 80005e4:	2b00      	cmp	r3, #0
 80005e6:	d1f9      	bne.n	80005dc <strtok+0x24>
 80005e8:	5784      	ldrsb	r4, [r0, r6]
 80005ea:	4430      	add	r0, r6
 80005ec:	4606      	mov	r6, r0
 80005ee:	b34c      	cbz	r4, 8000644 <strtok+0x8c>
 80005f0:	b14d      	cbz	r5, 8000606 <strtok+0x4e>
 80005f2:	42ac      	cmp	r4, r5
 80005f4:	d019      	beq.n	800062a <strtok+0x72>
 80005f6:	460a      	mov	r2, r1
 80005f8:	e001      	b.n	80005fe <strtok+0x46>
 80005fa:	42a3      	cmp	r3, r4
 80005fc:	d015      	beq.n	800062a <strtok+0x72>
 80005fe:	f912 3f01 	ldrsb.w	r3, [r2, #1]!
 8000602:	2b00      	cmp	r3, #0
 8000604:	d1f9      	bne.n	80005fa <strtok+0x42>
 8000606:	f916 4f01 	ldrsb.w	r4, [r6, #1]!
 800060a:	2c00      	cmp	r4, #0
 800060c:	d1f0      	bne.n	80005f0 <strtok+0x38>
 800060e:	f8ce 4000 	str.w	r4, [lr]
 8000612:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000614:	f917 4f01 	ldrsb.w	r4, [r7, #1]!
 8000618:	3601      	adds	r6, #1
 800061a:	2c00      	cmp	r4, #0
 800061c:	d1d9      	bne.n	80005d2 <strtok+0x1a>
 800061e:	5784      	ldrsb	r4, [r0, r6]
 8000620:	4430      	add	r0, r6
 8000622:	4606      	mov	r6, r0
 8000624:	2c00      	cmp	r4, #0
 8000626:	d1e3      	bne.n	80005f0 <strtok+0x38>
 8000628:	e00c      	b.n	8000644 <strtok+0x8c>
 800062a:	f996 3000 	ldrsb.w	r3, [r6]
 800062e:	b12b      	cbz	r3, 800063c <strtok+0x84>
 8000630:	2300      	movs	r3, #0
 8000632:	1c74      	adds	r4, r6, #1
 8000634:	7033      	strb	r3, [r6, #0]
 8000636:	f8ce 4000 	str.w	r4, [lr]
 800063a:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800063c:	4634      	mov	r4, r6
 800063e:	f8ce 4000 	str.w	r4, [lr]
 8000642:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000644:	2000      	movs	r0, #0
 8000646:	f8ce 0000 	str.w	r0, [lr]
 800064a:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800064c:	f8de 0000 	ldr.w	r0, [lr]
 8000650:	2800      	cmp	r0, #0
 8000652:	d1b6      	bne.n	80005c2 <strtok+0xa>
 8000654:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000656:	bf00      	nop
 8000658:	20000cbc 	.word	0x20000cbc

0800065c <strsep>:
 800065c:	b4f0      	push	{r4, r5, r6, r7}
 800065e:	4607      	mov	r7, r0
 8000660:	6800      	ldr	r0, [r0, #0]
 8000662:	b1a8      	cbz	r0, 8000690 <strsep+0x34>
 8000664:	f990 4000 	ldrsb.w	r4, [r0]
 8000668:	b18c      	cbz	r4, 800068e <strsep+0x32>
 800066a:	4605      	mov	r5, r0
 800066c:	f991 6000 	ldrsb.w	r6, [r1]
 8000670:	b14e      	cbz	r6, 8000686 <strsep+0x2a>
 8000672:	42a6      	cmp	r6, r4
 8000674:	d00e      	beq.n	8000694 <strsep+0x38>
 8000676:	460a      	mov	r2, r1
 8000678:	e001      	b.n	800067e <strsep+0x22>
 800067a:	42a3      	cmp	r3, r4
 800067c:	d00a      	beq.n	8000694 <strsep+0x38>
 800067e:	f912 3f01 	ldrsb.w	r3, [r2, #1]!
 8000682:	2b00      	cmp	r3, #0
 8000684:	d1f9      	bne.n	800067a <strsep+0x1e>
 8000686:	f915 4f01 	ldrsb.w	r4, [r5, #1]!
 800068a:	2c00      	cmp	r4, #0
 800068c:	d1f0      	bne.n	8000670 <strsep+0x14>
 800068e:	603c      	str	r4, [r7, #0]
 8000690:	bcf0      	pop	{r4, r5, r6, r7}
 8000692:	4770      	bx	lr
 8000694:	2300      	movs	r3, #0
 8000696:	1c6c      	adds	r4, r5, #1
 8000698:	702b      	strb	r3, [r5, #0]
 800069a:	e7f8      	b.n	800068e <strsep+0x32>

0800069c <strswab>:
 800069c:	b198      	cbz	r0, 80006c6 <strswab+0x2a>
 800069e:	f990 2000 	ldrsb.w	r2, [r0]
 80006a2:	b192      	cbz	r2, 80006ca <strswab+0x2e>
 80006a4:	f990 1001 	ldrsb.w	r1, [r0, #1]
 80006a8:	b169      	cbz	r1, 80006c6 <strswab+0x2a>
 80006aa:	1c83      	adds	r3, r0, #2
 80006ac:	e002      	b.n	80006b4 <strswab+0x18>
 80006ae:	f913 1c01 	ldrsb.w	r1, [r3, #-1]
 80006b2:	b149      	cbz	r1, 80006c8 <strswab+0x2c>
 80006b4:	f803 2c01 	strb.w	r2, [r3, #-1]
 80006b8:	f993 2000 	ldrsb.w	r2, [r3]
 80006bc:	f803 1c02 	strb.w	r1, [r3, #-2]
 80006c0:	3302      	adds	r3, #2
 80006c2:	2a00      	cmp	r2, #0
 80006c4:	d1f3      	bne.n	80006ae <strswab+0x12>
 80006c6:	4770      	bx	lr
 80006c8:	4770      	bx	lr
 80006ca:	4610      	mov	r0, r2
 80006cc:	e7fb      	b.n	80006c6 <strswab+0x2a>
 80006ce:	bf00      	nop

080006d0 <memset>:
 80006d0:	0783      	lsls	r3, r0, #30
 80006d2:	d120      	bne.n	8000716 <memset+0x46>
 80006d4:	b430      	push	{r4, r5}
 80006d6:	b2cd      	uxtb	r5, r1
 80006d8:	ea45 2305 	orr.w	r3, r5, r5, lsl #8
 80006dc:	ea45 2303 	orr.w	r3, r5, r3, lsl #8
 80006e0:	2a03      	cmp	r2, #3
 80006e2:	ea45 2503 	orr.w	r5, r5, r3, lsl #8
 80006e6:	d920      	bls.n	800072a <memset+0x5a>
 80006e8:	4604      	mov	r4, r0
 80006ea:	4613      	mov	r3, r2
 80006ec:	3b04      	subs	r3, #4
 80006ee:	2b03      	cmp	r3, #3
 80006f0:	f844 5b04 	str.w	r5, [r4], #4
 80006f4:	d8fa      	bhi.n	80006ec <memset+0x1c>
 80006f6:	1f13      	subs	r3, r2, #4
 80006f8:	f023 0303 	bic.w	r3, r3, #3
 80006fc:	3304      	adds	r3, #4
 80006fe:	4403      	add	r3, r0
 8000700:	f002 0203 	and.w	r2, r2, #3
 8000704:	b12a      	cbz	r2, 8000712 <memset+0x42>
 8000706:	b249      	sxtb	r1, r1
 8000708:	441a      	add	r2, r3
 800070a:	f803 1b01 	strb.w	r1, [r3], #1
 800070e:	429a      	cmp	r2, r3
 8000710:	d1fb      	bne.n	800070a <memset+0x3a>
 8000712:	bc30      	pop	{r4, r5}
 8000714:	4770      	bx	lr
 8000716:	4603      	mov	r3, r0
 8000718:	2a00      	cmp	r2, #0
 800071a:	d0fb      	beq.n	8000714 <memset+0x44>
 800071c:	b249      	sxtb	r1, r1
 800071e:	4402      	add	r2, r0
 8000720:	f803 1b01 	strb.w	r1, [r3], #1
 8000724:	429a      	cmp	r2, r3
 8000726:	d1fb      	bne.n	8000720 <memset+0x50>
 8000728:	4770      	bx	lr
 800072a:	4603      	mov	r3, r0
 800072c:	e7ea      	b.n	8000704 <memset+0x34>
 800072e:	bf00      	nop

08000730 <bcopy>:
 8000730:	b15a      	cbz	r2, 800074a <bcopy+0x1a>
 8000732:	b430      	push	{r4, r5}
 8000734:	4402      	add	r2, r0
 8000736:	1e4c      	subs	r4, r1, #1
 8000738:	f910 5b01 	ldrsb.w	r5, [r0], #1
 800073c:	4290      	cmp	r0, r2
 800073e:	f804 5f01 	strb.w	r5, [r4, #1]!
 8000742:	d1f9      	bne.n	8000738 <bcopy+0x8>
 8000744:	4608      	mov	r0, r1
 8000746:	bc30      	pop	{r4, r5}
 8000748:	4770      	bx	lr
 800074a:	4608      	mov	r0, r1
 800074c:	4770      	bx	lr
 800074e:	bf00      	nop

08000750 <memcpy>:
 8000750:	ea40 0301 	orr.w	r3, r0, r1
 8000754:	079b      	lsls	r3, r3, #30
 8000756:	b470      	push	{r4, r5, r6}
 8000758:	d11e      	bne.n	8000798 <memcpy+0x48>
 800075a:	2a03      	cmp	r2, #3
 800075c:	d91c      	bls.n	8000798 <memcpy+0x48>
 800075e:	460d      	mov	r5, r1
 8000760:	4613      	mov	r3, r2
 8000762:	1f04      	subs	r4, r0, #4
 8000764:	f855 6b04 	ldr.w	r6, [r5], #4
 8000768:	3b04      	subs	r3, #4
 800076a:	2b03      	cmp	r3, #3
 800076c:	f844 6f04 	str.w	r6, [r4, #4]!
 8000770:	d8f8      	bhi.n	8000764 <memcpy+0x14>
 8000772:	1f13      	subs	r3, r2, #4
 8000774:	f023 0303 	bic.w	r3, r3, #3
 8000778:	3304      	adds	r3, #4
 800077a:	4419      	add	r1, r3
 800077c:	f002 0203 	and.w	r2, r2, #3
 8000780:	4403      	add	r3, r0
 8000782:	b13a      	cbz	r2, 8000794 <memcpy+0x44>
 8000784:	3b01      	subs	r3, #1
 8000786:	440a      	add	r2, r1
 8000788:	f911 4b01 	ldrsb.w	r4, [r1], #1
 800078c:	4291      	cmp	r1, r2
 800078e:	f803 4f01 	strb.w	r4, [r3, #1]!
 8000792:	d1f9      	bne.n	8000788 <memcpy+0x38>
 8000794:	bc70      	pop	{r4, r5, r6}
 8000796:	4770      	bx	lr
 8000798:	4603      	mov	r3, r0
 800079a:	e7f2      	b.n	8000782 <memcpy+0x32>

0800079c <memmove>:
 800079c:	4288      	cmp	r0, r1
 800079e:	b410      	push	{r4}
 80007a0:	d80b      	bhi.n	80007ba <memmove+0x1e>
 80007a2:	b142      	cbz	r2, 80007b6 <memmove+0x1a>
 80007a4:	460b      	mov	r3, r1
 80007a6:	4411      	add	r1, r2
 80007a8:	1e42      	subs	r2, r0, #1
 80007aa:	f913 4b01 	ldrsb.w	r4, [r3], #1
 80007ae:	4299      	cmp	r1, r3
 80007b0:	f802 4f01 	strb.w	r4, [r2, #1]!
 80007b4:	d1f9      	bne.n	80007aa <memmove+0xe>
 80007b6:	bc10      	pop	{r4}
 80007b8:	4770      	bx	lr
 80007ba:	1884      	adds	r4, r0, r2
 80007bc:	188b      	adds	r3, r1, r2
 80007be:	2a00      	cmp	r2, #0
 80007c0:	d0f9      	beq.n	80007b6 <memmove+0x1a>
 80007c2:	4622      	mov	r2, r4
 80007c4:	f913 4d01 	ldrsb.w	r4, [r3, #-1]!
 80007c8:	4299      	cmp	r1, r3
 80007ca:	f802 4d01 	strb.w	r4, [r2, #-1]!
 80007ce:	d1f9      	bne.n	80007c4 <memmove+0x28>
 80007d0:	bc10      	pop	{r4}
 80007d2:	4770      	bx	lr

080007d4 <memcmp>:
 80007d4:	b1aa      	cbz	r2, 8000802 <memcmp+0x2e>
 80007d6:	b430      	push	{r4, r5}
 80007d8:	780b      	ldrb	r3, [r1, #0]
 80007da:	4604      	mov	r4, r0
 80007dc:	7800      	ldrb	r0, [r0, #0]
 80007de:	1ac0      	subs	r0, r0, r3
 80007e0:	d10a      	bne.n	80007f8 <memcmp+0x24>
 80007e2:	4422      	add	r2, r4
 80007e4:	3401      	adds	r4, #1
 80007e6:	e005      	b.n	80007f4 <memcmp+0x20>
 80007e8:	f814 3b01 	ldrb.w	r3, [r4], #1
 80007ec:	f811 5f01 	ldrb.w	r5, [r1, #1]!
 80007f0:	1b5b      	subs	r3, r3, r5
 80007f2:	d103      	bne.n	80007fc <memcmp+0x28>
 80007f4:	4294      	cmp	r4, r2
 80007f6:	d1f7      	bne.n	80007e8 <memcmp+0x14>
 80007f8:	bc30      	pop	{r4, r5}
 80007fa:	4770      	bx	lr
 80007fc:	4618      	mov	r0, r3
 80007fe:	bc30      	pop	{r4, r5}
 8000800:	4770      	bx	lr
 8000802:	4610      	mov	r0, r2
 8000804:	4770      	bx	lr
 8000806:	bf00      	nop

08000808 <memscan>:
 8000808:	b1b2      	cbz	r2, 8000838 <memscan+0x30>
 800080a:	7803      	ldrb	r3, [r0, #0]
 800080c:	4299      	cmp	r1, r3
 800080e:	d013      	beq.n	8000838 <memscan+0x30>
 8000810:	1c43      	adds	r3, r0, #1
 8000812:	4402      	add	r2, r0
 8000814:	4293      	cmp	r3, r2
 8000816:	4618      	mov	r0, r3
 8000818:	f103 0301 	add.w	r3, r3, #1
 800081c:	d00d      	beq.n	800083a <memscan+0x32>
 800081e:	b410      	push	{r4}
 8000820:	7804      	ldrb	r4, [r0, #0]
 8000822:	428c      	cmp	r4, r1
 8000824:	d007      	beq.n	8000836 <memscan+0x2e>
 8000826:	4293      	cmp	r3, r2
 8000828:	4618      	mov	r0, r3
 800082a:	f103 0301 	add.w	r3, r3, #1
 800082e:	d002      	beq.n	8000836 <memscan+0x2e>
 8000830:	7804      	ldrb	r4, [r0, #0]
 8000832:	428c      	cmp	r4, r1
 8000834:	d1f7      	bne.n	8000826 <memscan+0x1e>
 8000836:	bc10      	pop	{r4}
 8000838:	4770      	bx	lr
 800083a:	4770      	bx	lr

0800083c <strstr>:
 800083c:	f991 3000 	ldrsb.w	r3, [r1]
 8000840:	b33b      	cbz	r3, 8000892 <strstr+0x56>
 8000842:	460b      	mov	r3, r1
 8000844:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000846:	f913 2f01 	ldrsb.w	r2, [r3, #1]!
 800084a:	2a00      	cmp	r2, #0
 800084c:	d1fb      	bne.n	8000846 <strstr+0xa>
 800084e:	1a5e      	subs	r6, r3, r1
 8000850:	d01e      	beq.n	8000890 <strstr+0x54>
 8000852:	f990 7000 	ldrsb.w	r7, [r0]
 8000856:	b12f      	cbz	r7, 8000864 <strstr+0x28>
 8000858:	4607      	mov	r7, r0
 800085a:	f917 3f01 	ldrsb.w	r3, [r7, #1]!
 800085e:	2b00      	cmp	r3, #0
 8000860:	d1fb      	bne.n	800085a <strstr+0x1e>
 8000862:	1a3f      	subs	r7, r7, r0
 8000864:	42be      	cmp	r6, r7
 8000866:	dc12      	bgt.n	800088e <strstr+0x52>
 8000868:	f101 3eff 	add.w	lr, r1, #4294967295	; 0xffffffff
 800086c:	4671      	mov	r1, lr
 800086e:	4633      	mov	r3, r6
 8000870:	3f01      	subs	r7, #1
 8000872:	1e42      	subs	r2, r0, #1
 8000874:	f812 5f01 	ldrb.w	r5, [r2, #1]!
 8000878:	f811 4f01 	ldrb.w	r4, [r1, #1]!
 800087c:	42a5      	cmp	r5, r4
 800087e:	d102      	bne.n	8000886 <strstr+0x4a>
 8000880:	3b01      	subs	r3, #1
 8000882:	d1f7      	bne.n	8000874 <strstr+0x38>
 8000884:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000886:	42b7      	cmp	r7, r6
 8000888:	f100 0001 	add.w	r0, r0, #1
 800088c:	daee      	bge.n	800086c <strstr+0x30>
 800088e:	2000      	movs	r0, #0
 8000890:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000892:	4770      	bx	lr

08000894 <memchr>:
 8000894:	4402      	add	r2, r0
 8000896:	4290      	cmp	r0, r2
 8000898:	b2c9      	uxtb	r1, r1
 800089a:	d012      	beq.n	80008c2 <memchr+0x2e>
 800089c:	4603      	mov	r3, r0
 800089e:	b410      	push	{r4}
 80008a0:	f813 4b01 	ldrb.w	r4, [r3], #1
 80008a4:	428c      	cmp	r4, r1
 80008a6:	d007      	beq.n	80008b8 <memchr+0x24>
 80008a8:	4293      	cmp	r3, r2
 80008aa:	4618      	mov	r0, r3
 80008ac:	d006      	beq.n	80008bc <memchr+0x28>
 80008ae:	4603      	mov	r3, r0
 80008b0:	f813 4b01 	ldrb.w	r4, [r3], #1
 80008b4:	428c      	cmp	r4, r1
 80008b6:	d1f7      	bne.n	80008a8 <memchr+0x14>
 80008b8:	bc10      	pop	{r4}
 80008ba:	4770      	bx	lr
 80008bc:	2000      	movs	r0, #0
 80008be:	bc10      	pop	{r4}
 80008c0:	4770      	bx	lr
 80008c2:	2000      	movs	r0, #0
 80008c4:	4770      	bx	lr
 80008c6:	bf00      	nop

080008c8 <arch_cpu_init>:
 80008c8:	b508      	push	{r3, lr}
 80008ca:	f000 f9bf 	bl	8000c4c <envm_init>
 80008ce:	f000 f88f 	bl	80009f0 <timer_init>
 80008d2:	f000 f915 	bl	8000b00 <clock_init>
 80008d6:	f640 62a6 	movw	r2, #3750	; 0xea6
 80008da:	f8d8 3000 	ldr.w	r3, [r8]
 80008de:	60da      	str	r2, [r3, #12]
 80008e0:	f000 fa1c 	bl	8000d1c <cortex_m3_soc_init>
 80008e4:	f04f 42c0 	mov.w	r2, #1610612736	; 0x60000000
 80008e8:	f8d8 3000 	ldr.w	r3, [r8]
 80008ec:	2000      	movs	r0, #0
 80008ee:	611a      	str	r2, [r3, #16]
 80008f0:	bd08      	pop	{r3, pc}
 80008f2:	bf00      	nop

080008f4 <cleanup_before_linux>:
 80008f4:	2000      	movs	r0, #0
 80008f6:	4770      	bx	lr

080008f8 <cortex_m3_irq_vec_get>:
 80008f8:	4b01      	ldr	r3, [pc, #4]	; (8000900 <cortex_m3_irq_vec_get+0x8>)
 80008fa:	6858      	ldr	r0, [r3, #4]
 80008fc:	b2c0      	uxtb	r0, r0
 80008fe:	4770      	bx	lr
 8000900:	e000ed00 	.word	0xe000ed00

08000904 <cortex_m3_mpu_set_region>:
 8000904:	4b02      	ldr	r3, [pc, #8]	; (8000910 <cortex_m3_mpu_set_region+0xc>)
 8000906:	6098      	str	r0, [r3, #8]
 8000908:	60d9      	str	r1, [r3, #12]
 800090a:	611a      	str	r2, [r3, #16]
 800090c:	4770      	bx	lr
 800090e:	bf00      	nop
 8000910:	e000ed90 	.word	0xe000ed90

08000914 <cortex_m3_mpu_enable>:
 8000914:	2800      	cmp	r0, #0
 8000916:	bf14      	ite	ne
 8000918:	2203      	movne	r2, #3
 800091a:	2200      	moveq	r2, #0
 800091c:	4b01      	ldr	r3, [pc, #4]	; (8000924 <cortex_m3_mpu_enable+0x10>)
 800091e:	605a      	str	r2, [r3, #4]
 8000920:	4770      	bx	lr
 8000922:	bf00      	nop
 8000924:	e000ed90 	.word	0xe000ed90

08000928 <cortex_m3_mpu_full_access>:
 8000928:	2200      	movs	r2, #0
 800092a:	2103      	movs	r1, #3
 800092c:	4b03      	ldr	r3, [pc, #12]	; (800093c <cortex_m3_mpu_full_access+0x14>)
 800092e:	4804      	ldr	r0, [pc, #16]	; (8000940 <cortex_m3_mpu_full_access+0x18>)
 8000930:	609a      	str	r2, [r3, #8]
 8000932:	60da      	str	r2, [r3, #12]
 8000934:	6118      	str	r0, [r3, #16]
 8000936:	6059      	str	r1, [r3, #4]
 8000938:	4770      	bx	lr
 800093a:	bf00      	nop
 800093c:	e000ed90 	.word	0xe000ed90
 8000940:	0300003f 	.word	0x0300003f

08000944 <do_cptf>:
 8000944:	2a01      	cmp	r2, #1
 8000946:	e92d 42f0 	stmdb	sp!, {r4, r5, r6, r7, r9, lr}
 800094a:	461c      	mov	r4, r3
 800094c:	d032      	beq.n	80009b4 <do_cptf+0x70>
 800094e:	4615      	mov	r5, r2
 8000950:	2100      	movs	r1, #0
 8000952:	2210      	movs	r2, #16
 8000954:	6858      	ldr	r0, [r3, #4]
 8000956:	f007 ffbf 	bl	80088d8 <simple_strtoul>
 800095a:	2d02      	cmp	r5, #2
 800095c:	4e1e      	ldr	r6, [pc, #120]	; (80009d8 <do_cptf+0x94>)
 800095e:	4607      	mov	r7, r0
 8000960:	dc11      	bgt.n	8000986 <do_cptf+0x42>
 8000962:	2500      	movs	r5, #0
 8000964:	f8df 9084 	ldr.w	r9, [pc, #132]	; 80009ec <do_cptf+0xa8>
 8000968:	6821      	ldr	r1, [r4, #0]
 800096a:	481c      	ldr	r0, [pc, #112]	; (80009dc <do_cptf+0x98>)
 800096c:	f004 fcf4 	bl	8005358 <printf>
 8000970:	462b      	mov	r3, r5
 8000972:	4632      	mov	r2, r6
 8000974:	4d1a      	ldr	r5, [pc, #104]	; (80009e0 <do_cptf+0x9c>)
 8000976:	4649      	mov	r1, r9
 8000978:	4638      	mov	r0, r7
 800097a:	47a8      	blx	r5
 800097c:	1e05      	subs	r5, r0, #0
 800097e:	dd21      	ble.n	80009c4 <do_cptf+0x80>
 8000980:	4628      	mov	r0, r5
 8000982:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 8000986:	2210      	movs	r2, #16
 8000988:	2100      	movs	r1, #0
 800098a:	68a0      	ldr	r0, [r4, #8]
 800098c:	f007 ffa4 	bl	80088d8 <simple_strtoul>
 8000990:	2d03      	cmp	r5, #3
 8000992:	4681      	mov	r9, r0
 8000994:	d01e      	beq.n	80009d4 <do_cptf+0x90>
 8000996:	2210      	movs	r2, #16
 8000998:	2100      	movs	r1, #0
 800099a:	68e0      	ldr	r0, [r4, #12]
 800099c:	f007 ff9c 	bl	80088d8 <simple_strtoul>
 80009a0:	2d04      	cmp	r5, #4
 80009a2:	4606      	mov	r6, r0
 80009a4:	d016      	beq.n	80009d4 <do_cptf+0x90>
 80009a6:	2210      	movs	r2, #16
 80009a8:	2100      	movs	r1, #0
 80009aa:	6920      	ldr	r0, [r4, #16]
 80009ac:	f007 ffe8 	bl	8008980 <simple_strtol>
 80009b0:	4605      	mov	r5, r0
 80009b2:	e7d9      	b.n	8000968 <do_cptf+0x24>
 80009b4:	2500      	movs	r5, #0
 80009b6:	6819      	ldr	r1, [r3, #0]
 80009b8:	480a      	ldr	r0, [pc, #40]	; (80009e4 <do_cptf+0xa0>)
 80009ba:	f004 fccd 	bl	8005358 <printf>
 80009be:	4628      	mov	r0, r5
 80009c0:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 80009c4:	6821      	ldr	r1, [r4, #0]
 80009c6:	462a      	mov	r2, r5
 80009c8:	4807      	ldr	r0, [pc, #28]	; (80009e8 <do_cptf+0xa4>)
 80009ca:	f004 fcc5 	bl	8005358 <printf>
 80009ce:	4628      	mov	r0, r5
 80009d0:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 80009d4:	2500      	movs	r5, #0
 80009d6:	e7c7      	b.n	8000968 <do_cptf+0x24>
 80009d8:	00016000 	.word	0x00016000
 80009dc:	0800c264 	.word	0x0800c264
 80009e0:	20000af5 	.word	0x20000af5
 80009e4:	0800c240 	.word	0x0800c240
 80009e8:	0800c288 	.word	0x0800c288
 80009ec:	20005000 	.word	0x20005000

080009f0 <timer_init>:
 80009f0:	b470      	push	{r4, r5, r6}
 80009f2:	2000      	movs	r0, #0
 80009f4:	2400      	movs	r4, #0
 80009f6:	2500      	movs	r5, #0
 80009f8:	2101      	movs	r1, #1
 80009fa:	4b05      	ldr	r3, [pc, #20]	; (8000a10 <timer_init+0x20>)
 80009fc:	4e05      	ldr	r6, [pc, #20]	; (8000a14 <timer_init+0x24>)
 80009fe:	4a06      	ldr	r2, [pc, #24]	; (8000a18 <timer_init+0x28>)
 8000a00:	605e      	str	r6, [r3, #4]
 8000a02:	6098      	str	r0, [r3, #8]
 8000a04:	6019      	str	r1, [r3, #0]
 8000a06:	e9c2 4500 	strd	r4, r5, [r2]
 8000a0a:	bc70      	pop	{r4, r5, r6}
 8000a0c:	4770      	bx	lr
 8000a0e:	bf00      	nop
 8000a10:	e000e010 	.word	0xe000e010
 8000a14:	00fffffe 	.word	0x00fffffe
 8000a18:	20000cc0 	.word	0x20000cc0

08000a1c <get_timer>:
 8000a1c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000a1e:	4a15      	ldr	r2, [pc, #84]	; (8000a74 <get_timer+0x58>)
 8000a20:	4b15      	ldr	r3, [pc, #84]	; (8000a78 <get_timer+0x5c>)
 8000a22:	4604      	mov	r4, r0
 8000a24:	689d      	ldr	r5, [r3, #8]
 8000a26:	6893      	ldr	r3, [r2, #8]
 8000a28:	429d      	cmp	r5, r3
 8000a2a:	d91a      	bls.n	8000a62 <get_timer+0x46>
 8000a2c:	e9d2 6700 	ldrd	r6, r7, [r2]
 8000a30:	f103 7380 	add.w	r3, r3, #16777216	; 0x1000000
 8000a34:	3b02      	subs	r3, #2
 8000a36:	1b5b      	subs	r3, r3, r5
 8000a38:	18f6      	adds	r6, r6, r3
 8000a3a:	f147 0700 	adc.w	r7, r7, #0
 8000a3e:	e9c2 6700 	strd	r6, r7, [r2]
 8000a42:	4b0e      	ldr	r3, [pc, #56]	; (8000a7c <get_timer+0x60>)
 8000a44:	2004      	movs	r0, #4
 8000a46:	6095      	str	r5, [r2, #8]
 8000a48:	4798      	blx	r3
 8000a4a:	4602      	mov	r2, r0
 8000a4c:	4b0c      	ldr	r3, [pc, #48]	; (8000a80 <get_timer+0x64>)
 8000a4e:	4630      	mov	r0, r6
 8000a50:	fba3 3202 	umull	r3, r2, r3, r2
 8000a54:	4639      	mov	r1, r7
 8000a56:	2300      	movs	r3, #0
 8000a58:	0992      	lsrs	r2, r2, #6
 8000a5a:	f00b f9d9 	bl	800be10 <__aeabi_uldivmod>
 8000a5e:	1b00      	subs	r0, r0, r4
 8000a60:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000a62:	1b5b      	subs	r3, r3, r5
 8000a64:	e9d2 6700 	ldrd	r6, r7, [r2]
 8000a68:	18f6      	adds	r6, r6, r3
 8000a6a:	f147 0700 	adc.w	r7, r7, #0
 8000a6e:	e9c2 6700 	strd	r6, r7, [r2]
 8000a72:	e7e6      	b.n	8000a42 <get_timer+0x26>
 8000a74:	20000cc0 	.word	0x20000cc0
 8000a78:	e000e010 	.word	0xe000e010
 8000a7c:	20000b21 	.word	0x20000b21
 8000a80:	10624dd3 	.word	0x10624dd3

08000a84 <reset_timer>:
 8000a84:	2000      	movs	r0, #0
 8000a86:	2100      	movs	r1, #0
 8000a88:	4a03      	ldr	r2, [pc, #12]	; (8000a98 <reset_timer+0x14>)
 8000a8a:	4b04      	ldr	r3, [pc, #16]	; (8000a9c <reset_timer+0x18>)
 8000a8c:	6892      	ldr	r2, [r2, #8]
 8000a8e:	e9c3 0100 	strd	r0, r1, [r3]
 8000a92:	609a      	str	r2, [r3, #8]
 8000a94:	4770      	bx	lr
 8000a96:	bf00      	nop
 8000a98:	e000e010 	.word	0xe000e010
 8000a9c:	20000cc0 	.word	0x20000cc0

08000aa0 <__udelay>:
 8000aa0:	b510      	push	{r4, lr}
 8000aa2:	4b11      	ldr	r3, [pc, #68]	; (8000ae8 <__udelay+0x48>)
 8000aa4:	4604      	mov	r4, r0
 8000aa6:	2004      	movs	r0, #4
 8000aa8:	4798      	blx	r3
 8000aaa:	4b10      	ldr	r3, [pc, #64]	; (8000aec <__udelay+0x4c>)
 8000aac:	4a10      	ldr	r2, [pc, #64]	; (8000af0 <__udelay+0x50>)
 8000aae:	fba3 3000 	umull	r3, r0, r3, r0
 8000ab2:	0c80      	lsrs	r0, r0, #18
 8000ab4:	fb04 f000 	mul.w	r0, r4, r0
 8000ab8:	6891      	ldr	r1, [r2, #8]
 8000aba:	4288      	cmp	r0, r1
 8000abc:	d90a      	bls.n	8000ad4 <__udelay+0x34>
 8000abe:	f101 7380 	add.w	r3, r1, #16777216	; 0x1000000
 8000ac2:	3b02      	subs	r3, #2
 8000ac4:	1a18      	subs	r0, r3, r0
 8000ac6:	6893      	ldr	r3, [r2, #8]
 8000ac8:	4299      	cmp	r1, r3
 8000aca:	d8fc      	bhi.n	8000ac6 <__udelay+0x26>
 8000acc:	6893      	ldr	r3, [r2, #8]
 8000ace:	4283      	cmp	r3, r0
 8000ad0:	d8f9      	bhi.n	8000ac6 <__udelay+0x26>
 8000ad2:	bd10      	pop	{r4, pc}
 8000ad4:	1a08      	subs	r0, r1, r0
 8000ad6:	e002      	b.n	8000ade <__udelay+0x3e>
 8000ad8:	6893      	ldr	r3, [r2, #8]
 8000ada:	4299      	cmp	r1, r3
 8000adc:	d302      	bcc.n	8000ae4 <__udelay+0x44>
 8000ade:	6893      	ldr	r3, [r2, #8]
 8000ae0:	4283      	cmp	r3, r0
 8000ae2:	d8f9      	bhi.n	8000ad8 <__udelay+0x38>
 8000ae4:	bd10      	pop	{r4, pc}
 8000ae6:	bf00      	nop
 8000ae8:	20000b21 	.word	0x20000b21
 8000aec:	431bde83 	.word	0x431bde83
 8000af0:	e000e010 	.word	0xe000e010

08000af4 <get_tbclk>:
 8000af4:	2004      	movs	r0, #4
 8000af6:	4b01      	ldr	r3, [pc, #4]	; (8000afc <get_tbclk+0x8>)
 8000af8:	4718      	bx	r3
 8000afa:	bf00      	nop
 8000afc:	20000b21 	.word	0x20000b21

08000b00 <clock_init>:
 8000b00:	4a47      	ldr	r2, [pc, #284]	; (8000c20 <clock_init+0x120>)
 8000b02:	b538      	push	{r3, r4, r5, lr}
 8000b04:	6810      	ldr	r0, [r2, #0]
 8000b06:	f44f 43a0 	mov.w	r3, #20480	; 0x5000
 8000b0a:	f440 3080 	orr.w	r0, r0, #65536	; 0x10000
 8000b0e:	4611      	mov	r1, r2
 8000b10:	6010      	str	r0, [r2, #0]
 8000b12:	e001      	b.n	8000b18 <clock_init+0x18>
 8000b14:	3b01      	subs	r3, #1
 8000b16:	d002      	beq.n	8000b1e <clock_init+0x1e>
 8000b18:	680a      	ldr	r2, [r1, #0]
 8000b1a:	0395      	lsls	r5, r2, #14
 8000b1c:	d5fa      	bpl.n	8000b14 <clock_init+0x14>
 8000b1e:	4b40      	ldr	r3, [pc, #256]	; (8000c20 <clock_init+0x120>)
 8000b20:	681a      	ldr	r2, [r3, #0]
 8000b22:	0394      	lsls	r4, r2, #14
 8000b24:	d538      	bpl.n	8000b98 <clock_init+0x98>
 8000b26:	4619      	mov	r1, r3
 8000b28:	689a      	ldr	r2, [r3, #8]
 8000b2a:	483e      	ldr	r0, [pc, #248]	; (8000c24 <clock_init+0x124>)
 8000b2c:	f422 427c 	bic.w	r2, r2, #64512	; 0xfc00
 8000b30:	f022 02f0 	bic.w	r2, r2, #240	; 0xf0
 8000b34:	f442 4214 	orr.w	r2, r2, #37888	; 0x9400
 8000b38:	609a      	str	r2, [r3, #8]
 8000b3a:	6058      	str	r0, [r3, #4]
 8000b3c:	681a      	ldr	r2, [r3, #0]
 8000b3e:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8000b42:	601a      	str	r2, [r3, #0]
 8000b44:	680b      	ldr	r3, [r1, #0]
 8000b46:	0198      	lsls	r0, r3, #6
 8000b48:	d5fc      	bpl.n	8000b44 <clock_init+0x44>
 8000b4a:	4b37      	ldr	r3, [pc, #220]	; (8000c28 <clock_init+0x128>)
 8000b4c:	6c08      	ldr	r0, [r1, #64]	; 0x40
 8000b4e:	461a      	mov	r2, r3
 8000b50:	f040 5080 	orr.w	r0, r0, #268435456	; 0x10000000
 8000b54:	6408      	str	r0, [r1, #64]	; 0x40
 8000b56:	6819      	ldr	r1, [r3, #0]
 8000b58:	f441 3180 	orr.w	r1, r1, #65536	; 0x10000
 8000b5c:	6019      	str	r1, [r3, #0]
 8000b5e:	6853      	ldr	r3, [r2, #4]
 8000b60:	03d9      	lsls	r1, r3, #15
 8000b62:	d5fc      	bpl.n	8000b5e <clock_init+0x5e>
 8000b64:	6813      	ldr	r3, [r2, #0]
 8000b66:	4930      	ldr	r1, [pc, #192]	; (8000c28 <clock_init+0x128>)
 8000b68:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
 8000b6c:	6013      	str	r3, [r2, #0]
 8000b6e:	684b      	ldr	r3, [r1, #4]
 8000b70:	039b      	lsls	r3, r3, #14
 8000b72:	d5fc      	bpl.n	8000b6e <clock_init+0x6e>
 8000b74:	2006      	movs	r0, #6
 8000b76:	f000 f85f 	bl	8000c38 <envm_config>
 8000b7a:	4b29      	ldr	r3, [pc, #164]	; (8000c20 <clock_init+0x120>)
 8000b7c:	461a      	mov	r2, r3
 8000b7e:	6899      	ldr	r1, [r3, #8]
 8000b80:	f021 0103 	bic.w	r1, r1, #3
 8000b84:	6099      	str	r1, [r3, #8]
 8000b86:	6899      	ldr	r1, [r3, #8]
 8000b88:	f041 0102 	orr.w	r1, r1, #2
 8000b8c:	6099      	str	r1, [r3, #8]
 8000b8e:	6893      	ldr	r3, [r2, #8]
 8000b90:	f003 030c 	and.w	r3, r3, #12
 8000b94:	2b08      	cmp	r3, #8
 8000b96:	d1fa      	bne.n	8000b8e <clock_init+0x8e>
 8000b98:	4921      	ldr	r1, [pc, #132]	; (8000c20 <clock_init+0x120>)
 8000b9a:	688b      	ldr	r3, [r1, #8]
 8000b9c:	f3c3 0381 	ubfx	r3, r3, #2, #2
 8000ba0:	2b01      	cmp	r3, #1
 8000ba2:	d038      	beq.n	8000c16 <clock_init+0x116>
 8000ba4:	d337      	bcc.n	8000c16 <clock_init+0x116>
 8000ba6:	2b02      	cmp	r3, #2
 8000ba8:	d01e      	beq.n	8000be8 <clock_init+0xe8>
 8000baa:	4920      	ldr	r1, [pc, #128]	; (8000c2c <clock_init+0x12c>)
 8000bac:	4a20      	ldr	r2, [pc, #128]	; (8000c30 <clock_init+0x130>)
 8000bae:	460b      	mov	r3, r1
 8000bb0:	6011      	str	r1, [r2, #0]
 8000bb2:	481b      	ldr	r0, [pc, #108]	; (8000c20 <clock_init+0x120>)
 8000bb4:	491f      	ldr	r1, [pc, #124]	; (8000c34 <clock_init+0x134>)
 8000bb6:	6884      	ldr	r4, [r0, #8]
 8000bb8:	f3c4 1403 	ubfx	r4, r4, #4, #4
 8000bbc:	f851 4024 	ldr.w	r4, [r1, r4, lsl #2]
 8000bc0:	40e3      	lsrs	r3, r4
 8000bc2:	6053      	str	r3, [r2, #4]
 8000bc4:	6884      	ldr	r4, [r0, #8]
 8000bc6:	08dd      	lsrs	r5, r3, #3
 8000bc8:	f3c4 2482 	ubfx	r4, r4, #10, #3
 8000bcc:	f851 4024 	ldr.w	r4, [r1, r4, lsl #2]
 8000bd0:	fa23 f404 	lsr.w	r4, r3, r4
 8000bd4:	6094      	str	r4, [r2, #8]
 8000bd6:	6880      	ldr	r0, [r0, #8]
 8000bd8:	6115      	str	r5, [r2, #16]
 8000bda:	f3c0 3042 	ubfx	r0, r0, #13, #3
 8000bde:	f851 1020 	ldr.w	r1, [r1, r0, lsl #2]
 8000be2:	40cb      	lsrs	r3, r1
 8000be4:	60d3      	str	r3, [r2, #12]
 8000be6:	bd38      	pop	{r3, r4, r5, pc}
 8000be8:	6848      	ldr	r0, [r1, #4]
 8000bea:	4b10      	ldr	r3, [pc, #64]	; (8000c2c <clock_init+0x12c>)
 8000bec:	f000 003f 	and.w	r0, r0, #63	; 0x3f
 8000bf0:	fbb3 f0f0 	udiv	r0, r3, r0
 8000bf4:	4a0e      	ldr	r2, [pc, #56]	; (8000c30 <clock_init+0x130>)
 8000bf6:	684b      	ldr	r3, [r1, #4]
 8000bf8:	6150      	str	r0, [r2, #20]
 8000bfa:	684b      	ldr	r3, [r1, #4]
 8000bfc:	6849      	ldr	r1, [r1, #4]
 8000bfe:	f3c3 1388 	ubfx	r3, r3, #6, #9
 8000c02:	fb03 f300 	mul.w	r3, r3, r0
 8000c06:	f3c1 4101 	ubfx	r1, r1, #16, #2
 8000c0a:	3101      	adds	r1, #1
 8000c0c:	0049      	lsls	r1, r1, #1
 8000c0e:	fbb3 f3f1 	udiv	r3, r3, r1
 8000c12:	6013      	str	r3, [r2, #0]
 8000c14:	e7cd      	b.n	8000bb2 <clock_init+0xb2>
 8000c16:	4a06      	ldr	r2, [pc, #24]	; (8000c30 <clock_init+0x130>)
 8000c18:	4b04      	ldr	r3, [pc, #16]	; (8000c2c <clock_init+0x12c>)
 8000c1a:	6013      	str	r3, [r2, #0]
 8000c1c:	e7c9      	b.n	8000bb2 <clock_init+0xb2>
 8000c1e:	bf00      	nop
 8000c20:	40023800 	.word	0x40023800
 8000c24:	08406410 	.word	0x08406410
 8000c28:	40007000 	.word	0x40007000
 8000c2c:	00f42400 	.word	0x00f42400
 8000c30:	20000ccc 	.word	0x20000ccc
 8000c34:	0800c2ec 	.word	0x0800c2ec

08000c38 <envm_config>:
 8000c38:	2807      	cmp	r0, #7
 8000c3a:	bf28      	it	cs
 8000c3c:	2007      	movcs	r0, #7
 8000c3e:	4b02      	ldr	r3, [pc, #8]	; (8000c48 <envm_config+0x10>)
 8000c40:	f440 7040 	orr.w	r0, r0, #768	; 0x300
 8000c44:	6018      	str	r0, [r3, #0]
 8000c46:	4770      	bx	lr
 8000c48:	40023c00 	.word	0x40023c00

08000c4c <envm_init>:
 8000c4c:	4b0b      	ldr	r3, [pc, #44]	; (8000c7c <envm_init+0x30>)
 8000c4e:	691a      	ldr	r2, [r3, #16]
 8000c50:	2a00      	cmp	r2, #0
 8000c52:	da03      	bge.n	8000c5c <envm_init+0x10>
 8000c54:	490a      	ldr	r1, [pc, #40]	; (8000c80 <envm_init+0x34>)
 8000c56:	4a0b      	ldr	r2, [pc, #44]	; (8000c84 <envm_init+0x38>)
 8000c58:	6059      	str	r1, [r3, #4]
 8000c5a:	605a      	str	r2, [r3, #4]
 8000c5c:	4b07      	ldr	r3, [pc, #28]	; (8000c7c <envm_init+0x30>)
 8000c5e:	691a      	ldr	r2, [r3, #16]
 8000c60:	f022 7240 	bic.w	r2, r2, #50331648	; 0x3000000
 8000c64:	f022 0203 	bic.w	r2, r2, #3
 8000c68:	611a      	str	r2, [r3, #16]
 8000c6a:	691a      	ldr	r2, [r3, #16]
 8000c6c:	f442 7200 	orr.w	r2, r2, #512	; 0x200
 8000c70:	611a      	str	r2, [r3, #16]
 8000c72:	691a      	ldr	r2, [r3, #16]
 8000c74:	f042 4200 	orr.w	r2, r2, #2147483648	; 0x80000000
 8000c78:	611a      	str	r2, [r3, #16]
 8000c7a:	4770      	bx	lr
 8000c7c:	40023c00 	.word	0x40023c00
 8000c80:	45670123 	.word	0x45670123
 8000c84:	cdef89ab 	.word	0xcdef89ab

08000c88 <wdt_strobe>:
 8000c88:	4770      	bx	lr
 8000c8a:	bf00      	nop

08000c8c <wdt_disable>:
 8000c8c:	4770      	bx	lr
 8000c8e:	bf00      	nop

08000c90 <wdt_enable>:
 8000c90:	4770      	bx	lr
 8000c92:	bf00      	nop

08000c94 <stm32f7_envm_as_dev>:
 8000c94:	b508      	push	{r3, lr}
 8000c96:	2000      	movs	r0, #0
 8000c98:	f7ff fe3c 	bl	8000914 <cortex_m3_mpu_enable>
 8000c9c:	4a06      	ldr	r2, [pc, #24]	; (8000cb8 <stm32f7_envm_as_dev+0x24>)
 8000c9e:	4907      	ldr	r1, [pc, #28]	; (8000cbc <stm32f7_envm_as_dev+0x28>)
 8000ca0:	2003      	movs	r0, #3
 8000ca2:	f7ff fe2f 	bl	8000904 <cortex_m3_mpu_set_region>
 8000ca6:	2001      	movs	r0, #1
 8000ca8:	f7ff fe34 	bl	8000914 <cortex_m3_mpu_enable>
 8000cac:	f3bf 8f4f 	dsb	sy
 8000cb0:	f3bf 8f6f 	isb	sy
 8000cb4:	bd08      	pop	{r3, pc}
 8000cb6:	bf00      	nop
 8000cb8:	03000027 	.word	0x03000027
 8000cbc:	08000013 	.word	0x08000013

08000cc0 <stm32f7_envm_as_mem>:
 8000cc0:	b508      	push	{r3, lr}
 8000cc2:	2000      	movs	r0, #0
 8000cc4:	f7ff fe26 	bl	8000914 <cortex_m3_mpu_enable>
 8000cc8:	4a06      	ldr	r2, [pc, #24]	; (8000ce4 <stm32f7_envm_as_mem+0x24>)
 8000cca:	4907      	ldr	r1, [pc, #28]	; (8000ce8 <stm32f7_envm_as_mem+0x28>)
 8000ccc:	2003      	movs	r0, #3
 8000cce:	f7ff fe19 	bl	8000904 <cortex_m3_mpu_set_region>
 8000cd2:	2001      	movs	r0, #1
 8000cd4:	f7ff fe1e 	bl	8000914 <cortex_m3_mpu_enable>
 8000cd8:	f3bf 8f4f 	dsb	sy
 8000cdc:	f3bf 8f6f 	isb	sy
 8000ce0:	bd08      	pop	{r3, pc}
 8000ce2:	bf00      	nop
 8000ce4:	030b0027 	.word	0x030b0027
 8000ce8:	08000013 	.word	0x08000013

08000cec <stm32f7_cache_sync_range>:
 8000cec:	4288      	cmp	r0, r1
 8000cee:	d206      	bcs.n	8000cfe <stm32f7_cache_sync_range+0x12>
 8000cf0:	4a07      	ldr	r2, [pc, #28]	; (8000d10 <stm32f7_cache_sync_range+0x24>)
 8000cf2:	4b08      	ldr	r3, [pc, #32]	; (8000d14 <stm32f7_cache_sync_range+0x28>)
 8000cf4:	6010      	str	r0, [r2, #0]
 8000cf6:	6018      	str	r0, [r3, #0]
 8000cf8:	3020      	adds	r0, #32
 8000cfa:	4281      	cmp	r1, r0
 8000cfc:	d8fa      	bhi.n	8000cf4 <stm32f7_cache_sync_range+0x8>
 8000cfe:	2200      	movs	r2, #0
 8000d00:	4b05      	ldr	r3, [pc, #20]	; (8000d18 <stm32f7_cache_sync_range+0x2c>)
 8000d02:	601a      	str	r2, [r3, #0]
 8000d04:	f3bf 8f4f 	dsb	sy
 8000d08:	f3bf 8f6f 	isb	sy
 8000d0c:	4770      	bx	lr
 8000d0e:	bf00      	nop
 8000d10:	e000ef64 	.word	0xe000ef64
 8000d14:	e000ef58 	.word	0xe000ef58
 8000d18:	e000ef78 	.word	0xe000ef78

08000d1c <cortex_m3_soc_init>:
 8000d1c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000d1e:	4a2a      	ldr	r2, [pc, #168]	; (8000dc8 <cortex_m3_soc_init+0xac>)
 8000d20:	2110      	movs	r1, #16
 8000d22:	2000      	movs	r0, #0
 8000d24:	f7ff fdee 	bl	8000904 <cortex_m3_mpu_set_region>
 8000d28:	4a28      	ldr	r2, [pc, #160]	; (8000dcc <cortex_m3_soc_init+0xb0>)
 8000d2a:	4929      	ldr	r1, [pc, #164]	; (8000dd0 <cortex_m3_soc_init+0xb4>)
 8000d2c:	2001      	movs	r0, #1
 8000d2e:	f7ff fde9 	bl	8000904 <cortex_m3_mpu_set_region>
 8000d32:	4a28      	ldr	r2, [pc, #160]	; (8000dd4 <cortex_m3_soc_init+0xb8>)
 8000d34:	4928      	ldr	r1, [pc, #160]	; (8000dd8 <cortex_m3_soc_init+0xbc>)
 8000d36:	2002      	movs	r0, #2
 8000d38:	f7ff fde4 	bl	8000904 <cortex_m3_mpu_set_region>
 8000d3c:	4a27      	ldr	r2, [pc, #156]	; (8000ddc <cortex_m3_soc_init+0xc0>)
 8000d3e:	4928      	ldr	r1, [pc, #160]	; (8000de0 <cortex_m3_soc_init+0xc4>)
 8000d40:	2003      	movs	r0, #3
 8000d42:	f7ff fddf 	bl	8000904 <cortex_m3_mpu_set_region>
 8000d46:	f3bf 8f4f 	dsb	sy
 8000d4a:	f3bf 8f6f 	isb	sy
 8000d4e:	2001      	movs	r0, #1
 8000d50:	f7ff fde0 	bl	8000914 <cortex_m3_mpu_enable>
 8000d54:	2000      	movs	r0, #0
 8000d56:	4b23      	ldr	r3, [pc, #140]	; (8000de4 <cortex_m3_soc_init+0xc8>)
 8000d58:	6018      	str	r0, [r3, #0]
 8000d5a:	f3bf 8f4f 	dsb	sy
 8000d5e:	f3bf 8f6f 	isb	sy
 8000d62:	f5a3 73e6 	sub.w	r3, r3, #460	; 0x1cc
 8000d66:	6018      	str	r0, [r3, #0]
 8000d68:	f3bf 8f4f 	dsb	sy
 8000d6c:	3b04      	subs	r3, #4
 8000d6e:	681b      	ldr	r3, [r3, #0]
 8000d70:	f3c3 3c4e 	ubfx	ip, r3, #13, #15
 8000d74:	f3c3 05c9 	ubfx	r5, r3, #3, #10
 8000d78:	fab5 f285 	clz	r2, r5
 8000d7c:	2401      	movs	r4, #1
 8000d7e:	4607      	mov	r7, r0
 8000d80:	f003 0e07 	and.w	lr, r3, #7
 8000d84:	f10e 0e04 	add.w	lr, lr, #4
 8000d88:	4e17      	ldr	r6, [pc, #92]	; (8000de8 <cortex_m3_soc_init+0xcc>)
 8000d8a:	fa04 fe0e 	lsl.w	lr, r4, lr
 8000d8e:	4094      	lsls	r4, r2
 8000d90:	2300      	movs	r3, #0
 8000d92:	461a      	mov	r2, r3
 8000d94:	3201      	adds	r2, #1
 8000d96:	ea40 0103 	orr.w	r1, r0, r3
 8000d9a:	4295      	cmp	r5, r2
 8000d9c:	6031      	str	r1, [r6, #0]
 8000d9e:	4423      	add	r3, r4
 8000da0:	d2f8      	bcs.n	8000d94 <cortex_m3_soc_init+0x78>
 8000da2:	3701      	adds	r7, #1
 8000da4:	45bc      	cmp	ip, r7
 8000da6:	4470      	add	r0, lr
 8000da8:	d2f2      	bcs.n	8000d90 <cortex_m3_soc_init+0x74>
 8000daa:	f3bf 8f4f 	dsb	sy
 8000dae:	f3bf 8f6f 	isb	sy
 8000db2:	4a0e      	ldr	r2, [pc, #56]	; (8000dec <cortex_m3_soc_init+0xd0>)
 8000db4:	6813      	ldr	r3, [r2, #0]
 8000db6:	f443 3340 	orr.w	r3, r3, #196608	; 0x30000
 8000dba:	6013      	str	r3, [r2, #0]
 8000dbc:	f3bf 8f4f 	dsb	sy
 8000dc0:	f3bf 8f6f 	isb	sy
 8000dc4:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000dc6:	bf00      	nop
 8000dc8:	0300003f 	.word	0x0300003f
 8000dcc:	030b0031 	.word	0x030b0031
 8000dd0:	60000011 	.word	0x60000011
 8000dd4:	03080027 	.word	0x03080027
 8000dd8:	60700012 	.word	0x60700012
 8000ddc:	030b0027 	.word	0x030b0027
 8000de0:	08000013 	.word	0x08000013
 8000de4:	e000ef50 	.word	0xe000ef50
 8000de8:	e000ef60 	.word	0xe000ef60
 8000dec:	e000ed14 	.word	0xe000ed14

08000df0 <display_dram_config>:
 8000df0:	b510      	push	{r4, lr}
 8000df2:	f8d8 3000 	ldr.w	r3, [r8]
 8000df6:	4805      	ldr	r0, [pc, #20]	; (8000e0c <display_dram_config+0x1c>)
 8000df8:	699c      	ldr	r4, [r3, #24]
 8000dfa:	f004 faa1 	bl	8005340 <puts>
 8000dfe:	4620      	mov	r0, r4
 8000e00:	4903      	ldr	r1, [pc, #12]	; (8000e10 <display_dram_config+0x20>)
 8000e02:	f006 ffd9 	bl	8007db8 <print_size>
 8000e06:	2000      	movs	r0, #0
 8000e08:	bd10      	pop	{r4, pc}
 8000e0a:	bf00      	nop
 8000e0c:	0800c418 	.word	0x0800c418
 8000e10:	0800dcc4 	.word	0x0800dcc4

08000e14 <display_banner>:
 8000e14:	b508      	push	{r3, lr}
 8000e16:	4903      	ldr	r1, [pc, #12]	; (8000e24 <display_banner+0x10>)
 8000e18:	4803      	ldr	r0, [pc, #12]	; (8000e28 <display_banner+0x14>)
 8000e1a:	f004 fa9d 	bl	8005358 <printf>
 8000e1e:	2000      	movs	r0, #0
 8000e20:	bd08      	pop	{r3, pc}
 8000e22:	bf00      	nop
 8000e24:	0800c3e0 	.word	0x0800c3e0
 8000e28:	0800c420 	.word	0x0800c420

08000e2c <init_baudrate>:
 8000e2c:	b530      	push	{r4, r5, lr}
 8000e2e:	b091      	sub	sp, #68	; 0x44
 8000e30:	4669      	mov	r1, sp
 8000e32:	2240      	movs	r2, #64	; 0x40
 8000e34:	480b      	ldr	r0, [pc, #44]	; (8000e64 <init_baudrate+0x38>)
 8000e36:	f004 f86d 	bl	8004f14 <getenv_r>
 8000e3a:	2800      	cmp	r0, #0
 8000e3c:	4644      	mov	r4, r8
 8000e3e:	f8d8 5000 	ldr.w	r5, [r8]
 8000e42:	dd0a      	ble.n	8000e5a <init_baudrate+0x2e>
 8000e44:	4668      	mov	r0, sp
 8000e46:	220a      	movs	r2, #10
 8000e48:	2100      	movs	r1, #0
 8000e4a:	f007 fd45 	bl	80088d8 <simple_strtoul>
 8000e4e:	4603      	mov	r3, r0
 8000e50:	60a0      	str	r0, [r4, #8]
 8000e52:	2000      	movs	r0, #0
 8000e54:	602b      	str	r3, [r5, #0]
 8000e56:	b011      	add	sp, #68	; 0x44
 8000e58:	bd30      	pop	{r4, r5, pc}
 8000e5a:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8000e5e:	4618      	mov	r0, r3
 8000e60:	e7f6      	b.n	8000e50 <init_baudrate+0x24>
 8000e62:	bf00      	nop
 8000e64:	0800c428 	.word	0x0800c428

08000e68 <__coloured_LED_init>:
 8000e68:	4770      	bx	lr
 8000e6a:	bf00      	nop

08000e6c <__red_LED_on>:
 8000e6c:	4770      	bx	lr
 8000e6e:	bf00      	nop

08000e70 <__red_LED_off>:
 8000e70:	4770      	bx	lr
 8000e72:	bf00      	nop

08000e74 <__green_LED_on>:
 8000e74:	4770      	bx	lr
 8000e76:	bf00      	nop

08000e78 <__green_LED_off>:
 8000e78:	4770      	bx	lr
 8000e7a:	bf00      	nop

08000e7c <__yellow_LED_on>:
 8000e7c:	4770      	bx	lr
 8000e7e:	bf00      	nop

08000e80 <__yellow_LED_off>:
 8000e80:	4770      	bx	lr
 8000e82:	bf00      	nop

08000e84 <__blue_LED_on>:
 8000e84:	4770      	bx	lr
 8000e86:	bf00      	nop

08000e88 <__blue_LED_off>:
 8000e88:	4770      	bx	lr
 8000e8a:	bf00      	nop

08000e8c <hang>:
 8000e8c:	b508      	push	{r3, lr}
 8000e8e:	4802      	ldr	r0, [pc, #8]	; (8000e98 <hang+0xc>)
 8000e90:	f004 fa56 	bl	8005340 <puts>
 8000e94:	e7fe      	b.n	8000e94 <hang+0x8>
 8000e96:	bf00      	nop
 8000e98:	0800c434 	.word	0x0800c434

08000e9c <start_armboot>:
 8000e9c:	b570      	push	{r4, r5, r6, lr}
 8000e9e:	4d31      	ldr	r5, [pc, #196]	; (8000f64 <start_armboot+0xc8>)
 8000ea0:	682b      	ldr	r3, [r5, #0]
 8000ea2:	f5a3 4880 	sub.w	r8, r3, #16384	; 0x4000
 8000ea6:	f1a8 0820 	sub.w	r8, r8, #32
 8000eaa:	2220      	movs	r2, #32
 8000eac:	2100      	movs	r1, #0
 8000eae:	4640      	mov	r0, r8
 8000eb0:	f7ff fc0e 	bl	80006d0 <memset>
 8000eb4:	f1a8 021c 	sub.w	r2, r8, #28
 8000eb8:	f8c8 2000 	str.w	r2, [r8]
 8000ebc:	2100      	movs	r1, #0
 8000ebe:	221c      	movs	r2, #28
 8000ec0:	f8d8 0000 	ldr.w	r0, [r8]
 8000ec4:	f7ff fc04 	bl	80006d0 <memset>
 8000ec8:	4a27      	ldr	r2, [pc, #156]	; (8000f68 <start_armboot+0xcc>)
 8000eca:	682b      	ldr	r3, [r5, #0]
 8000ecc:	6811      	ldr	r1, [r2, #0]
 8000ece:	4c27      	ldr	r4, [pc, #156]	; (8000f6c <start_armboot+0xd0>)
 8000ed0:	f8d8 2004 	ldr.w	r2, [r8, #4]
 8000ed4:	1ac9      	subs	r1, r1, r3
 8000ed6:	4e26      	ldr	r6, [pc, #152]	; (8000f70 <start_armboot+0xd4>)
 8000ed8:	6823      	ldr	r3, [r4, #0]
 8000eda:	f042 0201 	orr.w	r2, r2, #1
 8000ede:	6031      	str	r1, [r6, #0]
 8000ee0:	f8c8 2004 	str.w	r2, [r8, #4]
 8000ee4:	b91b      	cbnz	r3, 8000eee <start_armboot+0x52>
 8000ee6:	e007      	b.n	8000ef8 <start_armboot+0x5c>
 8000ee8:	f854 3f04 	ldr.w	r3, [r4, #4]!
 8000eec:	b123      	cbz	r3, 8000ef8 <start_armboot+0x5c>
 8000eee:	4798      	blx	r3
 8000ef0:	2800      	cmp	r0, #0
 8000ef2:	d0f9      	beq.n	8000ee8 <start_armboot+0x4c>
 8000ef4:	f7ff ffca 	bl	8000e8c <hang>
 8000ef8:	6828      	ldr	r0, [r5, #0]
 8000efa:	f44f 4180 	mov.w	r1, #16384	; 0x4000
 8000efe:	f5a0 4080 	sub.w	r0, r0, #16384	; 0x4000
 8000f02:	f004 fb8b 	bl	800561c <mem_malloc_init>
 8000f06:	f005 fa1f 	bl	8006348 <env_relocate>
 8000f0a:	481a      	ldr	r0, [pc, #104]	; (8000f74 <start_armboot+0xd8>)
 8000f0c:	f8d8 4000 	ldr.w	r4, [r8]
 8000f10:	f003 ffe0 	bl	8004ed4 <getenv>
 8000f14:	f007 fa90 	bl	8008438 <string_to_ip>
 8000f18:	6060      	str	r0, [r4, #4]
 8000f1a:	f006 fa69 	bl	80073f0 <stdio_init>
 8000f1e:	f005 faa5 	bl	800646c <jumptable_init>
 8000f22:	f004 fad7 	bl	80054d4 <console_init_r>
 8000f26:	f000 f831 	bl	8000f8c <enable_interrupts>
 8000f2a:	4813      	ldr	r0, [pc, #76]	; (8000f78 <start_armboot+0xdc>)
 8000f2c:	f003 ffd2 	bl	8004ed4 <getenv>
 8000f30:	b128      	cbz	r0, 8000f3e <start_armboot+0xa2>
 8000f32:	2210      	movs	r2, #16
 8000f34:	2100      	movs	r1, #0
 8000f36:	f007 fccf 	bl	80088d8 <simple_strtoul>
 8000f3a:	4b10      	ldr	r3, [pc, #64]	; (8000f7c <start_armboot+0xe0>)
 8000f3c:	6018      	str	r0, [r3, #0]
 8000f3e:	4810      	ldr	r0, [pc, #64]	; (8000f80 <start_armboot+0xe4>)
 8000f40:	f003 ffc8 	bl	8004ed4 <getenv>
 8000f44:	4601      	mov	r1, r0
 8000f46:	b118      	cbz	r0, 8000f50 <start_armboot+0xb4>
 8000f48:	2280      	movs	r2, #128	; 0x80
 8000f4a:	480e      	ldr	r0, [pc, #56]	; (8000f84 <start_armboot+0xe8>)
 8000f4c:	f000 ff9c 	bl	8001e88 <copy_filename>
 8000f50:	480d      	ldr	r0, [pc, #52]	; (8000f88 <start_armboot+0xec>)
 8000f52:	f004 f9f5 	bl	8005340 <puts>
 8000f56:	f8d8 0000 	ldr.w	r0, [r8]
 8000f5a:	f000 fa09 	bl	8001370 <eth_initialize>
 8000f5e:	f006 f93f 	bl	80071e0 <main_loop>
 8000f62:	e7fc      	b.n	8000f5e <start_armboot+0xc2>
 8000f64:	20000cb8 	.word	0x20000cb8
 8000f68:	20000cb8 	.word	0x20000cb8
 8000f6c:	20000000 	.word	0x20000000
 8000f70:	20000ce4 	.word	0x20000ce4
 8000f74:	0800c460 	.word	0x0800c460
 8000f78:	0800c468 	.word	0x0800c468
 8000f7c:	20000058 	.word	0x20000058
 8000f80:	0800c474 	.word	0x0800c474
 8000f84:	200031cc 	.word	0x200031cc
 8000f88:	0800c480 	.word	0x0800c480

08000f8c <enable_interrupts>:
 8000f8c:	4770      	bx	lr
 8000f8e:	bf00      	nop

08000f90 <disable_interrupts>:
 8000f90:	2000      	movs	r0, #0
 8000f92:	4770      	bx	lr

08000f94 <bad_mode>:
 8000f94:	b510      	push	{r4, lr}
 8000f96:	4804      	ldr	r0, [pc, #16]	; (8000fa8 <bad_mode+0x14>)
 8000f98:	f008 f9a4 	bl	80092e4 <panic>
 8000f9c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000fa0:	2000      	movs	r0, #0
 8000fa2:	4b02      	ldr	r3, [pc, #8]	; (8000fac <bad_mode+0x18>)
 8000fa4:	4718      	bx	r3
 8000fa6:	bf00      	nop
 8000fa8:	0800c508 	.word	0x0800c508
 8000fac:	20000add 	.word	0x20000add

08000fb0 <show_regs>:
 8000fb0:	b530      	push	{r4, r5, lr}
 8000fb2:	4604      	mov	r4, r0
 8000fb4:	b0a3      	sub	sp, #140	; 0x8c
 8000fb6:	2280      	movs	r2, #128	; 0x80
 8000fb8:	492a      	ldr	r1, [pc, #168]	; (8001064 <show_regs+0xb4>)
 8000fba:	a802      	add	r0, sp, #8
 8000fbc:	f7ff fbc8 	bl	8000750 <memcpy>
 8000fc0:	6ae5      	ldr	r5, [r4, #44]	; 0x2c
 8000fc2:	6b20      	ldr	r0, [r4, #48]	; 0x30
 8000fc4:	6b63      	ldr	r3, [r4, #52]	; 0x34
 8000fc6:	6ba2      	ldr	r2, [r4, #56]	; 0x38
 8000fc8:	6be1      	ldr	r1, [r4, #60]	; 0x3c
 8000fca:	e88d 0021 	stmia.w	sp, {r0, r5}
 8000fce:	4826      	ldr	r0, [pc, #152]	; (8001068 <show_regs+0xb8>)
 8000fd0:	6c25      	ldr	r5, [r4, #64]	; 0x40
 8000fd2:	f004 f9c1 	bl	8005358 <printf>
 8000fd6:	6a23      	ldr	r3, [r4, #32]
 8000fd8:	6a62      	ldr	r2, [r4, #36]	; 0x24
 8000fda:	6aa1      	ldr	r1, [r4, #40]	; 0x28
 8000fdc:	4823      	ldr	r0, [pc, #140]	; (800106c <show_regs+0xbc>)
 8000fde:	f004 f9bb 	bl	8005358 <printf>
 8000fe2:	6920      	ldr	r0, [r4, #16]
 8000fe4:	6963      	ldr	r3, [r4, #20]
 8000fe6:	69a2      	ldr	r2, [r4, #24]
 8000fe8:	69e1      	ldr	r1, [r4, #28]
 8000fea:	9000      	str	r0, [sp, #0]
 8000fec:	4820      	ldr	r0, [pc, #128]	; (8001070 <show_regs+0xc0>)
 8000fee:	f004 f9b3 	bl	8005358 <printf>
 8000ff2:	6820      	ldr	r0, [r4, #0]
 8000ff4:	68e1      	ldr	r1, [r4, #12]
 8000ff6:	6863      	ldr	r3, [r4, #4]
 8000ff8:	68a2      	ldr	r2, [r4, #8]
 8000ffa:	9000      	str	r0, [sp, #0]
 8000ffc:	481d      	ldr	r0, [pc, #116]	; (8001074 <show_regs+0xc4>)
 8000ffe:	f004 f9ab 	bl	8005358 <printf>
 8001002:	2d00      	cmp	r5, #0
 8001004:	bfb4      	ite	lt
 8001006:	214e      	movlt	r1, #78	; 0x4e
 8001008:	216e      	movge	r1, #110	; 0x6e
 800100a:	f015 4f80 	tst.w	r5, #1073741824	; 0x40000000
 800100e:	bf14      	ite	ne
 8001010:	225a      	movne	r2, #90	; 0x5a
 8001012:	227a      	moveq	r2, #122	; 0x7a
 8001014:	f015 5f00 	tst.w	r5, #536870912	; 0x20000000
 8001018:	bf14      	ite	ne
 800101a:	2343      	movne	r3, #67	; 0x43
 800101c:	2363      	moveq	r3, #99	; 0x63
 800101e:	f015 5f80 	tst.w	r5, #268435456	; 0x10000000
 8001022:	bf14      	ite	ne
 8001024:	2056      	movne	r0, #86	; 0x56
 8001026:	2076      	moveq	r0, #118	; 0x76
 8001028:	9000      	str	r0, [sp, #0]
 800102a:	4813      	ldr	r0, [pc, #76]	; (8001078 <show_regs+0xc8>)
 800102c:	f004 f994 	bl	8005358 <printf>
 8001030:	6c20      	ldr	r0, [r4, #64]	; 0x40
 8001032:	4a12      	ldr	r2, [pc, #72]	; (800107c <show_regs+0xcc>)
 8001034:	4c12      	ldr	r4, [pc, #72]	; (8001080 <show_regs+0xd0>)
 8001036:	ad22      	add	r5, sp, #136	; 0x88
 8001038:	f000 031f 	and.w	r3, r0, #31
 800103c:	f010 0f80 	tst.w	r0, #128	; 0x80
 8001040:	eb05 0383 	add.w	r3, r5, r3, lsl #2
 8001044:	4d0f      	ldr	r5, [pc, #60]	; (8001084 <show_regs+0xd4>)
 8001046:	bf0c      	ite	eq
 8001048:	4621      	moveq	r1, r4
 800104a:	4611      	movne	r1, r2
 800104c:	f010 0f40 	tst.w	r0, #64	; 0x40
 8001050:	f853 3c80 	ldr.w	r3, [r3, #-128]
 8001054:	bf08      	it	eq
 8001056:	4622      	moveq	r2, r4
 8001058:	9500      	str	r5, [sp, #0]
 800105a:	480b      	ldr	r0, [pc, #44]	; (8001088 <show_regs+0xd8>)
 800105c:	f004 f97c 	bl	8005358 <printf>
 8001060:	b023      	add	sp, #140	; 0x8c
 8001062:	bd30      	pop	{r4, r5, pc}
 8001064:	0800c488 	.word	0x0800c488
 8001068:	0800c524 	.word	0x0800c524
 800106c:	0800c56c 	.word	0x0800c56c
 8001070:	0800c590 	.word	0x0800c590
 8001074:	0800c5c0 	.word	0x0800c5c0
 8001078:	0800c5f0 	.word	0x0800c5f0
 800107c:	0800c520 	.word	0x0800c520
 8001080:	0800c51c 	.word	0x0800c51c
 8001084:	0800d63c 	.word	0x0800d63c
 8001088:	0800c600 	.word	0x0800c600

0800108c <do_undefined_instruction>:
 800108c:	b510      	push	{r4, lr}
 800108e:	4604      	mov	r4, r0
 8001090:	4806      	ldr	r0, [pc, #24]	; (80010ac <do_undefined_instruction+0x20>)
 8001092:	f004 f961 	bl	8005358 <printf>
 8001096:	4620      	mov	r0, r4
 8001098:	f7ff ff8a 	bl	8000fb0 <show_regs>
 800109c:	4804      	ldr	r0, [pc, #16]	; (80010b0 <do_undefined_instruction+0x24>)
 800109e:	f008 f921 	bl	80092e4 <panic>
 80010a2:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80010a6:	2000      	movs	r0, #0
 80010a8:	4b02      	ldr	r3, [pc, #8]	; (80010b4 <do_undefined_instruction+0x28>)
 80010aa:	4718      	bx	r3
 80010ac:	0800c620 	.word	0x0800c620
 80010b0:	0800c508 	.word	0x0800c508
 80010b4:	20000add 	.word	0x20000add

080010b8 <do_software_interrupt>:
 80010b8:	b510      	push	{r4, lr}
 80010ba:	4604      	mov	r4, r0
 80010bc:	4806      	ldr	r0, [pc, #24]	; (80010d8 <do_software_interrupt+0x20>)
 80010be:	f004 f94b 	bl	8005358 <printf>
 80010c2:	4620      	mov	r0, r4
 80010c4:	f7ff ff74 	bl	8000fb0 <show_regs>
 80010c8:	4804      	ldr	r0, [pc, #16]	; (80010dc <do_software_interrupt+0x24>)
 80010ca:	f008 f90b 	bl	80092e4 <panic>
 80010ce:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80010d2:	2000      	movs	r0, #0
 80010d4:	4b02      	ldr	r3, [pc, #8]	; (80010e0 <do_software_interrupt+0x28>)
 80010d6:	4718      	bx	r3
 80010d8:	0800c638 	.word	0x0800c638
 80010dc:	0800c508 	.word	0x0800c508
 80010e0:	20000add 	.word	0x20000add

080010e4 <do_prefetch_abort>:
 80010e4:	b510      	push	{r4, lr}
 80010e6:	4604      	mov	r4, r0
 80010e8:	4806      	ldr	r0, [pc, #24]	; (8001104 <do_prefetch_abort+0x20>)
 80010ea:	f004 f935 	bl	8005358 <printf>
 80010ee:	4620      	mov	r0, r4
 80010f0:	f7ff ff5e 	bl	8000fb0 <show_regs>
 80010f4:	4804      	ldr	r0, [pc, #16]	; (8001108 <do_prefetch_abort+0x24>)
 80010f6:	f008 f8f5 	bl	80092e4 <panic>
 80010fa:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80010fe:	2000      	movs	r0, #0
 8001100:	4b02      	ldr	r3, [pc, #8]	; (800110c <do_prefetch_abort+0x28>)
 8001102:	4718      	bx	r3
 8001104:	0800c64c 	.word	0x0800c64c
 8001108:	0800c508 	.word	0x0800c508
 800110c:	20000add 	.word	0x20000add

08001110 <do_data_abort>:
 8001110:	b510      	push	{r4, lr}
 8001112:	4604      	mov	r4, r0
 8001114:	4806      	ldr	r0, [pc, #24]	; (8001130 <do_data_abort+0x20>)
 8001116:	f004 f91f 	bl	8005358 <printf>
 800111a:	4620      	mov	r0, r4
 800111c:	f7ff ff48 	bl	8000fb0 <show_regs>
 8001120:	4804      	ldr	r0, [pc, #16]	; (8001134 <do_data_abort+0x24>)
 8001122:	f008 f8df 	bl	80092e4 <panic>
 8001126:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800112a:	2000      	movs	r0, #0
 800112c:	4b02      	ldr	r3, [pc, #8]	; (8001138 <do_data_abort+0x28>)
 800112e:	4718      	bx	r3
 8001130:	0800c65c 	.word	0x0800c65c
 8001134:	0800c508 	.word	0x0800c508
 8001138:	20000add 	.word	0x20000add

0800113c <do_not_used>:
 800113c:	b510      	push	{r4, lr}
 800113e:	4604      	mov	r4, r0
 8001140:	4806      	ldr	r0, [pc, #24]	; (800115c <do_not_used+0x20>)
 8001142:	f004 f909 	bl	8005358 <printf>
 8001146:	4620      	mov	r0, r4
 8001148:	f7ff ff32 	bl	8000fb0 <show_regs>
 800114c:	4804      	ldr	r0, [pc, #16]	; (8001160 <do_not_used+0x24>)
 800114e:	f008 f8c9 	bl	80092e4 <panic>
 8001152:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8001156:	2000      	movs	r0, #0
 8001158:	4b02      	ldr	r3, [pc, #8]	; (8001164 <do_not_used+0x28>)
 800115a:	4718      	bx	r3
 800115c:	0800c668 	.word	0x0800c668
 8001160:	0800c508 	.word	0x0800c508
 8001164:	20000add 	.word	0x20000add

08001168 <do_fiq>:
 8001168:	b510      	push	{r4, lr}
 800116a:	4604      	mov	r4, r0
 800116c:	4806      	ldr	r0, [pc, #24]	; (8001188 <do_fiq+0x20>)
 800116e:	f004 f8f3 	bl	8005358 <printf>
 8001172:	4620      	mov	r0, r4
 8001174:	f7ff ff1c 	bl	8000fb0 <show_regs>
 8001178:	4804      	ldr	r0, [pc, #16]	; (800118c <do_fiq+0x24>)
 800117a:	f008 f8b3 	bl	80092e4 <panic>
 800117e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8001182:	2000      	movs	r0, #0
 8001184:	4b02      	ldr	r3, [pc, #8]	; (8001190 <do_fiq+0x28>)
 8001186:	4718      	bx	r3
 8001188:	0800c674 	.word	0x0800c674
 800118c:	0800c508 	.word	0x0800c508
 8001190:	20000add 	.word	0x20000add

08001194 <do_irq>:
 8001194:	b510      	push	{r4, lr}
 8001196:	4604      	mov	r4, r0
 8001198:	4806      	ldr	r0, [pc, #24]	; (80011b4 <do_irq+0x20>)
 800119a:	f004 f8dd 	bl	8005358 <printf>
 800119e:	4620      	mov	r0, r4
 80011a0:	f7ff ff06 	bl	8000fb0 <show_regs>
 80011a4:	4804      	ldr	r0, [pc, #16]	; (80011b8 <do_irq+0x24>)
 80011a6:	f008 f89d 	bl	80092e4 <panic>
 80011aa:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80011ae:	2000      	movs	r0, #0
 80011b0:	4b02      	ldr	r3, [pc, #8]	; (80011bc <do_irq+0x28>)
 80011b2:	4718      	bx	r3
 80011b4:	0800c68c 	.word	0x0800c68c
 80011b8:	0800c508 	.word	0x0800c508
 80011bc:	20000add 	.word	0x20000add

080011c0 <eth_parse_enetaddr>:
 80011c0:	b570      	push	{r4, r5, r6, lr}
 80011c2:	460e      	mov	r6, r1
 80011c4:	460d      	mov	r5, r1
 80011c6:	2400      	movs	r4, #0
 80011c8:	b082      	sub	sp, #8
 80011ca:	b180      	cbz	r0, 80011ee <eth_parse_enetaddr+0x2e>
 80011cc:	2210      	movs	r2, #16
 80011ce:	a901      	add	r1, sp, #4
 80011d0:	f007 fb82 	bl	80088d8 <simple_strtoul>
 80011d4:	9b01      	ldr	r3, [sp, #4]
 80011d6:	f805 0b01 	strb.w	r0, [r5], #1
 80011da:	f993 2000 	ldrsb.w	r2, [r3]
 80011de:	1c58      	adds	r0, r3, #1
 80011e0:	b902      	cbnz	r2, 80011e4 <eth_parse_enetaddr+0x24>
 80011e2:	4618      	mov	r0, r3
 80011e4:	3401      	adds	r4, #1
 80011e6:	2c06      	cmp	r4, #6
 80011e8:	d1ef      	bne.n	80011ca <eth_parse_enetaddr+0xa>
 80011ea:	b002      	add	sp, #8
 80011ec:	bd70      	pop	{r4, r5, r6, pc}
 80011ee:	2c05      	cmp	r4, #5
 80011f0:	7028      	strb	r0, [r5, #0]
 80011f2:	d0fa      	beq.n	80011ea <eth_parse_enetaddr+0x2a>
 80011f4:	4434      	add	r4, r6
 80011f6:	3605      	adds	r6, #5
 80011f8:	f804 0f01 	strb.w	r0, [r4, #1]!
 80011fc:	42a6      	cmp	r6, r4
 80011fe:	d1fb      	bne.n	80011f8 <eth_parse_enetaddr+0x38>
 8001200:	b002      	add	sp, #8
 8001202:	bd70      	pop	{r4, r5, r6, pc}

08001204 <eth_getenv_enetaddr>:
 8001204:	b510      	push	{r4, lr}
 8001206:	460c      	mov	r4, r1
 8001208:	f003 fe64 	bl	8004ed4 <getenv>
 800120c:	4621      	mov	r1, r4
 800120e:	f7ff ffd7 	bl	80011c0 <eth_parse_enetaddr>
 8001212:	7823      	ldrb	r3, [r4, #0]
 8001214:	07da      	lsls	r2, r3, #31
 8001216:	d40d      	bmi.n	8001234 <eth_getenv_enetaddr+0x30>
 8001218:	7862      	ldrb	r2, [r4, #1]
 800121a:	78a1      	ldrb	r1, [r4, #2]
 800121c:	4313      	orrs	r3, r2
 800121e:	78e2      	ldrb	r2, [r4, #3]
 8001220:	430b      	orrs	r3, r1
 8001222:	7921      	ldrb	r1, [r4, #4]
 8001224:	4313      	orrs	r3, r2
 8001226:	7962      	ldrb	r2, [r4, #5]
 8001228:	430b      	orrs	r3, r1
 800122a:	4313      	orrs	r3, r2
 800122c:	bf14      	ite	ne
 800122e:	2001      	movne	r0, #1
 8001230:	2000      	moveq	r0, #0
 8001232:	bd10      	pop	{r4, pc}
 8001234:	2000      	movs	r0, #0
 8001236:	bd10      	pop	{r4, pc}

08001238 <eth_setenv_enetaddr>:
 8001238:	b510      	push	{r4, lr}
 800123a:	4604      	mov	r4, r0
 800123c:	b086      	sub	sp, #24
 800123e:	460a      	mov	r2, r1
 8001240:	a801      	add	r0, sp, #4
 8001242:	4904      	ldr	r1, [pc, #16]	; (8001254 <eth_setenv_enetaddr+0x1c>)
 8001244:	f008 f83e 	bl	80092c4 <sprintf>
 8001248:	a901      	add	r1, sp, #4
 800124a:	4620      	mov	r0, r4
 800124c:	f003 fe14 	bl	8004e78 <setenv>
 8001250:	b006      	add	sp, #24
 8001252:	bd10      	pop	{r4, pc}
 8001254:	0800c7a8 	.word	0x0800c7a8

08001258 <eth_getenv_enetaddr_by_index>:
 8001258:	b530      	push	{r4, r5, lr}
 800125a:	460c      	mov	r4, r1
 800125c:	4b08      	ldr	r3, [pc, #32]	; (8001280 <eth_getenv_enetaddr_by_index+0x28>)
 800125e:	4d09      	ldr	r5, [pc, #36]	; (8001284 <eth_getenv_enetaddr_by_index+0x2c>)
 8001260:	b089      	sub	sp, #36	; 0x24
 8001262:	2800      	cmp	r0, #0
 8001264:	bf14      	ite	ne
 8001266:	4629      	movne	r1, r5
 8001268:	4619      	moveq	r1, r3
 800126a:	4602      	mov	r2, r0
 800126c:	4668      	mov	r0, sp
 800126e:	f008 f829 	bl	80092c4 <sprintf>
 8001272:	4621      	mov	r1, r4
 8001274:	4668      	mov	r0, sp
 8001276:	f7ff ffc5 	bl	8001204 <eth_getenv_enetaddr>
 800127a:	b009      	add	sp, #36	; 0x24
 800127c:	bd30      	pop	{r4, r5, pc}
 800127e:	bf00      	nop
 8001280:	0800c7b8 	.word	0x0800c7b8
 8001284:	0800c7ac 	.word	0x0800c7ac

08001288 <cpu_eth_init>:
 8001288:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 800128c:	4770      	bx	lr
 800128e:	bf00      	nop

08001290 <eth_get_dev>:
 8001290:	4b01      	ldr	r3, [pc, #4]	; (8001298 <eth_get_dev+0x8>)
 8001292:	6818      	ldr	r0, [r3, #0]
 8001294:	4770      	bx	lr
 8001296:	bf00      	nop
 8001298:	20000ce8 	.word	0x20000ce8

0800129c <eth_get_dev_by_name>:
 800129c:	b570      	push	{r4, r5, r6, lr}
 800129e:	4d0a      	ldr	r5, [pc, #40]	; (80012c8 <eth_get_dev_by_name+0x2c>)
 80012a0:	4606      	mov	r6, r0
 80012a2:	686c      	ldr	r4, [r5, #4]
 80012a4:	b924      	cbnz	r4, 80012b0 <eth_get_dev_by_name+0x14>
 80012a6:	e00b      	b.n	80012c0 <eth_get_dev_by_name+0x24>
 80012a8:	6b24      	ldr	r4, [r4, #48]	; 0x30
 80012aa:	686b      	ldr	r3, [r5, #4]
 80012ac:	429c      	cmp	r4, r3
 80012ae:	d007      	beq.n	80012c0 <eth_get_dev_by_name+0x24>
 80012b0:	4621      	mov	r1, r4
 80012b2:	4630      	mov	r0, r6
 80012b4:	f7ff f8a8 	bl	8000408 <strcmp>
 80012b8:	2800      	cmp	r0, #0
 80012ba:	d1f5      	bne.n	80012a8 <eth_get_dev_by_name+0xc>
 80012bc:	4620      	mov	r0, r4
 80012be:	bd70      	pop	{r4, r5, r6, pc}
 80012c0:	2400      	movs	r4, #0
 80012c2:	4620      	mov	r0, r4
 80012c4:	bd70      	pop	{r4, r5, r6, pc}
 80012c6:	bf00      	nop
 80012c8:	20000ce8 	.word	0x20000ce8

080012cc <eth_get_dev_by_index>:
 80012cc:	4b0b      	ldr	r3, [pc, #44]	; (80012fc <eth_get_dev_by_index+0x30>)
 80012ce:	6859      	ldr	r1, [r3, #4]
 80012d0:	b191      	cbz	r1, 80012f8 <eth_get_dev_by_index+0x2c>
 80012d2:	b188      	cbz	r0, 80012f8 <eth_get_dev_by_index+0x2c>
 80012d4:	6b0b      	ldr	r3, [r1, #48]	; 0x30
 80012d6:	4299      	cmp	r1, r3
 80012d8:	bf18      	it	ne
 80012da:	2201      	movne	r2, #1
 80012dc:	d103      	bne.n	80012e6 <eth_get_dev_by_index+0x1a>
 80012de:	e008      	b.n	80012f2 <eth_get_dev_by_index+0x26>
 80012e0:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 80012e2:	4299      	cmp	r1, r3
 80012e4:	d005      	beq.n	80012f2 <eth_get_dev_by_index+0x26>
 80012e6:	4290      	cmp	r0, r2
 80012e8:	f102 0201 	add.w	r2, r2, #1
 80012ec:	d1f8      	bne.n	80012e0 <eth_get_dev_by_index+0x14>
 80012ee:	4618      	mov	r0, r3
 80012f0:	4770      	bx	lr
 80012f2:	2300      	movs	r3, #0
 80012f4:	4618      	mov	r0, r3
 80012f6:	4770      	bx	lr
 80012f8:	460b      	mov	r3, r1
 80012fa:	e7f8      	b.n	80012ee <eth_get_dev_by_index+0x22>
 80012fc:	20000ce8 	.word	0x20000ce8

08001300 <eth_get_dev_index>:
 8001300:	4a07      	ldr	r2, [pc, #28]	; (8001320 <eth_get_dev_index+0x20>)
 8001302:	6853      	ldr	r3, [r2, #4]
 8001304:	b14b      	cbz	r3, 800131a <eth_get_dev_index+0x1a>
 8001306:	2000      	movs	r0, #0
 8001308:	6812      	ldr	r2, [r2, #0]
 800130a:	429a      	cmp	r2, r3
 800130c:	d007      	beq.n	800131e <eth_get_dev_index+0x1e>
 800130e:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8001310:	3001      	adds	r0, #1
 8001312:	2b00      	cmp	r3, #0
 8001314:	d1f9      	bne.n	800130a <eth_get_dev_index+0xa>
 8001316:	4618      	mov	r0, r3
 8001318:	4770      	bx	lr
 800131a:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 800131e:	4770      	bx	lr
 8001320:	20000ce8 	.word	0x20000ce8

08001324 <eth_register>:
 8001324:	b538      	push	{r3, r4, r5, lr}
 8001326:	4d10      	ldr	r5, [pc, #64]	; (8001368 <eth_register+0x44>)
 8001328:	4604      	mov	r4, r0
 800132a:	6869      	ldr	r1, [r5, #4]
 800132c:	460a      	mov	r2, r1
 800132e:	b909      	cbnz	r1, 8001334 <eth_register+0x10>
 8001330:	e008      	b.n	8001344 <eth_register+0x20>
 8001332:	461a      	mov	r2, r3
 8001334:	6b13      	ldr	r3, [r2, #48]	; 0x30
 8001336:	4299      	cmp	r1, r3
 8001338:	d1fb      	bne.n	8001332 <eth_register+0xe>
 800133a:	6314      	str	r4, [r2, #48]	; 0x30
 800133c:	2000      	movs	r0, #0
 800133e:	6323      	str	r3, [r4, #48]	; 0x30
 8001340:	61e0      	str	r0, [r4, #28]
 8001342:	bd38      	pop	{r3, r4, r5, pc}
 8001344:	4809      	ldr	r0, [pc, #36]	; (800136c <eth_register+0x48>)
 8001346:	606c      	str	r4, [r5, #4]
 8001348:	602c      	str	r4, [r5, #0]
 800134a:	f003 fdc3 	bl	8004ed4 <getenv>
 800134e:	b118      	cbz	r0, 8001358 <eth_register+0x34>
 8001350:	6829      	ldr	r1, [r5, #0]
 8001352:	f7ff f859 	bl	8000408 <strcmp>
 8001356:	b128      	cbz	r0, 8001364 <eth_register+0x40>
 8001358:	6829      	ldr	r1, [r5, #0]
 800135a:	4804      	ldr	r0, [pc, #16]	; (800136c <eth_register+0x48>)
 800135c:	f003 fd8c 	bl	8004e78 <setenv>
 8001360:	686b      	ldr	r3, [r5, #4]
 8001362:	e7eb      	b.n	800133c <eth_register+0x18>
 8001364:	686b      	ldr	r3, [r5, #4]
 8001366:	e7e9      	b.n	800133c <eth_register+0x18>
 8001368:	20000ce8 	.word	0x20000ce8
 800136c:	0800c7c0 	.word	0x0800c7c0

08001370 <eth_initialize>:
 8001370:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8001374:	2300      	movs	r3, #0
 8001376:	4604      	mov	r4, r0
 8001378:	4e45      	ldr	r6, [pc, #276]	; (8001490 <eth_initialize+0x120>)
 800137a:	b082      	sub	sp, #8
 800137c:	2040      	movs	r0, #64	; 0x40
 800137e:	6073      	str	r3, [r6, #4]
 8001380:	6033      	str	r3, [r6, #0]
 8001382:	f005 fccd 	bl	8006d20 <__show_boot_progress>
 8001386:	4620      	mov	r0, r4
 8001388:	f006 fc94 	bl	8007cb4 <board_eth_init>
 800138c:	2800      	cmp	r0, #0
 800138e:	db6d      	blt.n	800146c <eth_initialize+0xfc>
 8001390:	6874      	ldr	r4, [r6, #4]
 8001392:	2c00      	cmp	r4, #0
 8001394:	d070      	beq.n	8001478 <eth_initialize+0x108>
 8001396:	483f      	ldr	r0, [pc, #252]	; (8001494 <eth_initialize+0x124>)
 8001398:	f003 fd9c 	bl	8004ed4 <getenv>
 800139c:	4607      	mov	r7, r0
 800139e:	2041      	movs	r0, #65	; 0x41
 80013a0:	f005 fcbe 	bl	8006d20 <__show_boot_progress>
 80013a4:	2500      	movs	r5, #0
 80013a6:	f8df a10c 	ldr.w	sl, [pc, #268]	; 80014b4 <eth_initialize+0x144>
 80013aa:	f8df 910c 	ldr.w	r9, [pc, #268]	; 80014b8 <eth_initialize+0x148>
 80013ae:	e008      	b.n	80013c2 <eth_initialize+0x52>
 80013b0:	6b24      	ldr	r4, [r4, #48]	; 0x30
 80013b2:	6873      	ldr	r3, [r6, #4]
 80013b4:	4838      	ldr	r0, [pc, #224]	; (8001498 <eth_initialize+0x128>)
 80013b6:	429c      	cmp	r4, r3
 80013b8:	f105 0501 	add.w	r5, r5, #1
 80013bc:	d029      	beq.n	8001412 <eth_initialize+0xa2>
 80013be:	f003 ffbf 	bl	8005340 <puts>
 80013c2:	4621      	mov	r1, r4
 80013c4:	4650      	mov	r0, sl
 80013c6:	f003 ffc7 	bl	8005358 <printf>
 80013ca:	b127      	cbz	r7, 80013d6 <eth_initialize+0x66>
 80013cc:	4639      	mov	r1, r7
 80013ce:	4620      	mov	r0, r4
 80013d0:	f7ff f81a 	bl	8000408 <strcmp>
 80013d4:	b1c0      	cbz	r0, 8001408 <eth_initialize+0x98>
 80013d6:	4669      	mov	r1, sp
 80013d8:	4628      	mov	r0, r5
 80013da:	f7ff ff3d 	bl	8001258 <eth_getenv_enetaddr_by_index>
 80013de:	2206      	movs	r2, #6
 80013e0:	4649      	mov	r1, r9
 80013e2:	4668      	mov	r0, sp
 80013e4:	f7ff f9f6 	bl	80007d4 <memcmp>
 80013e8:	2800      	cmp	r0, #0
 80013ea:	d0e1      	beq.n	80013b0 <eth_initialize+0x40>
 80013ec:	f104 0b10 	add.w	fp, r4, #16
 80013f0:	4658      	mov	r0, fp
 80013f2:	2206      	movs	r2, #6
 80013f4:	4649      	mov	r1, r9
 80013f6:	f7ff f9ed 	bl	80007d4 <memcmp>
 80013fa:	b9d8      	cbnz	r0, 8001434 <eth_initialize+0xc4>
 80013fc:	4658      	mov	r0, fp
 80013fe:	2206      	movs	r2, #6
 8001400:	4669      	mov	r1, sp
 8001402:	f7ff f9a5 	bl	8000750 <memcpy>
 8001406:	e7d3      	b.n	80013b0 <eth_initialize+0x40>
 8001408:	4824      	ldr	r0, [pc, #144]	; (800149c <eth_initialize+0x12c>)
 800140a:	6034      	str	r4, [r6, #0]
 800140c:	f003 ff98 	bl	8005340 <puts>
 8001410:	e7e1      	b.n	80013d6 <eth_initialize+0x66>
 8001412:	6831      	ldr	r1, [r6, #0]
 8001414:	4822      	ldr	r0, [pc, #136]	; (80014a0 <eth_initialize+0x130>)
 8001416:	b331      	cbz	r1, 8001466 <eth_initialize+0xf6>
 8001418:	f003 fd5c 	bl	8004ed4 <getenv>
 800141c:	b1f0      	cbz	r0, 800145c <eth_initialize+0xec>
 800141e:	6831      	ldr	r1, [r6, #0]
 8001420:	f7fe fff2 	bl	8000408 <strcmp>
 8001424:	b9d0      	cbnz	r0, 800145c <eth_initialize+0xec>
 8001426:	200a      	movs	r0, #10
 8001428:	f003 ff7e 	bl	8005328 <putc>
 800142c:	4628      	mov	r0, r5
 800142e:	b002      	add	sp, #8
 8001430:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8001434:	2206      	movs	r2, #6
 8001436:	4669      	mov	r1, sp
 8001438:	4658      	mov	r0, fp
 800143a:	f7ff f9cb 	bl	80007d4 <memcmp>
 800143e:	2800      	cmp	r0, #0
 8001440:	d0dc      	beq.n	80013fc <eth_initialize+0x8c>
 8001442:	4621      	mov	r1, r4
 8001444:	4817      	ldr	r0, [pc, #92]	; (80014a4 <eth_initialize+0x134>)
 8001446:	f003 ff87 	bl	8005358 <printf>
 800144a:	4659      	mov	r1, fp
 800144c:	4816      	ldr	r0, [pc, #88]	; (80014a8 <eth_initialize+0x138>)
 800144e:	f003 ff83 	bl	8005358 <printf>
 8001452:	4669      	mov	r1, sp
 8001454:	4815      	ldr	r0, [pc, #84]	; (80014ac <eth_initialize+0x13c>)
 8001456:	f003 ff7f 	bl	8005358 <printf>
 800145a:	e7cf      	b.n	80013fc <eth_initialize+0x8c>
 800145c:	6831      	ldr	r1, [r6, #0]
 800145e:	4810      	ldr	r0, [pc, #64]	; (80014a0 <eth_initialize+0x130>)
 8001460:	f003 fd0a 	bl	8004e78 <setenv>
 8001464:	e7df      	b.n	8001426 <eth_initialize+0xb6>
 8001466:	f003 fd07 	bl	8004e78 <setenv>
 800146a:	e7dc      	b.n	8001426 <eth_initialize+0xb6>
 800146c:	4620      	mov	r0, r4
 800146e:	f7ff ff0b 	bl	8001288 <cpu_eth_init>
 8001472:	6874      	ldr	r4, [r6, #4]
 8001474:	2c00      	cmp	r4, #0
 8001476:	d18e      	bne.n	8001396 <eth_initialize+0x26>
 8001478:	4625      	mov	r5, r4
 800147a:	480d      	ldr	r0, [pc, #52]	; (80014b0 <eth_initialize+0x140>)
 800147c:	f003 ff60 	bl	8005340 <puts>
 8001480:	f06f 003f 	mvn.w	r0, #63	; 0x3f
 8001484:	f005 fc4c 	bl	8006d20 <__show_boot_progress>
 8001488:	4628      	mov	r0, r5
 800148a:	b002      	add	sp, #8
 800148c:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8001490:	20000ce8 	.word	0x20000ce8
 8001494:	0800c7dc 	.word	0x0800c7dc
 8001498:	0800c7e8 	.word	0x0800c7e8
 800149c:	0800c7ec 	.word	0x0800c7ec
 80014a0:	0800c7c0 	.word	0x0800c7c0
 80014a4:	0800c7f8 	.word	0x0800c7f8
 80014a8:	0800c824 	.word	0x0800c824
 80014ac:	0800c844 	.word	0x0800c844
 80014b0:	0800c7c8 	.word	0x0800c7c8
 80014b4:	0800eb48 	.word	0x0800eb48
 80014b8:	0800c7a0 	.word	0x0800c7a0

080014bc <eth_halt>:
 80014bc:	b510      	push	{r4, lr}
 80014be:	4c04      	ldr	r4, [pc, #16]	; (80014d0 <eth_halt+0x14>)
 80014c0:	6820      	ldr	r0, [r4, #0]
 80014c2:	b120      	cbz	r0, 80014ce <eth_halt+0x12>
 80014c4:	6ac3      	ldr	r3, [r0, #44]	; 0x2c
 80014c6:	4798      	blx	r3
 80014c8:	2201      	movs	r2, #1
 80014ca:	6823      	ldr	r3, [r4, #0]
 80014cc:	61da      	str	r2, [r3, #28]
 80014ce:	bd10      	pop	{r4, pc}
 80014d0:	20000ce8 	.word	0x20000ce8

080014d4 <eth_send>:
 80014d4:	4b06      	ldr	r3, [pc, #24]	; (80014f0 <eth_send+0x1c>)
 80014d6:	681b      	ldr	r3, [r3, #0]
 80014d8:	b13b      	cbz	r3, 80014ea <eth_send+0x16>
 80014da:	b410      	push	{r4}
 80014dc:	6a5c      	ldr	r4, [r3, #36]	; 0x24
 80014de:	460a      	mov	r2, r1
 80014e0:	4601      	mov	r1, r0
 80014e2:	4618      	mov	r0, r3
 80014e4:	4623      	mov	r3, r4
 80014e6:	bc10      	pop	{r4}
 80014e8:	4718      	bx	r3
 80014ea:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 80014ee:	4770      	bx	lr
 80014f0:	20000ce8 	.word	0x20000ce8

080014f4 <eth_rx>:
 80014f4:	4b03      	ldr	r3, [pc, #12]	; (8001504 <eth_rx+0x10>)
 80014f6:	6818      	ldr	r0, [r3, #0]
 80014f8:	b108      	cbz	r0, 80014fe <eth_rx+0xa>
 80014fa:	6a83      	ldr	r3, [r0, #40]	; 0x28
 80014fc:	4718      	bx	r3
 80014fe:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8001502:	4770      	bx	lr
 8001504:	20000ce8 	.word	0x20000ce8

08001508 <eth_try_another>:
 8001508:	b538      	push	{r3, r4, r5, lr}
 800150a:	4605      	mov	r5, r0
 800150c:	4815      	ldr	r0, [pc, #84]	; (8001564 <eth_try_another+0x5c>)
 800150e:	f003 fce1 	bl	8004ed4 <getenv>
 8001512:	b118      	cbz	r0, 800151c <eth_try_another+0x14>
 8001514:	4914      	ldr	r1, [pc, #80]	; (8001568 <eth_try_another+0x60>)
 8001516:	f7fe ff77 	bl	8000408 <strcmp>
 800151a:	b300      	cbz	r0, 800155e <eth_try_another+0x56>
 800151c:	4c13      	ldr	r4, [pc, #76]	; (800156c <eth_try_another+0x64>)
 800151e:	6823      	ldr	r3, [r4, #0]
 8001520:	b1f3      	cbz	r3, 8001560 <eth_try_another+0x58>
 8001522:	b975      	cbnz	r5, 8001542 <eth_try_another+0x3a>
 8001524:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8001526:	4812      	ldr	r0, [pc, #72]	; (8001570 <eth_try_another+0x68>)
 8001528:	6023      	str	r3, [r4, #0]
 800152a:	f003 fcd3 	bl	8004ed4 <getenv>
 800152e:	b150      	cbz	r0, 8001546 <eth_try_another+0x3e>
 8001530:	6821      	ldr	r1, [r4, #0]
 8001532:	f7fe ff69 	bl	8000408 <strcmp>
 8001536:	b930      	cbnz	r0, 8001546 <eth_try_another+0x3e>
 8001538:	68a2      	ldr	r2, [r4, #8]
 800153a:	6823      	ldr	r3, [r4, #0]
 800153c:	429a      	cmp	r2, r3
 800153e:	d00a      	beq.n	8001556 <eth_try_another+0x4e>
 8001540:	bd38      	pop	{r3, r4, r5, pc}
 8001542:	60a3      	str	r3, [r4, #8]
 8001544:	e7ee      	b.n	8001524 <eth_try_another+0x1c>
 8001546:	6821      	ldr	r1, [r4, #0]
 8001548:	4809      	ldr	r0, [pc, #36]	; (8001570 <eth_try_another+0x68>)
 800154a:	f003 fc95 	bl	8004e78 <setenv>
 800154e:	68a2      	ldr	r2, [r4, #8]
 8001550:	6823      	ldr	r3, [r4, #0]
 8001552:	429a      	cmp	r2, r3
 8001554:	d1f4      	bne.n	8001540 <eth_try_another+0x38>
 8001556:	2201      	movs	r2, #1
 8001558:	4b06      	ldr	r3, [pc, #24]	; (8001574 <eth_try_another+0x6c>)
 800155a:	601a      	str	r2, [r3, #0]
 800155c:	bd38      	pop	{r3, r4, r5, pc}
 800155e:	bd38      	pop	{r3, r4, r5, pc}
 8001560:	bd38      	pop	{r3, r4, r5, pc}
 8001562:	bf00      	nop
 8001564:	0800c864 	.word	0x0800c864
 8001568:	0800c870 	.word	0x0800c870
 800156c:	20000ce8 	.word	0x20000ce8
 8001570:	0800c7c0 	.word	0x0800c7c0
 8001574:	20000d08 	.word	0x20000d08

08001578 <eth_init>:
 8001578:	b5f0      	push	{r4, r5, r6, r7, lr}
 800157a:	4e1e      	ldr	r6, [pc, #120]	; (80015f4 <eth_init+0x7c>)
 800157c:	b083      	sub	sp, #12
 800157e:	6833      	ldr	r3, [r6, #0]
 8001580:	2b00      	cmp	r3, #0
 8001582:	d030      	beq.n	80015e6 <eth_init+0x6e>
 8001584:	4607      	mov	r7, r0
 8001586:	2500      	movs	r5, #0
 8001588:	6874      	ldr	r4, [r6, #4]
 800158a:	e003      	b.n	8001594 <eth_init+0x1c>
 800158c:	6b24      	ldr	r4, [r4, #48]	; 0x30
 800158e:	6873      	ldr	r3, [r6, #4]
 8001590:	429c      	cmp	r4, r3
 8001592:	d010      	beq.n	80015b6 <eth_init+0x3e>
 8001594:	4628      	mov	r0, r5
 8001596:	4669      	mov	r1, sp
 8001598:	f7ff fe5e 	bl	8001258 <eth_getenv_enetaddr_by_index>
 800159c:	3501      	adds	r5, #1
 800159e:	2800      	cmp	r0, #0
 80015a0:	d0f4      	beq.n	800158c <eth_init+0x14>
 80015a2:	f104 0010 	add.w	r0, r4, #16
 80015a6:	2206      	movs	r2, #6
 80015a8:	4669      	mov	r1, sp
 80015aa:	f7ff f8d1 	bl	8000750 <memcpy>
 80015ae:	6b24      	ldr	r4, [r4, #48]	; 0x30
 80015b0:	6873      	ldr	r3, [r6, #4]
 80015b2:	429c      	cmp	r4, r3
 80015b4:	d1ee      	bne.n	8001594 <eth_init+0x1c>
 80015b6:	6834      	ldr	r4, [r6, #0]
 80015b8:	4620      	mov	r0, r4
 80015ba:	e005      	b.n	80015c8 <eth_init+0x50>
 80015bc:	2000      	movs	r0, #0
 80015be:	f7ff ffa3 	bl	8001508 <eth_try_another>
 80015c2:	6830      	ldr	r0, [r6, #0]
 80015c4:	4284      	cmp	r4, r0
 80015c6:	d00a      	beq.n	80015de <eth_init+0x66>
 80015c8:	6a03      	ldr	r3, [r0, #32]
 80015ca:	4639      	mov	r1, r7
 80015cc:	4798      	blx	r3
 80015ce:	2800      	cmp	r0, #0
 80015d0:	dbf4      	blt.n	80015bc <eth_init+0x44>
 80015d2:	2202      	movs	r2, #2
 80015d4:	2000      	movs	r0, #0
 80015d6:	6833      	ldr	r3, [r6, #0]
 80015d8:	61da      	str	r2, [r3, #28]
 80015da:	b003      	add	sp, #12
 80015dc:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80015de:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 80015e2:	b003      	add	sp, #12
 80015e4:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80015e6:	4804      	ldr	r0, [pc, #16]	; (80015f8 <eth_init+0x80>)
 80015e8:	f003 feaa 	bl	8005340 <puts>
 80015ec:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 80015f0:	e7f3      	b.n	80015da <eth_init+0x62>
 80015f2:	bf00      	nop
 80015f4:	20000ce8 	.word	0x20000ce8
 80015f8:	0800c7c8 	.word	0x0800c7c8

080015fc <eth_set_current>:
 80015fc:	b538      	push	{r3, r4, r5, lr}
 80015fe:	4c13      	ldr	r4, [pc, #76]	; (800164c <eth_set_current+0x50>)
 8001600:	6823      	ldr	r3, [r4, #0]
 8001602:	b1db      	cbz	r3, 800163c <eth_set_current+0x40>
 8001604:	f003 f9e6 	bl	80049d4 <get_env_id>
 8001608:	68e1      	ldr	r1, [r4, #12]
 800160a:	4605      	mov	r5, r0
 800160c:	b111      	cbz	r1, 8001614 <eth_set_current+0x18>
 800160e:	6923      	ldr	r3, [r4, #16]
 8001610:	4298      	cmp	r0, r3
 8001612:	d006      	beq.n	8001622 <eth_set_current+0x26>
 8001614:	480e      	ldr	r0, [pc, #56]	; (8001650 <eth_set_current+0x54>)
 8001616:	f003 fc5d 	bl	8004ed4 <getenv>
 800161a:	6125      	str	r5, [r4, #16]
 800161c:	4601      	mov	r1, r0
 800161e:	60e0      	str	r0, [r4, #12]
 8001620:	b168      	cbz	r0, 800163e <eth_set_current+0x42>
 8001622:	6825      	ldr	r5, [r4, #0]
 8001624:	4628      	mov	r0, r5
 8001626:	e005      	b.n	8001634 <eth_set_current+0x38>
 8001628:	6823      	ldr	r3, [r4, #0]
 800162a:	6b18      	ldr	r0, [r3, #48]	; 0x30
 800162c:	4285      	cmp	r5, r0
 800162e:	6020      	str	r0, [r4, #0]
 8001630:	d006      	beq.n	8001640 <eth_set_current+0x44>
 8001632:	68e1      	ldr	r1, [r4, #12]
 8001634:	f7fe fee8 	bl	8000408 <strcmp>
 8001638:	2800      	cmp	r0, #0
 800163a:	d1f5      	bne.n	8001628 <eth_set_current+0x2c>
 800163c:	bd38      	pop	{r3, r4, r5, pc}
 800163e:	6825      	ldr	r5, [r4, #0]
 8001640:	4629      	mov	r1, r5
 8001642:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8001646:	4802      	ldr	r0, [pc, #8]	; (8001650 <eth_set_current+0x54>)
 8001648:	f003 bc16 	b.w	8004e78 <setenv>
 800164c:	20000ce8 	.word	0x20000ce8
 8001650:	0800c7c0 	.word	0x0800c7c0

08001654 <eth_get_name>:
 8001654:	4a03      	ldr	r2, [pc, #12]	; (8001664 <eth_get_name+0x10>)
 8001656:	4b04      	ldr	r3, [pc, #16]	; (8001668 <eth_get_name+0x14>)
 8001658:	6810      	ldr	r0, [r2, #0]
 800165a:	2800      	cmp	r0, #0
 800165c:	bf08      	it	eq
 800165e:	4618      	moveq	r0, r3
 8001660:	4770      	bx	lr
 8001662:	bf00      	nop
 8001664:	20000ce8 	.word	0x20000ce8
 8001668:	0800c874 	.word	0x0800c874

0800166c <startAgainTimeout>:
 800166c:	2202      	movs	r2, #2
 800166e:	4b01      	ldr	r3, [pc, #4]	; (8001674 <startAgainTimeout+0x8>)
 8001670:	601a      	str	r2, [r3, #0]
 8001672:	4770      	bx	lr
 8001674:	20000cfc 	.word	0x20000cfc

08001678 <startAgainHandler>:
 8001678:	4770      	bx	lr
 800167a:	bf00      	nop

0800167c <NetStartAgain>:
 800167c:	b510      	push	{r4, lr}
 800167e:	4826      	ldr	r0, [pc, #152]	; (8001718 <NetStartAgain+0x9c>)
 8001680:	f003 fc28 	bl	8004ed4 <getenv>
 8001684:	b120      	cbz	r0, 8001690 <NetStartAgain+0x14>
 8001686:	4925      	ldr	r1, [pc, #148]	; (800171c <NetStartAgain+0xa0>)
 8001688:	4604      	mov	r4, r0
 800168a:	f7fe febd 	bl	8000408 <strcmp>
 800168e:	b9d8      	cbnz	r0, 80016c8 <NetStartAgain+0x4c>
 8001690:	4c23      	ldr	r4, [pc, #140]	; (8001720 <NetStartAgain+0xa4>)
 8001692:	6863      	ldr	r3, [r4, #4]
 8001694:	3301      	adds	r3, #1
 8001696:	6063      	str	r3, [r4, #4]
 8001698:	f7ff ff10 	bl	80014bc <eth_halt>
 800169c:	68a0      	ldr	r0, [r4, #8]
 800169e:	fab0 f080 	clz	r0, r0
 80016a2:	0940      	lsrs	r0, r0, #5
 80016a4:	f7ff ff30 	bl	8001508 <eth_try_another>
 80016a8:	f8d8 0000 	ldr.w	r0, [r8]
 80016ac:	f7ff ff64 	bl	8001578 <eth_init>
 80016b0:	68e3      	ldr	r3, [r4, #12]
 80016b2:	b133      	cbz	r3, 80016c2 <NetStartAgain+0x46>
 80016b4:	2000      	movs	r0, #0
 80016b6:	6923      	ldr	r3, [r4, #16]
 80016b8:	60e0      	str	r0, [r4, #12]
 80016ba:	b9db      	cbnz	r3, 80016f4 <NetStartAgain+0x78>
 80016bc:	2304      	movs	r3, #4
 80016be:	6023      	str	r3, [r4, #0]
 80016c0:	bd10      	pop	{r4, pc}
 80016c2:	2302      	movs	r3, #2
 80016c4:	6023      	str	r3, [r4, #0]
 80016c6:	bd10      	pop	{r4, pc}
 80016c8:	4916      	ldr	r1, [pc, #88]	; (8001724 <NetStartAgain+0xa8>)
 80016ca:	4620      	mov	r0, r4
 80016cc:	f7fe fe9c 	bl	8000408 <strcmp>
 80016d0:	b928      	cbnz	r0, 80016de <NetStartAgain+0x62>
 80016d2:	4c13      	ldr	r4, [pc, #76]	; (8001720 <NetStartAgain+0xa4>)
 80016d4:	f7ff fef2 	bl	80014bc <eth_halt>
 80016d8:	2304      	movs	r3, #4
 80016da:	6023      	str	r3, [r4, #0]
 80016dc:	bd10      	pop	{r4, pc}
 80016de:	4912      	ldr	r1, [pc, #72]	; (8001728 <NetStartAgain+0xac>)
 80016e0:	4620      	mov	r0, r4
 80016e2:	f7fe fe91 	bl	8000408 <strcmp>
 80016e6:	b980      	cbnz	r0, 800170a <NetStartAgain+0x8e>
 80016e8:	2001      	movs	r0, #1
 80016ea:	4c0d      	ldr	r4, [pc, #52]	; (8001720 <NetStartAgain+0xa4>)
 80016ec:	6863      	ldr	r3, [r4, #4]
 80016ee:	4283      	cmp	r3, r0
 80016f0:	d3d0      	bcc.n	8001694 <NetStartAgain+0x18>
 80016f2:	e7ef      	b.n	80016d4 <NetStartAgain+0x58>
 80016f4:	4b0d      	ldr	r3, [pc, #52]	; (800172c <NetStartAgain+0xb0>)
 80016f6:	6163      	str	r3, [r4, #20]
 80016f8:	f7ff f990 	bl	8000a1c <get_timer>
 80016fc:	f242 7210 	movw	r2, #10000	; 0x2710
 8001700:	4b0b      	ldr	r3, [pc, #44]	; (8001730 <NetStartAgain+0xb4>)
 8001702:	61a0      	str	r0, [r4, #24]
 8001704:	61e2      	str	r2, [r4, #28]
 8001706:	6223      	str	r3, [r4, #32]
 8001708:	bd10      	pop	{r4, pc}
 800170a:	2200      	movs	r2, #0
 800170c:	4620      	mov	r0, r4
 800170e:	4611      	mov	r1, r2
 8001710:	f007 f8e2 	bl	80088d8 <simple_strtoul>
 8001714:	e7e9      	b.n	80016ea <NetStartAgain+0x6e>
 8001716:	bf00      	nop
 8001718:	0800c884 	.word	0x0800c884
 800171c:	0800c890 	.word	0x0800c890
 8001720:	20000cfc 	.word	0x20000cfc
 8001724:	0800c870 	.word	0x0800c870
 8001728:	0800c894 	.word	0x0800c894
 800172c:	0800166d 	.word	0x0800166d
 8001730:	08001679 	.word	0x08001679

08001734 <NetSetHandler>:
 8001734:	4b01      	ldr	r3, [pc, #4]	; (800173c <NetSetHandler+0x8>)
 8001736:	6218      	str	r0, [r3, #32]
 8001738:	4770      	bx	lr
 800173a:	bf00      	nop
 800173c:	20000cfc 	.word	0x20000cfc

08001740 <NetSetTimeout>:
 8001740:	b538      	push	{r3, r4, r5, lr}
 8001742:	b910      	cbnz	r0, 800174a <NetSetTimeout+0xa>
 8001744:	4b05      	ldr	r3, [pc, #20]	; (800175c <NetSetTimeout+0x1c>)
 8001746:	6158      	str	r0, [r3, #20]
 8001748:	bd38      	pop	{r3, r4, r5, pc}
 800174a:	4d04      	ldr	r5, [pc, #16]	; (800175c <NetSetTimeout+0x1c>)
 800174c:	4604      	mov	r4, r0
 800174e:	2000      	movs	r0, #0
 8001750:	6169      	str	r1, [r5, #20]
 8001752:	f7ff f963 	bl	8000a1c <get_timer>
 8001756:	61ec      	str	r4, [r5, #28]
 8001758:	61a8      	str	r0, [r5, #24]
 800175a:	bd38      	pop	{r3, r4, r5, pc}
 800175c:	20000cfc 	.word	0x20000cfc

08001760 <NetSendPacket>:
 8001760:	f7ff beb8 	b.w	80014d4 <eth_send>

08001764 <NetCksumOk>:
 8001764:	2900      	cmp	r1, #0
 8001766:	dd18      	ble.n	800179a <NetCksumOk+0x36>
 8001768:	2200      	movs	r2, #0
 800176a:	b410      	push	{r4}
 800176c:	4603      	mov	r3, r0
 800176e:	eb00 0041 	add.w	r0, r0, r1, lsl #1
 8001772:	f833 4b02 	ldrh.w	r4, [r3], #2
 8001776:	4283      	cmp	r3, r0
 8001778:	4422      	add	r2, r4
 800177a:	d1fa      	bne.n	8001772 <NetCksumOk+0xe>
 800177c:	f64f 70fe 	movw	r0, #65534	; 0xfffe
 8001780:	b293      	uxth	r3, r2
 8001782:	eb03 4312 	add.w	r3, r3, r2, lsr #16
 8001786:	b29a      	uxth	r2, r3
 8001788:	eb02 4213 	add.w	r2, r2, r3, lsr #16
 800178c:	3201      	adds	r2, #1
 800178e:	4010      	ands	r0, r2
 8001790:	fab0 f080 	clz	r0, r0
 8001794:	bc10      	pop	{r4}
 8001796:	0940      	lsrs	r0, r0, #5
 8001798:	4770      	bx	lr
 800179a:	2001      	movs	r0, #1
 800179c:	4770      	bx	lr
 800179e:	bf00      	nop

080017a0 <NetCksum>:
 80017a0:	2900      	cmp	r1, #0
 80017a2:	dd12      	ble.n	80017ca <NetCksum+0x2a>
 80017a4:	2200      	movs	r2, #0
 80017a6:	b410      	push	{r4}
 80017a8:	4603      	mov	r3, r0
 80017aa:	eb00 0041 	add.w	r0, r0, r1, lsl #1
 80017ae:	f833 4b02 	ldrh.w	r4, [r3], #2
 80017b2:	4283      	cmp	r3, r0
 80017b4:	4422      	add	r2, r4
 80017b6:	d1fa      	bne.n	80017ae <NetCksum+0xe>
 80017b8:	b290      	uxth	r0, r2
 80017ba:	eb00 4212 	add.w	r2, r0, r2, lsr #16
 80017be:	b290      	uxth	r0, r2
 80017c0:	eb00 4012 	add.w	r0, r0, r2, lsr #16
 80017c4:	b280      	uxth	r0, r0
 80017c6:	bc10      	pop	{r4}
 80017c8:	4770      	bx	lr
 80017ca:	2000      	movs	r0, #0
 80017cc:	4770      	bx	lr
 80017ce:	bf00      	nop

080017d0 <NetEthHdrSize>:
 80017d0:	f64f 72ff 	movw	r2, #65535	; 0xffff
 80017d4:	4b09      	ldr	r3, [pc, #36]	; (80017fc <NetEthHdrSize+0x2c>)
 80017d6:	8818      	ldrh	r0, [r3, #0]
 80017d8:	0a03      	lsrs	r3, r0, #8
 80017da:	ea43 2300 	orr.w	r3, r3, r0, lsl #8
 80017de:	b29b      	uxth	r3, r3
 80017e0:	4293      	cmp	r3, r2
 80017e2:	d008      	beq.n	80017f6 <NetEthHdrSize+0x26>
 80017e4:	f640 70ff 	movw	r0, #4095	; 0xfff
 80017e8:	f3c3 030b 	ubfx	r3, r3, #0, #12
 80017ec:	4283      	cmp	r3, r0
 80017ee:	bf0c      	ite	eq
 80017f0:	200e      	moveq	r0, #14
 80017f2:	2012      	movne	r0, #18
 80017f4:	4770      	bx	lr
 80017f6:	200e      	movs	r0, #14
 80017f8:	4770      	bx	lr
 80017fa:	bf00      	nop
 80017fc:	20000030 	.word	0x20000030

08001800 <NetSetEther>:
 8001800:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001802:	f64f 77ff 	movw	r7, #65535	; 0xffff
 8001806:	4b1b      	ldr	r3, [pc, #108]	; (8001874 <NetSetEther+0x74>)
 8001808:	4616      	mov	r6, r2
 800180a:	881b      	ldrh	r3, [r3, #0]
 800180c:	4605      	mov	r5, r0
 800180e:	0a1c      	lsrs	r4, r3, #8
 8001810:	ea44 2403 	orr.w	r4, r4, r3, lsl #8
 8001814:	b2a4      	uxth	r4, r4
 8001816:	42bc      	cmp	r4, r7
 8001818:	f04f 0206 	mov.w	r2, #6
 800181c:	d019      	beq.n	8001852 <NetSetEther+0x52>
 800181e:	f7fe ff97 	bl	8000750 <memcpy>
 8001822:	2206      	movs	r2, #6
 8001824:	4914      	ldr	r1, [pc, #80]	; (8001878 <NetSetEther+0x78>)
 8001826:	18a8      	adds	r0, r5, r2
 8001828:	f7fe ff92 	bl	8000750 <memcpy>
 800182c:	f640 73ff 	movw	r3, #4095	; 0xfff
 8001830:	f3c4 040b 	ubfx	r4, r4, #0, #12
 8001834:	429c      	cmp	r4, r3
 8001836:	d013      	beq.n	8001860 <NetSetEther+0x60>
 8001838:	2381      	movs	r3, #129	; 0x81
 800183a:	4a10      	ldr	r2, [pc, #64]	; (800187c <NetSetEther+0x7c>)
 800183c:	f3c6 2107 	ubfx	r1, r6, #8, #8
 8001840:	ea02 2206 	and.w	r2, r2, r6, lsl #8
 8001844:	ba64      	rev16	r4, r4
 8001846:	430a      	orrs	r2, r1
 8001848:	81ec      	strh	r4, [r5, #14]
 800184a:	822a      	strh	r2, [r5, #16]
 800184c:	81ab      	strh	r3, [r5, #12]
 800184e:	2012      	movs	r0, #18
 8001850:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001852:	f7fe ff7d 	bl	8000750 <memcpy>
 8001856:	2206      	movs	r2, #6
 8001858:	4907      	ldr	r1, [pc, #28]	; (8001878 <NetSetEther+0x78>)
 800185a:	18a8      	adds	r0, r5, r2
 800185c:	f7fe ff78 	bl	8000750 <memcpy>
 8001860:	4a06      	ldr	r2, [pc, #24]	; (800187c <NetSetEther+0x7c>)
 8001862:	f3c6 2307 	ubfx	r3, r6, #8, #8
 8001866:	ea02 2206 	and.w	r2, r2, r6, lsl #8
 800186a:	431a      	orrs	r2, r3
 800186c:	81aa      	strh	r2, [r5, #12]
 800186e:	200e      	movs	r0, #14
 8001870:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001872:	bf00      	nop
 8001874:	20000030 	.word	0x20000030
 8001878:	20000d20 	.word	0x20000d20
 800187c:	00ffff00 	.word	0x00ffff00

08001880 <ArpRequest>:
 8001880:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001882:	4d23      	ldr	r5, [pc, #140]	; (8001910 <ArpRequest+0x90>)
 8001884:	b083      	sub	sp, #12
 8001886:	6aee      	ldr	r6, [r5, #44]	; 0x2c
 8001888:	f640 0206 	movw	r2, #2054	; 0x806
 800188c:	4921      	ldr	r1, [pc, #132]	; (8001914 <ArpRequest+0x94>)
 800188e:	4630      	mov	r0, r6
 8001890:	f7ff ffb6 	bl	8001800 <NetSetEther>
 8001894:	2704      	movs	r7, #4
 8001896:	f44f 7380 	mov.w	r3, #256	; 0x100
 800189a:	2108      	movs	r1, #8
 800189c:	2206      	movs	r2, #6
 800189e:	1834      	adds	r4, r6, r0
 80018a0:	5233      	strh	r3, [r6, r0]
 80018a2:	80e3      	strh	r3, [r4, #6]
 80018a4:	8061      	strh	r1, [r4, #2]
 80018a6:	7122      	strb	r2, [r4, #4]
 80018a8:	1860      	adds	r0, r4, r1
 80018aa:	7167      	strb	r7, [r4, #5]
 80018ac:	f105 0124 	add.w	r1, r5, #36	; 0x24
 80018b0:	f7fe ff4e 	bl	8000750 <memcpy>
 80018b4:	6b2b      	ldr	r3, [r5, #48]	; 0x30
 80018b6:	a902      	add	r1, sp, #8
 80018b8:	f841 3d08 	str.w	r3, [r1, #-8]!
 80018bc:	463a      	mov	r2, r7
 80018be:	f104 000e 	add.w	r0, r4, #14
 80018c2:	f7fe ff45 	bl	8000750 <memcpy>
 80018c6:	2300      	movs	r3, #0
 80018c8:	6b6a      	ldr	r2, [r5, #52]	; 0x34
 80018ca:	6b29      	ldr	r1, [r5, #48]	; 0x30
 80018cc:	6ba8      	ldr	r0, [r5, #56]	; 0x38
 80018ce:	4051      	eors	r1, r2
 80018d0:	4201      	tst	r1, r0
 80018d2:	74a3      	strb	r3, [r4, #18]
 80018d4:	74e3      	strb	r3, [r4, #19]
 80018d6:	7523      	strb	r3, [r4, #20]
 80018d8:	7563      	strb	r3, [r4, #21]
 80018da:	75a3      	strb	r3, [r4, #22]
 80018dc:	75e3      	strb	r3, [r4, #23]
 80018de:	d001      	beq.n	80018e4 <ArpRequest+0x64>
 80018e0:	6bea      	ldr	r2, [r5, #60]	; 0x3c
 80018e2:	b17a      	cbz	r2, 8001904 <ArpRequest+0x84>
 80018e4:	642a      	str	r2, [r5, #64]	; 0x40
 80018e6:	a902      	add	r1, sp, #8
 80018e8:	f841 2d04 	str.w	r2, [r1, #-4]!
 80018ec:	f104 0018 	add.w	r0, r4, #24
 80018f0:	2204      	movs	r2, #4
 80018f2:	f7fe ff2d 	bl	8000750 <memcpy>
 80018f6:	6ae8      	ldr	r0, [r5, #44]	; 0x2c
 80018f8:	1a21      	subs	r1, r4, r0
 80018fa:	311c      	adds	r1, #28
 80018fc:	f7ff fdea 	bl	80014d4 <eth_send>
 8001900:	b003      	add	sp, #12
 8001902:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001904:	4804      	ldr	r0, [pc, #16]	; (8001918 <ArpRequest+0x98>)
 8001906:	f003 fd1b 	bl	8005340 <puts>
 800190a:	6b6a      	ldr	r2, [r5, #52]	; 0x34
 800190c:	642a      	str	r2, [r5, #64]	; 0x40
 800190e:	e7ea      	b.n	80018e6 <ArpRequest+0x66>
 8001910:	20000cfc 	.word	0x20000cfc
 8001914:	20000034 	.word	0x20000034
 8001918:	0800c89c 	.word	0x0800c89c

0800191c <ArpTimeoutCheck>:
 800191c:	b510      	push	{r4, lr}
 800191e:	4c10      	ldr	r4, [pc, #64]	; (8001960 <ArpTimeoutCheck+0x44>)
 8001920:	6b63      	ldr	r3, [r4, #52]	; 0x34
 8001922:	b903      	cbnz	r3, 8001926 <ArpTimeoutCheck+0xa>
 8001924:	bd10      	pop	{r4, pc}
 8001926:	2000      	movs	r0, #0
 8001928:	f7ff f878 	bl	8000a1c <get_timer>
 800192c:	f241 3288 	movw	r2, #5000	; 0x1388
 8001930:	6c63      	ldr	r3, [r4, #68]	; 0x44
 8001932:	1ac3      	subs	r3, r0, r3
 8001934:	4293      	cmp	r3, r2
 8001936:	d9f5      	bls.n	8001924 <ArpTimeoutCheck+0x8>
 8001938:	6ca3      	ldr	r3, [r4, #72]	; 0x48
 800193a:	3301      	adds	r3, #1
 800193c:	2b04      	cmp	r3, #4
 800193e:	64a3      	str	r3, [r4, #72]	; 0x48
 8001940:	dc04      	bgt.n	800194c <ArpTimeoutCheck+0x30>
 8001942:	6460      	str	r0, [r4, #68]	; 0x44
 8001944:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8001948:	f7ff bf9a 	b.w	8001880 <ArpRequest>
 800194c:	4805      	ldr	r0, [pc, #20]	; (8001964 <ArpTimeoutCheck+0x48>)
 800194e:	f003 fcf7 	bl	8005340 <puts>
 8001952:	2300      	movs	r3, #0
 8001954:	64a3      	str	r3, [r4, #72]	; 0x48
 8001956:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800195a:	f7ff be8f 	b.w	800167c <NetStartAgain>
 800195e:	bf00      	nop
 8001960:	20000cfc 	.word	0x20000cfc
 8001964:	0800c8c8 	.word	0x0800c8c8

08001968 <NetReceive>:
 8001968:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 800196c:	4dbc      	ldr	r5, [pc, #752]	; (8001c60 <NetReceive+0x2f8>)
 800196e:	290d      	cmp	r1, #13
 8001970:	b082      	sub	sp, #8
 8001972:	64e8      	str	r0, [r5, #76]	; 0x4c
 8001974:	6529      	str	r1, [r5, #80]	; 0x50
 8001976:	f340 8096 	ble.w	8001aa6 <NetReceive+0x13e>
 800197a:	f64f 77ff 	movw	r7, #65535	; 0xffff
 800197e:	f640 76ff 	movw	r6, #4095	; 0xfff
 8001982:	f240 5ee9 	movw	lr, #1513	; 0x5e9
 8001986:	4bb7      	ldr	r3, [pc, #732]	; (8001c64 <NetReceive+0x2fc>)
 8001988:	f8b0 c00c 	ldrh.w	ip, [r0, #12]
 800198c:	895c      	ldrh	r4, [r3, #10]
 800198e:	f8b3 9000 	ldrh.w	r9, [r3]
 8001992:	0a23      	lsrs	r3, r4, #8
 8001994:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
 8001998:	ea4f 2219 	mov.w	r2, r9, lsr #8
 800199c:	ea4f 241c 	mov.w	r4, ip, lsr #8
 80019a0:	ea44 240c 	orr.w	r4, r4, ip, lsl #8
 80019a4:	ea42 2209 	orr.w	r2, r2, r9, lsl #8
 80019a8:	b292      	uxth	r2, r2
 80019aa:	b29b      	uxth	r3, r3
 80019ac:	b2a4      	uxth	r4, r4
 80019ae:	42ba      	cmp	r2, r7
 80019b0:	bf14      	ite	ne
 80019b2:	4694      	movne	ip, r2
 80019b4:	46b4      	moveq	ip, r6
 80019b6:	42bb      	cmp	r3, r7
 80019b8:	bf08      	it	eq
 80019ba:	4633      	moveq	r3, r6
 80019bc:	4574      	cmp	r4, lr
 80019be:	d975      	bls.n	8001aac <NetReceive+0x144>
 80019c0:	f5b4 4f01 	cmp.w	r4, #33024	; 0x8100
 80019c4:	f000 8095 	beq.w	8001af2 <NetReceive+0x18a>
 80019c8:	f640 76ff 	movw	r6, #4095	; 0xfff
 80019cc:	f3cc 020b 	ubfx	r2, ip, #0, #12
 80019d0:	42b2      	cmp	r2, r6
 80019d2:	f1a1 010e 	sub.w	r1, r1, #14
 80019d6:	f100 070e 	add.w	r7, r0, #14
 80019da:	d175      	bne.n	8001ac8 <NetReceive+0x160>
 80019dc:	f640 0306 	movw	r3, #2054	; 0x806
 80019e0:	429c      	cmp	r4, r3
 80019e2:	4606      	mov	r6, r0
 80019e4:	f000 80a4 	beq.w	8001b30 <NetReceive+0x1c8>
 80019e8:	f248 0335 	movw	r3, #32821	; 0x8035
 80019ec:	429c      	cmp	r4, r3
 80019ee:	d072      	beq.n	8001ad6 <NetReceive+0x16e>
 80019f0:	f5b4 6f00 	cmp.w	r4, #2048	; 0x800
 80019f4:	d157      	bne.n	8001aa6 <NetReceive+0x13e>
 80019f6:	291b      	cmp	r1, #27
 80019f8:	d955      	bls.n	8001aa6 <NetReceive+0x13e>
 80019fa:	887b      	ldrh	r3, [r7, #2]
 80019fc:	0a1a      	lsrs	r2, r3, #8
 80019fe:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
 8001a02:	b292      	uxth	r2, r2
 8001a04:	428a      	cmp	r2, r1
 8001a06:	f300 8123 	bgt.w	8001c50 <NetReceive+0x2e8>
 8001a0a:	783b      	ldrb	r3, [r7, #0]
 8001a0c:	f003 02f0 	and.w	r2, r3, #240	; 0xf0
 8001a10:	2a40      	cmp	r2, #64	; 0x40
 8001a12:	d148      	bne.n	8001aa6 <NetReceive+0x13e>
 8001a14:	f003 030f 	and.w	r3, r3, #15
 8001a18:	2b05      	cmp	r3, #5
 8001a1a:	d844      	bhi.n	8001aa6 <NetReceive+0x13e>
 8001a1c:	463b      	mov	r3, r7
 8001a1e:	2200      	movs	r2, #0
 8001a20:	f107 0014 	add.w	r0, r7, #20
 8001a24:	f833 1b02 	ldrh.w	r1, [r3], #2
 8001a28:	4298      	cmp	r0, r3
 8001a2a:	440a      	add	r2, r1
 8001a2c:	d1fa      	bne.n	8001a24 <NetReceive+0xbc>
 8001a2e:	f64f 71fe 	movw	r1, #65534	; 0xfffe
 8001a32:	b293      	uxth	r3, r2
 8001a34:	eb03 4212 	add.w	r2, r3, r2, lsr #16
 8001a38:	b293      	uxth	r3, r2
 8001a3a:	eb03 4312 	add.w	r3, r3, r2, lsr #16
 8001a3e:	3301      	adds	r3, #1
 8001a40:	4019      	ands	r1, r3
 8001a42:	2900      	cmp	r1, #0
 8001a44:	f040 8108 	bne.w	8001c58 <NetReceive+0x2f0>
 8001a48:	2204      	movs	r2, #4
 8001a4a:	f107 0110 	add.w	r1, r7, #16
 8001a4e:	eb0d 0002 	add.w	r0, sp, r2
 8001a52:	f7fe fe7d 	bl	8000750 <memcpy>
 8001a56:	6b2b      	ldr	r3, [r5, #48]	; 0x30
 8001a58:	9a01      	ldr	r2, [sp, #4]
 8001a5a:	b11b      	cbz	r3, 8001a64 <NetReceive+0xfc>
 8001a5c:	4293      	cmp	r3, r2
 8001a5e:	d001      	beq.n	8001a64 <NetReceive+0xfc>
 8001a60:	3201      	adds	r2, #1
 8001a62:	d120      	bne.n	8001aa6 <NetReceive+0x13e>
 8001a64:	88fa      	ldrh	r2, [r7, #6]
 8001a66:	0a13      	lsrs	r3, r2, #8
 8001a68:	ea43 2302 	orr.w	r3, r3, r2, lsl #8
 8001a6c:	f3c3 030d 	ubfx	r3, r3, #0, #14
 8001a70:	b9cb      	cbnz	r3, 8001aa6 <NetReceive+0x13e>
 8001a72:	7a7b      	ldrb	r3, [r7, #9]
 8001a74:	2b01      	cmp	r3, #1
 8001a76:	f000 8105 	beq.w	8001c84 <NetReceive+0x31c>
 8001a7a:	2b11      	cmp	r3, #17
 8001a7c:	d113      	bne.n	8001aa6 <NetReceive+0x13e>
 8001a7e:	8b3a      	ldrh	r2, [r7, #24]
 8001a80:	8afc      	ldrh	r4, [r7, #22]
 8001a82:	8ab8      	ldrh	r0, [r7, #20]
 8001a84:	0a13      	lsrs	r3, r2, #8
 8001a86:	ea43 2302 	orr.w	r3, r3, r2, lsl #8
 8001a8a:	0a21      	lsrs	r1, r4, #8
 8001a8c:	0a02      	lsrs	r2, r0, #8
 8001a8e:	ea41 2104 	orr.w	r1, r1, r4, lsl #8
 8001a92:	ea42 2200 	orr.w	r2, r2, r0, lsl #8
 8001a96:	b29b      	uxth	r3, r3
 8001a98:	6a2c      	ldr	r4, [r5, #32]
 8001a9a:	3b08      	subs	r3, #8
 8001a9c:	b289      	uxth	r1, r1
 8001a9e:	f107 001c 	add.w	r0, r7, #28
 8001aa2:	b292      	uxth	r2, r2
 8001aa4:	47a0      	blx	r4
 8001aa6:	b002      	add	sp, #8
 8001aa8:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8001aac:	f640 76ff 	movw	r6, #4095	; 0xfff
 8001ab0:	8a82      	ldrh	r2, [r0, #20]
 8001ab2:	3916      	subs	r1, #22
 8001ab4:	0a14      	lsrs	r4, r2, #8
 8001ab6:	ea44 2402 	orr.w	r4, r4, r2, lsl #8
 8001aba:	f3cc 020b 	ubfx	r2, ip, #0, #12
 8001abe:	42b2      	cmp	r2, r6
 8001ac0:	b2a4      	uxth	r4, r4
 8001ac2:	f100 0716 	add.w	r7, r0, #22
 8001ac6:	d089      	beq.n	80019dc <NetReceive+0x74>
 8001ac8:	f3c3 0e0b 	ubfx	lr, r3, #0, #12
 8001acc:	4596      	cmp	lr, r2
 8001ace:	d085      	beq.n	80019dc <NetReceive+0x74>
 8001ad0:	b002      	add	sp, #8
 8001ad2:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8001ad6:	291b      	cmp	r1, #27
 8001ad8:	f340 80b5 	ble.w	8001c46 <NetReceive+0x2de>
 8001adc:	88fb      	ldrh	r3, [r7, #6]
 8001ade:	0a1c      	lsrs	r4, r3, #8
 8001ae0:	ea44 2403 	orr.w	r4, r4, r3, lsl #8
 8001ae4:	b224      	sxth	r4, r4
 8001ae6:	2c04      	cmp	r4, #4
 8001ae8:	d07b      	beq.n	8001be2 <NetReceive+0x27a>
 8001aea:	485f      	ldr	r0, [pc, #380]	; (8001c68 <NetReceive+0x300>)
 8001aec:	f003 fc28 	bl	8005340 <puts>
 8001af0:	e7d9      	b.n	8001aa6 <NetReceive+0x13e>
 8001af2:	2911      	cmp	r1, #17
 8001af4:	ddd7      	ble.n	8001aa6 <NetReceive+0x13e>
 8001af6:	f3c2 020b 	ubfx	r2, r2, #0, #12
 8001afa:	42b2      	cmp	r2, r6
 8001afc:	d0d3      	beq.n	8001aa6 <NetReceive+0x13e>
 8001afe:	8a07      	ldrh	r7, [r0, #16]
 8001b00:	f8b0 900e 	ldrh.w	r9, [r0, #14]
 8001b04:	0a3c      	lsrs	r4, r7, #8
 8001b06:	ea4f 2e19 	mov.w	lr, r9, lsr #8
 8001b0a:	f3cc 020b 	ubfx	r2, ip, #0, #12
 8001b0e:	ea44 2407 	orr.w	r4, r4, r7, lsl #8
 8001b12:	ea4e 2e09 	orr.w	lr, lr, r9, lsl #8
 8001b16:	42b2      	cmp	r2, r6
 8001b18:	f1a1 0112 	sub.w	r1, r1, #18
 8001b1c:	f3ce 0e0b 	ubfx	lr, lr, #0, #12
 8001b20:	b2a4      	uxth	r4, r4
 8001b22:	f100 0712 	add.w	r7, r0, #18
 8001b26:	f43f af59 	beq.w	80019dc <NetReceive+0x74>
 8001b2a:	45b6      	cmp	lr, r6
 8001b2c:	d1ce      	bne.n	8001acc <NetReceive+0x164>
 8001b2e:	e7cb      	b.n	8001ac8 <NetReceive+0x160>
 8001b30:	291b      	cmp	r1, #27
 8001b32:	f340 8088 	ble.w	8001c46 <NetReceive+0x2de>
 8001b36:	883a      	ldrh	r2, [r7, #0]
 8001b38:	0a13      	lsrs	r3, r2, #8
 8001b3a:	ea43 2302 	orr.w	r3, r3, r2, lsl #8
 8001b3e:	b21b      	sxth	r3, r3
 8001b40:	2b01      	cmp	r3, #1
 8001b42:	d1b0      	bne.n	8001aa6 <NetReceive+0x13e>
 8001b44:	887a      	ldrh	r2, [r7, #2]
 8001b46:	0a13      	lsrs	r3, r2, #8
 8001b48:	ea43 2302 	orr.w	r3, r3, r2, lsl #8
 8001b4c:	b21b      	sxth	r3, r3
 8001b4e:	f5b3 6f00 	cmp.w	r3, #2048	; 0x800
 8001b52:	d1a8      	bne.n	8001aa6 <NetReceive+0x13e>
 8001b54:	f897 9004 	ldrb.w	r9, [r7, #4]
 8001b58:	f1b9 0f06 	cmp.w	r9, #6
 8001b5c:	d1a3      	bne.n	8001aa6 <NetReceive+0x13e>
 8001b5e:	f897 a005 	ldrb.w	sl, [r7, #5]
 8001b62:	f1ba 0f04 	cmp.w	sl, #4
 8001b66:	d19e      	bne.n	8001aa6 <NetReceive+0x13e>
 8001b68:	6b2b      	ldr	r3, [r5, #48]	; 0x30
 8001b6a:	2b00      	cmp	r3, #0
 8001b6c:	d09b      	beq.n	8001aa6 <NetReceive+0x13e>
 8001b6e:	f107 0b18 	add.w	fp, r7, #24
 8001b72:	4652      	mov	r2, sl
 8001b74:	4659      	mov	r1, fp
 8001b76:	a801      	add	r0, sp, #4
 8001b78:	f7fe fdea 	bl	8000750 <memcpy>
 8001b7c:	9b01      	ldr	r3, [sp, #4]
 8001b7e:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8001b80:	429a      	cmp	r2, r3
 8001b82:	d190      	bne.n	8001aa6 <NetReceive+0x13e>
 8001b84:	88fa      	ldrh	r2, [r7, #6]
 8001b86:	0a13      	lsrs	r3, r2, #8
 8001b88:	ea43 2302 	orr.w	r3, r3, r2, lsl #8
 8001b8c:	b21b      	sxth	r3, r3
 8001b8e:	2b01      	cmp	r3, #1
 8001b90:	f000 8086 	beq.w	8001ca0 <NetReceive+0x338>
 8001b94:	2b02      	cmp	r3, #2
 8001b96:	d186      	bne.n	8001aa6 <NetReceive+0x13e>
 8001b98:	6b6b      	ldr	r3, [r5, #52]	; 0x34
 8001b9a:	2b00      	cmp	r3, #0
 8001b9c:	d083      	beq.n	8001aa6 <NetReceive+0x13e>
 8001b9e:	6d6b      	ldr	r3, [r5, #84]	; 0x54
 8001ba0:	2b00      	cmp	r3, #0
 8001ba2:	d080      	beq.n	8001aa6 <NetReceive+0x13e>
 8001ba4:	2204      	movs	r2, #4
 8001ba6:	a801      	add	r0, sp, #4
 8001ba8:	f107 010e 	add.w	r1, r7, #14
 8001bac:	f7fe fdd0 	bl	8000750 <memcpy>
 8001bb0:	9b01      	ldr	r3, [sp, #4]
 8001bb2:	6c2a      	ldr	r2, [r5, #64]	; 0x40
 8001bb4:	429a      	cmp	r2, r3
 8001bb6:	f47f af76 	bne.w	8001aa6 <NetReceive+0x13e>
 8001bba:	f107 0108 	add.w	r1, r7, #8
 8001bbe:	2206      	movs	r2, #6
 8001bc0:	6d68      	ldr	r0, [r5, #84]	; 0x54
 8001bc2:	f7fe fdc5 	bl	8000750 <memcpy>
 8001bc6:	2206      	movs	r2, #6
 8001bc8:	6d69      	ldr	r1, [r5, #84]	; 0x54
 8001bca:	6da8      	ldr	r0, [r5, #88]	; 0x58
 8001bcc:	f7fe fdc0 	bl	8000750 <memcpy>
 8001bd0:	6de9      	ldr	r1, [r5, #92]	; 0x5c
 8001bd2:	6da8      	ldr	r0, [r5, #88]	; 0x58
 8001bd4:	f7ff fc7e 	bl	80014d4 <eth_send>
 8001bd8:	2300      	movs	r3, #0
 8001bda:	636b      	str	r3, [r5, #52]	; 0x34
 8001bdc:	65eb      	str	r3, [r5, #92]	; 0x5c
 8001bde:	656b      	str	r3, [r5, #84]	; 0x54
 8001be0:	e761      	b.n	8001aa6 <NetReceive+0x13e>
 8001be2:	883a      	ldrh	r2, [r7, #0]
 8001be4:	0a13      	lsrs	r3, r2, #8
 8001be6:	ea43 2302 	orr.w	r3, r3, r2, lsl #8
 8001bea:	b21b      	sxth	r3, r3
 8001bec:	2b01      	cmp	r3, #1
 8001bee:	f47f af7c 	bne.w	8001aea <NetReceive+0x182>
 8001bf2:	887a      	ldrh	r2, [r7, #2]
 8001bf4:	0a13      	lsrs	r3, r2, #8
 8001bf6:	ea43 2302 	orr.w	r3, r3, r2, lsl #8
 8001bfa:	b21b      	sxth	r3, r3
 8001bfc:	f5b3 6f00 	cmp.w	r3, #2048	; 0x800
 8001c00:	f47f af73 	bne.w	8001aea <NetReceive+0x182>
 8001c04:	f240 4306 	movw	r3, #1030	; 0x406
 8001c08:	88ba      	ldrh	r2, [r7, #4]
 8001c0a:	429a      	cmp	r2, r3
 8001c0c:	f47f af6d 	bne.w	8001aea <NetReceive+0x182>
 8001c10:	4622      	mov	r2, r4
 8001c12:	f107 0118 	add.w	r1, r7, #24
 8001c16:	4815      	ldr	r0, [pc, #84]	; (8001c6c <NetReceive+0x304>)
 8001c18:	f7fe fd9a 	bl	8000750 <memcpy>
 8001c1c:	6e2b      	ldr	r3, [r5, #96]	; 0x60
 8001c1e:	b92b      	cbnz	r3, 8001c2c <NetReceive+0x2c4>
 8001c20:	4622      	mov	r2, r4
 8001c22:	f107 010e 	add.w	r1, r7, #14
 8001c26:	4812      	ldr	r0, [pc, #72]	; (8001c70 <NetReceive+0x308>)
 8001c28:	f7fe fd92 	bl	8000750 <memcpy>
 8001c2c:	f107 0108 	add.w	r1, r7, #8
 8001c30:	2206      	movs	r2, #6
 8001c32:	4810      	ldr	r0, [pc, #64]	; (8001c74 <NetReceive+0x30c>)
 8001c34:	f7fe fd8c 	bl	8000750 <memcpy>
 8001c38:	2300      	movs	r3, #0
 8001c3a:	6a2c      	ldr	r4, [r5, #32]
 8001c3c:	461a      	mov	r2, r3
 8001c3e:	4619      	mov	r1, r3
 8001c40:	4618      	mov	r0, r3
 8001c42:	47a0      	blx	r4
 8001c44:	e72f      	b.n	8001aa6 <NetReceive+0x13e>
 8001c46:	221c      	movs	r2, #28
 8001c48:	480b      	ldr	r0, [pc, #44]	; (8001c78 <NetReceive+0x310>)
 8001c4a:	f003 fb85 	bl	8005358 <printf>
 8001c4e:	e72a      	b.n	8001aa6 <NetReceive+0x13e>
 8001c50:	480a      	ldr	r0, [pc, #40]	; (8001c7c <NetReceive+0x314>)
 8001c52:	f003 fb81 	bl	8005358 <printf>
 8001c56:	e726      	b.n	8001aa6 <NetReceive+0x13e>
 8001c58:	4809      	ldr	r0, [pc, #36]	; (8001c80 <NetReceive+0x318>)
 8001c5a:	f003 fb71 	bl	8005340 <puts>
 8001c5e:	e722      	b.n	8001aa6 <NetReceive+0x13e>
 8001c60:	20000cfc 	.word	0x20000cfc
 8001c64:	20000030 	.word	0x20000030
 8001c68:	0800c908 	.word	0x0800c908
 8001c6c:	20000d2c 	.word	0x20000d2c
 8001c70:	20000d5c 	.word	0x20000d5c
 8001c74:	20000d60 	.word	0x20000d60
 8001c78:	0800c8f4 	.word	0x0800c8f4
 8001c7c:	0800c920 	.word	0x0800c920
 8001c80:	0800c934 	.word	0x0800c934
 8001c84:	7d3b      	ldrb	r3, [r7, #20]
 8001c86:	2b05      	cmp	r3, #5
 8001c88:	f47f af0d 	bne.w	8001aa6 <NetReceive+0x13e>
 8001c8c:	7d7b      	ldrb	r3, [r7, #21]
 8001c8e:	2b01      	cmp	r3, #1
 8001c90:	f47f af09 	bne.w	8001aa6 <NetReceive+0x13e>
 8001c94:	f107 0118 	add.w	r1, r7, #24
 8001c98:	4815      	ldr	r0, [pc, #84]	; (8001cf0 <NetReceive+0x388>)
 8001c9a:	f003 fb5d 	bl	8005358 <printf>
 8001c9e:	e702      	b.n	8001aa6 <NetReceive+0x13e>
 8001ca0:	4622      	mov	r2, r4
 8001ca2:	1db1      	adds	r1, r6, #6
 8001ca4:	4630      	mov	r0, r6
 8001ca6:	f7ff fdab 	bl	8001800 <NetSetEther>
 8001caa:	f44f 7300 	mov.w	r3, #512	; 0x200
 8001cae:	4605      	mov	r5, r0
 8001cb0:	f107 0408 	add.w	r4, r7, #8
 8001cb4:	80fb      	strh	r3, [r7, #6]
 8001cb6:	4621      	mov	r1, r4
 8001cb8:	464a      	mov	r2, r9
 8001cba:	f107 0012 	add.w	r0, r7, #18
 8001cbe:	370e      	adds	r7, #14
 8001cc0:	f7fe fd46 	bl	8000750 <memcpy>
 8001cc4:	4639      	mov	r1, r7
 8001cc6:	4652      	mov	r2, sl
 8001cc8:	4658      	mov	r0, fp
 8001cca:	f7fe fd41 	bl	8000750 <memcpy>
 8001cce:	464a      	mov	r2, r9
 8001cd0:	4620      	mov	r0, r4
 8001cd2:	4908      	ldr	r1, [pc, #32]	; (8001cf4 <NetReceive+0x38c>)
 8001cd4:	f7fe fd3c 	bl	8000750 <memcpy>
 8001cd8:	4652      	mov	r2, sl
 8001cda:	4638      	mov	r0, r7
 8001cdc:	4906      	ldr	r1, [pc, #24]	; (8001cf8 <NetReceive+0x390>)
 8001cde:	f7fe fd37 	bl	8000750 <memcpy>
 8001ce2:	f105 011c 	add.w	r1, r5, #28
 8001ce6:	4630      	mov	r0, r6
 8001ce8:	f7ff fbf4 	bl	80014d4 <eth_send>
 8001cec:	e6db      	b.n	8001aa6 <NetReceive+0x13e>
 8001cee:	bf00      	nop
 8001cf0:	0800c944 	.word	0x0800c944
 8001cf4:	20000d20 	.word	0x20000d20
 8001cf8:	20000d2c 	.word	0x20000d2c

08001cfc <NetSetIP>:
 8001cfc:	e92d 46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
 8001d00:	b083      	sub	sp, #12
 8001d02:	9d0a      	ldr	r5, [sp, #40]	; 0x28
 8001d04:	4699      	mov	r9, r3
 8001d06:	07eb      	lsls	r3, r5, #31
 8001d08:	4604      	mov	r4, r0
 8001d0a:	9101      	str	r1, [sp, #4]
 8001d0c:	4617      	mov	r7, r2
 8001d0e:	d503      	bpl.n	8001d18 <NetSetIP+0x1c>
 8001d10:	2200      	movs	r2, #0
 8001d12:	f105 031c 	add.w	r3, r5, #28
 8001d16:	54c2      	strb	r2, [r0, r3]
 8001d18:	2345      	movs	r3, #69	; 0x45
 8001d1a:	2600      	movs	r6, #0
 8001d1c:	21ff      	movs	r1, #255	; 0xff
 8001d1e:	2011      	movs	r0, #17
 8001d20:	f04f 0a40 	mov.w	sl, #64	; 0x40
 8001d24:	b2ad      	uxth	r5, r5
 8001d26:	f8df e090 	ldr.w	lr, [pc, #144]	; 8001db8 <NetSetIP+0xbc>
 8001d2a:	7023      	strb	r3, [r4, #0]
 8001d2c:	f105 031c 	add.w	r3, r5, #28
 8001d30:	7066      	strb	r6, [r4, #1]
 8001d32:	ba5b      	rev16	r3, r3
 8001d34:	f8de 206c 	ldr.w	r2, [lr, #108]	; 0x6c
 8001d38:	8063      	strh	r3, [r4, #2]
 8001d3a:	4b1e      	ldr	r3, [pc, #120]	; (8001db4 <NetSetIP+0xb8>)
 8001d3c:	f102 0c01 	add.w	ip, r2, #1
 8001d40:	ea03 2302 	and.w	r3, r3, r2, lsl #8
 8001d44:	f3c2 2207 	ubfx	r2, r2, #8, #8
 8001d48:	4313      	orrs	r3, r2
 8001d4a:	80a3      	strh	r3, [r4, #4]
 8001d4c:	7221      	strb	r1, [r4, #8]
 8001d4e:	7260      	strb	r0, [r4, #9]
 8001d50:	f10e 0130 	add.w	r1, lr, #48	; 0x30
 8001d54:	2204      	movs	r2, #4
 8001d56:	8166      	strh	r6, [r4, #10]
 8001d58:	f8a4 a006 	strh.w	sl, [r4, #6]
 8001d5c:	f104 000c 	add.w	r0, r4, #12
 8001d60:	f8ce c06c 	str.w	ip, [lr, #108]	; 0x6c
 8001d64:	f7fe fcf4 	bl	8000750 <memcpy>
 8001d68:	2204      	movs	r2, #4
 8001d6a:	f104 0010 	add.w	r0, r4, #16
 8001d6e:	eb0d 0102 	add.w	r1, sp, r2
 8001d72:	f7fe fced 	bl	8000750 <memcpy>
 8001d76:	4630      	mov	r0, r6
 8001d78:	4621      	mov	r1, r4
 8001d7a:	3508      	adds	r5, #8
 8001d7c:	ba6d      	rev16	r5, r5
 8001d7e:	fa99 f999 	rev16.w	r9, r9
 8001d82:	ba7f      	rev16	r7, r7
 8001d84:	8325      	strh	r5, [r4, #24]
 8001d86:	8366      	strh	r6, [r4, #26]
 8001d88:	f8a4 9014 	strh.w	r9, [r4, #20]
 8001d8c:	82e7      	strh	r7, [r4, #22]
 8001d8e:	f104 0214 	add.w	r2, r4, #20
 8001d92:	f831 3b02 	ldrh.w	r3, [r1], #2
 8001d96:	428a      	cmp	r2, r1
 8001d98:	4418      	add	r0, r3
 8001d9a:	d1fa      	bne.n	8001d92 <NetSetIP+0x96>
 8001d9c:	b283      	uxth	r3, r0
 8001d9e:	eb03 4310 	add.w	r3, r3, r0, lsr #16
 8001da2:	b298      	uxth	r0, r3
 8001da4:	eb00 4013 	add.w	r0, r0, r3, lsr #16
 8001da8:	43c0      	mvns	r0, r0
 8001daa:	8160      	strh	r0, [r4, #10]
 8001dac:	b003      	add	sp, #12
 8001dae:	e8bd 86f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, pc}
 8001db2:	bf00      	nop
 8001db4:	00ffff00 	.word	0x00ffff00
 8001db8:	20000cfc 	.word	0x20000cfc

08001dbc <NetSendUDPPacket>:
 8001dbc:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8001dc0:	460e      	mov	r6, r1
 8001dc2:	3901      	subs	r1, #1
 8001dc4:	3103      	adds	r1, #3
 8001dc6:	4f2e      	ldr	r7, [pc, #184]	; (8001e80 <NetSendUDPPacket+0xc4>)
 8001dc8:	bf98      	it	ls
 8001dca:	4607      	movls	r7, r0
 8001dcc:	4c2d      	ldr	r4, [pc, #180]	; (8001e84 <NetSendUDPPacket+0xc8>)
 8001dce:	b084      	sub	sp, #16
 8001dd0:	4692      	mov	sl, r2
 8001dd2:	4638      	mov	r0, r7
 8001dd4:	f104 0170 	add.w	r1, r4, #112	; 0x70
 8001dd8:	f04f 0206 	mov.w	r2, #6
 8001ddc:	bf88      	it	hi
 8001dde:	f04f 36ff 	movhi.w	r6, #4294967295	; 0xffffffff
 8001de2:	469b      	mov	fp, r3
 8001de4:	9d0c      	ldr	r5, [sp, #48]	; 0x30
 8001de6:	f7fe fcf5 	bl	80007d4 <memcmp>
 8001dea:	b1d0      	cbz	r0, 8001e22 <NetSendUDPPacket+0x66>
 8001dec:	f8d4 902c 	ldr.w	r9, [r4, #44]	; 0x2c
 8001df0:	4639      	mov	r1, r7
 8001df2:	4648      	mov	r0, r9
 8001df4:	f44f 6200 	mov.w	r2, #2048	; 0x800
 8001df8:	f7ff fd02 	bl	8001800 <NetSetEther>
 8001dfc:	4481      	add	r9, r0
 8001dfe:	9500      	str	r5, [sp, #0]
 8001e00:	465b      	mov	r3, fp
 8001e02:	4652      	mov	r2, sl
 8001e04:	4631      	mov	r1, r6
 8001e06:	4648      	mov	r0, r9
 8001e08:	f7ff ff78 	bl	8001cfc <NetSetIP>
 8001e0c:	6ae0      	ldr	r0, [r4, #44]	; 0x2c
 8001e0e:	351c      	adds	r5, #28
 8001e10:	eba9 0100 	sub.w	r1, r9, r0
 8001e14:	4429      	add	r1, r5
 8001e16:	f7ff fb5d 	bl	80014d4 <eth_send>
 8001e1a:	2000      	movs	r0, #0
 8001e1c:	b004      	add	sp, #16
 8001e1e:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8001e22:	6da3      	ldr	r3, [r4, #88]	; 0x58
 8001e24:	4681      	mov	r9, r0
 8001e26:	4639      	mov	r1, r7
 8001e28:	4618      	mov	r0, r3
 8001e2a:	f44f 6200 	mov.w	r2, #2048	; 0x800
 8001e2e:	9303      	str	r3, [sp, #12]
 8001e30:	6567      	str	r7, [r4, #84]	; 0x54
 8001e32:	6366      	str	r6, [r4, #52]	; 0x34
 8001e34:	f7ff fce4 	bl	8001800 <NetSetEther>
 8001e38:	9b03      	ldr	r3, [sp, #12]
 8001e3a:	9500      	str	r5, [sp, #0]
 8001e3c:	181f      	adds	r7, r3, r0
 8001e3e:	4652      	mov	r2, sl
 8001e40:	465b      	mov	r3, fp
 8001e42:	4631      	mov	r1, r6
 8001e44:	4638      	mov	r0, r7
 8001e46:	f7ff ff59 	bl	8001cfc <NetSetIP>
 8001e4a:	6da3      	ldr	r3, [r4, #88]	; 0x58
 8001e4c:	6ae1      	ldr	r1, [r4, #44]	; 0x2c
 8001e4e:	1afb      	subs	r3, r7, r3
 8001e50:	331c      	adds	r3, #28
 8001e52:	4419      	add	r1, r3
 8001e54:	462a      	mov	r2, r5
 8001e56:	f107 001c 	add.w	r0, r7, #28
 8001e5a:	f7fe fc79 	bl	8000750 <memcpy>
 8001e5e:	6da3      	ldr	r3, [r4, #88]	; 0x58
 8001e60:	351c      	adds	r5, #28
 8001e62:	1aff      	subs	r7, r7, r3
 8001e64:	2301      	movs	r3, #1
 8001e66:	4648      	mov	r0, r9
 8001e68:	443d      	add	r5, r7
 8001e6a:	64a3      	str	r3, [r4, #72]	; 0x48
 8001e6c:	65e5      	str	r5, [r4, #92]	; 0x5c
 8001e6e:	f7fe fdd5 	bl	8000a1c <get_timer>
 8001e72:	6460      	str	r0, [r4, #68]	; 0x44
 8001e74:	f7ff fd04 	bl	8001880 <ArpRequest>
 8001e78:	2001      	movs	r0, #1
 8001e7a:	b004      	add	sp, #16
 8001e7c:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8001e80:	20000034 	.word	0x20000034
 8001e84:	20000cfc 	.word	0x20000cfc

08001e88 <copy_filename>:
 8001e88:	f991 3000 	ldrsb.w	r3, [r1]
 8001e8c:	2b22      	cmp	r3, #34	; 0x22
 8001e8e:	bf04      	itt	eq
 8001e90:	f102 32ff 	addeq.w	r2, r2, #4294967295	; 0xffffffff
 8001e94:	3101      	addeq	r1, #1
 8001e96:	2a01      	cmp	r2, #1
 8001e98:	dd10      	ble.n	8001ebc <copy_filename+0x34>
 8001e9a:	f991 3000 	ldrsb.w	r3, [r1]
 8001e9e:	b16b      	cbz	r3, 8001ebc <copy_filename+0x34>
 8001ea0:	2b22      	cmp	r3, #34	; 0x22
 8001ea2:	d00b      	beq.n	8001ebc <copy_filename+0x34>
 8001ea4:	3a01      	subs	r2, #1
 8001ea6:	4402      	add	r2, r0
 8001ea8:	e004      	b.n	8001eb4 <copy_filename+0x2c>
 8001eaa:	f911 3f01 	ldrsb.w	r3, [r1, #1]!
 8001eae:	b12b      	cbz	r3, 8001ebc <copy_filename+0x34>
 8001eb0:	2b22      	cmp	r3, #34	; 0x22
 8001eb2:	d003      	beq.n	8001ebc <copy_filename+0x34>
 8001eb4:	f800 3b01 	strb.w	r3, [r0], #1
 8001eb8:	4282      	cmp	r2, r0
 8001eba:	d1f6      	bne.n	8001eaa <copy_filename+0x22>
 8001ebc:	2300      	movs	r3, #0
 8001ebe:	7003      	strb	r3, [r0, #0]
 8001ec0:	4770      	bx	lr
 8001ec2:	bf00      	nop

08001ec4 <ip_to_string>:
 8001ec4:	b510      	push	{r4, lr}
 8001ec6:	ba02      	rev	r2, r0
 8001ec8:	b082      	sub	sp, #8
 8001eca:	b2d4      	uxtb	r4, r2
 8001ecc:	f3c2 2307 	ubfx	r3, r2, #8, #8
 8001ed0:	e88d 0018 	stmia.w	sp, {r3, r4}
 8001ed4:	4608      	mov	r0, r1
 8001ed6:	f3c2 4307 	ubfx	r3, r2, #16, #8
 8001eda:	4903      	ldr	r1, [pc, #12]	; (8001ee8 <ip_to_string+0x24>)
 8001edc:	0e12      	lsrs	r2, r2, #24
 8001ede:	f007 f9f1 	bl	80092c4 <sprintf>
 8001ee2:	b002      	add	sp, #8
 8001ee4:	bd10      	pop	{r4, pc}
 8001ee6:	bf00      	nop
 8001ee8:	0800c964 	.word	0x0800c964

08001eec <VLAN_to_string>:
 8001eec:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8001ef0:	ba42      	rev16	r2, r0
 8001ef2:	b292      	uxth	r2, r2
 8001ef4:	429a      	cmp	r2, r3
 8001ef6:	d009      	beq.n	8001f0c <VLAN_to_string+0x20>
 8001ef8:	f640 73ff 	movw	r3, #4095	; 0xfff
 8001efc:	429a      	cmp	r2, r3
 8001efe:	d005      	beq.n	8001f0c <VLAN_to_string+0x20>
 8001f00:	4608      	mov	r0, r1
 8001f02:	f3c2 020b 	ubfx	r2, r2, #0, #12
 8001f06:	4903      	ldr	r1, [pc, #12]	; (8001f14 <VLAN_to_string+0x28>)
 8001f08:	f007 b9dc 	b.w	80092c4 <sprintf>
 8001f0c:	4608      	mov	r0, r1
 8001f0e:	4902      	ldr	r1, [pc, #8]	; (8001f18 <VLAN_to_string+0x2c>)
 8001f10:	f7fe ba36 	b.w	8000380 <strcpy>
 8001f14:	0800c978 	.word	0x0800c978
 8001f18:	0800c970 	.word	0x0800c970

08001f1c <string_to_VLAN>:
 8001f1c:	b138      	cbz	r0, 8001f2e <string_to_VLAN+0x12>
 8001f1e:	b508      	push	{r3, lr}
 8001f20:	7803      	ldrb	r3, [r0, #0]
 8001f22:	3b30      	subs	r3, #48	; 0x30
 8001f24:	2b09      	cmp	r3, #9
 8001f26:	d905      	bls.n	8001f34 <string_to_VLAN+0x18>
 8001f28:	f64f 700f 	movw	r0, #65295	; 0xff0f
 8001f2c:	bd08      	pop	{r3, pc}
 8001f2e:	f64f 700f 	movw	r0, #65295	; 0xff0f
 8001f32:	4770      	bx	lr
 8001f34:	220a      	movs	r2, #10
 8001f36:	2100      	movs	r1, #0
 8001f38:	f006 fcce 	bl	80088d8 <simple_strtoul>
 8001f3c:	ba40      	rev16	r0, r0
 8001f3e:	b280      	uxth	r0, r0
 8001f40:	bd08      	pop	{r3, pc}
 8001f42:	bf00      	nop

08001f44 <NetLoop>:
 8001f44:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8001f48:	2200      	movs	r2, #0
 8001f4a:	2601      	movs	r6, #1
 8001f4c:	4c90      	ldr	r4, [pc, #576]	; (8002190 <NetLoop+0x24c>)
 8001f4e:	4991      	ldr	r1, [pc, #580]	; (8002194 <NetLoop+0x250>)
 8001f50:	f104 0397 	add.w	r3, r4, #151	; 0x97
 8001f54:	f023 031f 	bic.w	r3, r3, #31
 8001f58:	4605      	mov	r5, r0
 8001f5a:	f503 60c0 	add.w	r0, r3, #1536	; 0x600
 8001f5e:	f8d8 9000 	ldr.w	r9, [r8]
 8001f62:	f601 57cf 	addw	r7, r1, #3535	; 0xdcf
 8001f66:	f8c1 0da0 	str.w	r0, [r1, #3488]	; 0xda0
 8001f6a:	f503 6040 	add.w	r0, r3, #3072	; 0xc00
 8001f6e:	f8c1 0da4 	str.w	r0, [r1, #3492]	; 0xda4
 8001f72:	b088      	sub	sp, #32
 8001f74:	f503 5090 	add.w	r0, r3, #4608	; 0x1200
 8001f78:	62e3      	str	r3, [r4, #44]	; 0x2c
 8001f7a:	f027 071f 	bic.w	r7, r7, #31
 8001f7e:	f503 53c0 	add.w	r3, r3, #6144	; 0x1800
 8001f82:	f8c1 0da8 	str.w	r0, [r1, #3496]	; 0xda8
 8001f86:	60a2      	str	r2, [r4, #8]
 8001f88:	f8c1 3dac 	str.w	r3, [r1, #3500]	; 0xdac
 8001f8c:	6122      	str	r2, [r4, #16]
 8001f8e:	6562      	str	r2, [r4, #84]	; 0x54
 8001f90:	6362      	str	r2, [r4, #52]	; 0x34
 8001f92:	6422      	str	r2, [r4, #64]	; 0x40
 8001f94:	65e2      	str	r2, [r4, #92]	; 0x5c
 8001f96:	65a7      	str	r7, [r4, #88]	; 0x58
 8001f98:	6066      	str	r6, [r4, #4]
 8001f9a:	f7ff fa8f 	bl	80014bc <eth_halt>
 8001f9e:	f7ff fb2d 	bl	80015fc <eth_set_current>
 8001fa2:	4648      	mov	r0, r9
 8001fa4:	f7ff fae8 	bl	8001578 <eth_init>
 8001fa8:	2800      	cmp	r0, #0
 8001faa:	f2c0 80c7 	blt.w	800213c <NetLoop+0x1f8>
 8001fae:	f240 1213 	movw	r2, #275	; 0x113
 8001fb2:	fa06 f305 	lsl.w	r3, r6, r5
 8001fb6:	ea03 0b02 	and.w	fp, r3, r2
 8001fba:	4e77      	ldr	r6, [pc, #476]	; (8002198 <NetLoop+0x254>)
 8001fbc:	f403 7302 	and.w	r3, r3, #520	; 0x208
 8001fc0:	9301      	str	r3, [sp, #4]
 8001fc2:	f104 0724 	add.w	r7, r4, #36	; 0x24
 8001fc6:	f104 0a30 	add.w	sl, r4, #48	; 0x30
 8001fca:	f7ff f961 	bl	8001290 <eth_get_dev>
 8001fce:	2206      	movs	r2, #6
 8001fd0:	f100 0110 	add.w	r1, r0, #16
 8001fd4:	4638      	mov	r0, r7
 8001fd6:	f7fe fbbb 	bl	8000750 <memcpy>
 8001fda:	2201      	movs	r2, #1
 8001fdc:	f8d8 9000 	ldr.w	r9, [r8]
 8001fe0:	6022      	str	r2, [r4, #0]
 8001fe2:	f002 fcf7 	bl	80049d4 <get_env_id>
 8001fe6:	f8d6 22d8 	ldr.w	r2, [r6, #728]	; 0x2d8
 8001fea:	9000      	str	r0, [sp, #0]
 8001fec:	4290      	cmp	r0, r2
 8001fee:	d02a      	beq.n	8002046 <NetLoop+0x102>
 8001ff0:	f109 0104 	add.w	r1, r9, #4
 8001ff4:	2204      	movs	r2, #4
 8001ff6:	4650      	mov	r0, sl
 8001ff8:	f7fe fbaa 	bl	8000750 <memcpy>
 8001ffc:	4867      	ldr	r0, [pc, #412]	; (800219c <NetLoop+0x258>)
 8001ffe:	f002 ff69 	bl	8004ed4 <getenv>
 8002002:	f006 fa19 	bl	8008438 <string_to_ip>
 8002006:	63e0      	str	r0, [r4, #60]	; 0x3c
 8002008:	4865      	ldr	r0, [pc, #404]	; (80021a0 <NetLoop+0x25c>)
 800200a:	f002 ff63 	bl	8004ed4 <getenv>
 800200e:	f006 fa13 	bl	8008438 <string_to_ip>
 8002012:	63a0      	str	r0, [r4, #56]	; 0x38
 8002014:	4863      	ldr	r0, [pc, #396]	; (80021a4 <NetLoop+0x260>)
 8002016:	f002 ff5d 	bl	8004ed4 <getenv>
 800201a:	f006 fa0d 	bl	8008438 <string_to_ip>
 800201e:	6620      	str	r0, [r4, #96]	; 0x60
 8002020:	4861      	ldr	r0, [pc, #388]	; (80021a8 <NetLoop+0x264>)
 8002022:	f002 ff57 	bl	8004ed4 <getenv>
 8002026:	f7ff ff79 	bl	8001f1c <string_to_VLAN>
 800202a:	f8df 91bc 	ldr.w	r9, [pc, #444]	; 80021e8 <NetLoop+0x2a4>
 800202e:	f8a9 000a 	strh.w	r0, [r9, #10]
 8002032:	485e      	ldr	r0, [pc, #376]	; (80021ac <NetLoop+0x268>)
 8002034:	f002 ff4e 	bl	8004ed4 <getenv>
 8002038:	f7ff ff70 	bl	8001f1c <string_to_VLAN>
 800203c:	9b00      	ldr	r3, [sp, #0]
 800203e:	f8a9 0000 	strh.w	r0, [r9]
 8002042:	f8c6 32d8 	str.w	r3, [r6, #728]	; 0x2d8
 8002046:	2d09      	cmp	r5, #9
 8002048:	d804      	bhi.n	8002054 <NetLoop+0x110>
 800204a:	f1bb 0f00 	cmp.w	fp, #0
 800204e:	d12f      	bne.n	80020b0 <NetLoop+0x16c>
 8002050:	9b01      	ldr	r3, [sp, #4]
 8002052:	bb3b      	cbnz	r3, 80020a4 <NetLoop+0x160>
 8002054:	2301      	movs	r3, #1
 8002056:	429d      	cmp	r5, r3
 8002058:	6123      	str	r3, [r4, #16]
 800205a:	d076      	beq.n	800214a <NetLoop+0x206>
 800205c:	d37c      	bcc.n	8002158 <NetLoop+0x214>
 800205e:	2d03      	cmp	r5, #3
 8002060:	d04d      	beq.n	80020fe <NetLoop+0x1ba>
 8002062:	2300      	movs	r3, #0
 8002064:	f8c6 32dc 	str.w	r3, [r6, #732]	; 0x2dc
 8002068:	f7ff fa44 	bl	80014f4 <eth_rx>
 800206c:	f003 f996 	bl	800539c <ctrlc>
 8002070:	4681      	mov	r9, r0
 8002072:	2800      	cmp	r0, #0
 8002074:	f040 8084 	bne.w	8002180 <NetLoop+0x23c>
 8002078:	f7ff fc50 	bl	800191c <ArpTimeoutCheck>
 800207c:	6963      	ldr	r3, [r4, #20]
 800207e:	b13b      	cbz	r3, 8002090 <NetLoop+0x14c>
 8002080:	4648      	mov	r0, r9
 8002082:	f7fe fccb 	bl	8000a1c <get_timer>
 8002086:	69a3      	ldr	r3, [r4, #24]
 8002088:	69e2      	ldr	r2, [r4, #28]
 800208a:	1ac0      	subs	r0, r0, r3
 800208c:	4290      	cmp	r0, r2
 800208e:	d831      	bhi.n	80020f4 <NetLoop+0x1b0>
 8002090:	6823      	ldr	r3, [r4, #0]
 8002092:	2b03      	cmp	r3, #3
 8002094:	d024      	beq.n	80020e0 <NetLoop+0x19c>
 8002096:	2b04      	cmp	r3, #4
 8002098:	d01d      	beq.n	80020d6 <NetLoop+0x192>
 800209a:	2b02      	cmp	r3, #2
 800209c:	d1e4      	bne.n	8002068 <NetLoop+0x124>
 800209e:	2301      	movs	r3, #1
 80020a0:	60a3      	str	r3, [r4, #8]
 80020a2:	e792      	b.n	8001fca <NetLoop+0x86>
 80020a4:	6e23      	ldr	r3, [r4, #96]	; 0x60
 80020a6:	2b00      	cmp	r3, #0
 80020a8:	d045      	beq.n	8002136 <NetLoop+0x1f2>
 80020aa:	6b23      	ldr	r3, [r4, #48]	; 0x30
 80020ac:	2b00      	cmp	r3, #0
 80020ae:	d063      	beq.n	8002178 <NetLoop+0x234>
 80020b0:	2206      	movs	r2, #6
 80020b2:	493f      	ldr	r1, [pc, #252]	; (80021b0 <NetLoop+0x26c>)
 80020b4:	4638      	mov	r0, r7
 80020b6:	f7fe fb8d 	bl	80007d4 <memcmp>
 80020ba:	2800      	cmp	r0, #0
 80020bc:	d1ca      	bne.n	8002054 <NetLoop+0x110>
 80020be:	f7ff f91f 	bl	8001300 <eth_get_dev_index>
 80020c2:	1c43      	adds	r3, r0, #1
 80020c4:	d054      	beq.n	8002170 <NetLoop+0x22c>
 80020c6:	2800      	cmp	r0, #0
 80020c8:	d14d      	bne.n	8002166 <NetLoop+0x222>
 80020ca:	483a      	ldr	r0, [pc, #232]	; (80021b4 <NetLoop+0x270>)
 80020cc:	f003 f938 	bl	8005340 <puts>
 80020d0:	f7ff fad4 	bl	800167c <NetStartAgain>
 80020d4:	e7c8      	b.n	8002068 <NetLoop+0x124>
 80020d6:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 80020da:	b008      	add	sp, #32
 80020dc:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 80020e0:	f8d6 22dc 	ldr.w	r2, [r6, #732]	; 0x2dc
 80020e4:	b972      	cbnz	r2, 8002104 <NetLoop+0x1c0>
 80020e6:	f7ff f9e9 	bl	80014bc <eth_halt>
 80020ea:	f8d6 02dc 	ldr.w	r0, [r6, #732]	; 0x2dc
 80020ee:	b008      	add	sp, #32
 80020f0:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 80020f4:	6963      	ldr	r3, [r4, #20]
 80020f6:	f8c4 9014 	str.w	r9, [r4, #20]
 80020fa:	4798      	blx	r3
 80020fc:	e7c8      	b.n	8002090 <NetLoop+0x14c>
 80020fe:	f000 facf 	bl	80026a0 <TftpStart>
 8002102:	e7ae      	b.n	8002062 <NetLoop+0x11e>
 8002104:	4611      	mov	r1, r2
 8002106:	482c      	ldr	r0, [pc, #176]	; (80021b8 <NetLoop+0x274>)
 8002108:	f003 f926 	bl	8005358 <printf>
 800210c:	f8d6 22dc 	ldr.w	r2, [r6, #732]	; 0x2dc
 8002110:	a803      	add	r0, sp, #12
 8002112:	492a      	ldr	r1, [pc, #168]	; (80021bc <NetLoop+0x278>)
 8002114:	f007 f8d6 	bl	80092c4 <sprintf>
 8002118:	a903      	add	r1, sp, #12
 800211a:	4829      	ldr	r0, [pc, #164]	; (80021c0 <NetLoop+0x27c>)
 800211c:	f002 feac 	bl	8004e78 <setenv>
 8002120:	4b28      	ldr	r3, [pc, #160]	; (80021c4 <NetLoop+0x280>)
 8002122:	a803      	add	r0, sp, #12
 8002124:	681a      	ldr	r2, [r3, #0]
 8002126:	4925      	ldr	r1, [pc, #148]	; (80021bc <NetLoop+0x278>)
 8002128:	f007 f8cc 	bl	80092c4 <sprintf>
 800212c:	a903      	add	r1, sp, #12
 800212e:	4826      	ldr	r0, [pc, #152]	; (80021c8 <NetLoop+0x284>)
 8002130:	f002 fea2 	bl	8004e78 <setenv>
 8002134:	e7d7      	b.n	80020e6 <NetLoop+0x1a2>
 8002136:	4825      	ldr	r0, [pc, #148]	; (80021cc <NetLoop+0x288>)
 8002138:	f003 f902 	bl	8005340 <puts>
 800213c:	f7ff f9be 	bl	80014bc <eth_halt>
 8002140:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8002144:	b008      	add	sp, #32
 8002146:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 800214a:	2300      	movs	r3, #0
 800214c:	4a20      	ldr	r2, [pc, #128]	; (80021d0 <NetLoop+0x28c>)
 800214e:	6323      	str	r3, [r4, #48]	; 0x30
 8002150:	6013      	str	r3, [r2, #0]
 8002152:	f000 f869 	bl	8002228 <RarpRequest>
 8002156:	e784      	b.n	8002062 <NetLoop+0x11e>
 8002158:	2300      	movs	r3, #0
 800215a:	4a1e      	ldr	r2, [pc, #120]	; (80021d4 <NetLoop+0x290>)
 800215c:	6323      	str	r3, [r4, #48]	; 0x30
 800215e:	6013      	str	r3, [r2, #0]
 8002160:	f000 fd36 	bl	8002bd0 <BootpRequest>
 8002164:	e77d      	b.n	8002062 <NetLoop+0x11e>
 8002166:	4601      	mov	r1, r0
 8002168:	481b      	ldr	r0, [pc, #108]	; (80021d8 <NetLoop+0x294>)
 800216a:	f003 f8f5 	bl	8005358 <printf>
 800216e:	e7af      	b.n	80020d0 <NetLoop+0x18c>
 8002170:	481a      	ldr	r0, [pc, #104]	; (80021dc <NetLoop+0x298>)
 8002172:	f003 f8e5 	bl	8005340 <puts>
 8002176:	e7e1      	b.n	800213c <NetLoop+0x1f8>
 8002178:	4819      	ldr	r0, [pc, #100]	; (80021e0 <NetLoop+0x29c>)
 800217a:	f003 f8e1 	bl	8005340 <puts>
 800217e:	e7dd      	b.n	800213c <NetLoop+0x1f8>
 8002180:	f7ff f99c 	bl	80014bc <eth_halt>
 8002184:	4817      	ldr	r0, [pc, #92]	; (80021e4 <NetLoop+0x2a0>)
 8002186:	f003 f8db 	bl	8005340 <puts>
 800218a:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 800218e:	e7a4      	b.n	80020da <NetLoop+0x196>
 8002190:	20000cfc 	.word	0x20000cfc
 8002194:	20001df4 	.word	0x20001df4
 8002198:	20002eec 	.word	0x20002eec
 800219c:	0800c97c 	.word	0x0800c97c
 80021a0:	0800c988 	.word	0x0800c988
 80021a4:	0800c990 	.word	0x0800c990
 80021a8:	0800c99c 	.word	0x0800c99c
 80021ac:	0800c9a4 	.word	0x0800c9a4
 80021b0:	0800c87c 	.word	0x0800c87c
 80021b4:	0800ca0c 	.word	0x0800ca0c
 80021b8:	0800ca54 	.word	0x0800ca54
 80021bc:	0800ca78 	.word	0x0800ca78
 80021c0:	0800ca7c 	.word	0x0800ca7c
 80021c4:	20000058 	.word	0x20000058
 80021c8:	0800ca88 	.word	0x0800ca88
 80021cc:	0800c9ac 	.word	0x0800c9ac
 80021d0:	200032d4 	.word	0x200032d4
 80021d4:	20003390 	.word	0x20003390
 80021d8:	0800ca2c 	.word	0x0800ca2c
 80021dc:	0800c9ec 	.word	0x0800c9ec
 80021e0:	0800c9cc 	.word	0x0800c9cc
 80021e4:	0800ca4c 	.word	0x0800ca4c
 80021e8:	20000030 	.word	0x20000030

080021ec <getenv_VLAN>:
 80021ec:	b508      	push	{r3, lr}
 80021ee:	f002 fe71 	bl	8004ed4 <getenv>
 80021f2:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80021f6:	f7ff be91 	b.w	8001f1c <string_to_VLAN>
 80021fa:	bf00      	nop

080021fc <RarpHandler>:
 80021fc:	b508      	push	{r3, lr}
 80021fe:	4808      	ldr	r0, [pc, #32]	; (8002220 <RarpHandler+0x24>)
 8002200:	f002 fe68 	bl	8004ed4 <getenv>
 8002204:	b118      	cbz	r0, 800220e <RarpHandler+0x12>
 8002206:	f990 3000 	ldrsb.w	r3, [r0]
 800220a:	2b6e      	cmp	r3, #110	; 0x6e
 800220c:	d003      	beq.n	8002216 <RarpHandler+0x1a>
 800220e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8002212:	f000 ba45 	b.w	80026a0 <TftpStart>
 8002216:	2203      	movs	r2, #3
 8002218:	4b02      	ldr	r3, [pc, #8]	; (8002224 <RarpHandler+0x28>)
 800221a:	601a      	str	r2, [r3, #0]
 800221c:	bd08      	pop	{r3, pc}
 800221e:	bf00      	nop
 8002220:	0800ca94 	.word	0x0800ca94
 8002224:	20000cfc 	.word	0x20000cfc

08002228 <RarpRequest>:
 8002228:	4a23      	ldr	r2, [pc, #140]	; (80022b8 <RarpRequest+0x90>)
 800222a:	e92d 42f0 	stmdb	sp!, {r4, r5, r6, r7, r9, lr}
 800222e:	6813      	ldr	r3, [r2, #0]
 8002230:	4e22      	ldr	r6, [pc, #136]	; (80022bc <RarpRequest+0x94>)
 8002232:	3301      	adds	r3, #1
 8002234:	4619      	mov	r1, r3
 8002236:	4822      	ldr	r0, [pc, #136]	; (80022c0 <RarpRequest+0x98>)
 8002238:	6013      	str	r3, [r2, #0]
 800223a:	f003 f88d 	bl	8005358 <printf>
 800223e:	6834      	ldr	r4, [r6, #0]
 8002240:	f248 0235 	movw	r2, #32821	; 0x8035
 8002244:	4620      	mov	r0, r4
 8002246:	491f      	ldr	r1, [pc, #124]	; (80022c4 <RarpRequest+0x9c>)
 8002248:	f7ff fada 	bl	8001800 <NetSetEther>
 800224c:	f44f 7180 	mov.w	r1, #256	; 0x100
 8002250:	f44f 7340 	mov.w	r3, #768	; 0x300
 8002254:	2506      	movs	r5, #6
 8002256:	2208      	movs	r2, #8
 8002258:	f04f 0904 	mov.w	r9, #4
 800225c:	4f1a      	ldr	r7, [pc, #104]	; (80022c8 <RarpRequest+0xa0>)
 800225e:	5221      	strh	r1, [r4, r0]
 8002260:	4404      	add	r4, r0
 8002262:	80e3      	strh	r3, [r4, #6]
 8002264:	8062      	strh	r2, [r4, #2]
 8002266:	18a0      	adds	r0, r4, r2
 8002268:	4639      	mov	r1, r7
 800226a:	462a      	mov	r2, r5
 800226c:	7125      	strb	r5, [r4, #4]
 800226e:	f884 9005 	strb.w	r9, [r4, #5]
 8002272:	f7fe fa6d 	bl	8000750 <memcpy>
 8002276:	464a      	mov	r2, r9
 8002278:	f104 000e 	add.w	r0, r4, #14
 800227c:	4913      	ldr	r1, [pc, #76]	; (80022cc <RarpRequest+0xa4>)
 800227e:	f7fe fa67 	bl	8000750 <memcpy>
 8002282:	462a      	mov	r2, r5
 8002284:	4639      	mov	r1, r7
 8002286:	f104 0012 	add.w	r0, r4, #18
 800228a:	f7fe fa61 	bl	8000750 <memcpy>
 800228e:	23ff      	movs	r3, #255	; 0xff
 8002290:	6830      	ldr	r0, [r6, #0]
 8002292:	7623      	strb	r3, [r4, #24]
 8002294:	1a21      	subs	r1, r4, r0
 8002296:	7663      	strb	r3, [r4, #25]
 8002298:	76a3      	strb	r3, [r4, #26]
 800229a:	76e3      	strb	r3, [r4, #27]
 800229c:	311c      	adds	r1, #28
 800229e:	f7ff fa5f 	bl	8001760 <NetSendPacket>
 80022a2:	f241 3088 	movw	r0, #5000	; 0x1388
 80022a6:	490a      	ldr	r1, [pc, #40]	; (80022d0 <RarpRequest+0xa8>)
 80022a8:	f7ff fa4a 	bl	8001740 <NetSetTimeout>
 80022ac:	e8bd 42f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, lr}
 80022b0:	4808      	ldr	r0, [pc, #32]	; (80022d4 <RarpRequest+0xac>)
 80022b2:	f7ff ba3f 	b.w	8001734 <NetSetHandler>
 80022b6:	bf00      	nop
 80022b8:	200032d4 	.word	0x200032d4
 80022bc:	20000d28 	.word	0x20000d28
 80022c0:	0800caa0 	.word	0x0800caa0
 80022c4:	20000034 	.word	0x20000034
 80022c8:	20000d20 	.word	0x20000d20
 80022cc:	20000d2c 	.word	0x20000d2c
 80022d0:	080022d9 	.word	0x080022d9
 80022d4:	080021fd 	.word	0x080021fd

080022d8 <RarpTimeout>:
 80022d8:	b508      	push	{r3, lr}
 80022da:	4b0a      	ldr	r3, [pc, #40]	; (8002304 <RarpTimeout+0x2c>)
 80022dc:	681b      	ldr	r3, [r3, #0]
 80022de:	2b04      	cmp	r3, #4
 80022e0:	dc08      	bgt.n	80022f4 <RarpTimeout+0x1c>
 80022e2:	4909      	ldr	r1, [pc, #36]	; (8002308 <RarpTimeout+0x30>)
 80022e4:	f241 3088 	movw	r0, #5000	; 0x1388
 80022e8:	f7ff fa2a 	bl	8001740 <NetSetTimeout>
 80022ec:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80022f0:	f7ff bf9a 	b.w	8002228 <RarpRequest>
 80022f4:	4805      	ldr	r0, [pc, #20]	; (800230c <RarpTimeout+0x34>)
 80022f6:	f003 f823 	bl	8005340 <puts>
 80022fa:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80022fe:	f7ff b9bd 	b.w	800167c <NetStartAgain>
 8002302:	bf00      	nop
 8002304:	200032d4 	.word	0x200032d4
 8002308:	080022d9 	.word	0x080022d9
 800230c:	0800cab4 	.word	0x0800cab4

08002310 <TftpSend>:
 8002310:	b5f0      	push	{r4, r5, r6, r7, lr}
 8002312:	4b3a      	ldr	r3, [pc, #232]	; (80023fc <TftpSend+0xec>)
 8002314:	b083      	sub	sp, #12
 8002316:	681f      	ldr	r7, [r3, #0]
 8002318:	f7ff fa5a 	bl	80017d0 <NetEthHdrSize>
 800231c:	4c38      	ldr	r4, [pc, #224]	; (8002400 <TftpSend+0xf0>)
 800231e:	301c      	adds	r0, #28
 8002320:	6823      	ldr	r3, [r4, #0]
 8002322:	183e      	adds	r6, r7, r0
 8002324:	3b01      	subs	r3, #1
 8002326:	2b04      	cmp	r3, #4
 8002328:	d865      	bhi.n	80023f6 <TftpSend+0xe6>
 800232a:	e8df f003 	tbb	[pc, r3]
 800232e:	2635      	.short	0x2635
 8002330:	031a      	.short	0x031a
 8002332:	26          	.byte	0x26
 8002333:	00          	.byte	0x00
 8002334:	f44f 62a0 	mov.w	r2, #1280	; 0x500
 8002338:	f44f 7300 	mov.w	r3, #512	; 0x200
 800233c:	523a      	strh	r2, [r7, r0]
 800233e:	4931      	ldr	r1, [pc, #196]	; (8002404 <TftpSend+0xf4>)
 8002340:	1d30      	adds	r0, r6, #4
 8002342:	8073      	strh	r3, [r6, #2]
 8002344:	f7fe f81c 	bl	8000380 <strcpy>
 8002348:	2017      	movs	r0, #23
 800234a:	9000      	str	r0, [sp, #0]
 800234c:	f8d4 3088 	ldr.w	r3, [r4, #136]	; 0x88
 8002350:	f8d4 208c 	ldr.w	r2, [r4, #140]	; 0x8c
 8002354:	f8d4 1090 	ldr.w	r1, [r4, #144]	; 0x90
 8002358:	482b      	ldr	r0, [pc, #172]	; (8002408 <TftpSend+0xf8>)
 800235a:	f7ff fd2f 	bl	8001dbc <NetSendUDPPacket>
 800235e:	b003      	add	sp, #12
 8002360:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8002362:	f44f 62a0 	mov.w	r2, #1280	; 0x500
 8002366:	f44f 7340 	mov.w	r3, #768	; 0x300
 800236a:	523a      	strh	r2, [r7, r0]
 800236c:	4927      	ldr	r1, [pc, #156]	; (800240c <TftpSend+0xfc>)
 800236e:	1d30      	adds	r0, r6, #4
 8002370:	8073      	strh	r3, [r6, #2]
 8002372:	f7fe f805 	bl	8000380 <strcpy>
 8002376:	2013      	movs	r0, #19
 8002378:	e7e7      	b.n	800234a <TftpSend+0x3a>
 800237a:	f44f 6180 	mov.w	r1, #1024	; 0x400
 800237e:	f8d4 2084 	ldr.w	r2, [r4, #132]	; 0x84
 8002382:	4b23      	ldr	r3, [pc, #140]	; (8002410 <TftpSend+0x100>)
 8002384:	5239      	strh	r1, [r7, r0]
 8002386:	ea03 2302 	and.w	r3, r3, r2, lsl #8
 800238a:	f3c2 2207 	ubfx	r2, r2, #8, #8
 800238e:	4313      	orrs	r3, r2
 8002390:	b29b      	uxth	r3, r3
 8002392:	8073      	strh	r3, [r6, #2]
 8002394:	2004      	movs	r0, #4
 8002396:	e7d8      	b.n	800234a <TftpSend+0x3a>
 8002398:	f44f 7380 	mov.w	r3, #256	; 0x100
 800239c:	1cb5      	adds	r5, r6, #2
 800239e:	523b      	strh	r3, [r7, r0]
 80023a0:	491c      	ldr	r1, [pc, #112]	; (8002414 <TftpSend+0x104>)
 80023a2:	4628      	mov	r0, r5
 80023a4:	f7fd ffec 	bl	8000380 <strcpy>
 80023a8:	481a      	ldr	r0, [pc, #104]	; (8002414 <TftpSend+0x104>)
 80023aa:	f7fe f883 	bl	80004b4 <strlen>
 80023ae:	3001      	adds	r0, #1
 80023b0:	4405      	add	r5, r0
 80023b2:	4628      	mov	r0, r5
 80023b4:	4918      	ldr	r1, [pc, #96]	; (8002418 <TftpSend+0x108>)
 80023b6:	4f19      	ldr	r7, [pc, #100]	; (800241c <TftpSend+0x10c>)
 80023b8:	f7fd ffe2 	bl	8000380 <strcpy>
 80023bc:	1da8      	adds	r0, r5, #6
 80023be:	4918      	ldr	r1, [pc, #96]	; (8002420 <TftpSend+0x110>)
 80023c0:	f7fd ffde 	bl	8000380 <strcpy>
 80023c4:	4b17      	ldr	r3, [pc, #92]	; (8002424 <TftpSend+0x114>)
 80023c6:	683a      	ldr	r2, [r7, #0]
 80023c8:	350e      	adds	r5, #14
 80023ca:	fba3 3202 	umull	r3, r2, r3, r2
 80023ce:	4916      	ldr	r1, [pc, #88]	; (8002428 <TftpSend+0x118>)
 80023d0:	0992      	lsrs	r2, r2, #6
 80023d2:	4628      	mov	r0, r5
 80023d4:	f006 ff76 	bl	80092c4 <sprintf>
 80023d8:	4628      	mov	r0, r5
 80023da:	f7fe f86b 	bl	80004b4 <strlen>
 80023de:	2200      	movs	r2, #0
 80023e0:	3001      	adds	r0, #1
 80023e2:	4405      	add	r5, r0
 80023e4:	88bb      	ldrh	r3, [r7, #4]
 80023e6:	4628      	mov	r0, r5
 80023e8:	9200      	str	r2, [sp, #0]
 80023ea:	4910      	ldr	r1, [pc, #64]	; (800242c <TftpSend+0x11c>)
 80023ec:	f006 ff6a 	bl	80092c4 <sprintf>
 80023f0:	4428      	add	r0, r5
 80023f2:	1b80      	subs	r0, r0, r6
 80023f4:	e7a9      	b.n	800234a <TftpSend+0x3a>
 80023f6:	2000      	movs	r0, #0
 80023f8:	e7a7      	b.n	800234a <TftpSend+0x3a>
 80023fa:	bf00      	nop
 80023fc:	20000d28 	.word	0x20000d28
 8002400:	200032d8 	.word	0x200032d8
 8002404:	0800cb08 	.word	0x0800cb08
 8002408:	20000d60 	.word	0x20000d60
 800240c:	0800caf8 	.word	0x0800caf8
 8002410:	00ffff00 	.word	0x00ffff00
 8002414:	200032dc 	.word	0x200032dc
 8002418:	0800cadc 	.word	0x0800cadc
 800241c:	2000003c 	.word	0x2000003c
 8002420:	0800cbe0 	.word	0x0800cbe0
 8002424:	10624dd3 	.word	0x10624dd3
 8002428:	0800cae4 	.word	0x0800cae4
 800242c:	0800cae8 	.word	0x0800cae8

08002430 <TftpHandler>:
 8002430:	e92d 42f0 	stmdb	sp!, {r4, r5, r6, r7, r9, lr}
 8002434:	4d77      	ldr	r5, [pc, #476]	; (8002614 <TftpHandler+0x1e4>)
 8002436:	f8d5 4088 	ldr.w	r4, [r5, #136]	; 0x88
 800243a:	428c      	cmp	r4, r1
 800243c:	d001      	beq.n	8002442 <TftpHandler+0x12>
 800243e:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 8002442:	682f      	ldr	r7, [r5, #0]
 8002444:	2f01      	cmp	r7, #1
 8002446:	d003      	beq.n	8002450 <TftpHandler+0x20>
 8002448:	f8d5 108c 	ldr.w	r1, [r5, #140]	; 0x8c
 800244c:	4291      	cmp	r1, r2
 800244e:	d1f6      	bne.n	800243e <TftpHandler+0xe>
 8002450:	2b01      	cmp	r3, #1
 8002452:	d9f4      	bls.n	800243e <TftpHandler+0xe>
 8002454:	461e      	mov	r6, r3
 8002456:	8803      	ldrh	r3, [r0, #0]
 8002458:	4604      	mov	r4, r0
 800245a:	0a19      	lsrs	r1, r3, #8
 800245c:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
 8002460:	b209      	sxth	r1, r1
 8002462:	2905      	cmp	r1, #5
 8002464:	4691      	mov	r9, r2
 8002466:	f1a6 0002 	sub.w	r0, r6, #2
 800246a:	d079      	beq.n	8002560 <TftpHandler+0x130>
 800246c:	2906      	cmp	r1, #6
 800246e:	d057      	beq.n	8002520 <TftpHandler+0xf0>
 8002470:	2903      	cmp	r1, #3
 8002472:	d1e4      	bne.n	800243e <TftpHandler+0xe>
 8002474:	2801      	cmp	r0, #1
 8002476:	d9e2      	bls.n	800243e <TftpHandler+0xe>
 8002478:	8861      	ldrh	r1, [r4, #2]
 800247a:	0a0b      	lsrs	r3, r1, #8
 800247c:	ea43 2301 	orr.w	r3, r3, r1, lsl #8
 8002480:	b29b      	uxth	r3, r3
 8002482:	f8c5 3084 	str.w	r3, [r5, #132]	; 0x84
 8002486:	2b00      	cmp	r3, #0
 8002488:	f000 80a1 	beq.w	80025ce <TftpHandler+0x19e>
 800248c:	4962      	ldr	r1, [pc, #392]	; (8002618 <TftpHandler+0x1e8>)
 800248e:	1e58      	subs	r0, r3, #1
 8002490:	fba1 2100 	umull	r2, r1, r1, r0
 8002494:	08c9      	lsrs	r1, r1, #3
 8002496:	eb01 0181 	add.w	r1, r1, r1, lsl #2
 800249a:	ebb0 0f41 	cmp.w	r0, r1, lsl #1
 800249e:	f000 80ab 	beq.w	80025f8 <TftpHandler+0x1c8>
 80024a2:	f240 208a 	movw	r0, #650	; 0x28a
 80024a6:	495d      	ldr	r1, [pc, #372]	; (800261c <TftpHandler+0x1ec>)
 80024a8:	fba1 2103 	umull	r2, r1, r1, r3
 80024ac:	0a49      	lsrs	r1, r1, #9
 80024ae:	fb00 3111 	mls	r1, r0, r1, r3
 80024b2:	2900      	cmp	r1, #0
 80024b4:	f000 80a7 	beq.w	8002606 <TftpHandler+0x1d6>
 80024b8:	f027 0704 	bic.w	r7, r7, #4
 80024bc:	2f01      	cmp	r7, #1
 80024be:	d067      	beq.n	8002590 <TftpHandler+0x160>
 80024c0:	f8d5 209c 	ldr.w	r2, [r5, #156]	; 0x9c
 80024c4:	4293      	cmp	r3, r2
 80024c6:	d0ba      	beq.n	800243e <TftpHandler+0xe>
 80024c8:	220a      	movs	r2, #10
 80024ca:	4f55      	ldr	r7, [pc, #340]	; (8002620 <TftpHandler+0x1f0>)
 80024cc:	4955      	ldr	r1, [pc, #340]	; (8002624 <TftpHandler+0x1f4>)
 80024ce:	6838      	ldr	r0, [r7, #0]
 80024d0:	f8c5 309c 	str.w	r3, [r5, #156]	; 0x9c
 80024d4:	60ba      	str	r2, [r7, #8]
 80024d6:	f7ff f933 	bl	8001740 <NetSetTimeout>
 80024da:	f8d5 3084 	ldr.w	r3, [r5, #132]	; 0x84
 80024de:	f8d5 2098 	ldr.w	r2, [r5, #152]	; 0x98
 80024e2:	88f9      	ldrh	r1, [r7, #6]
 80024e4:	1e5d      	subs	r5, r3, #1
 80024e6:	fb01 2505 	mla	r5, r1, r5, r2
 80024ea:	4b4f      	ldr	r3, [pc, #316]	; (8002628 <TftpHandler+0x1f8>)
 80024ec:	3e04      	subs	r6, #4
 80024ee:	6818      	ldr	r0, [r3, #0]
 80024f0:	4632      	mov	r2, r6
 80024f2:	4428      	add	r0, r5
 80024f4:	1d21      	adds	r1, r4, #4
 80024f6:	f7fe f92b 	bl	8000750 <memcpy>
 80024fa:	4b4c      	ldr	r3, [pc, #304]	; (800262c <TftpHandler+0x1fc>)
 80024fc:	4435      	add	r5, r6
 80024fe:	681a      	ldr	r2, [r3, #0]
 8002500:	4295      	cmp	r5, r2
 8002502:	d900      	bls.n	8002506 <TftpHandler+0xd6>
 8002504:	601d      	str	r5, [r3, #0]
 8002506:	f7ff ff03 	bl	8002310 <TftpSend>
 800250a:	88fb      	ldrh	r3, [r7, #6]
 800250c:	429e      	cmp	r6, r3
 800250e:	d296      	bcs.n	800243e <TftpHandler+0xe>
 8002510:	4847      	ldr	r0, [pc, #284]	; (8002630 <TftpHandler+0x200>)
 8002512:	f002 ff15 	bl	8005340 <puts>
 8002516:	2203      	movs	r2, #3
 8002518:	4b46      	ldr	r3, [pc, #280]	; (8002634 <TftpHandler+0x204>)
 800251a:	601a      	str	r2, [r3, #0]
 800251c:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 8002520:	2305      	movs	r3, #5
 8002522:	2808      	cmp	r0, #8
 8002524:	f8c5 208c 	str.w	r2, [r5, #140]	; 0x8c
 8002528:	602b      	str	r3, [r5, #0]
 800252a:	d916      	bls.n	800255a <TftpHandler+0x12a>
 800252c:	3e08      	subs	r6, #8
 800252e:	4426      	add	r6, r4
 8002530:	4d41      	ldr	r5, [pc, #260]	; (8002638 <TftpHandler+0x208>)
 8002532:	4f3b      	ldr	r7, [pc, #236]	; (8002620 <TftpHandler+0x1f0>)
 8002534:	3402      	adds	r4, #2
 8002536:	e002      	b.n	800253e <TftpHandler+0x10e>
 8002538:	3401      	adds	r4, #1
 800253a:	42b4      	cmp	r4, r6
 800253c:	d00d      	beq.n	800255a <TftpHandler+0x12a>
 800253e:	4629      	mov	r1, r5
 8002540:	4620      	mov	r0, r4
 8002542:	f7fd ff61 	bl	8000408 <strcmp>
 8002546:	2800      	cmp	r0, #0
 8002548:	d1f6      	bne.n	8002538 <TftpHandler+0x108>
 800254a:	4601      	mov	r1, r0
 800254c:	220a      	movs	r2, #10
 800254e:	f104 0008 	add.w	r0, r4, #8
 8002552:	f006 f9c1 	bl	80088d8 <simple_strtoul>
 8002556:	80f8      	strh	r0, [r7, #6]
 8002558:	e7ee      	b.n	8002538 <TftpHandler+0x108>
 800255a:	e8bd 42f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, lr}
 800255e:	e6d7      	b.n	8002310 <TftpSend>
 8002560:	8863      	ldrh	r3, [r4, #2]
 8002562:	1d21      	adds	r1, r4, #4
 8002564:	0a1a      	lsrs	r2, r3, #8
 8002566:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
 800256a:	b292      	uxth	r2, r2
 800256c:	4833      	ldr	r0, [pc, #204]	; (800263c <TftpHandler+0x20c>)
 800256e:	f002 fef3 	bl	8005358 <printf>
 8002572:	8862      	ldrh	r2, [r4, #2]
 8002574:	0a13      	lsrs	r3, r2, #8
 8002576:	ea43 2302 	orr.w	r3, r3, r2, lsl #8
 800257a:	b21b      	sxth	r3, r3
 800257c:	3b01      	subs	r3, #1
 800257e:	2b01      	cmp	r3, #1
 8002580:	d91b      	bls.n	80025ba <TftpHandler+0x18a>
 8002582:	482f      	ldr	r0, [pc, #188]	; (8002640 <TftpHandler+0x210>)
 8002584:	f002 fedc 	bl	8005340 <puts>
 8002588:	e8bd 42f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, lr}
 800258c:	f7ff b876 	b.w	800167c <NetStartAgain>
 8002590:	2100      	movs	r1, #0
 8002592:	2002      	movs	r0, #2
 8002594:	2b01      	cmp	r3, #1
 8002596:	f8c5 908c 	str.w	r9, [r5, #140]	; 0x8c
 800259a:	6028      	str	r0, [r5, #0]
 800259c:	f8c5 109c 	str.w	r1, [r5, #156]	; 0x9c
 80025a0:	f8c5 1094 	str.w	r1, [r5, #148]	; 0x94
 80025a4:	f8c5 1098 	str.w	r1, [r5, #152]	; 0x98
 80025a8:	d08e      	beq.n	80024c8 <TftpHandler+0x98>
 80025aa:	4619      	mov	r1, r3
 80025ac:	4825      	ldr	r0, [pc, #148]	; (8002644 <TftpHandler+0x214>)
 80025ae:	f002 fed3 	bl	8005358 <printf>
 80025b2:	e8bd 42f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, lr}
 80025b6:	f7ff b861 	b.w	800167c <NetStartAgain>
 80025ba:	4823      	ldr	r0, [pc, #140]	; (8002648 <TftpHandler+0x218>)
 80025bc:	f002 fec0 	bl	8005340 <puts>
 80025c0:	f7fe ff7c 	bl	80014bc <eth_halt>
 80025c4:	2204      	movs	r2, #4
 80025c6:	4b1b      	ldr	r3, [pc, #108]	; (8002634 <TftpHandler+0x204>)
 80025c8:	601a      	str	r2, [r3, #0]
 80025ca:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 80025ce:	4914      	ldr	r1, [pc, #80]	; (8002620 <TftpHandler+0x1f0>)
 80025d0:	f8d5 3098 	ldr.w	r3, [r5, #152]	; 0x98
 80025d4:	88c8      	ldrh	r0, [r1, #6]
 80025d6:	f8d5 1094 	ldr.w	r1, [r5, #148]	; 0x94
 80025da:	eb03 4300 	add.w	r3, r3, r0, lsl #16
 80025de:	1c4f      	adds	r7, r1, #1
 80025e0:	481a      	ldr	r0, [pc, #104]	; (800264c <TftpHandler+0x21c>)
 80025e2:	0d19      	lsrs	r1, r3, #20
 80025e4:	f8c5 3098 	str.w	r3, [r5, #152]	; 0x98
 80025e8:	f8c5 7094 	str.w	r7, [r5, #148]	; 0x94
 80025ec:	f002 feb4 	bl	8005358 <printf>
 80025f0:	682f      	ldr	r7, [r5, #0]
 80025f2:	f8d5 3084 	ldr.w	r3, [r5, #132]	; 0x84
 80025f6:	e75f      	b.n	80024b8 <TftpHandler+0x88>
 80025f8:	2023      	movs	r0, #35	; 0x23
 80025fa:	f002 fe95 	bl	8005328 <putc>
 80025fe:	682f      	ldr	r7, [r5, #0]
 8002600:	f8d5 3084 	ldr.w	r3, [r5, #132]	; 0x84
 8002604:	e758      	b.n	80024b8 <TftpHandler+0x88>
 8002606:	4812      	ldr	r0, [pc, #72]	; (8002650 <TftpHandler+0x220>)
 8002608:	f002 fe9a 	bl	8005340 <puts>
 800260c:	682f      	ldr	r7, [r5, #0]
 800260e:	f8d5 3084 	ldr.w	r3, [r5, #132]	; 0x84
 8002612:	e751      	b.n	80024b8 <TftpHandler+0x88>
 8002614:	200032d8 	.word	0x200032d8
 8002618:	cccccccd 	.word	0xcccccccd
 800261c:	c9a633fd 	.word	0xc9a633fd
 8002620:	2000003c 	.word	0x2000003c
 8002624:	08002655 	.word	0x08002655
 8002628:	20000058 	.word	0x20000058
 800262c:	200031c8 	.word	0x200031c8
 8002630:	0800cb80 	.word	0x0800cb80
 8002634:	20000cfc 	.word	0x20000cfc
 8002638:	0800cb1c 	.word	0x0800cb1c
 800263c:	0800cb88 	.word	0x0800cb88
 8002640:	0800cbb4 	.word	0x0800cbb4
 8002644:	0800cb40 	.word	0x0800cb40
 8002648:	0800cba0 	.word	0x0800cba0
 800264c:	0800cb24 	.word	0x0800cb24
 8002650:	0800cb3c 	.word	0x0800cb3c

08002654 <TftpTimeout>:
 8002654:	4a0d      	ldr	r2, [pc, #52]	; (800268c <TftpTimeout+0x38>)
 8002656:	b510      	push	{r4, lr}
 8002658:	4c0d      	ldr	r4, [pc, #52]	; (8002690 <TftpTimeout+0x3c>)
 800265a:	f8d2 30a0 	ldr.w	r3, [r2, #160]	; 0xa0
 800265e:	68a1      	ldr	r1, [r4, #8]
 8002660:	3301      	adds	r3, #1
 8002662:	428b      	cmp	r3, r1
 8002664:	f8c2 30a0 	str.w	r3, [r2, #160]	; 0xa0
 8002668:	dc09      	bgt.n	800267e <TftpTimeout+0x2a>
 800266a:	480a      	ldr	r0, [pc, #40]	; (8002694 <TftpTimeout+0x40>)
 800266c:	f002 fe68 	bl	8005340 <puts>
 8002670:	6820      	ldr	r0, [r4, #0]
 8002672:	4909      	ldr	r1, [pc, #36]	; (8002698 <TftpTimeout+0x44>)
 8002674:	f7ff f864 	bl	8001740 <NetSetTimeout>
 8002678:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800267c:	e648      	b.n	8002310 <TftpSend>
 800267e:	4807      	ldr	r0, [pc, #28]	; (800269c <TftpTimeout+0x48>)
 8002680:	f002 fe5e 	bl	8005340 <puts>
 8002684:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8002688:	f7fe bff8 	b.w	800167c <NetStartAgain>
 800268c:	200032d8 	.word	0x200032d8
 8002690:	2000003c 	.word	0x2000003c
 8002694:	0800cbc8 	.word	0x0800cbc8
 8002698:	08002655 	.word	0x08002655
 800269c:	0800cab4 	.word	0x0800cab4

080026a0 <TftpStart>:
 80026a0:	b5f0      	push	{r4, r5, r6, r7, lr}
 80026a2:	486c      	ldr	r0, [pc, #432]	; (8002854 <TftpStart+0x1b4>)
 80026a4:	b083      	sub	sp, #12
 80026a6:	f002 fc15 	bl	8004ed4 <getenv>
 80026aa:	2800      	cmp	r0, #0
 80026ac:	f000 80c6 	beq.w	800283c <TftpStart+0x19c>
 80026b0:	220a      	movs	r2, #10
 80026b2:	2100      	movs	r1, #0
 80026b4:	f006 f964 	bl	8008980 <simple_strtol>
 80026b8:	4d67      	ldr	r5, [pc, #412]	; (8002858 <TftpStart+0x1b8>)
 80026ba:	80a8      	strh	r0, [r5, #4]
 80026bc:	4867      	ldr	r0, [pc, #412]	; (800285c <TftpStart+0x1bc>)
 80026be:	f002 fc09 	bl	8004ed4 <getenv>
 80026c2:	2800      	cmp	r0, #0
 80026c4:	f000 80ad 	beq.w	8002822 <TftpStart+0x182>
 80026c8:	220a      	movs	r2, #10
 80026ca:	2100      	movs	r1, #0
 80026cc:	f006 f958 	bl	8008980 <simple_strtol>
 80026d0:	f5b0 7f7a 	cmp.w	r0, #1000	; 0x3e8
 80026d4:	6028      	str	r0, [r5, #0]
 80026d6:	f0c0 80a9 	bcc.w	800282c <TftpStart+0x18c>
 80026da:	4b61      	ldr	r3, [pc, #388]	; (8002860 <TftpStart+0x1c0>)
 80026dc:	4e61      	ldr	r6, [pc, #388]	; (8002864 <TftpStart+0x1c4>)
 80026de:	681b      	ldr	r3, [r3, #0]
 80026e0:	4c61      	ldr	r4, [pc, #388]	; (8002868 <TftpStart+0x1c8>)
 80026e2:	f996 7000 	ldrsb.w	r7, [r6]
 80026e6:	f8c4 3090 	str.w	r3, [r4, #144]	; 0x90
 80026ea:	2f00      	cmp	r7, #0
 80026ec:	d179      	bne.n	80027e2 <TftpStart+0x142>
 80026ee:	4e5f      	ldr	r6, [pc, #380]	; (800286c <TftpStart+0x1cc>)
 80026f0:	495f      	ldr	r1, [pc, #380]	; (8002870 <TftpStart+0x1d0>)
 80026f2:	6832      	ldr	r2, [r6, #0]
 80026f4:	f104 00a4 	add.w	r0, r4, #164	; 0xa4
 80026f8:	ea4f 6e12 	mov.w	lr, r2, lsr #24
 80026fc:	f3c2 4307 	ubfx	r3, r2, #16, #8
 8002700:	e88d 4008 	stmia.w	sp, {r3, lr}
 8002704:	f3c2 2307 	ubfx	r3, r2, #8, #8
 8002708:	b2d2      	uxtb	r2, r2
 800270a:	f006 fddb 	bl	80092c4 <sprintf>
 800270e:	f104 01a4 	add.w	r1, r4, #164	; 0xa4
 8002712:	2280      	movs	r2, #128	; 0x80
 8002714:	1d20      	adds	r0, r4, #4
 8002716:	f7fd fe3b 	bl	8000390 <strncpy>
 800271a:	1d21      	adds	r1, r4, #4
 800271c:	4855      	ldr	r0, [pc, #340]	; (8002874 <TftpStart+0x1d4>)
 800271e:	f884 7083 	strb.w	r7, [r4, #131]	; 0x83
 8002722:	f002 fe19 	bl	8005358 <printf>
 8002726:	f7fe ff95 	bl	8001654 <eth_get_name>
 800272a:	4601      	mov	r1, r0
 800272c:	4852      	ldr	r0, [pc, #328]	; (8002878 <TftpStart+0x1d8>)
 800272e:	f002 fe13 	bl	8005358 <printf>
 8002732:	4952      	ldr	r1, [pc, #328]	; (800287c <TftpStart+0x1dc>)
 8002734:	4a4d      	ldr	r2, [pc, #308]	; (800286c <TftpStart+0x1cc>)
 8002736:	4852      	ldr	r0, [pc, #328]	; (8002880 <TftpStart+0x1e0>)
 8002738:	f002 fe0e 	bl	8005358 <printf>
 800273c:	4951      	ldr	r1, [pc, #324]	; (8002884 <TftpStart+0x1e4>)
 800273e:	680b      	ldr	r3, [r1, #0]
 8002740:	b11b      	cbz	r3, 800274a <TftpStart+0xaa>
 8002742:	4b51      	ldr	r3, [pc, #324]	; (8002888 <TftpStart+0x1e8>)
 8002744:	681b      	ldr	r3, [r3, #0]
 8002746:	2b00      	cmp	r3, #0
 8002748:	d160      	bne.n	800280c <TftpStart+0x16c>
 800274a:	200a      	movs	r0, #10
 800274c:	4e4f      	ldr	r6, [pc, #316]	; (800288c <TftpStart+0x1ec>)
 800274e:	f002 fdeb 	bl	8005328 <putc>
 8002752:	494f      	ldr	r1, [pc, #316]	; (8002890 <TftpStart+0x1f0>)
 8002754:	484f      	ldr	r0, [pc, #316]	; (8002894 <TftpStart+0x1f4>)
 8002756:	f002 fdff 	bl	8005358 <printf>
 800275a:	8831      	ldrh	r1, [r6, #0]
 800275c:	b141      	cbz	r1, 8002770 <TftpStart+0xd0>
 800275e:	0249      	lsls	r1, r1, #9
 8002760:	484d      	ldr	r0, [pc, #308]	; (8002898 <TftpStart+0x1f8>)
 8002762:	f002 fdf9 	bl	8005358 <printf>
 8002766:	8830      	ldrh	r0, [r6, #0]
 8002768:	494c      	ldr	r1, [pc, #304]	; (800289c <TftpStart+0x1fc>)
 800276a:	0240      	lsls	r0, r0, #9
 800276c:	f005 fb24 	bl	8007db8 <print_size>
 8002770:	200a      	movs	r0, #10
 8002772:	f002 fdd9 	bl	8005328 <putc>
 8002776:	4b4a      	ldr	r3, [pc, #296]	; (80028a0 <TftpStart+0x200>)
 8002778:	484a      	ldr	r0, [pc, #296]	; (80028a4 <TftpStart+0x204>)
 800277a:	6819      	ldr	r1, [r3, #0]
 800277c:	f002 fdec 	bl	8005358 <printf>
 8002780:	4849      	ldr	r0, [pc, #292]	; (80028a8 <TftpStart+0x208>)
 8002782:	f002 fddd 	bl	8005340 <puts>
 8002786:	68eb      	ldr	r3, [r5, #12]
 8002788:	4948      	ldr	r1, [pc, #288]	; (80028ac <TftpStart+0x20c>)
 800278a:	6828      	ldr	r0, [r5, #0]
 800278c:	2600      	movs	r6, #0
 800278e:	60ab      	str	r3, [r5, #8]
 8002790:	f7fe ffd6 	bl	8001740 <NetSetTimeout>
 8002794:	4846      	ldr	r0, [pc, #280]	; (80028b0 <TftpStart+0x210>)
 8002796:	f7fe ffcd 	bl	8001734 <NetSetHandler>
 800279a:	2245      	movs	r2, #69	; 0x45
 800279c:	2301      	movs	r3, #1
 800279e:	4630      	mov	r0, r6
 80027a0:	f8c4 208c 	str.w	r2, [r4, #140]	; 0x8c
 80027a4:	6023      	str	r3, [r4, #0]
 80027a6:	f8c4 60a0 	str.w	r6, [r4, #160]	; 0xa0
 80027aa:	f7fe f937 	bl	8000a1c <get_timer>
 80027ae:	4b41      	ldr	r3, [pc, #260]	; (80028b4 <TftpStart+0x214>)
 80027b0:	4631      	mov	r1, r6
 80027b2:	fba3 2300 	umull	r2, r3, r3, r0
 80027b6:	0adb      	lsrs	r3, r3, #11
 80027b8:	eb03 0343 	add.w	r3, r3, r3, lsl #1
 80027bc:	eba0 2383 	sub.w	r3, r0, r3, lsl #10
 80027c0:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 80027c4:	2206      	movs	r2, #6
 80027c6:	483c      	ldr	r0, [pc, #240]	; (80028b8 <TftpStart+0x218>)
 80027c8:	f8c4 3088 	str.w	r3, [r4, #136]	; 0x88
 80027cc:	f8c4 6084 	str.w	r6, [r4, #132]	; 0x84
 80027d0:	f7fd ff7e 	bl	80006d0 <memset>
 80027d4:	f44f 7300 	mov.w	r3, #512	; 0x200
 80027d8:	80eb      	strh	r3, [r5, #6]
 80027da:	b003      	add	sp, #12
 80027dc:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
 80027e0:	e596      	b.n	8002310 <TftpSend>
 80027e2:	213a      	movs	r1, #58	; 0x3a
 80027e4:	4630      	mov	r0, r6
 80027e6:	f7fd fe3f 	bl	8000468 <strchr>
 80027ea:	4607      	mov	r7, r0
 80027ec:	b340      	cbz	r0, 8002840 <TftpStart+0x1a0>
 80027ee:	4630      	mov	r0, r6
 80027f0:	f005 fe22 	bl	8008438 <string_to_ip>
 80027f4:	1c79      	adds	r1, r7, #1
 80027f6:	f8c4 0090 	str.w	r0, [r4, #144]	; 0x90
 80027fa:	2280      	movs	r2, #128	; 0x80
 80027fc:	1d20      	adds	r0, r4, #4
 80027fe:	f7fd fdc7 	bl	8000390 <strncpy>
 8002802:	2300      	movs	r3, #0
 8002804:	4e19      	ldr	r6, [pc, #100]	; (800286c <TftpStart+0x1cc>)
 8002806:	f884 3083 	strb.w	r3, [r4, #131]	; 0x83
 800280a:	e78c      	b.n	8002726 <TftpStart+0x86>
 800280c:	6832      	ldr	r2, [r6, #0]
 800280e:	f8d4 0090 	ldr.w	r0, [r4, #144]	; 0x90
 8002812:	401a      	ands	r2, r3
 8002814:	4003      	ands	r3, r0
 8002816:	429a      	cmp	r2, r3
 8002818:	d097      	beq.n	800274a <TftpStart+0xaa>
 800281a:	4828      	ldr	r0, [pc, #160]	; (80028bc <TftpStart+0x21c>)
 800281c:	f002 fd9c 	bl	8005358 <printf>
 8002820:	e793      	b.n	800274a <TftpStart+0xaa>
 8002822:	6828      	ldr	r0, [r5, #0]
 8002824:	f5b0 7f7a 	cmp.w	r0, #1000	; 0x3e8
 8002828:	f4bf af57 	bcs.w	80026da <TftpStart+0x3a>
 800282c:	4601      	mov	r1, r0
 800282e:	4824      	ldr	r0, [pc, #144]	; (80028c0 <TftpStart+0x220>)
 8002830:	f002 fd92 	bl	8005358 <printf>
 8002834:	f44f 737a 	mov.w	r3, #1000	; 0x3e8
 8002838:	602b      	str	r3, [r5, #0]
 800283a:	e74e      	b.n	80026da <TftpStart+0x3a>
 800283c:	4d06      	ldr	r5, [pc, #24]	; (8002858 <TftpStart+0x1b8>)
 800283e:	e73d      	b.n	80026bc <TftpStart+0x1c>
 8002840:	4631      	mov	r1, r6
 8002842:	2280      	movs	r2, #128	; 0x80
 8002844:	1d20      	adds	r0, r4, #4
 8002846:	f7fd fda3 	bl	8000390 <strncpy>
 800284a:	4e08      	ldr	r6, [pc, #32]	; (800286c <TftpStart+0x1cc>)
 800284c:	f884 7083 	strb.w	r7, [r4, #131]	; 0x83
 8002850:	e769      	b.n	8002726 <TftpStart+0x86>
 8002852:	bf00      	nop
 8002854:	0800cbcc 	.word	0x0800cbcc
 8002858:	2000003c 	.word	0x2000003c
 800285c:	0800cbdc 	.word	0x0800cbdc
 8002860:	20000d5c 	.word	0x20000d5c
 8002864:	200031cc 	.word	0x200031cc
 8002868:	200032d8 	.word	0x200032d8
 800286c:	20000d2c 	.word	0x20000d2c
 8002870:	0800cc20 	.word	0x0800cc20
 8002874:	0800cc3c 	.word	0x0800cc3c
 8002878:	0800cc68 	.word	0x0800cc68
 800287c:	20003368 	.word	0x20003368
 8002880:	0800cc7c 	.word	0x0800cc7c
 8002884:	20000d38 	.word	0x20000d38
 8002888:	20000d34 	.word	0x20000d34
 800288c:	2000324c 	.word	0x2000324c
 8002890:	200032dc 	.word	0x200032dc
 8002894:	0800cccc 	.word	0x0800cccc
 8002898:	0800ccdc 	.word	0x0800ccdc
 800289c:	0800d63c 	.word	0x0800d63c
 80028a0:	20000058 	.word	0x20000058
 80028a4:	0800ccf4 	.word	0x0800ccf4
 80028a8:	0800cd0c 	.word	0x0800cd0c
 80028ac:	08002655 	.word	0x08002655
 80028b0:	08002431 	.word	0x08002431
 80028b4:	aaaaaaab 	.word	0xaaaaaaab
 80028b8:	20000d60 	.word	0x20000d60
 80028bc:	0800ccac 	.word	0x0800ccac
 80028c0:	0800cbe8 	.word	0x0800cbe8

080028c4 <BootpHandler>:
 80028c4:	2944      	cmp	r1, #68	; 0x44
 80028c6:	d109      	bne.n	80028dc <BootpHandler+0x18>
 80028c8:	2a43      	cmp	r2, #67	; 0x43
 80028ca:	d107      	bne.n	80028dc <BootpHandler+0x18>
 80028cc:	2beb      	cmp	r3, #235	; 0xeb
 80028ce:	d905      	bls.n	80028dc <BootpHandler+0x18>
 80028d0:	7802      	ldrb	r2, [r0, #0]
 80028d2:	f022 0204 	bic.w	r2, r2, #4
 80028d6:	3a01      	subs	r2, #1
 80028d8:	2a01      	cmp	r2, #1
 80028da:	d900      	bls.n	80028de <BootpHandler+0x1a>
 80028dc:	4770      	bx	lr
 80028de:	7842      	ldrb	r2, [r0, #1]
 80028e0:	2a01      	cmp	r2, #1
 80028e2:	d1fb      	bne.n	80028dc <BootpHandler+0x18>
 80028e4:	7882      	ldrb	r2, [r0, #2]
 80028e6:	2a06      	cmp	r2, #6
 80028e8:	d1f8      	bne.n	80028dc <BootpHandler+0x18>
 80028ea:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 80028ee:	2204      	movs	r2, #4
 80028f0:	4606      	mov	r6, r0
 80028f2:	b082      	sub	sp, #8
 80028f4:	18b1      	adds	r1, r6, r2
 80028f6:	a801      	add	r0, sp, #4
 80028f8:	461c      	mov	r4, r3
 80028fa:	f7fd ff29 	bl	8000750 <memcpy>
 80028fe:	4b9f      	ldr	r3, [pc, #636]	; (8002b7c <BootpHandler+0x2b8>)
 8002900:	9a01      	ldr	r2, [sp, #4]
 8002902:	681b      	ldr	r3, [r3, #0]
 8002904:	429a      	cmp	r2, r3
 8002906:	d13b      	bne.n	8002980 <BootpHandler+0xbc>
 8002908:	2204      	movs	r2, #4
 800290a:	f106 0110 	add.w	r1, r6, #16
 800290e:	489c      	ldr	r0, [pc, #624]	; (8002b80 <BootpHandler+0x2bc>)
 8002910:	f7fd ff1e 	bl	8000750 <memcpy>
 8002914:	2204      	movs	r2, #4
 8002916:	f106 0514 	add.w	r5, r6, #20
 800291a:	4629      	mov	r1, r5
 800291c:	eb0d 0002 	add.w	r0, sp, r2
 8002920:	f7fd ff16 	bl	8000750 <memcpy>
 8002924:	9b01      	ldr	r3, [sp, #4]
 8002926:	bba3      	cbnz	r3, 8002992 <BootpHandler+0xce>
 8002928:	2206      	movs	r2, #6
 800292a:	4b96      	ldr	r3, [pc, #600]	; (8002b84 <BootpHandler+0x2c0>)
 800292c:	4896      	ldr	r0, [pc, #600]	; (8002b88 <BootpHandler+0x2c4>)
 800292e:	6819      	ldr	r1, [r3, #0]
 8002930:	f106 056c 	add.w	r5, r6, #108	; 0x6c
 8002934:	4411      	add	r1, r2
 8002936:	f7fd ff0b 	bl	8000750 <memcpy>
 800293a:	4628      	mov	r0, r5
 800293c:	f7fd fdba 	bl	80004b4 <strlen>
 8002940:	bb08      	cbnz	r0, 8002986 <BootpHandler+0xc2>
 8002942:	4992      	ldr	r1, [pc, #584]	; (8002b8c <BootpHandler+0x2c8>)
 8002944:	f991 3000 	ldrsb.w	r3, [r1]
 8002948:	b113      	cbz	r3, 8002950 <BootpHandler+0x8c>
 800294a:	4891      	ldr	r0, [pc, #580]	; (8002b90 <BootpHandler+0x2cc>)
 800294c:	f002 fa94 	bl	8004e78 <setenv>
 8002950:	2204      	movs	r2, #4
 8002952:	a801      	add	r0, sp, #4
 8002954:	f106 01ec 	add.w	r1, r6, #236	; 0xec
 8002958:	f7fd fefa 	bl	8000750 <memcpy>
 800295c:	9a01      	ldr	r2, [sp, #4]
 800295e:	4b8d      	ldr	r3, [pc, #564]	; (8002b94 <BootpHandler+0x2d0>)
 8002960:	429a      	cmp	r2, r3
 8002962:	d020      	beq.n	80029a6 <BootpHandler+0xe2>
 8002964:	2100      	movs	r1, #0
 8002966:	4608      	mov	r0, r1
 8002968:	f7fe feea 	bl	8001740 <NetSetTimeout>
 800296c:	488a      	ldr	r0, [pc, #552]	; (8002b98 <BootpHandler+0x2d4>)
 800296e:	f002 fab1 	bl	8004ed4 <getenv>
 8002972:	b118      	cbz	r0, 800297c <BootpHandler+0xb8>
 8002974:	f990 3000 	ldrsb.w	r3, [r0]
 8002978:	2b6e      	cmp	r3, #110	; 0x6e
 800297a:	d010      	beq.n	800299e <BootpHandler+0xda>
 800297c:	f7ff fe90 	bl	80026a0 <TftpStart>
 8002980:	b002      	add	sp, #8
 8002982:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8002986:	4629      	mov	r1, r5
 8002988:	2280      	movs	r2, #128	; 0x80
 800298a:	4880      	ldr	r0, [pc, #512]	; (8002b8c <BootpHandler+0x2c8>)
 800298c:	f7ff fa7c 	bl	8001e88 <copy_filename>
 8002990:	e7d7      	b.n	8002942 <BootpHandler+0x7e>
 8002992:	4629      	mov	r1, r5
 8002994:	2204      	movs	r2, #4
 8002996:	4881      	ldr	r0, [pc, #516]	; (8002b9c <BootpHandler+0x2d8>)
 8002998:	f7fd feda 	bl	8000750 <memcpy>
 800299c:	e7c4      	b.n	8002928 <BootpHandler+0x64>
 800299e:	2203      	movs	r2, #3
 80029a0:	4b7f      	ldr	r3, [pc, #508]	; (8002ba0 <BootpHandler+0x2dc>)
 80029a2:	601a      	str	r2, [r3, #0]
 80029a4:	e7ec      	b.n	8002980 <BootpHandler+0xbc>
 80029a6:	f106 05f0 	add.w	r5, r6, #240	; 0xf0
 80029aa:	442c      	add	r4, r5
 80029ac:	42a5      	cmp	r5, r4
 80029ae:	d2d9      	bcs.n	8002964 <BootpHandler+0xa0>
 80029b0:	f896 30f0 	ldrb.w	r3, [r6, #240]	; 0xf0
 80029b4:	2bff      	cmp	r3, #255	; 0xff
 80029b6:	d0d5      	beq.n	8002964 <BootpHandler+0xa0>
 80029b8:	4f7a      	ldr	r7, [pc, #488]	; (8002ba4 <BootpHandler+0x2e0>)
 80029ba:	f8df a20c 	ldr.w	sl, [pc, #524]	; 8002bc8 <BootpHandler+0x304>
 80029be:	f8df b20c 	ldr.w	fp, [pc, #524]	; 8002bcc <BootpHandler+0x308>
 80029c2:	b93b      	cbnz	r3, 80029d4 <BootpHandler+0x110>
 80029c4:	3501      	adds	r5, #1
 80029c6:	42ac      	cmp	r4, r5
 80029c8:	d9cc      	bls.n	8002964 <BootpHandler+0xa0>
 80029ca:	782b      	ldrb	r3, [r5, #0]
 80029cc:	2bff      	cmp	r3, #255	; 0xff
 80029ce:	d0c9      	beq.n	8002964 <BootpHandler+0xa0>
 80029d0:	2b00      	cmp	r3, #0
 80029d2:	d0f7      	beq.n	80029c4 <BootpHandler+0x100>
 80029d4:	786a      	ldrb	r2, [r5, #1]
 80029d6:	1c96      	adds	r6, r2, #2
 80029d8:	442e      	add	r6, r5
 80029da:	42b4      	cmp	r4, r6
 80029dc:	d201      	bcs.n	80029e2 <BootpHandler+0x11e>
 80029de:	4635      	mov	r5, r6
 80029e0:	e7f1      	b.n	80029c6 <BootpHandler+0x102>
 80029e2:	2300      	movs	r3, #0
 80029e4:	803b      	strh	r3, [r7, #0]
 80029e6:	782b      	ldrb	r3, [r5, #0]
 80029e8:	4691      	mov	r9, r2
 80029ea:	3b01      	subs	r3, #1
 80029ec:	2b27      	cmp	r3, #39	; 0x27
 80029ee:	d8f6      	bhi.n	80029de <BootpHandler+0x11a>
 80029f0:	a101      	add	r1, pc, #4	; (adr r1, 80029f8 <BootpHandler+0x134>)
 80029f2:	f851 f023 	ldr.w	pc, [r1, r3, lsl #2]
 80029f6:	bf00      	nop
 80029f8:	08002b51 	.word	0x08002b51
 80029fc:	080029df 	.word	0x080029df
 8002a00:	08002b45 	.word	0x08002b45
 8002a04:	080029df 	.word	0x080029df
 8002a08:	080029df 	.word	0x080029df
 8002a0c:	08002ac7 	.word	0x08002ac7
 8002a10:	080029df 	.word	0x080029df
 8002a14:	080029df 	.word	0x080029df
 8002a18:	080029df 	.word	0x080029df
 8002a1c:	080029df 	.word	0x080029df
 8002a20:	080029df 	.word	0x080029df
 8002a24:	08002b11 	.word	0x08002b11
 8002a28:	08002adb 	.word	0x08002adb
 8002a2c:	080029df 	.word	0x080029df
 8002a30:	080029df 	.word	0x080029df
 8002a34:	080029df 	.word	0x080029df
 8002a38:	08002a99 	.word	0x08002a99
 8002a3c:	080029df 	.word	0x080029df
 8002a40:	080029df 	.word	0x080029df
 8002a44:	080029df 	.word	0x080029df
 8002a48:	080029df 	.word	0x080029df
 8002a4c:	080029df 	.word	0x080029df
 8002a50:	080029df 	.word	0x080029df
 8002a54:	080029df 	.word	0x080029df
 8002a58:	080029df 	.word	0x080029df
 8002a5c:	080029df 	.word	0x080029df
 8002a60:	080029df 	.word	0x080029df
 8002a64:	080029df 	.word	0x080029df
 8002a68:	080029df 	.word	0x080029df
 8002a6c:	080029df 	.word	0x080029df
 8002a70:	080029df 	.word	0x080029df
 8002a74:	080029df 	.word	0x080029df
 8002a78:	080029df 	.word	0x080029df
 8002a7c:	080029df 	.word	0x080029df
 8002a80:	080029df 	.word	0x080029df
 8002a84:	080029df 	.word	0x080029df
 8002a88:	080029df 	.word	0x080029df
 8002a8c:	080029df 	.word	0x080029df
 8002a90:	080029df 	.word	0x080029df
 8002a94:	08002af1 	.word	0x08002af1
 8002a98:	f99b 3000 	ldrsb.w	r3, [fp]
 8002a9c:	2b00      	cmp	r3, #0
 8002a9e:	d19e      	bne.n	80029de <BootpHandler+0x11a>
 8002aa0:	2a3f      	cmp	r2, #63	; 0x3f
 8002aa2:	dd07      	ble.n	8002ab4 <BootpHandler+0x1f0>
 8002aa4:	f04f 093f 	mov.w	r9, #63	; 0x3f
 8002aa8:	2340      	movs	r3, #64	; 0x40
 8002aaa:	493f      	ldr	r1, [pc, #252]	; (8002ba8 <BootpHandler+0x2e4>)
 8002aac:	483f      	ldr	r0, [pc, #252]	; (8002bac <BootpHandler+0x2e8>)
 8002aae:	f002 fc53 	bl	8005358 <printf>
 8002ab2:	464a      	mov	r2, r9
 8002ab4:	1ca9      	adds	r1, r5, #2
 8002ab6:	4658      	mov	r0, fp
 8002ab8:	f7fd fe4a 	bl	8000750 <memcpy>
 8002abc:	2300      	movs	r3, #0
 8002abe:	4635      	mov	r5, r6
 8002ac0:	f80b 3009 	strb.w	r3, [fp, r9]
 8002ac4:	e77f      	b.n	80029c6 <BootpHandler+0x102>
 8002ac6:	483a      	ldr	r0, [pc, #232]	; (8002bb0 <BootpHandler+0x2ec>)
 8002ac8:	6803      	ldr	r3, [r0, #0]
 8002aca:	2b00      	cmp	r3, #0
 8002acc:	d187      	bne.n	80029de <BootpHandler+0x11a>
 8002ace:	1ca9      	adds	r1, r5, #2
 8002ad0:	2204      	movs	r2, #4
 8002ad2:	4635      	mov	r5, r6
 8002ad4:	f7fd fe3c 	bl	8000750 <memcpy>
 8002ad8:	e775      	b.n	80029c6 <BootpHandler+0x102>
 8002ada:	2a02      	cmp	r2, #2
 8002adc:	d03e      	beq.n	8002b5c <BootpHandler+0x298>
 8002ade:	2a04      	cmp	r2, #4
 8002ae0:	f47f af7d 	bne.w	80029de <BootpHandler+0x11a>
 8002ae4:	f8d5 3002 	ldr.w	r3, [r5, #2]
 8002ae8:	4635      	mov	r5, r6
 8002aea:	ba1b      	rev	r3, r3
 8002aec:	803b      	strh	r3, [r7, #0]
 8002aee:	e76a      	b.n	80029c6 <BootpHandler+0x102>
 8002af0:	f99a 3000 	ldrsb.w	r3, [sl]
 8002af4:	2b00      	cmp	r3, #0
 8002af6:	f47f af72 	bne.w	80029de <BootpHandler+0x11a>
 8002afa:	2a1f      	cmp	r2, #31
 8002afc:	dc35      	bgt.n	8002b6a <BootpHandler+0x2a6>
 8002afe:	1ca9      	adds	r1, r5, #2
 8002b00:	4650      	mov	r0, sl
 8002b02:	f7fd fe25 	bl	8000750 <memcpy>
 8002b06:	2300      	movs	r3, #0
 8002b08:	4635      	mov	r5, r6
 8002b0a:	f80a 3009 	strb.w	r3, [sl, r9]
 8002b0e:	e75a      	b.n	80029c6 <BootpHandler+0x102>
 8002b10:	4b28      	ldr	r3, [pc, #160]	; (8002bb4 <BootpHandler+0x2f0>)
 8002b12:	f993 3000 	ldrsb.w	r3, [r3]
 8002b16:	2b00      	cmp	r3, #0
 8002b18:	f47f af61 	bne.w	80029de <BootpHandler+0x11a>
 8002b1c:	2a1f      	cmp	r2, #31
 8002b1e:	dd07      	ble.n	8002b30 <BootpHandler+0x26c>
 8002b20:	f04f 091f 	mov.w	r9, #31
 8002b24:	2320      	movs	r3, #32
 8002b26:	4924      	ldr	r1, [pc, #144]	; (8002bb8 <BootpHandler+0x2f4>)
 8002b28:	4820      	ldr	r0, [pc, #128]	; (8002bac <BootpHandler+0x2e8>)
 8002b2a:	f002 fc15 	bl	8005358 <printf>
 8002b2e:	464a      	mov	r2, r9
 8002b30:	1ca9      	adds	r1, r5, #2
 8002b32:	4820      	ldr	r0, [pc, #128]	; (8002bb4 <BootpHandler+0x2f0>)
 8002b34:	f7fd fe0c 	bl	8000750 <memcpy>
 8002b38:	2300      	movs	r3, #0
 8002b3a:	4a1e      	ldr	r2, [pc, #120]	; (8002bb4 <BootpHandler+0x2f0>)
 8002b3c:	4635      	mov	r5, r6
 8002b3e:	f802 3009 	strb.w	r3, [r2, r9]
 8002b42:	e740      	b.n	80029c6 <BootpHandler+0x102>
 8002b44:	481d      	ldr	r0, [pc, #116]	; (8002bbc <BootpHandler+0x2f8>)
 8002b46:	6803      	ldr	r3, [r0, #0]
 8002b48:	2b00      	cmp	r3, #0
 8002b4a:	d0c0      	beq.n	8002ace <BootpHandler+0x20a>
 8002b4c:	4635      	mov	r5, r6
 8002b4e:	e73a      	b.n	80029c6 <BootpHandler+0x102>
 8002b50:	481b      	ldr	r0, [pc, #108]	; (8002bc0 <BootpHandler+0x2fc>)
 8002b52:	6803      	ldr	r3, [r0, #0]
 8002b54:	2b00      	cmp	r3, #0
 8002b56:	d0ba      	beq.n	8002ace <BootpHandler+0x20a>
 8002b58:	4635      	mov	r5, r6
 8002b5a:	e734      	b.n	80029c6 <BootpHandler+0x102>
 8002b5c:	886a      	ldrh	r2, [r5, #2]
 8002b5e:	4635      	mov	r5, r6
 8002b60:	0a13      	lsrs	r3, r2, #8
 8002b62:	ea43 2302 	orr.w	r3, r3, r2, lsl #8
 8002b66:	803b      	strh	r3, [r7, #0]
 8002b68:	e72d      	b.n	80029c6 <BootpHandler+0x102>
 8002b6a:	f04f 091f 	mov.w	r9, #31
 8002b6e:	2320      	movs	r3, #32
 8002b70:	4914      	ldr	r1, [pc, #80]	; (8002bc4 <BootpHandler+0x300>)
 8002b72:	480e      	ldr	r0, [pc, #56]	; (8002bac <BootpHandler+0x2e8>)
 8002b74:	f002 fbf0 	bl	8005358 <printf>
 8002b78:	464a      	mov	r2, r9
 8002b7a:	e7c0      	b.n	8002afe <BootpHandler+0x23a>
 8002b7c:	2000338c 	.word	0x2000338c
 8002b80:	20000d2c 	.word	0x20000d2c
 8002b84:	20000d48 	.word	0x20000d48
 8002b88:	20000d60 	.word	0x20000d60
 8002b8c:	200031cc 	.word	0x200031cc
 8002b90:	0800c474 	.word	0x0800c474
 8002b94:	63538263 	.word	0x63538263
 8002b98:	0800ca94 	.word	0x0800ca94
 8002b9c:	20000d5c 	.word	0x20000d5c
 8002ba0:	20000cfc 	.word	0x20000cfc
 8002ba4:	2000324c 	.word	0x2000324c
 8002ba8:	0800cd5c 	.word	0x0800cd5c
 8002bac:	0800cd24 	.word	0x0800cd24
 8002bb0:	200032d0 	.word	0x200032d0
 8002bb4:	20003290 	.word	0x20003290
 8002bb8:	0800cd18 	.word	0x0800cd18
 8002bbc:	20000d38 	.word	0x20000d38
 8002bc0:	20000d34 	.word	0x20000d34
 8002bc4:	0800cd68 	.word	0x0800cd68
 8002bc8:	200032b0 	.word	0x200032b0
 8002bcc:	20003250 	.word	0x20003250

08002bd0 <BootpRequest>:
 8002bd0:	e92d 46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
 8002bd4:	4e53      	ldr	r6, [pc, #332]	; (8002d24 <BootpRequest+0x154>)
 8002bd6:	4f54      	ldr	r7, [pc, #336]	; (8002d28 <BootpRequest+0x158>)
 8002bd8:	6873      	ldr	r3, [r6, #4]
 8002bda:	b087      	sub	sp, #28
 8002bdc:	3301      	adds	r3, #1
 8002bde:	4619      	mov	r1, r3
 8002be0:	4852      	ldr	r0, [pc, #328]	; (8002d2c <BootpRequest+0x15c>)
 8002be2:	6073      	str	r3, [r6, #4]
 8002be4:	f002 fbb8 	bl	8005358 <printf>
 8002be8:	683c      	ldr	r4, [r7, #0]
 8002bea:	f240 52ee 	movw	r2, #1518	; 0x5ee
 8002bee:	4620      	mov	r0, r4
 8002bf0:	2100      	movs	r1, #0
 8002bf2:	f7fd fd6d 	bl	80006d0 <memset>
 8002bf6:	f44f 6200 	mov.w	r2, #2048	; 0x800
 8002bfa:	494d      	ldr	r1, [pc, #308]	; (8002d30 <BootpRequest+0x160>)
 8002bfc:	4620      	mov	r0, r4
 8002bfe:	f7fe fdff 	bl	8001800 <NetSetEther>
 8002c02:	2500      	movs	r5, #0
 8002c04:	f04f 0a06 	mov.w	sl, #6
 8002c08:	2301      	movs	r3, #1
 8002c0a:	4404      	add	r4, r0
 8002c0c:	7723      	strb	r3, [r4, #28]
 8002c0e:	7763      	strb	r3, [r4, #29]
 8002c10:	f884 a01e 	strb.w	sl, [r4, #30]
 8002c14:	77e5      	strb	r5, [r4, #31]
 8002c16:	4628      	mov	r0, r5
 8002c18:	f7fd ff00 	bl	8000a1c <get_timer>
 8002c1c:	4b45      	ldr	r3, [pc, #276]	; (8002d34 <BootpRequest+0x164>)
 8002c1e:	a906      	add	r1, sp, #24
 8002c20:	fba3 3000 	umull	r3, r0, r3, r0
 8002c24:	4b44      	ldr	r3, [pc, #272]	; (8002d38 <BootpRequest+0x168>)
 8002c26:	fa20 f00a 	lsr.w	r0, r0, sl
 8002c2a:	ea03 2300 	and.w	r3, r3, r0, lsl #8
 8002c2e:	f3c0 2007 	ubfx	r0, r0, #8, #8
 8002c32:	4318      	orrs	r0, r3
 8002c34:	f841 5d04 	str.w	r5, [r1, #-4]!
 8002c38:	84a0      	strh	r0, [r4, #36]	; 0x24
 8002c3a:	2204      	movs	r2, #4
 8002c3c:	f104 0028 	add.w	r0, r4, #40	; 0x28
 8002c40:	f7fd fd86 	bl	8000750 <memcpy>
 8002c44:	a906      	add	r1, sp, #24
 8002c46:	f841 5d08 	str.w	r5, [r1, #-8]!
 8002c4a:	f104 002c 	add.w	r0, r4, #44	; 0x2c
 8002c4e:	2204      	movs	r2, #4
 8002c50:	f7fd fd7e 	bl	8000750 <memcpy>
 8002c54:	a906      	add	r1, sp, #24
 8002c56:	f841 5d0c 	str.w	r5, [r1, #-12]!
 8002c5a:	f104 0030 	add.w	r0, r4, #48	; 0x30
 8002c5e:	2204      	movs	r2, #4
 8002c60:	f7fd fd76 	bl	8000750 <memcpy>
 8002c64:	f8df 90e0 	ldr.w	r9, [pc, #224]	; 8002d48 <BootpRequest+0x178>
 8002c68:	a906      	add	r1, sp, #24
 8002c6a:	f841 5d10 	str.w	r5, [r1, #-16]!
 8002c6e:	f104 0034 	add.w	r0, r4, #52	; 0x34
 8002c72:	2204      	movs	r2, #4
 8002c74:	f7fd fd6c 	bl	8000750 <memcpy>
 8002c78:	4652      	mov	r2, sl
 8002c7a:	4649      	mov	r1, r9
 8002c7c:	f104 0038 	add.w	r0, r4, #56	; 0x38
 8002c80:	f7fd fd66 	bl	8000750 <memcpy>
 8002c84:	f104 0088 	add.w	r0, r4, #136	; 0x88
 8002c88:	2280      	movs	r2, #128	; 0x80
 8002c8a:	492c      	ldr	r1, [pc, #176]	; (8002d3c <BootpRequest+0x16c>)
 8002c8c:	f7ff f8fc 	bl	8001e88 <copy_filename>
 8002c90:	f04f 0c82 	mov.w	ip, #130	; 0x82
 8002c94:	f04f 0e53 	mov.w	lr, #83	; 0x53
 8002c98:	2263      	movs	r2, #99	; 0x63
 8002c9a:	21ff      	movs	r1, #255	; 0xff
 8002c9c:	f899 3003 	ldrb.w	r3, [r9, #3]
 8002ca0:	f899 0002 	ldrb.w	r0, [r9, #2]
 8002ca4:	041b      	lsls	r3, r3, #16
 8002ca6:	ea43 6300 	orr.w	r3, r3, r0, lsl #24
 8002caa:	f899 0005 	ldrb.w	r0, [r9, #5]
 8002cae:	f899 9004 	ldrb.w	r9, [r9, #4]
 8002cb2:	4303      	orrs	r3, r0
 8002cb4:	f884 c109 	strb.w	ip, [r4, #265]	; 0x109
 8002cb8:	f884 e10a 	strb.w	lr, [r4, #266]	; 0x10a
 8002cbc:	ea43 2309 	orr.w	r3, r3, r9, lsl #8
 8002cc0:	f884 110c 	strb.w	r1, [r4, #268]	; 0x10c
 8002cc4:	f884 2108 	strb.w	r2, [r4, #264]	; 0x108
 8002cc8:	f884 210b 	strb.w	r2, [r4, #267]	; 0x10b
 8002ccc:	4628      	mov	r0, r5
 8002cce:	6033      	str	r3, [r6, #0]
 8002cd0:	f7fd fea4 	bl	8000a1c <get_timer>
 8002cd4:	6833      	ldr	r3, [r6, #0]
 8002cd6:	4631      	mov	r1, r6
 8002cd8:	4403      	add	r3, r0
 8002cda:	ba1b      	rev	r3, r3
 8002cdc:	f104 0020 	add.w	r0, r4, #32
 8002ce0:	2204      	movs	r2, #4
 8002ce2:	6033      	str	r3, [r6, #0]
 8002ce4:	f7fd fd34 	bl	8000750 <memcpy>
 8002ce8:	22f1      	movs	r2, #241	; 0xf1
 8002cea:	6839      	ldr	r1, [r7, #0]
 8002cec:	f104 031c 	add.w	r3, r4, #28
 8002cf0:	4620      	mov	r0, r4
 8002cf2:	9200      	str	r2, [sp, #0]
 8002cf4:	1a5c      	subs	r4, r3, r1
 8002cf6:	2243      	movs	r2, #67	; 0x43
 8002cf8:	2344      	movs	r3, #68	; 0x44
 8002cfa:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
 8002cfe:	f7fe fffd 	bl	8001cfc <NetSetIP>
 8002d02:	490f      	ldr	r1, [pc, #60]	; (8002d40 <BootpRequest+0x170>)
 8002d04:	f640 30b8 	movw	r0, #3000	; 0xbb8
 8002d08:	f7fe fd1a 	bl	8001740 <NetSetTimeout>
 8002d0c:	34f1      	adds	r4, #241	; 0xf1
 8002d0e:	480d      	ldr	r0, [pc, #52]	; (8002d44 <BootpRequest+0x174>)
 8002d10:	f7fe fd10 	bl	8001734 <NetSetHandler>
 8002d14:	4621      	mov	r1, r4
 8002d16:	6838      	ldr	r0, [r7, #0]
 8002d18:	f7fe fd22 	bl	8001760 <NetSendPacket>
 8002d1c:	b007      	add	sp, #28
 8002d1e:	e8bd 86f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, pc}
 8002d22:	bf00      	nop
 8002d24:	2000338c 	.word	0x2000338c
 8002d28:	20000d28 	.word	0x20000d28
 8002d2c:	0800cd78 	.word	0x0800cd78
 8002d30:	20000034 	.word	0x20000034
 8002d34:	10624dd3 	.word	0x10624dd3
 8002d38:	00ffff00 	.word	0x00ffff00
 8002d3c:	200031cc 	.word	0x200031cc
 8002d40:	08002d4d 	.word	0x08002d4d
 8002d44:	080028c5 	.word	0x080028c5
 8002d48:	20000d20 	.word	0x20000d20

08002d4c <BootpTimeout>:
 8002d4c:	b508      	push	{r3, lr}
 8002d4e:	4b0a      	ldr	r3, [pc, #40]	; (8002d78 <BootpTimeout+0x2c>)
 8002d50:	685b      	ldr	r3, [r3, #4]
 8002d52:	2b04      	cmp	r3, #4
 8002d54:	dc08      	bgt.n	8002d68 <BootpTimeout+0x1c>
 8002d56:	4909      	ldr	r1, [pc, #36]	; (8002d7c <BootpTimeout+0x30>)
 8002d58:	f241 3088 	movw	r0, #5000	; 0x1388
 8002d5c:	f7fe fcf0 	bl	8001740 <NetSetTimeout>
 8002d60:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8002d64:	f7ff bf34 	b.w	8002bd0 <BootpRequest>
 8002d68:	4805      	ldr	r0, [pc, #20]	; (8002d80 <BootpTimeout+0x34>)
 8002d6a:	f002 fae9 	bl	8005340 <puts>
 8002d6e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8002d72:	f7fe bc83 	b.w	800167c <NetStartAgain>
 8002d76:	bf00      	nop
 8002d78:	2000338c 	.word	0x2000338c
 8002d7c:	08002d4d 	.word	0x08002d4d
 8002d80:	0800cab4 	.word	0x0800cab4

08002d84 <serial_setbrg>:
 8002d84:	b510      	push	{r4, lr}
 8002d86:	4b0f      	ldr	r3, [pc, #60]	; (8002dc4 <serial_setbrg+0x40>)
 8002d88:	2002      	movs	r0, #2
 8002d8a:	4798      	blx	r3
 8002d8c:	f8d8 3008 	ldr.w	r3, [r8, #8]
 8002d90:	eb00 0080 	add.w	r0, r0, r0, lsl #2
 8002d94:	009b      	lsls	r3, r3, #2
 8002d96:	eb00 0080 	add.w	r0, r0, r0, lsl #2
 8002d9a:	fbb0 f0f3 	udiv	r0, r0, r3
 8002d9e:	2364      	movs	r3, #100	; 0x64
 8002da0:	4909      	ldr	r1, [pc, #36]	; (8002dc8 <serial_setbrg+0x44>)
 8002da2:	4c0a      	ldr	r4, [pc, #40]	; (8002dcc <serial_setbrg+0x48>)
 8002da4:	fba1 e200 	umull	lr, r2, r1, r0
 8002da8:	0952      	lsrs	r2, r2, #5
 8002daa:	fb03 0312 	mls	r3, r3, r2, r0
 8002dae:	011b      	lsls	r3, r3, #4
 8002db0:	3332      	adds	r3, #50	; 0x32
 8002db2:	fba1 1303 	umull	r1, r3, r1, r3
 8002db6:	6821      	ldr	r1, [r4, #0]
 8002db8:	f3c3 1343 	ubfx	r3, r3, #5, #4
 8002dbc:	ea43 1302 	orr.w	r3, r3, r2, lsl #4
 8002dc0:	60cb      	str	r3, [r1, #12]
 8002dc2:	bd10      	pop	{r4, pc}
 8002dc4:	20000b21 	.word	0x20000b21
 8002dc8:	51eb851f 	.word	0x51eb851f
 8002dcc:	20003394 	.word	0x20003394

08002dd0 <serial_init>:
 8002dd0:	b510      	push	{r4, lr}
 8002dd2:	2002      	movs	r0, #2
 8002dd4:	b082      	sub	sp, #8
 8002dd6:	f004 fed3 	bl	8007b80 <led_config>
 8002dda:	4c14      	ldr	r4, [pc, #80]	; (8002e2c <serial_init+0x5c>)
 8002ddc:	4b14      	ldr	r3, [pc, #80]	; (8002e30 <serial_init+0x60>)
 8002dde:	4a15      	ldr	r2, [pc, #84]	; (8002e34 <serial_init+0x64>)
 8002de0:	6023      	str	r3, [r4, #0]
 8002de2:	6813      	ldr	r3, [r2, #0]
 8002de4:	2101      	movs	r1, #1
 8002de6:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
 8002dea:	6013      	str	r3, [r2, #0]
 8002dec:	4812      	ldr	r0, [pc, #72]	; (8002e38 <serial_init+0x68>)
 8002dee:	f008 fbb7 	bl	800b560 <stm32f2_gpio_config>
 8002df2:	b108      	cbz	r0, 8002df8 <serial_init+0x28>
 8002df4:	b002      	add	sp, #8
 8002df6:	bd10      	pop	{r4, pc}
 8002df8:	2101      	movs	r1, #1
 8002dfa:	4810      	ldr	r0, [pc, #64]	; (8002e3c <serial_init+0x6c>)
 8002dfc:	f008 fbb0 	bl	800b560 <stm32f2_gpio_config>
 8002e00:	2800      	cmp	r0, #0
 8002e02:	d1f7      	bne.n	8002df4 <serial_init+0x24>
 8002e04:	220c      	movs	r2, #12
 8002e06:	6823      	ldr	r3, [r4, #0]
 8002e08:	9001      	str	r0, [sp, #4]
 8002e0a:	601a      	str	r2, [r3, #0]
 8002e0c:	6058      	str	r0, [r3, #4]
 8002e0e:	6098      	str	r0, [r3, #8]
 8002e10:	689a      	ldr	r2, [r3, #8]
 8002e12:	f442 5280 	orr.w	r2, r2, #4096	; 0x1000
 8002e16:	609a      	str	r2, [r3, #8]
 8002e18:	f7ff ffb4 	bl	8002d84 <serial_setbrg>
 8002e1c:	6822      	ldr	r2, [r4, #0]
 8002e1e:	9801      	ldr	r0, [sp, #4]
 8002e20:	6813      	ldr	r3, [r2, #0]
 8002e22:	f043 0301 	orr.w	r3, r3, #1
 8002e26:	6013      	str	r3, [r2, #0]
 8002e28:	b002      	add	sp, #8
 8002e2a:	bd10      	pop	{r4, pc}
 8002e2c:	20003394 	.word	0x20003394
 8002e30:	40004400 	.word	0x40004400
 8002e34:	40023840 	.word	0x40023840
 8002e38:	20000050 	.word	0x20000050
 8002e3c:	20000054 	.word	0x20000054

08002e40 <serial_getc>:
 8002e40:	4b03      	ldr	r3, [pc, #12]	; (8002e50 <serial_getc+0x10>)
 8002e42:	681a      	ldr	r2, [r3, #0]
 8002e44:	69d3      	ldr	r3, [r2, #28]
 8002e46:	069b      	lsls	r3, r3, #26
 8002e48:	d5fc      	bpl.n	8002e44 <serial_getc+0x4>
 8002e4a:	6a50      	ldr	r0, [r2, #36]	; 0x24
 8002e4c:	b2c0      	uxtb	r0, r0
 8002e4e:	4770      	bx	lr
 8002e50:	20003394 	.word	0x20003394

08002e54 <serial_putc>:
 8002e54:	280a      	cmp	r0, #10
 8002e56:	b510      	push	{r4, lr}
 8002e58:	4604      	mov	r4, r0
 8002e5a:	d007      	beq.n	8002e6c <serial_putc+0x18>
 8002e5c:	4b05      	ldr	r3, [pc, #20]	; (8002e74 <serial_putc+0x20>)
 8002e5e:	681a      	ldr	r2, [r3, #0]
 8002e60:	69d3      	ldr	r3, [r2, #28]
 8002e62:	061b      	lsls	r3, r3, #24
 8002e64:	d5fc      	bpl.n	8002e60 <serial_putc+0xc>
 8002e66:	b2e4      	uxtb	r4, r4
 8002e68:	6294      	str	r4, [r2, #40]	; 0x28
 8002e6a:	bd10      	pop	{r4, pc}
 8002e6c:	200d      	movs	r0, #13
 8002e6e:	f7ff fff1 	bl	8002e54 <serial_putc>
 8002e72:	e7f3      	b.n	8002e5c <serial_putc+0x8>
 8002e74:	20003394 	.word	0x20003394

08002e78 <serial_puts>:
 8002e78:	4601      	mov	r1, r0
 8002e7a:	f990 0000 	ldrsb.w	r0, [r0]
 8002e7e:	b138      	cbz	r0, 8002e90 <serial_puts+0x18>
 8002e80:	b508      	push	{r3, lr}
 8002e82:	f7ff ffe7 	bl	8002e54 <serial_putc>
 8002e86:	f911 0f01 	ldrsb.w	r0, [r1, #1]!
 8002e8a:	2800      	cmp	r0, #0
 8002e8c:	d1f9      	bne.n	8002e82 <serial_puts+0xa>
 8002e8e:	bd08      	pop	{r3, pc}
 8002e90:	4770      	bx	lr
 8002e92:	bf00      	nop

08002e94 <serial_tstc>:
 8002e94:	4b02      	ldr	r3, [pc, #8]	; (8002ea0 <serial_tstc+0xc>)
 8002e96:	681b      	ldr	r3, [r3, #0]
 8002e98:	69d8      	ldr	r0, [r3, #28]
 8002e9a:	f3c0 1040 	ubfx	r0, r0, #5, #1
 8002e9e:	4770      	bx	lr
 8002ea0:	20003394 	.word	0x20003394

08002ea4 <do_bdinfo>:
 8002ea4:	b510      	push	{r4, lr}
 8002ea6:	f8d8 4000 	ldr.w	r4, [r8]
 8002eaa:	b084      	sub	sp, #16
 8002eac:	68e2      	ldr	r2, [r4, #12]
 8002eae:	491b      	ldr	r1, [pc, #108]	; (8002f1c <do_bdinfo+0x78>)
 8002eb0:	481b      	ldr	r0, [pc, #108]	; (8002f20 <do_bdinfo+0x7c>)
 8002eb2:	f002 fa51 	bl	8005358 <printf>
 8002eb6:	68a2      	ldr	r2, [r4, #8]
 8002eb8:	491a      	ldr	r1, [pc, #104]	; (8002f24 <do_bdinfo+0x80>)
 8002eba:	4819      	ldr	r0, [pc, #100]	; (8002f20 <do_bdinfo+0x7c>)
 8002ebc:	f002 fa4c 	bl	8005358 <printf>
 8002ec0:	6922      	ldr	r2, [r4, #16]
 8002ec2:	4919      	ldr	r1, [pc, #100]	; (8002f28 <do_bdinfo+0x84>)
 8002ec4:	4816      	ldr	r0, [pc, #88]	; (8002f20 <do_bdinfo+0x7c>)
 8002ec6:	f002 fa47 	bl	8005358 <printf>
 8002eca:	2200      	movs	r2, #0
 8002ecc:	4917      	ldr	r1, [pc, #92]	; (8002f2c <do_bdinfo+0x88>)
 8002ece:	4814      	ldr	r0, [pc, #80]	; (8002f20 <do_bdinfo+0x7c>)
 8002ed0:	f002 fa42 	bl	8005358 <printf>
 8002ed4:	6962      	ldr	r2, [r4, #20]
 8002ed6:	4916      	ldr	r1, [pc, #88]	; (8002f30 <do_bdinfo+0x8c>)
 8002ed8:	4811      	ldr	r0, [pc, #68]	; (8002f20 <do_bdinfo+0x7c>)
 8002eda:	f002 fa3d 	bl	8005358 <printf>
 8002ede:	69a2      	ldr	r2, [r4, #24]
 8002ee0:	4914      	ldr	r1, [pc, #80]	; (8002f34 <do_bdinfo+0x90>)
 8002ee2:	480f      	ldr	r0, [pc, #60]	; (8002f20 <do_bdinfo+0x7c>)
 8002ee4:	f002 fa38 	bl	8005358 <printf>
 8002ee8:	4913      	ldr	r1, [pc, #76]	; (8002f38 <do_bdinfo+0x94>)
 8002eea:	a801      	add	r0, sp, #4
 8002eec:	f7fd fa48 	bl	8000380 <strcpy>
 8002ef0:	a801      	add	r0, sp, #4
 8002ef2:	f001 ffef 	bl	8004ed4 <getenv>
 8002ef6:	4a11      	ldr	r2, [pc, #68]	; (8002f3c <do_bdinfo+0x98>)
 8002ef8:	a901      	add	r1, sp, #4
 8002efa:	2800      	cmp	r0, #0
 8002efc:	bf18      	it	ne
 8002efe:	4602      	movne	r2, r0
 8002f00:	480f      	ldr	r0, [pc, #60]	; (8002f40 <do_bdinfo+0x9c>)
 8002f02:	f002 fa29 	bl	8005358 <printf>
 8002f06:	1d21      	adds	r1, r4, #4
 8002f08:	480e      	ldr	r0, [pc, #56]	; (8002f44 <do_bdinfo+0xa0>)
 8002f0a:	f002 fa25 	bl	8005358 <printf>
 8002f0e:	6821      	ldr	r1, [r4, #0]
 8002f10:	480d      	ldr	r0, [pc, #52]	; (8002f48 <do_bdinfo+0xa4>)
 8002f12:	f002 fa21 	bl	8005358 <printf>
 8002f16:	2000      	movs	r0, #0
 8002f18:	b004      	add	sp, #16
 8002f1a:	bd10      	pop	{r4, pc}
 8002f1c:	0800cd98 	.word	0x0800cd98
 8002f20:	0800cda4 	.word	0x0800cda4
 8002f24:	0800cdb4 	.word	0x0800cdb4
 8002f28:	0800cdbc 	.word	0x0800cdbc
 8002f2c:	0800cdc8 	.word	0x0800cdc8
 8002f30:	0800cdd4 	.word	0x0800cdd4
 8002f34:	0800cde0 	.word	0x0800cde0
 8002f38:	0800c7b8 	.word	0x0800c7b8
 8002f3c:	0800cd8c 	.word	0x0800cd8c
 8002f40:	0800cde8 	.word	0x0800cde8
 8002f44:	0800cdf4 	.word	0x0800cdf4
 8002f48:	0800ce08 	.word	0x0800ce08

08002f4c <do_go_exec>:
 8002f4c:	b410      	push	{r4}
 8002f4e:	460c      	mov	r4, r1
 8002f50:	4603      	mov	r3, r0
 8002f52:	4611      	mov	r1, r2
 8002f54:	4620      	mov	r0, r4
 8002f56:	bc10      	pop	{r4}
 8002f58:	4718      	bx	r3
 8002f5a:	bf00      	nop

08002f5c <do_go>:
 8002f5c:	2a01      	cmp	r2, #1
 8002f5e:	b570      	push	{r4, r5, r6, lr}
 8002f60:	dd1a      	ble.n	8002f98 <do_go+0x3c>
 8002f62:	461c      	mov	r4, r3
 8002f64:	4615      	mov	r5, r2
 8002f66:	f854 0f04 	ldr.w	r0, [r4, #4]!
 8002f6a:	2210      	movs	r2, #16
 8002f6c:	2100      	movs	r1, #0
 8002f6e:	f005 fcb3 	bl	80088d8 <simple_strtoul>
 8002f72:	4606      	mov	r6, r0
 8002f74:	4601      	mov	r1, r0
 8002f76:	480b      	ldr	r0, [pc, #44]	; (8002fa4 <do_go+0x48>)
 8002f78:	f002 f9ee 	bl	8005358 <printf>
 8002f7c:	4622      	mov	r2, r4
 8002f7e:	1e69      	subs	r1, r5, #1
 8002f80:	4630      	mov	r0, r6
 8002f82:	f7ff ffe3 	bl	8002f4c <do_go_exec>
 8002f86:	1c04      	adds	r4, r0, #0
 8002f88:	bf18      	it	ne
 8002f8a:	2401      	movne	r4, #1
 8002f8c:	4601      	mov	r1, r0
 8002f8e:	4806      	ldr	r0, [pc, #24]	; (8002fa8 <do_go+0x4c>)
 8002f90:	f002 f9e2 	bl	8005358 <printf>
 8002f94:	4620      	mov	r0, r4
 8002f96:	bd70      	pop	{r4, r5, r6, pc}
 8002f98:	2401      	movs	r4, #1
 8002f9a:	f002 f8f3 	bl	8005184 <cmd_usage>
 8002f9e:	4620      	mov	r0, r4
 8002fa0:	bd70      	pop	{r4, r5, r6, pc}
 8002fa2:	bf00      	nop
 8002fa4:	0800ce44 	.word	0x0800ce44
 8002fa8:	0800ce6c 	.word	0x0800ce6c

08002fac <do_bootm_rtems>:
 8002fac:	f030 0280 	bics.w	r2, r0, #128	; 0x80
 8002fb0:	d001      	beq.n	8002fb6 <do_bootm_rtems+0xa>
 8002fb2:	2001      	movs	r0, #1
 8002fb4:	4770      	bx	lr
 8002fb6:	b510      	push	{r4, lr}
 8002fb8:	6e1c      	ldr	r4, [r3, #96]	; 0x60
 8002fba:	4806      	ldr	r0, [pc, #24]	; (8002fd4 <do_bootm_rtems+0x28>)
 8002fbc:	4621      	mov	r1, r4
 8002fbe:	f002 f9cb 	bl	8005358 <printf>
 8002fc2:	200f      	movs	r0, #15
 8002fc4:	f003 feac 	bl	8006d20 <__show_boot_progress>
 8002fc8:	f8d8 0000 	ldr.w	r0, [r8]
 8002fcc:	47a0      	blx	r4
 8002fce:	2001      	movs	r0, #1
 8002fd0:	bd10      	pop	{r4, pc}
 8002fd2:	bf00      	nop
 8002fd4:	0800cf2c 	.word	0x0800cf2c

08002fd8 <do_bootm_netbsd>:
 8002fd8:	f030 0080 	bics.w	r0, r0, #128	; 0x80
 8002fdc:	d001      	beq.n	8002fe2 <do_bootm_netbsd+0xa>
 8002fde:	2001      	movs	r0, #1
 8002fe0:	4770      	bx	lr
 8002fe2:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8002fe6:	4699      	mov	r9, r3
 8002fe8:	f893 3022 	ldrb.w	r3, [r3, #34]	; 0x22
 8002fec:	b084      	sub	sp, #16
 8002fee:	2b04      	cmp	r3, #4
 8002ff0:	4616      	mov	r6, r2
 8002ff2:	468b      	mov	fp, r1
 8002ff4:	d047      	beq.n	8003086 <do_bootm_netbsd+0xae>
 8002ff6:	2300      	movs	r3, #0
 8002ff8:	9301      	str	r3, [sp, #4]
 8002ffa:	f1bb 0f02 	cmp.w	fp, #2
 8002ffe:	dd39      	ble.n	8003074 <do_bootm_netbsd+0x9c>
 8003000:	3604      	adds	r6, #4
 8003002:	4637      	mov	r7, r6
 8003004:	2400      	movs	r4, #0
 8003006:	2502      	movs	r5, #2
 8003008:	f857 0f04 	ldr.w	r0, [r7, #4]!
 800300c:	f7fd fa52 	bl	80004b4 <strlen>
 8003010:	3501      	adds	r5, #1
 8003012:	3001      	adds	r0, #1
 8003014:	45ab      	cmp	fp, r5
 8003016:	4404      	add	r4, r0
 8003018:	d1f6      	bne.n	8003008 <do_bootm_netbsd+0x30>
 800301a:	4620      	mov	r0, r4
 800301c:	f002 fc32 	bl	8005884 <malloc>
 8003020:	f04f 0a02 	mov.w	sl, #2
 8003024:	4683      	mov	fp, r0
 8003026:	2400      	movs	r4, #0
 8003028:	2720      	movs	r7, #32
 800302a:	e002      	b.n	8003032 <do_bootm_netbsd+0x5a>
 800302c:	f80b 7004 	strb.w	r7, [fp, r4]
 8003030:	3401      	adds	r4, #1
 8003032:	6871      	ldr	r1, [r6, #4]
 8003034:	eb0b 0004 	add.w	r0, fp, r4
 8003038:	f7fd f9a2 	bl	8000380 <strcpy>
 800303c:	f856 0f04 	ldr.w	r0, [r6, #4]!
 8003040:	f7fd fa38 	bl	80004b4 <strlen>
 8003044:	f10a 0a01 	add.w	sl, sl, #1
 8003048:	4555      	cmp	r5, sl
 800304a:	4404      	add	r4, r0
 800304c:	d1ee      	bne.n	800302c <do_bootm_netbsd+0x54>
 800304e:	f8d9 4060 	ldr.w	r4, [r9, #96]	; 0x60
 8003052:	4813      	ldr	r0, [pc, #76]	; (80030a0 <do_bootm_netbsd+0xc8>)
 8003054:	4621      	mov	r1, r4
 8003056:	f002 f97f 	bl	8005358 <printf>
 800305a:	200f      	movs	r0, #15
 800305c:	f003 fe60 	bl	8006d20 <__show_boot_progress>
 8003060:	465b      	mov	r3, fp
 8003062:	f8d8 0000 	ldr.w	r0, [r8]
 8003066:	9901      	ldr	r1, [sp, #4]
 8003068:	4a0e      	ldr	r2, [pc, #56]	; (80030a4 <do_bootm_netbsd+0xcc>)
 800306a:	47a0      	blx	r4
 800306c:	2001      	movs	r0, #1
 800306e:	b004      	add	sp, #16
 8003070:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8003074:	480c      	ldr	r0, [pc, #48]	; (80030a8 <do_bootm_netbsd+0xd0>)
 8003076:	f001 ff2d 	bl	8004ed4 <getenv>
 800307a:	4b0a      	ldr	r3, [pc, #40]	; (80030a4 <do_bootm_netbsd+0xcc>)
 800307c:	2800      	cmp	r0, #0
 800307e:	bf14      	ite	ne
 8003080:	4683      	movne	fp, r0
 8003082:	469b      	moveq	fp, r3
 8003084:	e7e3      	b.n	800304e <do_bootm_netbsd+0x76>
 8003086:	f8d9 3000 	ldr.w	r3, [r9]
 800308a:	aa02      	add	r2, sp, #8
 800308c:	4618      	mov	r0, r3
 800308e:	9301      	str	r3, [sp, #4]
 8003090:	2101      	movs	r1, #1
 8003092:	ab03      	add	r3, sp, #12
 8003094:	f003 fab4 	bl	8006600 <image_multi_getimg>
 8003098:	9b03      	ldr	r3, [sp, #12]
 800309a:	2b00      	cmp	r3, #0
 800309c:	d0ab      	beq.n	8002ff6 <do_bootm_netbsd+0x1e>
 800309e:	e7ac      	b.n	8002ffa <do_bootm_netbsd+0x22>
 80030a0:	0800cf74 	.word	0x0800cf74
 80030a4:	0800d63c 	.word	0x0800d63c
 80030a8:	0800cf68 	.word	0x0800cf68

080030ac <bootm_load_os.isra.12>:
 80030ac:	e92d 42f0 	stmdb	sp!, {r4, r5, r6, r7, r9, lr}
 80030b0:	b082      	sub	sp, #8
 80030b2:	f89d 4028 	ldrb.w	r4, [sp, #40]	; 0x28
 80030b6:	f89d 5024 	ldrb.w	r5, [sp, #36]	; 0x24
 80030ba:	4607      	mov	r7, r0
 80030bc:	4620      	mov	r0, r4
 80030be:	4689      	mov	r9, r1
 80030c0:	4616      	mov	r6, r2
 80030c2:	9301      	str	r3, [sp, #4]
 80030c4:	9c08      	ldr	r4, [sp, #32]
 80030c6:	f003 fc2d 	bl	8006924 <genimg_get_type_name>
 80030ca:	b36d      	cbz	r5, 8003128 <bootm_load_os.isra.12+0x7c>
 80030cc:	2d01      	cmp	r5, #1
 80030ce:	d122      	bne.n	8003116 <bootm_load_os.isra.12+0x6a>
 80030d0:	4601      	mov	r1, r0
 80030d2:	4831      	ldr	r0, [pc, #196]	; (8003198 <bootm_load_os.isra.12+0xec>)
 80030d4:	f002 f940 	bl	8005358 <printf>
 80030d8:	4632      	mov	r2, r6
 80030da:	ab01      	add	r3, sp, #4
 80030dc:	f44f 0100 	mov.w	r1, #8388608	; 0x800000
 80030e0:	4620      	mov	r0, r4
 80030e2:	f004 ffa3 	bl	800802c <gunzip>
 80030e6:	2800      	cmp	r0, #0
 80030e8:	d143      	bne.n	8003172 <bootm_load_os.isra.12+0xc6>
 80030ea:	9b01      	ldr	r3, [sp, #4]
 80030ec:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
 80030ee:	4423      	add	r3, r4
 80030f0:	6013      	str	r3, [r2, #0]
 80030f2:	482a      	ldr	r0, [pc, #168]	; (800319c <bootm_load_os.isra.12+0xf0>)
 80030f4:	f002 f924 	bl	8005340 <puts>
 80030f8:	9b0c      	ldr	r3, [sp, #48]	; 0x30
 80030fa:	2b00      	cmp	r3, #0
 80030fc:	d130      	bne.n	8003160 <bootm_load_os.isra.12+0xb4>
 80030fe:	454c      	cmp	r4, r9
 8003100:	d233      	bcs.n	800316a <bootm_load_os.isra.12+0xbe>
 8003102:	9b0b      	ldr	r3, [sp, #44]	; 0x2c
 8003104:	681b      	ldr	r3, [r3, #0]
 8003106:	42bb      	cmp	r3, r7
 8003108:	bf94      	ite	ls
 800310a:	2000      	movls	r0, #0
 800310c:	f06f 0001 	mvnhi.w	r0, #1
 8003110:	b002      	add	sp, #8
 8003112:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 8003116:	4822      	ldr	r0, [pc, #136]	; (80031a0 <bootm_load_os.isra.12+0xf4>)
 8003118:	4629      	mov	r1, r5
 800311a:	f002 f91d 	bl	8005358 <printf>
 800311e:	f06f 0002 	mvn.w	r0, #2
 8003122:	b002      	add	sp, #8
 8003124:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 8003128:	42bc      	cmp	r4, r7
 800312a:	4601      	mov	r1, r0
 800312c:	d029      	beq.n	8003182 <bootm_load_os.isra.12+0xd6>
 800312e:	481d      	ldr	r0, [pc, #116]	; (80031a4 <bootm_load_os.isra.12+0xf8>)
 8003130:	f002 f912 	bl	8005358 <printf>
 8003134:	42b4      	cmp	r4, r6
 8003136:	d006      	beq.n	8003146 <bootm_load_os.isra.12+0x9a>
 8003138:	4631      	mov	r1, r6
 800313a:	f44f 3380 	mov.w	r3, #65536	; 0x10000
 800313e:	9a01      	ldr	r2, [sp, #4]
 8003140:	4620      	mov	r0, r4
 8003142:	f003 fb9f 	bl	8006884 <memmove_wd>
 8003146:	9b01      	ldr	r3, [sp, #4]
 8003148:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
 800314a:	4423      	add	r3, r4
 800314c:	6013      	str	r3, [r2, #0]
 800314e:	4813      	ldr	r0, [pc, #76]	; (800319c <bootm_load_os.isra.12+0xf0>)
 8003150:	f002 f8f6 	bl	8005340 <puts>
 8003154:	4811      	ldr	r0, [pc, #68]	; (800319c <bootm_load_os.isra.12+0xf0>)
 8003156:	f002 f8f3 	bl	8005340 <puts>
 800315a:	9b0c      	ldr	r3, [sp, #48]	; 0x30
 800315c:	2b00      	cmp	r3, #0
 800315e:	d0ce      	beq.n	80030fe <bootm_load_os.isra.12+0x52>
 8003160:	2007      	movs	r0, #7
 8003162:	f003 fddd 	bl	8006d20 <__show_boot_progress>
 8003166:	454c      	cmp	r4, r9
 8003168:	d3cb      	bcc.n	8003102 <bootm_load_os.isra.12+0x56>
 800316a:	2000      	movs	r0, #0
 800316c:	b002      	add	sp, #8
 800316e:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 8003172:	480d      	ldr	r0, [pc, #52]	; (80031a8 <bootm_load_os.isra.12+0xfc>)
 8003174:	f002 f8e4 	bl	8005340 <puts>
 8003178:	9b0c      	ldr	r3, [sp, #48]	; 0x30
 800317a:	b933      	cbnz	r3, 800318a <bootm_load_os.isra.12+0xde>
 800317c:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8003180:	e7cf      	b.n	8003122 <bootm_load_os.isra.12+0x76>
 8003182:	480a      	ldr	r0, [pc, #40]	; (80031ac <bootm_load_os.isra.12+0x100>)
 8003184:	f002 f8e8 	bl	8005358 <printf>
 8003188:	e7dd      	b.n	8003146 <bootm_load_os.isra.12+0x9a>
 800318a:	f06f 0005 	mvn.w	r0, #5
 800318e:	f003 fdc7 	bl	8006d20 <__show_boot_progress>
 8003192:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8003196:	e7c4      	b.n	8003122 <bootm_load_os.isra.12+0x76>
 8003198:	0800cfe8 	.word	0x0800cfe8
 800319c:	0800cfe4 	.word	0x0800cfe4
 80031a0:	0800d058 	.word	0x0800d058
 80031a4:	0800cfd0 	.word	0x0800cfd0
 80031a8:	0800d004 	.word	0x0800d004
 80031ac:	0800cfc0 	.word	0x0800cfc0

080031b0 <bootm_start.isra.11>:
 80031b0:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 80031b4:	4c95      	ldr	r4, [pc, #596]	; (800340c <bootm_start.isra.11+0x25c>)
 80031b6:	b084      	sub	sp, #16
 80031b8:	4689      	mov	r9, r1
 80031ba:	4683      	mov	fp, r0
 80031bc:	2100      	movs	r1, #0
 80031be:	4692      	mov	sl, r2
 80031c0:	4620      	mov	r0, r4
 80031c2:	f44f 7296 	mov.w	r2, #300	; 0x12c
 80031c6:	f7fd fa83 	bl	80006d0 <memset>
 80031ca:	4891      	ldr	r0, [pc, #580]	; (8003410 <bootm_start.isra.11+0x260>)
 80031cc:	f003 fb2c 	bl	8006828 <getenv_yesno>
 80031d0:	f8c4 0084 	str.w	r0, [r4, #132]	; 0x84
 80031d4:	f104 008c 	add.w	r0, r4, #140	; 0x8c
 80031d8:	f005 f81a 	bl	8008210 <lmb_init>
 80031dc:	f003 fb30 	bl	8006840 <getenv_bootm_low>
 80031e0:	4605      	mov	r5, r0
 80031e2:	f003 fb3f 	bl	8006864 <getenv_bootm_size>
 80031e6:	4629      	mov	r1, r5
 80031e8:	4602      	mov	r2, r0
 80031ea:	f104 008c 	add.w	r0, r4, #140	; 0x8c
 80031ee:	f005 f81b 	bl	8008228 <lmb_add>
 80031f2:	f104 008c 	add.w	r0, r4, #140	; 0x8c
 80031f6:	f008 f8bd 	bl	800b374 <arch_lmb_reserve>
 80031fa:	f104 008c 	add.w	r0, r4, #140	; 0x8c
 80031fe:	f005 f917 	bl	8008430 <__board_lmb_reserve>
 8003202:	f1b9 0f01 	cmp.w	r9, #1
 8003206:	f340 80ad 	ble.w	8003364 <bootm_start.isra.11+0x1b4>
 800320a:	2210      	movs	r2, #16
 800320c:	2100      	movs	r1, #0
 800320e:	f8da 0004 	ldr.w	r0, [sl, #4]
 8003212:	f005 fb61 	bl	80088d8 <simple_strtoul>
 8003216:	4605      	mov	r5, r0
 8003218:	2001      	movs	r0, #1
 800321a:	f003 fd81 	bl	8006d20 <__show_boot_progress>
 800321e:	4628      	mov	r0, r5
 8003220:	f003 fbf8 	bl	8006a14 <genimg_get_image>
 8003224:	2700      	movs	r7, #0
 8003226:	4606      	mov	r6, r0
 8003228:	4605      	mov	r5, r0
 800322a:	6567      	str	r7, [r4, #84]	; 0x54
 800322c:	6527      	str	r7, [r4, #80]	; 0x50
 800322e:	f003 fbe7 	bl	8006a00 <genimg_get_format>
 8003232:	2801      	cmp	r0, #1
 8003234:	f040 80cb 	bne.w	80033ce <bootm_start.isra.11+0x21e>
 8003238:	4631      	mov	r1, r6
 800323a:	4876      	ldr	r0, [pc, #472]	; (8003414 <bootm_start.isra.11+0x264>)
 800323c:	f002 f88c 	bl	8005358 <printf>
 8003240:	6832      	ldr	r2, [r6, #0]
 8003242:	4b75      	ldr	r3, [pc, #468]	; (8003418 <bootm_start.isra.11+0x268>)
 8003244:	429a      	cmp	r2, r3
 8003246:	f040 80aa 	bne.w	800339e <bootm_start.isra.11+0x1ee>
 800324a:	2002      	movs	r0, #2
 800324c:	f8d4 7084 	ldr.w	r7, [r4, #132]	; 0x84
 8003250:	f003 fd66 	bl	8006d20 <__show_boot_progress>
 8003254:	4630      	mov	r0, r6
 8003256:	f003 f99b 	bl	8006590 <image_check_hcrc>
 800325a:	2800      	cmp	r0, #0
 800325c:	f000 80c2 	beq.w	80033e4 <bootm_start.isra.11+0x234>
 8003260:	2003      	movs	r0, #3
 8003262:	f003 fd5d 	bl	8006d20 <__show_boot_progress>
 8003266:	4630      	mov	r0, r6
 8003268:	f003 f9fa 	bl	8006660 <image_print_contents>
 800326c:	b167      	cbz	r7, 8003288 <bootm_start.isra.11+0xd8>
 800326e:	486b      	ldr	r0, [pc, #428]	; (800341c <bootm_start.isra.11+0x26c>)
 8003270:	f002 f866 	bl	8005340 <puts>
 8003274:	4630      	mov	r0, r6
 8003276:	f003 f9a3 	bl	80065c0 <image_check_dcrc>
 800327a:	4607      	mov	r7, r0
 800327c:	2800      	cmp	r0, #0
 800327e:	f000 80bc 	beq.w	80033fa <bootm_start.isra.11+0x24a>
 8003282:	4867      	ldr	r0, [pc, #412]	; (8003420 <bootm_start.isra.11+0x270>)
 8003284:	f002 f85c 	bl	8005340 <puts>
 8003288:	2004      	movs	r0, #4
 800328a:	f003 fd49 	bl	8006d20 <__show_boot_progress>
 800328e:	7f71      	ldrb	r1, [r6, #29]
 8003290:	2902      	cmp	r1, #2
 8003292:	d036      	beq.n	8003302 <bootm_start.isra.11+0x152>
 8003294:	4863      	ldr	r0, [pc, #396]	; (8003424 <bootm_start.isra.11+0x274>)
 8003296:	f002 f85f 	bl	8005358 <printf>
 800329a:	f06f 0003 	mvn.w	r0, #3
 800329e:	f003 fd3f 	bl	8006d20 <__show_boot_progress>
 80032a2:	2500      	movs	r5, #0
 80032a4:	6d63      	ldr	r3, [r4, #84]	; 0x54
 80032a6:	2b00      	cmp	r3, #0
 80032a8:	d042      	beq.n	8003330 <bootm_start.isra.11+0x180>
 80032aa:	4628      	mov	r0, r5
 80032ac:	f003 fba8 	bl	8006a00 <genimg_get_format>
 80032b0:	2801      	cmp	r0, #1
 80032b2:	4606      	mov	r6, r0
 80032b4:	d17c      	bne.n	80033b0 <bootm_start.isra.11+0x200>
 80032b6:	7faf      	ldrb	r7, [r5, #30]
 80032b8:	f105 0340 	add.w	r3, r5, #64	; 0x40
 80032bc:	f884 705d 	strb.w	r7, [r4, #93]	; 0x5d
 80032c0:	7fea      	ldrb	r2, [r5, #31]
 80032c2:	6c61      	ldr	r1, [r4, #68]	; 0x44
 80032c4:	f884 205c 	strb.w	r2, [r4, #92]	; 0x5c
 80032c8:	f895 e01c 	ldrb.w	lr, [r5, #28]
 80032cc:	f884 e05e 	strb.w	lr, [r4, #94]	; 0x5e
 80032d0:	68e8      	ldr	r0, [r5, #12]
 80032d2:	692a      	ldr	r2, [r5, #16]
 80032d4:	ba00      	rev	r0, r0
 80032d6:	4403      	add	r3, r0
 80032d8:	ba12      	rev	r2, r2
 80032da:	64e3      	str	r3, [r4, #76]	; 0x4c
 80032dc:	65a2      	str	r2, [r4, #88]	; 0x58
 80032de:	2900      	cmp	r1, #0
 80032e0:	d06e      	beq.n	80033c0 <bootm_start.isra.11+0x210>
 80032e2:	69a3      	ldr	r3, [r4, #24]
 80032e4:	2f02      	cmp	r7, #2
 80032e6:	ba1b      	rev	r3, r3
 80032e8:	6623      	str	r3, [r4, #96]	; 0x60
 80032ea:	d045      	beq.n	8003378 <bootm_start.isra.11+0x1c8>
 80032ec:	2f04      	cmp	r7, #4
 80032ee:	d043      	beq.n	8003378 <bootm_start.isra.11+0x1c8>
 80032f0:	2301      	movs	r3, #1
 80032f2:	2600      	movs	r6, #0
 80032f4:	64a5      	str	r5, [r4, #72]	; 0x48
 80032f6:	f8c4 3088 	str.w	r3, [r4, #136]	; 0x88
 80032fa:	4630      	mov	r0, r6
 80032fc:	b004      	add	sp, #16
 80032fe:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8003302:	2005      	movs	r0, #5
 8003304:	f003 fd0c 	bl	8006d20 <__show_boot_progress>
 8003308:	7fb3      	ldrb	r3, [r6, #30]
 800330a:	2b02      	cmp	r3, #2
 800330c:	d02d      	beq.n	800336a <bootm_start.isra.11+0x1ba>
 800330e:	2b04      	cmp	r3, #4
 8003310:	d016      	beq.n	8003340 <bootm_start.isra.11+0x190>
 8003312:	2b01      	cmp	r3, #1
 8003314:	d029      	beq.n	800336a <bootm_start.isra.11+0x1ba>
 8003316:	f8db 1000 	ldr.w	r1, [fp]
 800331a:	4843      	ldr	r0, [pc, #268]	; (8003428 <bootm_start.isra.11+0x278>)
 800331c:	f002 f81c 	bl	8005358 <printf>
 8003320:	f06f 0004 	mvn.w	r0, #4
 8003324:	f003 fcfc 	bl	8006d20 <__show_boot_progress>
 8003328:	6d63      	ldr	r3, [r4, #84]	; 0x54
 800332a:	2500      	movs	r5, #0
 800332c:	2b00      	cmp	r3, #0
 800332e:	d1bc      	bne.n	80032aa <bootm_start.isra.11+0xfa>
 8003330:	2601      	movs	r6, #1
 8003332:	483e      	ldr	r0, [pc, #248]	; (800342c <bootm_start.isra.11+0x27c>)
 8003334:	f002 f804 	bl	8005340 <puts>
 8003338:	4630      	mov	r0, r6
 800333a:	b004      	add	sp, #16
 800333c:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8003340:	4b3b      	ldr	r3, [pc, #236]	; (8003430 <bootm_start.isra.11+0x280>)
 8003342:	2100      	movs	r1, #0
 8003344:	1f1a      	subs	r2, r3, #4
 8003346:	4630      	mov	r0, r6
 8003348:	f003 f95a 	bl	8006600 <image_multi_getimg>
 800334c:	2240      	movs	r2, #64	; 0x40
 800334e:	4631      	mov	r1, r6
 8003350:	4838      	ldr	r0, [pc, #224]	; (8003434 <bootm_start.isra.11+0x284>)
 8003352:	f7fd fa23 	bl	800079c <memmove>
 8003356:	2301      	movs	r3, #1
 8003358:	2006      	movs	r0, #6
 800335a:	6026      	str	r6, [r4, #0]
 800335c:	6463      	str	r3, [r4, #68]	; 0x44
 800335e:	f003 fcdf 	bl	8006d20 <__show_boot_progress>
 8003362:	e79f      	b.n	80032a4 <bootm_start.isra.11+0xf4>
 8003364:	4b34      	ldr	r3, [pc, #208]	; (8003438 <bootm_start.isra.11+0x288>)
 8003366:	681d      	ldr	r5, [r3, #0]
 8003368:	e756      	b.n	8003218 <bootm_start.isra.11+0x68>
 800336a:	68f3      	ldr	r3, [r6, #12]
 800336c:	f106 0240 	add.w	r2, r6, #64	; 0x40
 8003370:	ba1b      	rev	r3, r3
 8003372:	6563      	str	r3, [r4, #84]	; 0x54
 8003374:	6522      	str	r2, [r4, #80]	; 0x50
 8003376:	e7e9      	b.n	800334c <bootm_start.isra.11+0x19c>
 8003378:	f1be 0f05 	cmp.w	lr, #5
 800337c:	d1b8      	bne.n	80032f0 <bootm_start.isra.11+0x140>
 800337e:	4a2f      	ldr	r2, [pc, #188]	; (800343c <bootm_start.isra.11+0x28c>)
 8003380:	4651      	mov	r1, sl
 8003382:	1f13      	subs	r3, r2, #4
 8003384:	9201      	str	r2, [sp, #4]
 8003386:	9300      	str	r3, [sp, #0]
 8003388:	4648      	mov	r0, r9
 800338a:	3a68      	subs	r2, #104	; 0x68
 800338c:	2302      	movs	r3, #2
 800338e:	f003 fb45 	bl	8006a1c <boot_get_ramdisk>
 8003392:	2800      	cmp	r0, #0
 8003394:	d0ac      	beq.n	80032f0 <bootm_start.isra.11+0x140>
 8003396:	482a      	ldr	r0, [pc, #168]	; (8003440 <bootm_start.isra.11+0x290>)
 8003398:	f001 ffd2 	bl	8005340 <puts>
 800339c:	e7ad      	b.n	80032fa <bootm_start.isra.11+0x14a>
 800339e:	4829      	ldr	r0, [pc, #164]	; (8003444 <bootm_start.isra.11+0x294>)
 80033a0:	f001 ffce 	bl	8005340 <puts>
 80033a4:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 80033a8:	463d      	mov	r5, r7
 80033aa:	f003 fcb9 	bl	8006d20 <__show_boot_progress>
 80033ae:	e779      	b.n	80032a4 <bootm_start.isra.11+0xf4>
 80033b0:	2601      	movs	r6, #1
 80033b2:	4825      	ldr	r0, [pc, #148]	; (8003448 <bootm_start.isra.11+0x298>)
 80033b4:	f001 ffc4 	bl	8005340 <puts>
 80033b8:	4630      	mov	r0, r6
 80033ba:	b004      	add	sp, #16
 80033bc:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 80033c0:	4822      	ldr	r0, [pc, #136]	; (800344c <bootm_start.isra.11+0x29c>)
 80033c2:	f001 ffbd 	bl	8005340 <puts>
 80033c6:	4630      	mov	r0, r6
 80033c8:	b004      	add	sp, #16
 80033ca:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 80033ce:	f8db 1000 	ldr.w	r1, [fp]
 80033d2:	481f      	ldr	r0, [pc, #124]	; (8003450 <bootm_start.isra.11+0x2a0>)
 80033d4:	f001 ffc0 	bl	8005358 <printf>
 80033d8:	f06f 006b 	mvn.w	r0, #107	; 0x6b
 80033dc:	463d      	mov	r5, r7
 80033de:	f003 fc9f 	bl	8006d20 <__show_boot_progress>
 80033e2:	e75f      	b.n	80032a4 <bootm_start.isra.11+0xf4>
 80033e4:	9003      	str	r0, [sp, #12]
 80033e6:	481b      	ldr	r0, [pc, #108]	; (8003454 <bootm_start.isra.11+0x2a4>)
 80033e8:	f001 ffaa 	bl	8005340 <puts>
 80033ec:	9b03      	ldr	r3, [sp, #12]
 80033ee:	f06f 0001 	mvn.w	r0, #1
 80033f2:	461d      	mov	r5, r3
 80033f4:	f003 fc94 	bl	8006d20 <__show_boot_progress>
 80033f8:	e754      	b.n	80032a4 <bootm_start.isra.11+0xf4>
 80033fa:	4817      	ldr	r0, [pc, #92]	; (8003458 <bootm_start.isra.11+0x2a8>)
 80033fc:	f001 ffac 	bl	8005358 <printf>
 8003400:	f06f 0002 	mvn.w	r0, #2
 8003404:	463d      	mov	r5, r7
 8003406:	f003 fc8b 	bl	8006d20 <__show_boot_progress>
 800340a:	e74b      	b.n	80032a4 <bootm_start.isra.11+0xf4>
 800340c:	20003398 	.word	0x20003398
 8003410:	0800d07c 	.word	0x0800d07c
 8003414:	0800d084 	.word	0x0800d084
 8003418:	56190527 	.word	0x56190527
 800341c:	0800d0e4 	.word	0x0800d0e4
 8003420:	0800cfe4 	.word	0x0800cfe4
 8003424:	0800d1e8 	.word	0x0800d1e8
 8003428:	0800d110 	.word	0x0800d110
 800342c:	0800d158 	.word	0x0800d158
 8003430:	200033ec 	.word	0x200033ec
 8003434:	2000339c 	.word	0x2000339c
 8003438:	20000058 	.word	0x20000058
 800343c:	20003400 	.word	0x20003400
 8003440:	0800d1c0 	.word	0x0800d1c0
 8003444:	0800d0b8 	.word	0x0800d0b8
 8003448:	0800d178 	.word	0x0800d178
 800344c:	0800d19c 	.word	0x0800d19c
 8003450:	0800d134 	.word	0x0800d134
 8003454:	0800d0cc 	.word	0x0800d0cc
 8003458:	0800d100 	.word	0x0800d100

0800345c <__arch_preboot_os>:
 800345c:	4770      	bx	lr
 800345e:	bf00      	nop

08003460 <do_bootm_subcommand>:
 8003460:	e92d 42f0 	stmdb	sp!, {r4, r5, r6, r7, r9, lr}
 8003464:	4954      	ldr	r1, [pc, #336]	; (80035b8 <do_bootm_subcommand+0x158>)
 8003466:	b08c      	sub	sp, #48	; 0x30
 8003468:	4681      	mov	r9, r0
 800346a:	4617      	mov	r7, r2
 800346c:	6858      	ldr	r0, [r3, #4]
 800346e:	2207      	movs	r2, #7
 8003470:	461e      	mov	r6, r3
 8003472:	f001 fd99 	bl	8004fa8 <find_cmd_tbl>
 8003476:	b378      	cbz	r0, 80034d8 <do_bootm_subcommand+0x78>
 8003478:	68c4      	ldr	r4, [r0, #12]
 800347a:	2c01      	cmp	r4, #1
 800347c:	d061      	beq.n	8003542 <do_bootm_subcommand+0xe2>
 800347e:	4d4f      	ldr	r5, [pc, #316]	; (80035bc <do_bootm_subcommand+0x15c>)
 8003480:	f8d5 3088 	ldr.w	r3, [r5, #136]	; 0x88
 8003484:	429c      	cmp	r4, r3
 8003486:	dd24      	ble.n	80034d2 <do_bootm_subcommand+0x72>
 8003488:	4a4d      	ldr	r2, [pc, #308]	; (80035c0 <do_bootm_subcommand+0x160>)
 800348a:	f895 105e 	ldrb.w	r1, [r5, #94]	; 0x5e
 800348e:	4323      	orrs	r3, r4
 8003490:	2c10      	cmp	r4, #16
 8003492:	f8c5 3088 	str.w	r3, [r5, #136]	; 0x88
 8003496:	f852 9021 	ldr.w	r9, [r2, r1, lsl #2]
 800349a:	d059      	beq.n	8003550 <do_bootm_subcommand+0xf0>
 800349c:	dd10      	ble.n	80034c0 <do_bootm_subcommand+0x60>
 800349e:	2c40      	cmp	r4, #64	; 0x40
 80034a0:	d07e      	beq.n	80035a0 <do_bootm_subcommand+0x140>
 80034a2:	2c80      	cmp	r4, #128	; 0x80
 80034a4:	d020      	beq.n	80034e8 <do_bootm_subcommand+0x88>
 80034a6:	2c20      	cmp	r4, #32
 80034a8:	d10e      	bne.n	80034c8 <do_bootm_subcommand+0x68>
 80034aa:	4620      	mov	r0, r4
 80034ac:	462b      	mov	r3, r5
 80034ae:	4632      	mov	r2, r6
 80034b0:	4639      	mov	r1, r7
 80034b2:	47c8      	blx	r9
 80034b4:	4604      	mov	r4, r0
 80034b6:	b198      	cbz	r0, 80034e0 <do_bootm_subcommand+0x80>
 80034b8:	4842      	ldr	r0, [pc, #264]	; (80035c4 <do_bootm_subcommand+0x164>)
 80034ba:	f001 ff4d 	bl	8005358 <printf>
 80034be:	e00f      	b.n	80034e0 <do_bootm_subcommand+0x80>
 80034c0:	2c02      	cmp	r4, #2
 80034c2:	d051      	beq.n	8003568 <do_bootm_subcommand+0x108>
 80034c4:	2c04      	cmp	r4, #4
 80034c6:	d01a      	beq.n	80034fe <do_bootm_subcommand+0x9e>
 80034c8:	2400      	movs	r4, #0
 80034ca:	4620      	mov	r0, r4
 80034cc:	b00c      	add	sp, #48	; 0x30
 80034ce:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 80034d2:	483d      	ldr	r0, [pc, #244]	; (80035c8 <do_bootm_subcommand+0x168>)
 80034d4:	f001 ff40 	bl	8005358 <printf>
 80034d8:	4648      	mov	r0, r9
 80034da:	f001 fe53 	bl	8005184 <cmd_usage>
 80034de:	2401      	movs	r4, #1
 80034e0:	4620      	mov	r0, r4
 80034e2:	b00c      	add	sp, #48	; 0x30
 80034e4:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 80034e8:	f7fd fd52 	bl	8000f90 <disable_interrupts>
 80034ec:	f7ff ffb6 	bl	800345c <__arch_preboot_os>
 80034f0:	4620      	mov	r0, r4
 80034f2:	462b      	mov	r3, r5
 80034f4:	4632      	mov	r2, r6
 80034f6:	4639      	mov	r1, r7
 80034f8:	47c8      	blx	r9
 80034fa:	2400      	movs	r4, #0
 80034fc:	e7f0      	b.n	80034e0 <do_bootm_subcommand+0x80>
 80034fe:	6e69      	ldr	r1, [r5, #100]	; 0x64
 8003500:	6eaa      	ldr	r2, [r5, #104]	; 0x68
 8003502:	f105 0374 	add.w	r3, r5, #116	; 0x74
 8003506:	9300      	str	r3, [sp, #0]
 8003508:	1a52      	subs	r2, r2, r1
 800350a:	f105 0370 	add.w	r3, r5, #112	; 0x70
 800350e:	f105 008c 	add.w	r0, r5, #140	; 0x8c
 8003512:	f003 fb57 	bl	8006bc4 <boot_ramdisk_high>
 8003516:	4604      	mov	r4, r0
 8003518:	2800      	cmp	r0, #0
 800351a:	d1e1      	bne.n	80034e0 <do_bootm_subcommand+0x80>
 800351c:	6f2a      	ldr	r2, [r5, #112]	; 0x70
 800351e:	a807      	add	r0, sp, #28
 8003520:	492a      	ldr	r1, [pc, #168]	; (80035cc <do_bootm_subcommand+0x16c>)
 8003522:	f005 fecf 	bl	80092c4 <sprintf>
 8003526:	a907      	add	r1, sp, #28
 8003528:	4829      	ldr	r0, [pc, #164]	; (80035d0 <do_bootm_subcommand+0x170>)
 800352a:	f001 fca5 	bl	8004e78 <setenv>
 800352e:	6f6a      	ldr	r2, [r5, #116]	; 0x74
 8003530:	a807      	add	r0, sp, #28
 8003532:	4926      	ldr	r1, [pc, #152]	; (80035cc <do_bootm_subcommand+0x16c>)
 8003534:	f005 fec6 	bl	80092c4 <sprintf>
 8003538:	a907      	add	r1, sp, #28
 800353a:	4826      	ldr	r0, [pc, #152]	; (80035d4 <do_bootm_subcommand+0x174>)
 800353c:	f001 fc9c 	bl	8004e78 <setenv>
 8003540:	e7ce      	b.n	80034e0 <do_bootm_subcommand+0x80>
 8003542:	1d32      	adds	r2, r6, #4
 8003544:	1e79      	subs	r1, r7, #1
 8003546:	4648      	mov	r0, r9
 8003548:	f7ff fe32 	bl	80031b0 <bootm_start.isra.11>
 800354c:	4604      	mov	r4, r0
 800354e:	e7c7      	b.n	80034e0 <do_bootm_subcommand+0x80>
 8003550:	4620      	mov	r0, r4
 8003552:	462b      	mov	r3, r5
 8003554:	4632      	mov	r2, r6
 8003556:	4639      	mov	r1, r7
 8003558:	47c8      	blx	r9
 800355a:	4604      	mov	r4, r0
 800355c:	2800      	cmp	r0, #0
 800355e:	d0bf      	beq.n	80034e0 <do_bootm_subcommand+0x80>
 8003560:	481d      	ldr	r0, [pc, #116]	; (80035d8 <do_bootm_subcommand+0x178>)
 8003562:	f001 fef9 	bl	8005358 <printf>
 8003566:	e7bb      	b.n	80034e0 <do_bootm_subcommand+0x80>
 8003568:	2400      	movs	r4, #0
 800356a:	f895 605d 	ldrb.w	r6, [r5, #93]	; 0x5d
 800356e:	f105 0048 	add.w	r0, r5, #72	; 0x48
 8003572:	c80f      	ldmia	r0, {r0, r1, r2, r3}
 8003574:	9404      	str	r4, [sp, #16]
 8003576:	f895 405c 	ldrb.w	r4, [r5, #92]	; 0x5c
 800357a:	9602      	str	r6, [sp, #8]
 800357c:	6dae      	ldr	r6, [r5, #88]	; 0x58
 800357e:	9401      	str	r4, [sp, #4]
 8003580:	ac07      	add	r4, sp, #28
 8003582:	9403      	str	r4, [sp, #12]
 8003584:	9600      	str	r6, [sp, #0]
 8003586:	f7ff fd91 	bl	80030ac <bootm_load_os.isra.12>
 800358a:	4604      	mov	r4, r0
 800358c:	2800      	cmp	r0, #0
 800358e:	d1a7      	bne.n	80034e0 <do_bootm_subcommand+0x80>
 8003590:	6da9      	ldr	r1, [r5, #88]	; 0x58
 8003592:	9a07      	ldr	r2, [sp, #28]
 8003594:	f105 008c 	add.w	r0, r5, #140	; 0x8c
 8003598:	1a52      	subs	r2, r2, r1
 800359a:	f004 fe97 	bl	80082cc <lmb_reserve>
 800359e:	e79f      	b.n	80034e0 <do_bootm_subcommand+0x80>
 80035a0:	4620      	mov	r0, r4
 80035a2:	462b      	mov	r3, r5
 80035a4:	4632      	mov	r2, r6
 80035a6:	4639      	mov	r1, r7
 80035a8:	47c8      	blx	r9
 80035aa:	4604      	mov	r4, r0
 80035ac:	2800      	cmp	r0, #0
 80035ae:	d097      	beq.n	80034e0 <do_bootm_subcommand+0x80>
 80035b0:	480a      	ldr	r0, [pc, #40]	; (80035dc <do_bootm_subcommand+0x17c>)
 80035b2:	f001 fed1 	bl	8005358 <printf>
 80035b6:	e793      	b.n	80034e0 <do_bootm_subcommand+0x80>
 80035b8:	2000005c 	.word	0x2000005c
 80035bc:	20003398 	.word	0x20003398
 80035c0:	0800cee0 	.word	0x0800cee0
 80035c4:	0800d278 	.word	0x0800d278
 80035c8:	0800d208 	.word	0x0800d208
 80035cc:	0800d234 	.word	0x0800d234
 80035d0:	0800d238 	.word	0x0800d238
 80035d4:	0800d248 	.word	0x0800d248
 80035d8:	0800d254 	.word	0x0800d254
 80035dc:	0800d298 	.word	0x0800d298

080035e0 <do_bootm>:
 80035e0:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 80035e4:	4616      	mov	r6, r2
 80035e6:	2200      	movs	r2, #0
 80035e8:	b092      	sub	sp, #72	; 0x48
 80035ea:	2e01      	cmp	r6, #1
 80035ec:	4681      	mov	r9, r0
 80035ee:	468a      	mov	sl, r1
 80035f0:	9307      	str	r3, [sp, #28]
 80035f2:	9209      	str	r2, [sp, #36]	; 0x24
 80035f4:	dd09      	ble.n	800360a <do_bootm+0x2a>
 80035f6:	6858      	ldr	r0, [r3, #4]
 80035f8:	2210      	movs	r2, #16
 80035fa:	a90a      	add	r1, sp, #40	; 0x28
 80035fc:	461c      	mov	r4, r3
 80035fe:	f005 f96b 	bl	80088d8 <simple_strtoul>
 8003602:	9b0a      	ldr	r3, [sp, #40]	; 0x28
 8003604:	f993 3000 	ldrsb.w	r3, [r3]
 8003608:	b95b      	cbnz	r3, 8003622 <do_bootm+0x42>
 800360a:	9a07      	ldr	r2, [sp, #28]
 800360c:	4631      	mov	r1, r6
 800360e:	4648      	mov	r0, r9
 8003610:	f7ff fdce 	bl	80031b0 <bootm_start.isra.11>
 8003614:	4605      	mov	r5, r0
 8003616:	b198      	cbz	r0, 8003640 <do_bootm+0x60>
 8003618:	2501      	movs	r5, #1
 800361a:	4628      	mov	r0, r5
 800361c:	b012      	add	sp, #72	; 0x48
 800361e:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8003622:	2b3a      	cmp	r3, #58	; 0x3a
 8003624:	d0f1      	beq.n	800360a <do_bootm+0x2a>
 8003626:	2b23      	cmp	r3, #35	; 0x23
 8003628:	d0ef      	beq.n	800360a <do_bootm+0x2a>
 800362a:	4623      	mov	r3, r4
 800362c:	4632      	mov	r2, r6
 800362e:	4651      	mov	r1, sl
 8003630:	4648      	mov	r0, r9
 8003632:	f7ff ff15 	bl	8003460 <do_bootm_subcommand>
 8003636:	4605      	mov	r5, r0
 8003638:	4628      	mov	r0, r5
 800363a:	b012      	add	sp, #72	; 0x48
 800363c:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8003640:	f7fd fca6 	bl	8000f90 <disable_interrupts>
 8003644:	2301      	movs	r3, #1
 8003646:	4c56      	ldr	r4, [pc, #344]	; (80037a0 <do_bootm+0x1c0>)
 8003648:	9304      	str	r3, [sp, #16]
 800364a:	f894 e05c 	ldrb.w	lr, [r4, #92]	; 0x5c
 800364e:	f894 c05d 	ldrb.w	ip, [r4, #93]	; 0x5d
 8003652:	4683      	mov	fp, r0
 8003654:	f104 0048 	add.w	r0, r4, #72	; 0x48
 8003658:	c80f      	ldmia	r0, {r0, r1, r2, r3}
 800365a:	f8cd e004 	str.w	lr, [sp, #4]
 800365e:	f8cd c008 	str.w	ip, [sp, #8]
 8003662:	6da7      	ldr	r7, [r4, #88]	; 0x58
 8003664:	f10d 0e24 	add.w	lr, sp, #36	; 0x24
 8003668:	9700      	str	r7, [sp, #0]
 800366a:	f8cd e00c 	str.w	lr, [sp, #12]
 800366e:	f7ff fd1d 	bl	80030ac <bootm_load_os.isra.12>
 8003672:	2800      	cmp	r0, #0
 8003674:	db31      	blt.n	80036da <do_bootm+0xfa>
 8003676:	6da3      	ldr	r3, [r4, #88]	; 0x58
 8003678:	9a09      	ldr	r2, [sp, #36]	; 0x24
 800367a:	4619      	mov	r1, r3
 800367c:	1ad2      	subs	r2, r2, r3
 800367e:	4849      	ldr	r0, [pc, #292]	; (80037a4 <do_bootm+0x1c4>)
 8003680:	f004 fe24 	bl	80082cc <lmb_reserve>
 8003684:	f894 305d 	ldrb.w	r3, [r4, #93]	; 0x5d
 8003688:	2b01      	cmp	r3, #1
 800368a:	d037      	beq.n	80036fc <do_bootm+0x11c>
 800368c:	2008      	movs	r0, #8
 800368e:	f003 fb47 	bl	8006d20 <__show_boot_progress>
 8003692:	f894 005e 	ldrb.w	r0, [r4, #94]	; 0x5e
 8003696:	4b44      	ldr	r3, [pc, #272]	; (80037a8 <do_bootm+0x1c8>)
 8003698:	f853 5020 	ldr.w	r5, [r3, r0, lsl #2]
 800369c:	2d00      	cmp	r5, #0
 800369e:	d046      	beq.n	800372e <do_bootm+0x14e>
 80036a0:	f7ff fedc 	bl	800345c <__arch_preboot_os>
 80036a4:	6da3      	ldr	r3, [r4, #88]	; 0x58
 80036a6:	6d61      	ldr	r1, [r4, #84]	; 0x54
 80036a8:	4618      	mov	r0, r3
 80036aa:	4419      	add	r1, r3
 80036ac:	f7fd fb1e 	bl	8000cec <stm32f7_cache_sync_range>
 80036b0:	9c07      	ldr	r4, [sp, #28]
 80036b2:	4631      	mov	r1, r6
 80036b4:	4622      	mov	r2, r4
 80036b6:	4b3a      	ldr	r3, [pc, #232]	; (80037a0 <do_bootm+0x1c0>)
 80036b8:	2000      	movs	r0, #0
 80036ba:	47a8      	blx	r5
 80036bc:	2501      	movs	r5, #1
 80036be:	f06f 0008 	mvn.w	r0, #8
 80036c2:	f003 fb2d 	bl	8006d20 <__show_boot_progress>
 80036c6:	4623      	mov	r3, r4
 80036c8:	4632      	mov	r2, r6
 80036ca:	4651      	mov	r1, sl
 80036cc:	4648      	mov	r0, r9
 80036ce:	f007 ff33 	bl	800b538 <do_reset>
 80036d2:	4628      	mov	r0, r5
 80036d4:	b012      	add	sp, #72	; 0x48
 80036d6:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 80036da:	1c42      	adds	r2, r0, #1
 80036dc:	d04d      	beq.n	800377a <do_bootm+0x19a>
 80036de:	1c83      	adds	r3, r0, #2
 80036e0:	d03a      	beq.n	8003758 <do_bootm+0x178>
 80036e2:	3003      	adds	r0, #3
 80036e4:	d1c7      	bne.n	8003676 <do_bootm+0x96>
 80036e6:	f1bb 0f00 	cmp.w	fp, #0
 80036ea:	d001      	beq.n	80036f0 <do_bootm+0x110>
 80036ec:	f7fd fc4e 	bl	8000f8c <enable_interrupts>
 80036f0:	f06f 0006 	mvn.w	r0, #6
 80036f4:	f003 fb14 	bl	8006d20 <__show_boot_progress>
 80036f8:	2501      	movs	r5, #1
 80036fa:	e78e      	b.n	800361a <do_bootm+0x3a>
 80036fc:	f1bb 0f00 	cmp.w	fp, #0
 8003700:	d001      	beq.n	8003706 <do_bootm+0x126>
 8003702:	f7fd fc43 	bl	8000f8c <enable_interrupts>
 8003706:	4829      	ldr	r0, [pc, #164]	; (80037ac <do_bootm+0x1cc>)
 8003708:	f001 fbe4 	bl	8004ed4 <getenv>
 800370c:	b128      	cbz	r0, 800371a <do_bootm+0x13a>
 800370e:	4928      	ldr	r1, [pc, #160]	; (80037b0 <do_bootm+0x1d0>)
 8003710:	f7fc fe7a 	bl	8000408 <strcmp>
 8003714:	4681      	mov	r9, r0
 8003716:	2800      	cmp	r0, #0
 8003718:	d036      	beq.n	8003788 <do_bootm+0x1a8>
 800371a:	6e23      	ldr	r3, [r4, #96]	; 0x60
 800371c:	9907      	ldr	r1, [sp, #28]
 800371e:	ba1b      	rev	r3, r3
 8003720:	3104      	adds	r1, #4
 8003722:	1e70      	subs	r0, r6, #1
 8003724:	4798      	blx	r3
 8003726:	4628      	mov	r0, r5
 8003728:	b012      	add	sp, #72	; 0x48
 800372a:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 800372e:	f1bb 0f00 	cmp.w	fp, #0
 8003732:	d003      	beq.n	800373c <do_bootm+0x15c>
 8003734:	f7fd fc2a 	bl	8000f8c <enable_interrupts>
 8003738:	f894 005e 	ldrb.w	r0, [r4, #94]	; 0x5e
 800373c:	f003 f8c6 	bl	80068cc <genimg_get_os_name>
 8003740:	f894 205e 	ldrb.w	r2, [r4, #94]	; 0x5e
 8003744:	4601      	mov	r1, r0
 8003746:	481b      	ldr	r0, [pc, #108]	; (80037b4 <do_bootm+0x1d4>)
 8003748:	f001 fe06 	bl	8005358 <printf>
 800374c:	f06f 0007 	mvn.w	r0, #7
 8003750:	f003 fae6 	bl	8006d20 <__show_boot_progress>
 8003754:	2501      	movs	r5, #1
 8003756:	e760      	b.n	800361a <do_bootm+0x3a>
 8003758:	6c63      	ldr	r3, [r4, #68]	; 0x44
 800375a:	b13b      	cbz	r3, 800376c <do_bootm+0x18c>
 800375c:	f894 3022 	ldrb.w	r3, [r4, #34]	; 0x22
 8003760:	2b04      	cmp	r3, #4
 8003762:	d188      	bne.n	8003676 <do_bootm+0x96>
 8003764:	4814      	ldr	r0, [pc, #80]	; (80037b8 <do_bootm+0x1d8>)
 8003766:	f001 fdeb 	bl	8005340 <puts>
 800376a:	e784      	b.n	8003676 <do_bootm+0x96>
 800376c:	4813      	ldr	r0, [pc, #76]	; (80037bc <do_bootm+0x1dc>)
 800376e:	f001 fde7 	bl	8005340 <puts>
 8003772:	f06f 0070 	mvn.w	r0, #112	; 0x70
 8003776:	f003 fad3 	bl	8006d20 <__show_boot_progress>
 800377a:	9b07      	ldr	r3, [sp, #28]
 800377c:	4632      	mov	r2, r6
 800377e:	4651      	mov	r1, sl
 8003780:	4648      	mov	r0, r9
 8003782:	f007 fed9 	bl	800b538 <do_reset>
 8003786:	e776      	b.n	8003676 <do_bootm+0x96>
 8003788:	6d62      	ldr	r2, [r4, #84]	; 0x54
 800378a:	a80a      	add	r0, sp, #40	; 0x28
 800378c:	490c      	ldr	r1, [pc, #48]	; (80037c0 <do_bootm+0x1e0>)
 800378e:	f005 fd99 	bl	80092c4 <sprintf>
 8003792:	a90a      	add	r1, sp, #40	; 0x28
 8003794:	480b      	ldr	r0, [pc, #44]	; (80037c4 <do_bootm+0x1e4>)
 8003796:	464d      	mov	r5, r9
 8003798:	f001 fb6e 	bl	8004e78 <setenv>
 800379c:	e73d      	b.n	800361a <do_bootm+0x3a>
 800379e:	bf00      	nop
 80037a0:	20003398 	.word	0x20003398
 80037a4:	20003424 	.word	0x20003424
 80037a8:	0800cee0 	.word	0x0800cee0
 80037ac:	0800d33c 	.word	0x0800d33c
 80037b0:	0800c870 	.word	0x0800c870
 80037b4:	0800d348 	.word	0x0800d348
 80037b8:	0800d2b8 	.word	0x0800d2b8
 80037bc:	0800d2f4 	.word	0x0800d2f4
 80037c0:	0800ca78 	.word	0x0800ca78
 80037c4:	0800ca7c 	.word	0x0800ca7c

080037c8 <do_help>:
 80037c8:	b570      	push	{r4, r5, r6, lr}
 80037ca:	4d08      	ldr	r5, [pc, #32]	; (80037ec <do_help+0x24>)
 80037cc:	4c08      	ldr	r4, [pc, #32]	; (80037f0 <do_help+0x28>)
 80037ce:	4e09      	ldr	r6, [pc, #36]	; (80037f4 <do_help+0x2c>)
 80037d0:	1b64      	subs	r4, r4, r5
 80037d2:	b082      	sub	sp, #8
 80037d4:	10a4      	asrs	r4, r4, #2
 80037d6:	e88d 000c 	stmia.w	sp, {r2, r3}
 80037da:	460b      	mov	r3, r1
 80037dc:	4602      	mov	r2, r0
 80037de:	fb06 f104 	mul.w	r1, r6, r4
 80037e2:	4628      	mov	r0, r5
 80037e4:	f001 fc1a 	bl	800501c <_do_help>
 80037e8:	b002      	add	sp, #8
 80037ea:	bd70      	pop	{r4, r5, r6, pc}
 80037ec:	080108a8 	.word	0x080108a8
 80037f0:	08010ac4 	.word	0x08010ac4
 80037f4:	cccccccd 	.word	0xcccccccd

080037f8 <bin_data_init>:
 80037f8:	2100      	movs	r1, #0
 80037fa:	4b02      	ldr	r3, [pc, #8]	; (8003804 <bin_data_init+0xc>)
 80037fc:	689a      	ldr	r2, [r3, #8]
 80037fe:	e883 0006 	stmia.w	r3, {r1, r2}
 8003802:	4770      	bx	lr
 8003804:	200034c4 	.word	0x200034c4

08003808 <load_serial_ymodem>:
 8003808:	2302      	movs	r3, #2
 800380a:	b570      	push	{r4, r5, r6, lr}
 800380c:	f5ad 6d86 	sub.w	sp, sp, #1072	; 0x430
 8003810:	4606      	mov	r6, r0
 8003812:	4669      	mov	r1, sp
 8003814:	a801      	add	r0, sp, #4
 8003816:	9302      	str	r3, [sp, #8]
 8003818:	f003 ffc2 	bl	80077a0 <xyzModem_stream_open>
 800381c:	bb88      	cbnz	r0, 8003882 <load_serial_ymodem+0x7a>
 800381e:	4605      	mov	r5, r0
 8003820:	4604      	mov	r4, r0
 8003822:	e006      	b.n	8003832 <load_serial_ymodem+0x2a>
 8003824:	4610      	mov	r0, r2
 8003826:	a90c      	add	r1, sp, #48	; 0x30
 8003828:	461a      	mov	r2, r3
 800382a:	441d      	add	r5, r3
 800382c:	441c      	add	r4, r3
 800382e:	f7fc ff8f 	bl	8000750 <memcpy>
 8003832:	466a      	mov	r2, sp
 8003834:	f44f 6180 	mov.w	r1, #1024	; 0x400
 8003838:	a80c      	add	r0, sp, #48	; 0x30
 800383a:	f004 f835 	bl	80078a8 <xyzModem_stream_read>
 800383e:	1e03      	subs	r3, r0, #0
 8003840:	eb04 0206 	add.w	r2, r4, r6
 8003844:	dcee      	bgt.n	8003824 <load_serial_ymodem+0x1c>
 8003846:	462c      	mov	r4, r5
 8003848:	4668      	mov	r0, sp
 800384a:	f004 f911 	bl	8007a70 <xyzModem_stream_close>
 800384e:	4912      	ldr	r1, [pc, #72]	; (8003898 <load_serial_ymodem+0x90>)
 8003850:	2000      	movs	r0, #0
 8003852:	f004 f92f 	bl	8007ab4 <xyzModem_stream_terminate>
 8003856:	4621      	mov	r1, r4
 8003858:	4630      	mov	r0, r6
 800385a:	f007 fe6b 	bl	800b534 <flush_cache>
 800385e:	462a      	mov	r2, r5
 8003860:	4629      	mov	r1, r5
 8003862:	480e      	ldr	r0, [pc, #56]	; (800389c <load_serial_ymodem+0x94>)
 8003864:	f001 fd78 	bl	8005358 <printf>
 8003868:	462a      	mov	r2, r5
 800386a:	a804      	add	r0, sp, #16
 800386c:	490c      	ldr	r1, [pc, #48]	; (80038a0 <load_serial_ymodem+0x98>)
 800386e:	f005 fd29 	bl	80092c4 <sprintf>
 8003872:	a904      	add	r1, sp, #16
 8003874:	480b      	ldr	r0, [pc, #44]	; (80038a4 <load_serial_ymodem+0x9c>)
 8003876:	f001 faff 	bl	8004e78 <setenv>
 800387a:	4630      	mov	r0, r6
 800387c:	f50d 6d86 	add.w	sp, sp, #1072	; 0x430
 8003880:	bd70      	pop	{r4, r5, r6, pc}
 8003882:	9800      	ldr	r0, [sp, #0]
 8003884:	f004 f954 	bl	8007b30 <xyzModem_error>
 8003888:	2400      	movs	r4, #0
 800388a:	4601      	mov	r1, r0
 800388c:	4806      	ldr	r0, [pc, #24]	; (80038a8 <load_serial_ymodem+0xa0>)
 800388e:	f001 fd63 	bl	8005358 <printf>
 8003892:	4625      	mov	r5, r4
 8003894:	e7d8      	b.n	8003848 <load_serial_ymodem+0x40>
 8003896:	bf00      	nop
 8003898:	080038ad 	.word	0x080038ad
 800389c:	0800d408 	.word	0x0800d408
 80038a0:	0800d430 	.word	0x0800d430
 80038a4:	0800ca7c 	.word	0x0800ca7c
 80038a8:	0800fbe0 	.word	0x0800fbe0

080038ac <getcxmodem>:
 80038ac:	b508      	push	{r3, lr}
 80038ae:	f001 fd2f 	bl	8005310 <tstc>
 80038b2:	b118      	cbz	r0, 80038bc <getcxmodem+0x10>
 80038b4:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80038b8:	f001 bd1e 	b.w	80052f8 <getc>
 80038bc:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 80038c0:	bd08      	pop	{r3, pc}
 80038c2:	bf00      	nop

080038c4 <bin_data_char>:
 80038c4:	4b03      	ldr	r3, [pc, #12]	; (80038d4 <bin_data_char+0x10>)
 80038c6:	681a      	ldr	r2, [r3, #0]
 80038c8:	b91a      	cbnz	r2, 80038d2 <bin_data_char+0xe>
 80038ca:	685a      	ldr	r2, [r3, #4]
 80038cc:	1c51      	adds	r1, r2, #1
 80038ce:	7010      	strb	r0, [r2, #0]
 80038d0:	6059      	str	r1, [r3, #4]
 80038d2:	4770      	bx	lr
 80038d4:	200034c4 	.word	0x200034c4

080038d8 <send_pad>:
 80038d8:	b538      	push	{r3, r4, r5, lr}
 80038da:	4d06      	ldr	r5, [pc, #24]	; (80038f4 <send_pad+0x1c>)
 80038dc:	68eb      	ldr	r3, [r5, #12]
 80038de:	2b00      	cmp	r3, #0
 80038e0:	dd07      	ble.n	80038f2 <send_pad+0x1a>
 80038e2:	1e5c      	subs	r4, r3, #1
 80038e4:	3c01      	subs	r4, #1
 80038e6:	f995 0010 	ldrsb.w	r0, [r5, #16]
 80038ea:	f001 fd1d 	bl	8005328 <putc>
 80038ee:	1c63      	adds	r3, r4, #1
 80038f0:	d1f8      	bne.n	80038e4 <send_pad+0xc>
 80038f2:	bd38      	pop	{r3, r4, r5, pc}
 80038f4:	200034c4 	.word	0x200034c4

080038f8 <ktrans>:
 80038f8:	b2c3      	uxtb	r3, r0
 80038fa:	f003 0260 	and.w	r2, r3, #96	; 0x60
 80038fe:	2a40      	cmp	r2, #64	; 0x40
 8003900:	d006      	beq.n	8003910 <ktrans+0x18>
 8003902:	f003 037f 	and.w	r3, r3, #127	; 0x7f
 8003906:	2b3f      	cmp	r3, #63	; 0x3f
 8003908:	bf08      	it	eq
 800390a:	f040 0040 	orreq.w	r0, r0, #64	; 0x40
 800390e:	4770      	bx	lr
 8003910:	f020 0040 	bic.w	r0, r0, #64	; 0x40
 8003914:	4770      	bx	lr
 8003916:	bf00      	nop

08003918 <chk1>:
 8003918:	f990 3000 	ldrsb.w	r3, [r0]
 800391c:	b15b      	cbz	r3, 8003936 <chk1+0x1e>
 800391e:	2200      	movs	r2, #0
 8003920:	441a      	add	r2, r3
 8003922:	f910 3f01 	ldrsb.w	r3, [r0, #1]!
 8003926:	2b00      	cmp	r3, #0
 8003928:	d1fa      	bne.n	8003920 <chk1+0x8>
 800392a:	f3c2 1081 	ubfx	r0, r2, #6, #2
 800392e:	4410      	add	r0, r2
 8003930:	f000 003f 	and.w	r0, r0, #63	; 0x3f
 8003934:	4770      	bx	lr
 8003936:	4618      	mov	r0, r3
 8003938:	4770      	bx	lr
 800393a:	bf00      	nop

0800393c <s1_sendpacket>:
 800393c:	b570      	push	{r4, r5, r6, lr}
 800393e:	4e0d      	ldr	r6, [pc, #52]	; (8003974 <s1_sendpacket+0x38>)
 8003940:	4605      	mov	r5, r0
 8003942:	68f3      	ldr	r3, [r6, #12]
 8003944:	2b00      	cmp	r3, #0
 8003946:	bfc8      	it	gt
 8003948:	f103 34ff 	addgt.w	r4, r3, #4294967295	; 0xffffffff
 800394c:	dd06      	ble.n	800395c <s1_sendpacket+0x20>
 800394e:	3c01      	subs	r4, #1
 8003950:	f996 0010 	ldrsb.w	r0, [r6, #16]
 8003954:	f001 fce8 	bl	8005328 <putc>
 8003958:	1c63      	adds	r3, r4, #1
 800395a:	d1f8      	bne.n	800394e <s1_sendpacket+0x12>
 800395c:	f995 0000 	ldrsb.w	r0, [r5]
 8003960:	b130      	cbz	r0, 8003970 <s1_sendpacket+0x34>
 8003962:	f001 fce1 	bl	8005328 <putc>
 8003966:	f915 0f01 	ldrsb.w	r0, [r5, #1]!
 800396a:	2800      	cmp	r0, #0
 800396c:	d1f9      	bne.n	8003962 <s1_sendpacket+0x26>
 800396e:	bd70      	pop	{r4, r5, r6, pc}
 8003970:	bd70      	pop	{r4, r5, r6, pc}
 8003972:	bf00      	nop
 8003974:	200034c4 	.word	0x200034c4

08003978 <send_ack>:
 8003978:	b5f0      	push	{r4, r5, r6, r7, lr}
 800397a:	2623      	movs	r6, #35	; 0x23
 800397c:	2500      	movs	r5, #0
 800397e:	f04f 0e01 	mov.w	lr, #1
 8003982:	2759      	movs	r7, #89	; 0x59
 8003984:	4c11      	ldr	r4, [pc, #68]	; (80039cc <send_ack+0x54>)
 8003986:	3020      	adds	r0, #32
 8003988:	b243      	sxtb	r3, r0
 800398a:	4631      	mov	r1, r6
 800398c:	462a      	mov	r2, r5
 800398e:	75a3      	strb	r3, [r4, #22]
 8003990:	f884 e014 	strb.w	lr, [r4, #20]
 8003994:	75e7      	strb	r7, [r4, #23]
 8003996:	7566      	strb	r6, [r4, #21]
 8003998:	7625      	strb	r5, [r4, #24]
 800399a:	f104 0017 	add.w	r0, r4, #23
 800399e:	e002      	b.n	80039a6 <send_ack+0x2e>
 80039a0:	4619      	mov	r1, r3
 80039a2:	f910 3b01 	ldrsb.w	r3, [r0], #1
 80039a6:	440a      	add	r2, r1
 80039a8:	2b00      	cmp	r3, #0
 80039aa:	d1f9      	bne.n	80039a0 <send_ack+0x28>
 80039ac:	f3c2 1181 	ubfx	r1, r2, #6, #2
 80039b0:	440a      	add	r2, r1
 80039b2:	f002 023f 	and.w	r2, r2, #63	; 0x3f
 80039b6:	f894 102c 	ldrb.w	r1, [r4, #44]	; 0x2c
 80039ba:	3220      	adds	r2, #32
 80039bc:	76a3      	strb	r3, [r4, #26]
 80039be:	7622      	strb	r2, [r4, #24]
 80039c0:	7661      	strb	r1, [r4, #25]
 80039c2:	4803      	ldr	r0, [pc, #12]	; (80039d0 <send_ack+0x58>)
 80039c4:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
 80039c8:	f7ff bfb8 	b.w	800393c <s1_sendpacket>
 80039cc:	200034c4 	.word	0x200034c4
 80039d0:	200034d8 	.word	0x200034d8

080039d4 <send_nack>:
 80039d4:	b5f0      	push	{r4, r5, r6, r7, lr}
 80039d6:	2623      	movs	r6, #35	; 0x23
 80039d8:	2500      	movs	r5, #0
 80039da:	f04f 0e01 	mov.w	lr, #1
 80039de:	274e      	movs	r7, #78	; 0x4e
 80039e0:	4c11      	ldr	r4, [pc, #68]	; (8003a28 <send_nack+0x54>)
 80039e2:	3020      	adds	r0, #32
 80039e4:	b243      	sxtb	r3, r0
 80039e6:	4631      	mov	r1, r6
 80039e8:	462a      	mov	r2, r5
 80039ea:	75a3      	strb	r3, [r4, #22]
 80039ec:	f884 e014 	strb.w	lr, [r4, #20]
 80039f0:	75e7      	strb	r7, [r4, #23]
 80039f2:	7566      	strb	r6, [r4, #21]
 80039f4:	7625      	strb	r5, [r4, #24]
 80039f6:	f104 0017 	add.w	r0, r4, #23
 80039fa:	e002      	b.n	8003a02 <send_nack+0x2e>
 80039fc:	4619      	mov	r1, r3
 80039fe:	f910 3b01 	ldrsb.w	r3, [r0], #1
 8003a02:	440a      	add	r2, r1
 8003a04:	2b00      	cmp	r3, #0
 8003a06:	d1f9      	bne.n	80039fc <send_nack+0x28>
 8003a08:	f3c2 1181 	ubfx	r1, r2, #6, #2
 8003a0c:	440a      	add	r2, r1
 8003a0e:	f002 023f 	and.w	r2, r2, #63	; 0x3f
 8003a12:	f894 102c 	ldrb.w	r1, [r4, #44]	; 0x2c
 8003a16:	3220      	adds	r2, #32
 8003a18:	76a3      	strb	r3, [r4, #26]
 8003a1a:	7622      	strb	r2, [r4, #24]
 8003a1c:	7661      	strb	r1, [r4, #25]
 8003a1e:	4803      	ldr	r0, [pc, #12]	; (8003a2c <send_nack+0x58>)
 8003a20:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
 8003a24:	f7ff bf8a 	b.w	800393c <s1_sendpacket>
 8003a28:	200034c4 	.word	0x200034c4
 8003a2c:	200034d8 	.word	0x200034d8

08003a30 <k_data_init>:
 8003a30:	2100      	movs	r1, #0
 8003a32:	4b02      	ldr	r3, [pc, #8]	; (8003a3c <k_data_init+0xc>)
 8003a34:	6b5a      	ldr	r2, [r3, #52]	; 0x34
 8003a36:	6319      	str	r1, [r3, #48]	; 0x30
 8003a38:	4710      	bx	r2
 8003a3a:	bf00      	nop
 8003a3c:	200034c4 	.word	0x200034c4

08003a40 <k_data_save>:
 8003a40:	4b03      	ldr	r3, [pc, #12]	; (8003a50 <k_data_save+0x10>)
 8003a42:	6b18      	ldr	r0, [r3, #48]	; 0x30
 8003a44:	e893 0006 	ldmia.w	r3, {r1, r2}
 8003a48:	6398      	str	r0, [r3, #56]	; 0x38
 8003a4a:	63d9      	str	r1, [r3, #60]	; 0x3c
 8003a4c:	641a      	str	r2, [r3, #64]	; 0x40
 8003a4e:	4770      	bx	lr
 8003a50:	200034c4 	.word	0x200034c4

08003a54 <k_data_restore>:
 8003a54:	4b03      	ldr	r3, [pc, #12]	; (8003a64 <k_data_restore+0x10>)
 8003a56:	f103 0038 	add.w	r0, r3, #56	; 0x38
 8003a5a:	c807      	ldmia	r0, {r0, r1, r2}
 8003a5c:	6318      	str	r0, [r3, #48]	; 0x30
 8003a5e:	e883 0006 	stmia.w	r3, {r1, r2}
 8003a62:	4770      	bx	lr
 8003a64:	200034c4 	.word	0x200034c4

08003a68 <k_data_char>:
 8003a68:	b510      	push	{r4, lr}
 8003a6a:	4c11      	ldr	r4, [pc, #68]	; (8003ab0 <k_data_char+0x48>)
 8003a6c:	4603      	mov	r3, r0
 8003a6e:	6b22      	ldr	r2, [r4, #48]	; 0x30
 8003a70:	b182      	cbz	r2, 8003a94 <k_data_char+0x2c>
 8003a72:	b2c2      	uxtb	r2, r0
 8003a74:	f002 0060 	and.w	r0, r2, #96	; 0x60
 8003a78:	2840      	cmp	r0, #64	; 0x40
 8003a7a:	6c61      	ldr	r1, [r4, #68]	; 0x44
 8003a7c:	d015      	beq.n	8003aaa <k_data_char+0x42>
 8003a7e:	f002 027f 	and.w	r2, r2, #127	; 0x7f
 8003a82:	2a3f      	cmp	r2, #63	; 0x3f
 8003a84:	bf08      	it	eq
 8003a86:	f043 0340 	orreq.w	r3, r3, #64	; 0x40
 8003a8a:	4618      	mov	r0, r3
 8003a8c:	4788      	blx	r1
 8003a8e:	2300      	movs	r3, #0
 8003a90:	6323      	str	r3, [r4, #48]	; 0x30
 8003a92:	bd10      	pop	{r4, pc}
 8003a94:	f994 2048 	ldrsb.w	r2, [r4, #72]	; 0x48
 8003a98:	4282      	cmp	r2, r0
 8003a9a:	d003      	beq.n	8003aa4 <k_data_char+0x3c>
 8003a9c:	6c63      	ldr	r3, [r4, #68]	; 0x44
 8003a9e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8003aa2:	4718      	bx	r3
 8003aa4:	2301      	movs	r3, #1
 8003aa6:	6323      	str	r3, [r4, #48]	; 0x30
 8003aa8:	bd10      	pop	{r4, pc}
 8003aaa:	f023 0340 	bic.w	r3, r3, #64	; 0x40
 8003aae:	e7ec      	b.n	8003a8a <k_data_char+0x22>
 8003ab0:	200034c4 	.word	0x200034c4

08003ab4 <handle_send_packet>:
 8003ab4:	b5f0      	push	{r4, r5, r6, r7, lr}
 8003ab6:	2200      	movs	r2, #0
 8003ab8:	260d      	movs	r6, #13
 8003aba:	2523      	movs	r5, #35	; 0x23
 8003abc:	4967      	ldr	r1, [pc, #412]	; (8003c5c <handle_send_packet+0x1a8>)
 8003abe:	6e0b      	ldr	r3, [r1, #96]	; 0x60
 8003ac0:	f101 045f 	add.w	r4, r1, #95	; 0x5f
 8003ac4:	42a3      	cmp	r3, r4
 8003ac6:	f881 602c 	strb.w	r6, [r1, #44]	; 0x2c
 8003aca:	f881 5048 	strb.w	r5, [r1, #72]	; 0x48
 8003ace:	60ca      	str	r2, [r1, #12]
 8003ad0:	740a      	strb	r2, [r1, #16]
 8003ad2:	f000 809a 	beq.w	8003c0a <handle_send_packet+0x156>
 8003ad6:	4a62      	ldr	r2, [pc, #392]	; (8003c60 <handle_send_packet+0x1ac>)
 8003ad8:	1a9b      	subs	r3, r3, r2
 8003ada:	2b00      	cmp	r3, #0
 8003adc:	f340 8083 	ble.w	8003be6 <handle_send_packet+0x132>
 8003ae0:	227e      	movs	r2, #126	; 0x7e
 8003ae2:	2b01      	cmp	r3, #1
 8003ae4:	760a      	strb	r2, [r1, #24]
 8003ae6:	f000 808a 	beq.w	8003bfe <handle_send_packet+0x14a>
 8003aea:	2221      	movs	r2, #33	; 0x21
 8003aec:	2b02      	cmp	r3, #2
 8003aee:	764a      	strb	r2, [r1, #25]
 8003af0:	d12e      	bne.n	8003b50 <handle_send_packet+0x9c>
 8003af2:	2708      	movs	r7, #8
 8003af4:	240d      	movs	r4, #13
 8003af6:	2607      	movs	r6, #7
 8003af8:	2506      	movs	r5, #6
 8003afa:	2325      	movs	r3, #37	; 0x25
 8003afc:	f04f 0c01 	mov.w	ip, #1
 8003b00:	f04f 0e59 	mov.w	lr, #89	; 0x59
 8003b04:	2200      	movs	r2, #0
 8003b06:	754b      	strb	r3, [r1, #21]
 8003b08:	3020      	adds	r0, #32
 8003b0a:	194b      	adds	r3, r1, r5
 8003b0c:	7588      	strb	r0, [r1, #22]
 8003b0e:	f881 c014 	strb.w	ip, [r1, #20]
 8003b12:	f881 e017 	strb.w	lr, [r1, #23]
 8003b16:	751a      	strb	r2, [r3, #20]
 8003b18:	f991 3015 	ldrsb.w	r3, [r1, #21]
 8003b1c:	2b00      	cmp	r3, #0
 8003b1e:	d079      	beq.n	8003c14 <handle_send_packet+0x160>
 8003b20:	4850      	ldr	r0, [pc, #320]	; (8003c64 <handle_send_packet+0x1b0>)
 8003b22:	441a      	add	r2, r3
 8003b24:	f910 3f01 	ldrsb.w	r3, [r0, #1]!
 8003b28:	2b00      	cmp	r3, #0
 8003b2a:	d1fa      	bne.n	8003b22 <handle_send_packet+0x6e>
 8003b2c:	f3c2 1381 	ubfx	r3, r2, #6, #2
 8003b30:	441a      	add	r2, r3
 8003b32:	f002 023f 	and.w	r2, r2, #63	; 0x3f
 8003b36:	3220      	adds	r2, #32
 8003b38:	2300      	movs	r3, #0
 8003b3a:	440d      	add	r5, r1
 8003b3c:	440e      	add	r6, r1
 8003b3e:	4439      	add	r1, r7
 8003b40:	752a      	strb	r2, [r5, #20]
 8003b42:	7534      	strb	r4, [r6, #20]
 8003b44:	750b      	strb	r3, [r1, #20]
 8003b46:	4848      	ldr	r0, [pc, #288]	; (8003c68 <handle_send_packet+0x1b4>)
 8003b48:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
 8003b4c:	f7ff bef6 	b.w	800393c <s1_sendpacket>
 8003b50:	2420      	movs	r4, #32
 8003b52:	f991 204e 	ldrsb.w	r2, [r1, #78]	; 0x4e
 8003b56:	2b03      	cmp	r3, #3
 8003b58:	f1a2 0220 	sub.w	r2, r2, #32
 8003b5c:	b2d2      	uxtb	r2, r2
 8003b5e:	768c      	strb	r4, [r1, #26]
 8003b60:	60ca      	str	r2, [r1, #12]
 8003b62:	d046      	beq.n	8003bf2 <handle_send_packet+0x13e>
 8003b64:	f991 404f 	ldrsb.w	r4, [r1, #79]	; 0x4f
 8003b68:	b2e2      	uxtb	r2, r4
 8003b6a:	f002 0560 	and.w	r5, r2, #96	; 0x60
 8003b6e:	2d40      	cmp	r5, #64	; 0x40
 8003b70:	d05d      	beq.n	8003c2e <handle_send_packet+0x17a>
 8003b72:	f002 027f 	and.w	r2, r2, #127	; 0x7f
 8003b76:	2a3f      	cmp	r2, #63	; 0x3f
 8003b78:	bf08      	it	eq
 8003b7a:	f044 0440 	orreq.w	r4, r4, #64	; 0x40
 8003b7e:	2240      	movs	r2, #64	; 0x40
 8003b80:	2b04      	cmp	r3, #4
 8003b82:	740c      	strb	r4, [r1, #16]
 8003b84:	76ca      	strb	r2, [r1, #27]
 8003b86:	d047      	beq.n	8003c18 <handle_send_packet+0x164>
 8003b88:	222d      	movs	r2, #45	; 0x2d
 8003b8a:	f891 4050 	ldrb.w	r4, [r1, #80]	; 0x50
 8003b8e:	2b05      	cmp	r3, #5
 8003b90:	f1a4 0420 	sub.w	r4, r4, #32
 8003b94:	b264      	sxtb	r4, r4
 8003b96:	770a      	strb	r2, [r1, #28]
 8003b98:	f881 402c 	strb.w	r4, [r1, #44]	; 0x2c
 8003b9c:	d042      	beq.n	8003c24 <handle_send_packet+0x170>
 8003b9e:	2523      	movs	r5, #35	; 0x23
 8003ba0:	f891 2051 	ldrb.w	r2, [r1, #81]	; 0x51
 8003ba4:	2b06      	cmp	r3, #6
 8003ba6:	774d      	strb	r5, [r1, #29]
 8003ba8:	f881 2048 	strb.w	r2, [r1, #72]	; 0x48
 8003bac:	d042      	beq.n	8003c34 <handle_send_packet+0x180>
 8003bae:	224e      	movs	r2, #78	; 0x4e
 8003bb0:	2b07      	cmp	r3, #7
 8003bb2:	778a      	strb	r2, [r1, #30]
 8003bb4:	d043      	beq.n	8003c3e <handle_send_packet+0x18a>
 8003bb6:	2531      	movs	r5, #49	; 0x31
 8003bb8:	2b08      	cmp	r3, #8
 8003bba:	77cd      	strb	r5, [r1, #31]
 8003bbc:	d044      	beq.n	8003c48 <handle_send_packet+0x194>
 8003bbe:	2b09      	cmp	r3, #9
 8003bc0:	f881 2020 	strb.w	r2, [r1, #32]
 8003bc4:	d045      	beq.n	8003c52 <handle_send_packet+0x19e>
 8003bc6:	237e      	movs	r3, #126	; 0x7e
 8003bc8:	2522      	movs	r5, #34	; 0x22
 8003bca:	2220      	movs	r2, #32
 8003bcc:	f881 5021 	strb.w	r5, [r1, #33]	; 0x21
 8003bd0:	f881 3023 	strb.w	r3, [r1, #35]	; 0x23
 8003bd4:	f881 3024 	strb.w	r3, [r1, #36]	; 0x24
 8003bd8:	f881 2022 	strb.w	r2, [r1, #34]	; 0x22
 8003bdc:	2713      	movs	r7, #19
 8003bde:	2612      	movs	r6, #18
 8003be0:	2511      	movs	r5, #17
 8003be2:	2330      	movs	r3, #48	; 0x30
 8003be4:	e78a      	b.n	8003afc <handle_send_packet+0x48>
 8003be6:	2706      	movs	r7, #6
 8003be8:	240d      	movs	r4, #13
 8003bea:	2605      	movs	r6, #5
 8003bec:	2504      	movs	r5, #4
 8003bee:	2323      	movs	r3, #35	; 0x23
 8003bf0:	e784      	b.n	8003afc <handle_send_packet+0x48>
 8003bf2:	2709      	movs	r7, #9
 8003bf4:	240d      	movs	r4, #13
 8003bf6:	2608      	movs	r6, #8
 8003bf8:	2507      	movs	r5, #7
 8003bfa:	2326      	movs	r3, #38	; 0x26
 8003bfc:	e77e      	b.n	8003afc <handle_send_packet+0x48>
 8003bfe:	2707      	movs	r7, #7
 8003c00:	240d      	movs	r4, #13
 8003c02:	2606      	movs	r6, #6
 8003c04:	2505      	movs	r5, #5
 8003c06:	2324      	movs	r3, #36	; 0x24
 8003c08:	e778      	b.n	8003afc <handle_send_packet+0x48>
 8003c0a:	f101 025e 	add.w	r2, r1, #94	; 0x5e
 8003c0e:	4613      	mov	r3, r2
 8003c10:	660a      	str	r2, [r1, #96]	; 0x60
 8003c12:	e760      	b.n	8003ad6 <handle_send_packet+0x22>
 8003c14:	2220      	movs	r2, #32
 8003c16:	e78f      	b.n	8003b38 <handle_send_packet+0x84>
 8003c18:	270a      	movs	r7, #10
 8003c1a:	240d      	movs	r4, #13
 8003c1c:	2609      	movs	r6, #9
 8003c1e:	2508      	movs	r5, #8
 8003c20:	2327      	movs	r3, #39	; 0x27
 8003c22:	e76b      	b.n	8003afc <handle_send_packet+0x48>
 8003c24:	270b      	movs	r7, #11
 8003c26:	260a      	movs	r6, #10
 8003c28:	2509      	movs	r5, #9
 8003c2a:	2328      	movs	r3, #40	; 0x28
 8003c2c:	e766      	b.n	8003afc <handle_send_packet+0x48>
 8003c2e:	f024 0440 	bic.w	r4, r4, #64	; 0x40
 8003c32:	e7a4      	b.n	8003b7e <handle_send_packet+0xca>
 8003c34:	270c      	movs	r7, #12
 8003c36:	260b      	movs	r6, #11
 8003c38:	250a      	movs	r5, #10
 8003c3a:	2329      	movs	r3, #41	; 0x29
 8003c3c:	e75e      	b.n	8003afc <handle_send_packet+0x48>
 8003c3e:	270d      	movs	r7, #13
 8003c40:	260c      	movs	r6, #12
 8003c42:	250b      	movs	r5, #11
 8003c44:	232a      	movs	r3, #42	; 0x2a
 8003c46:	e759      	b.n	8003afc <handle_send_packet+0x48>
 8003c48:	270e      	movs	r7, #14
 8003c4a:	260d      	movs	r6, #13
 8003c4c:	250c      	movs	r5, #12
 8003c4e:	232b      	movs	r3, #43	; 0x2b
 8003c50:	e754      	b.n	8003afc <handle_send_packet+0x48>
 8003c52:	270f      	movs	r7, #15
 8003c54:	260e      	movs	r6, #14
 8003c56:	250d      	movs	r5, #13
 8003c58:	232c      	movs	r3, #44	; 0x2c
 8003c5a:	e74f      	b.n	8003afc <handle_send_packet+0x48>
 8003c5c:	200034c4 	.word	0x200034c4
 8003c60:	20003510 	.word	0x20003510
 8003c64:	200034d9 	.word	0x200034d9
 8003c68:	200034d8 	.word	0x200034d8

08003c6c <do_load_serial_bin>:
 8003c6c:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8003c70:	48c2      	ldr	r0, [pc, #776]	; (8003f7c <do_load_serial_bin+0x310>)
 8003c72:	b08a      	sub	sp, #40	; 0x28
 8003c74:	4617      	mov	r7, r2
 8003c76:	461c      	mov	r4, r3
 8003c78:	f001 f92c 	bl	8004ed4 <getenv>
 8003c7c:	2800      	cmp	r0, #0
 8003c7e:	f000 810e 	beq.w	8003e9e <do_load_serial_bin+0x232>
 8003c82:	2210      	movs	r2, #16
 8003c84:	2100      	movs	r1, #0
 8003c86:	f004 fe27 	bl	80088d8 <simple_strtoul>
 8003c8a:	4605      	mov	r5, r0
 8003c8c:	2f01      	cmp	r7, #1
 8003c8e:	f8d8 6008 	ldr.w	r6, [r8, #8]
 8003c92:	dd08      	ble.n	8003ca6 <do_load_serial_bin+0x3a>
 8003c94:	2210      	movs	r2, #16
 8003c96:	2100      	movs	r1, #0
 8003c98:	6860      	ldr	r0, [r4, #4]
 8003c9a:	f004 fe1d 	bl	80088d8 <simple_strtoul>
 8003c9e:	2f03      	cmp	r7, #3
 8003ca0:	4605      	mov	r5, r0
 8003ca2:	f000 80ff 	beq.w	8003ea4 <do_load_serial_bin+0x238>
 8003ca6:	4637      	mov	r7, r6
 8003ca8:	6820      	ldr	r0, [r4, #0]
 8003caa:	49b5      	ldr	r1, [pc, #724]	; (8003f80 <do_load_serial_bin+0x314>)
 8003cac:	f7fc fbac 	bl	8000408 <strcmp>
 8003cb0:	463a      	mov	r2, r7
 8003cb2:	4604      	mov	r4, r0
 8003cb4:	4629      	mov	r1, r5
 8003cb6:	b9f8      	cbnz	r0, 8003cf8 <do_load_serial_bin+0x8c>
 8003cb8:	48b2      	ldr	r0, [pc, #712]	; (8003f84 <do_load_serial_bin+0x318>)
 8003cba:	f001 fb4d 	bl	8005358 <printf>
 8003cbe:	4628      	mov	r0, r5
 8003cc0:	f7ff fda2 	bl	8003808 <load_serial_ymodem>
 8003cc4:	42be      	cmp	r6, r7
 8003cc6:	d013      	beq.n	8003cf0 <do_load_serial_bin+0x84>
 8003cc8:	4631      	mov	r1, r6
 8003cca:	48af      	ldr	r0, [pc, #700]	; (8003f88 <do_load_serial_bin+0x31c>)
 8003ccc:	f001 fb44 	bl	8005358 <printf>
 8003cd0:	f24c 3050 	movw	r0, #50000	; 0xc350
 8003cd4:	f004 fbd8 	bl	8008488 <udelay>
 8003cd8:	f8c8 6008 	str.w	r6, [r8, #8]
 8003cdc:	f7ff f852 	bl	8002d84 <serial_setbrg>
 8003ce0:	f24c 3050 	movw	r0, #50000	; 0xc350
 8003ce4:	f004 fbd0 	bl	8008488 <udelay>
 8003ce8:	f001 fb06 	bl	80052f8 <getc>
 8003cec:	281b      	cmp	r0, #27
 8003cee:	d1fb      	bne.n	8003ce8 <do_load_serial_bin+0x7c>
 8003cf0:	4620      	mov	r0, r4
 8003cf2:	b00a      	add	sp, #40	; 0x28
 8003cf4:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8003cf8:	48a4      	ldr	r0, [pc, #656]	; (8003f8c <do_load_serial_bin+0x320>)
 8003cfa:	f001 fb2d 	bl	8005358 <printf>
 8003cfe:	2400      	movs	r4, #0
 8003d00:	2223      	movs	r2, #35	; 0x23
 8003d02:	f04f 0e0d 	mov.w	lr, #13
 8003d06:	f04f 39ff 	mov.w	r9, #4294967295	; 0xffffffff
 8003d0a:	f8df a2b0 	ldr.w	sl, [pc, #688]	; 8003fbc <do_load_serial_bin+0x350>
 8003d0e:	49a0      	ldr	r1, [pc, #640]	; (8003f90 <do_load_serial_bin+0x324>)
 8003d10:	48a0      	ldr	r0, [pc, #640]	; (8003f94 <do_load_serial_bin+0x328>)
 8003d12:	f8ca 1044 	str.w	r1, [sl, #68]	; 0x44
 8003d16:	f88a 2048 	strb.w	r2, [sl, #72]	; 0x48
 8003d1a:	f88a e02c 	strb.w	lr, [sl, #44]	; 0x2c
 8003d1e:	f8ca 5008 	str.w	r5, [sl, #8]
 8003d22:	f8ca 0034 	str.w	r0, [sl, #52]	; 0x34
 8003d26:	f8ca 400c 	str.w	r4, [sl, #12]
 8003d2a:	f88a 4010 	strb.w	r4, [sl, #16]
 8003d2e:	f8ca 4030 	str.w	r4, [sl, #48]	; 0x30
 8003d32:	f7ff fd61 	bl	80037f8 <bin_data_init>
 8003d36:	e89a 0006 	ldmia.w	sl, {r1, r2}
 8003d3a:	f8ca 4038 	str.w	r4, [sl, #56]	; 0x38
 8003d3e:	f8ca 103c 	str.w	r1, [sl, #60]	; 0x3c
 8003d42:	f8ca 2040 	str.w	r2, [sl, #64]	; 0x40
 8003d46:	4b94      	ldr	r3, [pc, #592]	; (8003f98 <do_load_serial_bin+0x32c>)
 8003d48:	f8ca 3060 	str.w	r3, [sl, #96]	; 0x60
 8003d4c:	f001 fad4 	bl	80052f8 <getc>
 8003d50:	2801      	cmp	r0, #1
 8003d52:	d034      	beq.n	8003dbe <do_load_serial_bin+0x152>
 8003d54:	2803      	cmp	r0, #3
 8003d56:	d1f9      	bne.n	8003d4c <do_load_serial_bin+0xe0>
 8003d58:	f04f 0a00 	mov.w	sl, #0
 8003d5c:	46d1      	mov	r9, sl
 8003d5e:	2464      	movs	r4, #100	; 0x64
 8003d60:	e005      	b.n	8003d6e <do_load_serial_bin+0x102>
 8003d62:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8003d66:	f004 fb8f 	bl	8008488 <udelay>
 8003d6a:	3c01      	subs	r4, #1
 8003d6c:	d00b      	beq.n	8003d86 <do_load_serial_bin+0x11a>
 8003d6e:	f001 facf 	bl	8005310 <tstc>
 8003d72:	2800      	cmp	r0, #0
 8003d74:	d0f5      	beq.n	8003d62 <do_load_serial_bin+0xf6>
 8003d76:	f001 fabf 	bl	80052f8 <getc>
 8003d7a:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8003d7e:	f004 fb83 	bl	8008488 <udelay>
 8003d82:	3c01      	subs	r4, #1
 8003d84:	d1f3      	bne.n	8003d6e <do_load_serial_bin+0x102>
 8003d86:	4651      	mov	r1, sl
 8003d88:	4628      	mov	r0, r5
 8003d8a:	f007 fbd3 	bl	800b534 <flush_cache>
 8003d8e:	464a      	mov	r2, r9
 8003d90:	4649      	mov	r1, r9
 8003d92:	4882      	ldr	r0, [pc, #520]	; (8003f9c <do_load_serial_bin+0x330>)
 8003d94:	f001 fae0 	bl	8005358 <printf>
 8003d98:	464a      	mov	r2, r9
 8003d9a:	4981      	ldr	r1, [pc, #516]	; (8003fa0 <do_load_serial_bin+0x334>)
 8003d9c:	a802      	add	r0, sp, #8
 8003d9e:	f005 fa91 	bl	80092c4 <sprintf>
 8003da2:	a902      	add	r1, sp, #8
 8003da4:	487f      	ldr	r0, [pc, #508]	; (8003fa4 <do_load_serial_bin+0x338>)
 8003da6:	f001 f867 	bl	8004e78 <setenv>
 8003daa:	1c6b      	adds	r3, r5, #1
 8003dac:	f000 809b 	beq.w	8003ee6 <do_load_serial_bin+0x27a>
 8003db0:	4629      	mov	r1, r5
 8003db2:	487d      	ldr	r0, [pc, #500]	; (8003fa8 <do_load_serial_bin+0x33c>)
 8003db4:	f001 fad0 	bl	8005358 <printf>
 8003db8:	4b7c      	ldr	r3, [pc, #496]	; (8003fac <do_load_serial_bin+0x340>)
 8003dba:	601d      	str	r5, [r3, #0]
 8003dbc:	e782      	b.n	8003cc4 <do_load_serial_bin+0x58>
 8003dbe:	f001 fa9b 	bl	80052f8 <getc>
 8003dc2:	b242      	sxtb	r2, r0
 8003dc4:	f012 0fe0 	tst.w	r2, #224	; 0xe0
 8003dc8:	9200      	str	r2, [sp, #0]
 8003dca:	d058      	beq.n	8003e7e <do_load_serial_bin+0x212>
 8003dcc:	f001 fa94 	bl	80052f8 <getc>
 8003dd0:	b241      	sxtb	r1, r0
 8003dd2:	f011 0fe0 	tst.w	r1, #224	; 0xe0
 8003dd6:	d052      	beq.n	8003e7e <do_load_serial_bin+0x212>
 8003dd8:	f1a1 0420 	sub.w	r4, r1, #32
 8003ddc:	b2e4      	uxtb	r4, r4
 8003dde:	454c      	cmp	r4, r9
 8003de0:	9a00      	ldr	r2, [sp, #0]
 8003de2:	f000 80be 	beq.w	8003f62 <do_load_serial_bin+0x2f6>
 8003de6:	f8da 0030 	ldr.w	r0, [sl, #48]	; 0x30
 8003dea:	f8da 3000 	ldr.w	r3, [sl]
 8003dee:	f8ca 0038 	str.w	r0, [sl, #56]	; 0x38
 8003df2:	f8da 0004 	ldr.w	r0, [sl, #4]
 8003df6:	f8ca 303c 	str.w	r3, [sl, #60]	; 0x3c
 8003dfa:	f8ca 0040 	str.w	r0, [sl, #64]	; 0x40
 8003dfe:	9101      	str	r1, [sp, #4]
 8003e00:	9200      	str	r2, [sp, #0]
 8003e02:	f001 fa79 	bl	80052f8 <getc>
 8003e06:	fa4f fb80 	sxtb.w	fp, r0
 8003e0a:	f01b 0fe0 	tst.w	fp, #224	; 0xe0
 8003e0e:	d035      	beq.n	8003e7c <do_load_serial_bin+0x210>
 8003e10:	9a00      	ldr	r2, [sp, #0]
 8003e12:	9901      	ldr	r1, [sp, #4]
 8003e14:	b2d0      	uxtb	r0, r2
 8003e16:	b2c9      	uxtb	r1, r1
 8003e18:	3a20      	subs	r2, #32
 8003e1a:	4408      	add	r0, r1
 8003e1c:	fa5f f98b 	uxtb.w	r9, fp
 8003e20:	b2d1      	uxtb	r1, r2
 8003e22:	4481      	add	r9, r0
 8003e24:	1e8a      	subs	r2, r1, #2
 8003e26:	2900      	cmp	r1, #0
 8003e28:	d064      	beq.n	8003ef4 <do_load_serial_bin+0x288>
 8003e2a:	2a01      	cmp	r2, #1
 8003e2c:	dc03      	bgt.n	8003e36 <do_load_serial_bin+0x1ca>
 8003e2e:	e0c7      	b.n	8003fc0 <do_load_serial_bin+0x354>
 8003e30:	2a01      	cmp	r2, #1
 8003e32:	f000 80c5 	beq.w	8003fc0 <do_load_serial_bin+0x354>
 8003e36:	9200      	str	r2, [sp, #0]
 8003e38:	f001 fa5e 	bl	80052f8 <getc>
 8003e3c:	9a00      	ldr	r2, [sp, #0]
 8003e3e:	b240      	sxtb	r0, r0
 8003e40:	b2c1      	uxtb	r1, r0
 8003e42:	f010 0fe0 	tst.w	r0, #224	; 0xe0
 8003e46:	4489      	add	r9, r1
 8003e48:	f102 32ff 	add.w	r2, r2, #4294967295	; 0xffffffff
 8003e4c:	d016      	beq.n	8003e7c <do_load_serial_bin+0x210>
 8003e4e:	f1bb 0f44 	cmp.w	fp, #68	; 0x44
 8003e52:	f000 8081 	beq.w	8003f58 <do_load_serial_bin+0x2ec>
 8003e56:	f1bb 0f53 	cmp.w	fp, #83	; 0x53
 8003e5a:	d1e9      	bne.n	8003e30 <do_load_serial_bin+0x1c4>
 8003e5c:	f8da 1060 	ldr.w	r1, [sl, #96]	; 0x60
 8003e60:	1c4b      	adds	r3, r1, #1
 8003e62:	f8ca 3060 	str.w	r3, [sl, #96]	; 0x60
 8003e66:	7008      	strb	r0, [r1, #0]
 8003e68:	f8da 1060 	ldr.w	r1, [sl, #96]	; 0x60
 8003e6c:	4b50      	ldr	r3, [pc, #320]	; (8003fb0 <do_load_serial_bin+0x344>)
 8003e6e:	4299      	cmp	r1, r3
 8003e70:	bf24      	itt	cs
 8003e72:	f101 31ff 	addcs.w	r1, r1, #4294967295	; 0xffffffff
 8003e76:	f8ca 1060 	strcs.w	r1, [sl, #96]	; 0x60
 8003e7a:	e7d9      	b.n	8003e30 <do_load_serial_bin+0x1c4>
 8003e7c:	46a1      	mov	r9, r4
 8003e7e:	f8da 2038 	ldr.w	r2, [sl, #56]	; 0x38
 8003e82:	f8da 103c 	ldr.w	r1, [sl, #60]	; 0x3c
 8003e86:	f8ca 2030 	str.w	r2, [sl, #48]	; 0x30
 8003e8a:	f8da 2040 	ldr.w	r2, [sl, #64]	; 0x40
 8003e8e:	4620      	mov	r0, r4
 8003e90:	f8ca 1000 	str.w	r1, [sl]
 8003e94:	f8ca 2004 	str.w	r2, [sl, #4]
 8003e98:	f7ff fd9c 	bl	80039d4 <send_nack>
 8003e9c:	e753      	b.n	8003d46 <do_load_serial_bin+0xda>
 8003e9e:	f04f 45c0 	mov.w	r5, #1610612736	; 0x60000000
 8003ea2:	e6f3      	b.n	8003c8c <do_load_serial_bin+0x20>
 8003ea4:	220a      	movs	r2, #10
 8003ea6:	2100      	movs	r1, #0
 8003ea8:	68a0      	ldr	r0, [r4, #8]
 8003eaa:	f004 fd15 	bl	80088d8 <simple_strtoul>
 8003eae:	4607      	mov	r7, r0
 8003eb0:	2800      	cmp	r0, #0
 8003eb2:	f43f aef8 	beq.w	8003ca6 <do_load_serial_bin+0x3a>
 8003eb6:	4286      	cmp	r6, r0
 8003eb8:	f43f aef6 	beq.w	8003ca8 <do_load_serial_bin+0x3c>
 8003ebc:	4601      	mov	r1, r0
 8003ebe:	483d      	ldr	r0, [pc, #244]	; (8003fb4 <do_load_serial_bin+0x348>)
 8003ec0:	f001 fa4a 	bl	8005358 <printf>
 8003ec4:	f24c 3050 	movw	r0, #50000	; 0xc350
 8003ec8:	f004 fade 	bl	8008488 <udelay>
 8003ecc:	f8c8 7008 	str.w	r7, [r8, #8]
 8003ed0:	f7fe ff58 	bl	8002d84 <serial_setbrg>
 8003ed4:	f24c 3050 	movw	r0, #50000	; 0xc350
 8003ed8:	f004 fad6 	bl	8008488 <udelay>
 8003edc:	f001 fa0c 	bl	80052f8 <getc>
 8003ee0:	280d      	cmp	r0, #13
 8003ee2:	d1fb      	bne.n	8003edc <do_load_serial_bin+0x270>
 8003ee4:	e6e0      	b.n	8003ca8 <do_load_serial_bin+0x3c>
 8003ee6:	4b31      	ldr	r3, [pc, #196]	; (8003fac <do_load_serial_bin+0x340>)
 8003ee8:	4833      	ldr	r0, [pc, #204]	; (8003fb8 <do_load_serial_bin+0x34c>)
 8003eea:	601c      	str	r4, [r3, #0]
 8003eec:	2401      	movs	r4, #1
 8003eee:	f001 fa33 	bl	8005358 <printf>
 8003ef2:	e6e7      	b.n	8003cc4 <do_load_serial_bin+0x58>
 8003ef4:	f001 fa00 	bl	80052f8 <getc>
 8003ef8:	b240      	sxtb	r0, r0
 8003efa:	f010 0fe0 	tst.w	r0, #224	; 0xe0
 8003efe:	d0bd      	beq.n	8003e7c <do_load_serial_bin+0x210>
 8003f00:	b2c1      	uxtb	r1, r0
 8003f02:	4449      	add	r1, r9
 8003f04:	3820      	subs	r0, #32
 8003f06:	9100      	str	r1, [sp, #0]
 8003f08:	fa5f f980 	uxtb.w	r9, r0
 8003f0c:	f001 f9f4 	bl	80052f8 <getc>
 8003f10:	b240      	sxtb	r0, r0
 8003f12:	f010 0fe0 	tst.w	r0, #224	; 0xe0
 8003f16:	9900      	ldr	r1, [sp, #0]
 8003f18:	d0b0      	beq.n	8003e7c <do_load_serial_bin+0x210>
 8003f1a:	f1a0 0e20 	sub.w	lr, r0, #32
 8003f1e:	eb09 0249 	add.w	r2, r9, r9, lsl #1
 8003f22:	fa5f fe8e 	uxtb.w	lr, lr
 8003f26:	ebc9 1242 	rsb	r2, r9, r2, lsl #5
 8003f2a:	b2c0      	uxtb	r0, r0
 8003f2c:	4472      	add	r2, lr
 8003f2e:	eb00 0901 	add.w	r9, r0, r1
 8003f32:	9200      	str	r2, [sp, #0]
 8003f34:	f001 f9e0 	bl	80052f8 <getc>
 8003f38:	b240      	sxtb	r0, r0
 8003f3a:	f010 0fe0 	tst.w	r0, #224	; 0xe0
 8003f3e:	d09d      	beq.n	8003e7c <do_load_serial_bin+0x210>
 8003f40:	f3c9 1181 	ubfx	r1, r9, #6, #2
 8003f44:	4449      	add	r1, r9
 8003f46:	f001 013f 	and.w	r1, r1, #63	; 0x3f
 8003f4a:	3120      	adds	r1, #32
 8003f4c:	4288      	cmp	r0, r1
 8003f4e:	9a00      	ldr	r2, [sp, #0]
 8003f50:	d194      	bne.n	8003e7c <do_load_serial_bin+0x210>
 8003f52:	b2c0      	uxtb	r0, r0
 8003f54:	4481      	add	r9, r0
 8003f56:	e768      	b.n	8003e2a <do_load_serial_bin+0x1be>
 8003f58:	9200      	str	r2, [sp, #0]
 8003f5a:	f7ff fd85 	bl	8003a68 <k_data_char>
 8003f5e:	9a00      	ldr	r2, [sp, #0]
 8003f60:	e766      	b.n	8003e30 <do_load_serial_bin+0x1c4>
 8003f62:	f8da 0038 	ldr.w	r0, [sl, #56]	; 0x38
 8003f66:	f8da 303c 	ldr.w	r3, [sl, #60]	; 0x3c
 8003f6a:	f8ca 0030 	str.w	r0, [sl, #48]	; 0x30
 8003f6e:	f8da 0040 	ldr.w	r0, [sl, #64]	; 0x40
 8003f72:	f8ca 3000 	str.w	r3, [sl]
 8003f76:	f8ca 0004 	str.w	r0, [sl, #4]
 8003f7a:	e740      	b.n	8003dfe <do_load_serial_bin+0x192>
 8003f7c:	0800c468 	.word	0x0800c468
 8003f80:	0800d468 	.word	0x0800d468
 8003f84:	0800d470 	.word	0x0800d470
 8003f88:	0800d538 	.word	0x0800d538
 8003f8c:	0800d4b0 	.word	0x0800d4b0
 8003f90:	080038c5 	.word	0x080038c5
 8003f94:	080037f9 	.word	0x080037f9
 8003f98:	20003510 	.word	0x20003510
 8003f9c:	0800d408 	.word	0x0800d408
 8003fa0:	0800d430 	.word	0x0800d430
 8003fa4:	0800ca7c 	.word	0x0800ca7c
 8003fa8:	0800d518 	.word	0x0800d518
 8003fac:	20000058 	.word	0x20000058
 8003fb0:	20003524 	.word	0x20003524
 8003fb4:	0800d434 	.word	0x0800d434
 8003fb8:	0800d4f0 	.word	0x0800d4f0
 8003fbc:	200034c4 	.word	0x200034c4
 8003fc0:	f001 f99a 	bl	80052f8 <getc>
 8003fc4:	b240      	sxtb	r0, r0
 8003fc6:	f010 0fe0 	tst.w	r0, #224	; 0xe0
 8003fca:	f43f af57 	beq.w	8003e7c <do_load_serial_bin+0x210>
 8003fce:	f3c9 1281 	ubfx	r2, r9, #6, #2
 8003fd2:	444a      	add	r2, r9
 8003fd4:	f002 023f 	and.w	r2, r2, #63	; 0x3f
 8003fd8:	3220      	adds	r2, #32
 8003fda:	4290      	cmp	r0, r2
 8003fdc:	f47f af4e 	bne.w	8003e7c <do_load_serial_bin+0x210>
 8003fe0:	f001 f98a 	bl	80052f8 <getc>
 8003fe4:	b240      	sxtb	r0, r0
 8003fe6:	280d      	cmp	r0, #13
 8003fe8:	f47f af48 	bne.w	8003e7c <do_load_serial_bin+0x210>
 8003fec:	f1bb 0f53 	cmp.w	fp, #83	; 0x53
 8003ff0:	4620      	mov	r0, r4
 8003ff2:	d006      	beq.n	8004002 <do_load_serial_bin+0x396>
 8003ff4:	f7ff fcc0 	bl	8003978 <send_ack>
 8003ff8:	f1bb 0f42 	cmp.w	fp, #66	; 0x42
 8003ffc:	d005      	beq.n	800400a <do_load_serial_bin+0x39e>
 8003ffe:	46a1      	mov	r9, r4
 8004000:	e6a1      	b.n	8003d46 <do_load_serial_bin+0xda>
 8004002:	f7ff fd57 	bl	8003ab4 <handle_send_packet>
 8004006:	46a1      	mov	r9, r4
 8004008:	e69d      	b.n	8003d46 <do_load_serial_bin+0xda>
 800400a:	f8da 2004 	ldr.w	r2, [sl, #4]
 800400e:	f8da 3008 	ldr.w	r3, [sl, #8]
 8004012:	eba2 0a03 	sub.w	sl, r2, r3
 8004016:	46d1      	mov	r9, sl
 8004018:	e6a1      	b.n	8003d5e <do_load_serial_bin+0xf2>
 800401a:	bf00      	nop

0800401c <do_mem_loop>:
 800401c:	2a02      	cmp	r2, #2
 800401e:	b570      	push	{r4, r5, r6, lr}
 8004020:	dd47      	ble.n	80040b2 <do_mem_loop+0x96>
 8004022:	2104      	movs	r1, #4
 8004024:	6818      	ldr	r0, [r3, #0]
 8004026:	461e      	mov	r6, r3
 8004028:	f001 f8b8 	bl	800519c <cmd_get_data_size>
 800402c:	1e05      	subs	r5, r0, #0
 800402e:	db42      	blt.n	80040b6 <do_mem_loop+0x9a>
 8004030:	2210      	movs	r2, #16
 8004032:	2100      	movs	r1, #0
 8004034:	6870      	ldr	r0, [r6, #4]
 8004036:	f004 fc4f 	bl	80088d8 <simple_strtoul>
 800403a:	2210      	movs	r2, #16
 800403c:	4604      	mov	r4, r0
 800403e:	2100      	movs	r1, #0
 8004040:	68b0      	ldr	r0, [r6, #8]
 8004042:	f004 fc49 	bl	80088d8 <simple_strtoul>
 8004046:	2801      	cmp	r0, #1
 8004048:	d027      	beq.n	800409a <do_mem_loop+0x7e>
 800404a:	2d04      	cmp	r5, #4
 800404c:	d018      	beq.n	8004080 <do_mem_loop+0x64>
 800404e:	2d02      	cmp	r5, #2
 8004050:	d009      	beq.n	8004066 <do_mem_loop+0x4a>
 8004052:	1822      	adds	r2, r4, r0
 8004054:	b130      	cbz	r0, 8004064 <do_mem_loop+0x48>
 8004056:	4623      	mov	r3, r4
 8004058:	7819      	ldrb	r1, [r3, #0]
 800405a:	3301      	adds	r3, #1
 800405c:	4293      	cmp	r3, r2
 800405e:	d1fb      	bne.n	8004058 <do_mem_loop+0x3c>
 8004060:	2800      	cmp	r0, #0
 8004062:	d1f8      	bne.n	8004056 <do_mem_loop+0x3a>
 8004064:	e7fe      	b.n	8004064 <do_mem_loop+0x48>
 8004066:	1e45      	subs	r5, r0, #1
 8004068:	b148      	cbz	r0, 800407e <do_mem_loop+0x62>
 800406a:	462a      	mov	r2, r5
 800406c:	4623      	mov	r3, r4
 800406e:	3a01      	subs	r2, #1
 8004070:	8819      	ldrh	r1, [r3, #0]
 8004072:	1c51      	adds	r1, r2, #1
 8004074:	f103 0302 	add.w	r3, r3, #2
 8004078:	d1f9      	bne.n	800406e <do_mem_loop+0x52>
 800407a:	2800      	cmp	r0, #0
 800407c:	d1f5      	bne.n	800406a <do_mem_loop+0x4e>
 800407e:	e7fe      	b.n	800407e <do_mem_loop+0x62>
 8004080:	1e45      	subs	r5, r0, #1
 8004082:	b148      	cbz	r0, 8004098 <do_mem_loop+0x7c>
 8004084:	462a      	mov	r2, r5
 8004086:	4623      	mov	r3, r4
 8004088:	3a01      	subs	r2, #1
 800408a:	1c56      	adds	r6, r2, #1
 800408c:	6819      	ldr	r1, [r3, #0]
 800408e:	f103 0304 	add.w	r3, r3, #4
 8004092:	d1f9      	bne.n	8004088 <do_mem_loop+0x6c>
 8004094:	2800      	cmp	r0, #0
 8004096:	d1f5      	bne.n	8004084 <do_mem_loop+0x68>
 8004098:	e7fe      	b.n	8004098 <do_mem_loop+0x7c>
 800409a:	2d04      	cmp	r5, #4
 800409c:	d003      	beq.n	80040a6 <do_mem_loop+0x8a>
 800409e:	2d02      	cmp	r5, #2
 80040a0:	d004      	beq.n	80040ac <do_mem_loop+0x90>
 80040a2:	7823      	ldrb	r3, [r4, #0]
 80040a4:	e7fd      	b.n	80040a2 <do_mem_loop+0x86>
 80040a6:	6823      	ldr	r3, [r4, #0]
 80040a8:	6823      	ldr	r3, [r4, #0]
 80040aa:	e7fc      	b.n	80040a6 <do_mem_loop+0x8a>
 80040ac:	8823      	ldrh	r3, [r4, #0]
 80040ae:	8823      	ldrh	r3, [r4, #0]
 80040b0:	e7fc      	b.n	80040ac <do_mem_loop+0x90>
 80040b2:	f001 f867 	bl	8005184 <cmd_usage>
 80040b6:	2001      	movs	r0, #1
 80040b8:	bd70      	pop	{r4, r5, r6, pc}
 80040ba:	bf00      	nop

080040bc <do_mem_md>:
 80040bc:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 80040c0:	f8df 908c 	ldr.w	r9, [pc, #140]	; 8004150 <do_mem_md+0x94>
 80040c4:	2a01      	cmp	r2, #1
 80040c6:	b084      	sub	sp, #16
 80040c8:	f8d9 7000 	ldr.w	r7, [r9]
 80040cc:	dd39      	ble.n	8004142 <do_mem_md+0x86>
 80040ce:	f011 0b01 	ands.w	fp, r1, #1
 80040d2:	d016      	beq.n	8004102 <do_mem_md+0x46>
 80040d4:	4e1d      	ldr	r6, [pc, #116]	; (800414c <do_mem_md+0x90>)
 80040d6:	e896 0030 	ldmia.w	r6, {r4, r5}
 80040da:	2210      	movs	r2, #16
 80040dc:	fb92 f2f5 	sdiv	r2, r2, r5
 80040e0:	4621      	mov	r1, r4
 80040e2:	9200      	str	r2, [sp, #0]
 80040e4:	4620      	mov	r0, r4
 80040e6:	463b      	mov	r3, r7
 80040e8:	462a      	mov	r2, r5
 80040ea:	f003 fea9 	bl	8007e40 <print_buffer>
 80040ee:	2000      	movs	r0, #0
 80040f0:	fb05 4407 	mla	r4, r5, r7, r4
 80040f4:	e886 0030 	stmia.w	r6, {r4, r5}
 80040f8:	f8c9 7000 	str.w	r7, [r9]
 80040fc:	b004      	add	sp, #16
 80040fe:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8004102:	2104      	movs	r1, #4
 8004104:	6818      	ldr	r0, [r3, #0]
 8004106:	4692      	mov	sl, r2
 8004108:	9303      	str	r3, [sp, #12]
 800410a:	f001 f847 	bl	800519c <cmd_get_data_size>
 800410e:	1e05      	subs	r5, r0, #0
 8004110:	db13      	blt.n	800413a <do_mem_md+0x7e>
 8004112:	9b03      	ldr	r3, [sp, #12]
 8004114:	2210      	movs	r2, #16
 8004116:	6858      	ldr	r0, [r3, #4]
 8004118:	4659      	mov	r1, fp
 800411a:	f004 fbdd 	bl	80088d8 <simple_strtoul>
 800411e:	4e0b      	ldr	r6, [pc, #44]	; (800414c <do_mem_md+0x90>)
 8004120:	f1ba 0f02 	cmp.w	sl, #2
 8004124:	68b4      	ldr	r4, [r6, #8]
 8004126:	9b03      	ldr	r3, [sp, #12]
 8004128:	4404      	add	r4, r0
 800412a:	d0d6      	beq.n	80040da <do_mem_md+0x1e>
 800412c:	4659      	mov	r1, fp
 800412e:	6898      	ldr	r0, [r3, #8]
 8004130:	2210      	movs	r2, #16
 8004132:	f004 fbd1 	bl	80088d8 <simple_strtoul>
 8004136:	4607      	mov	r7, r0
 8004138:	e7cf      	b.n	80040da <do_mem_md+0x1e>
 800413a:	2001      	movs	r0, #1
 800413c:	b004      	add	sp, #16
 800413e:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8004142:	f001 f81f 	bl	8005184 <cmd_usage>
 8004146:	2001      	movs	r0, #1
 8004148:	e7d8      	b.n	80040fc <do_mem_md+0x40>
 800414a:	bf00      	nop
 800414c:	20003528 	.word	0x20003528
 8004150:	200000e8 	.word	0x200000e8

08004154 <do_mem_base>:
 8004154:	2a01      	cmp	r2, #1
 8004156:	b508      	push	{r3, lr}
 8004158:	dd0c      	ble.n	8004174 <do_mem_base+0x20>
 800415a:	2210      	movs	r2, #16
 800415c:	6858      	ldr	r0, [r3, #4]
 800415e:	2100      	movs	r1, #0
 8004160:	f004 fbba 	bl	80088d8 <simple_strtoul>
 8004164:	4b07      	ldr	r3, [pc, #28]	; (8004184 <do_mem_base+0x30>)
 8004166:	4601      	mov	r1, r0
 8004168:	6098      	str	r0, [r3, #8]
 800416a:	4807      	ldr	r0, [pc, #28]	; (8004188 <do_mem_base+0x34>)
 800416c:	f001 f8f4 	bl	8005358 <printf>
 8004170:	2000      	movs	r0, #0
 8004172:	bd08      	pop	{r3, pc}
 8004174:	4b03      	ldr	r3, [pc, #12]	; (8004184 <do_mem_base+0x30>)
 8004176:	4804      	ldr	r0, [pc, #16]	; (8004188 <do_mem_base+0x34>)
 8004178:	6899      	ldr	r1, [r3, #8]
 800417a:	f001 f8ed 	bl	8005358 <printf>
 800417e:	2000      	movs	r0, #0
 8004180:	bd08      	pop	{r3, pc}
 8004182:	bf00      	nop
 8004184:	20003528 	.word	0x20003528
 8004188:	0800d5d0 	.word	0x0800d5d0

0800418c <do_mem_mtest>:
 800418c:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8004190:	2a01      	cmp	r2, #1
 8004192:	b084      	sub	sp, #16
 8004194:	dd6d      	ble.n	8004272 <do_mem_mtest+0xe6>
 8004196:	4614      	mov	r4, r2
 8004198:	2100      	movs	r1, #0
 800419a:	2210      	movs	r2, #16
 800419c:	6858      	ldr	r0, [r3, #4]
 800419e:	461d      	mov	r5, r3
 80041a0:	f004 fb9a 	bl	80088d8 <simple_strtoul>
 80041a4:	2c02      	cmp	r4, #2
 80041a6:	9002      	str	r0, [sp, #8]
 80041a8:	d055      	beq.n	8004256 <do_mem_mtest+0xca>
 80041aa:	2210      	movs	r2, #16
 80041ac:	2100      	movs	r1, #0
 80041ae:	68a8      	ldr	r0, [r5, #8]
 80041b0:	f004 fb92 	bl	80088d8 <simple_strtoul>
 80041b4:	2c03      	cmp	r4, #3
 80041b6:	4607      	mov	r7, r0
 80041b8:	d076      	beq.n	80042a8 <do_mem_mtest+0x11c>
 80041ba:	2210      	movs	r2, #16
 80041bc:	2100      	movs	r1, #0
 80041be:	68e8      	ldr	r0, [r5, #12]
 80041c0:	f004 fb8a 	bl	80088d8 <simple_strtoul>
 80041c4:	2c04      	cmp	r4, #4
 80041c6:	4683      	mov	fp, r0
 80041c8:	d06b      	beq.n	80042a2 <do_mem_mtest+0x116>
 80041ca:	6928      	ldr	r0, [r5, #16]
 80041cc:	2210      	movs	r2, #16
 80041ce:	2100      	movs	r1, #0
 80041d0:	f004 fb82 	bl	80088d8 <simple_strtoul>
 80041d4:	9003      	str	r0, [sp, #12]
 80041d6:	2601      	movs	r6, #1
 80041d8:	f04f 0900 	mov.w	r9, #0
 80041dc:	f8df a0e4 	ldr.w	sl, [pc, #228]	; 80042c4 <do_mem_mtest+0x138>
 80041e0:	9601      	str	r6, [sp, #4]
 80041e2:	f001 f8db 	bl	800539c <ctrlc>
 80041e6:	2800      	cmp	r0, #0
 80041e8:	d13c      	bne.n	8004264 <do_mem_mtest+0xd8>
 80041ea:	9b03      	ldr	r3, [sp, #12]
 80041ec:	b113      	cbz	r3, 80041f4 <do_mem_mtest+0x68>
 80041ee:	9a01      	ldr	r2, [sp, #4]
 80041f0:	429a      	cmp	r2, r3
 80041f2:	dc4c      	bgt.n	800428e <do_mem_mtest+0x102>
 80041f4:	4a2f      	ldr	r2, [pc, #188]	; (80042b4 <do_mem_mtest+0x128>)
 80041f6:	4659      	mov	r1, fp
 80041f8:	482f      	ldr	r0, [pc, #188]	; (80042b8 <do_mem_mtest+0x12c>)
 80041fa:	f001 f8ad 	bl	8005358 <printf>
 80041fe:	9b02      	ldr	r3, [sp, #8]
 8004200:	42bb      	cmp	r3, r7
 8004202:	d240      	bcs.n	8004286 <do_mem_mtest+0xfa>
 8004204:	465a      	mov	r2, fp
 8004206:	f843 2b04 	str.w	r2, [r3], #4
 800420a:	42bb      	cmp	r3, r7
 800420c:	4432      	add	r2, r6
 800420e:	d3fa      	bcc.n	8004206 <do_mem_mtest+0x7a>
 8004210:	465d      	mov	r5, fp
 8004212:	482a      	ldr	r0, [pc, #168]	; (80042bc <do_mem_mtest+0x130>)
 8004214:	f001 f894 	bl	8005340 <puts>
 8004218:	9c02      	ldr	r4, [sp, #8]
 800421a:	6822      	ldr	r2, [r4, #0]
 800421c:	42aa      	cmp	r2, r5
 800421e:	d009      	beq.n	8004234 <do_mem_mtest+0xa8>
 8004220:	462b      	mov	r3, r5
 8004222:	4621      	mov	r1, r4
 8004224:	4650      	mov	r0, sl
 8004226:	f109 0901 	add.w	r9, r9, #1
 800422a:	f001 f895 	bl	8005358 <printf>
 800422e:	f001 f8b5 	bl	800539c <ctrlc>
 8004232:	b9b8      	cbnz	r0, 8004264 <do_mem_mtest+0xd8>
 8004234:	3404      	adds	r4, #4
 8004236:	42bc      	cmp	r4, r7
 8004238:	4435      	add	r5, r6
 800423a:	d3ee      	bcc.n	800421a <do_mem_mtest+0x8e>
 800423c:	9b01      	ldr	r3, [sp, #4]
 800423e:	f1bb 0f00 	cmp.w	fp, #0
 8004242:	f103 0301 	add.w	r3, r3, #1
 8004246:	bfb4      	ite	lt
 8004248:	f1cb 0b00 	rsblt	fp, fp, #0
 800424c:	ea6f 0b0b 	mvnge.w	fp, fp
 8004250:	9301      	str	r3, [sp, #4]
 8004252:	4276      	negs	r6, r6
 8004254:	e7c5      	b.n	80041e2 <do_mem_mtest+0x56>
 8004256:	f04f 0b00 	mov.w	fp, #0
 800425a:	f04f 47c2 	mov.w	r7, #1627389952	; 0x61000000
 800425e:	f8cd b00c 	str.w	fp, [sp, #12]
 8004262:	e7b8      	b.n	80041d6 <do_mem_mtest+0x4a>
 8004264:	200a      	movs	r0, #10
 8004266:	f001 f85f 	bl	8005328 <putc>
 800426a:	2001      	movs	r0, #1
 800426c:	b004      	add	sp, #16
 800426e:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8004272:	f04f 0b00 	mov.w	fp, #0
 8004276:	f04f 43c0 	mov.w	r3, #1610612736	; 0x60000000
 800427a:	f04f 47c2 	mov.w	r7, #1627389952	; 0x61000000
 800427e:	f8cd b00c 	str.w	fp, [sp, #12]
 8004282:	9302      	str	r3, [sp, #8]
 8004284:	e7a7      	b.n	80041d6 <do_mem_mtest+0x4a>
 8004286:	480d      	ldr	r0, [pc, #52]	; (80042bc <do_mem_mtest+0x130>)
 8004288:	f001 f85a 	bl	8005340 <puts>
 800428c:	e7d6      	b.n	800423c <do_mem_mtest+0xb0>
 800428e:	1e51      	subs	r1, r2, #1
 8004290:	480b      	ldr	r0, [pc, #44]	; (80042c0 <do_mem_mtest+0x134>)
 8004292:	464a      	mov	r2, r9
 8004294:	f001 f860 	bl	8005358 <printf>
 8004298:	f119 0000 	adds.w	r0, r9, #0
 800429c:	bf18      	it	ne
 800429e:	2001      	movne	r0, #1
 80042a0:	e7e4      	b.n	800426c <do_mem_mtest+0xe0>
 80042a2:	2300      	movs	r3, #0
 80042a4:	9303      	str	r3, [sp, #12]
 80042a6:	e796      	b.n	80041d6 <do_mem_mtest+0x4a>
 80042a8:	f04f 0b00 	mov.w	fp, #0
 80042ac:	f8cd b00c 	str.w	fp, [sp, #12]
 80042b0:	e791      	b.n	80041d6 <do_mem_mtest+0x4a>
 80042b2:	bf00      	nop
 80042b4:	0800d63c 	.word	0x0800d63c
 80042b8:	0800d614 	.word	0x0800d614
 80042bc:	0800d674 	.word	0x0800d674
 80042c0:	0800d5e8 	.word	0x0800d5e8
 80042c4:	0800d640 	.word	0x0800d640

080042c8 <do_mem_mw>:
 80042c8:	e92d 42f0 	stmdb	sp!, {r4, r5, r6, r7, r9, lr}
 80042cc:	4617      	mov	r7, r2
 80042ce:	3a03      	subs	r2, #3
 80042d0:	2a01      	cmp	r2, #1
 80042d2:	d904      	bls.n	80042de <do_mem_mw+0x16>
 80042d4:	f000 ff56 	bl	8005184 <cmd_usage>
 80042d8:	2001      	movs	r0, #1
 80042da:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 80042de:	2104      	movs	r1, #4
 80042e0:	6818      	ldr	r0, [r3, #0]
 80042e2:	4699      	mov	r9, r3
 80042e4:	f000 ff5a 	bl	800519c <cmd_get_data_size>
 80042e8:	1e05      	subs	r5, r0, #0
 80042ea:	dd26      	ble.n	800433a <do_mem_mw+0x72>
 80042ec:	2210      	movs	r2, #16
 80042ee:	2100      	movs	r1, #0
 80042f0:	f8d9 0004 	ldr.w	r0, [r9, #4]
 80042f4:	f004 faf0 	bl	80088d8 <simple_strtoul>
 80042f8:	4b16      	ldr	r3, [pc, #88]	; (8004354 <do_mem_mw+0x8c>)
 80042fa:	2210      	movs	r2, #16
 80042fc:	689c      	ldr	r4, [r3, #8]
 80042fe:	2100      	movs	r1, #0
 8004300:	4404      	add	r4, r0
 8004302:	f8d9 0008 	ldr.w	r0, [r9, #8]
 8004306:	f004 fae7 	bl	80088d8 <simple_strtoul>
 800430a:	2f04      	cmp	r7, #4
 800430c:	4606      	mov	r6, r0
 800430e:	d017      	beq.n	8004340 <do_mem_mw+0x78>
 8004310:	2300      	movs	r3, #0
 8004312:	e008      	b.n	8004326 <do_mem_mw+0x5e>
 8004314:	2d02      	cmp	r5, #2
 8004316:	f103 33ff 	add.w	r3, r3, #4294967295	; 0xffffffff
 800431a:	bf0c      	ite	eq
 800431c:	8026      	strheq	r6, [r4, #0]
 800431e:	7026      	strbne	r6, [r4, #0]
 8004320:	1c5a      	adds	r2, r3, #1
 8004322:	442c      	add	r4, r5
 8004324:	d006      	beq.n	8004334 <do_mem_mw+0x6c>
 8004326:	2d04      	cmp	r5, #4
 8004328:	d1f4      	bne.n	8004314 <do_mem_mw+0x4c>
 800432a:	3b01      	subs	r3, #1
 800432c:	1c5a      	adds	r2, r3, #1
 800432e:	6026      	str	r6, [r4, #0]
 8004330:	442c      	add	r4, r5
 8004332:	d1f8      	bne.n	8004326 <do_mem_mw+0x5e>
 8004334:	2000      	movs	r0, #0
 8004336:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 800433a:	2001      	movs	r0, #1
 800433c:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 8004340:	f8d9 000c 	ldr.w	r0, [r9, #12]
 8004344:	2210      	movs	r2, #16
 8004346:	2100      	movs	r1, #0
 8004348:	f004 fac6 	bl	80088d8 <simple_strtoul>
 800434c:	2800      	cmp	r0, #0
 800434e:	d0f1      	beq.n	8004334 <do_mem_mw+0x6c>
 8004350:	1e43      	subs	r3, r0, #1
 8004352:	e7e8      	b.n	8004326 <do_mem_mw+0x5e>
 8004354:	20003528 	.word	0x20003528

08004358 <do_mem_cmp>:
 8004358:	b5f0      	push	{r4, r5, r6, r7, lr}
 800435a:	2a04      	cmp	r2, #4
 800435c:	b083      	sub	sp, #12
 800435e:	d005      	beq.n	800436c <do_mem_cmp+0x14>
 8004360:	2601      	movs	r6, #1
 8004362:	f000 ff0f 	bl	8005184 <cmd_usage>
 8004366:	4630      	mov	r0, r6
 8004368:	b003      	add	sp, #12
 800436a:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800436c:	4611      	mov	r1, r2
 800436e:	6818      	ldr	r0, [r3, #0]
 8004370:	461d      	mov	r5, r3
 8004372:	f000 ff13 	bl	800519c <cmd_get_data_size>
 8004376:	1e04      	subs	r4, r0, #0
 8004378:	db40      	blt.n	80043fc <do_mem_cmp+0xa4>
 800437a:	2210      	movs	r2, #16
 800437c:	2100      	movs	r1, #0
 800437e:	6868      	ldr	r0, [r5, #4]
 8004380:	f004 faaa 	bl	80088d8 <simple_strtoul>
 8004384:	4f37      	ldr	r7, [pc, #220]	; (8004464 <do_mem_cmp+0x10c>)
 8004386:	2210      	movs	r2, #16
 8004388:	68be      	ldr	r6, [r7, #8]
 800438a:	2100      	movs	r1, #0
 800438c:	4406      	add	r6, r0
 800438e:	68a8      	ldr	r0, [r5, #8]
 8004390:	f004 faa2 	bl	80088d8 <simple_strtoul>
 8004394:	68bf      	ldr	r7, [r7, #8]
 8004396:	2210      	movs	r2, #16
 8004398:	4407      	add	r7, r0
 800439a:	2100      	movs	r1, #0
 800439c:	68e8      	ldr	r0, [r5, #12]
 800439e:	f004 fa9b 	bl	80088d8 <simple_strtoul>
 80043a2:	2800      	cmp	r0, #0
 80043a4:	d04c      	beq.n	8004440 <do_mem_cmp+0xe8>
 80043a6:	463b      	mov	r3, r7
 80043a8:	eba6 0e07 	sub.w	lr, r6, r7
 80043ac:	4631      	mov	r1, r6
 80043ae:	2500      	movs	r5, #0
 80043b0:	1bbf      	subs	r7, r7, r6
 80043b2:	e00b      	b.n	80043cc <do_mem_cmp+0x74>
 80043b4:	2c02      	cmp	r4, #2
 80043b6:	d016      	beq.n	80043e6 <do_mem_cmp+0x8e>
 80043b8:	f81e 2003 	ldrb.w	r2, [lr, r3]
 80043bc:	5c7e      	ldrb	r6, [r7, r1]
 80043be:	42b2      	cmp	r2, r6
 80043c0:	d134      	bne.n	800442c <do_mem_cmp+0xd4>
 80043c2:	3501      	adds	r5, #1
 80043c4:	42a8      	cmp	r0, r5
 80043c6:	4421      	add	r1, r4
 80043c8:	4423      	add	r3, r4
 80043ca:	d01b      	beq.n	8004404 <do_mem_cmp+0xac>
 80043cc:	2c04      	cmp	r4, #4
 80043ce:	d1f1      	bne.n	80043b4 <do_mem_cmp+0x5c>
 80043d0:	680a      	ldr	r2, [r1, #0]
 80043d2:	681e      	ldr	r6, [r3, #0]
 80043d4:	42b2      	cmp	r2, r6
 80043d6:	d0f4      	beq.n	80043c2 <do_mem_cmp+0x6a>
 80043d8:	9600      	str	r6, [sp, #0]
 80043da:	4823      	ldr	r0, [pc, #140]	; (8004468 <do_mem_cmp+0x110>)
 80043dc:	f000 ffbc 	bl	8005358 <printf>
 80043e0:	2601      	movs	r6, #1
 80043e2:	4a22      	ldr	r2, [pc, #136]	; (800446c <do_mem_cmp+0x114>)
 80043e4:	e016      	b.n	8004414 <do_mem_cmp+0xbc>
 80043e6:	880a      	ldrh	r2, [r1, #0]
 80043e8:	881e      	ldrh	r6, [r3, #0]
 80043ea:	42b2      	cmp	r2, r6
 80043ec:	d0e9      	beq.n	80043c2 <do_mem_cmp+0x6a>
 80043ee:	9600      	str	r6, [sp, #0]
 80043f0:	481f      	ldr	r0, [pc, #124]	; (8004470 <do_mem_cmp+0x118>)
 80043f2:	f000 ffb1 	bl	8005358 <printf>
 80043f6:	2601      	movs	r6, #1
 80043f8:	4a1e      	ldr	r2, [pc, #120]	; (8004474 <do_mem_cmp+0x11c>)
 80043fa:	e00b      	b.n	8004414 <do_mem_cmp+0xbc>
 80043fc:	2601      	movs	r6, #1
 80043fe:	4630      	mov	r0, r6
 8004400:	b003      	add	sp, #12
 8004402:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8004404:	2c04      	cmp	r4, #4
 8004406:	d018      	beq.n	800443a <do_mem_cmp+0xe2>
 8004408:	4a1a      	ldr	r2, [pc, #104]	; (8004474 <do_mem_cmp+0x11c>)
 800440a:	4b1b      	ldr	r3, [pc, #108]	; (8004478 <do_mem_cmp+0x120>)
 800440c:	2600      	movs	r6, #0
 800440e:	2c02      	cmp	r4, #2
 8004410:	bf18      	it	ne
 8004412:	461a      	movne	r2, r3
 8004414:	4b19      	ldr	r3, [pc, #100]	; (800447c <do_mem_cmp+0x124>)
 8004416:	491a      	ldr	r1, [pc, #104]	; (8004480 <do_mem_cmp+0x128>)
 8004418:	2d01      	cmp	r5, #1
 800441a:	bf18      	it	ne
 800441c:	460b      	movne	r3, r1
 800441e:	4629      	mov	r1, r5
 8004420:	4818      	ldr	r0, [pc, #96]	; (8004484 <do_mem_cmp+0x12c>)
 8004422:	f000 ff99 	bl	8005358 <printf>
 8004426:	4630      	mov	r0, r6
 8004428:	b003      	add	sp, #12
 800442a:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800442c:	9600      	str	r6, [sp, #0]
 800442e:	4816      	ldr	r0, [pc, #88]	; (8004488 <do_mem_cmp+0x130>)
 8004430:	f000 ff92 	bl	8005358 <printf>
 8004434:	2601      	movs	r6, #1
 8004436:	4a10      	ldr	r2, [pc, #64]	; (8004478 <do_mem_cmp+0x120>)
 8004438:	e7ec      	b.n	8004414 <do_mem_cmp+0xbc>
 800443a:	2600      	movs	r6, #0
 800443c:	4a0b      	ldr	r2, [pc, #44]	; (800446c <do_mem_cmp+0x114>)
 800443e:	e7e9      	b.n	8004414 <do_mem_cmp+0xbc>
 8004440:	2c04      	cmp	r4, #4
 8004442:	4605      	mov	r5, r0
 8004444:	d005      	beq.n	8004452 <do_mem_cmp+0xfa>
 8004446:	2c02      	cmp	r4, #2
 8004448:	d007      	beq.n	800445a <do_mem_cmp+0x102>
 800444a:	462e      	mov	r6, r5
 800444c:	4a0a      	ldr	r2, [pc, #40]	; (8004478 <do_mem_cmp+0x120>)
 800444e:	4b0c      	ldr	r3, [pc, #48]	; (8004480 <do_mem_cmp+0x128>)
 8004450:	e7e5      	b.n	800441e <do_mem_cmp+0xc6>
 8004452:	4a06      	ldr	r2, [pc, #24]	; (800446c <do_mem_cmp+0x114>)
 8004454:	462e      	mov	r6, r5
 8004456:	4b0a      	ldr	r3, [pc, #40]	; (8004480 <do_mem_cmp+0x128>)
 8004458:	e7e1      	b.n	800441e <do_mem_cmp+0xc6>
 800445a:	4a06      	ldr	r2, [pc, #24]	; (8004474 <do_mem_cmp+0x11c>)
 800445c:	4606      	mov	r6, r0
 800445e:	4b08      	ldr	r3, [pc, #32]	; (8004480 <do_mem_cmp+0x128>)
 8004460:	e7dd      	b.n	800441e <do_mem_cmp+0xc6>
 8004462:	bf00      	nop
 8004464:	20003528 	.word	0x20003528
 8004468:	0800d694 	.word	0x0800d694
 800446c:	0800d684 	.word	0x0800d684
 8004470:	0800d6cc 	.word	0x0800d6cc
 8004474:	0800d680 	.word	0x0800d680
 8004478:	0800d68c 	.word	0x0800d68c
 800447c:	0800d63c 	.word	0x0800d63c
 8004480:	0800dbc8 	.word	0x0800dbc8
 8004484:	0800d744 	.word	0x0800d744
 8004488:	0800d70c 	.word	0x0800d70c

0800448c <mod_mem.part.2>:
 800448c:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8004490:	f011 0601 	ands.w	r6, r1, #1
 8004494:	b084      	sub	sp, #16
 8004496:	4681      	mov	r9, r0
 8004498:	d057      	beq.n	800454a <mod_mem.part.2+0xbe>
 800449a:	4b36      	ldr	r3, [pc, #216]	; (8004574 <mod_mem.part.2+0xe8>)
 800449c:	68dc      	ldr	r4, [r3, #12]
 800449e:	691d      	ldr	r5, [r3, #16]
 80044a0:	9301      	str	r3, [sp, #4]
 80044a2:	f8df a0e0 	ldr.w	sl, [pc, #224]	; 8004584 <mod_mem.part.2+0xf8>
 80044a6:	4f34      	ldr	r7, [pc, #208]	; (8004578 <mod_mem.part.2+0xec>)
 80044a8:	f8df b0e0 	ldr.w	fp, [pc, #224]	; 800458c <mod_mem.part.2+0x100>
 80044ac:	4e33      	ldr	r6, [pc, #204]	; (800457c <mod_mem.part.2+0xf0>)
 80044ae:	4621      	mov	r1, r4
 80044b0:	4638      	mov	r0, r7
 80044b2:	f000 ff51 	bl	8005358 <printf>
 80044b6:	2d04      	cmp	r5, #4
 80044b8:	d029      	beq.n	800450e <mod_mem.part.2+0x82>
 80044ba:	2d02      	cmp	r5, #2
 80044bc:	bf0b      	itete	eq
 80044be:	4830      	ldreq	r0, [pc, #192]	; (8004580 <mod_mem.part.2+0xf4>)
 80044c0:	4658      	movne	r0, fp
 80044c2:	8821      	ldrheq	r1, [r4, #0]
 80044c4:	7821      	ldrbne	r1, [r4, #0]
 80044c6:	f000 ff47 	bl	8005358 <printf>
 80044ca:	4630      	mov	r0, r6
 80044cc:	f002 fccc 	bl	8006e68 <readline>
 80044d0:	b330      	cbz	r0, 8004520 <mod_mem.part.2+0x94>
 80044d2:	2801      	cmp	r0, #1
 80044d4:	d103      	bne.n	80044de <mod_mem.part.2+0x52>
 80044d6:	f99a 3000 	ldrsb.w	r3, [sl]
 80044da:	2b2d      	cmp	r3, #45	; 0x2d
 80044dc:	d02d      	beq.n	800453a <mod_mem.part.2+0xae>
 80044de:	2210      	movs	r2, #16
 80044e0:	a903      	add	r1, sp, #12
 80044e2:	4828      	ldr	r0, [pc, #160]	; (8004584 <mod_mem.part.2+0xf8>)
 80044e4:	f004 f9f8 	bl	80088d8 <simple_strtoul>
 80044e8:	9b03      	ldr	r3, [sp, #12]
 80044ea:	4553      	cmp	r3, sl
 80044ec:	d01e      	beq.n	800452c <mod_mem.part.2+0xa0>
 80044ee:	2d04      	cmp	r5, #4
 80044f0:	d029      	beq.n	8004546 <mod_mem.part.2+0xba>
 80044f2:	2d02      	cmp	r5, #2
 80044f4:	bf0c      	ite	eq
 80044f6:	8020      	strheq	r0, [r4, #0]
 80044f8:	7020      	strbne	r0, [r4, #0]
 80044fa:	f1b9 0f00 	cmp.w	r9, #0
 80044fe:	d0d6      	beq.n	80044ae <mod_mem.part.2+0x22>
 8004500:	442c      	add	r4, r5
 8004502:	4621      	mov	r1, r4
 8004504:	4638      	mov	r0, r7
 8004506:	f000 ff27 	bl	8005358 <printf>
 800450a:	2d04      	cmp	r5, #4
 800450c:	d1d5      	bne.n	80044ba <mod_mem.part.2+0x2e>
 800450e:	481e      	ldr	r0, [pc, #120]	; (8004588 <mod_mem.part.2+0xfc>)
 8004510:	6821      	ldr	r1, [r4, #0]
 8004512:	f000 ff21 	bl	8005358 <printf>
 8004516:	4630      	mov	r0, r6
 8004518:	f002 fca6 	bl	8006e68 <readline>
 800451c:	2800      	cmp	r0, #0
 800451e:	d1d8      	bne.n	80044d2 <mod_mem.part.2+0x46>
 8004520:	f1b9 0f00 	cmp.w	r9, #0
 8004524:	d0c3      	beq.n	80044ae <mod_mem.part.2+0x22>
 8004526:	462b      	mov	r3, r5
 8004528:	441c      	add	r4, r3
 800452a:	e7c0      	b.n	80044ae <mod_mem.part.2+0x22>
 800452c:	2000      	movs	r0, #0
 800452e:	9a01      	ldr	r2, [sp, #4]
 8004530:	60d4      	str	r4, [r2, #12]
 8004532:	6115      	str	r5, [r2, #16]
 8004534:	b004      	add	sp, #16
 8004536:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 800453a:	426b      	negs	r3, r5
 800453c:	f1b9 0f00 	cmp.w	r9, #0
 8004540:	d0b5      	beq.n	80044ae <mod_mem.part.2+0x22>
 8004542:	441c      	add	r4, r3
 8004544:	e7b3      	b.n	80044ae <mod_mem.part.2+0x22>
 8004546:	6020      	str	r0, [r4, #0]
 8004548:	e7d7      	b.n	80044fa <mod_mem.part.2+0x6e>
 800454a:	2104      	movs	r1, #4
 800454c:	6810      	ldr	r0, [r2, #0]
 800454e:	4614      	mov	r4, r2
 8004550:	f000 fe24 	bl	800519c <cmd_get_data_size>
 8004554:	1e05      	subs	r5, r0, #0
 8004556:	db09      	blt.n	800456c <mod_mem.part.2+0xe0>
 8004558:	6860      	ldr	r0, [r4, #4]
 800455a:	4631      	mov	r1, r6
 800455c:	2210      	movs	r2, #16
 800455e:	f004 f9bb 	bl	80088d8 <simple_strtoul>
 8004562:	4b04      	ldr	r3, [pc, #16]	; (8004574 <mod_mem.part.2+0xe8>)
 8004564:	689c      	ldr	r4, [r3, #8]
 8004566:	9301      	str	r3, [sp, #4]
 8004568:	4404      	add	r4, r0
 800456a:	e79a      	b.n	80044a2 <mod_mem.part.2+0x16>
 800456c:	2001      	movs	r0, #1
 800456e:	b004      	add	sp, #16
 8004570:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8004574:	20003528 	.word	0x20003528
 8004578:	0800d768 	.word	0x0800d768
 800457c:	0800d788 	.word	0x0800d788
 8004580:	0800d778 	.word	0x0800d778
 8004584:	20003588 	.word	0x20003588
 8004588:	0800d770 	.word	0x0800d770
 800458c:	0800d780 	.word	0x0800d780

08004590 <do_mem_mm>:
 8004590:	2a02      	cmp	r2, #2
 8004592:	d004      	beq.n	800459e <do_mem_mm+0xe>
 8004594:	b508      	push	{r3, lr}
 8004596:	f000 fdf5 	bl	8005184 <cmd_usage>
 800459a:	2001      	movs	r0, #1
 800459c:	bd08      	pop	{r3, pc}
 800459e:	461a      	mov	r2, r3
 80045a0:	2001      	movs	r0, #1
 80045a2:	e773      	b.n	800448c <mod_mem.part.2>

080045a4 <do_mem_nm>:
 80045a4:	2a02      	cmp	r2, #2
 80045a6:	d004      	beq.n	80045b2 <do_mem_nm+0xe>
 80045a8:	b508      	push	{r3, lr}
 80045aa:	f000 fdeb 	bl	8005184 <cmd_usage>
 80045ae:	2001      	movs	r0, #1
 80045b0:	bd08      	pop	{r3, pc}
 80045b2:	461a      	mov	r2, r3
 80045b4:	2000      	movs	r0, #0
 80045b6:	e769      	b.n	800448c <mod_mem.part.2>

080045b8 <do_mem_cp>:
 80045b8:	2a04      	cmp	r2, #4
 80045ba:	e92d 42f0 	stmdb	sp!, {r4, r5, r6, r7, r9, lr}
 80045be:	d004      	beq.n	80045ca <do_mem_cp+0x12>
 80045c0:	f000 fde0 	bl	8005184 <cmd_usage>
 80045c4:	2001      	movs	r0, #1
 80045c6:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 80045ca:	4611      	mov	r1, r2
 80045cc:	6818      	ldr	r0, [r3, #0]
 80045ce:	461c      	mov	r4, r3
 80045d0:	f000 fde4 	bl	800519c <cmd_get_data_size>
 80045d4:	1e06      	subs	r6, r0, #0
 80045d6:	db33      	blt.n	8004640 <do_mem_cp+0x88>
 80045d8:	2210      	movs	r2, #16
 80045da:	2100      	movs	r1, #0
 80045dc:	6860      	ldr	r0, [r4, #4]
 80045de:	f004 f97b 	bl	80088d8 <simple_strtoul>
 80045e2:	4d2f      	ldr	r5, [pc, #188]	; (80046a0 <do_mem_cp+0xe8>)
 80045e4:	2210      	movs	r2, #16
 80045e6:	68af      	ldr	r7, [r5, #8]
 80045e8:	2100      	movs	r1, #0
 80045ea:	4407      	add	r7, r0
 80045ec:	68a0      	ldr	r0, [r4, #8]
 80045ee:	f004 f973 	bl	80088d8 <simple_strtoul>
 80045f2:	68ad      	ldr	r5, [r5, #8]
 80045f4:	2210      	movs	r2, #16
 80045f6:	4405      	add	r5, r0
 80045f8:	2100      	movs	r1, #0
 80045fa:	68e0      	ldr	r0, [r4, #12]
 80045fc:	f004 f96c 	bl	80088d8 <simple_strtoul>
 8004600:	b338      	cbz	r0, 8004652 <do_mem_cp+0x9a>
 8004602:	4b28      	ldr	r3, [pc, #160]	; (80046a4 <do_mem_cp+0xec>)
 8004604:	f105 4278 	add.w	r2, r5, #4160749568	; 0xf8000000
 8004608:	429a      	cmp	r2, r3
 800460a:	d904      	bls.n	8004616 <do_mem_cp+0x5e>
 800460c:	f100 4178 	add.w	r1, r0, #4160749568	; 0xf8000000
 8004610:	4429      	add	r1, r5
 8004612:	4299      	cmp	r1, r3
 8004614:	d823      	bhi.n	800465e <do_mem_cp+0xa6>
 8004616:	4b23      	ldr	r3, [pc, #140]	; (80046a4 <do_mem_cp+0xec>)
 8004618:	f107 4178 	add.w	r1, r7, #4160749568	; 0xf8000000
 800461c:	4299      	cmp	r1, r3
 800461e:	d912      	bls.n	8004646 <do_mem_cp+0x8e>
 8004620:	f100 4178 	add.w	r1, r0, #4160749568	; 0xf8000000
 8004624:	187c      	adds	r4, r7, r1
 8004626:	429c      	cmp	r4, r3
 8004628:	d90d      	bls.n	8004646 <do_mem_cp+0x8e>
 800462a:	429a      	cmp	r2, r3
 800462c:	d802      	bhi.n	8004634 <do_mem_cp+0x7c>
 800462e:	4429      	add	r1, r5
 8004630:	4299      	cmp	r1, r3
 8004632:	d92a      	bls.n	800468a <do_mem_cp+0xd2>
 8004634:	481c      	ldr	r0, [pc, #112]	; (80046a8 <do_mem_cp+0xf0>)
 8004636:	f000 fe83 	bl	8005340 <puts>
 800463a:	2001      	movs	r0, #1
 800463c:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 8004640:	2001      	movs	r0, #1
 8004642:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 8004646:	4819      	ldr	r0, [pc, #100]	; (80046ac <do_mem_cp+0xf4>)
 8004648:	f000 fe7a 	bl	8005340 <puts>
 800464c:	2001      	movs	r0, #1
 800464e:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 8004652:	4817      	ldr	r0, [pc, #92]	; (80046b0 <do_mem_cp+0xf8>)
 8004654:	f000 fe74 	bl	8005340 <puts>
 8004658:	2001      	movs	r0, #1
 800465a:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 800465e:	462b      	mov	r3, r5
 8004660:	4639      	mov	r1, r7
 8004662:	3801      	subs	r0, #1
 8004664:	1b7d      	subs	r5, r7, r5
 8004666:	1bdc      	subs	r4, r3, r7
 8004668:	e00a      	b.n	8004680 <do_mem_cp+0xc8>
 800466a:	2e02      	cmp	r6, #2
 800466c:	bf0b      	itete	eq
 800466e:	880a      	ldrheq	r2, [r1, #0]
 8004670:	5cea      	ldrbne	r2, [r5, r3]
 8004672:	801a      	strheq	r2, [r3, #0]
 8004674:	5462      	strbne	r2, [r4, r1]
 8004676:	3801      	subs	r0, #1
 8004678:	1c42      	adds	r2, r0, #1
 800467a:	4431      	add	r1, r6
 800467c:	4433      	add	r3, r6
 800467e:	d00b      	beq.n	8004698 <do_mem_cp+0xe0>
 8004680:	2e04      	cmp	r6, #4
 8004682:	d1f2      	bne.n	800466a <do_mem_cp+0xb2>
 8004684:	680a      	ldr	r2, [r1, #0]
 8004686:	601a      	str	r2, [r3, #0]
 8004688:	e7f5      	b.n	8004676 <do_mem_cp+0xbe>
 800468a:	4602      	mov	r2, r0
 800468c:	4639      	mov	r1, r7
 800468e:	4628      	mov	r0, r5
 8004690:	e8bd 42f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, lr}
 8004694:	4b07      	ldr	r3, [pc, #28]	; (80046b4 <do_mem_cp+0xfc>)
 8004696:	4718      	bx	r3
 8004698:	2000      	movs	r0, #0
 800469a:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 800469e:	bf00      	nop
 80046a0:	20003528 	.word	0x20003528
 80046a4:	000fffff 	.word	0x000fffff
 80046a8:	0800d7cc 	.word	0x0800d7cc
 80046ac:	0800d7a0 	.word	0x0800d7a0
 80046b0:	0800d78c 	.word	0x0800d78c
 80046b4:	20000b2d 	.word	0x20000b2d

080046b8 <do_mem_crc>:
 80046b8:	2a02      	cmp	r2, #2
 80046ba:	e92d 42f0 	stmdb	sp!, {r4, r5, r6, r7, r9, lr}
 80046be:	dd2d      	ble.n	800471c <do_mem_crc+0x64>
 80046c0:	4616      	mov	r6, r2
 80046c2:	2100      	movs	r1, #0
 80046c4:	2210      	movs	r2, #16
 80046c6:	6858      	ldr	r0, [r3, #4]
 80046c8:	461f      	mov	r7, r3
 80046ca:	f004 f905 	bl	80088d8 <simple_strtoul>
 80046ce:	4b16      	ldr	r3, [pc, #88]	; (8004728 <do_mem_crc+0x70>)
 80046d0:	2210      	movs	r2, #16
 80046d2:	689c      	ldr	r4, [r3, #8]
 80046d4:	2100      	movs	r1, #0
 80046d6:	4404      	add	r4, r0
 80046d8:	68b8      	ldr	r0, [r7, #8]
 80046da:	f004 f8fd 	bl	80088d8 <simple_strtoul>
 80046de:	4621      	mov	r1, r4
 80046e0:	4602      	mov	r2, r0
 80046e2:	4605      	mov	r5, r0
 80046e4:	2000      	movs	r0, #0
 80046e6:	f003 fb4f 	bl	8007d88 <crc32>
 80046ea:	1e6a      	subs	r2, r5, #1
 80046ec:	4603      	mov	r3, r0
 80046ee:	4681      	mov	r9, r0
 80046f0:	4422      	add	r2, r4
 80046f2:	4621      	mov	r1, r4
 80046f4:	480d      	ldr	r0, [pc, #52]	; (800472c <do_mem_crc+0x74>)
 80046f6:	f000 fe2f 	bl	8005358 <printf>
 80046fa:	2e03      	cmp	r6, #3
 80046fc:	d103      	bne.n	8004706 <do_mem_crc+0x4e>
 80046fe:	2300      	movs	r3, #0
 8004700:	4618      	mov	r0, r3
 8004702:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 8004706:	68f8      	ldr	r0, [r7, #12]
 8004708:	2210      	movs	r2, #16
 800470a:	2100      	movs	r1, #0
 800470c:	f004 f8e4 	bl	80088d8 <simple_strtoul>
 8004710:	2300      	movs	r3, #0
 8004712:	f8c0 9000 	str.w	r9, [r0]
 8004716:	4618      	mov	r0, r3
 8004718:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 800471c:	f000 fd32 	bl	8005184 <cmd_usage>
 8004720:	2301      	movs	r3, #1
 8004722:	4618      	mov	r0, r3
 8004724:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 8004728:	20003528 	.word	0x20003528
 800472c:	0800d7fc 	.word	0x0800d7fc

08004730 <netboot_common>:
 8004730:	e92d 42f0 	stmdb	sp!, {r4, r5, r6, r7, r9, lr}
 8004734:	4606      	mov	r6, r0
 8004736:	b088      	sub	sp, #32
 8004738:	4882      	ldr	r0, [pc, #520]	; (8004944 <netboot_common+0x214>)
 800473a:	460f      	mov	r7, r1
 800473c:	4614      	mov	r4, r2
 800473e:	461d      	mov	r5, r3
 8004740:	f000 fbc8 	bl	8004ed4 <getenv>
 8004744:	b128      	cbz	r0, 8004752 <netboot_common+0x22>
 8004746:	2210      	movs	r2, #16
 8004748:	2100      	movs	r1, #0
 800474a:	f004 f8c5 	bl	80088d8 <simple_strtoul>
 800474e:	4b7e      	ldr	r3, [pc, #504]	; (8004948 <netboot_common+0x218>)
 8004750:	6018      	str	r0, [r3, #0]
 8004752:	2c02      	cmp	r4, #2
 8004754:	d00f      	beq.n	8004776 <netboot_common+0x46>
 8004756:	2c03      	cmp	r4, #3
 8004758:	d075      	beq.n	8004846 <netboot_common+0x116>
 800475a:	2c01      	cmp	r4, #1
 800475c:	d01f      	beq.n	800479e <netboot_common+0x6e>
 800475e:	4638      	mov	r0, r7
 8004760:	f000 fd10 	bl	8005184 <cmd_usage>
 8004764:	f06f 004f 	mvn.w	r0, #79	; 0x4f
 8004768:	f002 fada 	bl	8006d20 <__show_boot_progress>
 800476c:	2401      	movs	r4, #1
 800476e:	4620      	mov	r0, r4
 8004770:	b008      	add	sp, #32
 8004772:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 8004776:	2210      	movs	r2, #16
 8004778:	a901      	add	r1, sp, #4
 800477a:	6868      	ldr	r0, [r5, #4]
 800477c:	f004 f8ac 	bl	80088d8 <simple_strtoul>
 8004780:	686c      	ldr	r4, [r5, #4]
 8004782:	4681      	mov	r9, r0
 8004784:	4620      	mov	r0, r4
 8004786:	f7fb fe95 	bl	80004b4 <strlen>
 800478a:	9b01      	ldr	r3, [sp, #4]
 800478c:	4420      	add	r0, r4
 800478e:	4283      	cmp	r3, r0
 8004790:	f000 80b3 	beq.w	80048fa <netboot_common+0x1ca>
 8004794:	2280      	movs	r2, #128	; 0x80
 8004796:	6869      	ldr	r1, [r5, #4]
 8004798:	486c      	ldr	r0, [pc, #432]	; (800494c <netboot_common+0x21c>)
 800479a:	f7fd fb75 	bl	8001e88 <copy_filename>
 800479e:	2050      	movs	r0, #80	; 0x50
 80047a0:	f002 fabe 	bl	8006d20 <__show_boot_progress>
 80047a4:	4630      	mov	r0, r6
 80047a6:	f7fd fbcd 	bl	8001f44 <NetLoop>
 80047aa:	1e04      	subs	r4, r0, #0
 80047ac:	f2c0 80c1 	blt.w	8004932 <netboot_common+0x202>
 80047b0:	2051      	movs	r0, #81	; 0x51
 80047b2:	f002 fab5 	bl	8006d20 <__show_boot_progress>
 80047b6:	4b66      	ldr	r3, [pc, #408]	; (8004950 <netboot_common+0x220>)
 80047b8:	6818      	ldr	r0, [r3, #0]
 80047ba:	2800      	cmp	r0, #0
 80047bc:	d15c      	bne.n	8004878 <netboot_common+0x148>
 80047be:	4b65      	ldr	r3, [pc, #404]	; (8004954 <netboot_common+0x224>)
 80047c0:	6818      	ldr	r0, [r3, #0]
 80047c2:	2800      	cmp	r0, #0
 80047c4:	d163      	bne.n	800488e <netboot_common+0x15e>
 80047c6:	4964      	ldr	r1, [pc, #400]	; (8004958 <netboot_common+0x228>)
 80047c8:	f991 3000 	ldrsb.w	r3, [r1]
 80047cc:	2b00      	cmp	r3, #0
 80047ce:	d16a      	bne.n	80048a6 <netboot_common+0x176>
 80047d0:	4962      	ldr	r1, [pc, #392]	; (800495c <netboot_common+0x22c>)
 80047d2:	f991 3000 	ldrsb.w	r3, [r1]
 80047d6:	2b00      	cmp	r3, #0
 80047d8:	d16d      	bne.n	80048b6 <netboot_common+0x186>
 80047da:	4b61      	ldr	r3, [pc, #388]	; (8004960 <netboot_common+0x230>)
 80047dc:	6818      	ldr	r0, [r3, #0]
 80047de:	2800      	cmp	r0, #0
 80047e0:	d17e      	bne.n	80048e0 <netboot_common+0x1b0>
 80047e2:	4b60      	ldr	r3, [pc, #384]	; (8004964 <netboot_common+0x234>)
 80047e4:	6818      	ldr	r0, [r3, #0]
 80047e6:	2800      	cmp	r0, #0
 80047e8:	d13a      	bne.n	8004860 <netboot_common+0x130>
 80047ea:	4b5f      	ldr	r3, [pc, #380]	; (8004968 <netboot_common+0x238>)
 80047ec:	6818      	ldr	r0, [r3, #0]
 80047ee:	2800      	cmp	r0, #0
 80047f0:	d169      	bne.n	80048c6 <netboot_common+0x196>
 80047f2:	495e      	ldr	r1, [pc, #376]	; (800496c <netboot_common+0x23c>)
 80047f4:	f991 3000 	ldrsb.w	r3, [r1]
 80047f8:	b9fb      	cbnz	r3, 800483a <netboot_common+0x10a>
 80047fa:	b1b4      	cbz	r4, 800482a <netboot_common+0xfa>
 80047fc:	4e52      	ldr	r6, [pc, #328]	; (8004948 <netboot_common+0x218>)
 80047fe:	4621      	mov	r1, r4
 8004800:	6830      	ldr	r0, [r6, #0]
 8004802:	f006 fe97 	bl	800b534 <flush_cache>
 8004806:	485a      	ldr	r0, [pc, #360]	; (8004970 <netboot_common+0x240>)
 8004808:	f000 fb64 	bl	8004ed4 <getenv>
 800480c:	b128      	cbz	r0, 800481a <netboot_common+0xea>
 800480e:	4959      	ldr	r1, [pc, #356]	; (8004974 <netboot_common+0x244>)
 8004810:	f7fb fdfa 	bl	8000408 <strcmp>
 8004814:	4604      	mov	r4, r0
 8004816:	2800      	cmp	r0, #0
 8004818:	d073      	beq.n	8004902 <netboot_common+0x1d2>
 800481a:	2400      	movs	r4, #0
 800481c:	2054      	movs	r0, #84	; 0x54
 800481e:	f002 fa7f 	bl	8006d20 <__show_boot_progress>
 8004822:	4620      	mov	r0, r4
 8004824:	b008      	add	sp, #32
 8004826:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 800482a:	f06f 0051 	mvn.w	r0, #81	; 0x51
 800482e:	f002 fa77 	bl	8006d20 <__show_boot_progress>
 8004832:	4620      	mov	r0, r4
 8004834:	b008      	add	sp, #32
 8004836:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 800483a:	484f      	ldr	r0, [pc, #316]	; (8004978 <netboot_common+0x248>)
 800483c:	f000 fb1c 	bl	8004e78 <setenv>
 8004840:	2c00      	cmp	r4, #0
 8004842:	d1db      	bne.n	80047fc <netboot_common+0xcc>
 8004844:	e7f1      	b.n	800482a <netboot_common+0xfa>
 8004846:	2210      	movs	r2, #16
 8004848:	2100      	movs	r1, #0
 800484a:	6868      	ldr	r0, [r5, #4]
 800484c:	f004 f844 	bl	80088d8 <simple_strtoul>
 8004850:	4b3d      	ldr	r3, [pc, #244]	; (8004948 <netboot_common+0x218>)
 8004852:	2280      	movs	r2, #128	; 0x80
 8004854:	6018      	str	r0, [r3, #0]
 8004856:	68a9      	ldr	r1, [r5, #8]
 8004858:	483c      	ldr	r0, [pc, #240]	; (800494c <netboot_common+0x21c>)
 800485a:	f7fd fb15 	bl	8001e88 <copy_filename>
 800485e:	e79e      	b.n	800479e <netboot_common+0x6e>
 8004860:	a902      	add	r1, sp, #8
 8004862:	f7fd fb2f 	bl	8001ec4 <ip_to_string>
 8004866:	a902      	add	r1, sp, #8
 8004868:	4844      	ldr	r0, [pc, #272]	; (800497c <netboot_common+0x24c>)
 800486a:	f000 fb05 	bl	8004e78 <setenv>
 800486e:	4b3e      	ldr	r3, [pc, #248]	; (8004968 <netboot_common+0x238>)
 8004870:	6818      	ldr	r0, [r3, #0]
 8004872:	2800      	cmp	r0, #0
 8004874:	d0bd      	beq.n	80047f2 <netboot_common+0xc2>
 8004876:	e026      	b.n	80048c6 <netboot_common+0x196>
 8004878:	a902      	add	r1, sp, #8
 800487a:	f7fd fb23 	bl	8001ec4 <ip_to_string>
 800487e:	a902      	add	r1, sp, #8
 8004880:	483f      	ldr	r0, [pc, #252]	; (8004980 <netboot_common+0x250>)
 8004882:	f000 faf9 	bl	8004e78 <setenv>
 8004886:	4b33      	ldr	r3, [pc, #204]	; (8004954 <netboot_common+0x224>)
 8004888:	6818      	ldr	r0, [r3, #0]
 800488a:	2800      	cmp	r0, #0
 800488c:	d09b      	beq.n	80047c6 <netboot_common+0x96>
 800488e:	a902      	add	r1, sp, #8
 8004890:	f7fd fb18 	bl	8001ec4 <ip_to_string>
 8004894:	a902      	add	r1, sp, #8
 8004896:	483b      	ldr	r0, [pc, #236]	; (8004984 <netboot_common+0x254>)
 8004898:	f000 faee 	bl	8004e78 <setenv>
 800489c:	492e      	ldr	r1, [pc, #184]	; (8004958 <netboot_common+0x228>)
 800489e:	f991 3000 	ldrsb.w	r3, [r1]
 80048a2:	2b00      	cmp	r3, #0
 80048a4:	d094      	beq.n	80047d0 <netboot_common+0xa0>
 80048a6:	4838      	ldr	r0, [pc, #224]	; (8004988 <netboot_common+0x258>)
 80048a8:	f000 fae6 	bl	8004e78 <setenv>
 80048ac:	492b      	ldr	r1, [pc, #172]	; (800495c <netboot_common+0x22c>)
 80048ae:	f991 3000 	ldrsb.w	r3, [r1]
 80048b2:	2b00      	cmp	r3, #0
 80048b4:	d091      	beq.n	80047da <netboot_common+0xaa>
 80048b6:	4835      	ldr	r0, [pc, #212]	; (800498c <netboot_common+0x25c>)
 80048b8:	f000 fade 	bl	8004e78 <setenv>
 80048bc:	4b28      	ldr	r3, [pc, #160]	; (8004960 <netboot_common+0x230>)
 80048be:	6818      	ldr	r0, [r3, #0]
 80048c0:	2800      	cmp	r0, #0
 80048c2:	d08e      	beq.n	80047e2 <netboot_common+0xb2>
 80048c4:	e00c      	b.n	80048e0 <netboot_common+0x1b0>
 80048c6:	a902      	add	r1, sp, #8
 80048c8:	f7fd fafc 	bl	8001ec4 <ip_to_string>
 80048cc:	a902      	add	r1, sp, #8
 80048ce:	4830      	ldr	r0, [pc, #192]	; (8004990 <netboot_common+0x260>)
 80048d0:	f000 fad2 	bl	8004e78 <setenv>
 80048d4:	4925      	ldr	r1, [pc, #148]	; (800496c <netboot_common+0x23c>)
 80048d6:	f991 3000 	ldrsb.w	r3, [r1]
 80048da:	2b00      	cmp	r3, #0
 80048dc:	d08d      	beq.n	80047fa <netboot_common+0xca>
 80048de:	e7ac      	b.n	800483a <netboot_common+0x10a>
 80048e0:	a902      	add	r1, sp, #8
 80048e2:	f7fd faef 	bl	8001ec4 <ip_to_string>
 80048e6:	a902      	add	r1, sp, #8
 80048e8:	482a      	ldr	r0, [pc, #168]	; (8004994 <netboot_common+0x264>)
 80048ea:	f000 fac5 	bl	8004e78 <setenv>
 80048ee:	4b1d      	ldr	r3, [pc, #116]	; (8004964 <netboot_common+0x234>)
 80048f0:	6818      	ldr	r0, [r3, #0]
 80048f2:	2800      	cmp	r0, #0
 80048f4:	f43f af79 	beq.w	80047ea <netboot_common+0xba>
 80048f8:	e7b2      	b.n	8004860 <netboot_common+0x130>
 80048fa:	4b13      	ldr	r3, [pc, #76]	; (8004948 <netboot_common+0x218>)
 80048fc:	f8c3 9000 	str.w	r9, [r3]
 8004900:	e74d      	b.n	800479e <netboot_common+0x6e>
 8004902:	682b      	ldr	r3, [r5, #0]
 8004904:	6831      	ldr	r1, [r6, #0]
 8004906:	4824      	ldr	r0, [pc, #144]	; (8004998 <netboot_common+0x268>)
 8004908:	9302      	str	r3, [sp, #8]
 800490a:	9403      	str	r4, [sp, #12]
 800490c:	f000 fd24 	bl	8005358 <printf>
 8004910:	2052      	movs	r0, #82	; 0x52
 8004912:	f002 fa05 	bl	8006d20 <__show_boot_progress>
 8004916:	4621      	mov	r1, r4
 8004918:	4638      	mov	r0, r7
 800491a:	ab02      	add	r3, sp, #8
 800491c:	2201      	movs	r2, #1
 800491e:	f7fe fe5f 	bl	80035e0 <do_bootm>
 8004922:	1e04      	subs	r4, r0, #0
 8004924:	f6bf af7a 	bge.w	800481c <netboot_common+0xec>
 8004928:	f06f 0052 	mvn.w	r0, #82	; 0x52
 800492c:	f002 f9f8 	bl	8006d20 <__show_boot_progress>
 8004930:	e71d      	b.n	800476e <netboot_common+0x3e>
 8004932:	2401      	movs	r4, #1
 8004934:	f06f 0050 	mvn.w	r0, #80	; 0x50
 8004938:	f002 f9f2 	bl	8006d20 <__show_boot_progress>
 800493c:	4620      	mov	r0, r4
 800493e:	b008      	add	sp, #32
 8004940:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 8004944:	0800c468 	.word	0x0800c468
 8004948:	20000058 	.word	0x20000058
 800494c:	200031cc 	.word	0x200031cc
 8004950:	20000d38 	.word	0x20000d38
 8004954:	20000d34 	.word	0x20000d34
 8004958:	20003290 	.word	0x20003290
 800495c:	20003250 	.word	0x20003250
 8004960:	20000d2c 	.word	0x20000d2c
 8004964:	20000d5c 	.word	0x20000d5c
 8004968:	200032d0 	.word	0x200032d0
 800496c:	200032b0 	.word	0x200032b0
 8004970:	0800d33c 	.word	0x0800d33c
 8004974:	0800c890 	.word	0x0800c890
 8004978:	0800d97c 	.word	0x0800d97c
 800497c:	0800c990 	.word	0x0800c990
 8004980:	0800c97c 	.word	0x0800c97c
 8004984:	0800c988 	.word	0x0800c988
 8004988:	0800d95c 	.word	0x0800d95c
 800498c:	0800d968 	.word	0x0800d968
 8004990:	0800d974 	.word	0x0800d974
 8004994:	0800c460 	.word	0x0800c460
 8004998:	0800d984 	.word	0x0800d984

0800499c <do_bootp>:
 800499c:	4601      	mov	r1, r0
 800499e:	2000      	movs	r0, #0
 80049a0:	e6c6      	b.n	8004730 <netboot_common>
 80049a2:	bf00      	nop

080049a4 <do_tftpb>:
 80049a4:	4601      	mov	r1, r0
 80049a6:	2003      	movs	r0, #3
 80049a8:	e6c2      	b.n	8004730 <netboot_common>
 80049aa:	bf00      	nop

080049ac <do_rarpb>:
 80049ac:	4601      	mov	r1, r0
 80049ae:	2001      	movs	r0, #1
 80049b0:	e6be      	b.n	8004730 <netboot_common>
 80049b2:	bf00      	nop

080049b4 <do_saveenv>:
 80049b4:	b508      	push	{r3, lr}
 80049b6:	4b05      	ldr	r3, [pc, #20]	; (80049cc <do_saveenv+0x18>)
 80049b8:	4805      	ldr	r0, [pc, #20]	; (80049d0 <do_saveenv+0x1c>)
 80049ba:	6819      	ldr	r1, [r3, #0]
 80049bc:	f000 fccc 	bl	8005358 <printf>
 80049c0:	f001 fcf8 	bl	80063b4 <saveenv>
 80049c4:	3000      	adds	r0, #0
 80049c6:	bf18      	it	ne
 80049c8:	2001      	movne	r0, #1
 80049ca:	bd08      	pop	{r3, pc}
 80049cc:	20000798 	.word	0x20000798
 80049d0:	0800da64 	.word	0x0800da64

080049d4 <get_env_id>:
 80049d4:	4b01      	ldr	r3, [pc, #4]	; (80049dc <get_env_id+0x8>)
 80049d6:	6818      	ldr	r0, [r3, #0]
 80049d8:	4770      	bx	lr
 80049da:	bf00      	nop
 80049dc:	200000ec 	.word	0x200000ec

080049e0 <envmatch>:
 80049e0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80049e2:	4605      	mov	r5, r0
 80049e4:	460c      	mov	r4, r1
 80049e6:	e004      	b.n	80049f2 <envmatch+0x12>
 80049e8:	f815 3b01 	ldrb.w	r3, [r5], #1
 80049ec:	4634      	mov	r4, r6
 80049ee:	2b3d      	cmp	r3, #61	; 0x3d
 80049f0:	d00e      	beq.n	8004a10 <envmatch+0x30>
 80049f2:	4620      	mov	r0, r4
 80049f4:	782f      	ldrb	r7, [r5, #0]
 80049f6:	f001 fc63 	bl	80062c0 <env_get_char>
 80049fa:	4287      	cmp	r7, r0
 80049fc:	f104 0601 	add.w	r6, r4, #1
 8004a00:	d0f2      	beq.n	80049e8 <envmatch+0x8>
 8004a02:	782b      	ldrb	r3, [r5, #0]
 8004a04:	b933      	cbnz	r3, 8004a14 <envmatch+0x34>
 8004a06:	4620      	mov	r0, r4
 8004a08:	f001 fc5a 	bl	80062c0 <env_get_char>
 8004a0c:	283d      	cmp	r0, #61	; 0x3d
 8004a0e:	d101      	bne.n	8004a14 <envmatch+0x34>
 8004a10:	4630      	mov	r0, r6
 8004a12:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8004a14:	f04f 36ff 	mov.w	r6, #4294967295	; 0xffffffff
 8004a18:	e7fa      	b.n	8004a10 <envmatch+0x30>
 8004a1a:	bf00      	nop

08004a1c <printenv>:
 8004a1c:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8004a20:	2500      	movs	r5, #0
 8004a22:	b088      	sub	sp, #32
 8004a24:	9001      	str	r0, [sp, #4]
 8004a26:	f88d 501c 	strb.w	r5, [sp, #28]
 8004a2a:	460e      	mov	r6, r1
 8004a2c:	b371      	cbz	r1, 8004a8c <printenv+0x70>
 8004a2e:	4628      	mov	r0, r5
 8004a30:	f001 fc46 	bl	80062c0 <env_get_char>
 8004a34:	b358      	cbz	r0, 8004a8e <printenv+0x72>
 8004a36:	2e02      	cmp	r6, #2
 8004a38:	d041      	beq.n	8004abe <printenv+0xa2>
 8004a3a:	4628      	mov	r0, r5
 8004a3c:	f001 fc40 	bl	80062c0 <env_get_char>
 8004a40:	f10d 0920 	add.w	r9, sp, #32
 8004a44:	b247      	sxtb	r7, r0
 8004a46:	3501      	adds	r5, #1
 8004a48:	f809 7d14 	strb.w	r7, [r9, #-20]!
 8004a4c:	2401      	movs	r4, #1
 8004a4e:	e001      	b.n	8004a54 <printenv+0x38>
 8004a50:	465d      	mov	r5, fp
 8004a52:	4654      	mov	r4, sl
 8004a54:	f104 0a01 	add.w	sl, r4, #1
 8004a58:	f105 0b01 	add.w	fp, r5, #1
 8004a5c:	b17f      	cbz	r7, 8004a7e <printenv+0x62>
 8004a5e:	4628      	mov	r0, r5
 8004a60:	f001 fc2e 	bl	80062c0 <env_get_char>
 8004a64:	ab08      	add	r3, sp, #32
 8004a66:	441c      	add	r4, r3
 8004a68:	b247      	sxtb	r7, r0
 8004a6a:	f1ba 0f10 	cmp.w	sl, #16
 8004a6e:	f804 7c14 	strb.w	r7, [r4, #-20]
 8004a72:	d1ed      	bne.n	8004a50 <printenv+0x34>
 8004a74:	2e01      	cmp	r6, #1
 8004a76:	dd0e      	ble.n	8004a96 <printenv+0x7a>
 8004a78:	f04f 0a00 	mov.w	sl, #0
 8004a7c:	e7e8      	b.n	8004a50 <printenv+0x34>
 8004a7e:	2e01      	cmp	r6, #1
 8004a80:	dd0f      	ble.n	8004aa2 <printenv+0x86>
 8004a82:	f000 fc8b 	bl	800539c <ctrlc>
 8004a86:	b9a0      	cbnz	r0, 8004ab2 <printenv+0x96>
 8004a88:	2e00      	cmp	r6, #0
 8004a8a:	d1d0      	bne.n	8004a2e <printenv+0x12>
 8004a8c:	2500      	movs	r5, #0
 8004a8e:	4628      	mov	r0, r5
 8004a90:	b008      	add	sp, #32
 8004a92:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8004a96:	4648      	mov	r0, r9
 8004a98:	f000 fc52 	bl	8005340 <puts>
 8004a9c:	f04f 0a00 	mov.w	sl, #0
 8004aa0:	e7d6      	b.n	8004a50 <printenv+0x34>
 8004aa2:	b9a4      	cbnz	r4, 8004ace <printenv+0xb2>
 8004aa4:	200a      	movs	r0, #10
 8004aa6:	f000 fc3f 	bl	8005328 <putc>
 8004aaa:	f000 fc77 	bl	800539c <ctrlc>
 8004aae:	2800      	cmp	r0, #0
 8004ab0:	d0ea      	beq.n	8004a88 <printenv+0x6c>
 8004ab2:	f04f 35ff 	mov.w	r5, #4294967295	; 0xffffffff
 8004ab6:	4628      	mov	r0, r5
 8004ab8:	b008      	add	sp, #32
 8004aba:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8004abe:	4629      	mov	r1, r5
 8004ac0:	9801      	ldr	r0, [sp, #4]
 8004ac2:	f7ff ff8d 	bl	80049e0 <envmatch>
 8004ac6:	2800      	cmp	r0, #0
 8004ac8:	bfa8      	it	ge
 8004aca:	2600      	movge	r6, #0
 8004acc:	e7b5      	b.n	8004a3a <printenv+0x1e>
 8004ace:	a803      	add	r0, sp, #12
 8004ad0:	f000 fc36 	bl	8005340 <puts>
 8004ad4:	e7e6      	b.n	8004aa4 <printenv+0x88>
 8004ad6:	bf00      	nop

08004ad8 <do_printenv>:
 8004ad8:	2a01      	cmp	r2, #1
 8004ada:	e92d 46f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r9, sl, lr}
 8004ade:	4617      	mov	r7, r2
 8004ae0:	d01d      	beq.n	8004b1e <do_printenv+0x46>
 8004ae2:	dd27      	ble.n	8004b34 <do_printenv+0x5c>
 8004ae4:	461d      	mov	r5, r3
 8004ae6:	f04f 0900 	mov.w	r9, #0
 8004aea:	2401      	movs	r4, #1
 8004aec:	f8df a058 	ldr.w	sl, [pc, #88]	; 8004b48 <do_printenv+0x70>
 8004af0:	e001      	b.n	8004af6 <do_printenv+0x1e>
 8004af2:	42a7      	cmp	r7, r4
 8004af4:	d010      	beq.n	8004b18 <do_printenv+0x40>
 8004af6:	f855 6f04 	ldr.w	r6, [r5, #4]!
 8004afa:	2102      	movs	r1, #2
 8004afc:	4630      	mov	r0, r6
 8004afe:	f7ff ff8d 	bl	8004a1c <printenv>
 8004b02:	3401      	adds	r4, #1
 8004b04:	2800      	cmp	r0, #0
 8004b06:	d0f4      	beq.n	8004af2 <do_printenv+0x1a>
 8004b08:	4631      	mov	r1, r6
 8004b0a:	4650      	mov	r0, sl
 8004b0c:	f000 fc24 	bl	8005358 <printf>
 8004b10:	42a7      	cmp	r7, r4
 8004b12:	f109 0901 	add.w	r9, r9, #1
 8004b16:	d1ee      	bne.n	8004af6 <do_printenv+0x1e>
 8004b18:	4648      	mov	r0, r9
 8004b1a:	e8bd 86f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r9, sl, pc}
 8004b1e:	4611      	mov	r1, r2
 8004b20:	2000      	movs	r0, #0
 8004b22:	f7ff ff7b 	bl	8004a1c <printenv>
 8004b26:	1e01      	subs	r1, r0, #0
 8004b28:	db09      	blt.n	8004b3e <do_printenv+0x66>
 8004b2a:	f640 72fc 	movw	r2, #4092	; 0xffc
 8004b2e:	4805      	ldr	r0, [pc, #20]	; (8004b44 <do_printenv+0x6c>)
 8004b30:	f000 fc12 	bl	8005358 <printf>
 8004b34:	f04f 0900 	mov.w	r9, #0
 8004b38:	4648      	mov	r0, r9
 8004b3a:	e8bd 86f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r9, sl, pc}
 8004b3e:	46b9      	mov	r9, r7
 8004b40:	e7ea      	b.n	8004b18 <do_printenv+0x40>
 8004b42:	bf00      	nop
 8004b44:	0800da84 	.word	0x0800da84
 8004b48:	0800daa8 	.word	0x0800daa8

08004b4c <_do_setenv>:
 8004b4c:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8004b50:	f8d8 3000 	ldr.w	r3, [r8]
 8004b54:	b086      	sub	sp, #24
 8004b56:	2000      	movs	r0, #0
 8004b58:	4689      	mov	r9, r1
 8004b5a:	9201      	str	r2, [sp, #4]
 8004b5c:	9303      	str	r3, [sp, #12]
 8004b5e:	f001 fbc7 	bl	80062f0 <env_get_addr>
 8004b62:	b158      	cbz	r0, 8004b7c <_do_setenv+0x30>
 8004b64:	9b01      	ldr	r3, [sp, #4]
 8004b66:	4607      	mov	r7, r0
 8004b68:	685e      	ldr	r6, [r3, #4]
 8004b6a:	213d      	movs	r1, #61	; 0x3d
 8004b6c:	4630      	mov	r0, r6
 8004b6e:	f7fb fc7b 	bl	8000468 <strchr>
 8004b72:	b140      	cbz	r0, 8004b86 <_do_setenv+0x3a>
 8004b74:	4631      	mov	r1, r6
 8004b76:	48b0      	ldr	r0, [pc, #704]	; (8004e38 <_do_setenv+0x2ec>)
 8004b78:	f000 fbee 	bl	8005358 <printf>
 8004b7c:	2401      	movs	r4, #1
 8004b7e:	4620      	mov	r0, r4
 8004b80:	b006      	add	sp, #24
 8004b82:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8004b86:	4aad      	ldr	r2, [pc, #692]	; (8004e3c <_do_setenv+0x2f0>)
 8004b88:	783d      	ldrb	r5, [r7, #0]
 8004b8a:	6813      	ldr	r3, [r2, #0]
 8004b8c:	46ba      	mov	sl, r7
 8004b8e:	3301      	adds	r3, #1
 8004b90:	6013      	str	r3, [r2, #0]
 8004b92:	2d00      	cmp	r5, #0
 8004b94:	f000 80bd 	beq.w	8004d12 <_do_setenv+0x1c6>
 8004b98:	4654      	mov	r4, sl
 8004b9a:	e000      	b.n	8004b9e <_do_setenv+0x52>
 8004b9c:	462c      	mov	r4, r5
 8004b9e:	7862      	ldrb	r2, [r4, #1]
 8004ba0:	1c65      	adds	r5, r4, #1
 8004ba2:	2a00      	cmp	r2, #0
 8004ba4:	d1fa      	bne.n	8004b9c <_do_setenv+0x50>
 8004ba6:	ebaa 0107 	sub.w	r1, sl, r7
 8004baa:	4630      	mov	r0, r6
 8004bac:	f7ff ff18 	bl	80049e0 <envmatch>
 8004bb0:	f1b0 0b00 	subs.w	fp, r0, #0
 8004bb4:	da04      	bge.n	8004bc0 <_do_setenv+0x74>
 8004bb6:	7869      	ldrb	r1, [r5, #1]
 8004bb8:	f104 0a02 	add.w	sl, r4, #2
 8004bbc:	2900      	cmp	r1, #0
 8004bbe:	d1eb      	bne.n	8004b98 <_do_setenv+0x4c>
 8004bc0:	499f      	ldr	r1, [pc, #636]	; (8004e40 <_do_setenv+0x2f4>)
 8004bc2:	4630      	mov	r0, r6
 8004bc4:	f7fb fc20 	bl	8000408 <strcmp>
 8004bc8:	2800      	cmp	r0, #0
 8004bca:	f040 808f 	bne.w	8004cec <_do_setenv+0x1a0>
 8004bce:	f1b9 0f02 	cmp.w	r9, #2
 8004bd2:	dd39      	ble.n	8004c48 <_do_setenv+0xfc>
 8004bd4:	9b01      	ldr	r3, [sp, #4]
 8004bd6:	6899      	ldr	r1, [r3, #8]
 8004bd8:	f000 fc18 	bl	800540c <console_assign>
 8004bdc:	2800      	cmp	r0, #0
 8004bde:	dbcd      	blt.n	8004b7c <_do_setenv+0x30>
 8004be0:	f1bb 0f00 	cmp.w	fp, #0
 8004be4:	db22      	blt.n	8004c2c <_do_setenv+0xe0>
 8004be6:	9b01      	ldr	r3, [sp, #4]
 8004be8:	4996      	ldr	r1, [pc, #600]	; (8004e44 <_do_setenv+0x2f8>)
 8004bea:	6858      	ldr	r0, [r3, #4]
 8004bec:	f7fb fc0c 	bl	8000408 <strcmp>
 8004bf0:	2800      	cmp	r0, #0
 8004bf2:	f000 80c4 	beq.w	8004d7e <_do_setenv+0x232>
 8004bf6:	786a      	ldrb	r2, [r5, #1]
 8004bf8:	2a00      	cmp	r2, #0
 8004bfa:	f000 8083 	beq.w	8004d04 <_do_setenv+0x1b8>
 8004bfe:	4651      	mov	r1, sl
 8004c00:	3501      	adds	r5, #1
 8004c02:	468a      	mov	sl, r1
 8004c04:	3501      	adds	r5, #1
 8004c06:	f801 2b01 	strb.w	r2, [r1], #1
 8004c0a:	b132      	cbz	r2, 8004c1a <_do_setenv+0xce>
 8004c0c:	782a      	ldrb	r2, [r5, #0]
 8004c0e:	468a      	mov	sl, r1
 8004c10:	3501      	adds	r5, #1
 8004c12:	f801 2b01 	strb.w	r2, [r1], #1
 8004c16:	2a00      	cmp	r2, #0
 8004c18:	d1f8      	bne.n	8004c0c <_do_setenv+0xc0>
 8004c1a:	782a      	ldrb	r2, [r5, #0]
 8004c1c:	2a00      	cmp	r2, #0
 8004c1e:	d1f0      	bne.n	8004c02 <_do_setenv+0xb6>
 8004c20:	2200      	movs	r2, #0
 8004c22:	f88a 2001 	strb.w	r2, [sl, #1]
 8004c26:	f1b9 0f02 	cmp.w	r9, #2
 8004c2a:	dd67      	ble.n	8004cfc <_do_setenv+0x1b0>
 8004c2c:	9b01      	ldr	r3, [sp, #4]
 8004c2e:	689b      	ldr	r3, [r3, #8]
 8004c30:	2b00      	cmp	r3, #0
 8004c32:	d063      	beq.n	8004cfc <_do_setenv+0x1b0>
 8004c34:	783b      	ldrb	r3, [r7, #0]
 8004c36:	463d      	mov	r5, r7
 8004c38:	b923      	cbnz	r3, 8004c44 <_do_setenv+0xf8>
 8004c3a:	786b      	ldrb	r3, [r5, #1]
 8004c3c:	b153      	cbz	r3, 8004c54 <_do_setenv+0x108>
 8004c3e:	3501      	adds	r5, #1
 8004c40:	2b00      	cmp	r3, #0
 8004c42:	d0fa      	beq.n	8004c3a <_do_setenv+0xee>
 8004c44:	786b      	ldrb	r3, [r5, #1]
 8004c46:	e7fa      	b.n	8004c3e <_do_setenv+0xf2>
 8004c48:	4631      	mov	r1, r6
 8004c4a:	487f      	ldr	r0, [pc, #508]	; (8004e48 <_do_setenv+0x2fc>)
 8004c4c:	f000 fb84 	bl	8005358 <printf>
 8004c50:	2401      	movs	r4, #1
 8004c52:	e794      	b.n	8004b7e <_do_setenv+0x32>
 8004c54:	42bd      	cmp	r5, r7
 8004c56:	4630      	mov	r0, r6
 8004c58:	bf88      	it	hi
 8004c5a:	3501      	addhi	r5, #1
 8004c5c:	f7fb fc2a 	bl	80004b4 <strlen>
 8004c60:	9b01      	ldr	r3, [sp, #4]
 8004c62:	f04f 0b02 	mov.w	fp, #2
 8004c66:	3304      	adds	r3, #4
 8004c68:	461c      	mov	r4, r3
 8004c6a:	9302      	str	r3, [sp, #8]
 8004c6c:	eb00 0a0b 	add.w	sl, r0, fp
 8004c70:	f854 0f04 	ldr.w	r0, [r4, #4]!
 8004c74:	f7fb fc1e 	bl	80004b4 <strlen>
 8004c78:	f10b 0b01 	add.w	fp, fp, #1
 8004c7c:	f10a 0301 	add.w	r3, sl, #1
 8004c80:	45d9      	cmp	r9, fp
 8004c82:	eb03 0a00 	add.w	sl, r3, r0
 8004c86:	dcf3      	bgt.n	8004c70 <_do_setenv+0x124>
 8004c88:	f607 72fc 	addw	r2, r7, #4092	; 0xffc
 8004c8c:	1b52      	subs	r2, r2, r5
 8004c8e:	4592      	cmp	sl, r2
 8004c90:	dc6f      	bgt.n	8004d72 <_do_setenv+0x226>
 8004c92:	7833      	ldrb	r3, [r6, #0]
 8004c94:	3601      	adds	r6, #1
 8004c96:	702b      	strb	r3, [r5, #0]
 8004c98:	b13b      	cbz	r3, 8004caa <_do_setenv+0x15e>
 8004c9a:	1c6b      	adds	r3, r5, #1
 8004c9c:	f816 2b01 	ldrb.w	r2, [r6], #1
 8004ca0:	461d      	mov	r5, r3
 8004ca2:	f803 2b01 	strb.w	r2, [r3], #1
 8004ca6:	2a00      	cmp	r2, #0
 8004ca8:	d1f8      	bne.n	8004c9c <_do_setenv+0x150>
 8004caa:	2002      	movs	r0, #2
 8004cac:	2802      	cmp	r0, #2
 8004cae:	462b      	mov	r3, r5
 8004cb0:	bf14      	ite	ne
 8004cb2:	2220      	movne	r2, #32
 8004cb4:	223d      	moveq	r2, #61	; 0x3d
 8004cb6:	9c02      	ldr	r4, [sp, #8]
 8004cb8:	f854 1f04 	ldr.w	r1, [r4, #4]!
 8004cbc:	f803 2b01 	strb.w	r2, [r3], #1
 8004cc0:	9402      	str	r4, [sp, #8]
 8004cc2:	f811 2b01 	ldrb.w	r2, [r1], #1
 8004cc6:	461d      	mov	r5, r3
 8004cc8:	f803 2b01 	strb.w	r2, [r3], #1
 8004ccc:	2a00      	cmp	r2, #0
 8004cce:	d1f8      	bne.n	8004cc2 <_do_setenv+0x176>
 8004cd0:	3001      	adds	r0, #1
 8004cd2:	4581      	cmp	r9, r0
 8004cd4:	dcea      	bgt.n	8004cac <_do_setenv+0x160>
 8004cd6:	706a      	strb	r2, [r5, #1]
 8004cd8:	f001 fad8 	bl	800628c <env_crc_update>
 8004cdc:	9b01      	ldr	r3, [sp, #4]
 8004cde:	495b      	ldr	r1, [pc, #364]	; (8004e4c <_do_setenv+0x300>)
 8004ce0:	6858      	ldr	r0, [r3, #4]
 8004ce2:	f7fb fb91 	bl	8000408 <strcmp>
 8004ce6:	b9b8      	cbnz	r0, 8004d18 <_do_setenv+0x1cc>
 8004ce8:	2400      	movs	r4, #0
 8004cea:	e748      	b.n	8004b7e <_do_setenv+0x32>
 8004cec:	4958      	ldr	r1, [pc, #352]	; (8004e50 <_do_setenv+0x304>)
 8004cee:	4630      	mov	r0, r6
 8004cf0:	f7fb fb8a 	bl	8000408 <strcmp>
 8004cf4:	2800      	cmp	r0, #0
 8004cf6:	d15e      	bne.n	8004db6 <_do_setenv+0x26a>
 8004cf8:	2001      	movs	r0, #1
 8004cfa:	e768      	b.n	8004bce <_do_setenv+0x82>
 8004cfc:	f001 fac6 	bl	800628c <env_crc_update>
 8004d00:	2400      	movs	r4, #0
 8004d02:	e73c      	b.n	8004b7e <_do_setenv+0x32>
 8004d04:	4557      	cmp	r7, sl
 8004d06:	bf34      	ite	cc
 8004d08:	f10a 3aff 	addcc.w	sl, sl, #4294967295	; 0xffffffff
 8004d0c:	f88a 2000 	strbcs.w	r2, [sl]
 8004d10:	e786      	b.n	8004c20 <_do_setenv+0xd4>
 8004d12:	f04f 3bff 	mov.w	fp, #4294967295	; 0xffffffff
 8004d16:	e753      	b.n	8004bc0 <_do_setenv+0x74>
 8004d18:	9d01      	ldr	r5, [sp, #4]
 8004d1a:	494e      	ldr	r1, [pc, #312]	; (8004e54 <_do_setenv+0x308>)
 8004d1c:	6868      	ldr	r0, [r5, #4]
 8004d1e:	f7fb fb73 	bl	8000408 <strcmp>
 8004d22:	4604      	mov	r4, r0
 8004d24:	2800      	cmp	r0, #0
 8004d26:	d167      	bne.n	8004df8 <_do_setenv+0x2ac>
 8004d28:	68ab      	ldr	r3, [r5, #8]
 8004d2a:	9a03      	ldr	r2, [sp, #12]
 8004d2c:	4606      	mov	r6, r0
 8004d2e:	6050      	str	r0, [r2, #4]
 8004d30:	4605      	mov	r5, r0
 8004d32:	b193      	cbz	r3, 8004d5a <_do_setenv+0x20e>
 8004d34:	4618      	mov	r0, r3
 8004d36:	220a      	movs	r2, #10
 8004d38:	a905      	add	r1, sp, #20
 8004d3a:	f003 fdcd 	bl	80088d8 <simple_strtoul>
 8004d3e:	9b05      	ldr	r3, [sp, #20]
 8004d40:	b2c0      	uxtb	r0, r0
 8004d42:	f993 2000 	ldrsb.w	r2, [r3]
 8004d46:	ea40 2505 	orr.w	r5, r0, r5, lsl #8
 8004d4a:	3601      	adds	r6, #1
 8004d4c:	b172      	cbz	r2, 8004d6c <_do_setenv+0x220>
 8004d4e:	2e04      	cmp	r6, #4
 8004d50:	f103 0301 	add.w	r3, r3, #1
 8004d54:	d006      	beq.n	8004d64 <_do_setenv+0x218>
 8004d56:	2b00      	cmp	r3, #0
 8004d58:	d1ec      	bne.n	8004d34 <_do_setenv+0x1e8>
 8004d5a:	3601      	adds	r6, #1
 8004d5c:	2e04      	cmp	r6, #4
 8004d5e:	ea4f 2505 	mov.w	r5, r5, lsl #8
 8004d62:	d1fa      	bne.n	8004d5a <_do_setenv+0x20e>
 8004d64:	9b03      	ldr	r3, [sp, #12]
 8004d66:	ba2d      	rev	r5, r5
 8004d68:	605d      	str	r5, [r3, #4]
 8004d6a:	e708      	b.n	8004b7e <_do_setenv+0x32>
 8004d6c:	2e04      	cmp	r6, #4
 8004d6e:	d1e1      	bne.n	8004d34 <_do_setenv+0x1e8>
 8004d70:	e7f8      	b.n	8004d64 <_do_setenv+0x218>
 8004d72:	4631      	mov	r1, r6
 8004d74:	4838      	ldr	r0, [pc, #224]	; (8004e58 <_do_setenv+0x30c>)
 8004d76:	f000 faef 	bl	8005358 <printf>
 8004d7a:	2401      	movs	r4, #1
 8004d7c:	e6ff      	b.n	8004b7e <_do_setenv+0x32>
 8004d7e:	9b01      	ldr	r3, [sp, #4]
 8004d80:	4601      	mov	r1, r0
 8004d82:	220a      	movs	r2, #10
 8004d84:	6898      	ldr	r0, [r3, #8]
 8004d86:	f003 fda7 	bl	80088d8 <simple_strtoul>
 8004d8a:	f5b0 5f16 	cmp.w	r0, #9600	; 0x2580
 8004d8e:	4604      	mov	r4, r0
 8004d90:	d01d      	beq.n	8004dce <_do_setenv+0x282>
 8004d92:	f5b0 4f96 	cmp.w	r0, #19200	; 0x4b00
 8004d96:	d01a      	beq.n	8004dce <_do_setenv+0x282>
 8004d98:	f5b0 4f16 	cmp.w	r0, #38400	; 0x9600
 8004d9c:	d017      	beq.n	8004dce <_do_setenv+0x282>
 8004d9e:	f5b0 4f61 	cmp.w	r0, #57600	; 0xe100
 8004da2:	d014      	beq.n	8004dce <_do_setenv+0x282>
 8004da4:	f5b0 3fe1 	cmp.w	r0, #115200	; 0x1c200
 8004da8:	d011      	beq.n	8004dce <_do_setenv+0x282>
 8004daa:	4601      	mov	r1, r0
 8004dac:	482b      	ldr	r0, [pc, #172]	; (8004e5c <_do_setenv+0x310>)
 8004dae:	f000 fad3 	bl	8005358 <printf>
 8004db2:	2401      	movs	r4, #1
 8004db4:	e6e3      	b.n	8004b7e <_do_setenv+0x32>
 8004db6:	492a      	ldr	r1, [pc, #168]	; (8004e60 <_do_setenv+0x314>)
 8004db8:	4630      	mov	r0, r6
 8004dba:	f7fb fb25 	bl	8000408 <strcmp>
 8004dbe:	b908      	cbnz	r0, 8004dc4 <_do_setenv+0x278>
 8004dc0:	2002      	movs	r0, #2
 8004dc2:	e704      	b.n	8004bce <_do_setenv+0x82>
 8004dc4:	f1bb 0f00 	cmp.w	fp, #0
 8004dc8:	f6bf af0d 	bge.w	8004be6 <_do_setenv+0x9a>
 8004dcc:	e72b      	b.n	8004c26 <_do_setenv+0xda>
 8004dce:	4621      	mov	r1, r4
 8004dd0:	4824      	ldr	r0, [pc, #144]	; (8004e64 <_do_setenv+0x318>)
 8004dd2:	f000 fac1 	bl	8005358 <printf>
 8004dd6:	f24c 3050 	movw	r0, #50000	; 0xc350
 8004dda:	f003 fb55 	bl	8008488 <udelay>
 8004dde:	f8c8 4008 	str.w	r4, [r8, #8]
 8004de2:	f7fd ffcf 	bl	8002d84 <serial_setbrg>
 8004de6:	f24c 3050 	movw	r0, #50000	; 0xc350
 8004dea:	f003 fb4d 	bl	8008488 <udelay>
 8004dee:	f000 fa83 	bl	80052f8 <getc>
 8004df2:	280d      	cmp	r0, #13
 8004df4:	d1fb      	bne.n	8004dee <_do_setenv+0x2a2>
 8004df6:	e6fe      	b.n	8004bf6 <_do_setenv+0xaa>
 8004df8:	9b01      	ldr	r3, [sp, #4]
 8004dfa:	491b      	ldr	r1, [pc, #108]	; (8004e68 <_do_setenv+0x31c>)
 8004dfc:	6858      	ldr	r0, [r3, #4]
 8004dfe:	f7fb fb03 	bl	8000408 <strcmp>
 8004e02:	4604      	mov	r4, r0
 8004e04:	b178      	cbz	r0, 8004e26 <_do_setenv+0x2da>
 8004e06:	9b01      	ldr	r3, [sp, #4]
 8004e08:	4918      	ldr	r1, [pc, #96]	; (8004e6c <_do_setenv+0x320>)
 8004e0a:	6858      	ldr	r0, [r3, #4]
 8004e0c:	f7fb fafc 	bl	8000408 <strcmp>
 8004e10:	4604      	mov	r4, r0
 8004e12:	2800      	cmp	r0, #0
 8004e14:	f47f af68 	bne.w	8004ce8 <_do_setenv+0x19c>
 8004e18:	9b01      	ldr	r3, [sp, #4]
 8004e1a:	2280      	movs	r2, #128	; 0x80
 8004e1c:	6899      	ldr	r1, [r3, #8]
 8004e1e:	4814      	ldr	r0, [pc, #80]	; (8004e70 <_do_setenv+0x324>)
 8004e20:	f7fd f832 	bl	8001e88 <copy_filename>
 8004e24:	e6ab      	b.n	8004b7e <_do_setenv+0x32>
 8004e26:	9b01      	ldr	r3, [sp, #4]
 8004e28:	2210      	movs	r2, #16
 8004e2a:	6898      	ldr	r0, [r3, #8]
 8004e2c:	4621      	mov	r1, r4
 8004e2e:	f003 fd53 	bl	80088d8 <simple_strtoul>
 8004e32:	4b10      	ldr	r3, [pc, #64]	; (8004e74 <_do_setenv+0x328>)
 8004e34:	6018      	str	r0, [r3, #0]
 8004e36:	e6a2      	b.n	8004b7e <_do_setenv+0x32>
 8004e38:	0800dac4 	.word	0x0800dac4
 8004e3c:	200000ec 	.word	0x200000ec
 8004e40:	0800dafc 	.word	0x0800dafc
 8004e44:	0800c428 	.word	0x0800c428
 8004e48:	0800db14 	.word	0x0800db14
 8004e4c:	0800c7b8 	.word	0x0800c7b8
 8004e50:	0800db04 	.word	0x0800db04
 8004e54:	0800c460 	.word	0x0800c460
 8004e58:	0800db4c 	.word	0x0800db4c
 8004e5c:	0800db28 	.word	0x0800db28
 8004e60:	0800db0c 	.word	0x0800db0c
 8004e64:	0800d434 	.word	0x0800d434
 8004e68:	0800c468 	.word	0x0800c468
 8004e6c:	0800c474 	.word	0x0800c474
 8004e70:	200031cc 	.word	0x200031cc
 8004e74:	20000058 	.word	0x20000058

08004e78 <setenv>:
 8004e78:	2300      	movs	r3, #0
 8004e7a:	b500      	push	{lr}
 8004e7c:	4a0c      	ldr	r2, [pc, #48]	; (8004eb0 <setenv+0x38>)
 8004e7e:	b085      	sub	sp, #20
 8004e80:	9102      	str	r1, [sp, #8]
 8004e82:	9001      	str	r0, [sp, #4]
 8004e84:	9303      	str	r3, [sp, #12]
 8004e86:	9200      	str	r2, [sp, #0]
 8004e88:	b111      	cbz	r1, 8004e90 <setenv+0x18>
 8004e8a:	f991 2000 	ldrsb.w	r2, [r1]
 8004e8e:	b93a      	cbnz	r2, 8004ea0 <setenv+0x28>
 8004e90:	466a      	mov	r2, sp
 8004e92:	2102      	movs	r1, #2
 8004e94:	2000      	movs	r0, #0
 8004e96:	f7ff fe59 	bl	8004b4c <_do_setenv>
 8004e9a:	b005      	add	sp, #20
 8004e9c:	f85d fb04 	ldr.w	pc, [sp], #4
 8004ea0:	4618      	mov	r0, r3
 8004ea2:	466a      	mov	r2, sp
 8004ea4:	2103      	movs	r1, #3
 8004ea6:	f7ff fe51 	bl	8004b4c <_do_setenv>
 8004eaa:	b005      	add	sp, #20
 8004eac:	f85d fb04 	ldr.w	pc, [sp], #4
 8004eb0:	0800db7c 	.word	0x0800db7c

08004eb4 <do_setenv>:
 8004eb4:	2a01      	cmp	r2, #1
 8004eb6:	b538      	push	{r3, r4, r5, lr}
 8004eb8:	dd08      	ble.n	8004ecc <do_setenv+0x18>
 8004eba:	4614      	mov	r4, r2
 8004ebc:	460d      	mov	r5, r1
 8004ebe:	461a      	mov	r2, r3
 8004ec0:	4621      	mov	r1, r4
 8004ec2:	4628      	mov	r0, r5
 8004ec4:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8004ec8:	f7ff be40 	b.w	8004b4c <_do_setenv>
 8004ecc:	f000 f95a 	bl	8005184 <cmd_usage>
 8004ed0:	2001      	movs	r0, #1
 8004ed2:	bd38      	pop	{r3, r4, r5, pc}

08004ed4 <getenv>:
 8004ed4:	b570      	push	{r4, r5, r6, lr}
 8004ed6:	4606      	mov	r6, r0
 8004ed8:	2500      	movs	r5, #0
 8004eda:	4628      	mov	r0, r5
 8004edc:	f001 f9f0 	bl	80062c0 <env_get_char>
 8004ee0:	b190      	cbz	r0, 8004f08 <getenv+0x34>
 8004ee2:	462c      	mov	r4, r5
 8004ee4:	e003      	b.n	8004eee <getenv+0x1a>
 8004ee6:	f5b4 5f80 	cmp.w	r4, #4096	; 0x1000
 8004eea:	da0d      	bge.n	8004f08 <getenv+0x34>
 8004eec:	3401      	adds	r4, #1
 8004eee:	4620      	mov	r0, r4
 8004ef0:	f001 f9e6 	bl	80062c0 <env_get_char>
 8004ef4:	2800      	cmp	r0, #0
 8004ef6:	d1f6      	bne.n	8004ee6 <getenv+0x12>
 8004ef8:	4629      	mov	r1, r5
 8004efa:	4630      	mov	r0, r6
 8004efc:	f7ff fd70 	bl	80049e0 <envmatch>
 8004f00:	2800      	cmp	r0, #0
 8004f02:	da03      	bge.n	8004f0c <getenv+0x38>
 8004f04:	1c65      	adds	r5, r4, #1
 8004f06:	e7e8      	b.n	8004eda <getenv+0x6>
 8004f08:	2000      	movs	r0, #0
 8004f0a:	bd70      	pop	{r4, r5, r6, pc}
 8004f0c:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8004f10:	f001 b9ee 	b.w	80062f0 <env_get_addr>

08004f14 <getenv_r>:
 8004f14:	e92d 46f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r9, sl, lr}
 8004f18:	4682      	mov	sl, r0
 8004f1a:	460f      	mov	r7, r1
 8004f1c:	4616      	mov	r6, r2
 8004f1e:	f04f 0900 	mov.w	r9, #0
 8004f22:	4648      	mov	r0, r9
 8004f24:	f001 f9cc 	bl	80062c0 <env_get_char>
 8004f28:	b348      	cbz	r0, 8004f7e <getenv_r+0x6a>
 8004f2a:	464c      	mov	r4, r9
 8004f2c:	e003      	b.n	8004f36 <getenv_r+0x22>
 8004f2e:	f5b4 5f80 	cmp.w	r4, #4096	; 0x1000
 8004f32:	da24      	bge.n	8004f7e <getenv_r+0x6a>
 8004f34:	3401      	adds	r4, #1
 8004f36:	4620      	mov	r0, r4
 8004f38:	f001 f9c2 	bl	80062c0 <env_get_char>
 8004f3c:	4605      	mov	r5, r0
 8004f3e:	2800      	cmp	r0, #0
 8004f40:	d1f5      	bne.n	8004f2e <getenv_r+0x1a>
 8004f42:	4649      	mov	r1, r9
 8004f44:	4650      	mov	r0, sl
 8004f46:	f7ff fd4b 	bl	80049e0 <envmatch>
 8004f4a:	2800      	cmp	r0, #0
 8004f4c:	db1c      	blt.n	8004f88 <getenv_r+0x74>
 8004f4e:	463c      	mov	r4, r7
 8004f50:	eba0 0907 	sub.w	r9, r0, r7
 8004f54:	4437      	add	r7, r6
 8004f56:	e005      	b.n	8004f64 <getenv_r+0x50>
 8004f58:	f001 f9b2 	bl	80062c0 <env_get_char>
 8004f5c:	b240      	sxtb	r0, r0
 8004f5e:	f804 0b01 	strb.w	r0, [r4], #1
 8004f62:	b128      	cbz	r0, 8004f70 <getenv_r+0x5c>
 8004f64:	42bc      	cmp	r4, r7
 8004f66:	f105 0501 	add.w	r5, r5, #1
 8004f6a:	eb04 0009 	add.w	r0, r4, r9
 8004f6e:	d1f3      	bne.n	8004f58 <getenv_r+0x44>
 8004f70:	42ae      	cmp	r6, r5
 8004f72:	d106      	bne.n	8004f82 <getenv_r+0x6e>
 8004f74:	2300      	movs	r3, #0
 8004f76:	7023      	strb	r3, [r4, #0]
 8004f78:	4628      	mov	r0, r5
 8004f7a:	e8bd 86f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r9, sl, pc}
 8004f7e:	f04f 35ff 	mov.w	r5, #4294967295	; 0xffffffff
 8004f82:	4628      	mov	r0, r5
 8004f84:	e8bd 86f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r9, sl, pc}
 8004f88:	f104 0901 	add.w	r9, r4, #1
 8004f8c:	e7c9      	b.n	8004f22 <getenv_r+0xe>
 8004f8e:	bf00      	nop

08004f90 <do_version>:
 8004f90:	b508      	push	{r3, lr}
 8004f92:	4903      	ldr	r1, [pc, #12]	; (8004fa0 <do_version+0x10>)
 8004f94:	4803      	ldr	r0, [pc, #12]	; (8004fa4 <do_version+0x14>)
 8004f96:	f000 f9df 	bl	8005358 <printf>
 8004f9a:	2000      	movs	r0, #0
 8004f9c:	bd08      	pop	{r3, pc}
 8004f9e:	bf00      	nop
 8004fa0:	0800c3e0 	.word	0x0800c3e0
 8004fa4:	0800dc30 	.word	0x0800dc30

08004fa8 <find_cmd_tbl>:
 8004fa8:	e92d 46f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r9, sl, lr}
 8004fac:	460c      	mov	r4, r1
 8004fae:	212e      	movs	r1, #46	; 0x2e
 8004fb0:	4607      	mov	r7, r0
 8004fb2:	4616      	mov	r6, r2
 8004fb4:	f7fb fa58 	bl	8000468 <strchr>
 8004fb8:	1bc5      	subs	r5, r0, r7
 8004fba:	b348      	cbz	r0, 8005010 <find_cmd_tbl+0x68>
 8004fbc:	eb06 0686 	add.w	r6, r6, r6, lsl #2
 8004fc0:	eb04 0686 	add.w	r6, r4, r6, lsl #2
 8004fc4:	42b4      	cmp	r4, r6
 8004fc6:	d01e      	beq.n	8005006 <find_cmd_tbl+0x5e>
 8004fc8:	46a2      	mov	sl, r4
 8004fca:	f04f 0900 	mov.w	r9, #0
 8004fce:	e002      	b.n	8004fd6 <find_cmd_tbl+0x2e>
 8004fd0:	3414      	adds	r4, #20
 8004fd2:	42b4      	cmp	r4, r6
 8004fd4:	d011      	beq.n	8004ffa <find_cmd_tbl+0x52>
 8004fd6:	462a      	mov	r2, r5
 8004fd8:	6821      	ldr	r1, [r4, #0]
 8004fda:	4638      	mov	r0, r7
 8004fdc:	f7fb fa22 	bl	8000424 <strncmp>
 8004fe0:	2800      	cmp	r0, #0
 8004fe2:	d1f5      	bne.n	8004fd0 <find_cmd_tbl+0x28>
 8004fe4:	6820      	ldr	r0, [r4, #0]
 8004fe6:	f7fb fa65 	bl	80004b4 <strlen>
 8004fea:	4285      	cmp	r5, r0
 8004fec:	46a2      	mov	sl, r4
 8004fee:	d007      	beq.n	8005000 <find_cmd_tbl+0x58>
 8004ff0:	3414      	adds	r4, #20
 8004ff2:	42b4      	cmp	r4, r6
 8004ff4:	f109 0901 	add.w	r9, r9, #1
 8004ff8:	d1ed      	bne.n	8004fd6 <find_cmd_tbl+0x2e>
 8004ffa:	f1b9 0f01 	cmp.w	r9, #1
 8004ffe:	d102      	bne.n	8005006 <find_cmd_tbl+0x5e>
 8005000:	4650      	mov	r0, sl
 8005002:	e8bd 86f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r9, sl, pc}
 8005006:	f04f 0a00 	mov.w	sl, #0
 800500a:	4650      	mov	r0, sl
 800500c:	e8bd 86f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r9, sl, pc}
 8005010:	4638      	mov	r0, r7
 8005012:	f7fb fa4f 	bl	80004b4 <strlen>
 8005016:	4605      	mov	r5, r0
 8005018:	e7d0      	b.n	8004fbc <find_cmd_tbl+0x14>
 800501a:	bf00      	nop

0800501c <_do_help>:
 800501c:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8005020:	b084      	sub	sp, #16
 8005022:	af00      	add	r7, sp, #0
 8005024:	f8d7 a030 	ldr.w	sl, [r7, #48]	; 0x30
 8005028:	4606      	mov	r6, r0
 800502a:	f1ba 0f01 	cmp.w	sl, #1
 800502e:	60f9      	str	r1, [r7, #12]
 8005030:	d02a      	beq.n	8005088 <_do_help+0x6c>
 8005032:	f04f 0300 	mov.w	r3, #0
 8005036:	4699      	mov	r9, r3
 8005038:	dd21      	ble.n	800507e <_do_help+0x62>
 800503a:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 800503c:	2501      	movs	r5, #1
 800503e:	f8df b11c 	ldr.w	fp, [pc, #284]	; 800515c <_do_help+0x140>
 8005042:	1d1c      	adds	r4, r3, #4
 8005044:	e009      	b.n	800505a <_do_help+0x3e>
 8005046:	6902      	ldr	r2, [r0, #16]
 8005048:	6801      	ldr	r1, [r0, #0]
 800504a:	3501      	adds	r5, #1
 800504c:	4658      	mov	r0, fp
 800504e:	f000 f983 	bl	8005358 <printf>
 8005052:	45aa      	cmp	sl, r5
 8005054:	f104 0404 	add.w	r4, r4, #4
 8005058:	d011      	beq.n	800507e <_do_help+0x62>
 800505a:	68fa      	ldr	r2, [r7, #12]
 800505c:	4631      	mov	r1, r6
 800505e:	6820      	ldr	r0, [r4, #0]
 8005060:	f7ff ffa2 	bl	8004fa8 <find_cmd_tbl>
 8005064:	2800      	cmp	r0, #0
 8005066:	d1ee      	bne.n	8005046 <_do_help+0x2a>
 8005068:	6821      	ldr	r1, [r4, #0]
 800506a:	483b      	ldr	r0, [pc, #236]	; (8005158 <_do_help+0x13c>)
 800506c:	f000 f974 	bl	8005358 <printf>
 8005070:	2301      	movs	r3, #1
 8005072:	3501      	adds	r5, #1
 8005074:	45aa      	cmp	sl, r5
 8005076:	4699      	mov	r9, r3
 8005078:	f104 0404 	add.w	r4, r4, #4
 800507c:	d1ed      	bne.n	800505a <_do_help+0x3e>
 800507e:	4648      	mov	r0, r9
 8005080:	3710      	adds	r7, #16
 8005082:	46bd      	mov	sp, r7
 8005084:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8005088:	68fa      	ldr	r2, [r7, #12]
 800508a:	f8c7 d004 	str.w	sp, [r7, #4]
 800508e:	0093      	lsls	r3, r2, #2
 8005090:	330a      	adds	r3, #10
 8005092:	f023 0307 	bic.w	r3, r3, #7
 8005096:	ebad 0d03 	sub.w	sp, sp, r3
 800509a:	2a00      	cmp	r2, #0
 800509c:	f8c7 d008 	str.w	sp, [r7, #8]
 80050a0:	f102 3aff 	add.w	sl, r2, #4294967295	; 0xffffffff
 80050a4:	dd51      	ble.n	800514a <_do_help+0x12e>
 80050a6:	f1ad 0204 	sub.w	r2, sp, #4
 80050aa:	4611      	mov	r1, r2
 80050ac:	2300      	movs	r3, #0
 80050ae:	68f8      	ldr	r0, [r7, #12]
 80050b0:	3301      	adds	r3, #1
 80050b2:	4298      	cmp	r0, r3
 80050b4:	f841 6f04 	str.w	r6, [r1, #4]!
 80050b8:	f106 0614 	add.w	r6, r6, #20
 80050bc:	d1f7      	bne.n	80050ae <_do_help+0x92>
 80050be:	f1ba 0f00 	cmp.w	sl, #0
 80050c2:	dd1f      	ble.n	8005104 <_do_help+0xe8>
 80050c4:	2600      	movs	r6, #0
 80050c6:	4635      	mov	r5, r6
 80050c8:	68bc      	ldr	r4, [r7, #8]
 80050ca:	f8d4 b000 	ldr.w	fp, [r4]
 80050ce:	f8d4 9004 	ldr.w	r9, [r4, #4]
 80050d2:	f8db 0000 	ldr.w	r0, [fp]
 80050d6:	f8d9 1000 	ldr.w	r1, [r9]
 80050da:	f7fb f995 	bl	8000408 <strcmp>
 80050de:	3501      	adds	r5, #1
 80050e0:	2800      	cmp	r0, #0
 80050e2:	bfc4      	itt	gt
 80050e4:	e884 0a00 	stmiagt.w	r4, {r9, fp}
 80050e8:	3601      	addgt	r6, #1
 80050ea:	4555      	cmp	r5, sl
 80050ec:	f104 0404 	add.w	r4, r4, #4
 80050f0:	dbeb      	blt.n	80050ca <_do_help+0xae>
 80050f2:	b116      	cbz	r6, 80050fa <_do_help+0xde>
 80050f4:	f1ba 0a01 	subs.w	sl, sl, #1
 80050f8:	d1e4      	bne.n	80050c4 <_do_help+0xa8>
 80050fa:	68fb      	ldr	r3, [r7, #12]
 80050fc:	2b00      	cmp	r3, #0
 80050fe:	dd27      	ble.n	8005150 <_do_help+0x134>
 8005100:	68bb      	ldr	r3, [r7, #8]
 8005102:	1f1a      	subs	r2, r3, #4
 8005104:	4616      	mov	r6, r2
 8005106:	2400      	movs	r4, #0
 8005108:	f8df a054 	ldr.w	sl, [pc, #84]	; 8005160 <_do_help+0x144>
 800510c:	e00b      	b.n	8005126 <_do_help+0x10a>
 800510e:	f1bb 0f00 	cmp.w	fp, #0
 8005112:	d005      	beq.n	8005120 <_do_help+0x104>
 8005114:	465b      	mov	r3, fp
 8005116:	682a      	ldr	r2, [r5, #0]
 8005118:	2108      	movs	r1, #8
 800511a:	4650      	mov	r0, sl
 800511c:	f000 f91c 	bl	8005358 <printf>
 8005120:	68fb      	ldr	r3, [r7, #12]
 8005122:	42a3      	cmp	r3, r4
 8005124:	dd14      	ble.n	8005150 <_do_help+0x134>
 8005126:	f856 5f04 	ldr.w	r5, [r6, #4]!
 800512a:	3401      	adds	r4, #1
 800512c:	f8d5 b010 	ldr.w	fp, [r5, #16]
 8005130:	f000 f934 	bl	800539c <ctrlc>
 8005134:	2800      	cmp	r0, #0
 8005136:	d0ea      	beq.n	800510e <_do_help+0xf2>
 8005138:	2301      	movs	r3, #1
 800513a:	4699      	mov	r9, r3
 800513c:	4648      	mov	r0, r9
 800513e:	f8d7 d004 	ldr.w	sp, [r7, #4]
 8005142:	3710      	adds	r7, #16
 8005144:	46bd      	mov	sp, r7
 8005146:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 800514a:	f1ba 0f00 	cmp.w	sl, #0
 800514e:	dcb9      	bgt.n	80050c4 <_do_help+0xa8>
 8005150:	2300      	movs	r3, #0
 8005152:	4699      	mov	r9, r3
 8005154:	e7f2      	b.n	800513c <_do_help+0x120>
 8005156:	bf00      	nop
 8005158:	0800dcc8 	.word	0x0800dcc8
 800515c:	0800dcbc 	.word	0x0800dcbc
 8005160:	0800dcb0 	.word	0x0800dcb0

08005164 <find_cmd>:
 8005164:	4b04      	ldr	r3, [pc, #16]	; (8005178 <find_cmd+0x14>)
 8005166:	4905      	ldr	r1, [pc, #20]	; (800517c <find_cmd+0x18>)
 8005168:	4a05      	ldr	r2, [pc, #20]	; (8005180 <find_cmd+0x1c>)
 800516a:	1a5b      	subs	r3, r3, r1
 800516c:	109b      	asrs	r3, r3, #2
 800516e:	fb02 f203 	mul.w	r2, r2, r3
 8005172:	f7ff bf19 	b.w	8004fa8 <find_cmd_tbl>
 8005176:	bf00      	nop
 8005178:	08010ac4 	.word	0x08010ac4
 800517c:	080108a8 	.word	0x080108a8
 8005180:	cccccccd 	.word	0xcccccccd

08005184 <cmd_usage>:
 8005184:	b508      	push	{r3, lr}
 8005186:	4603      	mov	r3, r0
 8005188:	4803      	ldr	r0, [pc, #12]	; (8005198 <cmd_usage+0x14>)
 800518a:	691a      	ldr	r2, [r3, #16]
 800518c:	6819      	ldr	r1, [r3, #0]
 800518e:	f000 f8e3 	bl	8005358 <printf>
 8005192:	2000      	movs	r0, #0
 8005194:	bd08      	pop	{r3, pc}
 8005196:	bf00      	nop
 8005198:	0800dcbc 	.word	0x0800dcbc

0800519c <cmd_get_data_size>:
 800519c:	b538      	push	{r3, r4, r5, lr}
 800519e:	460d      	mov	r5, r1
 80051a0:	4604      	mov	r4, r0
 80051a2:	f7fb f987 	bl	80004b4 <strlen>
 80051a6:	2802      	cmp	r0, #2
 80051a8:	dd04      	ble.n	80051b4 <cmd_get_data_size+0x18>
 80051aa:	4404      	add	r4, r0
 80051ac:	f914 3c02 	ldrsb.w	r3, [r4, #-2]
 80051b0:	2b2e      	cmp	r3, #46	; 0x2e
 80051b2:	d001      	beq.n	80051b8 <cmd_get_data_size+0x1c>
 80051b4:	4628      	mov	r0, r5
 80051b6:	bd38      	pop	{r3, r4, r5, pc}
 80051b8:	f814 3c01 	ldrb.w	r3, [r4, #-1]
 80051bc:	3b62      	subs	r3, #98	; 0x62
 80051be:	b2db      	uxtb	r3, r3
 80051c0:	2b15      	cmp	r3, #21
 80051c2:	bf8e      	itee	hi
 80051c4:	f04f 35ff 	movhi.w	r5, #4294967295	; 0xffffffff
 80051c8:	4a02      	ldrls	r2, [pc, #8]	; (80051d4 <cmd_get_data_size+0x38>)
 80051ca:	f852 5023 	ldrls.w	r5, [r2, r3, lsl #2]
 80051ce:	4628      	mov	r0, r5
 80051d0:	bd38      	pop	{r3, r4, r5, pc}
 80051d2:	bf00      	nop
 80051d4:	0800dc58 	.word	0x0800dc58

080051d8 <console_setfile>:
 80051d8:	b339      	cbz	r1, 800522a <console_setfile+0x52>
 80051da:	2802      	cmp	r0, #2
 80051dc:	d825      	bhi.n	800522a <console_setfile+0x52>
 80051de:	b538      	push	{r3, r4, r5, lr}
 80051e0:	4605      	mov	r5, r0
 80051e2:	6988      	ldr	r0, [r1, #24]
 80051e4:	460c      	mov	r4, r1
 80051e6:	b110      	cbz	r0, 80051ee <console_setfile+0x16>
 80051e8:	4780      	blx	r0
 80051ea:	2800      	cmp	r0, #0
 80051ec:	db12      	blt.n	8005214 <console_setfile+0x3c>
 80051ee:	4b10      	ldr	r3, [pc, #64]	; (8005230 <console_setfile+0x58>)
 80051f0:	f843 4025 	str.w	r4, [r3, r5, lsl #2]
 80051f4:	b185      	cbz	r5, 8005218 <console_setfile+0x40>
 80051f6:	2d01      	cmp	r5, #1
 80051f8:	d10d      	bne.n	8005216 <console_setfile+0x3e>
 80051fa:	f8d8 101c 	ldr.w	r1, [r8, #28]
 80051fe:	6a25      	ldr	r5, [r4, #32]
 8005200:	4a0c      	ldr	r2, [pc, #48]	; (8005234 <console_setfile+0x5c>)
 8005202:	60cd      	str	r5, [r1, #12]
 8005204:	f8d8 101c 	ldr.w	r1, [r8, #28]
 8005208:	6a64      	ldr	r4, [r4, #36]	; 0x24
 800520a:	610c      	str	r4, [r1, #16]
 800520c:	f8d8 301c 	ldr.w	r3, [r8, #28]
 8005210:	615a      	str	r2, [r3, #20]
 8005212:	bd38      	pop	{r3, r4, r5, pc}
 8005214:	bd38      	pop	{r3, r4, r5, pc}
 8005216:	bd38      	pop	{r3, r4, r5, pc}
 8005218:	f8d8 201c 	ldr.w	r2, [r8, #28]
 800521c:	6ae1      	ldr	r1, [r4, #44]	; 0x2c
 800521e:	6051      	str	r1, [r2, #4]
 8005220:	f8d8 301c 	ldr.w	r3, [r8, #28]
 8005224:	6aa2      	ldr	r2, [r4, #40]	; 0x28
 8005226:	609a      	str	r2, [r3, #8]
 8005228:	bd38      	pop	{r3, r4, r5, pc}
 800522a:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 800522e:	4770      	bx	lr
 8005230:	200037c4 	.word	0x200037c4
 8005234:	08005359 	.word	0x08005359

08005238 <serial_printf>:
 8005238:	b40f      	push	{r0, r1, r2, r3}
 800523a:	b500      	push	{lr}
 800523c:	b0cb      	sub	sp, #300	; 0x12c
 800523e:	ab4c      	add	r3, sp, #304	; 0x130
 8005240:	f853 1b04 	ldr.w	r1, [r3], #4
 8005244:	a802      	add	r0, sp, #8
 8005246:	461a      	mov	r2, r3
 8005248:	9301      	str	r3, [sp, #4]
 800524a:	f003 fc4f 	bl	8008aec <vsprintf>
 800524e:	a802      	add	r0, sp, #8
 8005250:	f7fd fe12 	bl	8002e78 <serial_puts>
 8005254:	b04b      	add	sp, #300	; 0x12c
 8005256:	f85d eb04 	ldr.w	lr, [sp], #4
 800525a:	b004      	add	sp, #16
 800525c:	4770      	bx	lr
 800525e:	bf00      	nop

08005260 <fgetc>:
 8005260:	2802      	cmp	r0, #2
 8005262:	dc04      	bgt.n	800526e <fgetc+0xe>
 8005264:	4b03      	ldr	r3, [pc, #12]	; (8005274 <fgetc+0x14>)
 8005266:	f853 3020 	ldr.w	r3, [r3, r0, lsl #2]
 800526a:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 800526c:	4718      	bx	r3
 800526e:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8005272:	4770      	bx	lr
 8005274:	200037c4 	.word	0x200037c4

08005278 <ftstc>:
 8005278:	2802      	cmp	r0, #2
 800527a:	dc04      	bgt.n	8005286 <ftstc+0xe>
 800527c:	4b03      	ldr	r3, [pc, #12]	; (800528c <ftstc+0x14>)
 800527e:	f853 3020 	ldr.w	r3, [r3, r0, lsl #2]
 8005282:	6a9b      	ldr	r3, [r3, #40]	; 0x28
 8005284:	4718      	bx	r3
 8005286:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 800528a:	4770      	bx	lr
 800528c:	200037c4 	.word	0x200037c4

08005290 <fputc>:
 8005290:	2802      	cmp	r0, #2
 8005292:	4603      	mov	r3, r0
 8005294:	dd00      	ble.n	8005298 <fputc+0x8>
 8005296:	4770      	bx	lr
 8005298:	4a02      	ldr	r2, [pc, #8]	; (80052a4 <fputc+0x14>)
 800529a:	4608      	mov	r0, r1
 800529c:	f852 3023 	ldr.w	r3, [r2, r3, lsl #2]
 80052a0:	6a1b      	ldr	r3, [r3, #32]
 80052a2:	4718      	bx	r3
 80052a4:	200037c4 	.word	0x200037c4

080052a8 <fputs>:
 80052a8:	2802      	cmp	r0, #2
 80052aa:	4603      	mov	r3, r0
 80052ac:	dd00      	ble.n	80052b0 <fputs+0x8>
 80052ae:	4770      	bx	lr
 80052b0:	4a02      	ldr	r2, [pc, #8]	; (80052bc <fputs+0x14>)
 80052b2:	4608      	mov	r0, r1
 80052b4:	f852 3023 	ldr.w	r3, [r2, r3, lsl #2]
 80052b8:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 80052ba:	4718      	bx	r3
 80052bc:	200037c4 	.word	0x200037c4

080052c0 <fprintf>:
 80052c0:	b40e      	push	{r1, r2, r3}
 80052c2:	b510      	push	{r4, lr}
 80052c4:	4604      	mov	r4, r0
 80052c6:	b0cb      	sub	sp, #300	; 0x12c
 80052c8:	ab4d      	add	r3, sp, #308	; 0x134
 80052ca:	f853 1b04 	ldr.w	r1, [r3], #4
 80052ce:	a802      	add	r0, sp, #8
 80052d0:	461a      	mov	r2, r3
 80052d2:	9301      	str	r3, [sp, #4]
 80052d4:	f003 fc0a 	bl	8008aec <vsprintf>
 80052d8:	2c02      	cmp	r4, #2
 80052da:	dc05      	bgt.n	80052e8 <fprintf+0x28>
 80052dc:	4b05      	ldr	r3, [pc, #20]	; (80052f4 <fprintf+0x34>)
 80052de:	a802      	add	r0, sp, #8
 80052e0:	f853 3024 	ldr.w	r3, [r3, r4, lsl #2]
 80052e4:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 80052e6:	4798      	blx	r3
 80052e8:	b04b      	add	sp, #300	; 0x12c
 80052ea:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80052ee:	b003      	add	sp, #12
 80052f0:	4770      	bx	lr
 80052f2:	bf00      	nop
 80052f4:	200037c4 	.word	0x200037c4

080052f8 <getc>:
 80052f8:	f8d8 3004 	ldr.w	r3, [r8, #4]
 80052fc:	079b      	lsls	r3, r3, #30
 80052fe:	d401      	bmi.n	8005304 <getc+0xc>
 8005300:	f7fd bd9e 	b.w	8002e40 <serial_getc>
 8005304:	4b01      	ldr	r3, [pc, #4]	; (800530c <getc+0x14>)
 8005306:	681b      	ldr	r3, [r3, #0]
 8005308:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 800530a:	4718      	bx	r3
 800530c:	200037c4 	.word	0x200037c4

08005310 <tstc>:
 8005310:	f8d8 3004 	ldr.w	r3, [r8, #4]
 8005314:	079b      	lsls	r3, r3, #30
 8005316:	d401      	bmi.n	800531c <tstc+0xc>
 8005318:	f7fd bdbc 	b.w	8002e94 <serial_tstc>
 800531c:	4b01      	ldr	r3, [pc, #4]	; (8005324 <tstc+0x14>)
 800531e:	681b      	ldr	r3, [r3, #0]
 8005320:	6a9b      	ldr	r3, [r3, #40]	; 0x28
 8005322:	4718      	bx	r3
 8005324:	200037c4 	.word	0x200037c4

08005328 <putc>:
 8005328:	f8d8 3004 	ldr.w	r3, [r8, #4]
 800532c:	079b      	lsls	r3, r3, #30
 800532e:	d401      	bmi.n	8005334 <putc+0xc>
 8005330:	f7fd bd90 	b.w	8002e54 <serial_putc>
 8005334:	4b01      	ldr	r3, [pc, #4]	; (800533c <putc+0x14>)
 8005336:	685b      	ldr	r3, [r3, #4]
 8005338:	6a1b      	ldr	r3, [r3, #32]
 800533a:	4718      	bx	r3
 800533c:	200037c4 	.word	0x200037c4

08005340 <puts>:
 8005340:	f8d8 3004 	ldr.w	r3, [r8, #4]
 8005344:	079b      	lsls	r3, r3, #30
 8005346:	d401      	bmi.n	800534c <puts+0xc>
 8005348:	f7fd bd96 	b.w	8002e78 <serial_puts>
 800534c:	4b01      	ldr	r3, [pc, #4]	; (8005354 <puts+0x14>)
 800534e:	685b      	ldr	r3, [r3, #4]
 8005350:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8005352:	4718      	bx	r3
 8005354:	200037c4 	.word	0x200037c4

08005358 <printf>:
 8005358:	b40f      	push	{r0, r1, r2, r3}
 800535a:	b500      	push	{lr}
 800535c:	b0cb      	sub	sp, #300	; 0x12c
 800535e:	ab4c      	add	r3, sp, #304	; 0x130
 8005360:	f853 1b04 	ldr.w	r1, [r3], #4
 8005364:	a802      	add	r0, sp, #8
 8005366:	461a      	mov	r2, r3
 8005368:	9301      	str	r3, [sp, #4]
 800536a:	f003 fbbf 	bl	8008aec <vsprintf>
 800536e:	a802      	add	r0, sp, #8
 8005370:	f7ff ffe6 	bl	8005340 <puts>
 8005374:	b04b      	add	sp, #300	; 0x12c
 8005376:	f85d eb04 	ldr.w	lr, [sp], #4
 800537a:	b004      	add	sp, #16
 800537c:	4770      	bx	lr
 800537e:	bf00      	nop

08005380 <vprintf>:
 8005380:	b500      	push	{lr}
 8005382:	b0c9      	sub	sp, #292	; 0x124
 8005384:	460a      	mov	r2, r1
 8005386:	4601      	mov	r1, r0
 8005388:	4668      	mov	r0, sp
 800538a:	f003 fbaf 	bl	8008aec <vsprintf>
 800538e:	4668      	mov	r0, sp
 8005390:	f7ff ffd6 	bl	8005340 <puts>
 8005394:	b049      	add	sp, #292	; 0x124
 8005396:	f85d fb04 	ldr.w	pc, [sp], #4
 800539a:	bf00      	nop

0800539c <ctrlc>:
 800539c:	b538      	push	{r3, r4, r5, lr}
 800539e:	4d0a      	ldr	r5, [pc, #40]	; (80053c8 <ctrlc+0x2c>)
 80053a0:	682c      	ldr	r4, [r5, #0]
 80053a2:	b914      	cbnz	r4, 80053aa <ctrlc+0xe>
 80053a4:	f8d8 300c 	ldr.w	r3, [r8, #12]
 80053a8:	b913      	cbnz	r3, 80053b0 <ctrlc+0x14>
 80053aa:	2400      	movs	r4, #0
 80053ac:	4620      	mov	r0, r4
 80053ae:	bd38      	pop	{r3, r4, r5, pc}
 80053b0:	f7ff ffae 	bl	8005310 <tstc>
 80053b4:	2800      	cmp	r0, #0
 80053b6:	d0f8      	beq.n	80053aa <ctrlc+0xe>
 80053b8:	f7ff ff9e 	bl	80052f8 <getc>
 80053bc:	2803      	cmp	r0, #3
 80053be:	d1f5      	bne.n	80053ac <ctrlc+0x10>
 80053c0:	2301      	movs	r3, #1
 80053c2:	461c      	mov	r4, r3
 80053c4:	606b      	str	r3, [r5, #4]
 80053c6:	e7f1      	b.n	80053ac <ctrlc+0x10>
 80053c8:	2000353c 	.word	0x2000353c

080053cc <disable_ctrlc>:
 80053cc:	4b02      	ldr	r3, [pc, #8]	; (80053d8 <disable_ctrlc+0xc>)
 80053ce:	681a      	ldr	r2, [r3, #0]
 80053d0:	6018      	str	r0, [r3, #0]
 80053d2:	4610      	mov	r0, r2
 80053d4:	4770      	bx	lr
 80053d6:	bf00      	nop
 80053d8:	2000353c 	.word	0x2000353c

080053dc <had_ctrlc>:
 80053dc:	4b01      	ldr	r3, [pc, #4]	; (80053e4 <had_ctrlc+0x8>)
 80053de:	6858      	ldr	r0, [r3, #4]
 80053e0:	4770      	bx	lr
 80053e2:	bf00      	nop
 80053e4:	2000353c 	.word	0x2000353c

080053e8 <clear_ctrlc>:
 80053e8:	2200      	movs	r2, #0
 80053ea:	4b01      	ldr	r3, [pc, #4]	; (80053f0 <clear_ctrlc+0x8>)
 80053ec:	605a      	str	r2, [r3, #4]
 80053ee:	4770      	bx	lr
 80053f0:	2000353c 	.word	0x2000353c

080053f4 <search_device>:
 80053f4:	b510      	push	{r4, lr}
 80053f6:	4604      	mov	r4, r0
 80053f8:	4608      	mov	r0, r1
 80053fa:	f001 ffad 	bl	8007358 <stdio_get_by_name>
 80053fe:	b118      	cbz	r0, 8005408 <search_device+0x14>
 8005400:	6803      	ldr	r3, [r0, #0]
 8005402:	421c      	tst	r4, r3
 8005404:	bf08      	it	eq
 8005406:	2000      	moveq	r0, #0
 8005408:	bd10      	pop	{r4, pc}
 800540a:	bf00      	nop

0800540c <console_assign>:
 800540c:	b538      	push	{r3, r4, r5, lr}
 800540e:	1e04      	subs	r4, r0, #0
 8005410:	d012      	beq.n	8005438 <console_assign+0x2c>
 8005412:	db09      	blt.n	8005428 <console_assign+0x1c>
 8005414:	2c02      	cmp	r4, #2
 8005416:	dc07      	bgt.n	8005428 <console_assign+0x1c>
 8005418:	2502      	movs	r5, #2
 800541a:	4608      	mov	r0, r1
 800541c:	f001 ff9c 	bl	8007358 <stdio_get_by_name>
 8005420:	b110      	cbz	r0, 8005428 <console_assign+0x1c>
 8005422:	6803      	ldr	r3, [r0, #0]
 8005424:	421d      	tst	r5, r3
 8005426:	d102      	bne.n	800542e <console_assign+0x22>
 8005428:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 800542c:	bd38      	pop	{r3, r4, r5, pc}
 800542e:	4601      	mov	r1, r0
 8005430:	4620      	mov	r0, r4
 8005432:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8005436:	e6cf      	b.n	80051d8 <console_setfile>
 8005438:	2501      	movs	r5, #1
 800543a:	e7ee      	b.n	800541a <console_assign+0xe>

0800543c <console_init_f>:
 800543c:	2201      	movs	r2, #1
 800543e:	2000      	movs	r0, #0
 8005440:	f8c8 200c 	str.w	r2, [r8, #12]
 8005444:	4770      	bx	lr
 8005446:	bf00      	nop

08005448 <stdio_print_current_devices>:
 8005448:	b510      	push	{r4, lr}
 800544a:	4c1a      	ldr	r4, [pc, #104]	; (80054b4 <stdio_print_current_devices+0x6c>)
 800544c:	481a      	ldr	r0, [pc, #104]	; (80054b8 <stdio_print_current_devices+0x70>)
 800544e:	f7ff ff77 	bl	8005340 <puts>
 8005452:	6821      	ldr	r1, [r4, #0]
 8005454:	b1b9      	cbz	r1, 8005486 <stdio_print_current_devices+0x3e>
 8005456:	3108      	adds	r1, #8
 8005458:	4818      	ldr	r0, [pc, #96]	; (80054bc <stdio_print_current_devices+0x74>)
 800545a:	f7ff ff7d 	bl	8005358 <printf>
 800545e:	4818      	ldr	r0, [pc, #96]	; (80054c0 <stdio_print_current_devices+0x78>)
 8005460:	f7ff ff6e 	bl	8005340 <puts>
 8005464:	6861      	ldr	r1, [r4, #4]
 8005466:	b1b9      	cbz	r1, 8005498 <stdio_print_current_devices+0x50>
 8005468:	3108      	adds	r1, #8
 800546a:	4814      	ldr	r0, [pc, #80]	; (80054bc <stdio_print_current_devices+0x74>)
 800546c:	f7ff ff74 	bl	8005358 <printf>
 8005470:	4814      	ldr	r0, [pc, #80]	; (80054c4 <stdio_print_current_devices+0x7c>)
 8005472:	f7ff ff65 	bl	8005340 <puts>
 8005476:	68a1      	ldr	r1, [r4, #8]
 8005478:	b1b9      	cbz	r1, 80054aa <stdio_print_current_devices+0x62>
 800547a:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800547e:	3108      	adds	r1, #8
 8005480:	480e      	ldr	r0, [pc, #56]	; (80054bc <stdio_print_current_devices+0x74>)
 8005482:	f7ff bf69 	b.w	8005358 <printf>
 8005486:	4810      	ldr	r0, [pc, #64]	; (80054c8 <stdio_print_current_devices+0x80>)
 8005488:	f7ff ff5a 	bl	8005340 <puts>
 800548c:	480c      	ldr	r0, [pc, #48]	; (80054c0 <stdio_print_current_devices+0x78>)
 800548e:	f7ff ff57 	bl	8005340 <puts>
 8005492:	6861      	ldr	r1, [r4, #4]
 8005494:	2900      	cmp	r1, #0
 8005496:	d1e7      	bne.n	8005468 <stdio_print_current_devices+0x20>
 8005498:	480c      	ldr	r0, [pc, #48]	; (80054cc <stdio_print_current_devices+0x84>)
 800549a:	f7ff ff51 	bl	8005340 <puts>
 800549e:	4809      	ldr	r0, [pc, #36]	; (80054c4 <stdio_print_current_devices+0x7c>)
 80054a0:	f7ff ff4e 	bl	8005340 <puts>
 80054a4:	68a1      	ldr	r1, [r4, #8]
 80054a6:	2900      	cmp	r1, #0
 80054a8:	d1e7      	bne.n	800547a <stdio_print_current_devices+0x32>
 80054aa:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80054ae:	4808      	ldr	r0, [pc, #32]	; (80054d0 <stdio_print_current_devices+0x88>)
 80054b0:	f7ff bf46 	b.w	8005340 <puts>
 80054b4:	200037c4 	.word	0x200037c4
 80054b8:	0800dd20 	.word	0x0800dd20
 80054bc:	0800fbe0 	.word	0x0800fbe0
 80054c0:	0800dd48 	.word	0x0800dd48
 80054c4:	0800dd70 	.word	0x0800dd70
 80054c8:	0800dd28 	.word	0x0800dd28
 80054cc:	0800dd50 	.word	0x0800dd50
 80054d0:	0800dd78 	.word	0x0800dd78

080054d4 <console_init_r>:
 80054d4:	f8d8 201c 	ldr.w	r2, [r8, #28]
 80054d8:	493f      	ldr	r1, [pc, #252]	; (80055d8 <console_init_r+0x104>)
 80054da:	b570      	push	{r4, r5, r6, lr}
 80054dc:	6051      	str	r1, [r2, #4]
 80054de:	f8d8 201c 	ldr.w	r2, [r8, #28]
 80054e2:	483e      	ldr	r0, [pc, #248]	; (80055dc <console_init_r+0x108>)
 80054e4:	493e      	ldr	r1, [pc, #248]	; (80055e0 <console_init_r+0x10c>)
 80054e6:	6090      	str	r0, [r2, #8]
 80054e8:	f8d8 201c 	ldr.w	r2, [r8, #28]
 80054ec:	483d      	ldr	r0, [pc, #244]	; (80055e4 <console_init_r+0x110>)
 80054ee:	60d1      	str	r1, [r2, #12]
 80054f0:	f8d8 101c 	ldr.w	r1, [r8, #28]
 80054f4:	4a3c      	ldr	r2, [pc, #240]	; (80055e8 <console_init_r+0x114>)
 80054f6:	6108      	str	r0, [r1, #16]
 80054f8:	f8d8 301c 	ldr.w	r3, [r8, #28]
 80054fc:	483b      	ldr	r0, [pc, #236]	; (80055ec <console_init_r+0x118>)
 80054fe:	615a      	str	r2, [r3, #20]
 8005500:	f7ff fce8 	bl	8004ed4 <getenv>
 8005504:	4604      	mov	r4, r0
 8005506:	483a      	ldr	r0, [pc, #232]	; (80055f0 <console_init_r+0x11c>)
 8005508:	f7ff fce4 	bl	8004ed4 <getenv>
 800550c:	4605      	mov	r5, r0
 800550e:	4839      	ldr	r0, [pc, #228]	; (80055f4 <console_init_r+0x120>)
 8005510:	f7ff fce0 	bl	8004ed4 <getenv>
 8005514:	4606      	mov	r6, r0
 8005516:	4620      	mov	r0, r4
 8005518:	f001 ff1e 	bl	8007358 <stdio_get_by_name>
 800551c:	4604      	mov	r4, r0
 800551e:	b120      	cbz	r0, 800552a <console_init_r+0x56>
 8005520:	6803      	ldr	r3, [r0, #0]
 8005522:	f013 0f01 	tst.w	r3, #1
 8005526:	bf08      	it	eq
 8005528:	2400      	moveq	r4, #0
 800552a:	4628      	mov	r0, r5
 800552c:	f001 ff14 	bl	8007358 <stdio_get_by_name>
 8005530:	4605      	mov	r5, r0
 8005532:	b120      	cbz	r0, 800553e <console_init_r+0x6a>
 8005534:	6803      	ldr	r3, [r0, #0]
 8005536:	f013 0f02 	tst.w	r3, #2
 800553a:	bf08      	it	eq
 800553c:	2500      	moveq	r5, #0
 800553e:	4630      	mov	r0, r6
 8005540:	f001 ff0a 	bl	8007358 <stdio_get_by_name>
 8005544:	4606      	mov	r6, r0
 8005546:	b120      	cbz	r0, 8005552 <console_init_r+0x7e>
 8005548:	6803      	ldr	r3, [r0, #0]
 800554a:	f013 0f02 	tst.w	r3, #2
 800554e:	bf08      	it	eq
 8005550:	2600      	moveq	r6, #0
 8005552:	b344      	cbz	r4, 80055a6 <console_init_r+0xd2>
 8005554:	b39d      	cbz	r5, 80055be <console_init_r+0xea>
 8005556:	b1be      	cbz	r6, 8005588 <console_init_r+0xb4>
 8005558:	b11d      	cbz	r5, 8005562 <console_init_r+0x8e>
 800555a:	4629      	mov	r1, r5
 800555c:	2001      	movs	r0, #1
 800555e:	f7ff fe3b 	bl	80051d8 <console_setfile>
 8005562:	4631      	mov	r1, r6
 8005564:	2002      	movs	r0, #2
 8005566:	f7ff fe37 	bl	80051d8 <console_setfile>
 800556a:	b11c      	cbz	r4, 8005574 <console_init_r+0xa0>
 800556c:	4621      	mov	r1, r4
 800556e:	2000      	movs	r0, #0
 8005570:	f7ff fe32 	bl	80051d8 <console_setfile>
 8005574:	f8d8 3004 	ldr.w	r3, [r8, #4]
 8005578:	f043 0302 	orr.w	r3, r3, #2
 800557c:	f8c8 3004 	str.w	r3, [r8, #4]
 8005580:	f7ff ff62 	bl	8005448 <stdio_print_current_devices>
 8005584:	2000      	movs	r0, #0
 8005586:	bd70      	pop	{r4, r5, r6, pc}
 8005588:	481b      	ldr	r0, [pc, #108]	; (80055f8 <console_init_r+0x124>)
 800558a:	f001 fee5 	bl	8007358 <stdio_get_by_name>
 800558e:	4606      	mov	r6, r0
 8005590:	b110      	cbz	r0, 8005598 <console_init_r+0xc4>
 8005592:	6803      	ldr	r3, [r0, #0]
 8005594:	079b      	lsls	r3, r3, #30
 8005596:	d4df      	bmi.n	8005558 <console_init_r+0x84>
 8005598:	2d00      	cmp	r5, #0
 800559a:	d0e6      	beq.n	800556a <console_init_r+0x96>
 800559c:	4629      	mov	r1, r5
 800559e:	2001      	movs	r0, #1
 80055a0:	f7ff fe1a 	bl	80051d8 <console_setfile>
 80055a4:	e7e1      	b.n	800556a <console_init_r+0x96>
 80055a6:	4814      	ldr	r0, [pc, #80]	; (80055f8 <console_init_r+0x124>)
 80055a8:	f001 fed6 	bl	8007358 <stdio_get_by_name>
 80055ac:	2800      	cmp	r0, #0
 80055ae:	d0d1      	beq.n	8005554 <console_init_r+0x80>
 80055b0:	6803      	ldr	r3, [r0, #0]
 80055b2:	f013 0f01 	tst.w	r3, #1
 80055b6:	bf18      	it	ne
 80055b8:	4604      	movne	r4, r0
 80055ba:	2d00      	cmp	r5, #0
 80055bc:	d1cb      	bne.n	8005556 <console_init_r+0x82>
 80055be:	480e      	ldr	r0, [pc, #56]	; (80055f8 <console_init_r+0x124>)
 80055c0:	f001 feca 	bl	8007358 <stdio_get_by_name>
 80055c4:	2800      	cmp	r0, #0
 80055c6:	d0c6      	beq.n	8005556 <console_init_r+0x82>
 80055c8:	6803      	ldr	r3, [r0, #0]
 80055ca:	f013 0f02 	tst.w	r3, #2
 80055ce:	bf18      	it	ne
 80055d0:	4605      	movne	r5, r0
 80055d2:	2e00      	cmp	r6, #0
 80055d4:	d1c0      	bne.n	8005558 <console_init_r+0x84>
 80055d6:	e7d7      	b.n	8005588 <console_init_r+0xb4>
 80055d8:	08002e41 	.word	0x08002e41
 80055dc:	08002e95 	.word	0x08002e95
 80055e0:	08002e55 	.word	0x08002e55
 80055e4:	08002e79 	.word	0x08002e79
 80055e8:	08005239 	.word	0x08005239
 80055ec:	0800dafc 	.word	0x0800dafc
 80055f0:	0800db04 	.word	0x0800db04
 80055f4:	0800db0c 	.word	0x0800db0c
 80055f8:	0800dd98 	.word	0x0800dd98

080055fc <sbrk>:
 80055fc:	4a06      	ldr	r2, [pc, #24]	; (8005618 <sbrk+0x1c>)
 80055fe:	6813      	ldr	r3, [r2, #0]
 8005600:	6851      	ldr	r1, [r2, #4]
 8005602:	4418      	add	r0, r3
 8005604:	4288      	cmp	r0, r1
 8005606:	d305      	bcc.n	8005614 <sbrk+0x18>
 8005608:	6891      	ldr	r1, [r2, #8]
 800560a:	4288      	cmp	r0, r1
 800560c:	d802      	bhi.n	8005614 <sbrk+0x18>
 800560e:	6010      	str	r0, [r2, #0]
 8005610:	4618      	mov	r0, r3
 8005612:	4770      	bx	lr
 8005614:	2000      	movs	r0, #0
 8005616:	4770      	bx	lr
 8005618:	20003544 	.word	0x20003544

0800561c <mem_malloc_init>:
 800561c:	b430      	push	{r4, r5}
 800561e:	4b05      	ldr	r3, [pc, #20]	; (8005634 <mem_malloc_init+0x18>)
 8005620:	1845      	adds	r5, r0, r1
 8005622:	460a      	mov	r2, r1
 8005624:	609d      	str	r5, [r3, #8]
 8005626:	2100      	movs	r1, #0
 8005628:	bc30      	pop	{r4, r5}
 800562a:	6058      	str	r0, [r3, #4]
 800562c:	6018      	str	r0, [r3, #0]
 800562e:	f7fb b84f 	b.w	80006d0 <memset>
 8005632:	bf00      	nop
 8005634:	20003544 	.word	0x20003544

08005638 <malloc_trim>:
 8005638:	b5f0      	push	{r4, r5, r6, r7, lr}
 800563a:	4d21      	ldr	r5, [pc, #132]	; (80056c0 <malloc_trim+0x88>)
 800563c:	f5c0 607e 	rsb	r0, r0, #4064	; 0xfe0
 8005640:	68ac      	ldr	r4, [r5, #8]
 8005642:	300f      	adds	r0, #15
 8005644:	6862      	ldr	r2, [r4, #4]
 8005646:	f022 0203 	bic.w	r2, r2, #3
 800564a:	4410      	add	r0, r2
 800564c:	f420 607f 	bic.w	r0, r0, #4080	; 0xff0
 8005650:	f020 000f 	bic.w	r0, r0, #15
 8005654:	f5a0 5380 	sub.w	r3, r0, #4096	; 0x1000
 8005658:	f5b3 5f80 	cmp.w	r3, #4096	; 0x1000
 800565c:	db0d      	blt.n	800567a <malloc_trim+0x42>
 800565e:	4919      	ldr	r1, [pc, #100]	; (80056c4 <malloc_trim+0x8c>)
 8005660:	e891 0081 	ldmia.w	r1, {r0, r7}
 8005664:	42b8      	cmp	r0, r7
 8005666:	d30a      	bcc.n	800567e <malloc_trim+0x46>
 8005668:	688e      	ldr	r6, [r1, #8]
 800566a:	eb04 0e02 	add.w	lr, r4, r2
 800566e:	42b0      	cmp	r0, r6
 8005670:	bf94      	ite	ls
 8005672:	4606      	movls	r6, r0
 8005674:	2600      	movhi	r6, #0
 8005676:	4576      	cmp	r6, lr
 8005678:	d006      	beq.n	8005688 <malloc_trim+0x50>
 800567a:	2000      	movs	r0, #0
 800567c:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800567e:	2600      	movs	r6, #0
 8005680:	eb04 0e02 	add.w	lr, r4, r2
 8005684:	4576      	cmp	r6, lr
 8005686:	d1f8      	bne.n	800567a <malloc_trim+0x42>
 8005688:	1ac6      	subs	r6, r0, r3
 800568a:	42b7      	cmp	r7, r6
 800568c:	d810      	bhi.n	80056b0 <malloc_trim+0x78>
 800568e:	688f      	ldr	r7, [r1, #8]
 8005690:	42be      	cmp	r6, r7
 8005692:	d80d      	bhi.n	80056b0 <malloc_trim+0x78>
 8005694:	3001      	adds	r0, #1
 8005696:	600e      	str	r6, [r1, #0]
 8005698:	d10a      	bne.n	80056b0 <malloc_trim+0x78>
 800569a:	1b33      	subs	r3, r6, r4
 800569c:	2b0f      	cmp	r3, #15
 800569e:	ddec      	ble.n	800567a <malloc_trim+0x42>
 80056a0:	f8d5 2408 	ldr.w	r2, [r5, #1032]	; 0x408
 80056a4:	f043 0301 	orr.w	r3, r3, #1
 80056a8:	1ab6      	subs	r6, r6, r2
 80056aa:	60ce      	str	r6, [r1, #12]
 80056ac:	6063      	str	r3, [r4, #4]
 80056ae:	e7e4      	b.n	800567a <malloc_trim+0x42>
 80056b0:	2001      	movs	r0, #1
 80056b2:	68cd      	ldr	r5, [r1, #12]
 80056b4:	1ad2      	subs	r2, r2, r3
 80056b6:	4302      	orrs	r2, r0
 80056b8:	1aeb      	subs	r3, r5, r3
 80056ba:	6062      	str	r2, [r4, #4]
 80056bc:	60cb      	str	r3, [r1, #12]
 80056be:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80056c0:	200000f0 	.word	0x200000f0
 80056c4:	20003544 	.word	0x20003544

080056c8 <free>:
 80056c8:	2800      	cmp	r0, #0
 80056ca:	d038      	beq.n	800573e <free+0x76>
 80056cc:	b4f0      	push	{r4, r5, r6, r7}
 80056ce:	f850 2c04 	ldr.w	r2, [r0, #-4]
 80056d2:	4f69      	ldr	r7, [pc, #420]	; (8005878 <free+0x1b0>)
 80056d4:	f1a0 0408 	sub.w	r4, r0, #8
 80056d8:	f022 0101 	bic.w	r1, r2, #1
 80056dc:	1865      	adds	r5, r4, r1
 80056de:	68be      	ldr	r6, [r7, #8]
 80056e0:	686b      	ldr	r3, [r5, #4]
 80056e2:	42b5      	cmp	r5, r6
 80056e4:	f023 0303 	bic.w	r3, r3, #3
 80056e8:	d068      	beq.n	80057bc <free+0xf4>
 80056ea:	07d6      	lsls	r6, r2, #31
 80056ec:	606b      	str	r3, [r5, #4]
 80056ee:	d527      	bpl.n	8005740 <free+0x78>
 80056f0:	18ea      	adds	r2, r5, r3
 80056f2:	6852      	ldr	r2, [r2, #4]
 80056f4:	07d2      	lsls	r2, r2, #31
 80056f6:	d533      	bpl.n	8005760 <free+0x98>
 80056f8:	f041 0301 	orr.w	r3, r1, #1
 80056fc:	f5b1 7f00 	cmp.w	r1, #512	; 0x200
 8005700:	6063      	str	r3, [r4, #4]
 8005702:	5061      	str	r1, [r4, r1]
 8005704:	d33b      	bcc.n	800577e <free+0xb6>
 8005706:	0a4b      	lsrs	r3, r1, #9
 8005708:	2b04      	cmp	r3, #4
 800570a:	d84c      	bhi.n	80057a6 <free+0xde>
 800570c:	098b      	lsrs	r3, r1, #6
 800570e:	f103 0539 	add.w	r5, r3, #57	; 0x39
 8005712:	00ed      	lsls	r5, r5, #3
 8005714:	f103 0238 	add.w	r2, r3, #56	; 0x38
 8005718:	1978      	adds	r0, r7, r5
 800571a:	597b      	ldr	r3, [r7, r5]
 800571c:	3808      	subs	r0, #8
 800571e:	4298      	cmp	r0, r3
 8005720:	d07a      	beq.n	8005818 <free+0x150>
 8005722:	685a      	ldr	r2, [r3, #4]
 8005724:	f022 0203 	bic.w	r2, r2, #3
 8005728:	4291      	cmp	r1, r2
 800572a:	d25f      	bcs.n	80057ec <free+0x124>
 800572c:	689b      	ldr	r3, [r3, #8]
 800572e:	4298      	cmp	r0, r3
 8005730:	d1f7      	bne.n	8005722 <free+0x5a>
 8005732:	68c3      	ldr	r3, [r0, #12]
 8005734:	60e3      	str	r3, [r4, #12]
 8005736:	60a0      	str	r0, [r4, #8]
 8005738:	609c      	str	r4, [r3, #8]
 800573a:	60c4      	str	r4, [r0, #12]
 800573c:	bcf0      	pop	{r4, r5, r6, r7}
 800573e:	4770      	bx	lr
 8005740:	f850 0c08 	ldr.w	r0, [r0, #-8]
 8005744:	f107 0608 	add.w	r6, r7, #8
 8005748:	1a24      	subs	r4, r4, r0
 800574a:	68a2      	ldr	r2, [r4, #8]
 800574c:	4401      	add	r1, r0
 800574e:	42b2      	cmp	r2, r6
 8005750:	d04e      	beq.n	80057f0 <free+0x128>
 8005752:	68e0      	ldr	r0, [r4, #12]
 8005754:	60d0      	str	r0, [r2, #12]
 8005756:	6082      	str	r2, [r0, #8]
 8005758:	18ea      	adds	r2, r5, r3
 800575a:	6852      	ldr	r2, [r2, #4]
 800575c:	07d2      	lsls	r2, r2, #31
 800575e:	d4cb      	bmi.n	80056f8 <free+0x30>
 8005760:	68aa      	ldr	r2, [r5, #8]
 8005762:	4846      	ldr	r0, [pc, #280]	; (800587c <free+0x1b4>)
 8005764:	4419      	add	r1, r3
 8005766:	4282      	cmp	r2, r0
 8005768:	d05f      	beq.n	800582a <free+0x162>
 800576a:	68e8      	ldr	r0, [r5, #12]
 800576c:	f041 0301 	orr.w	r3, r1, #1
 8005770:	f5b1 7f00 	cmp.w	r1, #512	; 0x200
 8005774:	60d0      	str	r0, [r2, #12]
 8005776:	6082      	str	r2, [r0, #8]
 8005778:	6063      	str	r3, [r4, #4]
 800577a:	5061      	str	r1, [r4, r1]
 800577c:	d2c3      	bcs.n	8005706 <free+0x3e>
 800577e:	2201      	movs	r2, #1
 8005780:	08c9      	lsrs	r1, r1, #3
 8005782:	687b      	ldr	r3, [r7, #4]
 8005784:	1088      	asrs	r0, r1, #2
 8005786:	4082      	lsls	r2, r0
 8005788:	4313      	orrs	r3, r2
 800578a:	607b      	str	r3, [r7, #4]
 800578c:	3101      	adds	r1, #1
 800578e:	f857 2031 	ldr.w	r2, [r7, r1, lsl #3]
 8005792:	eb07 03c1 	add.w	r3, r7, r1, lsl #3
 8005796:	3b08      	subs	r3, #8
 8005798:	60a2      	str	r2, [r4, #8]
 800579a:	60e3      	str	r3, [r4, #12]
 800579c:	f847 4031 	str.w	r4, [r7, r1, lsl #3]
 80057a0:	60d4      	str	r4, [r2, #12]
 80057a2:	bcf0      	pop	{r4, r5, r6, r7}
 80057a4:	4770      	bx	lr
 80057a6:	2b14      	cmp	r3, #20
 80057a8:	d930      	bls.n	800580c <free+0x144>
 80057aa:	2b54      	cmp	r3, #84	; 0x54
 80057ac:	d846      	bhi.n	800583c <free+0x174>
 80057ae:	0b0b      	lsrs	r3, r1, #12
 80057b0:	f103 056f 	add.w	r5, r3, #111	; 0x6f
 80057b4:	00ed      	lsls	r5, r5, #3
 80057b6:	f103 026e 	add.w	r2, r3, #110	; 0x6e
 80057ba:	e7ad      	b.n	8005718 <free+0x50>
 80057bc:	4419      	add	r1, r3
 80057be:	07d3      	lsls	r3, r2, #31
 80057c0:	d407      	bmi.n	80057d2 <free+0x10a>
 80057c2:	f850 0c08 	ldr.w	r0, [r0, #-8]
 80057c6:	1a24      	subs	r4, r4, r0
 80057c8:	68e3      	ldr	r3, [r4, #12]
 80057ca:	68a2      	ldr	r2, [r4, #8]
 80057cc:	4401      	add	r1, r0
 80057ce:	60d3      	str	r3, [r2, #12]
 80057d0:	609a      	str	r2, [r3, #8]
 80057d2:	f8d7 340c 	ldr.w	r3, [r7, #1036]	; 0x40c
 80057d6:	f041 0201 	orr.w	r2, r1, #1
 80057da:	4299      	cmp	r1, r3
 80057dc:	6062      	str	r2, [r4, #4]
 80057de:	60bc      	str	r4, [r7, #8]
 80057e0:	d3df      	bcc.n	80057a2 <free+0xda>
 80057e2:	bcf0      	pop	{r4, r5, r6, r7}
 80057e4:	4b26      	ldr	r3, [pc, #152]	; (8005880 <free+0x1b8>)
 80057e6:	6b58      	ldr	r0, [r3, #52]	; 0x34
 80057e8:	f7ff bf26 	b.w	8005638 <malloc_trim>
 80057ec:	4618      	mov	r0, r3
 80057ee:	e7a0      	b.n	8005732 <free+0x6a>
 80057f0:	18ea      	adds	r2, r5, r3
 80057f2:	6852      	ldr	r2, [r2, #4]
 80057f4:	07d0      	lsls	r0, r2, #31
 80057f6:	d43a      	bmi.n	800586e <free+0x1a6>
 80057f8:	68aa      	ldr	r2, [r5, #8]
 80057fa:	4419      	add	r1, r3
 80057fc:	68eb      	ldr	r3, [r5, #12]
 80057fe:	f041 0001 	orr.w	r0, r1, #1
 8005802:	60d3      	str	r3, [r2, #12]
 8005804:	609a      	str	r2, [r3, #8]
 8005806:	6060      	str	r0, [r4, #4]
 8005808:	5061      	str	r1, [r4, r1]
 800580a:	e7ca      	b.n	80057a2 <free+0xda>
 800580c:	f103 055c 	add.w	r5, r3, #92	; 0x5c
 8005810:	00ed      	lsls	r5, r5, #3
 8005812:	f103 025b 	add.w	r2, r3, #91	; 0x5b
 8005816:	e77f      	b.n	8005718 <free+0x50>
 8005818:	2101      	movs	r1, #1
 800581a:	1093      	asrs	r3, r2, #2
 800581c:	687a      	ldr	r2, [r7, #4]
 800581e:	fa01 f303 	lsl.w	r3, r1, r3
 8005822:	431a      	orrs	r2, r3
 8005824:	607a      	str	r2, [r7, #4]
 8005826:	4603      	mov	r3, r0
 8005828:	e784      	b.n	8005734 <free+0x6c>
 800582a:	f041 0301 	orr.w	r3, r1, #1
 800582e:	617c      	str	r4, [r7, #20]
 8005830:	613c      	str	r4, [r7, #16]
 8005832:	60e2      	str	r2, [r4, #12]
 8005834:	60a2      	str	r2, [r4, #8]
 8005836:	6063      	str	r3, [r4, #4]
 8005838:	5061      	str	r1, [r4, r1]
 800583a:	e7b2      	b.n	80057a2 <free+0xda>
 800583c:	f5b3 7faa 	cmp.w	r3, #340	; 0x154
 8005840:	d806      	bhi.n	8005850 <free+0x188>
 8005842:	0bcb      	lsrs	r3, r1, #15
 8005844:	f103 0578 	add.w	r5, r3, #120	; 0x78
 8005848:	00ed      	lsls	r5, r5, #3
 800584a:	f103 0277 	add.w	r2, r3, #119	; 0x77
 800584e:	e763      	b.n	8005718 <free+0x50>
 8005850:	f240 5254 	movw	r2, #1364	; 0x554
 8005854:	4293      	cmp	r3, r2
 8005856:	d806      	bhi.n	8005866 <free+0x19e>
 8005858:	0c8b      	lsrs	r3, r1, #18
 800585a:	f103 057d 	add.w	r5, r3, #125	; 0x7d
 800585e:	00ed      	lsls	r5, r5, #3
 8005860:	f103 027c 	add.w	r2, r3, #124	; 0x7c
 8005864:	e758      	b.n	8005718 <free+0x50>
 8005866:	f44f 757e 	mov.w	r5, #1016	; 0x3f8
 800586a:	227e      	movs	r2, #126	; 0x7e
 800586c:	e754      	b.n	8005718 <free+0x50>
 800586e:	f041 0301 	orr.w	r3, r1, #1
 8005872:	6063      	str	r3, [r4, #4]
 8005874:	6029      	str	r1, [r5, #0]
 8005876:	e794      	b.n	80057a2 <free+0xda>
 8005878:	200000f0 	.word	0x200000f0
 800587c:	200000f8 	.word	0x200000f8
 8005880:	20003544 	.word	0x20003544

08005884 <malloc>:
 8005884:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8005888:	4ec8      	ldr	r6, [pc, #800]	; (8005bac <malloc+0x328>)
 800588a:	f8d6 c004 	ldr.w	ip, [r6, #4]
 800588e:	f1bc 0f00 	cmp.w	ip, #0
 8005892:	d103      	bne.n	800589c <malloc+0x18>
 8005894:	68b3      	ldr	r3, [r6, #8]
 8005896:	2b00      	cmp	r3, #0
 8005898:	f000 8125 	beq.w	8005ae6 <malloc+0x262>
 800589c:	2800      	cmp	r0, #0
 800589e:	f2c0 8122 	blt.w	8005ae6 <malloc+0x262>
 80058a2:	300b      	adds	r0, #11
 80058a4:	2816      	cmp	r0, #22
 80058a6:	dc19      	bgt.n	80058dc <malloc+0x58>
 80058a8:	2318      	movs	r3, #24
 80058aa:	2702      	movs	r7, #2
 80058ac:	2410      	movs	r4, #16
 80058ae:	4dc0      	ldr	r5, [pc, #768]	; (8005bb0 <malloc+0x32c>)
 80058b0:	442b      	add	r3, r5
 80058b2:	6858      	ldr	r0, [r3, #4]
 80058b4:	f1a3 0208 	sub.w	r2, r3, #8
 80058b8:	4290      	cmp	r0, r2
 80058ba:	f000 8188 	beq.w	8005bce <malloc+0x34a>
 80058be:	6843      	ldr	r3, [r0, #4]
 80058c0:	68c2      	ldr	r2, [r0, #12]
 80058c2:	6881      	ldr	r1, [r0, #8]
 80058c4:	f023 0303 	bic.w	r3, r3, #3
 80058c8:	4403      	add	r3, r0
 80058ca:	60ca      	str	r2, [r1, #12]
 80058cc:	6091      	str	r1, [r2, #8]
 80058ce:	685a      	ldr	r2, [r3, #4]
 80058d0:	3008      	adds	r0, #8
 80058d2:	f042 0201 	orr.w	r2, r2, #1
 80058d6:	605a      	str	r2, [r3, #4]
 80058d8:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 80058dc:	f020 0407 	bic.w	r4, r0, #7
 80058e0:	f5b4 7ffc 	cmp.w	r4, #504	; 0x1f8
 80058e4:	f0c0 8231 	bcc.w	8005d4a <malloc+0x4c6>
 80058e8:	ea5f 2e54 	movs.w	lr, r4, lsr #9
 80058ec:	d00c      	beq.n	8005908 <malloc+0x84>
 80058ee:	f1be 0f04 	cmp.w	lr, #4
 80058f2:	d93e      	bls.n	8005972 <malloc+0xee>
 80058f4:	f1be 0f14 	cmp.w	lr, #20
 80058f8:	f200 8170 	bhi.w	8005bdc <malloc+0x358>
 80058fc:	f10e 075c 	add.w	r7, lr, #92	; 0x5c
 8005900:	00f9      	lsls	r1, r7, #3
 8005902:	f10e 0e5b 	add.w	lr, lr, #91	; 0x5b
 8005906:	e004      	b.n	8005912 <malloc+0x8e>
 8005908:	f44f 7100 	mov.w	r1, #512	; 0x200
 800590c:	2740      	movs	r7, #64	; 0x40
 800590e:	f04f 0e3f 	mov.w	lr, #63	; 0x3f
 8005912:	4da7      	ldr	r5, [pc, #668]	; (8005bb0 <malloc+0x32c>)
 8005914:	4429      	add	r1, r5
 8005916:	6848      	ldr	r0, [r1, #4]
 8005918:	3908      	subs	r1, #8
 800591a:	4281      	cmp	r1, r0
 800591c:	d106      	bne.n	800592c <malloc+0xa8>
 800591e:	e00c      	b.n	800593a <malloc+0xb6>
 8005920:	2a00      	cmp	r2, #0
 8005922:	f280 80e3 	bge.w	8005aec <malloc+0x268>
 8005926:	68c0      	ldr	r0, [r0, #12]
 8005928:	4281      	cmp	r1, r0
 800592a:	d006      	beq.n	800593a <malloc+0xb6>
 800592c:	6843      	ldr	r3, [r0, #4]
 800592e:	f023 0303 	bic.w	r3, r3, #3
 8005932:	1b1a      	subs	r2, r3, r4
 8005934:	2a0f      	cmp	r2, #15
 8005936:	ddf3      	ble.n	8005920 <malloc+0x9c>
 8005938:	4677      	mov	r7, lr
 800593a:	6929      	ldr	r1, [r5, #16]
 800593c:	f8df e274 	ldr.w	lr, [pc, #628]	; 8005bb4 <malloc+0x330>
 8005940:	4571      	cmp	r1, lr
 8005942:	f000 80fc 	beq.w	8005b3e <malloc+0x2ba>
 8005946:	684b      	ldr	r3, [r1, #4]
 8005948:	f023 0303 	bic.w	r3, r3, #3
 800594c:	1b1a      	subs	r2, r3, r4
 800594e:	2a0f      	cmp	r2, #15
 8005950:	f300 80cf 	bgt.w	8005af2 <malloc+0x26e>
 8005954:	2a00      	cmp	r2, #0
 8005956:	f8c5 e014 	str.w	lr, [r5, #20]
 800595a:	f8c5 e010 	str.w	lr, [r5, #16]
 800595e:	db10      	blt.n	8005982 <malloc+0xfe>
 8005960:	440b      	add	r3, r1
 8005962:	685a      	ldr	r2, [r3, #4]
 8005964:	f101 0008 	add.w	r0, r1, #8
 8005968:	f042 0201 	orr.w	r2, r2, #1
 800596c:	605a      	str	r2, [r3, #4]
 800596e:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8005972:	ea4f 1e94 	mov.w	lr, r4, lsr #6
 8005976:	f10e 0739 	add.w	r7, lr, #57	; 0x39
 800597a:	00f9      	lsls	r1, r7, #3
 800597c:	f10e 0e38 	add.w	lr, lr, #56	; 0x38
 8005980:	e7c7      	b.n	8005912 <malloc+0x8e>
 8005982:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
 8005986:	f0c0 80c6 	bcc.w	8005b16 <malloc+0x292>
 800598a:	0a58      	lsrs	r0, r3, #9
 800598c:	2804      	cmp	r0, #4
 800598e:	f200 8188 	bhi.w	8005ca2 <malloc+0x41e>
 8005992:	0998      	lsrs	r0, r3, #6
 8005994:	f100 0239 	add.w	r2, r0, #57	; 0x39
 8005998:	00d2      	lsls	r2, r2, #3
 800599a:	f100 0a38 	add.w	sl, r0, #56	; 0x38
 800599e:	eb05 0902 	add.w	r9, r5, r2
 80059a2:	58a8      	ldr	r0, [r5, r2]
 80059a4:	f1a9 0908 	sub.w	r9, r9, #8
 80059a8:	4581      	cmp	r9, r0
 80059aa:	f000 8194 	beq.w	8005cd6 <malloc+0x452>
 80059ae:	6842      	ldr	r2, [r0, #4]
 80059b0:	f022 0203 	bic.w	r2, r2, #3
 80059b4:	4293      	cmp	r3, r2
 80059b6:	f080 8163 	bcs.w	8005c80 <malloc+0x3fc>
 80059ba:	6880      	ldr	r0, [r0, #8]
 80059bc:	4581      	cmp	r9, r0
 80059be:	d1f6      	bne.n	80059ae <malloc+0x12a>
 80059c0:	f8d9 200c 	ldr.w	r2, [r9, #12]
 80059c4:	686b      	ldr	r3, [r5, #4]
 80059c6:	60ca      	str	r2, [r1, #12]
 80059c8:	f8c1 9008 	str.w	r9, [r1, #8]
 80059cc:	6091      	str	r1, [r2, #8]
 80059ce:	f8c9 100c 	str.w	r1, [r9, #12]
 80059d2:	e0b5      	b.n	8005b40 <malloc+0x2bc>
 80059d4:	68a8      	ldr	r0, [r5, #8]
 80059d6:	6842      	ldr	r2, [r0, #4]
 80059d8:	f022 0203 	bic.w	r2, r2, #3
 80059dc:	1b13      	subs	r3, r2, r4
 80059de:	2b0f      	cmp	r3, #15
 80059e0:	f300 80ea 	bgt.w	8005bb8 <malloc+0x334>
 80059e4:	f8d5 e408 	ldr.w	lr, [r5, #1032]	; 0x408
 80059e8:	6b73      	ldr	r3, [r6, #52]	; 0x34
 80059ea:	f1be 3fff 	cmp.w	lr, #4294967295	; 0xffffffff
 80059ee:	4423      	add	r3, r4
 80059f0:	eb00 0a02 	add.w	sl, r0, r2
 80059f4:	f000 8182 	beq.w	8005cfc <malloc+0x478>
 80059f8:	f503 5380 	add.w	r3, r3, #4096	; 0x1000
 80059fc:	330f      	adds	r3, #15
 80059fe:	f423 637f 	bic.w	r3, r3, #4080	; 0xff0
 8005a02:	f023 030f 	bic.w	r3, r3, #15
 8005a06:	f8d6 9000 	ldr.w	r9, [r6]
 8005a0a:	eb09 0103 	add.w	r1, r9, r3
 8005a0e:	458c      	cmp	ip, r1
 8005a10:	f200 8138 	bhi.w	8005c84 <malloc+0x400>
 8005a14:	68b7      	ldr	r7, [r6, #8]
 8005a16:	42b9      	cmp	r1, r7
 8005a18:	f200 8134 	bhi.w	8005c84 <malloc+0x400>
 8005a1c:	f1b9 3fff 	cmp.w	r9, #4294967295	; 0xffffffff
 8005a20:	6031      	str	r1, [r6, #0]
 8005a22:	d060      	beq.n	8005ae6 <malloc+0x262>
 8005a24:	45ca      	cmp	sl, r9
 8005a26:	f240 8144 	bls.w	8005cb2 <malloc+0x42e>
 8005a2a:	42a8      	cmp	r0, r5
 8005a2c:	d15b      	bne.n	8005ae6 <malloc+0x262>
 8005a2e:	68f1      	ldr	r1, [r6, #12]
 8005a30:	4419      	add	r1, r3
 8005a32:	60f1      	str	r1, [r6, #12]
 8005a34:	f1be 3fff 	cmp.w	lr, #4294967295	; 0xffffffff
 8005a38:	bf1b      	ittet	ne
 8005a3a:	eba9 070a 	subne.w	r7, r9, sl
 8005a3e:	19c9      	addne	r1, r1, r7
 8005a40:	f8c5 9408 	streq.w	r9, [r5, #1032]	; 0x408
 8005a44:	60f1      	strne	r1, [r6, #12]
 8005a46:	f019 0107 	ands.w	r1, r9, #7
 8005a4a:	bf1c      	itt	ne
 8005a4c:	f1c1 0108 	rsbne	r1, r1, #8
 8005a50:	4489      	addne	r9, r1
 8005a52:	444b      	add	r3, r9
 8005a54:	f603 7eff 	addw	lr, r3, #4095	; 0xfff
 8005a58:	f42e 6e7f 	bic.w	lr, lr, #4080	; 0xff0
 8005a5c:	1acb      	subs	r3, r1, r3
 8005a5e:	f02e 0e0f 	bic.w	lr, lr, #15
 8005a62:	6831      	ldr	r1, [r6, #0]
 8005a64:	eb03 0a0e 	add.w	sl, r3, lr
 8005a68:	eb0a 0701 	add.w	r7, sl, r1
 8005a6c:	45bc      	cmp	ip, r7
 8005a6e:	f200 8130 	bhi.w	8005cd2 <malloc+0x44e>
 8005a72:	68b3      	ldr	r3, [r6, #8]
 8005a74:	429f      	cmp	r7, r3
 8005a76:	f200 812c 	bhi.w	8005cd2 <malloc+0x44e>
 8005a7a:	1c4b      	adds	r3, r1, #1
 8005a7c:	6037      	str	r7, [r6, #0]
 8005a7e:	d032      	beq.n	8005ae6 <malloc+0x262>
 8005a80:	eba1 0e09 	sub.w	lr, r1, r9
 8005a84:	68f1      	ldr	r1, [r6, #12]
 8005a86:	44d6      	add	lr, sl
 8005a88:	f04e 0e01 	orr.w	lr, lr, #1
 8005a8c:	4451      	add	r1, sl
 8005a8e:	42a8      	cmp	r0, r5
 8005a90:	f8c5 9008 	str.w	r9, [r5, #8]
 8005a94:	60f1      	str	r1, [r6, #12]
 8005a96:	f8c9 e004 	str.w	lr, [r9, #4]
 8005a9a:	d015      	beq.n	8005ac8 <malloc+0x244>
 8005a9c:	2a0f      	cmp	r2, #15
 8005a9e:	f240 812f 	bls.w	8005d00 <malloc+0x47c>
 8005aa2:	f04f 0e05 	mov.w	lr, #5
 8005aa6:	6847      	ldr	r7, [r0, #4]
 8005aa8:	f1a2 030c 	sub.w	r3, r2, #12
 8005aac:	f023 0307 	bic.w	r3, r3, #7
 8005ab0:	f007 0201 	and.w	r2, r7, #1
 8005ab4:	431a      	orrs	r2, r3
 8005ab6:	18c7      	adds	r7, r0, r3
 8005ab8:	2b0f      	cmp	r3, #15
 8005aba:	6042      	str	r2, [r0, #4]
 8005abc:	f8c7 e004 	str.w	lr, [r7, #4]
 8005ac0:	f8c7 e008 	str.w	lr, [r7, #8]
 8005ac4:	f200 812a 	bhi.w	8005d1c <malloc+0x498>
 8005ac8:	6bb3      	ldr	r3, [r6, #56]	; 0x38
 8005aca:	4299      	cmp	r1, r3
 8005acc:	6bf3      	ldr	r3, [r6, #60]	; 0x3c
 8005ace:	bf88      	it	hi
 8005ad0:	63b1      	strhi	r1, [r6, #56]	; 0x38
 8005ad2:	4299      	cmp	r1, r3
 8005ad4:	bf88      	it	hi
 8005ad6:	63f1      	strhi	r1, [r6, #60]	; 0x3c
 8005ad8:	68a8      	ldr	r0, [r5, #8]
 8005ada:	6843      	ldr	r3, [r0, #4]
 8005adc:	f023 0303 	bic.w	r3, r3, #3
 8005ae0:	1b1b      	subs	r3, r3, r4
 8005ae2:	2b0f      	cmp	r3, #15
 8005ae4:	dc68      	bgt.n	8005bb8 <malloc+0x334>
 8005ae6:	2000      	movs	r0, #0
 8005ae8:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8005aec:	68c2      	ldr	r2, [r0, #12]
 8005aee:	6881      	ldr	r1, [r0, #8]
 8005af0:	e6ea      	b.n	80058c8 <malloc+0x44>
 8005af2:	f044 0001 	orr.w	r0, r4, #1
 8005af6:	f042 0601 	orr.w	r6, r2, #1
 8005afa:	440c      	add	r4, r1
 8005afc:	6048      	str	r0, [r1, #4]
 8005afe:	616c      	str	r4, [r5, #20]
 8005b00:	612c      	str	r4, [r5, #16]
 8005b02:	f8c4 e00c 	str.w	lr, [r4, #12]
 8005b06:	f8c4 e008 	str.w	lr, [r4, #8]
 8005b0a:	6066      	str	r6, [r4, #4]
 8005b0c:	50ca      	str	r2, [r1, r3]
 8005b0e:	f101 0008 	add.w	r0, r1, #8
 8005b12:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8005b16:	2001      	movs	r0, #1
 8005b18:	08db      	lsrs	r3, r3, #3
 8005b1a:	686a      	ldr	r2, [r5, #4]
 8005b1c:	ea4f 09a3 	mov.w	r9, r3, asr #2
 8005b20:	fa00 f009 	lsl.w	r0, r0, r9
 8005b24:	4302      	orrs	r2, r0
 8005b26:	606a      	str	r2, [r5, #4]
 8005b28:	3301      	adds	r3, #1
 8005b2a:	f855 0033 	ldr.w	r0, [r5, r3, lsl #3]
 8005b2e:	eb05 02c3 	add.w	r2, r5, r3, lsl #3
 8005b32:	3a08      	subs	r2, #8
 8005b34:	6088      	str	r0, [r1, #8]
 8005b36:	60ca      	str	r2, [r1, #12]
 8005b38:	f845 1033 	str.w	r1, [r5, r3, lsl #3]
 8005b3c:	60c1      	str	r1, [r0, #12]
 8005b3e:	686b      	ldr	r3, [r5, #4]
 8005b40:	2101      	movs	r1, #1
 8005b42:	10ba      	asrs	r2, r7, #2
 8005b44:	4091      	lsls	r1, r2
 8005b46:	4299      	cmp	r1, r3
 8005b48:	f63f af44 	bhi.w	80059d4 <malloc+0x150>
 8005b4c:	420b      	tst	r3, r1
 8005b4e:	d053      	beq.n	8005bf8 <malloc+0x374>
 8005b50:	eb05 0ac7 	add.w	sl, r5, r7, lsl #3
 8005b54:	4650      	mov	r0, sl
 8005b56:	46b9      	mov	r9, r7
 8005b58:	68c3      	ldr	r3, [r0, #12]
 8005b5a:	4298      	cmp	r0, r3
 8005b5c:	d106      	bne.n	8005b6c <malloc+0x2e8>
 8005b5e:	e05b      	b.n	8005c18 <malloc+0x394>
 8005b60:	f1bb 0f00 	cmp.w	fp, #0
 8005b64:	da7f      	bge.n	8005c66 <malloc+0x3e2>
 8005b66:	68db      	ldr	r3, [r3, #12]
 8005b68:	4298      	cmp	r0, r3
 8005b6a:	d055      	beq.n	8005c18 <malloc+0x394>
 8005b6c:	685a      	ldr	r2, [r3, #4]
 8005b6e:	f022 0203 	bic.w	r2, r2, #3
 8005b72:	eba2 0b04 	sub.w	fp, r2, r4
 8005b76:	f1bb 0f0f 	cmp.w	fp, #15
 8005b7a:	ddf1      	ble.n	8005b60 <malloc+0x2dc>
 8005b7c:	6898      	ldr	r0, [r3, #8]
 8005b7e:	68d9      	ldr	r1, [r3, #12]
 8005b80:	f044 0601 	orr.w	r6, r4, #1
 8005b84:	605e      	str	r6, [r3, #4]
 8005b86:	441c      	add	r4, r3
 8005b88:	f04b 0601 	orr.w	r6, fp, #1
 8005b8c:	60c1      	str	r1, [r0, #12]
 8005b8e:	6088      	str	r0, [r1, #8]
 8005b90:	616c      	str	r4, [r5, #20]
 8005b92:	612c      	str	r4, [r5, #16]
 8005b94:	f8c4 e00c 	str.w	lr, [r4, #12]
 8005b98:	f8c4 e008 	str.w	lr, [r4, #8]
 8005b9c:	6066      	str	r6, [r4, #4]
 8005b9e:	f843 b002 	str.w	fp, [r3, r2]
 8005ba2:	f103 0008 	add.w	r0, r3, #8
 8005ba6:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8005baa:	bf00      	nop
 8005bac:	20003544 	.word	0x20003544
 8005bb0:	200000f0 	.word	0x200000f0
 8005bb4:	200000f8 	.word	0x200000f8
 8005bb8:	f044 0201 	orr.w	r2, r4, #1
 8005bbc:	f043 0301 	orr.w	r3, r3, #1
 8005bc0:	4404      	add	r4, r0
 8005bc2:	6042      	str	r2, [r0, #4]
 8005bc4:	60ac      	str	r4, [r5, #8]
 8005bc6:	6063      	str	r3, [r4, #4]
 8005bc8:	3008      	adds	r0, #8
 8005bca:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8005bce:	68d8      	ldr	r0, [r3, #12]
 8005bd0:	4283      	cmp	r3, r0
 8005bd2:	bf08      	it	eq
 8005bd4:	3702      	addeq	r7, #2
 8005bd6:	f43f aeb0 	beq.w	800593a <malloc+0xb6>
 8005bda:	e670      	b.n	80058be <malloc+0x3a>
 8005bdc:	f1be 0f54 	cmp.w	lr, #84	; 0x54
 8005be0:	d912      	bls.n	8005c08 <malloc+0x384>
 8005be2:	f5be 7faa 	cmp.w	lr, #340	; 0x154
 8005be6:	d850      	bhi.n	8005c8a <malloc+0x406>
 8005be8:	ea4f 3ed4 	mov.w	lr, r4, lsr #15
 8005bec:	f10e 0778 	add.w	r7, lr, #120	; 0x78
 8005bf0:	00f9      	lsls	r1, r7, #3
 8005bf2:	f10e 0e77 	add.w	lr, lr, #119	; 0x77
 8005bf6:	e68c      	b.n	8005912 <malloc+0x8e>
 8005bf8:	f027 0703 	bic.w	r7, r7, #3
 8005bfc:	0049      	lsls	r1, r1, #1
 8005bfe:	420b      	tst	r3, r1
 8005c00:	f107 0704 	add.w	r7, r7, #4
 8005c04:	d0fa      	beq.n	8005bfc <malloc+0x378>
 8005c06:	e7a3      	b.n	8005b50 <malloc+0x2cc>
 8005c08:	ea4f 3e14 	mov.w	lr, r4, lsr #12
 8005c0c:	f10e 076f 	add.w	r7, lr, #111	; 0x6f
 8005c10:	00f9      	lsls	r1, r7, #3
 8005c12:	f10e 0e6e 	add.w	lr, lr, #110	; 0x6e
 8005c16:	e67c      	b.n	8005912 <malloc+0x8e>
 8005c18:	f109 0901 	add.w	r9, r9, #1
 8005c1c:	f019 0f03 	tst.w	r9, #3
 8005c20:	f100 0008 	add.w	r0, r0, #8
 8005c24:	d198      	bne.n	8005b58 <malloc+0x2d4>
 8005c26:	e004      	b.n	8005c32 <malloc+0x3ae>
 8005c28:	f85a 3908 	ldr.w	r3, [sl], #-8
 8005c2c:	459a      	cmp	sl, r3
 8005c2e:	f040 8085 	bne.w	8005d3c <malloc+0x4b8>
 8005c32:	f017 0f03 	tst.w	r7, #3
 8005c36:	f107 37ff 	add.w	r7, r7, #4294967295	; 0xffffffff
 8005c3a:	d1f5      	bne.n	8005c28 <malloc+0x3a4>
 8005c3c:	686b      	ldr	r3, [r5, #4]
 8005c3e:	ea23 0301 	bic.w	r3, r3, r1
 8005c42:	606b      	str	r3, [r5, #4]
 8005c44:	0049      	lsls	r1, r1, #1
 8005c46:	4299      	cmp	r1, r3
 8005c48:	f63f aec4 	bhi.w	80059d4 <malloc+0x150>
 8005c4c:	2900      	cmp	r1, #0
 8005c4e:	f43f aec1 	beq.w	80059d4 <malloc+0x150>
 8005c52:	420b      	tst	r3, r1
 8005c54:	464f      	mov	r7, r9
 8005c56:	f47f af7b 	bne.w	8005b50 <malloc+0x2cc>
 8005c5a:	0049      	lsls	r1, r1, #1
 8005c5c:	420b      	tst	r3, r1
 8005c5e:	f107 0704 	add.w	r7, r7, #4
 8005c62:	d0fa      	beq.n	8005c5a <malloc+0x3d6>
 8005c64:	e774      	b.n	8005b50 <malloc+0x2cc>
 8005c66:	4618      	mov	r0, r3
 8005c68:	441a      	add	r2, r3
 8005c6a:	6851      	ldr	r1, [r2, #4]
 8005c6c:	f041 0101 	orr.w	r1, r1, #1
 8005c70:	6051      	str	r1, [r2, #4]
 8005c72:	68db      	ldr	r3, [r3, #12]
 8005c74:	f850 2f08 	ldr.w	r2, [r0, #8]!
 8005c78:	60d3      	str	r3, [r2, #12]
 8005c7a:	609a      	str	r2, [r3, #8]
 8005c7c:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8005c80:	4681      	mov	r9, r0
 8005c82:	e69d      	b.n	80059c0 <malloc+0x13c>
 8005c84:	f04f 0900 	mov.w	r9, #0
 8005c88:	e6cc      	b.n	8005a24 <malloc+0x1a0>
 8005c8a:	f240 5354 	movw	r3, #1364	; 0x554
 8005c8e:	459e      	cmp	lr, r3
 8005c90:	d819      	bhi.n	8005cc6 <malloc+0x442>
 8005c92:	ea4f 4e94 	mov.w	lr, r4, lsr #18
 8005c96:	f10e 077d 	add.w	r7, lr, #125	; 0x7d
 8005c9a:	00f9      	lsls	r1, r7, #3
 8005c9c:	f10e 0e7c 	add.w	lr, lr, #124	; 0x7c
 8005ca0:	e637      	b.n	8005912 <malloc+0x8e>
 8005ca2:	2814      	cmp	r0, #20
 8005ca4:	d821      	bhi.n	8005cea <malloc+0x466>
 8005ca6:	f100 025c 	add.w	r2, r0, #92	; 0x5c
 8005caa:	00d2      	lsls	r2, r2, #3
 8005cac:	f100 0a5b 	add.w	sl, r0, #91	; 0x5b
 8005cb0:	e675      	b.n	800599e <malloc+0x11a>
 8005cb2:	68f1      	ldr	r1, [r6, #12]
 8005cb4:	4419      	add	r1, r3
 8005cb6:	60f1      	str	r1, [r6, #12]
 8005cb8:	f47f aebc 	bne.w	8005a34 <malloc+0x1b0>
 8005cbc:	4413      	add	r3, r2
 8005cbe:	f043 0301 	orr.w	r3, r3, #1
 8005cc2:	6043      	str	r3, [r0, #4]
 8005cc4:	e700      	b.n	8005ac8 <malloc+0x244>
 8005cc6:	f44f 717e 	mov.w	r1, #1016	; 0x3f8
 8005cca:	277f      	movs	r7, #127	; 0x7f
 8005ccc:	f04f 0e7e 	mov.w	lr, #126	; 0x7e
 8005cd0:	e61f      	b.n	8005912 <malloc+0x8e>
 8005cd2:	2100      	movs	r1, #0
 8005cd4:	e6d4      	b.n	8005a80 <malloc+0x1fc>
 8005cd6:	2201      	movs	r2, #1
 8005cd8:	686b      	ldr	r3, [r5, #4]
 8005cda:	ea4f 00aa 	mov.w	r0, sl, asr #2
 8005cde:	fa02 f000 	lsl.w	r0, r2, r0
 8005ce2:	4303      	orrs	r3, r0
 8005ce4:	606b      	str	r3, [r5, #4]
 8005ce6:	464a      	mov	r2, r9
 8005ce8:	e66d      	b.n	80059c6 <malloc+0x142>
 8005cea:	2854      	cmp	r0, #84	; 0x54
 8005cec:	d80c      	bhi.n	8005d08 <malloc+0x484>
 8005cee:	0b18      	lsrs	r0, r3, #12
 8005cf0:	f100 026f 	add.w	r2, r0, #111	; 0x6f
 8005cf4:	00d2      	lsls	r2, r2, #3
 8005cf6:	f100 0a6e 	add.w	sl, r0, #110	; 0x6e
 8005cfa:	e650      	b.n	800599e <malloc+0x11a>
 8005cfc:	3310      	adds	r3, #16
 8005cfe:	e682      	b.n	8005a06 <malloc+0x182>
 8005d00:	2201      	movs	r2, #1
 8005d02:	68ab      	ldr	r3, [r5, #8]
 8005d04:	605a      	str	r2, [r3, #4]
 8005d06:	e6e7      	b.n	8005ad8 <malloc+0x254>
 8005d08:	f5b0 7faa 	cmp.w	r0, #340	; 0x154
 8005d0c:	d80b      	bhi.n	8005d26 <malloc+0x4a2>
 8005d0e:	0bd8      	lsrs	r0, r3, #15
 8005d10:	f100 0278 	add.w	r2, r0, #120	; 0x78
 8005d14:	00d2      	lsls	r2, r2, #3
 8005d16:	f100 0a77 	add.w	sl, r0, #119	; 0x77
 8005d1a:	e640      	b.n	800599e <malloc+0x11a>
 8005d1c:	3008      	adds	r0, #8
 8005d1e:	f7ff fcd3 	bl	80056c8 <free>
 8005d22:	68f1      	ldr	r1, [r6, #12]
 8005d24:	e6d0      	b.n	8005ac8 <malloc+0x244>
 8005d26:	f240 5254 	movw	r2, #1364	; 0x554
 8005d2a:	4290      	cmp	r0, r2
 8005d2c:	d808      	bhi.n	8005d40 <malloc+0x4bc>
 8005d2e:	0c98      	lsrs	r0, r3, #18
 8005d30:	f100 027d 	add.w	r2, r0, #125	; 0x7d
 8005d34:	00d2      	lsls	r2, r2, #3
 8005d36:	f100 0a7c 	add.w	sl, r0, #124	; 0x7c
 8005d3a:	e630      	b.n	800599e <malloc+0x11a>
 8005d3c:	686b      	ldr	r3, [r5, #4]
 8005d3e:	e781      	b.n	8005c44 <malloc+0x3c0>
 8005d40:	f44f 727e 	mov.w	r2, #1016	; 0x3f8
 8005d44:	f04f 0a7e 	mov.w	sl, #126	; 0x7e
 8005d48:	e629      	b.n	800599e <malloc+0x11a>
 8005d4a:	08e7      	lsrs	r7, r4, #3
 8005d4c:	f104 0308 	add.w	r3, r4, #8
 8005d50:	e5ad      	b.n	80058ae <malloc+0x2a>
 8005d52:	bf00      	nop

08005d54 <calloc>:
 8005d54:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8005d56:	4605      	mov	r5, r0
 8005d58:	4b1f      	ldr	r3, [pc, #124]	; (8005dd8 <calloc+0x84>)
 8005d5a:	fb01 f000 	mul.w	r0, r1, r0
 8005d5e:	689f      	ldr	r7, [r3, #8]
 8005d60:	687e      	ldr	r6, [r7, #4]
 8005d62:	f7ff fd8f 	bl	8005884 <malloc>
 8005d66:	2d00      	cmp	r5, #0
 8005d68:	db34      	blt.n	8005dd4 <calloc+0x80>
 8005d6a:	4604      	mov	r4, r0
 8005d6c:	b1f8      	cbz	r0, 8005dae <calloc+0x5a>
 8005d6e:	f850 2c04 	ldr.w	r2, [r0, #-4]
 8005d72:	f1a0 0308 	sub.w	r3, r0, #8
 8005d76:	429f      	cmp	r7, r3
 8005d78:	f022 0203 	bic.w	r2, r2, #3
 8005d7c:	d024      	beq.n	8005dc8 <calloc+0x74>
 8005d7e:	3a04      	subs	r2, #4
 8005d80:	2a24      	cmp	r2, #36	; 0x24
 8005d82:	d818      	bhi.n	8005db6 <calloc+0x62>
 8005d84:	2a13      	cmp	r2, #19
 8005d86:	d914      	bls.n	8005db2 <calloc+0x5e>
 8005d88:	2300      	movs	r3, #0
 8005d8a:	2a1b      	cmp	r2, #27
 8005d8c:	6023      	str	r3, [r4, #0]
 8005d8e:	6063      	str	r3, [r4, #4]
 8005d90:	d917      	bls.n	8005dc2 <calloc+0x6e>
 8005d92:	2a24      	cmp	r2, #36	; 0x24
 8005d94:	60a3      	str	r3, [r4, #8]
 8005d96:	60e3      	str	r3, [r4, #12]
 8005d98:	bf11      	iteee	ne
 8005d9a:	f104 0210 	addne.w	r2, r4, #16
 8005d9e:	6123      	streq	r3, [r4, #16]
 8005da0:	6163      	streq	r3, [r4, #20]
 8005da2:	f104 0218 	addeq.w	r2, r4, #24
 8005da6:	2300      	movs	r3, #0
 8005da8:	6013      	str	r3, [r2, #0]
 8005daa:	6053      	str	r3, [r2, #4]
 8005dac:	6093      	str	r3, [r2, #8]
 8005dae:	4620      	mov	r0, r4
 8005db0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8005db2:	4622      	mov	r2, r4
 8005db4:	e7f7      	b.n	8005da6 <calloc+0x52>
 8005db6:	2100      	movs	r1, #0
 8005db8:	4620      	mov	r0, r4
 8005dba:	f7fa fc89 	bl	80006d0 <memset>
 8005dbe:	4620      	mov	r0, r4
 8005dc0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8005dc2:	f104 0208 	add.w	r2, r4, #8
 8005dc6:	e7ee      	b.n	8005da6 <calloc+0x52>
 8005dc8:	f026 0603 	bic.w	r6, r6, #3
 8005dcc:	42b2      	cmp	r2, r6
 8005dce:	bf28      	it	cs
 8005dd0:	4632      	movcs	r2, r6
 8005dd2:	e7d4      	b.n	8005d7e <calloc+0x2a>
 8005dd4:	2400      	movs	r4, #0
 8005dd6:	e7ea      	b.n	8005dae <calloc+0x5a>
 8005dd8:	200000f0 	.word	0x200000f0

08005ddc <realloc>:
 8005ddc:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8005de0:	2900      	cmp	r1, #0
 8005de2:	b082      	sub	sp, #8
 8005de4:	f2c0 815c 	blt.w	80060a0 <realloc+0x2c4>
 8005de8:	2800      	cmp	r0, #0
 8005dea:	f000 815c 	beq.w	80060a6 <realloc+0x2ca>
 8005dee:	f101 060b 	add.w	r6, r1, #11
 8005df2:	2e16      	cmp	r6, #22
 8005df4:	bfca      	itet	gt
 8005df6:	f026 0607 	bicgt.w	r6, r6, #7
 8005dfa:	2210      	movle	r2, #16
 8005dfc:	4632      	movgt	r2, r6
 8005dfe:	f850 ec04 	ldr.w	lr, [r0, #-4]
 8005e02:	bfd8      	it	le
 8005e04:	4616      	movle	r6, r2
 8005e06:	f02e 0503 	bic.w	r5, lr, #3
 8005e0a:	4295      	cmp	r5, r2
 8005e0c:	f1a0 0708 	sub.w	r7, r0, #8
 8005e10:	4604      	mov	r4, r0
 8005e12:	db12      	blt.n	8005e3a <realloc+0x5e>
 8005e14:	4681      	mov	r9, r0
 8005e16:	1bab      	subs	r3, r5, r6
 8005e18:	2b0f      	cmp	r3, #15
 8005e1a:	687a      	ldr	r2, [r7, #4]
 8005e1c:	f200 808b 	bhi.w	8005f36 <realloc+0x15a>
 8005e20:	f002 0201 	and.w	r2, r2, #1
 8005e24:	432a      	orrs	r2, r5
 8005e26:	1979      	adds	r1, r7, r5
 8005e28:	607a      	str	r2, [r7, #4]
 8005e2a:	684b      	ldr	r3, [r1, #4]
 8005e2c:	f043 0301 	orr.w	r3, r3, #1
 8005e30:	604b      	str	r3, [r1, #4]
 8005e32:	4648      	mov	r0, r9
 8005e34:	b002      	add	sp, #8
 8005e36:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8005e3a:	4bbe      	ldr	r3, [pc, #760]	; (8006134 <realloc+0x358>)
 8005e3c:	eb07 0c05 	add.w	ip, r7, r5
 8005e40:	6898      	ldr	r0, [r3, #8]
 8005e42:	4584      	cmp	ip, r0
 8005e44:	f000 80b1 	beq.w	8005faa <realloc+0x1ce>
 8005e48:	f8dc 3004 	ldr.w	r3, [ip, #4]
 8005e4c:	f023 0001 	bic.w	r0, r3, #1
 8005e50:	4460      	add	r0, ip
 8005e52:	6840      	ldr	r0, [r0, #4]
 8005e54:	07c0      	lsls	r0, r0, #31
 8005e56:	d52e      	bpl.n	8005eb6 <realloc+0xda>
 8005e58:	f01e 0f01 	tst.w	lr, #1
 8005e5c:	f000 8088 	beq.w	8005f70 <realloc+0x194>
 8005e60:	4608      	mov	r0, r1
 8005e62:	f7ff fd0f 	bl	8005884 <malloc>
 8005e66:	4681      	mov	r9, r0
 8005e68:	2800      	cmp	r0, #0
 8005e6a:	f000 8119 	beq.w	80060a0 <realloc+0x2c4>
 8005e6e:	f854 3c04 	ldr.w	r3, [r4, #-4]
 8005e72:	f1a0 0208 	sub.w	r2, r0, #8
 8005e76:	f023 0301 	bic.w	r3, r3, #1
 8005e7a:	443b      	add	r3, r7
 8005e7c:	429a      	cmp	r2, r3
 8005e7e:	f000 811c 	beq.w	80060ba <realloc+0x2de>
 8005e82:	1f2a      	subs	r2, r5, #4
 8005e84:	2a24      	cmp	r2, #36	; 0x24
 8005e86:	f200 8114 	bhi.w	80060b2 <realloc+0x2d6>
 8005e8a:	2a13      	cmp	r2, #19
 8005e8c:	f240 80d4 	bls.w	8006038 <realloc+0x25c>
 8005e90:	6823      	ldr	r3, [r4, #0]
 8005e92:	2a1b      	cmp	r2, #27
 8005e94:	6003      	str	r3, [r0, #0]
 8005e96:	6863      	ldr	r3, [r4, #4]
 8005e98:	6043      	str	r3, [r0, #4]
 8005e9a:	f240 80f7 	bls.w	800608c <realloc+0x2b0>
 8005e9e:	68a3      	ldr	r3, [r4, #8]
 8005ea0:	2a24      	cmp	r2, #36	; 0x24
 8005ea2:	6083      	str	r3, [r0, #8]
 8005ea4:	68e3      	ldr	r3, [r4, #12]
 8005ea6:	60c3      	str	r3, [r0, #12]
 8005ea8:	f000 810e 	beq.w	80060c8 <realloc+0x2ec>
 8005eac:	f100 0310 	add.w	r3, r0, #16
 8005eb0:	f104 0210 	add.w	r2, r4, #16
 8005eb4:	e0c2      	b.n	800603c <realloc+0x260>
 8005eb6:	f023 0903 	bic.w	r9, r3, #3
 8005eba:	eb05 0309 	add.w	r3, r5, r9
 8005ebe:	4293      	cmp	r3, r2
 8005ec0:	da4d      	bge.n	8005f5e <realloc+0x182>
 8005ec2:	f01e 0f01 	tst.w	lr, #1
 8005ec6:	d1cb      	bne.n	8005e60 <realloc+0x84>
 8005ec8:	f854 0c08 	ldr.w	r0, [r4, #-8]
 8005ecc:	eba7 0a00 	sub.w	sl, r7, r0
 8005ed0:	f8da 3004 	ldr.w	r3, [sl, #4]
 8005ed4:	f023 0003 	bic.w	r0, r3, #3
 8005ed8:	eb00 0309 	add.w	r3, r0, r9
 8005edc:	442b      	add	r3, r5
 8005ede:	4293      	cmp	r3, r2
 8005ee0:	db4e      	blt.n	8005f80 <realloc+0x1a4>
 8005ee2:	46d1      	mov	r9, sl
 8005ee4:	f8dc 100c 	ldr.w	r1, [ip, #12]
 8005ee8:	f8dc 0008 	ldr.w	r0, [ip, #8]
 8005eec:	1f2a      	subs	r2, r5, #4
 8005eee:	60c1      	str	r1, [r0, #12]
 8005ef0:	6088      	str	r0, [r1, #8]
 8005ef2:	f8da 100c 	ldr.w	r1, [sl, #12]
 8005ef6:	f859 0f08 	ldr.w	r0, [r9, #8]!
 8005efa:	2a24      	cmp	r2, #36	; 0x24
 8005efc:	60c1      	str	r1, [r0, #12]
 8005efe:	6088      	str	r0, [r1, #8]
 8005f00:	d84c      	bhi.n	8005f9c <realloc+0x1c0>
 8005f02:	2a13      	cmp	r2, #19
 8005f04:	f240 80a7 	bls.w	8006056 <realloc+0x27a>
 8005f08:	6821      	ldr	r1, [r4, #0]
 8005f0a:	2a1b      	cmp	r2, #27
 8005f0c:	f8ca 1008 	str.w	r1, [sl, #8]
 8005f10:	6861      	ldr	r1, [r4, #4]
 8005f12:	f8ca 100c 	str.w	r1, [sl, #12]
 8005f16:	f240 80be 	bls.w	8006096 <realloc+0x2ba>
 8005f1a:	68a1      	ldr	r1, [r4, #8]
 8005f1c:	2a24      	cmp	r2, #36	; 0x24
 8005f1e:	f8ca 1010 	str.w	r1, [sl, #16]
 8005f22:	68e1      	ldr	r1, [r4, #12]
 8005f24:	f8ca 1014 	str.w	r1, [sl, #20]
 8005f28:	f000 80d7 	beq.w	80060da <realloc+0x2fe>
 8005f2c:	f104 0110 	add.w	r1, r4, #16
 8005f30:	f10a 0218 	add.w	r2, sl, #24
 8005f34:	e091      	b.n	800605a <realloc+0x27e>
 8005f36:	f002 0201 	and.w	r2, r2, #1
 8005f3a:	4332      	orrs	r2, r6
 8005f3c:	19b8      	adds	r0, r7, r6
 8005f3e:	f043 0301 	orr.w	r3, r3, #1
 8005f42:	607a      	str	r2, [r7, #4]
 8005f44:	443d      	add	r5, r7
 8005f46:	6043      	str	r3, [r0, #4]
 8005f48:	686b      	ldr	r3, [r5, #4]
 8005f4a:	3008      	adds	r0, #8
 8005f4c:	f043 0301 	orr.w	r3, r3, #1
 8005f50:	606b      	str	r3, [r5, #4]
 8005f52:	f7ff fbb9 	bl	80056c8 <free>
 8005f56:	4648      	mov	r0, r9
 8005f58:	b002      	add	sp, #8
 8005f5a:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8005f5e:	f8dc 200c 	ldr.w	r2, [ip, #12]
 8005f62:	f8dc 1008 	ldr.w	r1, [ip, #8]
 8005f66:	46a1      	mov	r9, r4
 8005f68:	60ca      	str	r2, [r1, #12]
 8005f6a:	461d      	mov	r5, r3
 8005f6c:	6091      	str	r1, [r2, #8]
 8005f6e:	e752      	b.n	8005e16 <realloc+0x3a>
 8005f70:	f854 3c08 	ldr.w	r3, [r4, #-8]
 8005f74:	eba7 0a03 	sub.w	sl, r7, r3
 8005f78:	f8da 0004 	ldr.w	r0, [sl, #4]
 8005f7c:	f020 0003 	bic.w	r0, r0, #3
 8005f80:	182b      	adds	r3, r5, r0
 8005f82:	4293      	cmp	r3, r2
 8005f84:	f6ff af6c 	blt.w	8005e60 <realloc+0x84>
 8005f88:	46d1      	mov	r9, sl
 8005f8a:	f8da 100c 	ldr.w	r1, [sl, #12]
 8005f8e:	f859 0f08 	ldr.w	r0, [r9, #8]!
 8005f92:	1f2a      	subs	r2, r5, #4
 8005f94:	2a24      	cmp	r2, #36	; 0x24
 8005f96:	60c1      	str	r1, [r0, #12]
 8005f98:	6088      	str	r0, [r1, #8]
 8005f9a:	d9b2      	bls.n	8005f02 <realloc+0x126>
 8005f9c:	4621      	mov	r1, r4
 8005f9e:	4648      	mov	r0, r9
 8005fa0:	461d      	mov	r5, r3
 8005fa2:	4657      	mov	r7, sl
 8005fa4:	f7fa fbd4 	bl	8000750 <memcpy>
 8005fa8:	e735      	b.n	8005e16 <realloc+0x3a>
 8005faa:	f8dc 0004 	ldr.w	r0, [ip, #4]
 8005fae:	f106 0c10 	add.w	ip, r6, #16
 8005fb2:	f020 0b03 	bic.w	fp, r0, #3
 8005fb6:	44ab      	add	fp, r5
 8005fb8:	45e3      	cmp	fp, ip
 8005fba:	da57      	bge.n	800606c <realloc+0x290>
 8005fbc:	f01e 0f01 	tst.w	lr, #1
 8005fc0:	f47f af4e 	bne.w	8005e60 <realloc+0x84>
 8005fc4:	f854 0c08 	ldr.w	r0, [r4, #-8]
 8005fc8:	eba7 0a00 	sub.w	sl, r7, r0
 8005fcc:	f8da 0004 	ldr.w	r0, [sl, #4]
 8005fd0:	f020 0003 	bic.w	r0, r0, #3
 8005fd4:	4483      	add	fp, r0
 8005fd6:	45dc      	cmp	ip, fp
 8005fd8:	dcd2      	bgt.n	8005f80 <realloc+0x1a4>
 8005fda:	46d1      	mov	r9, sl
 8005fdc:	f8da 100c 	ldr.w	r1, [sl, #12]
 8005fe0:	f859 0f08 	ldr.w	r0, [r9, #8]!
 8005fe4:	1f2a      	subs	r2, r5, #4
 8005fe6:	2a24      	cmp	r2, #36	; 0x24
 8005fe8:	60c1      	str	r1, [r0, #12]
 8005fea:	6088      	str	r0, [r1, #8]
 8005fec:	f200 8083 	bhi.w	80060f6 <realloc+0x31a>
 8005ff0:	2a13      	cmp	r2, #19
 8005ff2:	d97d      	bls.n	80060f0 <realloc+0x314>
 8005ff4:	6821      	ldr	r1, [r4, #0]
 8005ff6:	2a1b      	cmp	r2, #27
 8005ff8:	f8ca 1008 	str.w	r1, [sl, #8]
 8005ffc:	6861      	ldr	r1, [r4, #4]
 8005ffe:	f8ca 100c 	str.w	r1, [sl, #12]
 8006002:	d87f      	bhi.n	8006104 <realloc+0x328>
 8006004:	f104 0108 	add.w	r1, r4, #8
 8006008:	f10a 0210 	add.w	r2, sl, #16
 800600c:	6808      	ldr	r0, [r1, #0]
 800600e:	6010      	str	r0, [r2, #0]
 8006010:	6848      	ldr	r0, [r1, #4]
 8006012:	6050      	str	r0, [r2, #4]
 8006014:	6889      	ldr	r1, [r1, #8]
 8006016:	6091      	str	r1, [r2, #8]
 8006018:	ebab 0206 	sub.w	r2, fp, r6
 800601c:	eb0a 0106 	add.w	r1, sl, r6
 8006020:	f042 0201 	orr.w	r2, r2, #1
 8006024:	6099      	str	r1, [r3, #8]
 8006026:	604a      	str	r2, [r1, #4]
 8006028:	f8da 3004 	ldr.w	r3, [sl, #4]
 800602c:	f003 0301 	and.w	r3, r3, #1
 8006030:	431e      	orrs	r6, r3
 8006032:	f8ca 6004 	str.w	r6, [sl, #4]
 8006036:	e6fc      	b.n	8005e32 <realloc+0x56>
 8006038:	4603      	mov	r3, r0
 800603a:	4622      	mov	r2, r4
 800603c:	6811      	ldr	r1, [r2, #0]
 800603e:	6019      	str	r1, [r3, #0]
 8006040:	6851      	ldr	r1, [r2, #4]
 8006042:	6059      	str	r1, [r3, #4]
 8006044:	6892      	ldr	r2, [r2, #8]
 8006046:	609a      	str	r2, [r3, #8]
 8006048:	4620      	mov	r0, r4
 800604a:	f7ff fb3d 	bl	80056c8 <free>
 800604e:	4648      	mov	r0, r9
 8006050:	b002      	add	sp, #8
 8006052:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8006056:	4621      	mov	r1, r4
 8006058:	464a      	mov	r2, r9
 800605a:	6808      	ldr	r0, [r1, #0]
 800605c:	461d      	mov	r5, r3
 800605e:	6010      	str	r0, [r2, #0]
 8006060:	6848      	ldr	r0, [r1, #4]
 8006062:	4657      	mov	r7, sl
 8006064:	6050      	str	r0, [r2, #4]
 8006066:	688b      	ldr	r3, [r1, #8]
 8006068:	6093      	str	r3, [r2, #8]
 800606a:	e6d4      	b.n	8005e16 <realloc+0x3a>
 800606c:	ebab 0b06 	sub.w	fp, fp, r6
 8006070:	4437      	add	r7, r6
 8006072:	f04b 0201 	orr.w	r2, fp, #1
 8006076:	609f      	str	r7, [r3, #8]
 8006078:	607a      	str	r2, [r7, #4]
 800607a:	f854 3c04 	ldr.w	r3, [r4, #-4]
 800607e:	46a1      	mov	r9, r4
 8006080:	f003 0301 	and.w	r3, r3, #1
 8006084:	431e      	orrs	r6, r3
 8006086:	f844 6c04 	str.w	r6, [r4, #-4]
 800608a:	e6d2      	b.n	8005e32 <realloc+0x56>
 800608c:	f100 0308 	add.w	r3, r0, #8
 8006090:	f104 0208 	add.w	r2, r4, #8
 8006094:	e7d2      	b.n	800603c <realloc+0x260>
 8006096:	f104 0108 	add.w	r1, r4, #8
 800609a:	f10a 0210 	add.w	r2, sl, #16
 800609e:	e7dc      	b.n	800605a <realloc+0x27e>
 80060a0:	f04f 0900 	mov.w	r9, #0
 80060a4:	e6c5      	b.n	8005e32 <realloc+0x56>
 80060a6:	4608      	mov	r0, r1
 80060a8:	b002      	add	sp, #8
 80060aa:	e8bd 4ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 80060ae:	f7ff bbe9 	b.w	8005884 <malloc>
 80060b2:	4621      	mov	r1, r4
 80060b4:	f7fa fb4c 	bl	8000750 <memcpy>
 80060b8:	e7c6      	b.n	8006048 <realloc+0x26c>
 80060ba:	f850 3c04 	ldr.w	r3, [r0, #-4]
 80060be:	46a1      	mov	r9, r4
 80060c0:	f023 0303 	bic.w	r3, r3, #3
 80060c4:	441d      	add	r5, r3
 80060c6:	e6a6      	b.n	8005e16 <realloc+0x3a>
 80060c8:	6922      	ldr	r2, [r4, #16]
 80060ca:	f100 0318 	add.w	r3, r0, #24
 80060ce:	6102      	str	r2, [r0, #16]
 80060d0:	6961      	ldr	r1, [r4, #20]
 80060d2:	f104 0218 	add.w	r2, r4, #24
 80060d6:	6141      	str	r1, [r0, #20]
 80060d8:	e7b0      	b.n	800603c <realloc+0x260>
 80060da:	6922      	ldr	r2, [r4, #16]
 80060dc:	f104 0118 	add.w	r1, r4, #24
 80060e0:	f8ca 2018 	str.w	r2, [sl, #24]
 80060e4:	6960      	ldr	r0, [r4, #20]
 80060e6:	f10a 0220 	add.w	r2, sl, #32
 80060ea:	f8ca 001c 	str.w	r0, [sl, #28]
 80060ee:	e7b4      	b.n	800605a <realloc+0x27e>
 80060f0:	4621      	mov	r1, r4
 80060f2:	464a      	mov	r2, r9
 80060f4:	e78a      	b.n	800600c <realloc+0x230>
 80060f6:	4621      	mov	r1, r4
 80060f8:	4648      	mov	r0, r9
 80060fa:	9301      	str	r3, [sp, #4]
 80060fc:	f7fa fb28 	bl	8000750 <memcpy>
 8006100:	9b01      	ldr	r3, [sp, #4]
 8006102:	e789      	b.n	8006018 <realloc+0x23c>
 8006104:	68a1      	ldr	r1, [r4, #8]
 8006106:	2a24      	cmp	r2, #36	; 0x24
 8006108:	f8ca 1010 	str.w	r1, [sl, #16]
 800610c:	68e1      	ldr	r1, [r4, #12]
 800610e:	f8ca 1014 	str.w	r1, [sl, #20]
 8006112:	d004      	beq.n	800611e <realloc+0x342>
 8006114:	f104 0110 	add.w	r1, r4, #16
 8006118:	f10a 0218 	add.w	r2, sl, #24
 800611c:	e776      	b.n	800600c <realloc+0x230>
 800611e:	6922      	ldr	r2, [r4, #16]
 8006120:	f104 0118 	add.w	r1, r4, #24
 8006124:	f8ca 2018 	str.w	r2, [sl, #24]
 8006128:	6960      	ldr	r0, [r4, #20]
 800612a:	f10a 0220 	add.w	r2, sl, #32
 800612e:	f8ca 001c 	str.w	r0, [sl, #28]
 8006132:	e76b      	b.n	800600c <realloc+0x230>
 8006134:	200000f0 	.word	0x200000f0

08006138 <memalign>:
 8006138:	2900      	cmp	r1, #0
 800613a:	db5e      	blt.n	80061fa <memalign+0xc2>
 800613c:	2808      	cmp	r0, #8
 800613e:	d957      	bls.n	80061f0 <memalign+0xb8>
 8006140:	2810      	cmp	r0, #16
 8006142:	f101 010b 	add.w	r1, r1, #11
 8006146:	bf38      	it	cc
 8006148:	2010      	movcc	r0, #16
 800614a:	2916      	cmp	r1, #22
 800614c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800614e:	bfd4      	ite	le
 8006150:	2510      	movle	r5, #16
 8006152:	f021 0507 	bicgt.w	r5, r1, #7
 8006156:	4604      	mov	r4, r0
 8006158:	3010      	adds	r0, #16
 800615a:	4428      	add	r0, r5
 800615c:	f7ff fb92 	bl	8005884 <malloc>
 8006160:	2800      	cmp	r0, #0
 8006162:	d048      	beq.n	80061f6 <memalign+0xbe>
 8006164:	fbb0 f2f4 	udiv	r2, r0, r4
 8006168:	fb04 0212 	mls	r2, r4, r2, r0
 800616c:	f1a0 0608 	sub.w	r6, r0, #8
 8006170:	b942      	cbnz	r2, 8006184 <memalign+0x4c>
 8006172:	6873      	ldr	r3, [r6, #4]
 8006174:	f023 0303 	bic.w	r3, r3, #3
 8006178:	1b5b      	subs	r3, r3, r5
 800617a:	2b0f      	cmp	r3, #15
 800617c:	dc29      	bgt.n	80061d2 <memalign+0x9a>
 800617e:	f106 0008 	add.w	r0, r6, #8
 8006182:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8006184:	1e62      	subs	r2, r4, #1
 8006186:	4261      	negs	r1, r4
 8006188:	4402      	add	r2, r0
 800618a:	400a      	ands	r2, r1
 800618c:	3a08      	subs	r2, #8
 800618e:	1b97      	subs	r7, r2, r6
 8006190:	2f0f      	cmp	r7, #15
 8006192:	bf9c      	itt	ls
 8006194:	1912      	addls	r2, r2, r4
 8006196:	1b97      	subls	r7, r2, r6
 8006198:	4616      	mov	r6, r2
 800619a:	f850 1c04 	ldr.w	r1, [r0, #-4]
 800619e:	f021 0103 	bic.w	r1, r1, #3
 80061a2:	1bc9      	subs	r1, r1, r7
 80061a4:	f041 0401 	orr.w	r4, r1, #1
 80061a8:	6054      	str	r4, [r2, #4]
 80061aa:	4411      	add	r1, r2
 80061ac:	684c      	ldr	r4, [r1, #4]
 80061ae:	f044 0401 	orr.w	r4, r4, #1
 80061b2:	604c      	str	r4, [r1, #4]
 80061b4:	f850 2c04 	ldr.w	r2, [r0, #-4]
 80061b8:	f002 0201 	and.w	r2, r2, #1
 80061bc:	433a      	orrs	r2, r7
 80061be:	f840 2c04 	str.w	r2, [r0, #-4]
 80061c2:	f7ff fa81 	bl	80056c8 <free>
 80061c6:	6873      	ldr	r3, [r6, #4]
 80061c8:	f023 0303 	bic.w	r3, r3, #3
 80061cc:	1b5b      	subs	r3, r3, r5
 80061ce:	2b0f      	cmp	r3, #15
 80061d0:	ddd5      	ble.n	800617e <memalign+0x46>
 80061d2:	1970      	adds	r0, r6, r5
 80061d4:	f043 0301 	orr.w	r3, r3, #1
 80061d8:	6043      	str	r3, [r0, #4]
 80061da:	6873      	ldr	r3, [r6, #4]
 80061dc:	3008      	adds	r0, #8
 80061de:	f003 0301 	and.w	r3, r3, #1
 80061e2:	431d      	orrs	r5, r3
 80061e4:	6075      	str	r5, [r6, #4]
 80061e6:	f7ff fa6f 	bl	80056c8 <free>
 80061ea:	f106 0008 	add.w	r0, r6, #8
 80061ee:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80061f0:	4608      	mov	r0, r1
 80061f2:	f7ff bb47 	b.w	8005884 <malloc>
 80061f6:	2000      	movs	r0, #0
 80061f8:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80061fa:	2000      	movs	r0, #0
 80061fc:	4770      	bx	lr
 80061fe:	bf00      	nop

08006200 <valloc>:
 8006200:	4601      	mov	r1, r0
 8006202:	f44f 5080 	mov.w	r0, #4096	; 0x1000
 8006206:	f7ff bf97 	b.w	8006138 <memalign>
 800620a:	bf00      	nop

0800620c <pvalloc>:
 800620c:	f600 71ff 	addw	r1, r0, #4095	; 0xfff
 8006210:	f421 617f 	bic.w	r1, r1, #4080	; 0xff0
 8006214:	f021 010f 	bic.w	r1, r1, #15
 8006218:	f44f 5080 	mov.w	r0, #4096	; 0x1000
 800621c:	f7ff bf8c 	b.w	8006138 <memalign>

08006220 <cfree>:
 8006220:	f7ff ba52 	b.w	80056c8 <free>

08006224 <malloc_usable_size>:
 8006224:	4602      	mov	r2, r0
 8006226:	b1a0      	cbz	r0, 8006252 <malloc_usable_size+0x2e>
 8006228:	f850 3c04 	ldr.w	r3, [r0, #-4]
 800622c:	f013 0002 	ands.w	r0, r3, #2
 8006230:	d10a      	bne.n	8006248 <malloc_usable_size+0x24>
 8006232:	f023 0101 	bic.w	r1, r3, #1
 8006236:	440a      	add	r2, r1
 8006238:	f852 2c04 	ldr.w	r2, [r2, #-4]
 800623c:	07d2      	lsls	r2, r2, #31
 800623e:	d508      	bpl.n	8006252 <malloc_usable_size+0x2e>
 8006240:	f023 0303 	bic.w	r3, r3, #3
 8006244:	1f18      	subs	r0, r3, #4
 8006246:	4770      	bx	lr
 8006248:	f023 0303 	bic.w	r3, r3, #3
 800624c:	f1a3 0008 	sub.w	r0, r3, #8
 8006250:	4770      	bx	lr
 8006252:	4770      	bx	lr

08006254 <mallopt>:
 8006254:	3004      	adds	r0, #4
 8006256:	2803      	cmp	r0, #3
 8006258:	d812      	bhi.n	8006280 <mallopt+0x2c>
 800625a:	e8df f000 	tbb	[pc, r0]
 800625e:	0b0d      	.short	0x0b0d
 8006260:	0207      	.short	0x0207
 8006262:	4b08      	ldr	r3, [pc, #32]	; (8006284 <mallopt+0x30>)
 8006264:	2001      	movs	r0, #1
 8006266:	f8c3 140c 	str.w	r1, [r3, #1036]	; 0x40c
 800626a:	4770      	bx	lr
 800626c:	4b06      	ldr	r3, [pc, #24]	; (8006288 <mallopt+0x34>)
 800626e:	2001      	movs	r0, #1
 8006270:	6359      	str	r1, [r3, #52]	; 0x34
 8006272:	4770      	bx	lr
 8006274:	2001      	movs	r0, #1
 8006276:	4770      	bx	lr
 8006278:	fab1 f081 	clz	r0, r1
 800627c:	0940      	lsrs	r0, r0, #5
 800627e:	4770      	bx	lr
 8006280:	2000      	movs	r0, #0
 8006282:	4770      	bx	lr
 8006284:	200000f0 	.word	0x200000f0
 8006288:	20003544 	.word	0x20003544

0800628c <env_crc_update>:
 800628c:	4b05      	ldr	r3, [pc, #20]	; (80062a4 <env_crc_update+0x18>)
 800628e:	b510      	push	{r4, lr}
 8006290:	681c      	ldr	r4, [r3, #0]
 8006292:	f640 72fc 	movw	r2, #4092	; 0xffc
 8006296:	2000      	movs	r0, #0
 8006298:	1d21      	adds	r1, r4, #4
 800629a:	f001 fd75 	bl	8007d88 <crc32>
 800629e:	6020      	str	r0, [r4, #0]
 80062a0:	bd10      	pop	{r4, pc}
 80062a2:	bf00      	nop
 80062a4:	20003584 	.word	0x20003584

080062a8 <env_get_char_memory>:
 80062a8:	f8d8 2014 	ldr.w	r2, [r8, #20]
 80062ac:	b912      	cbnz	r2, 80062b4 <env_get_char_memory+0xc>
 80062ae:	4b03      	ldr	r3, [pc, #12]	; (80062bc <env_get_char_memory+0x14>)
 80062b0:	5c18      	ldrb	r0, [r3, r0]
 80062b2:	4770      	bx	lr
 80062b4:	f8d8 3010 	ldr.w	r3, [r8, #16]
 80062b8:	5cc0      	ldrb	r0, [r0, r3]
 80062ba:	4770      	bx	lr
 80062bc:	20000500 	.word	0x20000500

080062c0 <env_get_char>:
 80062c0:	f8d8 2004 	ldr.w	r2, [r8, #4]
 80062c4:	4601      	mov	r1, r0
 80062c6:	07d2      	lsls	r2, r2, #31
 80062c8:	d505      	bpl.n	80062d6 <env_get_char+0x16>
 80062ca:	f8d8 2014 	ldr.w	r2, [r8, #20]
 80062ce:	b942      	cbnz	r2, 80062e2 <env_get_char+0x22>
 80062d0:	4b06      	ldr	r3, [pc, #24]	; (80062ec <env_get_char+0x2c>)
 80062d2:	5c58      	ldrb	r0, [r3, r1]
 80062d4:	4770      	bx	lr
 80062d6:	f8d8 3014 	ldr.w	r3, [r8, #20]
 80062da:	2b00      	cmp	r3, #0
 80062dc:	d0f8      	beq.n	80062d0 <env_get_char+0x10>
 80062de:	f000 b857 	b.w	8006390 <env_get_char_spec>
 80062e2:	f8d8 3010 	ldr.w	r3, [r8, #16]
 80062e6:	5cc0      	ldrb	r0, [r0, r3]
 80062e8:	4770      	bx	lr
 80062ea:	bf00      	nop
 80062ec:	20000500 	.word	0x20000500

080062f0 <env_get_addr>:
 80062f0:	f8d8 2014 	ldr.w	r2, [r8, #20]
 80062f4:	b912      	cbnz	r2, 80062fc <env_get_addr+0xc>
 80062f6:	4b03      	ldr	r3, [pc, #12]	; (8006304 <env_get_addr+0x14>)
 80062f8:	4418      	add	r0, r3
 80062fa:	4770      	bx	lr
 80062fc:	f8d8 3010 	ldr.w	r3, [r8, #16]
 8006300:	4418      	add	r0, r3
 8006302:	4770      	bx	lr
 8006304:	20000500 	.word	0x20000500

08006308 <set_default_env>:
 8006308:	b510      	push	{r4, lr}
 800630a:	4c0d      	ldr	r4, [pc, #52]	; (8006340 <set_default_env+0x38>)
 800630c:	f44f 5280 	mov.w	r2, #4096	; 0x1000
 8006310:	6820      	ldr	r0, [r4, #0]
 8006312:	2100      	movs	r1, #0
 8006314:	f7fa f9dc 	bl	80006d0 <memset>
 8006318:	6820      	ldr	r0, [r4, #0]
 800631a:	f240 2295 	movw	r2, #661	; 0x295
 800631e:	4909      	ldr	r1, [pc, #36]	; (8006344 <set_default_env+0x3c>)
 8006320:	3004      	adds	r0, #4
 8006322:	f7fa fa15 	bl	8000750 <memcpy>
 8006326:	6824      	ldr	r4, [r4, #0]
 8006328:	f640 72fc 	movw	r2, #4092	; 0xffc
 800632c:	1d21      	adds	r1, r4, #4
 800632e:	2000      	movs	r0, #0
 8006330:	f001 fd2a 	bl	8007d88 <crc32>
 8006334:	2201      	movs	r2, #1
 8006336:	6020      	str	r0, [r4, #0]
 8006338:	f8c8 2014 	str.w	r2, [r8, #20]
 800633c:	bd10      	pop	{r4, pc}
 800633e:	bf00      	nop
 8006340:	20003584 	.word	0x20003584
 8006344:	20000500 	.word	0x20000500

08006348 <env_relocate>:
 8006348:	b510      	push	{r4, lr}
 800634a:	f44f 5080 	mov.w	r0, #4096	; 0x1000
 800634e:	f7ff fa99 	bl	8005884 <malloc>
 8006352:	4c0d      	ldr	r4, [pc, #52]	; (8006388 <env_relocate+0x40>)
 8006354:	f8d8 3014 	ldr.w	r3, [r8, #20]
 8006358:	6020      	str	r0, [r4, #0]
 800635a:	b133      	cbz	r3, 800636a <env_relocate+0x22>
 800635c:	f000 f81e 	bl	800639c <env_relocate_spec>
 8006360:	6823      	ldr	r3, [r4, #0]
 8006362:	3304      	adds	r3, #4
 8006364:	f8c8 3010 	str.w	r3, [r8, #16]
 8006368:	bd10      	pop	{r4, pc}
 800636a:	4808      	ldr	r0, [pc, #32]	; (800638c <env_relocate+0x44>)
 800636c:	f7fe ffe8 	bl	8005340 <puts>
 8006370:	f06f 003b 	mvn.w	r0, #59	; 0x3b
 8006374:	f000 fcd4 	bl	8006d20 <__show_boot_progress>
 8006378:	f7ff ffc6 	bl	8006308 <set_default_env>
 800637c:	6823      	ldr	r3, [r4, #0]
 800637e:	3304      	adds	r3, #4
 8006380:	f8c8 3010 	str.w	r3, [r8, #16]
 8006384:	bd10      	pop	{r4, pc}
 8006386:	bf00      	nop
 8006388:	20003584 	.word	0x20003584
 800638c:	0800dda0 	.word	0x0800dda0

08006390 <env_get_char_spec>:
 8006390:	4b01      	ldr	r3, [pc, #4]	; (8006398 <env_get_char_spec+0x8>)
 8006392:	5cc0      	ldrb	r0, [r0, r3]
 8006394:	4770      	bx	lr
 8006396:	bf00      	nop
 8006398:	08020004 	.word	0x08020004

0800639c <env_relocate_spec>:
 800639c:	4b03      	ldr	r3, [pc, #12]	; (80063ac <env_relocate_spec+0x10>)
 800639e:	f44f 5280 	mov.w	r2, #4096	; 0x1000
 80063a2:	6818      	ldr	r0, [r3, #0]
 80063a4:	4902      	ldr	r1, [pc, #8]	; (80063b0 <env_relocate_spec+0x14>)
 80063a6:	f7fa b9d3 	b.w	8000750 <memcpy>
 80063aa:	bf00      	nop
 80063ac:	20003584 	.word	0x20003584
 80063b0:	08020000 	.word	0x08020000

080063b4 <saveenv>:
 80063b4:	b500      	push	{lr}
 80063b6:	4b0a      	ldr	r3, [pc, #40]	; (80063e0 <saveenv+0x2c>)
 80063b8:	f5ad 5d80 	sub.w	sp, sp, #4096	; 0x1000
 80063bc:	b081      	sub	sp, #4
 80063be:	6819      	ldr	r1, [r3, #0]
 80063c0:	4668      	mov	r0, sp
 80063c2:	f44f 5280 	mov.w	r2, #4096	; 0x1000
 80063c6:	f7fa f9c3 	bl	8000750 <memcpy>
 80063ca:	4669      	mov	r1, sp
 80063cc:	f44f 5280 	mov.w	r2, #4096	; 0x1000
 80063d0:	4b04      	ldr	r3, [pc, #16]	; (80063e4 <saveenv+0x30>)
 80063d2:	4805      	ldr	r0, [pc, #20]	; (80063e8 <saveenv+0x34>)
 80063d4:	4798      	blx	r3
 80063d6:	f50d 5d80 	add.w	sp, sp, #4096	; 0x1000
 80063da:	b001      	add	sp, #4
 80063dc:	f85d fb04 	ldr.w	pc, [sp], #4
 80063e0:	20003584 	.word	0x20003584
 80063e4:	20000b2d 	.word	0x20000b2d
 80063e8:	08020000 	.word	0x08020000

080063ec <env_init>:
 80063ec:	b5f0      	push	{r4, r5, r6, r7, lr}
 80063ee:	f8d8 7014 	ldr.w	r7, [r8, #20]
 80063f2:	b093      	sub	sp, #76	; 0x4c
 80063f4:	b117      	cbz	r7, 80063fc <env_init+0x10>
 80063f6:	2000      	movs	r0, #0
 80063f8:	b013      	add	sp, #76	; 0x4c
 80063fa:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80063fc:	2204      	movs	r2, #4
 80063fe:	4917      	ldr	r1, [pc, #92]	; (800645c <env_init+0x70>)
 8006400:	eb0d 0002 	add.w	r0, sp, r2
 8006404:	f7fa f9a4 	bl	8000750 <memcpy>
 8006408:	2604      	movs	r6, #4
 800640a:	f640 75fc 	movw	r5, #4092	; 0xffc
 800640e:	2d40      	cmp	r5, #64	; 0x40
 8006410:	462c      	mov	r4, r5
 8006412:	bf28      	it	cs
 8006414:	2440      	movcs	r4, #64	; 0x40
 8006416:	f106 6100 	add.w	r1, r6, #134217728	; 0x8000000
 800641a:	4622      	mov	r2, r4
 800641c:	f501 3100 	add.w	r1, r1, #131072	; 0x20000
 8006420:	a802      	add	r0, sp, #8
 8006422:	f7fa f995 	bl	8000750 <memcpy>
 8006426:	4638      	mov	r0, r7
 8006428:	4622      	mov	r2, r4
 800642a:	a902      	add	r1, sp, #8
 800642c:	f001 fcac 	bl	8007d88 <crc32>
 8006430:	1b2d      	subs	r5, r5, r4
 8006432:	4426      	add	r6, r4
 8006434:	4607      	mov	r7, r0
 8006436:	d1ea      	bne.n	800640e <env_init+0x22>
 8006438:	9b01      	ldr	r3, [sp, #4]
 800643a:	4298      	cmp	r0, r3
 800643c:	d007      	beq.n	800644e <env_init+0x62>
 800643e:	2000      	movs	r0, #0
 8006440:	4a07      	ldr	r2, [pc, #28]	; (8006460 <env_init+0x74>)
 8006442:	f8c8 2010 	str.w	r2, [r8, #16]
 8006446:	f8c8 5014 	str.w	r5, [r8, #20]
 800644a:	b013      	add	sp, #76	; 0x4c
 800644c:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800644e:	2104      	movs	r1, #4
 8006450:	2201      	movs	r2, #1
 8006452:	f8c8 1010 	str.w	r1, [r8, #16]
 8006456:	f8c8 2014 	str.w	r2, [r8, #20]
 800645a:	e7cc      	b.n	80063f6 <env_init+0xa>
 800645c:	08020000 	.word	0x08020000
 8006460:	20000500 	.word	0x20000500

08006464 <dummy>:
 8006464:	4770      	bx	lr
 8006466:	bf00      	nop

08006468 <get_version>:
 8006468:	2006      	movs	r0, #6
 800646a:	4770      	bx	lr

0800646c <jumptable_init>:
 800646c:	b538      	push	{r3, r4, r5, lr}
 800646e:	2070      	movs	r0, #112	; 0x70
 8006470:	4644      	mov	r4, r8
 8006472:	f7ff fa07 	bl	8005884 <malloc>
 8006476:	61e0      	str	r0, [r4, #28]
 8006478:	f8d8 201c 	ldr.w	r2, [r8, #28]
 800647c:	4932      	ldr	r1, [pc, #200]	; (8006548 <jumptable_init+0xdc>)
 800647e:	4833      	ldr	r0, [pc, #204]	; (800654c <jumptable_init+0xe0>)
 8006480:	6011      	str	r1, [r2, #0]
 8006482:	f8d8 201c 	ldr.w	r2, [r8, #28]
 8006486:	4932      	ldr	r1, [pc, #200]	; (8006550 <jumptable_init+0xe4>)
 8006488:	6050      	str	r0, [r2, #4]
 800648a:	f8d8 201c 	ldr.w	r2, [r8, #28]
 800648e:	4831      	ldr	r0, [pc, #196]	; (8006554 <jumptable_init+0xe8>)
 8006490:	6091      	str	r1, [r2, #8]
 8006492:	f8d8 201c 	ldr.w	r2, [r8, #28]
 8006496:	4930      	ldr	r1, [pc, #192]	; (8006558 <jumptable_init+0xec>)
 8006498:	60d0      	str	r0, [r2, #12]
 800649a:	f8d8 201c 	ldr.w	r2, [r8, #28]
 800649e:	482f      	ldr	r0, [pc, #188]	; (800655c <jumptable_init+0xf0>)
 80064a0:	6111      	str	r1, [r2, #16]
 80064a2:	f8d8 101c 	ldr.w	r1, [r8, #28]
 80064a6:	4a2e      	ldr	r2, [pc, #184]	; (8006560 <jumptable_init+0xf4>)
 80064a8:	6148      	str	r0, [r1, #20]
 80064aa:	f8d8 101c 	ldr.w	r1, [r8, #28]
 80064ae:	4c2d      	ldr	r4, [pc, #180]	; (8006564 <jumptable_init+0xf8>)
 80064b0:	618a      	str	r2, [r1, #24]
 80064b2:	f8d8 101c 	ldr.w	r1, [r8, #28]
 80064b6:	482c      	ldr	r0, [pc, #176]	; (8006568 <jumptable_init+0xfc>)
 80064b8:	61ca      	str	r2, [r1, #28]
 80064ba:	f8d8 101c 	ldr.w	r1, [r8, #28]
 80064be:	4d2b      	ldr	r5, [pc, #172]	; (800656c <jumptable_init+0x100>)
 80064c0:	620c      	str	r4, [r1, #32]
 80064c2:	f8d8 101c 	ldr.w	r1, [r8, #28]
 80064c6:	4c2a      	ldr	r4, [pc, #168]	; (8006570 <jumptable_init+0x104>)
 80064c8:	6248      	str	r0, [r1, #36]	; 0x24
 80064ca:	f8d8 101c 	ldr.w	r1, [r8, #28]
 80064ce:	4829      	ldr	r0, [pc, #164]	; (8006574 <jumptable_init+0x108>)
 80064d0:	628d      	str	r5, [r1, #40]	; 0x28
 80064d2:	f8d8 101c 	ldr.w	r1, [r8, #28]
 80064d6:	4d28      	ldr	r5, [pc, #160]	; (8006578 <jumptable_init+0x10c>)
 80064d8:	62cc      	str	r4, [r1, #44]	; 0x2c
 80064da:	f8d8 101c 	ldr.w	r1, [r8, #28]
 80064de:	4c27      	ldr	r4, [pc, #156]	; (800657c <jumptable_init+0x110>)
 80064e0:	6308      	str	r0, [r1, #48]	; 0x30
 80064e2:	f8d8 101c 	ldr.w	r1, [r8, #28]
 80064e6:	4826      	ldr	r0, [pc, #152]	; (8006580 <jumptable_init+0x114>)
 80064e8:	634d      	str	r5, [r1, #52]	; 0x34
 80064ea:	f8d8 101c 	ldr.w	r1, [r8, #28]
 80064ee:	4d25      	ldr	r5, [pc, #148]	; (8006584 <jumptable_init+0x118>)
 80064f0:	638c      	str	r4, [r1, #56]	; 0x38
 80064f2:	f8d8 101c 	ldr.w	r1, [r8, #28]
 80064f6:	4c24      	ldr	r4, [pc, #144]	; (8006588 <jumptable_init+0x11c>)
 80064f8:	63c8      	str	r0, [r1, #60]	; 0x3c
 80064fa:	f8d8 101c 	ldr.w	r1, [r8, #28]
 80064fe:	4823      	ldr	r0, [pc, #140]	; (800658c <jumptable_init+0x120>)
 8006500:	640a      	str	r2, [r1, #64]	; 0x40
 8006502:	f8d8 101c 	ldr.w	r1, [r8, #28]
 8006506:	644d      	str	r5, [r1, #68]	; 0x44
 8006508:	f8d8 101c 	ldr.w	r1, [r8, #28]
 800650c:	648c      	str	r4, [r1, #72]	; 0x48
 800650e:	f8d8 101c 	ldr.w	r1, [r8, #28]
 8006512:	64c8      	str	r0, [r1, #76]	; 0x4c
 8006514:	f8d8 101c 	ldr.w	r1, [r8, #28]
 8006518:	650a      	str	r2, [r1, #80]	; 0x50
 800651a:	f8d8 101c 	ldr.w	r1, [r8, #28]
 800651e:	654a      	str	r2, [r1, #84]	; 0x54
 8006520:	f8d8 101c 	ldr.w	r1, [r8, #28]
 8006524:	658a      	str	r2, [r1, #88]	; 0x58
 8006526:	f8d8 101c 	ldr.w	r1, [r8, #28]
 800652a:	65ca      	str	r2, [r1, #92]	; 0x5c
 800652c:	f8d8 101c 	ldr.w	r1, [r8, #28]
 8006530:	660a      	str	r2, [r1, #96]	; 0x60
 8006532:	f8d8 101c 	ldr.w	r1, [r8, #28]
 8006536:	664a      	str	r2, [r1, #100]	; 0x64
 8006538:	f8d8 101c 	ldr.w	r1, [r8, #28]
 800653c:	668a      	str	r2, [r1, #104]	; 0x68
 800653e:	f8d8 301c 	ldr.w	r3, [r8, #28]
 8006542:	66da      	str	r2, [r3, #108]	; 0x6c
 8006544:	bd38      	pop	{r3, r4, r5, pc}
 8006546:	bf00      	nop
 8006548:	08006469 	.word	0x08006469
 800654c:	080052f9 	.word	0x080052f9
 8006550:	08005311 	.word	0x08005311
 8006554:	08005329 	.word	0x08005329
 8006558:	08005341 	.word	0x08005341
 800655c:	08005359 	.word	0x08005359
 8006560:	08006465 	.word	0x08006465
 8006564:	08005885 	.word	0x08005885
 8006568:	080056c9 	.word	0x080056c9
 800656c:	08008489 	.word	0x08008489
 8006570:	08000a1d 	.word	0x08000a1d
 8006574:	08005381 	.word	0x08005381
 8006578:	0800b539 	.word	0x0800b539
 800657c:	08004ed5 	.word	0x08004ed5
 8006580:	08004e79 	.word	0x08004e79
 8006584:	080088d9 	.word	0x080088d9
 8006588:	08008981 	.word	0x08008981
 800658c:	08000409 	.word	0x08000409

08006590 <image_check_hcrc>:
 8006590:	b510      	push	{r4, lr}
 8006592:	b090      	sub	sp, #64	; 0x40
 8006594:	4604      	mov	r4, r0
 8006596:	4601      	mov	r1, r0
 8006598:	2240      	movs	r2, #64	; 0x40
 800659a:	4668      	mov	r0, sp
 800659c:	f7fa f8fe 	bl	800079c <memmove>
 80065a0:	2300      	movs	r3, #0
 80065a2:	4669      	mov	r1, sp
 80065a4:	4618      	mov	r0, r3
 80065a6:	2240      	movs	r2, #64	; 0x40
 80065a8:	9301      	str	r3, [sp, #4]
 80065aa:	f001 fbed 	bl	8007d88 <crc32>
 80065ae:	6863      	ldr	r3, [r4, #4]
 80065b0:	ba1b      	rev	r3, r3
 80065b2:	1ac0      	subs	r0, r0, r3
 80065b4:	fab0 f080 	clz	r0, r0
 80065b8:	0940      	lsrs	r0, r0, #5
 80065ba:	b010      	add	sp, #64	; 0x40
 80065bc:	bd10      	pop	{r4, pc}
 80065be:	bf00      	nop

080065c0 <image_check_dcrc>:
 80065c0:	b510      	push	{r4, lr}
 80065c2:	68c2      	ldr	r2, [r0, #12]
 80065c4:	4604      	mov	r4, r0
 80065c6:	f100 0140 	add.w	r1, r0, #64	; 0x40
 80065ca:	ba12      	rev	r2, r2
 80065cc:	f44f 3380 	mov.w	r3, #65536	; 0x10000
 80065d0:	2000      	movs	r0, #0
 80065d2:	f001 fbdf 	bl	8007d94 <crc32_wd>
 80065d6:	69a3      	ldr	r3, [r4, #24]
 80065d8:	ba1b      	rev	r3, r3
 80065da:	1ac0      	subs	r0, r0, r3
 80065dc:	fab0 f080 	clz	r0, r0
 80065e0:	0940      	lsrs	r0, r0, #5
 80065e2:	bd10      	pop	{r4, pc}

080065e4 <image_multi_count>:
 80065e4:	6c02      	ldr	r2, [r0, #64]	; 0x40
 80065e6:	f100 0340 	add.w	r3, r0, #64	; 0x40
 80065ea:	b132      	cbz	r2, 80065fa <image_multi_count+0x16>
 80065ec:	2000      	movs	r0, #0
 80065ee:	f853 2f04 	ldr.w	r2, [r3, #4]!
 80065f2:	3001      	adds	r0, #1
 80065f4:	2a00      	cmp	r2, #0
 80065f6:	d1fa      	bne.n	80065ee <image_multi_count+0xa>
 80065f8:	4770      	bx	lr
 80065fa:	4610      	mov	r0, r2
 80065fc:	4770      	bx	lr
 80065fe:	bf00      	nop

08006600 <image_multi_getimg>:
 8006600:	b5f0      	push	{r4, r5, r6, r7, lr}
 8006602:	6c04      	ldr	r4, [r0, #64]	; 0x40
 8006604:	b32c      	cbz	r4, 8006652 <image_multi_getimg+0x52>
 8006606:	f100 0e40 	add.w	lr, r0, #64	; 0x40
 800660a:	4674      	mov	r4, lr
 800660c:	2600      	movs	r6, #0
 800660e:	e000      	b.n	8006612 <image_multi_getimg+0x12>
 8006610:	463e      	mov	r6, r7
 8006612:	f854 5f04 	ldr.w	r5, [r4, #4]!
 8006616:	1c77      	adds	r7, r6, #1
 8006618:	2d00      	cmp	r5, #0
 800661a:	d1f9      	bne.n	8006610 <image_multi_getimg+0x10>
 800661c:	42b9      	cmp	r1, r7
 800661e:	d218      	bcs.n	8006652 <image_multi_getimg+0x52>
 8006620:	f85e 7021 	ldr.w	r7, [lr, r1, lsl #2]
 8006624:	008c      	lsls	r4, r1, #2
 8006626:	ba3f      	rev	r7, r7
 8006628:	601f      	str	r7, [r3, #0]
 800662a:	b1b1      	cbz	r1, 800665a <image_multi_getimg+0x5a>
 800662c:	f104 013c 	add.w	r1, r4, #60	; 0x3c
 8006630:	4401      	add	r1, r0
 8006632:	303c      	adds	r0, #60	; 0x3c
 8006634:	f850 3f04 	ldr.w	r3, [r0, #4]!
 8006638:	ba1b      	rev	r3, r3
 800663a:	3303      	adds	r3, #3
 800663c:	f023 0303 	bic.w	r3, r3, #3
 8006640:	4281      	cmp	r1, r0
 8006642:	441d      	add	r5, r3
 8006644:	d1f6      	bne.n	8006634 <image_multi_getimg+0x34>
 8006646:	1cb3      	adds	r3, r6, #2
 8006648:	eb0e 0383 	add.w	r3, lr, r3, lsl #2
 800664c:	441d      	add	r5, r3
 800664e:	6015      	str	r5, [r2, #0]
 8006650:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8006652:	2100      	movs	r1, #0
 8006654:	6019      	str	r1, [r3, #0]
 8006656:	6011      	str	r1, [r2, #0]
 8006658:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800665a:	460d      	mov	r5, r1
 800665c:	e7f3      	b.n	8006646 <image_multi_getimg+0x46>
 800665e:	bf00      	nop

08006660 <image_print_contents>:
 8006660:	2220      	movs	r2, #32
 8006662:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8006666:	4605      	mov	r5, r0
 8006668:	1883      	adds	r3, r0, r2
 800666a:	b084      	sub	sp, #16
 800666c:	495a      	ldr	r1, [pc, #360]	; (80067d8 <image_print_contents+0x178>)
 800666e:	485b      	ldr	r0, [pc, #364]	; (80067dc <image_print_contents+0x17c>)
 8006670:	4e5b      	ldr	r6, [pc, #364]	; (80067e0 <image_print_contents+0x180>)
 8006672:	f7fe fe71 	bl	8005358 <printf>
 8006676:	4958      	ldr	r1, [pc, #352]	; (80067d8 <image_print_contents+0x178>)
 8006678:	485a      	ldr	r0, [pc, #360]	; (80067e4 <image_print_contents+0x184>)
 800667a:	f7fe fe6d 	bl	8005358 <printf>
 800667e:	6833      	ldr	r3, [r6, #0]
 8006680:	7f29      	ldrb	r1, [r5, #28]
 8006682:	2b00      	cmp	r3, #0
 8006684:	db0a      	blt.n	800669c <image_print_contents+0x3c>
 8006686:	4299      	cmp	r1, r3
 8006688:	4632      	mov	r2, r6
 800668a:	d103      	bne.n	8006694 <image_print_contents+0x34>
 800668c:	e096      	b.n	80067bc <image_print_contents+0x15c>
 800668e:	4299      	cmp	r1, r3
 8006690:	f000 8094 	beq.w	80067bc <image_print_contents+0x15c>
 8006694:	f852 3f0c 	ldr.w	r3, [r2, #12]!
 8006698:	2b00      	cmp	r3, #0
 800669a:	daf8      	bge.n	800668e <image_print_contents+0x2e>
 800669c:	4a52      	ldr	r2, [pc, #328]	; (80067e8 <image_print_contents+0x188>)
 800669e:	6cb3      	ldr	r3, [r6, #72]	; 0x48
 80066a0:	7f68      	ldrb	r0, [r5, #29]
 80066a2:	2b00      	cmp	r3, #0
 80066a4:	db0a      	blt.n	80066bc <image_print_contents+0x5c>
 80066a6:	4298      	cmp	r0, r3
 80066a8:	4950      	ldr	r1, [pc, #320]	; (80067ec <image_print_contents+0x18c>)
 80066aa:	d103      	bne.n	80066b4 <image_print_contents+0x54>
 80066ac:	e08c      	b.n	80067c8 <image_print_contents+0x168>
 80066ae:	4298      	cmp	r0, r3
 80066b0:	f000 808a 	beq.w	80067c8 <image_print_contents+0x168>
 80066b4:	f851 3f0c 	ldr.w	r3, [r1, #12]!
 80066b8:	2b00      	cmp	r3, #0
 80066ba:	daf8      	bge.n	80066ae <image_print_contents+0x4e>
 80066bc:	494c      	ldr	r1, [pc, #304]	; (80067f0 <image_print_contents+0x190>)
 80066be:	f8d6 3138 	ldr.w	r3, [r6, #312]	; 0x138
 80066c2:	7fac      	ldrb	r4, [r5, #30]
 80066c4:	2b00      	cmp	r3, #0
 80066c6:	db09      	blt.n	80066dc <image_print_contents+0x7c>
 80066c8:	429c      	cmp	r4, r3
 80066ca:	484a      	ldr	r0, [pc, #296]	; (80067f4 <image_print_contents+0x194>)
 80066cc:	d102      	bne.n	80066d4 <image_print_contents+0x74>
 80066ce:	e079      	b.n	80067c4 <image_print_contents+0x164>
 80066d0:	429c      	cmp	r4, r3
 80066d2:	d077      	beq.n	80067c4 <image_print_contents+0x164>
 80066d4:	f850 3f0c 	ldr.w	r3, [r0, #12]!
 80066d8:	2b00      	cmp	r3, #0
 80066da:	daf9      	bge.n	80066d0 <image_print_contents+0x70>
 80066dc:	4b46      	ldr	r3, [pc, #280]	; (80067f8 <image_print_contents+0x198>)
 80066de:	f8d6 01c8 	ldr.w	r0, [r6, #456]	; 0x1c8
 80066e2:	7fee      	ldrb	r6, [r5, #31]
 80066e4:	2800      	cmp	r0, #0
 80066e6:	db09      	blt.n	80066fc <image_print_contents+0x9c>
 80066e8:	42b0      	cmp	r0, r6
 80066ea:	4c44      	ldr	r4, [pc, #272]	; (80067fc <image_print_contents+0x19c>)
 80066ec:	d102      	bne.n	80066f4 <image_print_contents+0x94>
 80066ee:	e067      	b.n	80067c0 <image_print_contents+0x160>
 80066f0:	4286      	cmp	r6, r0
 80066f2:	d065      	beq.n	80067c0 <image_print_contents+0x160>
 80066f4:	f854 0f0c 	ldr.w	r0, [r4, #12]!
 80066f8:	2800      	cmp	r0, #0
 80066fa:	daf9      	bge.n	80066f0 <image_print_contents+0x90>
 80066fc:	4840      	ldr	r0, [pc, #256]	; (8006800 <image_print_contents+0x1a0>)
 80066fe:	9000      	str	r0, [sp, #0]
 8006700:	4840      	ldr	r0, [pc, #256]	; (8006804 <image_print_contents+0x1a4>)
 8006702:	f7fe fe29 	bl	8005358 <printf>
 8006706:	4934      	ldr	r1, [pc, #208]	; (80067d8 <image_print_contents+0x178>)
 8006708:	483f      	ldr	r0, [pc, #252]	; (8006808 <image_print_contents+0x1a8>)
 800670a:	f7fe fe25 	bl	8005358 <printf>
 800670e:	68ec      	ldr	r4, [r5, #12]
 8006710:	483e      	ldr	r0, [pc, #248]	; (800680c <image_print_contents+0x1ac>)
 8006712:	ba24      	rev	r4, r4
 8006714:	4621      	mov	r1, r4
 8006716:	f7fe fe1f 	bl	8005358 <printf>
 800671a:	4620      	mov	r0, r4
 800671c:	493c      	ldr	r1, [pc, #240]	; (8006810 <image_print_contents+0x1b0>)
 800671e:	f001 fb4b 	bl	8007db8 <print_size>
 8006722:	692a      	ldr	r2, [r5, #16]
 8006724:	492c      	ldr	r1, [pc, #176]	; (80067d8 <image_print_contents+0x178>)
 8006726:	ba12      	rev	r2, r2
 8006728:	483a      	ldr	r0, [pc, #232]	; (8006814 <image_print_contents+0x1b4>)
 800672a:	f7fe fe15 	bl	8005358 <printf>
 800672e:	696a      	ldr	r2, [r5, #20]
 8006730:	4929      	ldr	r1, [pc, #164]	; (80067d8 <image_print_contents+0x178>)
 8006732:	ba12      	rev	r2, r2
 8006734:	4838      	ldr	r0, [pc, #224]	; (8006818 <image_print_contents+0x1b8>)
 8006736:	f7fe fe0f 	bl	8005358 <printf>
 800673a:	7fab      	ldrb	r3, [r5, #30]
 800673c:	f003 03fd 	and.w	r3, r3, #253	; 0xfd
 8006740:	2b04      	cmp	r3, #4
 8006742:	d002      	beq.n	800674a <image_print_contents+0xea>
 8006744:	b004      	add	sp, #16
 8006746:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 800674a:	6c2a      	ldr	r2, [r5, #64]	; 0x40
 800674c:	f105 0340 	add.w	r3, r5, #64	; 0x40
 8006750:	2a00      	cmp	r2, #0
 8006752:	d03b      	beq.n	80067cc <image_print_contents+0x16c>
 8006754:	2600      	movs	r6, #0
 8006756:	f853 4f04 	ldr.w	r4, [r3, #4]!
 800675a:	3601      	adds	r6, #1
 800675c:	2c00      	cmp	r4, #0
 800675e:	d1fa      	bne.n	8006756 <image_print_contents+0xf6>
 8006760:	491d      	ldr	r1, [pc, #116]	; (80067d8 <image_print_contents+0x178>)
 8006762:	482e      	ldr	r0, [pc, #184]	; (800681c <image_print_contents+0x1bc>)
 8006764:	f7fe fdf8 	bl	8005358 <printf>
 8006768:	4f1b      	ldr	r7, [pc, #108]	; (80067d8 <image_print_contents+0x178>)
 800676a:	f8df b0b8 	ldr.w	fp, [pc, #184]	; 8006824 <image_print_contents+0x1c4>
 800676e:	f8df a09c 	ldr.w	sl, [pc, #156]	; 800680c <image_print_contents+0x1ac>
 8006772:	46a9      	mov	r9, r5
 8006774:	e002      	b.n	800677c <image_print_contents+0x11c>
 8006776:	3401      	adds	r4, #1
 8006778:	42b4      	cmp	r4, r6
 800677a:	d0e3      	beq.n	8006744 <image_print_contents+0xe4>
 800677c:	ab03      	add	r3, sp, #12
 800677e:	aa02      	add	r2, sp, #8
 8006780:	4621      	mov	r1, r4
 8006782:	4648      	mov	r0, r9
 8006784:	f7ff ff3c 	bl	8006600 <image_multi_getimg>
 8006788:	4622      	mov	r2, r4
 800678a:	4639      	mov	r1, r7
 800678c:	4658      	mov	r0, fp
 800678e:	f7fe fde3 	bl	8005358 <printf>
 8006792:	9d03      	ldr	r5, [sp, #12]
 8006794:	4650      	mov	r0, sl
 8006796:	4629      	mov	r1, r5
 8006798:	f7fe fdde 	bl	8005358 <printf>
 800679c:	491c      	ldr	r1, [pc, #112]	; (8006810 <image_print_contents+0x1b0>)
 800679e:	4628      	mov	r0, r5
 80067a0:	f001 fb0a 	bl	8007db8 <print_size>
 80067a4:	f899 301e 	ldrb.w	r3, [r9, #30]
 80067a8:	2b06      	cmp	r3, #6
 80067aa:	d1e4      	bne.n	8006776 <image_print_contents+0x116>
 80067ac:	2c00      	cmp	r4, #0
 80067ae:	d0e2      	beq.n	8006776 <image_print_contents+0x116>
 80067b0:	9a02      	ldr	r2, [sp, #8]
 80067b2:	4639      	mov	r1, r7
 80067b4:	481a      	ldr	r0, [pc, #104]	; (8006820 <image_print_contents+0x1c0>)
 80067b6:	f7fe fdcf 	bl	8005358 <printf>
 80067ba:	e7dc      	b.n	8006776 <image_print_contents+0x116>
 80067bc:	6892      	ldr	r2, [r2, #8]
 80067be:	e76e      	b.n	800669e <image_print_contents+0x3e>
 80067c0:	68a0      	ldr	r0, [r4, #8]
 80067c2:	e79c      	b.n	80066fe <image_print_contents+0x9e>
 80067c4:	6883      	ldr	r3, [r0, #8]
 80067c6:	e78a      	b.n	80066de <image_print_contents+0x7e>
 80067c8:	6889      	ldr	r1, [r1, #8]
 80067ca:	e778      	b.n	80066be <image_print_contents+0x5e>
 80067cc:	4902      	ldr	r1, [pc, #8]	; (80067d8 <image_print_contents+0x178>)
 80067ce:	4813      	ldr	r0, [pc, #76]	; (800681c <image_print_contents+0x1bc>)
 80067d0:	f7fe fdc2 	bl	8005358 <printf>
 80067d4:	e7b6      	b.n	8006744 <image_print_contents+0xe4>
 80067d6:	bf00      	nop
 80067d8:	0800dd24 	.word	0x0800dd24
 80067dc:	0800de24 	.word	0x0800de24
 80067e0:	2000079c 	.word	0x2000079c
 80067e4:	0800de3c 	.word	0x0800de3c
 80067e8:	0800dddc 	.word	0x0800dddc
 80067ec:	200007e4 	.word	0x200007e4
 80067f0:	0800dde8 	.word	0x0800dde8
 80067f4:	200008d4 	.word	0x200008d4
 80067f8:	0800de00 	.word	0x0800de00
 80067fc:	20000964 	.word	0x20000964
 8006800:	0800de10 	.word	0x0800de10
 8006804:	0800de50 	.word	0x0800de50
 8006808:	0800de60 	.word	0x0800de60
 800680c:	0800de74 	.word	0x0800de74
 8006810:	0800dcc4 	.word	0x0800dcc4
 8006814:	0800de80 	.word	0x0800de80
 8006818:	0800de98 	.word	0x0800de98
 800681c:	0800deb0 	.word	0x0800deb0
 8006820:	0800ded0 	.word	0x0800ded0
 8006824:	0800dec0 	.word	0x0800dec0

08006828 <getenv_yesno>:
 8006828:	b508      	push	{r3, lr}
 800682a:	f7fe fb53 	bl	8004ed4 <getenv>
 800682e:	b128      	cbz	r0, 800683c <getenv_yesno+0x14>
 8006830:	f990 0000 	ldrsb.w	r0, [r0]
 8006834:	386e      	subs	r0, #110	; 0x6e
 8006836:	bf18      	it	ne
 8006838:	2001      	movne	r0, #1
 800683a:	bd08      	pop	{r3, pc}
 800683c:	2001      	movs	r0, #1
 800683e:	bd08      	pop	{r3, pc}

08006840 <getenv_bootm_low>:
 8006840:	b508      	push	{r3, lr}
 8006842:	4807      	ldr	r0, [pc, #28]	; (8006860 <getenv_bootm_low+0x20>)
 8006844:	f7fe fb46 	bl	8004ed4 <getenv>
 8006848:	b128      	cbz	r0, 8006856 <getenv_bootm_low+0x16>
 800684a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800684e:	2210      	movs	r2, #16
 8006850:	2100      	movs	r1, #0
 8006852:	f002 b841 	b.w	80088d8 <simple_strtoul>
 8006856:	f8d8 3000 	ldr.w	r3, [r8]
 800685a:	6958      	ldr	r0, [r3, #20]
 800685c:	bd08      	pop	{r3, pc}
 800685e:	bf00      	nop
 8006860:	0800dee8 	.word	0x0800dee8

08006864 <getenv_bootm_size>:
 8006864:	b508      	push	{r3, lr}
 8006866:	4806      	ldr	r0, [pc, #24]	; (8006880 <getenv_bootm_size+0x1c>)
 8006868:	f7fe fb34 	bl	8004ed4 <getenv>
 800686c:	b120      	cbz	r0, 8006878 <getenv_bootm_size+0x14>
 800686e:	2210      	movs	r2, #16
 8006870:	2100      	movs	r1, #0
 8006872:	f002 f8c5 	bl	8008a00 <simple_strtoull>
 8006876:	bd08      	pop	{r3, pc}
 8006878:	f8d8 3000 	ldr.w	r3, [r8]
 800687c:	6998      	ldr	r0, [r3, #24]
 800687e:	bd08      	pop	{r3, pc}
 8006880:	0800def4 	.word	0x0800def4

08006884 <memmove_wd>:
 8006884:	f7f9 bf8a 	b.w	800079c <memmove>

08006888 <genimg_print_size>:
 8006888:	b510      	push	{r4, lr}
 800688a:	4604      	mov	r4, r0
 800688c:	4804      	ldr	r0, [pc, #16]	; (80068a0 <genimg_print_size+0x18>)
 800688e:	4621      	mov	r1, r4
 8006890:	f7fe fd62 	bl	8005358 <printf>
 8006894:	4620      	mov	r0, r4
 8006896:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800689a:	4902      	ldr	r1, [pc, #8]	; (80068a4 <genimg_print_size+0x1c>)
 800689c:	f001 ba8c 	b.w	8007db8 <print_size>
 80068a0:	0800de74 	.word	0x0800de74
 80068a4:	0800dcc4 	.word	0x0800dcc4

080068a8 <get_table_entry_name>:
 80068a8:	6803      	ldr	r3, [r0, #0]
 80068aa:	2b00      	cmp	r3, #0
 80068ac:	db08      	blt.n	80068c0 <get_table_entry_name+0x18>
 80068ae:	429a      	cmp	r2, r3
 80068b0:	d102      	bne.n	80068b8 <get_table_entry_name+0x10>
 80068b2:	e007      	b.n	80068c4 <get_table_entry_name+0x1c>
 80068b4:	4293      	cmp	r3, r2
 80068b6:	d005      	beq.n	80068c4 <get_table_entry_name+0x1c>
 80068b8:	f850 3f0c 	ldr.w	r3, [r0, #12]!
 80068bc:	2b00      	cmp	r3, #0
 80068be:	daf9      	bge.n	80068b4 <get_table_entry_name+0xc>
 80068c0:	4608      	mov	r0, r1
 80068c2:	4770      	bx	lr
 80068c4:	6881      	ldr	r1, [r0, #8]
 80068c6:	4608      	mov	r0, r1
 80068c8:	4770      	bx	lr
 80068ca:	bf00      	nop

080068cc <genimg_get_os_name>:
 80068cc:	4a07      	ldr	r2, [pc, #28]	; (80068ec <genimg_get_os_name+0x20>)
 80068ce:	6813      	ldr	r3, [r2, #0]
 80068d0:	2b00      	cmp	r3, #0
 80068d2:	da04      	bge.n	80068de <genimg_get_os_name+0x12>
 80068d4:	e007      	b.n	80068e6 <genimg_get_os_name+0x1a>
 80068d6:	f852 3f0c 	ldr.w	r3, [r2, #12]!
 80068da:	2b00      	cmp	r3, #0
 80068dc:	db03      	blt.n	80068e6 <genimg_get_os_name+0x1a>
 80068de:	4298      	cmp	r0, r3
 80068e0:	d1f9      	bne.n	80068d6 <genimg_get_os_name+0xa>
 80068e2:	6890      	ldr	r0, [r2, #8]
 80068e4:	4770      	bx	lr
 80068e6:	4802      	ldr	r0, [pc, #8]	; (80068f0 <genimg_get_os_name+0x24>)
 80068e8:	4770      	bx	lr
 80068ea:	bf00      	nop
 80068ec:	2000079c 	.word	0x2000079c
 80068f0:	0800dddc 	.word	0x0800dddc

080068f4 <genimg_get_arch_name>:
 80068f4:	4a09      	ldr	r2, [pc, #36]	; (800691c <genimg_get_arch_name+0x28>)
 80068f6:	6c93      	ldr	r3, [r2, #72]	; 0x48
 80068f8:	2b00      	cmp	r3, #0
 80068fa:	db0a      	blt.n	8006912 <genimg_get_arch_name+0x1e>
 80068fc:	4298      	cmp	r0, r3
 80068fe:	f102 0248 	add.w	r2, r2, #72	; 0x48
 8006902:	d102      	bne.n	800690a <genimg_get_arch_name+0x16>
 8006904:	e007      	b.n	8006916 <genimg_get_arch_name+0x22>
 8006906:	4298      	cmp	r0, r3
 8006908:	d005      	beq.n	8006916 <genimg_get_arch_name+0x22>
 800690a:	f852 3f0c 	ldr.w	r3, [r2, #12]!
 800690e:	2b00      	cmp	r3, #0
 8006910:	daf9      	bge.n	8006906 <genimg_get_arch_name+0x12>
 8006912:	4803      	ldr	r0, [pc, #12]	; (8006920 <genimg_get_arch_name+0x2c>)
 8006914:	4770      	bx	lr
 8006916:	6890      	ldr	r0, [r2, #8]
 8006918:	4770      	bx	lr
 800691a:	bf00      	nop
 800691c:	2000079c 	.word	0x2000079c
 8006920:	0800dde8 	.word	0x0800dde8

08006924 <genimg_get_type_name>:
 8006924:	4a09      	ldr	r2, [pc, #36]	; (800694c <genimg_get_type_name+0x28>)
 8006926:	f8d2 3138 	ldr.w	r3, [r2, #312]	; 0x138
 800692a:	2b00      	cmp	r3, #0
 800692c:	db0a      	blt.n	8006944 <genimg_get_type_name+0x20>
 800692e:	4298      	cmp	r0, r3
 8006930:	f502 729c 	add.w	r2, r2, #312	; 0x138
 8006934:	d102      	bne.n	800693c <genimg_get_type_name+0x18>
 8006936:	e007      	b.n	8006948 <genimg_get_type_name+0x24>
 8006938:	4298      	cmp	r0, r3
 800693a:	d005      	beq.n	8006948 <genimg_get_type_name+0x24>
 800693c:	f852 3f0c 	ldr.w	r3, [r2, #12]!
 8006940:	2b00      	cmp	r3, #0
 8006942:	daf9      	bge.n	8006938 <genimg_get_type_name+0x14>
 8006944:	4802      	ldr	r0, [pc, #8]	; (8006950 <genimg_get_type_name+0x2c>)
 8006946:	4770      	bx	lr
 8006948:	6890      	ldr	r0, [r2, #8]
 800694a:	4770      	bx	lr
 800694c:	2000079c 	.word	0x2000079c
 8006950:	0800de00 	.word	0x0800de00

08006954 <genimg_get_comp_name>:
 8006954:	4a09      	ldr	r2, [pc, #36]	; (800697c <genimg_get_comp_name+0x28>)
 8006956:	f8d2 31c8 	ldr.w	r3, [r2, #456]	; 0x1c8
 800695a:	2b00      	cmp	r3, #0
 800695c:	db0a      	blt.n	8006974 <genimg_get_comp_name+0x20>
 800695e:	4298      	cmp	r0, r3
 8006960:	f502 72e4 	add.w	r2, r2, #456	; 0x1c8
 8006964:	d102      	bne.n	800696c <genimg_get_comp_name+0x18>
 8006966:	e007      	b.n	8006978 <genimg_get_comp_name+0x24>
 8006968:	4298      	cmp	r0, r3
 800696a:	d005      	beq.n	8006978 <genimg_get_comp_name+0x24>
 800696c:	f852 3f0c 	ldr.w	r3, [r2, #12]!
 8006970:	2b00      	cmp	r3, #0
 8006972:	daf9      	bge.n	8006968 <genimg_get_comp_name+0x14>
 8006974:	4802      	ldr	r0, [pc, #8]	; (8006980 <genimg_get_comp_name+0x2c>)
 8006976:	4770      	bx	lr
 8006978:	6890      	ldr	r0, [r2, #8]
 800697a:	4770      	bx	lr
 800697c:	2000079c 	.word	0x2000079c
 8006980:	0800de10 	.word	0x0800de10

08006984 <get_table_entry_id>:
 8006984:	b538      	push	{r3, r4, r5, lr}
 8006986:	6803      	ldr	r3, [r0, #0]
 8006988:	2b00      	cmp	r3, #0
 800698a:	db0b      	blt.n	80069a4 <get_table_entry_id+0x20>
 800698c:	4615      	mov	r5, r2
 800698e:	4604      	mov	r4, r0
 8006990:	6860      	ldr	r0, [r4, #4]
 8006992:	b118      	cbz	r0, 800699c <get_table_entry_id+0x18>
 8006994:	4629      	mov	r1, r5
 8006996:	f7f9 fd37 	bl	8000408 <strcmp>
 800699a:	b130      	cbz	r0, 80069aa <get_table_entry_id+0x26>
 800699c:	f854 3f0c 	ldr.w	r3, [r4, #12]!
 80069a0:	2b00      	cmp	r3, #0
 80069a2:	daf5      	bge.n	8006990 <get_table_entry_id+0xc>
 80069a4:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 80069a8:	bd38      	pop	{r3, r4, r5, pc}
 80069aa:	6820      	ldr	r0, [r4, #0]
 80069ac:	bd38      	pop	{r3, r4, r5, pc}
 80069ae:	bf00      	nop

080069b0 <genimg_get_os_id>:
 80069b0:	4602      	mov	r2, r0
 80069b2:	4902      	ldr	r1, [pc, #8]	; (80069bc <genimg_get_os_id+0xc>)
 80069b4:	4802      	ldr	r0, [pc, #8]	; (80069c0 <genimg_get_os_id+0x10>)
 80069b6:	f7ff bfe5 	b.w	8006984 <get_table_entry_id>
 80069ba:	bf00      	nop
 80069bc:	0800e1ac 	.word	0x0800e1ac
 80069c0:	2000079c 	.word	0x2000079c

080069c4 <genimg_get_arch_id>:
 80069c4:	4602      	mov	r2, r0
 80069c6:	4902      	ldr	r1, [pc, #8]	; (80069d0 <genimg_get_arch_id+0xc>)
 80069c8:	4802      	ldr	r0, [pc, #8]	; (80069d4 <genimg_get_arch_id+0x10>)
 80069ca:	f7ff bfdb 	b.w	8006984 <get_table_entry_id>
 80069ce:	bf00      	nop
 80069d0:	0800df00 	.word	0x0800df00
 80069d4:	200007e4 	.word	0x200007e4

080069d8 <genimg_get_type_id>:
 80069d8:	4602      	mov	r2, r0
 80069da:	4902      	ldr	r1, [pc, #8]	; (80069e4 <genimg_get_type_id+0xc>)
 80069dc:	4802      	ldr	r0, [pc, #8]	; (80069e8 <genimg_get_type_id+0x10>)
 80069de:	f7ff bfd1 	b.w	8006984 <get_table_entry_id>
 80069e2:	bf00      	nop
 80069e4:	0800e08c 	.word	0x0800e08c
 80069e8:	200008d4 	.word	0x200008d4

080069ec <genimg_get_comp_id>:
 80069ec:	4602      	mov	r2, r0
 80069ee:	4902      	ldr	r1, [pc, #8]	; (80069f8 <genimg_get_comp_id+0xc>)
 80069f0:	4802      	ldr	r0, [pc, #8]	; (80069fc <genimg_get_comp_id+0x10>)
 80069f2:	f7ff bfc7 	b.w	8006984 <get_table_entry_id>
 80069f6:	bf00      	nop
 80069f8:	0800de18 	.word	0x0800de18
 80069fc:	20000964 	.word	0x20000964

08006a00 <genimg_get_format>:
 8006a00:	6800      	ldr	r0, [r0, #0]
 8006a02:	4b03      	ldr	r3, [pc, #12]	; (8006a10 <genimg_get_format+0x10>)
 8006a04:	1ac0      	subs	r0, r0, r3
 8006a06:	fab0 f080 	clz	r0, r0
 8006a0a:	0940      	lsrs	r0, r0, #5
 8006a0c:	4770      	bx	lr
 8006a0e:	bf00      	nop
 8006a10:	56190527 	.word	0x56190527

08006a14 <genimg_get_image>:
 8006a14:	4770      	bx	lr
 8006a16:	bf00      	nop

08006a18 <genimg_has_config>:
 8006a18:	2000      	movs	r0, #0
 8006a1a:	4770      	bx	lr

08006a1c <boot_get_ramdisk>:
 8006a1c:	e92d 46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
 8006a20:	2400      	movs	r4, #0
 8006a22:	b083      	sub	sp, #12
 8006a24:	9d0a      	ldr	r5, [sp, #40]	; 0x28
 8006a26:	9e0b      	ldr	r6, [sp, #44]	; 0x2c
 8006a28:	2802      	cmp	r0, #2
 8006a2a:	602c      	str	r4, [r5, #0]
 8006a2c:	4617      	mov	r7, r2
 8006a2e:	6034      	str	r4, [r6, #0]
 8006a30:	dc0c      	bgt.n	8006a4c <boot_get_ramdisk+0x30>
 8006a32:	6c53      	ldr	r3, [r2, #68]	; 0x44
 8006a34:	b11b      	cbz	r3, 8006a3e <boot_get_ramdisk+0x22>
 8006a36:	f897 3022 	ldrb.w	r3, [r7, #34]	; 0x22
 8006a3a:	2b04      	cmp	r3, #4
 8006a3c:	d063      	beq.n	8006b06 <boot_get_ramdisk+0xea>
 8006a3e:	200e      	movs	r0, #14
 8006a40:	f000 f96e 	bl	8006d20 <__show_boot_progress>
 8006a44:	2000      	movs	r0, #0
 8006a46:	b003      	add	sp, #12
 8006a48:	e8bd 86f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, pc}
 8006a4c:	468a      	mov	sl, r1
 8006a4e:	4950      	ldr	r1, [pc, #320]	; (8006b90 <boot_get_ramdisk+0x174>)
 8006a50:	f8da 0008 	ldr.w	r0, [sl, #8]
 8006a54:	4699      	mov	r9, r3
 8006a56:	f7f9 fcd7 	bl	8000408 <strcmp>
 8006a5a:	2800      	cmp	r0, #0
 8006a5c:	d0f2      	beq.n	8006a44 <boot_get_ramdisk+0x28>
 8006a5e:	4621      	mov	r1, r4
 8006a60:	f8da 0008 	ldr.w	r0, [sl, #8]
 8006a64:	2210      	movs	r2, #16
 8006a66:	f001 ff37 	bl	80088d8 <simple_strtoul>
 8006a6a:	6803      	ldr	r3, [r0, #0]
 8006a6c:	4a49      	ldr	r2, [pc, #292]	; (8006b94 <boot_get_ramdisk+0x178>)
 8006a6e:	fa93 fa83 	rev.w	sl, r3
 8006a72:	4592      	cmp	sl, r2
 8006a74:	4604      	mov	r4, r0
 8006a76:	d006      	beq.n	8006a86 <boot_get_ramdisk+0x6a>
 8006a78:	4847      	ldr	r0, [pc, #284]	; (8006b98 <boot_get_ramdisk+0x17c>)
 8006a7a:	f7fe fc61 	bl	8005340 <puts>
 8006a7e:	2001      	movs	r0, #1
 8006a80:	b003      	add	sp, #12
 8006a82:	e8bd 86f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, pc}
 8006a86:	4601      	mov	r1, r0
 8006a88:	4844      	ldr	r0, [pc, #272]	; (8006b9c <boot_get_ramdisk+0x180>)
 8006a8a:	f7fe fc65 	bl	8005358 <printf>
 8006a8e:	2009      	movs	r0, #9
 8006a90:	f000 f946 	bl	8006d20 <__show_boot_progress>
 8006a94:	6823      	ldr	r3, [r4, #0]
 8006a96:	ba1b      	rev	r3, r3
 8006a98:	4553      	cmp	r3, sl
 8006a9a:	d166      	bne.n	8006b6a <boot_get_ramdisk+0x14e>
 8006a9c:	4620      	mov	r0, r4
 8006a9e:	f8d7 7084 	ldr.w	r7, [r7, #132]	; 0x84
 8006aa2:	f7ff fd75 	bl	8006590 <image_check_hcrc>
 8006aa6:	2800      	cmp	r0, #0
 8006aa8:	d068      	beq.n	8006b7c <boot_get_ramdisk+0x160>
 8006aaa:	200a      	movs	r0, #10
 8006aac:	f000 f938 	bl	8006d20 <__show_boot_progress>
 8006ab0:	4620      	mov	r0, r4
 8006ab2:	f7ff fdd5 	bl	8006660 <image_print_contents>
 8006ab6:	b157      	cbz	r7, 8006ace <boot_get_ramdisk+0xb2>
 8006ab8:	4839      	ldr	r0, [pc, #228]	; (8006ba0 <boot_get_ramdisk+0x184>)
 8006aba:	f7fe fc41 	bl	8005340 <puts>
 8006abe:	4620      	mov	r0, r4
 8006ac0:	f7ff fd7e 	bl	80065c0 <image_check_dcrc>
 8006ac4:	2800      	cmp	r0, #0
 8006ac6:	d047      	beq.n	8006b58 <boot_get_ramdisk+0x13c>
 8006ac8:	4836      	ldr	r0, [pc, #216]	; (8006ba4 <boot_get_ramdisk+0x188>)
 8006aca:	f7fe fc39 	bl	8005340 <puts>
 8006ace:	200b      	movs	r0, #11
 8006ad0:	f000 f926 	bl	8006d20 <__show_boot_progress>
 8006ad4:	7f23      	ldrb	r3, [r4, #28]
 8006ad6:	2b05      	cmp	r3, #5
 8006ad8:	d124      	bne.n	8006b24 <boot_get_ramdisk+0x108>
 8006ada:	7f63      	ldrb	r3, [r4, #29]
 8006adc:	454b      	cmp	r3, r9
 8006ade:	d121      	bne.n	8006b24 <boot_get_ramdisk+0x108>
 8006ae0:	7fa3      	ldrb	r3, [r4, #30]
 8006ae2:	2b03      	cmp	r3, #3
 8006ae4:	d11e      	bne.n	8006b24 <boot_get_ramdisk+0x108>
 8006ae6:	68e3      	ldr	r3, [r4, #12]
 8006ae8:	f104 0040 	add.w	r0, r4, #64	; 0x40
 8006aec:	ba1b      	rev	r3, r3
 8006aee:	e88d 0009 	stmia.w	sp, {r0, r3}
 8006af2:	2800      	cmp	r0, #0
 8006af4:	d0a6      	beq.n	8006a44 <boot_get_ramdisk+0x28>
 8006af6:	9b01      	ldr	r3, [sp, #4]
 8006af8:	6028      	str	r0, [r5, #0]
 8006afa:	4418      	add	r0, r3
 8006afc:	6030      	str	r0, [r6, #0]
 8006afe:	2000      	movs	r0, #0
 8006b00:	b003      	add	sp, #12
 8006b02:	e8bd 86f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, pc}
 8006b06:	200d      	movs	r0, #13
 8006b08:	f000 f90a 	bl	8006d20 <__show_boot_progress>
 8006b0c:	6839      	ldr	r1, [r7, #0]
 8006b0e:	4826      	ldr	r0, [pc, #152]	; (8006ba8 <boot_get_ramdisk+0x18c>)
 8006b10:	f7fe fc22 	bl	8005358 <printf>
 8006b14:	6838      	ldr	r0, [r7, #0]
 8006b16:	ab01      	add	r3, sp, #4
 8006b18:	466a      	mov	r2, sp
 8006b1a:	2101      	movs	r1, #1
 8006b1c:	f7ff fd70 	bl	8006600 <image_multi_getimg>
 8006b20:	9800      	ldr	r0, [sp, #0]
 8006b22:	e7e6      	b.n	8006af2 <boot_get_ramdisk+0xd6>
 8006b24:	4a21      	ldr	r2, [pc, #132]	; (8006bac <boot_get_ramdisk+0x190>)
 8006b26:	6c93      	ldr	r3, [r2, #72]	; 0x48
 8006b28:	2b00      	cmp	r3, #0
 8006b2a:	db0b      	blt.n	8006b44 <boot_get_ramdisk+0x128>
 8006b2c:	4599      	cmp	r9, r3
 8006b2e:	f102 0248 	add.w	r2, r2, #72	; 0x48
 8006b32:	d103      	bne.n	8006b3c <boot_get_ramdisk+0x120>
 8006b34:	6891      	ldr	r1, [r2, #8]
 8006b36:	e006      	b.n	8006b46 <boot_get_ramdisk+0x12a>
 8006b38:	4599      	cmp	r9, r3
 8006b3a:	d0fb      	beq.n	8006b34 <boot_get_ramdisk+0x118>
 8006b3c:	f852 3f0c 	ldr.w	r3, [r2, #12]!
 8006b40:	2b00      	cmp	r3, #0
 8006b42:	daf9      	bge.n	8006b38 <boot_get_ramdisk+0x11c>
 8006b44:	491a      	ldr	r1, [pc, #104]	; (8006bb0 <boot_get_ramdisk+0x194>)
 8006b46:	481b      	ldr	r0, [pc, #108]	; (8006bb4 <boot_get_ramdisk+0x198>)
 8006b48:	f7fe fc06 	bl	8005358 <printf>
 8006b4c:	f06f 000c 	mvn.w	r0, #12
 8006b50:	f000 f8e6 	bl	8006d20 <__show_boot_progress>
 8006b54:	2001      	movs	r0, #1
 8006b56:	e776      	b.n	8006a46 <boot_get_ramdisk+0x2a>
 8006b58:	4817      	ldr	r0, [pc, #92]	; (8006bb8 <boot_get_ramdisk+0x19c>)
 8006b5a:	f7fe fbf1 	bl	8005340 <puts>
 8006b5e:	f06f 000b 	mvn.w	r0, #11
 8006b62:	f000 f8dd 	bl	8006d20 <__show_boot_progress>
 8006b66:	2001      	movs	r0, #1
 8006b68:	e76d      	b.n	8006a46 <boot_get_ramdisk+0x2a>
 8006b6a:	4814      	ldr	r0, [pc, #80]	; (8006bbc <boot_get_ramdisk+0x1a0>)
 8006b6c:	f7fe fbe8 	bl	8005340 <puts>
 8006b70:	f06f 0009 	mvn.w	r0, #9
 8006b74:	f000 f8d4 	bl	8006d20 <__show_boot_progress>
 8006b78:	2001      	movs	r0, #1
 8006b7a:	e764      	b.n	8006a46 <boot_get_ramdisk+0x2a>
 8006b7c:	4810      	ldr	r0, [pc, #64]	; (8006bc0 <boot_get_ramdisk+0x1a4>)
 8006b7e:	f7fe fbdf 	bl	8005340 <puts>
 8006b82:	f06f 000a 	mvn.w	r0, #10
 8006b86:	f000 f8cb 	bl	8006d20 <__show_boot_progress>
 8006b8a:	2001      	movs	r0, #1
 8006b8c:	e75b      	b.n	8006a46 <boot_get_ramdisk+0x2a>
 8006b8e:	bf00      	nop
 8006b90:	0800df04 	.word	0x0800df04
 8006b94:	27051956 	.word	0x27051956
 8006b98:	0800df6c 	.word	0x0800df6c
 8006b9c:	0800df88 	.word	0x0800df88
 8006ba0:	0800d0e4 	.word	0x0800d0e4
 8006ba4:	0800cfe4 	.word	0x0800cfe4
 8006ba8:	0800df24 	.word	0x0800df24
 8006bac:	2000079c 	.word	0x2000079c
 8006bb0:	0800dde8 	.word	0x0800dde8
 8006bb4:	0800df08 	.word	0x0800df08
 8006bb8:	0800d100 	.word	0x0800d100
 8006bbc:	0800d0b8 	.word	0x0800d0b8
 8006bc0:	0800d0cc 	.word	0x0800d0cc

08006bc4 <boot_ramdisk_high>:
 8006bc4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8006bc6:	4607      	mov	r7, r0
 8006bc8:	4829      	ldr	r0, [pc, #164]	; (8006c70 <boot_ramdisk_high+0xac>)
 8006bca:	460d      	mov	r5, r1
 8006bcc:	4616      	mov	r6, r2
 8006bce:	461c      	mov	r4, r3
 8006bd0:	f7fe f980 	bl	8004ed4 <getenv>
 8006bd4:	b330      	cbz	r0, 8006c24 <boot_ramdisk_high+0x60>
 8006bd6:	2210      	movs	r2, #16
 8006bd8:	2100      	movs	r1, #0
 8006bda:	f001 fe7d 	bl	80088d8 <simple_strtoul>
 8006bde:	1c43      	adds	r3, r0, #1
 8006be0:	d02f      	beq.n	8006c42 <boot_ramdisk_high+0x7e>
 8006be2:	b305      	cbz	r5, 8006c26 <boot_ramdisk_high+0x62>
 8006be4:	b328      	cbz	r0, 8006c32 <boot_ramdisk_high+0x6e>
 8006be6:	4603      	mov	r3, r0
 8006be8:	f44f 5280 	mov.w	r2, #4096	; 0x1000
 8006bec:	4638      	mov	r0, r7
 8006bee:	4631      	mov	r1, r6
 8006bf0:	f001 fbf0 	bl	80083d4 <lmb_alloc_base>
 8006bf4:	6020      	str	r0, [r4, #0]
 8006bf6:	2800      	cmp	r0, #0
 8006bf8:	d030      	beq.n	8006c5c <boot_ramdisk_high+0x98>
 8006bfa:	200c      	movs	r0, #12
 8006bfc:	f000 f890 	bl	8006d20 <__show_boot_progress>
 8006c00:	6822      	ldr	r2, [r4, #0]
 8006c02:	9b06      	ldr	r3, [sp, #24]
 8006c04:	4432      	add	r2, r6
 8006c06:	601a      	str	r2, [r3, #0]
 8006c08:	6821      	ldr	r1, [r4, #0]
 8006c0a:	481a      	ldr	r0, [pc, #104]	; (8006c74 <boot_ramdisk_high+0xb0>)
 8006c0c:	f7fe fba4 	bl	8005358 <printf>
 8006c10:	4632      	mov	r2, r6
 8006c12:	4629      	mov	r1, r5
 8006c14:	6820      	ldr	r0, [r4, #0]
 8006c16:	f7f9 fdc1 	bl	800079c <memmove>
 8006c1a:	4817      	ldr	r0, [pc, #92]	; (8006c78 <boot_ramdisk_high+0xb4>)
 8006c1c:	f7fe fb90 	bl	8005340 <puts>
 8006c20:	2000      	movs	r0, #0
 8006c22:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8006c24:	bb05      	cbnz	r5, 8006c68 <boot_ramdisk_high+0xa4>
 8006c26:	2300      	movs	r3, #0
 8006c28:	9a06      	ldr	r2, [sp, #24]
 8006c2a:	6023      	str	r3, [r4, #0]
 8006c2c:	4618      	mov	r0, r3
 8006c2e:	6013      	str	r3, [r2, #0]
 8006c30:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8006c32:	4638      	mov	r0, r7
 8006c34:	f44f 5280 	mov.w	r2, #4096	; 0x1000
 8006c38:	4631      	mov	r1, r6
 8006c3a:	f001 fbdb 	bl	80083f4 <lmb_alloc>
 8006c3e:	6020      	str	r0, [r4, #0]
 8006c40:	e7d9      	b.n	8006bf6 <boot_ramdisk_high+0x32>
 8006c42:	2d00      	cmp	r5, #0
 8006c44:	d0ef      	beq.n	8006c26 <boot_ramdisk_high+0x62>
 8006c46:	9a06      	ldr	r2, [sp, #24]
 8006c48:	19ab      	adds	r3, r5, r6
 8006c4a:	6025      	str	r5, [r4, #0]
 8006c4c:	4638      	mov	r0, r7
 8006c4e:	6013      	str	r3, [r2, #0]
 8006c50:	4629      	mov	r1, r5
 8006c52:	4632      	mov	r2, r6
 8006c54:	f001 fb3a 	bl	80082cc <lmb_reserve>
 8006c58:	2000      	movs	r0, #0
 8006c5a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8006c5c:	4807      	ldr	r0, [pc, #28]	; (8006c7c <boot_ramdisk_high+0xb8>)
 8006c5e:	f7fe fb6f 	bl	8005340 <puts>
 8006c62:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8006c66:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8006c68:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8006c6c:	e7bb      	b.n	8006be6 <boot_ramdisk_high+0x22>
 8006c6e:	bf00      	nop
 8006c70:	0800dfc0 	.word	0x0800dfc0
 8006c74:	0800dfe8 	.word	0x0800dfe8
 8006c78:	0800cfe4 	.word	0x0800cfe4
 8006c7c:	0800dfcc 	.word	0x0800dfcc

08006c80 <delete_char.part.0>:
 8006c80:	e92d 46f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r9, sl, lr}
 8006c84:	f911 ec01 	ldrsb.w	lr, [r1, #-1]
 8006c88:	4691      	mov	r9, r2
 8006c8a:	f1be 0f09 	cmp.w	lr, #9
 8006c8e:	461d      	mov	r5, r3
 8006c90:	f101 34ff 	add.w	r4, r1, #4294967295	; 0xffffffff
 8006c94:	9e08      	ldr	r6, [sp, #32]
 8006c96:	d00d      	beq.n	8006cb4 <delete_char.part.0+0x34>
 8006c98:	481f      	ldr	r0, [pc, #124]	; (8006d18 <delete_char.part.0+0x98>)
 8006c9a:	f7fe fb51 	bl	8005340 <puts>
 8006c9e:	f8d9 3000 	ldr.w	r3, [r9]
 8006ca2:	3b01      	subs	r3, #1
 8006ca4:	f8c9 3000 	str.w	r3, [r9]
 8006ca8:	682b      	ldr	r3, [r5, #0]
 8006caa:	4620      	mov	r0, r4
 8006cac:	3b01      	subs	r3, #1
 8006cae:	602b      	str	r3, [r5, #0]
 8006cb0:	e8bd 86f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r9, sl, pc}
 8006cb4:	4607      	mov	r7, r0
 8006cb6:	6810      	ldr	r0, [r2, #0]
 8006cb8:	4286      	cmp	r6, r0
 8006cba:	da0b      	bge.n	8006cd4 <delete_char.part.0+0x54>
 8006cbc:	f8df a058 	ldr.w	sl, [pc, #88]	; 8006d18 <delete_char.part.0+0x98>
 8006cc0:	4650      	mov	r0, sl
 8006cc2:	f7fe fb3d 	bl	8005340 <puts>
 8006cc6:	f8d9 0000 	ldr.w	r0, [r9]
 8006cca:	3801      	subs	r0, #1
 8006ccc:	42b0      	cmp	r0, r6
 8006cce:	f8c9 0000 	str.w	r0, [r9]
 8006cd2:	dcf5      	bgt.n	8006cc0 <delete_char.part.0+0x40>
 8006cd4:	42bc      	cmp	r4, r7
 8006cd6:	d9e7      	bls.n	8006ca8 <delete_char.part.0+0x28>
 8006cd8:	4e10      	ldr	r6, [pc, #64]	; (8006d1c <delete_char.part.0+0x9c>)
 8006cda:	e00a      	b.n	8006cf2 <delete_char.part.0+0x72>
 8006cdc:	f8c9 2000 	str.w	r2, [r9]
 8006ce0:	f997 0000 	ldrsb.w	r0, [r7]
 8006ce4:	f7fe fb20 	bl	8005328 <putc>
 8006ce8:	3701      	adds	r7, #1
 8006cea:	42bc      	cmp	r4, r7
 8006cec:	d0dc      	beq.n	8006ca8 <delete_char.part.0+0x28>
 8006cee:	f8d9 0000 	ldr.w	r0, [r9]
 8006cf2:	f997 3000 	ldrsb.w	r3, [r7]
 8006cf6:	1c42      	adds	r2, r0, #1
 8006cf8:	2b09      	cmp	r3, #9
 8006cfa:	d1ef      	bne.n	8006cdc <delete_char.part.0+0x5c>
 8006cfc:	f000 0007 	and.w	r0, r0, #7
 8006d00:	4430      	add	r0, r6
 8006d02:	f7fe fb1d 	bl	8005340 <puts>
 8006d06:	f8d9 0000 	ldr.w	r0, [r9]
 8006d0a:	f020 0007 	bic.w	r0, r0, #7
 8006d0e:	3008      	adds	r0, #8
 8006d10:	f8c9 0000 	str.w	r0, [r9]
 8006d14:	e7e8      	b.n	8006ce8 <delete_char.part.0+0x68>
 8006d16:	bf00      	nop
 8006d18:	200009ac 	.word	0x200009ac
 8006d1c:	200009b0 	.word	0x200009b0

08006d20 <__show_boot_progress>:
 8006d20:	4770      	bx	lr
 8006d22:	bf00      	nop

08006d24 <readline_into_buffer>:
 8006d24:	2300      	movs	r3, #0
 8006d26:	e92d 46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
 8006d2a:	b085      	sub	sp, #20
 8006d2c:	460e      	mov	r6, r1
 8006d2e:	9302      	str	r3, [sp, #8]
 8006d30:	4604      	mov	r4, r0
 8006d32:	2800      	cmp	r0, #0
 8006d34:	f000 8082 	beq.w	8006e3c <readline_into_buffer+0x118>
 8006d38:	f7f9 fbbc 	bl	80004b4 <strlen>
 8006d3c:	4605      	mov	r5, r0
 8006d3e:	4620      	mov	r0, r4
 8006d40:	f7fe fafe 	bl	8005340 <puts>
 8006d44:	4634      	mov	r4, r6
 8006d46:	f8df 911c 	ldr.w	r9, [pc, #284]	; 8006e64 <readline_into_buffer+0x140>
 8006d4a:	9503      	str	r5, [sp, #12]
 8006d4c:	f1a9 0704 	sub.w	r7, r9, #4
 8006d50:	f7fe fad2 	bl	80052f8 <getc>
 8006d54:	fa4f fa80 	sxtb.w	sl, r0
 8006d58:	f1ba 0f0a 	cmp.w	sl, #10
 8006d5c:	d020      	beq.n	8006da0 <readline_into_buffer+0x7c>
 8006d5e:	dd28      	ble.n	8006db2 <readline_into_buffer+0x8e>
 8006d60:	f1ba 0f15 	cmp.w	sl, #21
 8006d64:	d057      	beq.n	8006e16 <readline_into_buffer+0xf2>
 8006d66:	dd65      	ble.n	8006e34 <readline_into_buffer+0x110>
 8006d68:	f1ba 0f17 	cmp.w	sl, #23
 8006d6c:	d13d      	bne.n	8006dea <readline_into_buffer+0xc6>
 8006d6e:	9b02      	ldr	r3, [sp, #8]
 8006d70:	2b00      	cmp	r3, #0
 8006d72:	d0ed      	beq.n	8006d50 <readline_into_buffer+0x2c>
 8006d74:	4621      	mov	r1, r4
 8006d76:	ab02      	add	r3, sp, #8
 8006d78:	9500      	str	r5, [sp, #0]
 8006d7a:	aa03      	add	r2, sp, #12
 8006d7c:	4630      	mov	r0, r6
 8006d7e:	f7ff ff7f 	bl	8006c80 <delete_char.part.0>
 8006d82:	9b02      	ldr	r3, [sp, #8]
 8006d84:	4604      	mov	r4, r0
 8006d86:	2b00      	cmp	r3, #0
 8006d88:	dde2      	ble.n	8006d50 <readline_into_buffer+0x2c>
 8006d8a:	f990 3000 	ldrsb.w	r3, [r0]
 8006d8e:	2b20      	cmp	r3, #32
 8006d90:	d1f0      	bne.n	8006d74 <readline_into_buffer+0x50>
 8006d92:	f7fe fab1 	bl	80052f8 <getc>
 8006d96:	fa4f fa80 	sxtb.w	sl, r0
 8006d9a:	f1ba 0f0a 	cmp.w	sl, #10
 8006d9e:	d1de      	bne.n	8006d5e <readline_into_buffer+0x3a>
 8006da0:	2300      	movs	r3, #0
 8006da2:	482f      	ldr	r0, [pc, #188]	; (8006e60 <readline_into_buffer+0x13c>)
 8006da4:	7023      	strb	r3, [r4, #0]
 8006da6:	f7fe facb 	bl	8005340 <puts>
 8006daa:	1ba0      	subs	r0, r4, r6
 8006dac:	b005      	add	sp, #20
 8006dae:	e8bd 86f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, pc}
 8006db2:	f1ba 0f03 	cmp.w	sl, #3
 8006db6:	d027      	beq.n	8006e08 <readline_into_buffer+0xe4>
 8006db8:	f1ba 0f08 	cmp.w	sl, #8
 8006dbc:	d018      	beq.n	8006df0 <readline_into_buffer+0xcc>
 8006dbe:	f1ba 0f00 	cmp.w	sl, #0
 8006dc2:	d0c5      	beq.n	8006d50 <readline_into_buffer+0x2c>
 8006dc4:	9b02      	ldr	r3, [sp, #8]
 8006dc6:	2bfd      	cmp	r3, #253	; 0xfd
 8006dc8:	dc3a      	bgt.n	8006e40 <readline_into_buffer+0x11c>
 8006dca:	f1ba 0f09 	cmp.w	sl, #9
 8006dce:	d03b      	beq.n	8006e48 <readline_into_buffer+0x124>
 8006dd0:	9b03      	ldr	r3, [sp, #12]
 8006dd2:	4650      	mov	r0, sl
 8006dd4:	3301      	adds	r3, #1
 8006dd6:	9303      	str	r3, [sp, #12]
 8006dd8:	f7fe faa6 	bl	8005328 <putc>
 8006ddc:	f884 a000 	strb.w	sl, [r4]
 8006de0:	9b02      	ldr	r3, [sp, #8]
 8006de2:	3401      	adds	r4, #1
 8006de4:	3301      	adds	r3, #1
 8006de6:	9302      	str	r3, [sp, #8]
 8006de8:	e7b2      	b.n	8006d50 <readline_into_buffer+0x2c>
 8006dea:	f1ba 0f7f 	cmp.w	sl, #127	; 0x7f
 8006dee:	d1e9      	bne.n	8006dc4 <readline_into_buffer+0xa0>
 8006df0:	9b02      	ldr	r3, [sp, #8]
 8006df2:	2b00      	cmp	r3, #0
 8006df4:	d0ac      	beq.n	8006d50 <readline_into_buffer+0x2c>
 8006df6:	4621      	mov	r1, r4
 8006df8:	9500      	str	r5, [sp, #0]
 8006dfa:	ab02      	add	r3, sp, #8
 8006dfc:	aa03      	add	r2, sp, #12
 8006dfe:	4630      	mov	r0, r6
 8006e00:	f7ff ff3e 	bl	8006c80 <delete_char.part.0>
 8006e04:	4604      	mov	r4, r0
 8006e06:	e7a3      	b.n	8006d50 <readline_into_buffer+0x2c>
 8006e08:	2300      	movs	r3, #0
 8006e0a:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8006e0e:	7033      	strb	r3, [r6, #0]
 8006e10:	b005      	add	sp, #20
 8006e12:	e8bd 86f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, pc}
 8006e16:	9b03      	ldr	r3, [sp, #12]
 8006e18:	429d      	cmp	r5, r3
 8006e1a:	da07      	bge.n	8006e2c <readline_into_buffer+0x108>
 8006e1c:	4638      	mov	r0, r7
 8006e1e:	f7fe fa8f 	bl	8005340 <puts>
 8006e22:	9b03      	ldr	r3, [sp, #12]
 8006e24:	3b01      	subs	r3, #1
 8006e26:	429d      	cmp	r5, r3
 8006e28:	9303      	str	r3, [sp, #12]
 8006e2a:	dbf7      	blt.n	8006e1c <readline_into_buffer+0xf8>
 8006e2c:	2300      	movs	r3, #0
 8006e2e:	4634      	mov	r4, r6
 8006e30:	9302      	str	r3, [sp, #8]
 8006e32:	e78d      	b.n	8006d50 <readline_into_buffer+0x2c>
 8006e34:	f1ba 0f0d 	cmp.w	sl, #13
 8006e38:	d0b2      	beq.n	8006da0 <readline_into_buffer+0x7c>
 8006e3a:	e7c3      	b.n	8006dc4 <readline_into_buffer+0xa0>
 8006e3c:	4605      	mov	r5, r0
 8006e3e:	e781      	b.n	8006d44 <readline_into_buffer+0x20>
 8006e40:	2007      	movs	r0, #7
 8006e42:	f7fe fa71 	bl	8005328 <putc>
 8006e46:	e783      	b.n	8006d50 <readline_into_buffer+0x2c>
 8006e48:	9803      	ldr	r0, [sp, #12]
 8006e4a:	f000 0007 	and.w	r0, r0, #7
 8006e4e:	4448      	add	r0, r9
 8006e50:	f7fe fa76 	bl	8005340 <puts>
 8006e54:	9b03      	ldr	r3, [sp, #12]
 8006e56:	f023 0307 	bic.w	r3, r3, #7
 8006e5a:	3308      	adds	r3, #8
 8006e5c:	9303      	str	r3, [sp, #12]
 8006e5e:	e7bd      	b.n	8006ddc <readline_into_buffer+0xb8>
 8006e60:	0800e328 	.word	0x0800e328
 8006e64:	200009b0 	.word	0x200009b0

08006e68 <readline>:
 8006e68:	2200      	movs	r2, #0
 8006e6a:	4b02      	ldr	r3, [pc, #8]	; (8006e74 <readline+0xc>)
 8006e6c:	4619      	mov	r1, r3
 8006e6e:	701a      	strb	r2, [r3, #0]
 8006e70:	f7ff bf58 	b.w	8006d24 <readline_into_buffer>
 8006e74:	20003588 	.word	0x20003588

08006e78 <parse_line>:
 8006e78:	b570      	push	{r4, r5, r6, lr}
 8006e7a:	2400      	movs	r4, #0
 8006e7c:	4626      	mov	r6, r4
 8006e7e:	1f0d      	subs	r5, r1, #4
 8006e80:	4602      	mov	r2, r0
 8006e82:	f910 3b01 	ldrsb.w	r3, [r0], #1
 8006e86:	2b20      	cmp	r3, #32
 8006e88:	d0fa      	beq.n	8006e80 <parse_line+0x8>
 8006e8a:	2b09      	cmp	r3, #9
 8006e8c:	d0f8      	beq.n	8006e80 <parse_line+0x8>
 8006e8e:	b1cb      	cbz	r3, 8006ec4 <parse_line+0x4c>
 8006e90:	f845 2f04 	str.w	r2, [r5, #4]!
 8006e94:	f992 3000 	ldrsb.w	r3, [r2]
 8006e98:	3401      	adds	r4, #1
 8006e9a:	b92b      	cbnz	r3, 8006ea8 <parse_line+0x30>
 8006e9c:	e011      	b.n	8006ec2 <parse_line+0x4a>
 8006e9e:	2b09      	cmp	r3, #9
 8006ea0:	d004      	beq.n	8006eac <parse_line+0x34>
 8006ea2:	f912 3f01 	ldrsb.w	r3, [r2, #1]!
 8006ea6:	b163      	cbz	r3, 8006ec2 <parse_line+0x4a>
 8006ea8:	2b20      	cmp	r3, #32
 8006eaa:	d1f8      	bne.n	8006e9e <parse_line+0x26>
 8006eac:	2c10      	cmp	r4, #16
 8006eae:	7016      	strb	r6, [r2, #0]
 8006eb0:	f102 0001 	add.w	r0, r2, #1
 8006eb4:	d1e4      	bne.n	8006e80 <parse_line+0x8>
 8006eb6:	4621      	mov	r1, r4
 8006eb8:	4804      	ldr	r0, [pc, #16]	; (8006ecc <parse_line+0x54>)
 8006eba:	f7fe fa4d 	bl	8005358 <printf>
 8006ebe:	4620      	mov	r0, r4
 8006ec0:	bd70      	pop	{r4, r5, r6, pc}
 8006ec2:	2300      	movs	r3, #0
 8006ec4:	f841 3024 	str.w	r3, [r1, r4, lsl #2]
 8006ec8:	4620      	mov	r0, r4
 8006eca:	bd70      	pop	{r4, r5, r6, pc}
 8006ecc:	0800e32c 	.word	0x0800e32c

08006ed0 <run_command>:
 8006ed0:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8006ed4:	4604      	mov	r4, r0
 8006ed6:	f5ad 7d56 	sub.w	sp, sp, #856	; 0x358
 8006eda:	9103      	str	r1, [sp, #12]
 8006edc:	f7fe fa84 	bl	80053e8 <clear_ctrlc>
 8006ee0:	2c00      	cmp	r4, #0
 8006ee2:	f000 8155 	beq.w	8007190 <run_command+0x2c0>
 8006ee6:	f994 3000 	ldrsb.w	r3, [r4]
 8006eea:	2b00      	cmp	r3, #0
 8006eec:	f000 8150 	beq.w	8007190 <run_command+0x2c0>
 8006ef0:	4620      	mov	r0, r4
 8006ef2:	f7f9 fadf 	bl	80004b4 <strlen>
 8006ef6:	28ff      	cmp	r0, #255	; 0xff
 8006ef8:	f200 8162 	bhi.w	80071c0 <run_command+0x2f0>
 8006efc:	2300      	movs	r3, #0
 8006efe:	4621      	mov	r1, r4
 8006f00:	a816      	add	r0, sp, #88	; 0x58
 8006f02:	9301      	str	r3, [sp, #4]
 8006f04:	f7f9 fa3c 	bl	8000380 <strcpy>
 8006f08:	2301      	movs	r3, #1
 8006f0a:	ac16      	add	r4, sp, #88	; 0x58
 8006f0c:	f994 2000 	ldrsb.w	r2, [r4]
 8006f10:	9302      	str	r3, [sp, #8]
 8006f12:	2a00      	cmp	r2, #0
 8006f14:	d065      	beq.n	8006fe2 <run_command+0x112>
 8006f16:	4626      	mov	r6, r4
 8006f18:	2100      	movs	r1, #0
 8006f1a:	e007      	b.n	8006f2c <run_command+0x5c>
 8006f1c:	f916 3f01 	ldrsb.w	r3, [r6, #1]!
 8006f20:	b313      	cbz	r3, 8006f68 <run_command+0x98>
 8006f22:	2b27      	cmp	r3, #39	; 0x27
 8006f24:	d00d      	beq.n	8006f42 <run_command+0x72>
 8006f26:	f916 2f01 	ldrsb.w	r2, [r6, #1]!
 8006f2a:	b1ea      	cbz	r2, 8006f68 <run_command+0x98>
 8006f2c:	2a27      	cmp	r2, #39	; 0x27
 8006f2e:	d008      	beq.n	8006f42 <run_command+0x72>
 8006f30:	2900      	cmp	r1, #0
 8006f32:	d1f3      	bne.n	8006f1c <run_command+0x4c>
 8006f34:	2a3b      	cmp	r2, #59	; 0x3b
 8006f36:	d00b      	beq.n	8006f50 <run_command+0x80>
 8006f38:	f916 2f01 	ldrsb.w	r2, [r6, #1]!
 8006f3c:	b1a2      	cbz	r2, 8006f68 <run_command+0x98>
 8006f3e:	2a27      	cmp	r2, #39	; 0x27
 8006f40:	d1f8      	bne.n	8006f34 <run_command+0x64>
 8006f42:	f916 3c01 	ldrsb.w	r3, [r6, #-1]
 8006f46:	2b5c      	cmp	r3, #92	; 0x5c
 8006f48:	d0ed      	beq.n	8006f26 <run_command+0x56>
 8006f4a:	f081 0101 	eor.w	r1, r1, #1
 8006f4e:	e7ea      	b.n	8006f26 <run_command+0x56>
 8006f50:	42b4      	cmp	r4, r6
 8006f52:	f000 80f9 	beq.w	8007148 <run_command+0x278>
 8006f56:	f916 3c01 	ldrsb.w	r3, [r6, #-1]
 8006f5a:	2b5c      	cmp	r3, #92	; 0x5c
 8006f5c:	d0ec      	beq.n	8006f38 <run_command+0x68>
 8006f5e:	f04f 0300 	mov.w	r3, #0
 8006f62:	3601      	adds	r6, #1
 8006f64:	f806 3c01 	strb.w	r3, [r6, #-1]
 8006f68:	4620      	mov	r0, r4
 8006f6a:	f7f9 faa3 	bl	80004b4 <strlen>
 8006f6e:	2800      	cmp	r0, #0
 8006f70:	f000 80f6 	beq.w	8007160 <run_command+0x290>
 8006f74:	f04f 0b00 	mov.w	fp, #0
 8006f78:	ab56      	add	r3, sp, #344	; 0x158
 8006f7a:	461f      	mov	r7, r3
 8006f7c:	9300      	str	r3, [sp, #0]
 8006f7e:	4659      	mov	r1, fp
 8006f80:	4623      	mov	r3, r4
 8006f82:	465a      	mov	r2, fp
 8006f84:	f44f 7480 	mov.w	r4, #256	; 0x100
 8006f88:	46b1      	mov	r9, r6
 8006f8a:	2a03      	cmp	r2, #3
 8006f8c:	f103 0a01 	add.w	sl, r3, #1
 8006f90:	f993 5000 	ldrsb.w	r5, [r3]
 8006f94:	f100 36ff 	add.w	r6, r0, #4294967295	; 0xffffffff
 8006f98:	d078      	beq.n	800708c <run_command+0x1bc>
 8006f9a:	2d5c      	cmp	r5, #92	; 0x5c
 8006f9c:	d058      	beq.n	8007050 <run_command+0x180>
 8006f9e:	2a01      	cmp	r2, #1
 8006fa0:	d064      	beq.n	800706c <run_command+0x19c>
 8006fa2:	2a02      	cmp	r2, #2
 8006fa4:	d126      	bne.n	8006ff4 <run_command+0x124>
 8006fa6:	2d29      	cmp	r5, #41	; 0x29
 8006fa8:	d079      	beq.n	800709e <run_command+0x1ce>
 8006faa:	2d7d      	cmp	r5, #125	; 0x7d
 8006fac:	d077      	beq.n	800709e <run_command+0x1ce>
 8006fae:	4629      	mov	r1, r5
 8006fb0:	4653      	mov	r3, sl
 8006fb2:	4630      	mov	r0, r6
 8006fb4:	2202      	movs	r2, #2
 8006fb6:	b366      	cbz	r6, 8007012 <run_command+0x142>
 8006fb8:	2c00      	cmp	r4, #0
 8006fba:	d1e6      	bne.n	8006f8a <run_command+0xba>
 8006fbc:	464e      	mov	r6, r9
 8006fbe:	f04f 0300 	mov.w	r3, #0
 8006fc2:	9800      	ldr	r0, [sp, #0]
 8006fc4:	f807 3c01 	strb.w	r3, [r7, #-1]
 8006fc8:	a905      	add	r1, sp, #20
 8006fca:	f7ff ff55 	bl	8006e78 <parse_line>
 8006fce:	4604      	mov	r4, r0
 8006fd0:	bb60      	cbnz	r0, 800702c <run_command+0x15c>
 8006fd2:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
 8006fd6:	9301      	str	r3, [sp, #4]
 8006fd8:	4634      	mov	r4, r6
 8006fda:	f994 2000 	ldrsb.w	r2, [r4]
 8006fde:	2a00      	cmp	r2, #0
 8006fe0:	d199      	bne.n	8006f16 <run_command+0x46>
 8006fe2:	9b01      	ldr	r3, [sp, #4]
 8006fe4:	2b00      	cmp	r3, #0
 8006fe6:	f040 80d3 	bne.w	8007190 <run_command+0x2c0>
 8006fea:	9802      	ldr	r0, [sp, #8]
 8006fec:	f50d 7d56 	add.w	sp, sp, #856	; 0x358
 8006ff0:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8006ff4:	2d27      	cmp	r5, #39	; 0x27
 8006ff6:	f000 8094 	beq.w	8007122 <run_command+0x252>
 8006ffa:	2d24      	cmp	r5, #36	; 0x24
 8006ffc:	f000 809c 	beq.w	8007138 <run_command+0x268>
 8007000:	703d      	strb	r5, [r7, #0]
 8007002:	3c01      	subs	r4, #1
 8007004:	4629      	mov	r1, r5
 8007006:	3701      	adds	r7, #1
 8007008:	4653      	mov	r3, sl
 800700a:	4630      	mov	r0, r6
 800700c:	2200      	movs	r2, #0
 800700e:	2e00      	cmp	r6, #0
 8007010:	d1d2      	bne.n	8006fb8 <run_command+0xe8>
 8007012:	464e      	mov	r6, r9
 8007014:	2c00      	cmp	r4, #0
 8007016:	d0d2      	beq.n	8006fbe <run_command+0xee>
 8007018:	f04f 0300 	mov.w	r3, #0
 800701c:	9800      	ldr	r0, [sp, #0]
 800701e:	703b      	strb	r3, [r7, #0]
 8007020:	a905      	add	r1, sp, #20
 8007022:	f7ff ff29 	bl	8006e78 <parse_line>
 8007026:	4604      	mov	r4, r0
 8007028:	2800      	cmp	r0, #0
 800702a:	d0d2      	beq.n	8006fd2 <run_command+0x102>
 800702c:	9805      	ldr	r0, [sp, #20]
 800702e:	f7fe f899 	bl	8005164 <find_cmd>
 8007032:	4605      	mov	r5, r0
 8007034:	2800      	cmp	r0, #0
 8007036:	f000 80b5 	beq.w	80071a4 <run_command+0x2d4>
 800703a:	6843      	ldr	r3, [r0, #4]
 800703c:	429c      	cmp	r4, r3
 800703e:	f340 8093 	ble.w	8007168 <run_command+0x298>
 8007042:	f7fe f89f 	bl	8005184 <cmd_usage>
 8007046:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
 800704a:	4634      	mov	r4, r6
 800704c:	9301      	str	r3, [sp, #4]
 800704e:	e7c4      	b.n	8006fda <run_command+0x10a>
 8007050:	295c      	cmp	r1, #92	; 0x5c
 8007052:	d059      	beq.n	8007108 <run_command+0x238>
 8007054:	3802      	subs	r0, #2
 8007056:	2e00      	cmp	r6, #0
 8007058:	f000 80a2 	beq.w	80071a0 <run_command+0x2d0>
 800705c:	2a01      	cmp	r2, #1
 800705e:	4629      	mov	r1, r5
 8007060:	4606      	mov	r6, r0
 8007062:	f993 5001 	ldrsb.w	r5, [r3, #1]
 8007066:	f103 0a02 	add.w	sl, r3, #2
 800706a:	d19a      	bne.n	8006fa2 <run_command+0xd2>
 800706c:	2d28      	cmp	r5, #40	; 0x28
 800706e:	d045      	beq.n	80070fc <run_command+0x22c>
 8007070:	2d7b      	cmp	r5, #123	; 0x7b
 8007072:	d043      	beq.n	80070fc <run_command+0x22c>
 8007074:	2324      	movs	r3, #36	; 0x24
 8007076:	2c01      	cmp	r4, #1
 8007078:	703b      	strb	r3, [r7, #0]
 800707a:	d05a      	beq.n	8007132 <run_command+0x262>
 800707c:	707d      	strb	r5, [r7, #1]
 800707e:	3c02      	subs	r4, #2
 8007080:	4629      	mov	r1, r5
 8007082:	3702      	adds	r7, #2
 8007084:	4653      	mov	r3, sl
 8007086:	4630      	mov	r0, r6
 8007088:	2200      	movs	r2, #0
 800708a:	e794      	b.n	8006fb6 <run_command+0xe6>
 800708c:	2d27      	cmp	r5, #39	; 0x27
 800708e:	d041      	beq.n	8007114 <run_command+0x244>
 8007090:	703d      	strb	r5, [r7, #0]
 8007092:	3c01      	subs	r4, #1
 8007094:	4629      	mov	r1, r5
 8007096:	3701      	adds	r7, #1
 8007098:	4653      	mov	r3, sl
 800709a:	4630      	mov	r0, r6
 800709c:	e78b      	b.n	8006fb6 <run_command+0xe6>
 800709e:	ebaa 0c0b 	sub.w	ip, sl, fp
 80070a2:	f1bc 0f01 	cmp.w	ip, #1
 80070a6:	f340 8086 	ble.w	80071b6 <run_command+0x2e6>
 80070aa:	f50d 7e16 	add.w	lr, sp, #600	; 0x258
 80070ae:	f1ac 0002 	sub.w	r0, ip, #2
 80070b2:	4470      	add	r0, lr
 80070b4:	f10b 32ff 	add.w	r2, fp, #4294967295	; 0xffffffff
 80070b8:	f20d 2357 	addw	r3, sp, #599	; 0x257
 80070bc:	f812 1f01 	ldrb.w	r1, [r2, #1]!
 80070c0:	f803 1f01 	strb.w	r1, [r3, #1]!
 80070c4:	4298      	cmp	r0, r3
 80070c6:	d1f9      	bne.n	80070bc <run_command+0x1ec>
 80070c8:	f10c 3cff 	add.w	ip, ip, #4294967295	; 0xffffffff
 80070cc:	f04f 0300 	mov.w	r3, #0
 80070d0:	4670      	mov	r0, lr
 80070d2:	f80e 300c 	strb.w	r3, [lr, ip]
 80070d6:	f7fd fefd 	bl	8004ed4 <getenv>
 80070da:	b150      	cbz	r0, 80070f2 <run_command+0x222>
 80070dc:	f990 3000 	ldrsb.w	r3, [r0]
 80070e0:	b13b      	cbz	r3, 80070f2 <run_command+0x222>
 80070e2:	b134      	cbz	r4, 80070f2 <run_command+0x222>
 80070e4:	f807 3b01 	strb.w	r3, [r7], #1
 80070e8:	f910 3f01 	ldrsb.w	r3, [r0, #1]!
 80070ec:	3c01      	subs	r4, #1
 80070ee:	2b00      	cmp	r3, #0
 80070f0:	d1f7      	bne.n	80070e2 <run_command+0x212>
 80070f2:	4629      	mov	r1, r5
 80070f4:	4653      	mov	r3, sl
 80070f6:	4630      	mov	r0, r6
 80070f8:	2200      	movs	r2, #0
 80070fa:	e75c      	b.n	8006fb6 <run_command+0xe6>
 80070fc:	46d3      	mov	fp, sl
 80070fe:	4629      	mov	r1, r5
 8007100:	4653      	mov	r3, sl
 8007102:	4630      	mov	r0, r6
 8007104:	2202      	movs	r2, #2
 8007106:	e756      	b.n	8006fb6 <run_command+0xe6>
 8007108:	2a01      	cmp	r2, #1
 800710a:	d0b3      	beq.n	8007074 <run_command+0x1a4>
 800710c:	2a02      	cmp	r2, #2
 800710e:	f43f af4e 	beq.w	8006fae <run_command+0xde>
 8007112:	e775      	b.n	8007000 <run_command+0x130>
 8007114:	295c      	cmp	r1, #92	; 0x5c
 8007116:	d0bb      	beq.n	8007090 <run_command+0x1c0>
 8007118:	4629      	mov	r1, r5
 800711a:	4653      	mov	r3, sl
 800711c:	4630      	mov	r0, r6
 800711e:	2200      	movs	r2, #0
 8007120:	e749      	b.n	8006fb6 <run_command+0xe6>
 8007122:	295c      	cmp	r1, #92	; 0x5c
 8007124:	f43f af6c 	beq.w	8007000 <run_command+0x130>
 8007128:	4629      	mov	r1, r5
 800712a:	4653      	mov	r3, sl
 800712c:	4630      	mov	r0, r6
 800712e:	2203      	movs	r2, #3
 8007130:	e741      	b.n	8006fb6 <run_command+0xe6>
 8007132:	464e      	mov	r6, r9
 8007134:	3701      	adds	r7, #1
 8007136:	e742      	b.n	8006fbe <run_command+0xee>
 8007138:	295c      	cmp	r1, #92	; 0x5c
 800713a:	f43f af61 	beq.w	8007000 <run_command+0x130>
 800713e:	4629      	mov	r1, r5
 8007140:	4653      	mov	r3, sl
 8007142:	4630      	mov	r0, r6
 8007144:	2201      	movs	r2, #1
 8007146:	e736      	b.n	8006fb6 <run_command+0xe6>
 8007148:	f994 2001 	ldrsb.w	r2, [r4, #1]
 800714c:	1c66      	adds	r6, r4, #1
 800714e:	2a00      	cmp	r2, #0
 8007150:	f47f aef5 	bne.w	8006f3e <run_command+0x6e>
 8007154:	4620      	mov	r0, r4
 8007156:	f7f9 f9ad 	bl	80004b4 <strlen>
 800715a:	2800      	cmp	r0, #0
 800715c:	f47f af0a 	bne.w	8006f74 <run_command+0xa4>
 8007160:	ab56      	add	r3, sp, #344	; 0x158
 8007162:	9300      	str	r3, [sp, #0]
 8007164:	461f      	mov	r7, r3
 8007166:	e757      	b.n	8007018 <run_command+0x148>
 8007168:	4622      	mov	r2, r4
 800716a:	ab05      	add	r3, sp, #20
 800716c:	68c4      	ldr	r4, [r0, #12]
 800716e:	9903      	ldr	r1, [sp, #12]
 8007170:	47a0      	blx	r4
 8007172:	2800      	cmp	r0, #0
 8007174:	9a01      	ldr	r2, [sp, #4]
 8007176:	bf18      	it	ne
 8007178:	f04f 32ff 	movne.w	r2, #4294967295	; 0xffffffff
 800717c:	68ab      	ldr	r3, [r5, #8]
 800717e:	9201      	str	r2, [sp, #4]
 8007180:	9a02      	ldr	r2, [sp, #8]
 8007182:	401a      	ands	r2, r3
 8007184:	9202      	str	r2, [sp, #8]
 8007186:	f7fe f929 	bl	80053dc <had_ctrlc>
 800718a:	2800      	cmp	r0, #0
 800718c:	f43f af24 	beq.w	8006fd8 <run_command+0x108>
 8007190:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
 8007194:	9302      	str	r3, [sp, #8]
 8007196:	9802      	ldr	r0, [sp, #8]
 8007198:	f50d 7d56 	add.w	sp, sp, #856	; 0x358
 800719c:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 80071a0:	464e      	mov	r6, r9
 80071a2:	e739      	b.n	8007018 <run_command+0x148>
 80071a4:	9905      	ldr	r1, [sp, #20]
 80071a6:	480c      	ldr	r0, [pc, #48]	; (80071d8 <run_command+0x308>)
 80071a8:	f7fe f8d6 	bl	8005358 <printf>
 80071ac:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
 80071b0:	4634      	mov	r4, r6
 80071b2:	9301      	str	r3, [sp, #4]
 80071b4:	e711      	b.n	8006fda <run_command+0x10a>
 80071b6:	f04f 0c00 	mov.w	ip, #0
 80071ba:	f50d 7e16 	add.w	lr, sp, #600	; 0x258
 80071be:	e785      	b.n	80070cc <run_command+0x1fc>
 80071c0:	4806      	ldr	r0, [pc, #24]	; (80071dc <run_command+0x30c>)
 80071c2:	f7fe f8bd 	bl	8005340 <puts>
 80071c6:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
 80071ca:	9302      	str	r3, [sp, #8]
 80071cc:	9802      	ldr	r0, [sp, #8]
 80071ce:	f50d 7d56 	add.w	sp, sp, #856	; 0x358
 80071d2:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 80071d6:	bf00      	nop
 80071d8:	0800e364 	.word	0x0800e364
 80071dc:	0800e34c 	.word	0x0800e34c

080071e0 <main_loop>:
 80071e0:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 80071e4:	483c      	ldr	r0, [pc, #240]	; (80072d8 <main_loop+0xf8>)
 80071e6:	f7fd fe75 	bl	8004ed4 <getenv>
 80071ea:	2800      	cmp	r0, #0
 80071ec:	d06d      	beq.n	80072ca <main_loop+0xea>
 80071ee:	220a      	movs	r2, #10
 80071f0:	2100      	movs	r1, #0
 80071f2:	f001 fbc5 	bl	8008980 <simple_strtol>
 80071f6:	4605      	mov	r5, r0
 80071f8:	4838      	ldr	r0, [pc, #224]	; (80072dc <main_loop+0xfc>)
 80071fa:	f7fd fe6b 	bl	8004ed4 <getenv>
 80071fe:	2d00      	cmp	r5, #0
 8007200:	4606      	mov	r6, r0
 8007202:	db20      	blt.n	8007246 <main_loop+0x66>
 8007204:	b1fe      	cbz	r6, 8007246 <main_loop+0x66>
 8007206:	4629      	mov	r1, r5
 8007208:	4835      	ldr	r0, [pc, #212]	; (80072e0 <main_loop+0x100>)
 800720a:	f7fe f8a5 	bl	8005358 <printf>
 800720e:	f7fe f87f 	bl	8005310 <tstc>
 8007212:	2800      	cmp	r0, #0
 8007214:	d150      	bne.n	80072b8 <main_loop+0xd8>
 8007216:	2d00      	cmp	r5, #0
 8007218:	d046      	beq.n	80072a8 <main_loop+0xc8>
 800721a:	4f32      	ldr	r7, [pc, #200]	; (80072e4 <main_loop+0x104>)
 800721c:	2464      	movs	r4, #100	; 0x64
 800721e:	e005      	b.n	800722c <main_loop+0x4c>
 8007220:	f242 7010 	movw	r0, #10000	; 0x2710
 8007224:	f001 f930 	bl	8008488 <udelay>
 8007228:	3c01      	subs	r4, #1
 800722a:	d036      	beq.n	800729a <main_loop+0xba>
 800722c:	f7fe f870 	bl	8005310 <tstc>
 8007230:	2800      	cmp	r0, #0
 8007232:	d0f5      	beq.n	8007220 <main_loop+0x40>
 8007234:	f7fe f860 	bl	80052f8 <getc>
 8007238:	482a      	ldr	r0, [pc, #168]	; (80072e4 <main_loop+0x104>)
 800723a:	2100      	movs	r1, #0
 800723c:	f7fe f88c 	bl	8005358 <printf>
 8007240:	200a      	movs	r0, #10
 8007242:	f7fe f871 	bl	8005328 <putc>
 8007246:	4d28      	ldr	r5, [pc, #160]	; (80072e8 <main_loop+0x108>)
 8007248:	f04f 0b01 	mov.w	fp, #1
 800724c:	462c      	mov	r4, r5
 800724e:	2600      	movs	r6, #0
 8007250:	4f26      	ldr	r7, [pc, #152]	; (80072ec <main_loop+0x10c>)
 8007252:	f8df a0a4 	ldr.w	sl, [pc, #164]	; 80072f8 <main_loop+0x118>
 8007256:	f505 7980 	add.w	r9, r5, #256	; 0x100
 800725a:	4621      	mov	r1, r4
 800725c:	4638      	mov	r0, r7
 800725e:	702e      	strb	r6, [r5, #0]
 8007260:	f7ff fd60 	bl	8006d24 <readline_into_buffer>
 8007264:	1e01      	subs	r1, r0, #0
 8007266:	4822      	ldr	r0, [pc, #136]	; (80072f0 <main_loop+0x110>)
 8007268:	dd0d      	ble.n	8007286 <main_loop+0xa6>
 800726a:	4621      	mov	r1, r4
 800726c:	f7f9 f888 	bl	8000380 <strcpy>
 8007270:	2100      	movs	r1, #0
 8007272:	4648      	mov	r0, r9
 8007274:	f7ff fe2c 	bl	8006ed0 <run_command>
 8007278:	4683      	mov	fp, r0
 800727a:	f1bb 0f00 	cmp.w	fp, #0
 800727e:	dcec      	bgt.n	800725a <main_loop+0x7a>
 8007280:	f885 6100 	strb.w	r6, [r5, #256]	; 0x100
 8007284:	e7e9      	b.n	800725a <main_loop+0x7a>
 8007286:	1c4b      	adds	r3, r1, #1
 8007288:	d103      	bne.n	8007292 <main_loop+0xb2>
 800728a:	4650      	mov	r0, sl
 800728c:	f7fe f858 	bl	8005340 <puts>
 8007290:	e7f3      	b.n	800727a <main_loop+0x9a>
 8007292:	fab1 f181 	clz	r1, r1
 8007296:	0949      	lsrs	r1, r1, #5
 8007298:	e7eb      	b.n	8007272 <main_loop+0x92>
 800729a:	3d01      	subs	r5, #1
 800729c:	4629      	mov	r1, r5
 800729e:	4638      	mov	r0, r7
 80072a0:	f7fe f85a 	bl	8005358 <printf>
 80072a4:	2d00      	cmp	r5, #0
 80072a6:	d1b9      	bne.n	800721c <main_loop+0x3c>
 80072a8:	200a      	movs	r0, #10
 80072aa:	f7fe f83d 	bl	8005328 <putc>
 80072ae:	4630      	mov	r0, r6
 80072b0:	2100      	movs	r1, #0
 80072b2:	f7ff fe0d 	bl	8006ed0 <run_command>
 80072b6:	e7c6      	b.n	8007246 <main_loop+0x66>
 80072b8:	f7fe f81e 	bl	80052f8 <getc>
 80072bc:	480d      	ldr	r0, [pc, #52]	; (80072f4 <main_loop+0x114>)
 80072be:	f7fe f83f 	bl	8005340 <puts>
 80072c2:	200a      	movs	r0, #10
 80072c4:	f7fe f830 	bl	8005328 <putc>
 80072c8:	e7bd      	b.n	8007246 <main_loop+0x66>
 80072ca:	4804      	ldr	r0, [pc, #16]	; (80072dc <main_loop+0xfc>)
 80072cc:	f7fd fe02 	bl	8004ed4 <getenv>
 80072d0:	2502      	movs	r5, #2
 80072d2:	4606      	mov	r6, r0
 80072d4:	e796      	b.n	8007204 <main_loop+0x24>
 80072d6:	bf00      	nop
 80072d8:	0800e388 	.word	0x0800e388
 80072dc:	0800e394 	.word	0x0800e394
 80072e0:	0800e39c 	.word	0x0800e39c
 80072e4:	0800e3c8 	.word	0x0800e3c8
 80072e8:	20003588 	.word	0x20003588
 80072ec:	0800e3d0 	.word	0x0800e3d0
 80072f0:	20003688 	.word	0x20003688
 80072f4:	0800e3c0 	.word	0x0800e3c0
 80072f8:	0800e3e0 	.word	0x0800e3e0

080072fc <do_run>:
 80072fc:	2a01      	cmp	r2, #1
 80072fe:	e92d 42f0 	stmdb	sp!, {r4, r5, r6, r7, r9, lr}
 8007302:	dd1e      	ble.n	8007342 <do_run+0x46>
 8007304:	4617      	mov	r7, r2
 8007306:	4689      	mov	r9, r1
 8007308:	2501      	movs	r5, #1
 800730a:	1d1c      	adds	r4, r3, #4
 800730c:	6820      	ldr	r0, [r4, #0]
 800730e:	f7fd fde1 	bl	8004ed4 <getenv>
 8007312:	4626      	mov	r6, r4
 8007314:	3501      	adds	r5, #1
 8007316:	3404      	adds	r4, #4
 8007318:	b148      	cbz	r0, 800732e <do_run+0x32>
 800731a:	4649      	mov	r1, r9
 800731c:	f7ff fdd8 	bl	8006ed0 <run_command>
 8007320:	3001      	adds	r0, #1
 8007322:	d00b      	beq.n	800733c <do_run+0x40>
 8007324:	42af      	cmp	r7, r5
 8007326:	d1f1      	bne.n	800730c <do_run+0x10>
 8007328:	2000      	movs	r0, #0
 800732a:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 800732e:	6831      	ldr	r1, [r6, #0]
 8007330:	4806      	ldr	r0, [pc, #24]	; (800734c <do_run+0x50>)
 8007332:	f7fe f811 	bl	8005358 <printf>
 8007336:	2001      	movs	r0, #1
 8007338:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 800733c:	2001      	movs	r0, #1
 800733e:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 8007342:	f7fd ff1f 	bl	8005184 <cmd_usage>
 8007346:	2001      	movs	r0, #1
 8007348:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 800734c:	0800daa8 	.word	0x0800daa8

08007350 <stdio_get_list>:
 8007350:	4800      	ldr	r0, [pc, #0]	; (8007354 <stdio_get_list+0x4>)
 8007352:	4770      	bx	lr
 8007354:	200037bc 	.word	0x200037bc

08007358 <stdio_get_by_name>:
 8007358:	b1b8      	cbz	r0, 800738a <stdio_get_by_name+0x32>
 800735a:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800735c:	4e0c      	ldr	r6, [pc, #48]	; (8007390 <stdio_get_by_name+0x38>)
 800735e:	4605      	mov	r5, r0
 8007360:	f856 4f34 	ldr.w	r4, [r6, #52]!
 8007364:	42b4      	cmp	r4, r6
 8007366:	d103      	bne.n	8007370 <stdio_get_by_name+0x18>
 8007368:	e00d      	b.n	8007386 <stdio_get_by_name+0x2e>
 800736a:	6824      	ldr	r4, [r4, #0]
 800736c:	42b4      	cmp	r4, r6
 800736e:	d00a      	beq.n	8007386 <stdio_get_by_name+0x2e>
 8007370:	4629      	mov	r1, r5
 8007372:	f1a4 002c 	sub.w	r0, r4, #44	; 0x2c
 8007376:	f1a4 0734 	sub.w	r7, r4, #52	; 0x34
 800737a:	f7f9 f845 	bl	8000408 <strcmp>
 800737e:	2800      	cmp	r0, #0
 8007380:	d1f3      	bne.n	800736a <stdio_get_by_name+0x12>
 8007382:	4638      	mov	r0, r7
 8007384:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8007386:	2000      	movs	r0, #0
 8007388:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800738a:	2000      	movs	r0, #0
 800738c:	4770      	bx	lr
 800738e:	bf00      	nop
 8007390:	20003788 	.word	0x20003788

08007394 <stdio_clone>:
 8007394:	b538      	push	{r3, r4, r5, lr}
 8007396:	b198      	cbz	r0, 80073c0 <stdio_clone+0x2c>
 8007398:	4604      	mov	r4, r0
 800739a:	213c      	movs	r1, #60	; 0x3c
 800739c:	2001      	movs	r0, #1
 800739e:	f7fe fcd9 	bl	8005d54 <calloc>
 80073a2:	4605      	mov	r5, r0
 80073a4:	b150      	cbz	r0, 80073bc <stdio_clone+0x28>
 80073a6:	223c      	movs	r2, #60	; 0x3c
 80073a8:	4621      	mov	r1, r4
 80073aa:	f7f9 f9d1 	bl	8000750 <memcpy>
 80073ae:	f104 0108 	add.w	r1, r4, #8
 80073b2:	2210      	movs	r2, #16
 80073b4:	f105 0008 	add.w	r0, r5, #8
 80073b8:	f7f8 ffea 	bl	8000390 <strncpy>
 80073bc:	4628      	mov	r0, r5
 80073be:	bd38      	pop	{r3, r4, r5, pc}
 80073c0:	4605      	mov	r5, r0
 80073c2:	e7fb      	b.n	80073bc <stdio_clone+0x28>

080073c4 <stdio_register>:
 80073c4:	b538      	push	{r3, r4, r5, lr}
 80073c6:	f7ff ffe5 	bl	8007394 <stdio_clone>
 80073ca:	b160      	cbz	r0, 80073e6 <stdio_register+0x22>
 80073cc:	4603      	mov	r3, r0
 80073ce:	4a07      	ldr	r2, [pc, #28]	; (80073ec <stdio_register+0x28>)
 80073d0:	f100 0434 	add.w	r4, r0, #52	; 0x34
 80073d4:	6b91      	ldr	r1, [r2, #56]	; 0x38
 80073d6:	f102 0534 	add.w	r5, r2, #52	; 0x34
 80073da:	6394      	str	r4, [r2, #56]	; 0x38
 80073dc:	2000      	movs	r0, #0
 80073de:	6399      	str	r1, [r3, #56]	; 0x38
 80073e0:	635d      	str	r5, [r3, #52]	; 0x34
 80073e2:	600c      	str	r4, [r1, #0]
 80073e4:	bd38      	pop	{r3, r4, r5, pc}
 80073e6:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 80073ea:	bd38      	pop	{r3, r4, r5, pc}
 80073ec:	20003788 	.word	0x20003788

080073f0 <stdio_init>:
 80073f0:	b530      	push	{r4, r5, lr}
 80073f2:	4b0f      	ldr	r3, [pc, #60]	; (8007430 <stdio_init+0x40>)
 80073f4:	b091      	sub	sp, #68	; 0x44
 80073f6:	f103 0434 	add.w	r4, r3, #52	; 0x34
 80073fa:	635c      	str	r4, [r3, #52]	; 0x34
 80073fc:	639c      	str	r4, [r3, #56]	; 0x38
 80073fe:	223c      	movs	r2, #60	; 0x3c
 8007400:	a801      	add	r0, sp, #4
 8007402:	2100      	movs	r1, #0
 8007404:	f7f9 f964 	bl	80006d0 <memset>
 8007408:	490a      	ldr	r1, [pc, #40]	; (8007434 <stdio_init+0x44>)
 800740a:	a803      	add	r0, sp, #12
 800740c:	f7f8 ffb8 	bl	8000380 <strcpy>
 8007410:	4d09      	ldr	r5, [pc, #36]	; (8007438 <stdio_init+0x48>)
 8007412:	490a      	ldr	r1, [pc, #40]	; (800743c <stdio_init+0x4c>)
 8007414:	4a0a      	ldr	r2, [pc, #40]	; (8007440 <stdio_init+0x50>)
 8007416:	4b0b      	ldr	r3, [pc, #44]	; (8007444 <stdio_init+0x54>)
 8007418:	4c0b      	ldr	r4, [pc, #44]	; (8007448 <stdio_init+0x58>)
 800741a:	a801      	add	r0, sp, #4
 800741c:	9501      	str	r5, [sp, #4]
 800741e:	9409      	str	r4, [sp, #36]	; 0x24
 8007420:	910a      	str	r1, [sp, #40]	; 0x28
 8007422:	920c      	str	r2, [sp, #48]	; 0x30
 8007424:	930b      	str	r3, [sp, #44]	; 0x2c
 8007426:	f7ff ffcd 	bl	80073c4 <stdio_register>
 800742a:	2000      	movs	r0, #0
 800742c:	b011      	add	sp, #68	; 0x44
 800742e:	bd30      	pop	{r4, r5, pc}
 8007430:	20003788 	.word	0x20003788
 8007434:	0800dd98 	.word	0x0800dd98
 8007438:	80000003 	.word	0x80000003
 800743c:	08002e79 	.word	0x08002e79
 8007440:	08002e41 	.word	0x08002e41
 8007444:	08002e95 	.word	0x08002e95
 8007448:	08002e55 	.word	0x08002e55

0800744c <CYGACC_COMM_IF_GETC_TIMEOUT>:
 800744c:	b538      	push	{r3, r4, r5, lr}
 800744e:	460d      	mov	r5, r1
 8007450:	4c0a      	ldr	r4, [pc, #40]	; (800747c <CYGACC_COMM_IF_GETC_TIMEOUT+0x30>)
 8007452:	e004      	b.n	800745e <CYGACC_COMM_IF_GETC_TIMEOUT+0x12>
 8007454:	3c01      	subs	r4, #1
 8007456:	d006      	beq.n	8007466 <CYGACC_COMM_IF_GETC_TIMEOUT+0x1a>
 8007458:	2014      	movs	r0, #20
 800745a:	f001 f815 	bl	8008488 <udelay>
 800745e:	f7fd ff57 	bl	8005310 <tstc>
 8007462:	2800      	cmp	r0, #0
 8007464:	d0f6      	beq.n	8007454 <CYGACC_COMM_IF_GETC_TIMEOUT+0x8>
 8007466:	f7fd ff53 	bl	8005310 <tstc>
 800746a:	4603      	mov	r3, r0
 800746c:	b118      	cbz	r0, 8007476 <CYGACC_COMM_IF_GETC_TIMEOUT+0x2a>
 800746e:	f7fd ff43 	bl	80052f8 <getc>
 8007472:	2301      	movs	r3, #1
 8007474:	7028      	strb	r0, [r5, #0]
 8007476:	4618      	mov	r0, r3
 8007478:	bd38      	pop	{r3, r4, r5, pc}
 800747a:	bf00      	nop
 800747c:	000186a1 	.word	0x000186a1

08007480 <xyzModem_get_hdr>:
 8007480:	e92d 42f0 	stmdb	sp!, {r4, r5, r6, r7, r9, lr}
 8007484:	4c8a      	ldr	r4, [pc, #552]	; (80076b0 <xyzModem_get_hdr+0x230>)
 8007486:	b082      	sub	sp, #8
 8007488:	f8d4 3430 	ldr.w	r3, [r4, #1072]	; 0x430
 800748c:	2b00      	cmp	r3, #0
 800748e:	f040 80aa 	bne.w	80075e6 <xyzModem_get_hdr+0x166>
 8007492:	2500      	movs	r5, #0
 8007494:	462e      	mov	r6, r5
 8007496:	6823      	ldr	r3, [r4, #0]
 8007498:	f10d 0106 	add.w	r1, sp, #6
 800749c:	f993 0000 	ldrsb.w	r0, [r3]
 80074a0:	f7ff ffd4 	bl	800744c <CYGACC_COMM_IF_GETC_TIMEOUT>
 80074a4:	2800      	cmp	r0, #0
 80074a6:	f000 808c 	beq.w	80075c2 <xyzModem_get_hdr+0x142>
 80074aa:	f99d 3006 	ldrsb.w	r3, [sp, #6]
 80074ae:	3501      	adds	r5, #1
 80074b0:	3b01      	subs	r3, #1
 80074b2:	2b17      	cmp	r3, #23
 80074b4:	d8ef      	bhi.n	8007496 <xyzModem_get_hdr+0x16>
 80074b6:	a201      	add	r2, pc, #4	; (adr r2, 80074bc <xyzModem_get_hdr+0x3c>)
 80074b8:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
 80074bc:	080075b7 	.word	0x080075b7
 80074c0:	08007543 	.word	0x08007543
 80074c4:	08007497 	.word	0x08007497
 80074c8:	08007533 	.word	0x08007533
 80074cc:	08007497 	.word	0x08007497
 80074d0:	08007497 	.word	0x08007497
 80074d4:	08007497 	.word	0x08007497
 80074d8:	08007497 	.word	0x08007497
 80074dc:	08007497 	.word	0x08007497
 80074e0:	08007497 	.word	0x08007497
 80074e4:	08007497 	.word	0x08007497
 80074e8:	08007497 	.word	0x08007497
 80074ec:	08007497 	.word	0x08007497
 80074f0:	08007497 	.word	0x08007497
 80074f4:	08007497 	.word	0x08007497
 80074f8:	08007497 	.word	0x08007497
 80074fc:	08007497 	.word	0x08007497
 8007500:	08007497 	.word	0x08007497
 8007504:	08007497 	.word	0x08007497
 8007508:	08007497 	.word	0x08007497
 800750c:	08007497 	.word	0x08007497
 8007510:	08007497 	.word	0x08007497
 8007514:	08007497 	.word	0x08007497
 8007518:	0800751d 	.word	0x0800751d
 800751c:	f8d4 3424 	ldr.w	r3, [r4, #1060]	; 0x424
 8007520:	3601      	adds	r6, #1
 8007522:	3301      	adds	r3, #1
 8007524:	2e03      	cmp	r6, #3
 8007526:	f8c4 3424 	str.w	r3, [r4, #1060]	; 0x424
 800752a:	d1b4      	bne.n	8007496 <xyzModem_get_hdr+0x16>
 800752c:	f06f 0004 	mvn.w	r0, #4
 8007530:	e03e      	b.n	80075b0 <xyzModem_get_hdr+0x130>
 8007532:	2d01      	cmp	r5, #1
 8007534:	d1af      	bne.n	8007496 <xyzModem_get_hdr+0x16>
 8007536:	2006      	movs	r0, #6
 8007538:	f7fd fef6 	bl	8005328 <putc>
 800753c:	f06f 0003 	mvn.w	r0, #3
 8007540:	e036      	b.n	80075b0 <xyzModem_get_hdr+0x130>
 8007542:	f8d4 3420 	ldr.w	r3, [r4, #1056]	; 0x420
 8007546:	3301      	adds	r3, #1
 8007548:	f8c4 3420 	str.w	r3, [r4, #1056]	; 0x420
 800754c:	6823      	ldr	r3, [r4, #0]
 800754e:	4959      	ldr	r1, [pc, #356]	; (80076b4 <xyzModem_get_hdr+0x234>)
 8007550:	f993 0000 	ldrsb.w	r0, [r3]
 8007554:	f7ff ff7a 	bl	800744c <CYGACC_COMM_IF_GETC_TIMEOUT>
 8007558:	b340      	cbz	r0, 80075ac <xyzModem_get_hdr+0x12c>
 800755a:	6823      	ldr	r3, [r4, #0]
 800755c:	4956      	ldr	r1, [pc, #344]	; (80076b8 <xyzModem_get_hdr+0x238>)
 800755e:	f993 0000 	ldrsb.w	r0, [r3]
 8007562:	f7ff ff73 	bl	800744c <CYGACC_COMM_IF_GETC_TIMEOUT>
 8007566:	b308      	cbz	r0, 80075ac <xyzModem_get_hdr+0x12c>
 8007568:	f99d 3006 	ldrsb.w	r3, [sp, #6]
 800756c:	2b01      	cmp	r3, #1
 800756e:	d069      	beq.n	8007644 <xyzModem_get_hdr+0x1c4>
 8007570:	f44f 6380 	mov.w	r3, #1024	; 0x400
 8007574:	f8df 9154 	ldr.w	r9, [pc, #340]	; 80076cc <xyzModem_get_hdr+0x24c>
 8007578:	f8c4 3410 	str.w	r3, [r4, #1040]	; 0x410
 800757c:	f8c4 9404 	str.w	r9, [r4, #1028]	; 0x404
 8007580:	4d4e      	ldr	r5, [pc, #312]	; (80076bc <xyzModem_get_hdr+0x23c>)
 8007582:	2600      	movs	r6, #0
 8007584:	462f      	mov	r7, r5
 8007586:	e007      	b.n	8007598 <xyzModem_get_hdr+0x118>
 8007588:	f89d 3006 	ldrb.w	r3, [sp, #6]
 800758c:	f807 3f01 	strb.w	r3, [r7, #1]!
 8007590:	f8d4 3410 	ldr.w	r3, [r4, #1040]	; 0x410
 8007594:	42b3      	cmp	r3, r6
 8007596:	dd2d      	ble.n	80075f4 <xyzModem_get_hdr+0x174>
 8007598:	6823      	ldr	r3, [r4, #0]
 800759a:	f10d 0106 	add.w	r1, sp, #6
 800759e:	f993 0000 	ldrsb.w	r0, [r3]
 80075a2:	f7ff ff53 	bl	800744c <CYGACC_COMM_IF_GETC_TIMEOUT>
 80075a6:	3601      	adds	r6, #1
 80075a8:	2800      	cmp	r0, #0
 80075aa:	d1ed      	bne.n	8007588 <xyzModem_get_hdr+0x108>
 80075ac:	f06f 0002 	mvn.w	r0, #2
 80075b0:	b002      	add	sp, #8
 80075b2:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 80075b6:	f8d4 341c 	ldr.w	r3, [r4, #1052]	; 0x41c
 80075ba:	3301      	adds	r3, #1
 80075bc:	f8c4 341c 	str.w	r3, [r4, #1052]	; 0x41c
 80075c0:	e7c4      	b.n	800754c <xyzModem_get_hdr+0xcc>
 80075c2:	f10d 0507 	add.w	r5, sp, #7
 80075c6:	6823      	ldr	r3, [r4, #0]
 80075c8:	4629      	mov	r1, r5
 80075ca:	f993 0000 	ldrsb.w	r0, [r3]
 80075ce:	f7ff ff3d 	bl	800744c <CYGACC_COMM_IF_GETC_TIMEOUT>
 80075d2:	2800      	cmp	r0, #0
 80075d4:	d1f7      	bne.n	80075c6 <xyzModem_get_hdr+0x146>
 80075d6:	483a      	ldr	r0, [pc, #232]	; (80076c0 <xyzModem_get_hdr+0x240>)
 80075d8:	f000 ff56 	bl	8008488 <udelay>
 80075dc:	f06f 0002 	mvn.w	r0, #2
 80075e0:	b002      	add	sp, #8
 80075e2:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 80075e6:	2006      	movs	r0, #6
 80075e8:	f7fd fe9e 	bl	8005328 <putc>
 80075ec:	2300      	movs	r3, #0
 80075ee:	f8c4 3430 	str.w	r3, [r4, #1072]	; 0x430
 80075f2:	e74e      	b.n	8007492 <xyzModem_get_hdr+0x12>
 80075f4:	6823      	ldr	r3, [r4, #0]
 80075f6:	4933      	ldr	r1, [pc, #204]	; (80076c4 <xyzModem_get_hdr+0x244>)
 80075f8:	f993 0000 	ldrsb.w	r0, [r3]
 80075fc:	f7ff ff26 	bl	800744c <CYGACC_COMM_IF_GETC_TIMEOUT>
 8007600:	2800      	cmp	r0, #0
 8007602:	d0d3      	beq.n	80075ac <xyzModem_get_hdr+0x12c>
 8007604:	f8d4 3428 	ldr.w	r3, [r4, #1064]	; 0x428
 8007608:	bb23      	cbnz	r3, 8007654 <xyzModem_get_hdr+0x1d4>
 800760a:	f894 3409 	ldrb.w	r3, [r4, #1033]	; 0x409
 800760e:	f894 2408 	ldrb.w	r2, [r4, #1032]	; 0x408
 8007612:	4053      	eors	r3, r2
 8007614:	2bff      	cmp	r3, #255	; 0xff
 8007616:	d13e      	bne.n	8007696 <xyzModem_get_hdr+0x216>
 8007618:	f8d4 2410 	ldr.w	r2, [r4, #1040]	; 0x410
 800761c:	2300      	movs	r3, #0
 800761e:	2a00      	cmp	r2, #0
 8007620:	dd08      	ble.n	8007634 <xyzModem_get_hdr+0x1b4>
 8007622:	3203      	adds	r2, #3
 8007624:	18a1      	adds	r1, r4, r2
 8007626:	f815 2f01 	ldrb.w	r2, [r5, #1]!
 800762a:	4413      	add	r3, r2
 800762c:	42a9      	cmp	r1, r5
 800762e:	b29b      	uxth	r3, r3
 8007630:	d1f9      	bne.n	8007626 <xyzModem_get_hdr+0x1a6>
 8007632:	b2db      	uxtb	r3, r3
 8007634:	f894 240a 	ldrb.w	r2, [r4, #1034]	; 0x40a
 8007638:	4293      	cmp	r3, r2
 800763a:	d129      	bne.n	8007690 <xyzModem_get_hdr+0x210>
 800763c:	2000      	movs	r0, #0
 800763e:	b002      	add	sp, #8
 8007640:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 8007644:	2380      	movs	r3, #128	; 0x80
 8007646:	f8df 9084 	ldr.w	r9, [pc, #132]	; 80076cc <xyzModem_get_hdr+0x24c>
 800764a:	f8c4 3410 	str.w	r3, [r4, #1040]	; 0x410
 800764e:	f8c4 9404 	str.w	r9, [r4, #1028]	; 0x404
 8007652:	e795      	b.n	8007580 <xyzModem_get_hdr+0x100>
 8007654:	6823      	ldr	r3, [r4, #0]
 8007656:	491c      	ldr	r1, [pc, #112]	; (80076c8 <xyzModem_get_hdr+0x248>)
 8007658:	f993 0000 	ldrsb.w	r0, [r3]
 800765c:	f7ff fef6 	bl	800744c <CYGACC_COMM_IF_GETC_TIMEOUT>
 8007660:	2800      	cmp	r0, #0
 8007662:	d0a3      	beq.n	80075ac <xyzModem_get_hdr+0x12c>
 8007664:	f894 3408 	ldrb.w	r3, [r4, #1032]	; 0x408
 8007668:	f894 2409 	ldrb.w	r2, [r4, #1033]	; 0x409
 800766c:	4053      	eors	r3, r2
 800766e:	2bff      	cmp	r3, #255	; 0xff
 8007670:	d111      	bne.n	8007696 <xyzModem_get_hdr+0x216>
 8007672:	f8d4 3428 	ldr.w	r3, [r4, #1064]	; 0x428
 8007676:	2b00      	cmp	r3, #0
 8007678:	d0ce      	beq.n	8007618 <xyzModem_get_hdr+0x198>
 800767a:	4648      	mov	r0, r9
 800767c:	f8d4 1410 	ldr.w	r1, [r4, #1040]	; 0x410
 8007680:	f000 fb1a 	bl	8007cb8 <cyg_crc16>
 8007684:	f8b4 340a 	ldrh.w	r3, [r4, #1034]	; 0x40a
 8007688:	ba5b      	rev16	r3, r3
 800768a:	b29b      	uxth	r3, r3
 800768c:	4283      	cmp	r3, r0
 800768e:	d0d5      	beq.n	800763c <xyzModem_get_hdr+0x1bc>
 8007690:	f06f 0006 	mvn.w	r0, #6
 8007694:	e78c      	b.n	80075b0 <xyzModem_get_hdr+0x130>
 8007696:	f10d 0507 	add.w	r5, sp, #7
 800769a:	6823      	ldr	r3, [r4, #0]
 800769c:	4629      	mov	r1, r5
 800769e:	f993 0000 	ldrsb.w	r0, [r3]
 80076a2:	f7ff fed3 	bl	800744c <CYGACC_COMM_IF_GETC_TIMEOUT>
 80076a6:	2800      	cmp	r0, #0
 80076a8:	d1f7      	bne.n	800769a <xyzModem_get_hdr+0x21a>
 80076aa:	f06f 0005 	mvn.w	r0, #5
 80076ae:	e77f      	b.n	80075b0 <xyzModem_get_hdr+0x130>
 80076b0:	200037d0 	.word	0x200037d0
 80076b4:	20003bd8 	.word	0x20003bd8
 80076b8:	20003bd9 	.word	0x20003bd9
 80076bc:	200037d3 	.word	0x200037d3
 80076c0:	0003d090 	.word	0x0003d090
 80076c4:	20003bda 	.word	0x20003bda
 80076c8:	20003bdb 	.word	0x20003bdb
 80076cc:	200037d4 	.word	0x200037d4

080076d0 <CYGACC_COMM_IF_PUTC>:
 80076d0:	4608      	mov	r0, r1
 80076d2:	f7fd be29 	b.w	8005328 <putc>
 80076d6:	bf00      	nop

080076d8 <parse_num>:
 80076d8:	b5f0      	push	{r4, r5, r6, r7, lr}
 80076da:	f990 4000 	ldrsb.w	r4, [r0]
 80076de:	2c20      	cmp	r4, #32
 80076e0:	d103      	bne.n	80076ea <parse_num+0x12>
 80076e2:	f910 4f01 	ldrsb.w	r4, [r0, #1]!
 80076e6:	2c20      	cmp	r4, #32
 80076e8:	d0fb      	beq.n	80076e2 <parse_num+0xa>
 80076ea:	4627      	mov	r7, r4
 80076ec:	b394      	cbz	r4, 8007754 <parse_num+0x7c>
 80076ee:	2c30      	cmp	r4, #48	; 0x30
 80076f0:	d03e      	beq.n	8007770 <parse_num+0x98>
 80076f2:	f04f 0c0a 	mov.w	ip, #10
 80076f6:	2700      	movs	r7, #0
 80076f8:	1c46      	adds	r6, r0, #1
 80076fa:	b2e5      	uxtb	r5, r4
 80076fc:	f1a5 0e30 	sub.w	lr, r5, #48	; 0x30
 8007700:	f1be 0f09 	cmp.w	lr, #9
 8007704:	4630      	mov	r0, r6
 8007706:	d92a      	bls.n	800775e <parse_num+0x86>
 8007708:	f025 0e20 	bic.w	lr, r5, #32
 800770c:	f1ae 0e41 	sub.w	lr, lr, #65	; 0x41
 8007710:	f1be 0f05 	cmp.w	lr, #5
 8007714:	d90f      	bls.n	8007736 <parse_num+0x5e>
 8007716:	2b00      	cmp	r3, #0
 8007718:	d040      	beq.n	800779c <parse_num+0xc4>
 800771a:	f993 5000 	ldrsb.w	r5, [r3]
 800771e:	b145      	cbz	r5, 8007732 <parse_num+0x5a>
 8007720:	42ac      	cmp	r4, r5
 8007722:	d102      	bne.n	800772a <parse_num+0x52>
 8007724:	e016      	b.n	8007754 <parse_num+0x7c>
 8007726:	42a5      	cmp	r5, r4
 8007728:	d014      	beq.n	8007754 <parse_num+0x7c>
 800772a:	f913 5f01 	ldrsb.w	r5, [r3, #1]!
 800772e:	2d00      	cmp	r5, #0
 8007730:	d1f9      	bne.n	8007726 <parse_num+0x4e>
 8007732:	4628      	mov	r0, r5
 8007734:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8007736:	f1a5 0e61 	sub.w	lr, r5, #97	; 0x61
 800773a:	f1be 0f05 	cmp.w	lr, #5
 800773e:	d811      	bhi.n	8007764 <parse_num+0x8c>
 8007740:	f1a4 0557 	sub.w	r5, r4, #87	; 0x57
 8007744:	45ac      	cmp	ip, r5
 8007746:	dde6      	ble.n	8007716 <parse_num+0x3e>
 8007748:	f916 4b01 	ldrsb.w	r4, [r6], #1
 800774c:	fb07 570c 	mla	r7, r7, ip, r5
 8007750:	2c00      	cmp	r4, #0
 8007752:	d1d2      	bne.n	80076fa <parse_num+0x22>
 8007754:	600f      	str	r7, [r1, #0]
 8007756:	b1fa      	cbz	r2, 8007798 <parse_num+0xc0>
 8007758:	6010      	str	r0, [r2, #0]
 800775a:	2001      	movs	r0, #1
 800775c:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800775e:	f1a4 0530 	sub.w	r5, r4, #48	; 0x30
 8007762:	e7f1      	b.n	8007748 <parse_num+0x70>
 8007764:	3d41      	subs	r5, #65	; 0x41
 8007766:	2d05      	cmp	r5, #5
 8007768:	d814      	bhi.n	8007794 <parse_num+0xbc>
 800776a:	f1a4 0537 	sub.w	r5, r4, #55	; 0x37
 800776e:	e7e9      	b.n	8007744 <parse_num+0x6c>
 8007770:	f990 5001 	ldrsb.w	r5, [r0, #1]
 8007774:	b2ee      	uxtb	r6, r5
 8007776:	f1a6 0741 	sub.w	r7, r6, #65	; 0x41
 800777a:	2f19      	cmp	r7, #25
 800777c:	bf9c      	itt	ls
 800777e:	f106 0520 	addls.w	r5, r6, #32
 8007782:	b26d      	sxtbls	r5, r5
 8007784:	2d78      	cmp	r5, #120	; 0x78
 8007786:	d1b4      	bne.n	80076f2 <parse_num+0x1a>
 8007788:	f990 4002 	ldrsb.w	r4, [r0, #2]
 800778c:	f04f 0c10 	mov.w	ip, #16
 8007790:	3002      	adds	r0, #2
 8007792:	e7b0      	b.n	80076f6 <parse_num+0x1e>
 8007794:	2500      	movs	r5, #0
 8007796:	e7d7      	b.n	8007748 <parse_num+0x70>
 8007798:	2001      	movs	r0, #1
 800779a:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800779c:	4618      	mov	r0, r3
 800779e:	bdf0      	pop	{r4, r5, r6, r7, pc}

080077a0 <xyzModem_stream_open>:
 80077a0:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 80077a4:	2400      	movs	r4, #0
 80077a6:	2201      	movs	r2, #1
 80077a8:	b082      	sub	sp, #8
 80077aa:	6846      	ldr	r6, [r0, #4]
 80077ac:	4d3a      	ldr	r5, [pc, #232]	; (8007898 <xyzModem_stream_open+0xf8>)
 80077ae:	ab02      	add	r3, sp, #8
 80077b0:	f843 4d04 	str.w	r4, [r3, #-4]!
 80077b4:	2043      	movs	r0, #67	; 0x43
 80077b6:	602b      	str	r3, [r5, #0]
 80077b8:	468a      	mov	sl, r1
 80077ba:	f8c5 6414 	str.w	r6, [r5, #1044]	; 0x414
 80077be:	f8c5 2428 	str.w	r2, [r5, #1064]	; 0x428
 80077c2:	f8c5 4410 	str.w	r4, [r5, #1040]	; 0x410
 80077c6:	f8c5 442c 	str.w	r4, [r5, #1068]	; 0x42c
 80077ca:	f8c5 4430 	str.w	r4, [r5, #1072]	; 0x430
 80077ce:	f8c5 4418 	str.w	r4, [r5, #1048]	; 0x418
 80077d2:	f8c5 441c 	str.w	r4, [r5, #1052]	; 0x41c
 80077d6:	f8c5 4420 	str.w	r4, [r5, #1056]	; 0x420
 80077da:	f8c5 4424 	str.w	r4, [r5, #1060]	; 0x424
 80077de:	f8c5 4438 	str.w	r4, [r5, #1080]	; 0x438
 80077e2:	f8c5 4434 	str.w	r4, [r5, #1076]	; 0x434
 80077e6:	f7fd fd9f 	bl	8005328 <putc>
 80077ea:	f8d5 3414 	ldr.w	r3, [r5, #1044]	; 0x414
 80077ee:	2b01      	cmp	r3, #1
 80077f0:	d04c      	beq.n	800788c <xyzModem_stream_open+0xec>
 80077f2:	46a3      	mov	fp, r4
 80077f4:	2614      	movs	r6, #20
 80077f6:	270a      	movs	r7, #10
 80077f8:	f8df 90a8 	ldr.w	r9, [pc, #168]	; 80078a4 <xyzModem_stream_open+0x104>
 80077fc:	e003      	b.n	8007806 <xyzModem_stream_open+0x66>
 80077fe:	1d43      	adds	r3, r0, #5
 8007800:	d01f      	beq.n	8007842 <xyzModem_stream_open+0xa2>
 8007802:	3e01      	subs	r6, #1
 8007804:	d01d      	beq.n	8007842 <xyzModem_stream_open+0xa2>
 8007806:	f7ff fe3b 	bl	8007480 <xyzModem_get_hdr>
 800780a:	4604      	mov	r4, r0
 800780c:	b308      	cbz	r0, 8007852 <xyzModem_stream_open+0xb2>
 800780e:	1cc2      	adds	r2, r0, #3
 8007810:	d1f5      	bne.n	80077fe <xyzModem_stream_open+0x5e>
 8007812:	3f01      	subs	r7, #1
 8007814:	4648      	mov	r0, r9
 8007816:	2f00      	cmp	r7, #0
 8007818:	bfd8      	it	le
 800781a:	f8c5 b428 	strle.w	fp, [r5, #1064]	; 0x428
 800781e:	f000 fe33 	bl	8008488 <udelay>
 8007822:	f8d5 3428 	ldr.w	r3, [r5, #1064]	; 0x428
 8007826:	2b00      	cmp	r3, #0
 8007828:	bf0c      	ite	eq
 800782a:	2015      	moveq	r0, #21
 800782c:	2043      	movne	r0, #67	; 0x43
 800782e:	f7fd fd7b 	bl	8005328 <putc>
 8007832:	f8d5 3418 	ldr.w	r3, [r5, #1048]	; 0x418
 8007836:	3e01      	subs	r6, #1
 8007838:	f103 0301 	add.w	r3, r3, #1
 800783c:	f8c5 3418 	str.w	r3, [r5, #1048]	; 0x418
 8007840:	d1e1      	bne.n	8007806 <xyzModem_stream_open+0x66>
 8007842:	f8ca 4000 	str.w	r4, [sl]
 8007846:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
 800784a:	4620      	mov	r0, r4
 800784c:	b002      	add	sp, #8
 800784e:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8007852:	f895 3408 	ldrb.w	r3, [r5, #1032]	; 0x408
 8007856:	b97b      	cbnz	r3, 8007878 <xyzModem_stream_open+0xd8>
 8007858:	f8d5 0404 	ldr.w	r0, [r5, #1028]	; 0x404
 800785c:	3001      	adds	r0, #1
 800785e:	f8c5 0404 	str.w	r0, [r5, #1028]	; 0x404
 8007862:	f810 2c01 	ldrb.w	r2, [r0, #-1]
 8007866:	2a00      	cmp	r2, #0
 8007868:	d1f8      	bne.n	800785c <xyzModem_stream_open+0xbc>
 800786a:	4b0c      	ldr	r3, [pc, #48]	; (800789c <xyzModem_stream_open+0xfc>)
 800786c:	490c      	ldr	r1, [pc, #48]	; (80078a0 <xyzModem_stream_open+0x100>)
 800786e:	f7ff ff33 	bl	80076d8 <parse_num>
 8007872:	2301      	movs	r3, #1
 8007874:	f8c5 3430 	str.w	r3, [r5, #1072]	; 0x430
 8007878:	2201      	movs	r2, #1
 800787a:	2300      	movs	r3, #0
 800787c:	4620      	mov	r0, r4
 800787e:	f885 240c 	strb.w	r2, [r5, #1036]	; 0x40c
 8007882:	f8c5 3410 	str.w	r3, [r5, #1040]	; 0x410
 8007886:	b002      	add	sp, #8
 8007888:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 800788c:	4620      	mov	r0, r4
 800788e:	f885 340c 	strb.w	r3, [r5, #1036]	; 0x40c
 8007892:	b002      	add	sp, #8
 8007894:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8007898:	200037d0 	.word	0x200037d0
 800789c:	0800cb38 	.word	0x0800cb38
 80078a0:	20003c04 	.word	0x20003c04
 80078a4:	0007a120 	.word	0x0007a120

080078a8 <xyzModem_stream_read>:
 80078a8:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 80078ac:	4607      	mov	r7, r0
 80078ae:	460e      	mov	r6, r1
 80078b0:	4692      	mov	sl, r2
 80078b2:	f04f 0900 	mov.w	r9, #0
 80078b6:	4c6d      	ldr	r4, [pc, #436]	; (8007a6c <xyzModem_stream_read+0x1c4>)
 80078b8:	f8d4 342c 	ldr.w	r3, [r4, #1068]	; 0x42c
 80078bc:	2b00      	cmp	r3, #0
 80078be:	d13e      	bne.n	800793e <xyzModem_stream_read+0x96>
 80078c0:	2e00      	cmp	r6, #0
 80078c2:	dd3c      	ble.n	800793e <xyzModem_stream_read+0x96>
 80078c4:	f8d4 5410 	ldr.w	r5, [r4, #1040]	; 0x410
 80078c8:	2d00      	cmp	r5, #0
 80078ca:	d158      	bne.n	800797e <xyzModem_stream_read+0xd6>
 80078cc:	2514      	movs	r5, #20
 80078ce:	e01b      	b.n	8007908 <xyzModem_stream_read+0x60>
 80078d0:	f894 140c 	ldrb.w	r1, [r4, #1036]	; 0x40c
 80078d4:	f894 2408 	ldrb.w	r2, [r4, #1032]	; 0x408
 80078d8:	1e4b      	subs	r3, r1, #1
 80078da:	428a      	cmp	r2, r1
 80078dc:	b2db      	uxtb	r3, r3
 80078de:	d031      	beq.n	8007944 <xyzModem_stream_read+0x9c>
 80078e0:	429a      	cmp	r2, r3
 80078e2:	d065      	beq.n	80079b0 <xyzModem_stream_read+0x108>
 80078e4:	f06f 0b07 	mvn.w	fp, #7
 80078e8:	f8d4 3428 	ldr.w	r3, [r4, #1064]	; 0x428
 80078ec:	2b00      	cmp	r3, #0
 80078ee:	bf0c      	ite	eq
 80078f0:	2015      	moveq	r0, #21
 80078f2:	2043      	movne	r0, #67	; 0x43
 80078f4:	f7fd fd18 	bl	8005328 <putc>
 80078f8:	f8d4 3418 	ldr.w	r3, [r4, #1048]	; 0x418
 80078fc:	3d01      	subs	r5, #1
 80078fe:	f103 0301 	add.w	r3, r3, #1
 8007902:	f8c4 3418 	str.w	r3, [r4, #1048]	; 0x418
 8007906:	d058      	beq.n	80079ba <xyzModem_stream_read+0x112>
 8007908:	f7ff fdba 	bl	8007480 <xyzModem_get_hdr>
 800790c:	4683      	mov	fp, r0
 800790e:	2800      	cmp	r0, #0
 8007910:	d0de      	beq.n	80078d0 <xyzModem_stream_read+0x28>
 8007912:	f110 0f05 	cmn.w	r0, #5
 8007916:	d00c      	beq.n	8007932 <xyzModem_stream_read+0x8a>
 8007918:	f110 0f04 	cmn.w	r0, #4
 800791c:	d1e4      	bne.n	80078e8 <xyzModem_stream_read+0x40>
 800791e:	2006      	movs	r0, #6
 8007920:	f7fd fd02 	bl	8005328 <putc>
 8007924:	f8d4 3414 	ldr.w	r3, [r4, #1044]	; 0x414
 8007928:	2b02      	cmp	r3, #2
 800792a:	d06e      	beq.n	8007a0a <xyzModem_stream_read+0x162>
 800792c:	2301      	movs	r3, #1
 800792e:	f8c4 342c 	str.w	r3, [r4, #1068]	; 0x42c
 8007932:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
 8007936:	f8ca b000 	str.w	fp, [sl]
 800793a:	f8c4 3410 	str.w	r3, [r4, #1040]	; 0x410
 800793e:	4648      	mov	r0, r9
 8007940:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8007944:	2301      	movs	r3, #1
 8007946:	441a      	add	r2, r3
 8007948:	f884 240c 	strb.w	r2, [r4, #1036]	; 0x40c
 800794c:	f8d4 2414 	ldr.w	r2, [r4, #1044]	; 0x414
 8007950:	f8c4 3430 	str.w	r3, [r4, #1072]	; 0x430
 8007954:	429a      	cmp	r2, r3
 8007956:	d034      	beq.n	80079c2 <xyzModem_stream_read+0x11a>
 8007958:	f8d4 3434 	ldr.w	r3, [r4, #1076]	; 0x434
 800795c:	2b00      	cmp	r3, #0
 800795e:	d147      	bne.n	80079f0 <xyzModem_stream_read+0x148>
 8007960:	f8d4 5404 	ldr.w	r5, [r4, #1028]	; 0x404
 8007964:	f8d4 3410 	ldr.w	r3, [r4, #1040]	; 0x410
 8007968:	18e9      	adds	r1, r5, r3
 800796a:	f811 0c01 	ldrb.w	r0, [r1, #-1]
 800796e:	281a      	cmp	r0, #26
 8007970:	d077      	beq.n	8007a62 <xyzModem_stream_read+0x1ba>
 8007972:	f8d4 342c 	ldr.w	r3, [r4, #1068]	; 0x42c
 8007976:	2b00      	cmp	r3, #0
 8007978:	d1a0      	bne.n	80078bc <xyzModem_stream_read+0x14>
 800797a:	f8d4 5410 	ldr.w	r5, [r4, #1040]	; 0x410
 800797e:	42b5      	cmp	r5, r6
 8007980:	bfa8      	it	ge
 8007982:	4635      	movge	r5, r6
 8007984:	f8d4 1404 	ldr.w	r1, [r4, #1028]	; 0x404
 8007988:	462a      	mov	r2, r5
 800798a:	4638      	mov	r0, r7
 800798c:	f7f8 fee0 	bl	8000750 <memcpy>
 8007990:	f8d4 2410 	ldr.w	r2, [r4, #1040]	; 0x410
 8007994:	f8d4 3404 	ldr.w	r3, [r4, #1028]	; 0x404
 8007998:	1b51      	subs	r1, r2, r5
 800799a:	195a      	adds	r2, r3, r5
 800799c:	1b76      	subs	r6, r6, r5
 800799e:	f8d4 342c 	ldr.w	r3, [r4, #1068]	; 0x42c
 80079a2:	44a9      	add	r9, r5
 80079a4:	442f      	add	r7, r5
 80079a6:	f8c4 1410 	str.w	r1, [r4, #1040]	; 0x410
 80079aa:	f8c4 2404 	str.w	r2, [r4, #1028]	; 0x404
 80079ae:	e785      	b.n	80078bc <xyzModem_stream_read+0x14>
 80079b0:	2006      	movs	r0, #6
 80079b2:	f7fd fcb9 	bl	8005328 <putc>
 80079b6:	3d01      	subs	r5, #1
 80079b8:	d1a6      	bne.n	8007908 <xyzModem_stream_read+0x60>
 80079ba:	f1bb 0f00 	cmp.w	fp, #0
 80079be:	dad8      	bge.n	8007972 <xyzModem_stream_read+0xca>
 80079c0:	e7b7      	b.n	8007932 <xyzModem_stream_read+0x8a>
 80079c2:	f8d4 5404 	ldr.w	r5, [r4, #1028]	; 0x404
 80079c6:	f8d4 3410 	ldr.w	r3, [r4, #1040]	; 0x410
 80079ca:	18e9      	adds	r1, r5, r3
 80079cc:	f811 0c01 	ldrb.w	r0, [r1, #-1]
 80079d0:	281a      	cmp	r0, #26
 80079d2:	d1ce      	bne.n	8007972 <xyzModem_stream_read+0xca>
 80079d4:	f811 0c02 	ldrb.w	r0, [r1, #-2]
 80079d8:	281a      	cmp	r0, #26
 80079da:	d1ca      	bne.n	8007972 <xyzModem_stream_read+0xca>
 80079dc:	f811 1c03 	ldrb.w	r1, [r1, #-3]
 80079e0:	291a      	cmp	r1, #26
 80079e2:	d02f      	beq.n	8007a44 <xyzModem_stream_read+0x19c>
 80079e4:	2a01      	cmp	r2, #1
 80079e6:	d0c4      	beq.n	8007972 <xyzModem_stream_read+0xca>
 80079e8:	f8d4 3434 	ldr.w	r3, [r4, #1076]	; 0x434
 80079ec:	2b00      	cmp	r3, #0
 80079ee:	d0c0      	beq.n	8007972 <xyzModem_stream_read+0xca>
 80079f0:	f8d4 1438 	ldr.w	r1, [r4, #1080]	; 0x438
 80079f4:	f8d4 2410 	ldr.w	r2, [r4, #1040]	; 0x410
 80079f8:	440a      	add	r2, r1
 80079fa:	429a      	cmp	r2, r3
 80079fc:	f8c4 2438 	str.w	r2, [r4, #1080]	; 0x438
 8007a00:	d9b7      	bls.n	8007972 <xyzModem_stream_read+0xca>
 8007a02:	1a5b      	subs	r3, r3, r1
 8007a04:	f8c4 3410 	str.w	r3, [r4, #1040]	; 0x410
 8007a08:	e7b3      	b.n	8007972 <xyzModem_stream_read+0xca>
 8007a0a:	f8d4 3428 	ldr.w	r3, [r4, #1064]	; 0x428
 8007a0e:	2b00      	cmp	r3, #0
 8007a10:	bf0c      	ite	eq
 8007a12:	2015      	moveq	r0, #21
 8007a14:	2043      	movne	r0, #67	; 0x43
 8007a16:	f7fd fc87 	bl	8005328 <putc>
 8007a1a:	f8d4 3418 	ldr.w	r3, [r4, #1048]	; 0x418
 8007a1e:	3301      	adds	r3, #1
 8007a20:	f8c4 3418 	str.w	r3, [r4, #1048]	; 0x418
 8007a24:	f7ff fd2c 	bl	8007480 <xyzModem_get_hdr>
 8007a28:	4683      	mov	fp, r0
 8007a2a:	2006      	movs	r0, #6
 8007a2c:	f7fd fc7c 	bl	8005328 <putc>
 8007a30:	2301      	movs	r3, #1
 8007a32:	f1bb 0f00 	cmp.w	fp, #0
 8007a36:	f8c4 342c 	str.w	r3, [r4, #1068]	; 0x42c
 8007a3a:	f6ff af7a 	blt.w	8007932 <xyzModem_stream_read+0x8a>
 8007a3e:	4648      	mov	r0, r9
 8007a40:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8007a44:	2b00      	cmp	r3, #0
 8007a46:	d0cd      	beq.n	80079e4 <xyzModem_stream_read+0x13c>
 8007a48:	3b01      	subs	r3, #1
 8007a4a:	441d      	add	r5, r3
 8007a4c:	e004      	b.n	8007a58 <xyzModem_stream_read+0x1b0>
 8007a4e:	f815 1d01 	ldrb.w	r1, [r5, #-1]!
 8007a52:	3b01      	subs	r3, #1
 8007a54:	291a      	cmp	r1, #26
 8007a56:	d1c5      	bne.n	80079e4 <xyzModem_stream_read+0x13c>
 8007a58:	f8c4 3410 	str.w	r3, [r4, #1040]	; 0x410
 8007a5c:	2b00      	cmp	r3, #0
 8007a5e:	d1f6      	bne.n	8007a4e <xyzModem_stream_read+0x1a6>
 8007a60:	e7c0      	b.n	80079e4 <xyzModem_stream_read+0x13c>
 8007a62:	f811 0c02 	ldrb.w	r0, [r1, #-2]
 8007a66:	281a      	cmp	r0, #26
 8007a68:	d1be      	bne.n	80079e8 <xyzModem_stream_read+0x140>
 8007a6a:	e7b7      	b.n	80079dc <xyzModem_stream_read+0x134>
 8007a6c:	200037d0 	.word	0x200037d0

08007a70 <xyzModem_stream_close>:
 8007a70:	b570      	push	{r4, r5, r6, lr}
 8007a72:	480c      	ldr	r0, [pc, #48]	; (8007aa4 <xyzModem_stream_close+0x34>)
 8007a74:	4d0c      	ldr	r5, [pc, #48]	; (8007aa8 <xyzModem_stream_close+0x38>)
 8007a76:	f8d0 6428 	ldr.w	r6, [r0, #1064]	; 0x428
 8007a7a:	f8d0 3420 	ldr.w	r3, [r0, #1056]	; 0x420
 8007a7e:	f8d0 241c 	ldr.w	r2, [r0, #1052]	; 0x41c
 8007a82:	f8d0 4418 	ldr.w	r4, [r0, #1048]	; 0x418
 8007a86:	4909      	ldr	r1, [pc, #36]	; (8007aac <xyzModem_stream_close+0x3c>)
 8007a88:	f8d0 0424 	ldr.w	r0, [r0, #1060]	; 0x424
 8007a8c:	b082      	sub	sp, #8
 8007a8e:	e88d 0011 	stmia.w	sp, {r0, r4}
 8007a92:	2e00      	cmp	r6, #0
 8007a94:	bf08      	it	eq
 8007a96:	4629      	moveq	r1, r5
 8007a98:	4805      	ldr	r0, [pc, #20]	; (8007ab0 <xyzModem_stream_close+0x40>)
 8007a9a:	f7fd fc5d 	bl	8005358 <printf>
 8007a9e:	b002      	add	sp, #8
 8007aa0:	bd70      	pop	{r4, r5, r6, pc}
 8007aa2:	bf00      	nop
 8007aa4:	200037d0 	.word	0x200037d0
 8007aa8:	0800e414 	.word	0x0800e414
 8007aac:	0800e410 	.word	0x0800e410
 8007ab0:	0800e41c 	.word	0x0800e41c

08007ab4 <xyzModem_stream_terminate>:
 8007ab4:	b510      	push	{r4, lr}
 8007ab6:	b082      	sub	sp, #8
 8007ab8:	b138      	cbz	r0, 8007aca <xyzModem_stream_terminate+0x16>
 8007aba:	4c1b      	ldr	r4, [pc, #108]	; (8007b28 <xyzModem_stream_terminate+0x74>)
 8007abc:	f8d4 3414 	ldr.w	r3, [r4, #1044]	; 0x414
 8007ac0:	3b01      	subs	r3, #1
 8007ac2:	2b01      	cmp	r3, #1
 8007ac4:	d90a      	bls.n	8007adc <xyzModem_stream_terminate+0x28>
 8007ac6:	b002      	add	sp, #8
 8007ac8:	bd10      	pop	{r4, pc}
 8007aca:	460c      	mov	r4, r1
 8007acc:	47a0      	blx	r4
 8007ace:	2800      	cmp	r0, #0
 8007ad0:	dafc      	bge.n	8007acc <xyzModem_stream_terminate+0x18>
 8007ad2:	4816      	ldr	r0, [pc, #88]	; (8007b2c <xyzModem_stream_terminate+0x78>)
 8007ad4:	f000 fcd8 	bl	8008488 <udelay>
 8007ad8:	b002      	add	sp, #8
 8007ada:	bd10      	pop	{r4, pc}
 8007adc:	2018      	movs	r0, #24
 8007ade:	f7fd fc23 	bl	8005328 <putc>
 8007ae2:	2018      	movs	r0, #24
 8007ae4:	f7fd fc20 	bl	8005328 <putc>
 8007ae8:	2018      	movs	r0, #24
 8007aea:	f7fd fc1d 	bl	8005328 <putc>
 8007aee:	2018      	movs	r0, #24
 8007af0:	f7fd fc1a 	bl	8005328 <putc>
 8007af4:	2008      	movs	r0, #8
 8007af6:	f7fd fc17 	bl	8005328 <putc>
 8007afa:	2008      	movs	r0, #8
 8007afc:	f7fd fc14 	bl	8005328 <putc>
 8007b00:	2008      	movs	r0, #8
 8007b02:	f7fd fc11 	bl	8005328 <putc>
 8007b06:	2008      	movs	r0, #8
 8007b08:	f7fd fc0e 	bl	8005328 <putc>
 8007b0c:	6823      	ldr	r3, [r4, #0]
 8007b0e:	f10d 0107 	add.w	r1, sp, #7
 8007b12:	f993 0000 	ldrsb.w	r0, [r3]
 8007b16:	f7ff fc99 	bl	800744c <CYGACC_COMM_IF_GETC_TIMEOUT>
 8007b1a:	2800      	cmp	r0, #0
 8007b1c:	d1f6      	bne.n	8007b0c <xyzModem_stream_terminate+0x58>
 8007b1e:	2301      	movs	r3, #1
 8007b20:	f8c4 342c 	str.w	r3, [r4, #1068]	; 0x42c
 8007b24:	b002      	add	sp, #8
 8007b26:	bd10      	pop	{r4, pc}
 8007b28:	200037d0 	.word	0x200037d0
 8007b2c:	0003d090 	.word	0x0003d090

08007b30 <xyzModem_error>:
 8007b30:	3008      	adds	r0, #8
 8007b32:	2807      	cmp	r0, #7
 8007b34:	bf9a      	itte	ls
 8007b36:	4b02      	ldrls	r3, [pc, #8]	; (8007b40 <xyzModem_error+0x10>)
 8007b38:	f853 0020 	ldrls.w	r0, [r3, r0, lsl #2]
 8007b3c:	4801      	ldrhi	r0, [pc, #4]	; (8007b44 <xyzModem_error+0x14>)
 8007b3e:	4770      	bx	lr
 8007b40:	0800e3f0 	.word	0x0800e3f0
 8007b44:	0800e460 	.word	0x0800e460

08007b48 <my_delay>:
 8007b48:	2100      	movs	r1, #0
 8007b4a:	b410      	push	{r4}
 8007b4c:	2800      	cmp	r0, #0
 8007b4e:	b083      	sub	sp, #12
 8007b50:	9100      	str	r1, [sp, #0]
 8007b52:	9101      	str	r1, [sp, #4]
 8007b54:	dd0e      	ble.n	8007b74 <my_delay+0x2c>
 8007b56:	460c      	mov	r4, r1
 8007b58:	4a08      	ldr	r2, [pc, #32]	; (8007b7c <my_delay+0x34>)
 8007b5a:	9401      	str	r4, [sp, #4]
 8007b5c:	9b01      	ldr	r3, [sp, #4]
 8007b5e:	4293      	cmp	r3, r2
 8007b60:	dc05      	bgt.n	8007b6e <my_delay+0x26>
 8007b62:	9b01      	ldr	r3, [sp, #4]
 8007b64:	3301      	adds	r3, #1
 8007b66:	9301      	str	r3, [sp, #4]
 8007b68:	9b01      	ldr	r3, [sp, #4]
 8007b6a:	4293      	cmp	r3, r2
 8007b6c:	ddf9      	ble.n	8007b62 <my_delay+0x1a>
 8007b6e:	3101      	adds	r1, #1
 8007b70:	4288      	cmp	r0, r1
 8007b72:	d1f2      	bne.n	8007b5a <my_delay+0x12>
 8007b74:	b003      	add	sp, #12
 8007b76:	bc10      	pop	{r4}
 8007b78:	4770      	bx	lr
 8007b7a:	bf00      	nop
 8007b7c:	000f423f 	.word	0x000f423f

08007b80 <led_config>:
 8007b80:	e92d 46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
 8007b84:	4681      	mov	r9, r0
 8007b86:	b085      	sub	sp, #20
 8007b88:	210a      	movs	r1, #10
 8007b8a:	481c      	ldr	r0, [pc, #112]	; (8007bfc <led_config+0x7c>)
 8007b8c:	f003 fce8 	bl	800b560 <stm32f2_gpio_config>
 8007b90:	f1b9 0f00 	cmp.w	r9, #0
 8007b94:	dd2f      	ble.n	8007bf6 <led_config+0x76>
 8007b96:	2600      	movs	r6, #0
 8007b98:	4637      	mov	r7, r6
 8007b9a:	f8df a060 	ldr.w	sl, [pc, #96]	; 8007bfc <led_config+0x7c>
 8007b9e:	4c18      	ldr	r4, [pc, #96]	; (8007c00 <led_config+0x80>)
 8007ba0:	2500      	movs	r5, #0
 8007ba2:	4650      	mov	r0, sl
 8007ba4:	4629      	mov	r1, r5
 8007ba6:	f003 fd95 	bl	800b6d4 <stm32f2_gpout_set>
 8007baa:	9702      	str	r7, [sp, #8]
 8007bac:	9703      	str	r7, [sp, #12]
 8007bae:	9703      	str	r7, [sp, #12]
 8007bb0:	9b03      	ldr	r3, [sp, #12]
 8007bb2:	42a3      	cmp	r3, r4
 8007bb4:	dc05      	bgt.n	8007bc2 <led_config+0x42>
 8007bb6:	9b03      	ldr	r3, [sp, #12]
 8007bb8:	3301      	adds	r3, #1
 8007bba:	9303      	str	r3, [sp, #12]
 8007bbc:	9b03      	ldr	r3, [sp, #12]
 8007bbe:	42a3      	cmp	r3, r4
 8007bc0:	ddf9      	ble.n	8007bb6 <led_config+0x36>
 8007bc2:	3501      	adds	r5, #1
 8007bc4:	45a9      	cmp	r9, r5
 8007bc6:	d1f2      	bne.n	8007bae <led_config+0x2e>
 8007bc8:	2101      	movs	r1, #1
 8007bca:	4650      	mov	r0, sl
 8007bcc:	f003 fd82 	bl	800b6d4 <stm32f2_gpout_set>
 8007bd0:	2100      	movs	r1, #0
 8007bd2:	9700      	str	r7, [sp, #0]
 8007bd4:	9701      	str	r7, [sp, #4]
 8007bd6:	9701      	str	r7, [sp, #4]
 8007bd8:	9b01      	ldr	r3, [sp, #4]
 8007bda:	42a3      	cmp	r3, r4
 8007bdc:	dc05      	bgt.n	8007bea <led_config+0x6a>
 8007bde:	9b01      	ldr	r3, [sp, #4]
 8007be0:	3301      	adds	r3, #1
 8007be2:	9301      	str	r3, [sp, #4]
 8007be4:	9b01      	ldr	r3, [sp, #4]
 8007be6:	42a3      	cmp	r3, r4
 8007be8:	ddf9      	ble.n	8007bde <led_config+0x5e>
 8007bea:	3101      	adds	r1, #1
 8007bec:	42a9      	cmp	r1, r5
 8007bee:	d1f2      	bne.n	8007bd6 <led_config+0x56>
 8007bf0:	3601      	adds	r6, #1
 8007bf2:	428e      	cmp	r6, r1
 8007bf4:	d1d4      	bne.n	8007ba0 <led_config+0x20>
 8007bf6:	b005      	add	sp, #20
 8007bf8:	e8bd 86f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, pc}
 8007bfc:	0800e504 	.word	0x0800e504
 8007c00:	000f423f 	.word	0x000f423f

08007c04 <psram_cre_reset>:
 8007c04:	b510      	push	{r4, lr}
 8007c06:	4c05      	ldr	r4, [pc, #20]	; (8007c1c <psram_cre_reset+0x18>)
 8007c08:	210a      	movs	r1, #10
 8007c0a:	4620      	mov	r0, r4
 8007c0c:	f003 fca8 	bl	800b560 <stm32f2_gpio_config>
 8007c10:	4620      	mov	r0, r4
 8007c12:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8007c16:	2100      	movs	r1, #0
 8007c18:	f003 bd5c 	b.w	800b6d4 <stm32f2_gpout_set>
 8007c1c:	0800e508 	.word	0x0800e508

08007c20 <psram_cre_set>:
 8007c20:	b510      	push	{r4, lr}
 8007c22:	4c05      	ldr	r4, [pc, #20]	; (8007c38 <psram_cre_set+0x18>)
 8007c24:	210a      	movs	r1, #10
 8007c26:	4620      	mov	r0, r4
 8007c28:	f003 fc9a 	bl	800b560 <stm32f2_gpio_config>
 8007c2c:	4620      	mov	r0, r4
 8007c2e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8007c32:	2101      	movs	r1, #1
 8007c34:	f003 bd4e 	b.w	800b6d4 <stm32f2_gpout_set>
 8007c38:	0800e508 	.word	0x0800e508

08007c3c <board_init>:
 8007c3c:	b508      	push	{r3, lr}
 8007c3e:	2002      	movs	r0, #2
 8007c40:	f7ff ff9e 	bl	8007b80 <led_config>
 8007c44:	2000      	movs	r0, #0
 8007c46:	bd08      	pop	{r3, pc}

08007c48 <checkboard>:
 8007c48:	b508      	push	{r3, lr}
 8007c4a:	4903      	ldr	r1, [pc, #12]	; (8007c58 <checkboard+0x10>)
 8007c4c:	4803      	ldr	r0, [pc, #12]	; (8007c5c <checkboard+0x14>)
 8007c4e:	f7fd fb83 	bl	8005358 <printf>
 8007c52:	2000      	movs	r0, #0
 8007c54:	bd08      	pop	{r3, pc}
 8007c56:	bf00      	nop
 8007c58:	0800e50c 	.word	0x0800e50c
 8007c5c:	0800e510 	.word	0x0800e510

08007c60 <dram_init>:
 8007c60:	2001      	movs	r0, #1
 8007c62:	b510      	push	{r4, lr}
 8007c64:	4a0f      	ldr	r2, [pc, #60]	; (8007ca4 <dram_init+0x44>)
 8007c66:	b082      	sub	sp, #8
 8007c68:	6b93      	ldr	r3, [r2, #56]	; 0x38
 8007c6a:	490f      	ldr	r1, [pc, #60]	; (8007ca8 <dram_init+0x48>)
 8007c6c:	4303      	orrs	r3, r0
 8007c6e:	6393      	str	r3, [r2, #56]	; 0x38
 8007c70:	4788      	blx	r1
 8007c72:	4b0e      	ldr	r3, [pc, #56]	; (8007cac <dram_init+0x4c>)
 8007c74:	4a0e      	ldr	r2, [pc, #56]	; (8007cb0 <dram_init+0x50>)
 8007c76:	f245 0159 	movw	r1, #20569	; 0x5059
 8007c7a:	2001      	movs	r0, #1
 8007c7c:	f003 fabe 	bl	800b1fc <fsmc_nor_psram_init>
 8007c80:	b968      	cbnz	r0, 8007c9e <dram_init+0x3e>
 8007c82:	9001      	str	r0, [sp, #4]
 8007c84:	f7ff ffbe 	bl	8007c04 <psram_cre_reset>
 8007c88:	f04f 44c0 	mov.w	r4, #1610612736	; 0x60000000
 8007c8c:	f04f 7280 	mov.w	r2, #16777216	; 0x1000000
 8007c90:	f8d8 1000 	ldr.w	r1, [r8]
 8007c94:	f8d8 3000 	ldr.w	r3, [r8]
 8007c98:	9801      	ldr	r0, [sp, #4]
 8007c9a:	614c      	str	r4, [r1, #20]
 8007c9c:	619a      	str	r2, [r3, #24]
 8007c9e:	b002      	add	sp, #8
 8007ca0:	bd10      	pop	{r4, pc}
 8007ca2:	bf00      	nop
 8007ca4:	40023800 	.word	0x40023800
 8007ca8:	20000b21 	.word	0x20000b21
 8007cac:	20020607 	.word	0x20020607
 8007cb0:	20021605 	.word	0x20021605

08007cb4 <board_eth_init>:
 8007cb4:	f004 b832 	b.w	800bd1c <stm32_eth_init>

08007cb8 <cyg_crc16>:
 8007cb8:	2900      	cmp	r1, #0
 8007cba:	dd11      	ble.n	8007ce0 <cyg_crc16+0x28>
 8007cbc:	2300      	movs	r3, #0
 8007cbe:	b410      	push	{r4}
 8007cc0:	4c09      	ldr	r4, [pc, #36]	; (8007ce8 <cyg_crc16+0x30>)
 8007cc2:	4401      	add	r1, r0
 8007cc4:	f810 2b01 	ldrb.w	r2, [r0], #1
 8007cc8:	ea82 2213 	eor.w	r2, r2, r3, lsr #8
 8007ccc:	f834 2012 	ldrh.w	r2, [r4, r2, lsl #1]
 8007cd0:	4288      	cmp	r0, r1
 8007cd2:	ea82 2303 	eor.w	r3, r2, r3, lsl #8
 8007cd6:	b29b      	uxth	r3, r3
 8007cd8:	d1f4      	bne.n	8007cc4 <cyg_crc16+0xc>
 8007cda:	4618      	mov	r0, r3
 8007cdc:	bc10      	pop	{r4}
 8007cde:	4770      	bx	lr
 8007ce0:	2300      	movs	r3, #0
 8007ce2:	4618      	mov	r0, r3
 8007ce4:	4770      	bx	lr
 8007ce6:	bf00      	nop
 8007ce8:	0800e534 	.word	0x0800e534

08007cec <crc32_no_comp>:
 8007cec:	b430      	push	{r4, r5}
 8007cee:	078c      	lsls	r4, r1, #30
 8007cf0:	d011      	beq.n	8007d16 <crc32_no_comp+0x2a>
 8007cf2:	b172      	cbz	r2, 8007d12 <crc32_no_comp+0x26>
 8007cf4:	4c23      	ldr	r4, [pc, #140]	; (8007d84 <crc32_no_comp+0x98>)
 8007cf6:	e001      	b.n	8007cfc <crc32_no_comp+0x10>
 8007cf8:	078b      	lsls	r3, r1, #30
 8007cfa:	d00c      	beq.n	8007d16 <crc32_no_comp+0x2a>
 8007cfc:	f811 3b01 	ldrb.w	r3, [r1], #1
 8007d00:	3a01      	subs	r2, #1
 8007d02:	ea83 0300 	eor.w	r3, r3, r0
 8007d06:	b2db      	uxtb	r3, r3
 8007d08:	f854 3023 	ldr.w	r3, [r4, r3, lsl #2]
 8007d0c:	ea83 2010 	eor.w	r0, r3, r0, lsr #8
 8007d10:	d1f2      	bne.n	8007cf8 <crc32_no_comp+0xc>
 8007d12:	bc30      	pop	{r4, r5}
 8007d14:	4770      	bx	lr
 8007d16:	f002 0503 	and.w	r5, r2, #3
 8007d1a:	0892      	lsrs	r2, r2, #2
 8007d1c:	f1a1 0304 	sub.w	r3, r1, #4
 8007d20:	d01e      	beq.n	8007d60 <crc32_no_comp+0x74>
 8007d22:	f102 4280 	add.w	r2, r2, #1073741824	; 0x40000000
 8007d26:	3a01      	subs	r2, #1
 8007d28:	4c16      	ldr	r4, [pc, #88]	; (8007d84 <crc32_no_comp+0x98>)
 8007d2a:	eb01 0182 	add.w	r1, r1, r2, lsl #2
 8007d2e:	f853 2f04 	ldr.w	r2, [r3, #4]!
 8007d32:	4050      	eors	r0, r2
 8007d34:	b2c2      	uxtb	r2, r0
 8007d36:	f854 2022 	ldr.w	r2, [r4, r2, lsl #2]
 8007d3a:	428b      	cmp	r3, r1
 8007d3c:	ea82 2210 	eor.w	r2, r2, r0, lsr #8
 8007d40:	b2d0      	uxtb	r0, r2
 8007d42:	f854 0020 	ldr.w	r0, [r4, r0, lsl #2]
 8007d46:	ea80 2212 	eor.w	r2, r0, r2, lsr #8
 8007d4a:	b2d0      	uxtb	r0, r2
 8007d4c:	f854 0020 	ldr.w	r0, [r4, r0, lsl #2]
 8007d50:	ea80 2012 	eor.w	r0, r0, r2, lsr #8
 8007d54:	b2c2      	uxtb	r2, r0
 8007d56:	f854 2022 	ldr.w	r2, [r4, r2, lsl #2]
 8007d5a:	ea82 2010 	eor.w	r0, r2, r0, lsr #8
 8007d5e:	d1e6      	bne.n	8007d2e <crc32_no_comp+0x42>
 8007d60:	2d00      	cmp	r5, #0
 8007d62:	d0d6      	beq.n	8007d12 <crc32_no_comp+0x26>
 8007d64:	3303      	adds	r3, #3
 8007d66:	4c07      	ldr	r4, [pc, #28]	; (8007d84 <crc32_no_comp+0x98>)
 8007d68:	441d      	add	r5, r3
 8007d6a:	f813 2f01 	ldrb.w	r2, [r3, #1]!
 8007d6e:	4042      	eors	r2, r0
 8007d70:	b2d2      	uxtb	r2, r2
 8007d72:	f854 2022 	ldr.w	r2, [r4, r2, lsl #2]
 8007d76:	42ab      	cmp	r3, r5
 8007d78:	ea82 2010 	eor.w	r0, r2, r0, lsr #8
 8007d7c:	d1f5      	bne.n	8007d6a <crc32_no_comp+0x7e>
 8007d7e:	bc30      	pop	{r4, r5}
 8007d80:	4770      	bx	lr
 8007d82:	bf00      	nop
 8007d84:	0800e734 	.word	0x0800e734

08007d88 <crc32>:
 8007d88:	b508      	push	{r3, lr}
 8007d8a:	43c0      	mvns	r0, r0
 8007d8c:	f7ff ffae 	bl	8007cec <crc32_no_comp>
 8007d90:	43c0      	mvns	r0, r0
 8007d92:	bd08      	pop	{r3, pc}

08007d94 <crc32_wd>:
 8007d94:	b508      	push	{r3, lr}
 8007d96:	43c0      	mvns	r0, r0
 8007d98:	f7ff ffa8 	bl	8007cec <crc32_no_comp>
 8007d9c:	43c0      	mvns	r0, r0
 8007d9e:	bd08      	pop	{r3, pc}

08007da0 <display_options>:
 8007da0:	b508      	push	{r3, lr}
 8007da2:	4903      	ldr	r1, [pc, #12]	; (8007db0 <display_options+0x10>)
 8007da4:	4803      	ldr	r0, [pc, #12]	; (8007db4 <display_options+0x14>)
 8007da6:	f7fd fad7 	bl	8005358 <printf>
 8007daa:	2000      	movs	r0, #0
 8007dac:	bd08      	pop	{r3, pc}
 8007dae:	bf00      	nop
 8007db0:	0800c3e0 	.word	0x0800c3e0
 8007db4:	0800c420 	.word	0x0800c420

08007db8 <print_size>:
 8007db8:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8007dbc:	b570      	push	{r4, r5, r6, lr}
 8007dbe:	460e      	mov	r6, r1
 8007dc0:	d231      	bcs.n	8007e26 <print_size+0x6e>
 8007dc2:	4b1b      	ldr	r3, [pc, #108]	; (8007e30 <print_size+0x78>)
 8007dc4:	4298      	cmp	r0, r3
 8007dc6:	bf95      	itete	ls
 8007dc8:	256b      	movls	r5, #107	; 0x6b
 8007dca:	254d      	movhi	r5, #77	; 0x4d
 8007dcc:	f44f 6380 	movls.w	r3, #1024	; 0x400
 8007dd0:	f44f 1380 	movhi.w	r3, #1048576	; 0x100000
 8007dd4:	fbb0 f1f3 	udiv	r1, r0, r3
 8007dd8:	fb03 0011 	mls	r0, r3, r1, r0
 8007ddc:	b1c8      	cbz	r0, 8007e12 <print_size+0x5a>
 8007dde:	085c      	lsrs	r4, r3, #1
 8007de0:	eb00 0080 	add.w	r0, r0, r0, lsl #2
 8007de4:	eb04 0040 	add.w	r0, r4, r0, lsl #1
 8007de8:	fbb0 f4f3 	udiv	r4, r0, r3
 8007dec:	2c09      	cmp	r4, #9
 8007dee:	bf84      	itt	hi
 8007df0:	3c0a      	subhi	r4, #10
 8007df2:	3101      	addhi	r1, #1
 8007df4:	480f      	ldr	r0, [pc, #60]	; (8007e34 <print_size+0x7c>)
 8007df6:	f7fd faaf 	bl	8005358 <printf>
 8007dfa:	b11c      	cbz	r4, 8007e04 <print_size+0x4c>
 8007dfc:	4621      	mov	r1, r4
 8007dfe:	480e      	ldr	r0, [pc, #56]	; (8007e38 <print_size+0x80>)
 8007e00:	f7fd faaa 	bl	8005358 <printf>
 8007e04:	4632      	mov	r2, r6
 8007e06:	4629      	mov	r1, r5
 8007e08:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8007e0c:	480b      	ldr	r0, [pc, #44]	; (8007e3c <print_size+0x84>)
 8007e0e:	f7fd baa3 	b.w	8005358 <printf>
 8007e12:	4808      	ldr	r0, [pc, #32]	; (8007e34 <print_size+0x7c>)
 8007e14:	f7fd faa0 	bl	8005358 <printf>
 8007e18:	4632      	mov	r2, r6
 8007e1a:	4629      	mov	r1, r5
 8007e1c:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8007e20:	4806      	ldr	r0, [pc, #24]	; (8007e3c <print_size+0x84>)
 8007e22:	f7fd ba99 	b.w	8005358 <printf>
 8007e26:	2547      	movs	r5, #71	; 0x47
 8007e28:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 8007e2c:	e7d2      	b.n	8007dd4 <print_size+0x1c>
 8007e2e:	bf00      	nop
 8007e30:	000fffff 	.word	0x000fffff
 8007e34:	0800eb34 	.word	0x0800eb34
 8007e38:	0800eb3c 	.word	0x0800eb3c
 8007e3c:	0800eb44 	.word	0x0800eb44

08007e40 <print_buffer>:
 8007e40:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8007e44:	b094      	sub	sp, #80	; 0x50
 8007e46:	9d1c      	ldr	r5, [sp, #112]	; 0x70
 8007e48:	4614      	mov	r4, r2
 8007e4a:	fb02 f205 	mul.w	r2, r2, r5
 8007e4e:	2a40      	cmp	r2, #64	; 0x40
 8007e50:	bf84      	itt	hi
 8007e52:	2540      	movhi	r5, #64	; 0x40
 8007e54:	fbb5 f5f4 	udivhi	r5, r5, r4
 8007e58:	9002      	str	r0, [sp, #8]
 8007e5a:	9103      	str	r1, [sp, #12]
 8007e5c:	9301      	str	r3, [sp, #4]
 8007e5e:	b915      	cbnz	r5, 8007e66 <print_buffer+0x26>
 8007e60:	2510      	movs	r5, #16
 8007e62:	fbb5 f5f4 	udiv	r5, r5, r4
 8007e66:	9b01      	ldr	r3, [sp, #4]
 8007e68:	2b00      	cmp	r3, #0
 8007e6a:	d05e      	beq.n	8007f2a <print_buffer+0xea>
 8007e6c:	f8df a0fc 	ldr.w	sl, [pc, #252]	; 8007f6c <print_buffer+0x12c>
 8007e70:	9b01      	ldr	r3, [sp, #4]
 8007e72:	9902      	ldr	r1, [sp, #8]
 8007e74:	429d      	cmp	r5, r3
 8007e76:	bf28      	it	cs
 8007e78:	461d      	movcs	r5, r3
 8007e7a:	4837      	ldr	r0, [pc, #220]	; (8007f58 <print_buffer+0x118>)
 8007e7c:	f7fd fa6c 	bl	8005358 <printf>
 8007e80:	2d00      	cmp	r5, #0
 8007e82:	d05f      	beq.n	8007f44 <print_buffer+0x104>
 8007e84:	9f03      	ldr	r7, [sp, #12]
 8007e86:	2600      	movs	r6, #0
 8007e88:	e00b      	b.n	8007ea2 <print_buffer+0x62>
 8007e8a:	783b      	ldrb	r3, [r7, #0]
 8007e8c:	aa04      	add	r2, sp, #16
 8007e8e:	b2db      	uxtb	r3, r3
 8007e90:	4650      	mov	r0, sl
 8007e92:	4619      	mov	r1, r3
 8007e94:	5593      	strb	r3, [r2, r6]
 8007e96:	f7fd fa5f 	bl	8005358 <printf>
 8007e9a:	3601      	adds	r6, #1
 8007e9c:	42b5      	cmp	r5, r6
 8007e9e:	4427      	add	r7, r4
 8007ea0:	d010      	beq.n	8007ec4 <print_buffer+0x84>
 8007ea2:	2c04      	cmp	r4, #4
 8007ea4:	d045      	beq.n	8007f32 <print_buffer+0xf2>
 8007ea6:	2c02      	cmp	r4, #2
 8007ea8:	d1ef      	bne.n	8007e8a <print_buffer+0x4a>
 8007eaa:	883b      	ldrh	r3, [r7, #0]
 8007eac:	aa04      	add	r2, sp, #16
 8007eae:	b29b      	uxth	r3, r3
 8007eb0:	f822 3016 	strh.w	r3, [r2, r6, lsl #1]
 8007eb4:	4829      	ldr	r0, [pc, #164]	; (8007f5c <print_buffer+0x11c>)
 8007eb6:	4619      	mov	r1, r3
 8007eb8:	3601      	adds	r6, #1
 8007eba:	f7fd fa4d 	bl	8005358 <printf>
 8007ebe:	42b5      	cmp	r5, r6
 8007ec0:	4427      	add	r7, r4
 8007ec2:	d1ee      	bne.n	8007ea2 <print_buffer+0x62>
 8007ec4:	fb05 f904 	mul.w	r9, r5, r4
 8007ec8:	9b03      	ldr	r3, [sp, #12]
 8007eca:	4825      	ldr	r0, [pc, #148]	; (8007f60 <print_buffer+0x120>)
 8007ecc:	444b      	add	r3, r9
 8007ece:	9303      	str	r3, [sp, #12]
 8007ed0:	f7fd fa36 	bl	8005340 <puts>
 8007ed4:	f1b9 0f00 	cmp.w	r9, #0
 8007ed8:	d018      	beq.n	8007f0c <print_buffer+0xcc>
 8007eda:	f10d 0b10 	add.w	fp, sp, #16
 8007ede:	4f21      	ldr	r7, [pc, #132]	; (8007f64 <print_buffer+0x124>)
 8007ee0:	eb0b 0609 	add.w	r6, fp, r9
 8007ee4:	e006      	b.n	8007ef4 <print_buffer+0xb4>
 8007ee6:	2800      	cmp	r0, #0
 8007ee8:	bfb8      	it	lt
 8007eea:	202e      	movlt	r0, #46	; 0x2e
 8007eec:	f7fd fa1c 	bl	8005328 <putc>
 8007ef0:	455e      	cmp	r6, fp
 8007ef2:	d00b      	beq.n	8007f0c <print_buffer+0xcc>
 8007ef4:	f81b 0b01 	ldrb.w	r0, [fp], #1
 8007ef8:	5c3b      	ldrb	r3, [r7, r0]
 8007efa:	b240      	sxtb	r0, r0
 8007efc:	f013 0f97 	tst.w	r3, #151	; 0x97
 8007f00:	d1f1      	bne.n	8007ee6 <print_buffer+0xa6>
 8007f02:	202e      	movs	r0, #46	; 0x2e
 8007f04:	f7fd fa10 	bl	8005328 <putc>
 8007f08:	455e      	cmp	r6, fp
 8007f0a:	d1f3      	bne.n	8007ef4 <print_buffer+0xb4>
 8007f0c:	9b02      	ldr	r3, [sp, #8]
 8007f0e:	200a      	movs	r0, #10
 8007f10:	444b      	add	r3, r9
 8007f12:	9302      	str	r3, [sp, #8]
 8007f14:	9b01      	ldr	r3, [sp, #4]
 8007f16:	1b5b      	subs	r3, r3, r5
 8007f18:	9301      	str	r3, [sp, #4]
 8007f1a:	f7fd fa05 	bl	8005328 <putc>
 8007f1e:	f7fd fa3d 	bl	800539c <ctrlc>
 8007f22:	b9a0      	cbnz	r0, 8007f4e <print_buffer+0x10e>
 8007f24:	9b01      	ldr	r3, [sp, #4]
 8007f26:	2b00      	cmp	r3, #0
 8007f28:	d1a2      	bne.n	8007e70 <print_buffer+0x30>
 8007f2a:	2000      	movs	r0, #0
 8007f2c:	b014      	add	sp, #80	; 0x50
 8007f2e:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8007f32:	683b      	ldr	r3, [r7, #0]
 8007f34:	aa04      	add	r2, sp, #16
 8007f36:	480c      	ldr	r0, [pc, #48]	; (8007f68 <print_buffer+0x128>)
 8007f38:	4619      	mov	r1, r3
 8007f3a:	f842 3026 	str.w	r3, [r2, r6, lsl #2]
 8007f3e:	f7fd fa0b 	bl	8005358 <printf>
 8007f42:	e7aa      	b.n	8007e9a <print_buffer+0x5a>
 8007f44:	4806      	ldr	r0, [pc, #24]	; (8007f60 <print_buffer+0x120>)
 8007f46:	f7fd f9fb 	bl	8005340 <puts>
 8007f4a:	46a9      	mov	r9, r5
 8007f4c:	e7de      	b.n	8007f0c <print_buffer+0xcc>
 8007f4e:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8007f52:	b014      	add	sp, #80	; 0x50
 8007f54:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8007f58:	0800d768 	.word	0x0800d768
 8007f5c:	0800d778 	.word	0x0800d778
 8007f60:	0800de6c 	.word	0x0800de6c
 8007f64:	200009c8 	.word	0x200009c8
 8007f68:	0800d770 	.word	0x0800d770
 8007f6c:	0800d780 	.word	0x0800d780

08007f70 <zalloc>:
 8007f70:	fb01 f202 	mul.w	r2, r1, r2
 8007f74:	f102 000f 	add.w	r0, r2, #15
 8007f78:	f020 000f 	bic.w	r0, r0, #15
 8007f7c:	f7fd bc82 	b.w	8005884 <malloc>

08007f80 <zfree>:
 8007f80:	4608      	mov	r0, r1
 8007f82:	f7fd bba1 	b.w	80056c8 <free>
 8007f86:	bf00      	nop

08007f88 <zunzip>:
 8007f88:	e92d 46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
 8007f8c:	f04f 0e00 	mov.w	lr, #0
 8007f90:	b091      	sub	sp, #68	; 0x44
 8007f92:	4e21      	ldr	r6, [pc, #132]	; (8008018 <zunzip+0x90>)
 8007f94:	4d21      	ldr	r5, [pc, #132]	; (800801c <zunzip+0x94>)
 8007f96:	4681      	mov	r9, r0
 8007f98:	468a      	mov	sl, r1
 8007f9a:	4614      	mov	r4, r2
 8007f9c:	461f      	mov	r7, r3
 8007f9e:	a801      	add	r0, sp, #4
 8007fa0:	233c      	movs	r3, #60	; 0x3c
 8007fa2:	4a1f      	ldr	r2, [pc, #124]	; (8008020 <zunzip+0x98>)
 8007fa4:	f06f 010e 	mvn.w	r1, #14
 8007fa8:	9609      	str	r6, [sp, #36]	; 0x24
 8007faa:	950a      	str	r5, [sp, #40]	; 0x28
 8007fac:	f8cd e034 	str.w	lr, [sp, #52]	; 0x34
 8007fb0:	9e19      	ldr	r6, [sp, #100]	; 0x64
 8007fb2:	f001 fdd1 	bl	8009b58 <inflateInit2_>
 8007fb6:	4605      	mov	r5, r0
 8007fb8:	b9e8      	cbnz	r0, 8007ff6 <zunzip+0x6e>
 8007fba:	2104      	movs	r1, #4
 8007fbc:	683b      	ldr	r3, [r7, #0]
 8007fbe:	4434      	add	r4, r6
 8007fc0:	eb0d 0001 	add.w	r0, sp, r1
 8007fc4:	1b9e      	subs	r6, r3, r6
 8007fc6:	9401      	str	r4, [sp, #4]
 8007fc8:	f8cd 9010 	str.w	r9, [sp, #16]
 8007fcc:	f8cd a014 	str.w	sl, [sp, #20]
 8007fd0:	9602      	str	r6, [sp, #8]
 8007fd2:	f001 ff6b 	bl	8009eac <inflate>
 8007fd6:	2801      	cmp	r0, #1
 8007fd8:	d002      	beq.n	8007fe0 <zunzip+0x58>
 8007fda:	9b18      	ldr	r3, [sp, #96]	; 0x60
 8007fdc:	2b01      	cmp	r3, #1
 8007fde:	d011      	beq.n	8008004 <zunzip+0x7c>
 8007fe0:	9b04      	ldr	r3, [sp, #16]
 8007fe2:	a801      	add	r0, sp, #4
 8007fe4:	eba3 0309 	sub.w	r3, r3, r9
 8007fe8:	603b      	str	r3, [r7, #0]
 8007fea:	f001 fe11 	bl	8009c10 <inflateEnd>
 8007fee:	4628      	mov	r0, r5
 8007ff0:	b011      	add	sp, #68	; 0x44
 8007ff2:	e8bd 86f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, pc}
 8007ff6:	4601      	mov	r1, r0
 8007ff8:	480a      	ldr	r0, [pc, #40]	; (8008024 <zunzip+0x9c>)
 8007ffa:	f7fd f9ad 	bl	8005358 <printf>
 8007ffe:	f04f 35ff 	mov.w	r5, #4294967295	; 0xffffffff
 8008002:	e7f4      	b.n	8007fee <zunzip+0x66>
 8008004:	4601      	mov	r1, r0
 8008006:	4808      	ldr	r0, [pc, #32]	; (8008028 <zunzip+0xa0>)
 8008008:	f7fd f9a6 	bl	8005358 <printf>
 800800c:	a801      	add	r0, sp, #4
 800800e:	f001 fdff 	bl	8009c10 <inflateEnd>
 8008012:	f04f 35ff 	mov.w	r5, #4294967295	; 0xffffffff
 8008016:	e7ea      	b.n	8007fee <zunzip+0x66>
 8008018:	08007f71 	.word	0x08007f71
 800801c:	08007f81 	.word	0x08007f81
 8008020:	0800eb4c 	.word	0x0800eb4c
 8008024:	0800eb54 	.word	0x0800eb54
 8008028:	0800eb78 	.word	0x0800eb78

0800802c <gunzip>:
 800802c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800802e:	7894      	ldrb	r4, [r2, #2]
 8008030:	b083      	sub	sp, #12
 8008032:	2c08      	cmp	r4, #8
 8008034:	78d7      	ldrb	r7, [r2, #3]
 8008036:	d128      	bne.n	800808a <gunzip+0x5e>
 8008038:	f017 0fe0 	tst.w	r7, #224	; 0xe0
 800803c:	d125      	bne.n	800808a <gunzip+0x5e>
 800803e:	077e      	lsls	r6, r7, #29
 8008040:	d41d      	bmi.n	800807e <gunzip+0x52>
 8008042:	240a      	movs	r4, #10
 8008044:	073d      	lsls	r5, r7, #28
 8008046:	d505      	bpl.n	8008054 <gunzip+0x28>
 8008048:	1915      	adds	r5, r2, r4
 800804a:	f815 6b01 	ldrb.w	r6, [r5], #1
 800804e:	3401      	adds	r4, #1
 8008050:	2e00      	cmp	r6, #0
 8008052:	d1fa      	bne.n	800804a <gunzip+0x1e>
 8008054:	06fe      	lsls	r6, r7, #27
 8008056:	d505      	bpl.n	8008064 <gunzip+0x38>
 8008058:	1915      	adds	r5, r2, r4
 800805a:	f815 6b01 	ldrb.w	r6, [r5], #1
 800805e:	3401      	adds	r4, #1
 8008060:	2e00      	cmp	r6, #0
 8008062:	d1fa      	bne.n	800805a <gunzip+0x2e>
 8008064:	07bd      	lsls	r5, r7, #30
 8008066:	681d      	ldr	r5, [r3, #0]
 8008068:	bf48      	it	mi
 800806a:	3402      	addmi	r4, #2
 800806c:	42a5      	cmp	r5, r4
 800806e:	d912      	bls.n	8008096 <gunzip+0x6a>
 8008070:	2501      	movs	r5, #1
 8008072:	9401      	str	r4, [sp, #4]
 8008074:	9500      	str	r5, [sp, #0]
 8008076:	f7ff ff87 	bl	8007f88 <zunzip>
 800807a:	b003      	add	sp, #12
 800807c:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800807e:	7a94      	ldrb	r4, [r2, #10]
 8008080:	7ad5      	ldrb	r5, [r2, #11]
 8008082:	340c      	adds	r4, #12
 8008084:	eb04 2405 	add.w	r4, r4, r5, lsl #8
 8008088:	e7dc      	b.n	8008044 <gunzip+0x18>
 800808a:	4806      	ldr	r0, [pc, #24]	; (80080a4 <gunzip+0x78>)
 800808c:	f7fd f958 	bl	8005340 <puts>
 8008090:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8008094:	e7f1      	b.n	800807a <gunzip+0x4e>
 8008096:	4804      	ldr	r0, [pc, #16]	; (80080a8 <gunzip+0x7c>)
 8008098:	f7fd f952 	bl	8005340 <puts>
 800809c:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 80080a0:	e7eb      	b.n	800807a <gunzip+0x4e>
 80080a2:	bf00      	nop
 80080a4:	0800eb98 	.word	0x0800eb98
 80080a8:	0800ebb4 	.word	0x0800ebb4

080080ac <lmb_add_region>:
 80080ac:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 80080b0:	6807      	ldr	r7, [r0, #0]
 80080b2:	b082      	sub	sp, #8
 80080b4:	2f01      	cmp	r7, #1
 80080b6:	f000 8085 	beq.w	80081c4 <lmb_add_region+0x118>
 80080ba:	2f00      	cmp	r7, #0
 80080bc:	f000 809f 	beq.w	80081fe <lmb_add_region+0x152>
 80080c0:	68c5      	ldr	r5, [r0, #12]
 80080c2:	4686      	mov	lr, r0
 80080c4:	2400      	movs	r4, #0
 80080c6:	eb01 0902 	add.w	r9, r1, r2
 80080ca:	e00b      	b.n	80080e4 <lmb_add_region+0x38>
 80080cc:	454e      	cmp	r6, r9
 80080ce:	d016      	beq.n	80080fe <lmb_add_region+0x52>
 80080d0:	4561      	cmp	r1, ip
 80080d2:	f000 8081 	beq.w	80081d8 <lmb_add_region+0x12c>
 80080d6:	1c63      	adds	r3, r4, #1
 80080d8:	429f      	cmp	r7, r3
 80080da:	f240 8082 	bls.w	80081e2 <lmb_add_region+0x136>
 80080de:	461c      	mov	r4, r3
 80080e0:	f8de 500c 	ldr.w	r5, [lr, #12]
 80080e4:	f8de 6008 	ldr.w	r6, [lr, #8]
 80080e8:	4623      	mov	r3, r4
 80080ea:	42b1      	cmp	r1, r6
 80080ec:	eb06 0c05 	add.w	ip, r6, r5
 80080f0:	f10e 0e08 	add.w	lr, lr, #8
 80080f4:	d1ea      	bne.n	80080cc <lmb_add_region+0x20>
 80080f6:	42aa      	cmp	r2, r5
 80080f8:	d1e8      	bne.n	80080cc <lmb_add_region+0x20>
 80080fa:	2000      	movs	r0, #0
 80080fc:	e05b      	b.n	80081b6 <lmb_add_region+0x10a>
 80080fe:	eb00 0ec4 	add.w	lr, r0, r4, lsl #3
 8008102:	f8de 500c 	ldr.w	r5, [lr, #12]
 8008106:	1ab6      	subs	r6, r6, r2
 8008108:	4415      	add	r5, r2
 800810a:	f8ce 6008 	str.w	r6, [lr, #8]
 800810e:	f8ce 500c 	str.w	r5, [lr, #12]
 8008112:	1e7e      	subs	r6, r7, #1
 8008114:	42b4      	cmp	r4, r6
 8008116:	d251      	bcs.n	80081bc <lmb_add_region+0x110>
 8008118:	2501      	movs	r5, #1
 800811a:	3401      	adds	r4, #1
 800811c:	eb00 03c3 	add.w	r3, r0, r3, lsl #3
 8008120:	eb00 0ec4 	add.w	lr, r0, r4, lsl #3
 8008124:	f8d3 a008 	ldr.w	sl, [r3, #8]
 8008128:	f8d3 900c 	ldr.w	r9, [r3, #12]
 800812c:	f8de c008 	ldr.w	ip, [lr, #8]
 8008130:	9301      	str	r3, [sp, #4]
 8008132:	eb0a 0309 	add.w	r3, sl, r9
 8008136:	459c      	cmp	ip, r3
 8008138:	f8de b00c 	ldr.w	fp, [lr, #12]
 800813c:	d026      	beq.n	800818c <lmb_add_region+0xe0>
 800813e:	44dc      	add	ip, fp
 8008140:	45e2      	cmp	sl, ip
 8008142:	d023      	beq.n	800818c <lmb_add_region+0xe0>
 8008144:	2d00      	cmp	r5, #0
 8008146:	d139      	bne.n	80081bc <lmb_add_region+0x110>
 8008148:	2f07      	cmp	r7, #7
 800814a:	d855      	bhi.n	80081f8 <lmb_add_region+0x14c>
 800814c:	1c75      	adds	r5, r6, #1
 800814e:	d012      	beq.n	8008176 <lmb_add_region+0xca>
 8008150:	1c73      	adds	r3, r6, #1
 8008152:	f850 4033 	ldr.w	r4, [r0, r3, lsl #3]
 8008156:	42a1      	cmp	r1, r4
 8008158:	bf38      	it	cc
 800815a:	eb00 03c6 	addcc.w	r3, r0, r6, lsl #3
 800815e:	d304      	bcc.n	800816a <lmb_add_region+0xbe>
 8008160:	e045      	b.n	80081ee <lmb_add_region+0x142>
 8008162:	f853 4908 	ldr.w	r4, [r3], #-8
 8008166:	42a1      	cmp	r1, r4
 8008168:	d241      	bcs.n	80081ee <lmb_add_region+0x142>
 800816a:	68dd      	ldr	r5, [r3, #12]
 800816c:	3e01      	subs	r6, #1
 800816e:	611c      	str	r4, [r3, #16]
 8008170:	1c74      	adds	r4, r6, #1
 8008172:	615d      	str	r5, [r3, #20]
 8008174:	d1f5      	bne.n	8008162 <lmb_add_region+0xb6>
 8008176:	6883      	ldr	r3, [r0, #8]
 8008178:	3701      	adds	r7, #1
 800817a:	4299      	cmp	r1, r3
 800817c:	bf3c      	itt	cc
 800817e:	6081      	strcc	r1, [r0, #8]
 8008180:	60c2      	strcc	r2, [r0, #12]
 8008182:	6007      	str	r7, [r0, #0]
 8008184:	2000      	movs	r0, #0
 8008186:	b002      	add	sp, #8
 8008188:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 800818c:	9b01      	ldr	r3, [sp, #4]
 800818e:	eb09 020b 	add.w	r2, r9, fp
 8008192:	42b4      	cmp	r4, r6
 8008194:	60da      	str	r2, [r3, #12]
 8008196:	d20c      	bcs.n	80081b2 <lmb_add_region+0x106>
 8008198:	f8de 2010 	ldr.w	r2, [lr, #16]
 800819c:	f8de 3014 	ldr.w	r3, [lr, #20]
 80081a0:	3401      	adds	r4, #1
 80081a2:	42b4      	cmp	r4, r6
 80081a4:	f8ce 2008 	str.w	r2, [lr, #8]
 80081a8:	f8ce 300c 	str.w	r3, [lr, #12]
 80081ac:	f10e 0e08 	add.w	lr, lr, #8
 80081b0:	d1f2      	bne.n	8008198 <lmb_add_region+0xec>
 80081b2:	6006      	str	r6, [r0, #0]
 80081b4:	1c68      	adds	r0, r5, #1
 80081b6:	b002      	add	sp, #8
 80081b8:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 80081bc:	2001      	movs	r0, #1
 80081be:	b002      	add	sp, #8
 80081c0:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 80081c4:	68c5      	ldr	r5, [r0, #12]
 80081c6:	2d00      	cmp	r5, #0
 80081c8:	f47f af7b 	bne.w	80080c2 <lmb_add_region+0x16>
 80081cc:	6081      	str	r1, [r0, #8]
 80081ce:	60c2      	str	r2, [r0, #12]
 80081d0:	4628      	mov	r0, r5
 80081d2:	b002      	add	sp, #8
 80081d4:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 80081d8:	4415      	add	r5, r2
 80081da:	eb00 06c4 	add.w	r6, r0, r4, lsl #3
 80081de:	60f5      	str	r5, [r6, #12]
 80081e0:	e797      	b.n	8008112 <lmb_add_region+0x66>
 80081e2:	1e7e      	subs	r6, r7, #1
 80081e4:	42b3      	cmp	r3, r6
 80081e6:	d2af      	bcs.n	8008148 <lmb_add_region+0x9c>
 80081e8:	3402      	adds	r4, #2
 80081ea:	2500      	movs	r5, #0
 80081ec:	e796      	b.n	800811c <lmb_add_region+0x70>
 80081ee:	eb00 06c6 	add.w	r6, r0, r6, lsl #3
 80081f2:	6131      	str	r1, [r6, #16]
 80081f4:	6172      	str	r2, [r6, #20]
 80081f6:	e7be      	b.n	8008176 <lmb_add_region+0xca>
 80081f8:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 80081fc:	e7db      	b.n	80081b6 <lmb_add_region+0x10a>
 80081fe:	463b      	mov	r3, r7
 8008200:	463d      	mov	r5, r7
 8008202:	2401      	movs	r4, #1
 8008204:	f04f 36ff 	mov.w	r6, #4294967295	; 0xffffffff
 8008208:	e788      	b.n	800811c <lmb_add_region+0x70>
 800820a:	bf00      	nop

0800820c <lmb_dump_all>:
 800820c:	4770      	bx	lr
 800820e:	bf00      	nop

08008210 <lmb_init>:
 8008210:	2300      	movs	r3, #0
 8008212:	2201      	movs	r2, #1
 8008214:	6083      	str	r3, [r0, #8]
 8008216:	60c3      	str	r3, [r0, #12]
 8008218:	6043      	str	r3, [r0, #4]
 800821a:	6583      	str	r3, [r0, #88]	; 0x58
 800821c:	65c3      	str	r3, [r0, #92]	; 0x5c
 800821e:	6543      	str	r3, [r0, #84]	; 0x54
 8008220:	6002      	str	r2, [r0, #0]
 8008222:	6502      	str	r2, [r0, #80]	; 0x50
 8008224:	4770      	bx	lr
 8008226:	bf00      	nop

08008228 <lmb_add>:
 8008228:	e740      	b.n	80080ac <lmb_add_region>
 800822a:	bf00      	nop

0800822c <lmb_free>:
 800822c:	4694      	mov	ip, r2
 800822e:	6d02      	ldr	r2, [r0, #80]	; 0x50
 8008230:	b5f0      	push	{r4, r5, r6, r7, lr}
 8008232:	eb01 0e0c 	add.w	lr, r1, ip
 8008236:	2a00      	cmp	r2, #0
 8008238:	d045      	beq.n	80082c6 <lmb_free+0x9a>
 800823a:	4604      	mov	r4, r0
 800823c:	2300      	movs	r3, #0
 800823e:	6da6      	ldr	r6, [r4, #88]	; 0x58
 8008240:	6de5      	ldr	r5, [r4, #92]	; 0x5c
 8008242:	42b1      	cmp	r1, r6
 8008244:	461f      	mov	r7, r3
 8008246:	4435      	add	r5, r6
 8008248:	f104 0408 	add.w	r4, r4, #8
 800824c:	d301      	bcc.n	8008252 <lmb_free+0x26>
 800824e:	45ae      	cmp	lr, r5
 8008250:	d903      	bls.n	800825a <lmb_free+0x2e>
 8008252:	3301      	adds	r3, #1
 8008254:	4293      	cmp	r3, r2
 8008256:	461f      	mov	r7, r3
 8008258:	d1f1      	bne.n	800823e <lmb_free+0x12>
 800825a:	429a      	cmp	r2, r3
 800825c:	d033      	beq.n	80082c6 <lmb_free+0x9a>
 800825e:	42b1      	cmp	r1, r6
 8008260:	d013      	beq.n	800828a <lmb_free+0x5e>
 8008262:	45ae      	cmp	lr, r5
 8008264:	eb00 03c3 	add.w	r3, r0, r3, lsl #3
 8008268:	d009      	beq.n	800827e <lmb_free+0x52>
 800826a:	6d9c      	ldr	r4, [r3, #88]	; 0x58
 800826c:	eba5 020e 	sub.w	r2, r5, lr
 8008270:	1b0c      	subs	r4, r1, r4
 8008272:	65dc      	str	r4, [r3, #92]	; 0x5c
 8008274:	4671      	mov	r1, lr
 8008276:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
 800827a:	3050      	adds	r0, #80	; 0x50
 800827c:	e716      	b.n	80080ac <lmb_add_region>
 800827e:	6dda      	ldr	r2, [r3, #92]	; 0x5c
 8008280:	2000      	movs	r0, #0
 8008282:	eba2 020c 	sub.w	r2, r2, ip
 8008286:	65da      	str	r2, [r3, #92]	; 0x5c
 8008288:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800828a:	45ae      	cmp	lr, r5
 800828c:	d009      	beq.n	80082a2 <lmb_free+0x76>
 800828e:	eb00 03c3 	add.w	r3, r0, r3, lsl #3
 8008292:	6dda      	ldr	r2, [r3, #92]	; 0x5c
 8008294:	f8c3 e058 	str.w	lr, [r3, #88]	; 0x58
 8008298:	eba2 020c 	sub.w	r2, r2, ip
 800829c:	65da      	str	r2, [r3, #92]	; 0x5c
 800829e:	2000      	movs	r0, #0
 80082a0:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80082a2:	3a01      	subs	r2, #1
 80082a4:	429a      	cmp	r2, r3
 80082a6:	bf88      	it	hi
 80082a8:	eb00 03c3 	addhi.w	r3, r0, r3, lsl #3
 80082ac:	d908      	bls.n	80082c0 <lmb_free+0x94>
 80082ae:	6e1c      	ldr	r4, [r3, #96]	; 0x60
 80082b0:	6e59      	ldr	r1, [r3, #100]	; 0x64
 80082b2:	3701      	adds	r7, #1
 80082b4:	4297      	cmp	r7, r2
 80082b6:	659c      	str	r4, [r3, #88]	; 0x58
 80082b8:	65d9      	str	r1, [r3, #92]	; 0x5c
 80082ba:	f103 0308 	add.w	r3, r3, #8
 80082be:	d1f6      	bne.n	80082ae <lmb_free+0x82>
 80082c0:	6502      	str	r2, [r0, #80]	; 0x50
 80082c2:	2000      	movs	r0, #0
 80082c4:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80082c6:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 80082ca:	bdf0      	pop	{r4, r5, r6, r7, pc}

080082cc <lmb_reserve>:
 80082cc:	3050      	adds	r0, #80	; 0x50
 80082ce:	e6ed      	b.n	80080ac <lmb_add_region>

080082d0 <lmb_overlaps_region>:
 80082d0:	b470      	push	{r4, r5, r6}
 80082d2:	6806      	ldr	r6, [r0, #0]
 80082d4:	b1a6      	cbz	r6, 8008300 <lmb_overlaps_region+0x30>
 80082d6:	2400      	movs	r4, #0
 80082d8:	440a      	add	r2, r1
 80082da:	e002      	b.n	80082e2 <lmb_overlaps_region+0x12>
 80082dc:	3401      	adds	r4, #1
 80082de:	42b4      	cmp	r4, r6
 80082e0:	d00e      	beq.n	8008300 <lmb_overlaps_region+0x30>
 80082e2:	6885      	ldr	r5, [r0, #8]
 80082e4:	68c3      	ldr	r3, [r0, #12]
 80082e6:	3008      	adds	r0, #8
 80082e8:	442b      	add	r3, r5
 80082ea:	4299      	cmp	r1, r3
 80082ec:	d2f6      	bcs.n	80082dc <lmb_overlaps_region+0xc>
 80082ee:	4295      	cmp	r5, r2
 80082f0:	d2f4      	bcs.n	80082dc <lmb_overlaps_region+0xc>
 80082f2:	42b4      	cmp	r4, r6
 80082f4:	bf34      	ite	cc
 80082f6:	4620      	movcc	r0, r4
 80082f8:	f04f 30ff 	movcs.w	r0, #4294967295	; 0xffffffff
 80082fc:	bc70      	pop	{r4, r5, r6}
 80082fe:	4770      	bx	lr
 8008300:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8008304:	bc70      	pop	{r4, r5, r6}
 8008306:	4770      	bx	lr

08008308 <__lmb_alloc_base>:
 8008308:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 800830c:	6804      	ldr	r4, [r0, #0]
 800830e:	b082      	sub	sp, #8
 8008310:	f1b4 0b01 	subs.w	fp, r4, #1
 8008314:	9201      	str	r2, [sp, #4]
 8008316:	9300      	str	r3, [sp, #0]
 8008318:	d43b      	bmi.n	8008392 <__lmb_alloc_base+0x8a>
 800831a:	9b01      	ldr	r3, [sp, #4]
 800831c:	eb00 0ac4 	add.w	sl, r0, r4, lsl #3
 8008320:	f1c3 0c00 	rsb	ip, r3, #0
 8008324:	f8da 7004 	ldr.w	r7, [sl, #4]
 8008328:	428f      	cmp	r7, r1
 800832a:	d32b      	bcc.n	8008384 <__lmb_alloc_base+0x7c>
 800832c:	9b00      	ldr	r3, [sp, #0]
 800832e:	f8da 9000 	ldr.w	r9, [sl]
 8008332:	bb9b      	cbnz	r3, 800839c <__lmb_alloc_base+0x94>
 8008334:	444f      	add	r7, r9
 8008336:	1a7f      	subs	r7, r7, r1
 8008338:	ea07 070c 	and.w	r7, r7, ip
 800833c:	b317      	cbz	r7, 8008384 <__lmb_alloc_base+0x7c>
 800833e:	45b9      	cmp	r9, r7
 8008340:	d820      	bhi.n	8008384 <__lmb_alloc_base+0x7c>
 8008342:	6d06      	ldr	r6, [r0, #80]	; 0x50
 8008344:	b3be      	cbz	r6, 80083b6 <__lmb_alloc_base+0xae>
 8008346:	4603      	mov	r3, r0
 8008348:	2400      	movs	r4, #0
 800834a:	eb01 0e07 	add.w	lr, r1, r7
 800834e:	e002      	b.n	8008356 <__lmb_alloc_base+0x4e>
 8008350:	3401      	adds	r4, #1
 8008352:	42b4      	cmp	r4, r6
 8008354:	d02f      	beq.n	80083b6 <__lmb_alloc_base+0xae>
 8008356:	6d9d      	ldr	r5, [r3, #88]	; 0x58
 8008358:	6dda      	ldr	r2, [r3, #92]	; 0x5c
 800835a:	3308      	adds	r3, #8
 800835c:	442a      	add	r2, r5
 800835e:	42ba      	cmp	r2, r7
 8008360:	d9f6      	bls.n	8008350 <__lmb_alloc_base+0x48>
 8008362:	4575      	cmp	r5, lr
 8008364:	d2f4      	bcs.n	8008350 <__lmb_alloc_base+0x48>
 8008366:	42a6      	cmp	r6, r4
 8008368:	d925      	bls.n	80083b6 <__lmb_alloc_base+0xae>
 800836a:	2c00      	cmp	r4, #0
 800836c:	db23      	blt.n	80083b6 <__lmb_alloc_base+0xae>
 800836e:	340b      	adds	r4, #11
 8008370:	f850 7034 	ldr.w	r7, [r0, r4, lsl #3]
 8008374:	42b9      	cmp	r1, r7
 8008376:	d805      	bhi.n	8008384 <__lmb_alloc_base+0x7c>
 8008378:	1a7f      	subs	r7, r7, r1
 800837a:	ea17 070c 	ands.w	r7, r7, ip
 800837e:	d001      	beq.n	8008384 <__lmb_alloc_base+0x7c>
 8008380:	45b9      	cmp	r9, r7
 8008382:	d9df      	bls.n	8008344 <__lmb_alloc_base+0x3c>
 8008384:	f10b 3bff 	add.w	fp, fp, #4294967295	; 0xffffffff
 8008388:	f1bb 3fff 	cmp.w	fp, #4294967295	; 0xffffffff
 800838c:	f1aa 0a08 	sub.w	sl, sl, #8
 8008390:	d1c8      	bne.n	8008324 <__lmb_alloc_base+0x1c>
 8008392:	2700      	movs	r7, #0
 8008394:	4638      	mov	r0, r7
 8008396:	b002      	add	sp, #8
 8008398:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 800839c:	9a00      	ldr	r2, [sp, #0]
 800839e:	4591      	cmp	r9, r2
 80083a0:	d2f0      	bcs.n	8008384 <__lmb_alloc_base+0x7c>
 80083a2:	444f      	add	r7, r9
 80083a4:	4297      	cmp	r7, r2
 80083a6:	bf94      	ite	ls
 80083a8:	ebc1 0707 	rsbls	r7, r1, r7
 80083ac:	ebc1 0702 	rsbhi	r7, r1, r2
 80083b0:	ea07 070c 	and.w	r7, r7, ip
 80083b4:	e7c2      	b.n	800833c <__lmb_alloc_base+0x34>
 80083b6:	9a01      	ldr	r2, [sp, #4]
 80083b8:	3050      	adds	r0, #80	; 0x50
 80083ba:	3a01      	subs	r2, #1
 80083bc:	440a      	add	r2, r1
 80083be:	ea02 020c 	and.w	r2, r2, ip
 80083c2:	4639      	mov	r1, r7
 80083c4:	f7ff fe72 	bl	80080ac <lmb_add_region>
 80083c8:	2800      	cmp	r0, #0
 80083ca:	dbe2      	blt.n	8008392 <__lmb_alloc_base+0x8a>
 80083cc:	4638      	mov	r0, r7
 80083ce:	b002      	add	sp, #8
 80083d0:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}

080083d4 <lmb_alloc_base>:
 80083d4:	b570      	push	{r4, r5, r6, lr}
 80083d6:	460d      	mov	r5, r1
 80083d8:	461e      	mov	r6, r3
 80083da:	f7ff ff95 	bl	8008308 <__lmb_alloc_base>
 80083de:	4604      	mov	r4, r0
 80083e0:	b920      	cbnz	r0, 80083ec <lmb_alloc_base+0x18>
 80083e2:	4632      	mov	r2, r6
 80083e4:	4629      	mov	r1, r5
 80083e6:	4802      	ldr	r0, [pc, #8]	; (80083f0 <lmb_alloc_base+0x1c>)
 80083e8:	f7fc ffb6 	bl	8005358 <printf>
 80083ec:	4620      	mov	r0, r4
 80083ee:	bd70      	pop	{r4, r5, r6, pc}
 80083f0:	0800ebdc 	.word	0x0800ebdc

080083f4 <lmb_alloc>:
 80083f4:	2300      	movs	r3, #0
 80083f6:	f7ff bfed 	b.w	80083d4 <lmb_alloc_base>
 80083fa:	bf00      	nop

080083fc <lmb_is_reserved>:
 80083fc:	b430      	push	{r4, r5}
 80083fe:	6d05      	ldr	r5, [r0, #80]	; 0x50
 8008400:	b17d      	cbz	r5, 8008422 <lmb_is_reserved+0x26>
 8008402:	2200      	movs	r2, #0
 8008404:	6d83      	ldr	r3, [r0, #88]	; 0x58
 8008406:	6dc4      	ldr	r4, [r0, #92]	; 0x5c
 8008408:	428b      	cmp	r3, r1
 800840a:	4423      	add	r3, r4
 800840c:	f102 0201 	add.w	r2, r2, #1
 8008410:	f103 33ff 	add.w	r3, r3, #4294967295	; 0xffffffff
 8008414:	f100 0008 	add.w	r0, r0, #8
 8008418:	d801      	bhi.n	800841e <lmb_is_reserved+0x22>
 800841a:	428b      	cmp	r3, r1
 800841c:	d204      	bcs.n	8008428 <lmb_is_reserved+0x2c>
 800841e:	4295      	cmp	r5, r2
 8008420:	d1f0      	bne.n	8008404 <lmb_is_reserved+0x8>
 8008422:	2000      	movs	r0, #0
 8008424:	bc30      	pop	{r4, r5}
 8008426:	4770      	bx	lr
 8008428:	2001      	movs	r0, #1
 800842a:	bc30      	pop	{r4, r5}
 800842c:	4770      	bx	lr
 800842e:	bf00      	nop

08008430 <__board_lmb_reserve>:
 8008430:	4770      	bx	lr
 8008432:	bf00      	nop

08008434 <__arch_lmb_reserve>:
 8008434:	4770      	bx	lr
 8008436:	bf00      	nop

08008438 <string_to_ip>:
 8008438:	4603      	mov	r3, r0
 800843a:	b318      	cbz	r0, 8008484 <string_to_ip+0x4c>
 800843c:	b530      	push	{r4, r5, lr}
 800843e:	2400      	movs	r4, #0
 8008440:	4625      	mov	r5, r4
 8008442:	b083      	sub	sp, #12
 8008444:	4618      	mov	r0, r3
 8008446:	220a      	movs	r2, #10
 8008448:	a901      	add	r1, sp, #4
 800844a:	f000 fa45 	bl	80088d8 <simple_strtoul>
 800844e:	9b01      	ldr	r3, [sp, #4]
 8008450:	b2c0      	uxtb	r0, r0
 8008452:	f993 2000 	ldrsb.w	r2, [r3]
 8008456:	ea40 2505 	orr.w	r5, r0, r5, lsl #8
 800845a:	3401      	adds	r4, #1
 800845c:	b16a      	cbz	r2, 800847a <string_to_ip+0x42>
 800845e:	2c04      	cmp	r4, #4
 8008460:	f103 0301 	add.w	r3, r3, #1
 8008464:	d006      	beq.n	8008474 <string_to_ip+0x3c>
 8008466:	2b00      	cmp	r3, #0
 8008468:	d1ec      	bne.n	8008444 <string_to_ip+0xc>
 800846a:	3401      	adds	r4, #1
 800846c:	2c04      	cmp	r4, #4
 800846e:	ea4f 2505 	mov.w	r5, r5, lsl #8
 8008472:	d1fa      	bne.n	800846a <string_to_ip+0x32>
 8008474:	ba28      	rev	r0, r5
 8008476:	b003      	add	sp, #12
 8008478:	bd30      	pop	{r4, r5, pc}
 800847a:	2c04      	cmp	r4, #4
 800847c:	d1e2      	bne.n	8008444 <string_to_ip+0xc>
 800847e:	ba28      	rev	r0, r5
 8008480:	b003      	add	sp, #12
 8008482:	bd30      	pop	{r4, r5, pc}
 8008484:	4770      	bx	lr
 8008486:	bf00      	nop

08008488 <udelay>:
 8008488:	b570      	push	{r4, r5, r6, lr}
 800848a:	4604      	mov	r4, r0
 800848c:	4e05      	ldr	r6, [pc, #20]	; (80084a4 <udelay+0x1c>)
 800848e:	42b4      	cmp	r4, r6
 8008490:	4625      	mov	r5, r4
 8008492:	bf28      	it	cs
 8008494:	4635      	movcs	r5, r6
 8008496:	4628      	mov	r0, r5
 8008498:	f7f8 fb02 	bl	8000aa0 <__udelay>
 800849c:	1b64      	subs	r4, r4, r5
 800849e:	d1f6      	bne.n	800848e <udelay+0x6>
 80084a0:	bd70      	pop	{r4, r5, r6, pc}
 80084a2:	bf00      	nop
 80084a4:	00989680 	.word	0x00989680

080084a8 <put_dec_trunc>:
 80084a8:	22cd      	movs	r2, #205	; 0xcd
 80084aa:	b5f0      	push	{r4, r5, r6, r7, lr}
 80084ac:	f3c1 1e03 	ubfx	lr, r1, #4, #4
 80084b0:	f3c1 2503 	ubfx	r5, r1, #8, #4
 80084b4:	0b0c      	lsrs	r4, r1, #12
 80084b6:	eb0e 0705 	add.w	r7, lr, r5
 80084ba:	4427      	add	r7, r4
 80084bc:	eb07 0747 	add.w	r7, r7, r7, lsl #1
 80084c0:	f001 010f 	and.w	r1, r1, #15
 80084c4:	eb01 0147 	add.w	r1, r1, r7, lsl #1
 80084c8:	fb02 f301 	mul.w	r3, r2, r1
 80084cc:	0adb      	lsrs	r3, r3, #11
 80084ce:	eb03 0783 	add.w	r7, r3, r3, lsl #2
 80084d2:	eb04 06c4 	add.w	r6, r4, r4, lsl #3
 80084d6:	eba1 0147 	sub.w	r1, r1, r7, lsl #1
 80084da:	4476      	add	r6, lr
 80084dc:	eb05 0785 	add.w	r7, r5, r5, lsl #2
 80084e0:	443e      	add	r6, r7
 80084e2:	3130      	adds	r1, #48	; 0x30
 80084e4:	199b      	adds	r3, r3, r6
 80084e6:	7001      	strb	r1, [r0, #0]
 80084e8:	d02c      	beq.n	8008544 <put_dec_trunc+0x9c>
 80084ea:	fb02 f203 	mul.w	r2, r2, r3
 80084ee:	0ad2      	lsrs	r2, r2, #11
 80084f0:	eb02 0182 	add.w	r1, r2, r2, lsl #2
 80084f4:	eba3 0341 	sub.w	r3, r3, r1, lsl #1
 80084f8:	3330      	adds	r3, #48	; 0x30
 80084fa:	eb12 0245 	adds.w	r2, r2, r5, lsl #1
 80084fe:	7043      	strb	r3, [r0, #1]
 8008500:	d01c      	beq.n	800853c <put_dec_trunc+0x94>
 8008502:	eb02 0342 	add.w	r3, r2, r2, lsl #1
 8008506:	eb02 0383 	add.w	r3, r2, r3, lsl #2
 800850a:	09db      	lsrs	r3, r3, #7
 800850c:	eb03 0183 	add.w	r1, r3, r3, lsl #2
 8008510:	eba2 0241 	sub.w	r2, r2, r1, lsl #1
 8008514:	3230      	adds	r2, #48	; 0x30
 8008516:	eb13 0484 	adds.w	r4, r3, r4, lsl #2
 800851a:	7082      	strb	r2, [r0, #2]
 800851c:	d016      	beq.n	800854c <put_dec_trunc+0xa4>
 800851e:	22cd      	movs	r2, #205	; 0xcd
 8008520:	fb02 f204 	mul.w	r2, r2, r4
 8008524:	0ad2      	lsrs	r2, r2, #11
 8008526:	eb02 0382 	add.w	r3, r2, r2, lsl #2
 800852a:	eba4 0443 	sub.w	r4, r4, r3, lsl #1
 800852e:	3430      	adds	r4, #48	; 0x30
 8008530:	70c4      	strb	r4, [r0, #3]
 8008532:	b14a      	cbz	r2, 8008548 <put_dec_trunc+0xa0>
 8008534:	3230      	adds	r2, #48	; 0x30
 8008536:	7102      	strb	r2, [r0, #4]
 8008538:	3005      	adds	r0, #5
 800853a:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800853c:	2c00      	cmp	r4, #0
 800853e:	d1e0      	bne.n	8008502 <put_dec_trunc+0x5a>
 8008540:	3002      	adds	r0, #2
 8008542:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8008544:	3001      	adds	r0, #1
 8008546:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8008548:	3004      	adds	r0, #4
 800854a:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800854c:	3003      	adds	r0, #3
 800854e:	bdf0      	pop	{r4, r5, r6, r7, pc}

08008550 <string>:
 8008550:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8008552:	4d18      	ldr	r5, [pc, #96]	; (80085b4 <string+0x64>)
 8008554:	9f06      	ldr	r7, [sp, #24]
 8008556:	2900      	cmp	r1, #0
 8008558:	bf18      	it	ne
 800855a:	460d      	movne	r5, r1
 800855c:	4604      	mov	r4, r0
 800855e:	4619      	mov	r1, r3
 8008560:	4628      	mov	r0, r5
 8008562:	4616      	mov	r6, r2
 8008564:	f7f7 ffb2 	bl	80004cc <strnlen>
 8008568:	06fb      	lsls	r3, r7, #27
 800856a:	d40b      	bmi.n	8008584 <string+0x34>
 800856c:	42b0      	cmp	r0, r6
 800856e:	f106 33ff 	add.w	r3, r6, #4294967295	; 0xffffffff
 8008572:	da1d      	bge.n	80085b0 <string+0x60>
 8008574:	2320      	movs	r3, #32
 8008576:	1a36      	subs	r6, r6, r0
 8008578:	4426      	add	r6, r4
 800857a:	f804 3b01 	strb.w	r3, [r4], #1
 800857e:	42a6      	cmp	r6, r4
 8008580:	d1fb      	bne.n	800857a <string+0x2a>
 8008582:	1e46      	subs	r6, r0, #1
 8008584:	2800      	cmp	r0, #0
 8008586:	dd08      	ble.n	800859a <string+0x4a>
 8008588:	1e63      	subs	r3, r4, #1
 800858a:	182f      	adds	r7, r5, r0
 800858c:	f915 1b01 	ldrsb.w	r1, [r5], #1
 8008590:	42bd      	cmp	r5, r7
 8008592:	f803 1f01 	strb.w	r1, [r3, #1]!
 8008596:	d1f9      	bne.n	800858c <string+0x3c>
 8008598:	4404      	add	r4, r0
 800859a:	4286      	cmp	r6, r0
 800859c:	dd06      	ble.n	80085ac <string+0x5c>
 800859e:	2120      	movs	r1, #32
 80085a0:	1a32      	subs	r2, r6, r0
 80085a2:	4422      	add	r2, r4
 80085a4:	f804 1b01 	strb.w	r1, [r4], #1
 80085a8:	4294      	cmp	r4, r2
 80085aa:	d1fb      	bne.n	80085a4 <string+0x54>
 80085ac:	4620      	mov	r0, r4
 80085ae:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80085b0:	461e      	mov	r6, r3
 80085b2:	e7e7      	b.n	8008584 <string+0x34>
 80085b4:	0800ec34 	.word	0x0800ec34

080085b8 <put_dec>:
 80085b8:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 80085bc:	f04f 0b00 	mov.w	fp, #0
 80085c0:	f8df a110 	ldr.w	sl, [pc, #272]	; 80086d4 <put_dec+0x11c>
 80085c4:	459b      	cmp	fp, r3
 80085c6:	b086      	sub	sp, #24
 80085c8:	bf08      	it	eq
 80085ca:	4592      	cmpeq	sl, r2
 80085cc:	4614      	mov	r4, r2
 80085ce:	e9cd 2304 	strd	r2, r3, [sp, #16]
 80085d2:	d276      	bcs.n	80086c2 <put_dec+0x10a>
 80085d4:	461d      	mov	r5, r3
 80085d6:	e9cd ab02 	strd	sl, fp, [sp, #8]
 80085da:	27cd      	movs	r7, #205	; 0xcd
 80085dc:	f8df 90f8 	ldr.w	r9, [pc, #248]	; 80086d8 <put_dec+0x120>
 80085e0:	1d46      	adds	r6, r0, #5
 80085e2:	e05e      	b.n	80086a2 <put_dec+0xea>
 80085e4:	4a3a      	ldr	r2, [pc, #232]	; (80086d0 <put_dec+0x118>)
 80085e6:	2500      	movs	r5, #0
 80085e8:	fba2 2303 	umull	r2, r3, r2, r3
 80085ec:	09d8      	lsrs	r0, r3, #7
 80085ee:	4603      	mov	r3, r0
 80085f0:	fb09 4010 	mls	r0, r9, r0, r4
 80085f4:	461c      	mov	r4, r3
 80085f6:	e9cd 4504 	strd	r4, r5, [sp, #16]
 80085fa:	f3c0 1303 	ubfx	r3, r0, #4, #4
 80085fe:	f3c0 2e03 	ubfx	lr, r0, #8, #4
 8008602:	ea4f 3b10 	mov.w	fp, r0, lsr #12
 8008606:	eb03 010e 	add.w	r1, r3, lr
 800860a:	4459      	add	r1, fp
 800860c:	eb01 0141 	add.w	r1, r1, r1, lsl #1
 8008610:	f000 000f 	and.w	r0, r0, #15
 8008614:	eb00 0041 	add.w	r0, r0, r1, lsl #1
 8008618:	fb07 f100 	mul.w	r1, r7, r0
 800861c:	eb0b 0ccb 	add.w	ip, fp, fp, lsl #3
 8008620:	449c      	add	ip, r3
 8008622:	eb0e 038e 	add.w	r3, lr, lr, lsl #2
 8008626:	449c      	add	ip, r3
 8008628:	0ac9      	lsrs	r1, r1, #11
 800862a:	448c      	add	ip, r1
 800862c:	fb07 f20c 	mul.w	r2, r7, ip
 8008630:	0ad2      	lsrs	r2, r2, #11
 8008632:	eb02 0e4e 	add.w	lr, r2, lr, lsl #1
 8008636:	eb0e 034e 	add.w	r3, lr, lr, lsl #1
 800863a:	eb0e 0383 	add.w	r3, lr, r3, lsl #2
 800863e:	09db      	lsrs	r3, r3, #7
 8008640:	eb03 0b8b 	add.w	fp, r3, fp, lsl #2
 8008644:	fb07 fa0b 	mul.w	sl, r7, fp
 8008648:	eb02 0282 	add.w	r2, r2, r2, lsl #2
 800864c:	eb03 0383 	add.w	r3, r3, r3, lsl #2
 8008650:	ea4f 2ada 	mov.w	sl, sl, lsr #11
 8008654:	eb01 0181 	add.w	r1, r1, r1, lsl #2
 8008658:	ebac 0242 	sub.w	r2, ip, r2, lsl #1
 800865c:	ebae 0343 	sub.w	r3, lr, r3, lsl #1
 8008660:	eba0 0141 	sub.w	r1, r0, r1, lsl #1
 8008664:	3230      	adds	r2, #48	; 0x30
 8008666:	eb0a 008a 	add.w	r0, sl, sl, lsl #2
 800866a:	3330      	adds	r3, #48	; 0x30
 800866c:	ebab 0b40 	sub.w	fp, fp, r0, lsl #1
 8008670:	f806 2c04 	strb.w	r2, [r6, #-4]
 8008674:	f806 3c03 	strb.w	r3, [r6, #-3]
 8008678:	e9dd 2302 	ldrd	r2, r3, [sp, #8]
 800867c:	42ab      	cmp	r3, r5
 800867e:	f101 0130 	add.w	r1, r1, #48	; 0x30
 8008682:	f10b 0b30 	add.w	fp, fp, #48	; 0x30
 8008686:	f10a 0a30 	add.w	sl, sl, #48	; 0x30
 800868a:	bf08      	it	eq
 800868c:	42a2      	cmpeq	r2, r4
 800868e:	f806 1c05 	strb.w	r1, [r6, #-5]
 8008692:	f806 bc02 	strb.w	fp, [r6, #-2]
 8008696:	f806 ac01 	strb.w	sl, [r6, #-1]
 800869a:	4630      	mov	r0, r6
 800869c:	f106 0605 	add.w	r6, r6, #5
 80086a0:	d20f      	bcs.n	80086c2 <put_dec+0x10a>
 80086a2:	2200      	movs	r2, #0
 80086a4:	9500      	str	r5, [sp, #0]
 80086a6:	9201      	str	r2, [sp, #4]
 80086a8:	e9dd 1200 	ldrd	r1, r2, [sp]
 80086ac:	430a      	orrs	r2, r1
 80086ae:	ea4f 1354 	mov.w	r3, r4, lsr #5
 80086b2:	d097      	beq.n	80085e4 <put_dec+0x2c>
 80086b4:	4649      	mov	r1, r9
 80086b6:	a804      	add	r0, sp, #16
 80086b8:	f002 fd22 	bl	800b100 <__div64_32>
 80086bc:	e9dd 4504 	ldrd	r4, r5, [sp, #16]
 80086c0:	e79b      	b.n	80085fa <put_dec+0x42>
 80086c2:	4621      	mov	r1, r4
 80086c4:	f7ff fef0 	bl	80084a8 <put_dec_trunc>
 80086c8:	b006      	add	sp, #24
 80086ca:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 80086ce:	bf00      	nop
 80086d0:	0a7c5ac5 	.word	0x0a7c5ac5
 80086d4:	0001869f 	.word	0x0001869f
 80086d8:	000186a0 	.word	0x000186a0

080086dc <number>:
 80086dc:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 80086e0:	b096      	sub	sp, #88	; 0x58
 80086e2:	9921      	ldr	r1, [sp, #132]	; 0x84
 80086e4:	4604      	mov	r4, r0
 80086e6:	f011 0140 	ands.w	r1, r1, #64	; 0x40
 80086ea:	f000 80ca 	beq.w	8008882 <number+0x1a6>
 80086ee:	991e      	ldr	r1, [sp, #120]	; 0x78
 80086f0:	390a      	subs	r1, #10
 80086f2:	bf18      	it	ne
 80086f4:	2101      	movne	r1, #1
 80086f6:	9100      	str	r1, [sp, #0]
 80086f8:	9921      	ldr	r1, [sp, #132]	; 0x84
 80086fa:	f001 0120 	and.w	r1, r1, #32
 80086fe:	fa4f fb81 	sxtb.w	fp, r1
 8008702:	9921      	ldr	r1, [sp, #132]	; 0x84
 8008704:	f011 0110 	ands.w	r1, r1, #16
 8008708:	9101      	str	r1, [sp, #4]
 800870a:	d003      	beq.n	8008714 <number+0x38>
 800870c:	9921      	ldr	r1, [sp, #132]	; 0x84
 800870e:	f021 0101 	bic.w	r1, r1, #1
 8008712:	9121      	str	r1, [sp, #132]	; 0x84
 8008714:	9921      	ldr	r1, [sp, #132]	; 0x84
 8008716:	f011 0102 	ands.w	r1, r1, #2
 800871a:	d049      	beq.n	80087b0 <number+0xd4>
 800871c:	2a00      	cmp	r2, #0
 800871e:	f173 0100 	sbcs.w	r1, r3, #0
 8008722:	f2c0 80bf 	blt.w	80088a4 <number+0x1c8>
 8008726:	9921      	ldr	r1, [sp, #132]	; 0x84
 8008728:	0749      	lsls	r1, r1, #29
 800872a:	f100 80ac 	bmi.w	8008886 <number+0x1aa>
 800872e:	9921      	ldr	r1, [sp, #132]	; 0x84
 8008730:	f011 0108 	ands.w	r1, r1, #8
 8008734:	d03c      	beq.n	80087b0 <number+0xd4>
 8008736:	991f      	ldr	r1, [sp, #124]	; 0x7c
 8008738:	3901      	subs	r1, #1
 800873a:	911f      	str	r1, [sp, #124]	; 0x7c
 800873c:	2120      	movs	r1, #32
 800873e:	9102      	str	r1, [sp, #8]
 8008740:	9900      	ldr	r1, [sp, #0]
 8008742:	2900      	cmp	r1, #0
 8008744:	d138      	bne.n	80087b8 <number+0xdc>
 8008746:	ea52 0103 	orrs.w	r1, r2, r3
 800874a:	d03e      	beq.n	80087ca <number+0xee>
 800874c:	991e      	ldr	r1, [sp, #120]	; 0x78
 800874e:	290a      	cmp	r1, #10
 8008750:	f000 80b7 	beq.w	80088c2 <number+0x1e6>
 8008754:	2910      	cmp	r1, #16
 8008756:	f101 39ff 	add.w	r9, r1, #4294967295	; 0xffffffff
 800875a:	bf0a      	itet	eq
 800875c:	2604      	moveq	r6, #4
 800875e:	2603      	movne	r6, #3
 8008760:	f04f 090f 	moveq.w	r9, #15
 8008764:	f1a6 0120 	sub.w	r1, r6, #32
 8008768:	f10d 0713 	add.w	r7, sp, #19
 800876c:	2500      	movs	r5, #0
 800876e:	f1c6 0a20 	rsb	sl, r6, #32
 8008772:	9403      	str	r4, [sp, #12]
 8008774:	468e      	mov	lr, r1
 8008776:	e000      	b.n	800877a <number+0x9e>
 8008778:	4605      	mov	r5, r0
 800877a:	fa23 fc06 	lsr.w	ip, r3, r6
 800877e:	fa03 f10a 	lsl.w	r1, r3, sl
 8008782:	fa23 f40e 	lsr.w	r4, r3, lr
 8008786:	4663      	mov	r3, ip
 8008788:	fa22 f006 	lsr.w	r0, r2, r6
 800878c:	4308      	orrs	r0, r1
 800878e:	b2d1      	uxtb	r1, r2
 8008790:	ea40 0204 	orr.w	r2, r0, r4
 8008794:	484f      	ldr	r0, [pc, #316]	; (80088d4 <number+0x1f8>)
 8008796:	ea01 0109 	and.w	r1, r1, r9
 800879a:	5c41      	ldrb	r1, [r0, r1]
 800879c:	1c68      	adds	r0, r5, #1
 800879e:	ea4b 0101 	orr.w	r1, fp, r1
 80087a2:	f807 1f01 	strb.w	r1, [r7, #1]!
 80087a6:	ea52 0103 	orrs.w	r1, r2, r3
 80087aa:	d1e5      	bne.n	8008778 <number+0x9c>
 80087ac:	9c03      	ldr	r4, [sp, #12]
 80087ae:	e011      	b.n	80087d4 <number+0xf8>
 80087b0:	9102      	str	r1, [sp, #8]
 80087b2:	9900      	ldr	r1, [sp, #0]
 80087b4:	2900      	cmp	r1, #0
 80087b6:	d0c6      	beq.n	8008746 <number+0x6a>
 80087b8:	991e      	ldr	r1, [sp, #120]	; 0x78
 80087ba:	2910      	cmp	r1, #16
 80087bc:	991f      	ldr	r1, [sp, #124]	; 0x7c
 80087be:	d068      	beq.n	8008892 <number+0x1b6>
 80087c0:	3901      	subs	r1, #1
 80087c2:	911f      	str	r1, [sp, #124]	; 0x7c
 80087c4:	ea52 0103 	orrs.w	r1, r2, r3
 80087c8:	d1c0      	bne.n	800874c <number+0x70>
 80087ca:	2330      	movs	r3, #48	; 0x30
 80087cc:	2500      	movs	r5, #0
 80087ce:	2001      	movs	r0, #1
 80087d0:	f88d 3014 	strb.w	r3, [sp, #20]
 80087d4:	9b20      	ldr	r3, [sp, #128]	; 0x80
 80087d6:	4283      	cmp	r3, r0
 80087d8:	bfb8      	it	lt
 80087da:	4603      	movlt	r3, r0
 80087dc:	461a      	mov	r2, r3
 80087de:	9b1f      	ldr	r3, [sp, #124]	; 0x7c
 80087e0:	1a9e      	subs	r6, r3, r2
 80087e2:	9b21      	ldr	r3, [sp, #132]	; 0x84
 80087e4:	f013 0f11 	tst.w	r3, #17
 80087e8:	d109      	bne.n	80087fe <number+0x122>
 80087ea:	1e73      	subs	r3, r6, #1
 80087ec:	d467      	bmi.n	80088be <number+0x1e2>
 80087ee:	2320      	movs	r3, #32
 80087f0:	4426      	add	r6, r4
 80087f2:	f804 3b01 	strb.w	r3, [r4], #1
 80087f6:	42b4      	cmp	r4, r6
 80087f8:	d1fb      	bne.n	80087f2 <number+0x116>
 80087fa:	f04f 36ff 	mov.w	r6, #4294967295	; 0xffffffff
 80087fe:	9b02      	ldr	r3, [sp, #8]
 8008800:	b10b      	cbz	r3, 8008806 <number+0x12a>
 8008802:	7023      	strb	r3, [r4, #0]
 8008804:	3401      	adds	r4, #1
 8008806:	9b00      	ldr	r3, [sp, #0]
 8008808:	b14b      	cbz	r3, 800881e <number+0x142>
 800880a:	2330      	movs	r3, #48	; 0x30
 800880c:	7023      	strb	r3, [r4, #0]
 800880e:	9b1e      	ldr	r3, [sp, #120]	; 0x78
 8008810:	2b10      	cmp	r3, #16
 8008812:	bf05      	ittet	eq
 8008814:	f04b 0358 	orreq.w	r3, fp, #88	; 0x58
 8008818:	7063      	strbeq	r3, [r4, #1]
 800881a:	3401      	addne	r4, #1
 800881c:	3402      	addeq	r4, #2
 800881e:	9b01      	ldr	r3, [sp, #4]
 8008820:	b973      	cbnz	r3, 8008840 <number+0x164>
 8008822:	9b21      	ldr	r3, [sp, #132]	; 0x84
 8008824:	f013 0f01 	tst.w	r3, #1
 8008828:	bf0c      	ite	eq
 800882a:	2320      	moveq	r3, #32
 800882c:	2330      	movne	r3, #48	; 0x30
 800882e:	1e71      	subs	r1, r6, #1
 8008830:	d443      	bmi.n	80088ba <number+0x1de>
 8008832:	4426      	add	r6, r4
 8008834:	f804 3b01 	strb.w	r3, [r4], #1
 8008838:	42b4      	cmp	r4, r6
 800883a:	d1fb      	bne.n	8008834 <number+0x158>
 800883c:	f04f 36ff 	mov.w	r6, #4294967295	; 0xffffffff
 8008840:	4290      	cmp	r0, r2
 8008842:	da06      	bge.n	8008852 <number+0x176>
 8008844:	2130      	movs	r1, #48	; 0x30
 8008846:	1a13      	subs	r3, r2, r0
 8008848:	4423      	add	r3, r4
 800884a:	f804 1b01 	strb.w	r1, [r4], #1
 800884e:	429c      	cmp	r4, r3
 8008850:	d1fb      	bne.n	800884a <number+0x16e>
 8008852:	2d00      	cmp	r5, #0
 8008854:	db3c      	blt.n	80088d0 <number+0x1f4>
 8008856:	3501      	adds	r5, #1
 8008858:	a805      	add	r0, sp, #20
 800885a:	1943      	adds	r3, r0, r5
 800885c:	1e62      	subs	r2, r4, #1
 800885e:	f813 1d01 	ldrb.w	r1, [r3, #-1]!
 8008862:	4283      	cmp	r3, r0
 8008864:	f802 1f01 	strb.w	r1, [r2, #1]!
 8008868:	d1f9      	bne.n	800885e <number+0x182>
 800886a:	1960      	adds	r0, r4, r5
 800886c:	2e00      	cmp	r6, #0
 800886e:	dd05      	ble.n	800887c <number+0x1a0>
 8008870:	2320      	movs	r3, #32
 8008872:	4406      	add	r6, r0
 8008874:	f800 3b01 	strb.w	r3, [r0], #1
 8008878:	4286      	cmp	r6, r0
 800887a:	d1fb      	bne.n	8008874 <number+0x198>
 800887c:	b016      	add	sp, #88	; 0x58
 800887e:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8008882:	9100      	str	r1, [sp, #0]
 8008884:	e738      	b.n	80086f8 <number+0x1c>
 8008886:	991f      	ldr	r1, [sp, #124]	; 0x7c
 8008888:	3901      	subs	r1, #1
 800888a:	911f      	str	r1, [sp, #124]	; 0x7c
 800888c:	212b      	movs	r1, #43	; 0x2b
 800888e:	9102      	str	r1, [sp, #8]
 8008890:	e78f      	b.n	80087b2 <number+0xd6>
 8008892:	3902      	subs	r1, #2
 8008894:	911f      	str	r1, [sp, #124]	; 0x7c
 8008896:	ea52 0103 	orrs.w	r1, r2, r3
 800889a:	d096      	beq.n	80087ca <number+0xee>
 800889c:	f04f 090f 	mov.w	r9, #15
 80088a0:	2604      	movs	r6, #4
 80088a2:	e75f      	b.n	8008764 <number+0x88>
 80088a4:	991f      	ldr	r1, [sp, #124]	; 0x7c
 80088a6:	4252      	negs	r2, r2
 80088a8:	f101 31ff 	add.w	r1, r1, #4294967295	; 0xffffffff
 80088ac:	911f      	str	r1, [sp, #124]	; 0x7c
 80088ae:	f04f 012d 	mov.w	r1, #45	; 0x2d
 80088b2:	eb63 0343 	sbc.w	r3, r3, r3, lsl #1
 80088b6:	9102      	str	r1, [sp, #8]
 80088b8:	e77b      	b.n	80087b2 <number+0xd6>
 80088ba:	460e      	mov	r6, r1
 80088bc:	e7c0      	b.n	8008840 <number+0x164>
 80088be:	461e      	mov	r6, r3
 80088c0:	e79d      	b.n	80087fe <number+0x122>
 80088c2:	ad05      	add	r5, sp, #20
 80088c4:	4628      	mov	r0, r5
 80088c6:	f7ff fe77 	bl	80085b8 <put_dec>
 80088ca:	1b40      	subs	r0, r0, r5
 80088cc:	1e45      	subs	r5, r0, #1
 80088ce:	e781      	b.n	80087d4 <number+0xf8>
 80088d0:	4620      	mov	r0, r4
 80088d2:	e7cb      	b.n	800886c <number+0x190>
 80088d4:	0800ec10 	.word	0x0800ec10

080088d8 <simple_strtoul>:
 80088d8:	b5f0      	push	{r4, r5, r6, r7, lr}
 80088da:	f990 5000 	ldrsb.w	r5, [r0]
 80088de:	4607      	mov	r7, r0
 80088e0:	2d30      	cmp	r5, #48	; 0x30
 80088e2:	d028      	beq.n	8008936 <simple_strtoul+0x5e>
 80088e4:	f8df e094 	ldr.w	lr, [pc, #148]	; 800897c <simple_strtoul+0xa4>
 80088e8:	b2eb      	uxtb	r3, r5
 80088ea:	f81e 4003 	ldrb.w	r4, [lr, r3]
 80088ee:	bb9a      	cbnz	r2, 8008958 <simple_strtoul+0x80>
 80088f0:	220a      	movs	r2, #10
 80088f2:	f004 0044 	and.w	r0, r4, #68	; 0x44
 80088f6:	b1d8      	cbz	r0, 8008930 <simple_strtoul+0x58>
 80088f8:	2000      	movs	r0, #0
 80088fa:	e00d      	b.n	8008918 <simple_strtoul+0x40>
 80088fc:	f1a5 0330 	sub.w	r3, r5, #48	; 0x30
 8008900:	4293      	cmp	r3, r2
 8008902:	d215      	bcs.n	8008930 <simple_strtoul+0x58>
 8008904:	f917 5f01 	ldrsb.w	r5, [r7, #1]!
 8008908:	fb02 3000 	mla	r0, r2, r0, r3
 800890c:	b2eb      	uxtb	r3, r5
 800890e:	f81e 4003 	ldrb.w	r4, [lr, r3]
 8008912:	f014 0f44 	tst.w	r4, #68	; 0x44
 8008916:	d00b      	beq.n	8008930 <simple_strtoul+0x58>
 8008918:	0766      	lsls	r6, r4, #29
 800891a:	d4ef      	bmi.n	80088fc <simple_strtoul+0x24>
 800891c:	3b20      	subs	r3, #32
 800891e:	f014 0f02 	tst.w	r4, #2
 8008922:	b2db      	uxtb	r3, r3
 8008924:	bf14      	ite	ne
 8008926:	3b37      	subne	r3, #55	; 0x37
 8008928:	f1a5 0337 	subeq.w	r3, r5, #55	; 0x37
 800892c:	4293      	cmp	r3, r2
 800892e:	d3e9      	bcc.n	8008904 <simple_strtoul+0x2c>
 8008930:	b101      	cbz	r1, 8008934 <simple_strtoul+0x5c>
 8008932:	600f      	str	r7, [r1, #0]
 8008934:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8008936:	f990 5001 	ldrsb.w	r5, [r0, #1]
 800893a:	3001      	adds	r0, #1
 800893c:	2d78      	cmp	r5, #120	; 0x78
 800893e:	d00e      	beq.n	800895e <simple_strtoul+0x86>
 8008940:	f8df e038 	ldr.w	lr, [pc, #56]	; 800897c <simple_strtoul+0xa4>
 8008944:	b2eb      	uxtb	r3, r5
 8008946:	f81e 4003 	ldrb.w	r4, [lr, r3]
 800894a:	4607      	mov	r7, r0
 800894c:	f004 0044 	and.w	r0, r4, #68	; 0x44
 8008950:	2a00      	cmp	r2, #0
 8008952:	d1d0      	bne.n	80088f6 <simple_strtoul+0x1e>
 8008954:	2208      	movs	r2, #8
 8008956:	e7ce      	b.n	80088f6 <simple_strtoul+0x1e>
 8008958:	f004 0044 	and.w	r0, r4, #68	; 0x44
 800895c:	e7cb      	b.n	80088f6 <simple_strtoul+0x1e>
 800895e:	f997 6002 	ldrsb.w	r6, [r7, #2]
 8008962:	f8df e018 	ldr.w	lr, [pc, #24]	; 800897c <simple_strtoul+0xa4>
 8008966:	b2f3      	uxtb	r3, r6
 8008968:	f81e 4003 	ldrb.w	r4, [lr, r3]
 800896c:	f014 0f44 	tst.w	r4, #68	; 0x44
 8008970:	d0e8      	beq.n	8008944 <simple_strtoul+0x6c>
 8008972:	3702      	adds	r7, #2
 8008974:	4635      	mov	r5, r6
 8008976:	2210      	movs	r2, #16
 8008978:	e7be      	b.n	80088f8 <simple_strtoul+0x20>
 800897a:	bf00      	nop
 800897c:	200009c8 	.word	0x200009c8

08008980 <simple_strtol>:
 8008980:	b510      	push	{r4, lr}
 8008982:	f990 4000 	ldrsb.w	r4, [r0]
 8008986:	2c2d      	cmp	r4, #45	; 0x2d
 8008988:	d003      	beq.n	8008992 <simple_strtol+0x12>
 800898a:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800898e:	f7ff bfa3 	b.w	80088d8 <simple_strtoul>
 8008992:	3001      	adds	r0, #1
 8008994:	f7ff ffa0 	bl	80088d8 <simple_strtoul>
 8008998:	4240      	negs	r0, r0
 800899a:	bd10      	pop	{r4, pc}

0800899c <ustrtoul>:
 800899c:	b510      	push	{r4, lr}
 800899e:	460c      	mov	r4, r1
 80089a0:	f7ff ff9a 	bl	80088d8 <simple_strtoul>
 80089a4:	680a      	ldr	r2, [r1, #0]
 80089a6:	f992 3000 	ldrsb.w	r3, [r2]
 80089aa:	3b47      	subs	r3, #71	; 0x47
 80089ac:	2b24      	cmp	r3, #36	; 0x24
 80089ae:	d81b      	bhi.n	80089e8 <ustrtoul+0x4c>
 80089b0:	e8df f003 	tbb	[pc, r3]
 80089b4:	1a1a1a13 	.word	0x1a1a1a13
 80089b8:	1a141a15 	.word	0x1a141a15
 80089bc:	1a1a1a1a 	.word	0x1a1a1a1a
 80089c0:	1a1a1a1a 	.word	0x1a1a1a1a
 80089c4:	1a1a1a1a 	.word	0x1a1a1a1a
 80089c8:	1a1a1a1a 	.word	0x1a1a1a1a
 80089cc:	1a1a1a1a 	.word	0x1a1a1a1a
 80089d0:	1a1a1a1a 	.word	0x1a1a1a1a
 80089d4:	1a1a1a1a 	.word	0x1a1a1a1a
 80089d8:	15          	.byte	0x15
 80089d9:	00          	.byte	0x00
 80089da:	0280      	lsls	r0, r0, #10
 80089dc:	0280      	lsls	r0, r0, #10
 80089de:	f992 3001 	ldrsb.w	r3, [r2, #1]
 80089e2:	0280      	lsls	r0, r0, #10
 80089e4:	2b69      	cmp	r3, #105	; 0x69
 80089e6:	d000      	beq.n	80089ea <ustrtoul+0x4e>
 80089e8:	bd10      	pop	{r4, pc}
 80089ea:	f992 3002 	ldrsb.w	r3, [r2, #2]
 80089ee:	2b42      	cmp	r3, #66	; 0x42
 80089f0:	d002      	beq.n	80089f8 <ustrtoul+0x5c>
 80089f2:	3202      	adds	r2, #2
 80089f4:	6022      	str	r2, [r4, #0]
 80089f6:	bd10      	pop	{r4, pc}
 80089f8:	3203      	adds	r2, #3
 80089fa:	6022      	str	r2, [r4, #0]
 80089fc:	bd10      	pop	{r4, pc}
 80089fe:	bf00      	nop

08008a00 <simple_strtoull>:
 8008a00:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8008a04:	f990 e000 	ldrsb.w	lr, [r0]
 8008a08:	b082      	sub	sp, #8
 8008a0a:	f1be 0f30 	cmp.w	lr, #48	; 0x30
 8008a0e:	4684      	mov	ip, r0
 8008a10:	9101      	str	r1, [sp, #4]
 8008a12:	4614      	mov	r4, r2
 8008a14:	d042      	beq.n	8008a9c <simple_strtoull+0x9c>
 8008a16:	4a34      	ldr	r2, [pc, #208]	; (8008ae8 <simple_strtoull+0xe8>)
 8008a18:	fa5f f38e 	uxtb.w	r3, lr
 8008a1c:	f812 9003 	ldrb.w	r9, [r2, r3]
 8008a20:	2c00      	cmp	r4, #0
 8008a22:	d14d      	bne.n	8008ac0 <simple_strtoull+0xc0>
 8008a24:	240a      	movs	r4, #10
 8008a26:	f009 0144 	and.w	r1, r9, #68	; 0x44
 8008a2a:	2900      	cmp	r1, #0
 8008a2c:	d059      	beq.n	8008ae2 <simple_strtoull+0xe2>
 8008a2e:	2500      	movs	r5, #0
 8008a30:	2000      	movs	r0, #0
 8008a32:	2100      	movs	r1, #0
 8008a34:	e01a      	b.n	8008a6c <simple_strtoull+0x6c>
 8008a36:	f1ae 0630 	sub.w	r6, lr, #48	; 0x30
 8008a3a:	17f7      	asrs	r7, r6, #31
 8008a3c:	42af      	cmp	r7, r5
 8008a3e:	bf08      	it	eq
 8008a40:	42a6      	cmpeq	r6, r4
 8008a42:	d224      	bcs.n	8008a8e <simple_strtoull+0x8e>
 8008a44:	fb00 f305 	mul.w	r3, r0, r5
 8008a48:	fba0 ab04 	umull	sl, fp, r0, r4
 8008a4c:	fb04 3301 	mla	r3, r4, r1, r3
 8008a50:	f91c ef01 	ldrsb.w	lr, [ip, #1]!
 8008a54:	449b      	add	fp, r3
 8008a56:	fa5f f38e 	uxtb.w	r3, lr
 8008a5a:	f812 9003 	ldrb.w	r9, [r2, r3]
 8008a5e:	eb16 000a 	adds.w	r0, r6, sl
 8008a62:	eb47 010b 	adc.w	r1, r7, fp
 8008a66:	f019 0f44 	tst.w	r9, #68	; 0x44
 8008a6a:	d010      	beq.n	8008a8e <simple_strtoull+0x8e>
 8008a6c:	f019 0f04 	tst.w	r9, #4
 8008a70:	d1e1      	bne.n	8008a36 <simple_strtoull+0x36>
 8008a72:	3b20      	subs	r3, #32
 8008a74:	f019 0f02 	tst.w	r9, #2
 8008a78:	b2db      	uxtb	r3, r3
 8008a7a:	bf14      	ite	ne
 8008a7c:	f1a3 0637 	subne.w	r6, r3, #55	; 0x37
 8008a80:	f1ae 0637 	subeq.w	r6, lr, #55	; 0x37
 8008a84:	17f7      	asrs	r7, r6, #31
 8008a86:	42af      	cmp	r7, r5
 8008a88:	bf08      	it	eq
 8008a8a:	42a6      	cmpeq	r6, r4
 8008a8c:	d3da      	bcc.n	8008a44 <simple_strtoull+0x44>
 8008a8e:	9b01      	ldr	r3, [sp, #4]
 8008a90:	b10b      	cbz	r3, 8008a96 <simple_strtoull+0x96>
 8008a92:	f8c3 c000 	str.w	ip, [r3]
 8008a96:	b002      	add	sp, #8
 8008a98:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8008a9c:	f990 e001 	ldrsb.w	lr, [r0, #1]
 8008aa0:	1c41      	adds	r1, r0, #1
 8008aa2:	f1be 0f78 	cmp.w	lr, #120	; 0x78
 8008aa6:	d00e      	beq.n	8008ac6 <simple_strtoull+0xc6>
 8008aa8:	4a0f      	ldr	r2, [pc, #60]	; (8008ae8 <simple_strtoull+0xe8>)
 8008aaa:	fa5f f38e 	uxtb.w	r3, lr
 8008aae:	f812 9003 	ldrb.w	r9, [r2, r3]
 8008ab2:	468c      	mov	ip, r1
 8008ab4:	f009 0144 	and.w	r1, r9, #68	; 0x44
 8008ab8:	2c00      	cmp	r4, #0
 8008aba:	d1b6      	bne.n	8008a2a <simple_strtoull+0x2a>
 8008abc:	2408      	movs	r4, #8
 8008abe:	e7b4      	b.n	8008a2a <simple_strtoull+0x2a>
 8008ac0:	f009 0144 	and.w	r1, r9, #68	; 0x44
 8008ac4:	e7b1      	b.n	8008a2a <simple_strtoull+0x2a>
 8008ac6:	f990 0002 	ldrsb.w	r0, [r0, #2]
 8008aca:	4a07      	ldr	r2, [pc, #28]	; (8008ae8 <simple_strtoull+0xe8>)
 8008acc:	b2c3      	uxtb	r3, r0
 8008ace:	f812 9003 	ldrb.w	r9, [r2, r3]
 8008ad2:	f019 0f44 	tst.w	r9, #68	; 0x44
 8008ad6:	d0e8      	beq.n	8008aaa <simple_strtoull+0xaa>
 8008ad8:	f10c 0c02 	add.w	ip, ip, #2
 8008adc:	4686      	mov	lr, r0
 8008ade:	2410      	movs	r4, #16
 8008ae0:	e7a5      	b.n	8008a2e <simple_strtoull+0x2e>
 8008ae2:	2000      	movs	r0, #0
 8008ae4:	2100      	movs	r1, #0
 8008ae6:	e7d2      	b.n	8008a8e <simple_strtoull+0x8e>
 8008ae8:	200009c8 	.word	0x200009c8

08008aec <vsprintf>:
 8008aec:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8008af0:	f991 3000 	ldrsb.w	r3, [r1]
 8008af4:	b096      	sub	sp, #88	; 0x58
 8008af6:	4683      	mov	fp, r0
 8008af8:	2b00      	cmp	r3, #0
 8008afa:	f000 8340 	beq.w	800917e <vsprintf+0x692>
 8008afe:	460d      	mov	r5, r1
 8008b00:	4617      	mov	r7, r2
 8008b02:	9005      	str	r0, [sp, #20]
 8008b04:	f8df a7b8 	ldr.w	sl, [pc, #1976]	; 80092c0 <vsprintf+0x7d4>
 8008b08:	e009      	b.n	8008b1e <vsprintf+0x32>
 8008b0a:	f88b 3000 	strb.w	r3, [fp]
 8008b0e:	f995 3001 	ldrsb.w	r3, [r5, #1]
 8008b12:	f10b 0b01 	add.w	fp, fp, #1
 8008b16:	3501      	adds	r5, #1
 8008b18:	2b00      	cmp	r3, #0
 8008b1a:	f000 8132 	beq.w	8008d82 <vsprintf+0x296>
 8008b1e:	2b25      	cmp	r3, #37	; 0x25
 8008b20:	d1f3      	bne.n	8008b0a <vsprintf+0x1e>
 8008b22:	2600      	movs	r6, #0
 8008b24:	f995 1001 	ldrsb.w	r1, [r5, #1]
 8008b28:	1c68      	adds	r0, r5, #1
 8008b2a:	f1a1 0320 	sub.w	r3, r1, #32
 8008b2e:	2b10      	cmp	r3, #16
 8008b30:	d81e      	bhi.n	8008b70 <vsprintf+0x84>
 8008b32:	e8df f003 	tbb	[pc, r3]
 8008b36:	1d19      	.short	0x1d19
 8008b38:	1d1d151d 	.word	0x1d1d151d
 8008b3c:	1d1d1d1d 	.word	0x1d1d1d1d
 8008b40:	0d1d111d 	.word	0x0d1d111d
 8008b44:	1d1d      	.short	0x1d1d
 8008b46:	09          	.byte	0x09
 8008b47:	00          	.byte	0x00
 8008b48:	f046 0601 	orr.w	r6, r6, #1
 8008b4c:	4605      	mov	r5, r0
 8008b4e:	e7e9      	b.n	8008b24 <vsprintf+0x38>
 8008b50:	f046 0610 	orr.w	r6, r6, #16
 8008b54:	4605      	mov	r5, r0
 8008b56:	e7e5      	b.n	8008b24 <vsprintf+0x38>
 8008b58:	f046 0604 	orr.w	r6, r6, #4
 8008b5c:	4605      	mov	r5, r0
 8008b5e:	e7e1      	b.n	8008b24 <vsprintf+0x38>
 8008b60:	f046 0640 	orr.w	r6, r6, #64	; 0x40
 8008b64:	4605      	mov	r5, r0
 8008b66:	e7dd      	b.n	8008b24 <vsprintf+0x38>
 8008b68:	f046 0608 	orr.w	r6, r6, #8
 8008b6c:	4605      	mov	r5, r0
 8008b6e:	e7d9      	b.n	8008b24 <vsprintf+0x38>
 8008b70:	f1a1 0330 	sub.w	r3, r1, #48	; 0x30
 8008b74:	b2db      	uxtb	r3, r3
 8008b76:	2b09      	cmp	r3, #9
 8008b78:	f200 80d9 	bhi.w	8008d2e <vsprintf+0x242>
 8008b7c:	2400      	movs	r4, #0
 8008b7e:	eb04 0484 	add.w	r4, r4, r4, lsl #2
 8008b82:	eb01 0444 	add.w	r4, r1, r4, lsl #1
 8008b86:	f910 1f01 	ldrsb.w	r1, [r0, #1]!
 8008b8a:	3c30      	subs	r4, #48	; 0x30
 8008b8c:	f1a1 0330 	sub.w	r3, r1, #48	; 0x30
 8008b90:	b2db      	uxtb	r3, r3
 8008b92:	2b09      	cmp	r3, #9
 8008b94:	d9f3      	bls.n	8008b7e <vsprintf+0x92>
 8008b96:	292e      	cmp	r1, #46	; 0x2e
 8008b98:	f000 80d1 	beq.w	8008d3e <vsprintf+0x252>
 8008b9c:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
 8008ba0:	2968      	cmp	r1, #104	; 0x68
 8008ba2:	d067      	beq.n	8008c74 <vsprintf+0x188>
 8008ba4:	296c      	cmp	r1, #108	; 0x6c
 8008ba6:	f000 80f5 	beq.w	8008d94 <vsprintf+0x2a8>
 8008baa:	294c      	cmp	r1, #76	; 0x4c
 8008bac:	d062      	beq.n	8008c74 <vsprintf+0x188>
 8008bae:	f021 0220 	bic.w	r2, r1, #32
 8008bb2:	2a5a      	cmp	r2, #90	; 0x5a
 8008bb4:	d05e      	beq.n	8008c74 <vsprintf+0x188>
 8008bb6:	2974      	cmp	r1, #116	; 0x74
 8008bb8:	d05c      	beq.n	8008c74 <vsprintf+0x188>
 8008bba:	f04f 3eff 	mov.w	lr, #4294967295	; 0xffffffff
 8008bbe:	3925      	subs	r1, #37	; 0x25
 8008bc0:	4605      	mov	r5, r0
 8008bc2:	2953      	cmp	r1, #83	; 0x53
 8008bc4:	f200 80d3 	bhi.w	8008d6e <vsprintf+0x282>
 8008bc8:	e8df f011 	tbh	[pc, r1, lsl #1]
 8008bcc:	00d10230 	.word	0x00d10230
 8008bd0:	00d100d1 	.word	0x00d100d1
 8008bd4:	00d100d1 	.word	0x00d100d1
 8008bd8:	00d100d1 	.word	0x00d100d1
 8008bdc:	00d100d1 	.word	0x00d100d1
 8008be0:	00d100d1 	.word	0x00d100d1
 8008be4:	00d100d1 	.word	0x00d100d1
 8008be8:	00d100d1 	.word	0x00d100d1
 8008bec:	00d100d1 	.word	0x00d100d1
 8008bf0:	00d100d1 	.word	0x00d100d1
 8008bf4:	00d100d1 	.word	0x00d100d1
 8008bf8:	00d100d1 	.word	0x00d100d1
 8008bfc:	00d100d1 	.word	0x00d100d1
 8008c00:	00d100d1 	.word	0x00d100d1
 8008c04:	00d100d1 	.word	0x00d100d1
 8008c08:	00d100d1 	.word	0x00d100d1
 8008c0c:	00d100d1 	.word	0x00d100d1
 8008c10:	00d100d1 	.word	0x00d100d1
 8008c14:	00d100d1 	.word	0x00d100d1
 8008c18:	00d100d1 	.word	0x00d100d1
 8008c1c:	00d100d1 	.word	0x00d100d1
 8008c20:	00d100d1 	.word	0x00d100d1
 8008c24:	00d100d1 	.word	0x00d100d1
 8008c28:	00d100d1 	.word	0x00d100d1
 8008c2c:	00d100d1 	.word	0x00d100d1
 8008c30:	01a000d1 	.word	0x01a000d1
 8008c34:	00d100d1 	.word	0x00d100d1
 8008c38:	00d100d1 	.word	0x00d100d1
 8008c3c:	00d100d1 	.word	0x00d100d1
 8008c40:	00d100d1 	.word	0x00d100d1
 8008c44:	00d100d1 	.word	0x00d100d1
 8008c48:	022001fe 	.word	0x022001fe
 8008c4c:	00d100d1 	.word	0x00d100d1
 8008c50:	00d100d1 	.word	0x00d100d1
 8008c54:	00d10220 	.word	0x00d10220
 8008c58:	00d100d1 	.word	0x00d100d1
 8008c5c:	024100d1 	.word	0x024100d1
 8008c60:	01dd0234 	.word	0x01dd0234
 8008c64:	00d100d1 	.word	0x00d100d1
 8008c68:	00d101d2 	.word	0x00d101d2
 8008c6c:	00d10232 	.word	0x00d10232
 8008c70:	019e00d1 	.word	0x019e00d1
 8008c74:	f990 2001 	ldrsb.w	r2, [r0, #1]
 8008c78:	468e      	mov	lr, r1
 8008c7a:	3a25      	subs	r2, #37	; 0x25
 8008c7c:	1c45      	adds	r5, r0, #1
 8008c7e:	2a53      	cmp	r2, #83	; 0x53
 8008c80:	d875      	bhi.n	8008d6e <vsprintf+0x282>
 8008c82:	e8df f012 	tbh	[pc, r2, lsl #1]
 8008c86:	01d3      	.short	0x01d3
 8008c88:	00740074 	.word	0x00740074
 8008c8c:	00740074 	.word	0x00740074
 8008c90:	00740074 	.word	0x00740074
 8008c94:	00740074 	.word	0x00740074
 8008c98:	00740074 	.word	0x00740074
 8008c9c:	00740074 	.word	0x00740074
 8008ca0:	00740074 	.word	0x00740074
 8008ca4:	00740074 	.word	0x00740074
 8008ca8:	00740074 	.word	0x00740074
 8008cac:	00740074 	.word	0x00740074
 8008cb0:	00740074 	.word	0x00740074
 8008cb4:	00740074 	.word	0x00740074
 8008cb8:	00740074 	.word	0x00740074
 8008cbc:	00740074 	.word	0x00740074
 8008cc0:	00740074 	.word	0x00740074
 8008cc4:	00740074 	.word	0x00740074
 8008cc8:	00740074 	.word	0x00740074
 8008ccc:	00740074 	.word	0x00740074
 8008cd0:	00740074 	.word	0x00740074
 8008cd4:	00740074 	.word	0x00740074
 8008cd8:	00740074 	.word	0x00740074
 8008cdc:	00740074 	.word	0x00740074
 8008ce0:	00740074 	.word	0x00740074
 8008ce4:	00740074 	.word	0x00740074
 8008ce8:	00740074 	.word	0x00740074
 8008cec:	00740143 	.word	0x00740143
 8008cf0:	00740074 	.word	0x00740074
 8008cf4:	00740074 	.word	0x00740074
 8008cf8:	00740074 	.word	0x00740074
 8008cfc:	00740074 	.word	0x00740074
 8008d00:	01a10074 	.word	0x01a10074
 8008d04:	007401c3 	.word	0x007401c3
 8008d08:	00740074 	.word	0x00740074
 8008d0c:	01c30074 	.word	0x01c30074
 8008d10:	00740074 	.word	0x00740074
 8008d14:	00740074 	.word	0x00740074
 8008d18:	01d701e2 	.word	0x01d701e2
 8008d1c:	00740180 	.word	0x00740180
 8008d20:	01750074 	.word	0x01750074
 8008d24:	01d50074 	.word	0x01d50074
 8008d28:	00740074 	.word	0x00740074
 8008d2c:	0141      	.short	0x0141
 8008d2e:	292a      	cmp	r1, #42	; 0x2a
 8008d30:	f000 8212 	beq.w	8009158 <vsprintf+0x66c>
 8008d34:	292e      	cmp	r1, #46	; 0x2e
 8008d36:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
 8008d3a:	f47f af2f 	bne.w	8008b9c <vsprintf+0xb0>
 8008d3e:	f990 1001 	ldrsb.w	r1, [r0, #1]
 8008d42:	1c42      	adds	r2, r0, #1
 8008d44:	f1a1 0330 	sub.w	r3, r1, #48	; 0x30
 8008d48:	b2db      	uxtb	r3, r3
 8008d4a:	2b09      	cmp	r3, #9
 8008d4c:	f200 80d6 	bhi.w	8008efc <vsprintf+0x410>
 8008d50:	4610      	mov	r0, r2
 8008d52:	2300      	movs	r3, #0
 8008d54:	eb03 0383 	add.w	r3, r3, r3, lsl #2
 8008d58:	eb01 0343 	add.w	r3, r1, r3, lsl #1
 8008d5c:	f910 1f01 	ldrsb.w	r1, [r0, #1]!
 8008d60:	3b30      	subs	r3, #48	; 0x30
 8008d62:	f1a1 0230 	sub.w	r2, r1, #48	; 0x30
 8008d66:	b2d2      	uxtb	r2, r2
 8008d68:	2a09      	cmp	r2, #9
 8008d6a:	d9f3      	bls.n	8008d54 <vsprintf+0x268>
 8008d6c:	e718      	b.n	8008ba0 <vsprintf+0xb4>
 8008d6e:	2325      	movs	r3, #37	; 0x25
 8008d70:	f88b 3000 	strb.w	r3, [fp]
 8008d74:	f995 3000 	ldrsb.w	r3, [r5]
 8008d78:	2b00      	cmp	r3, #0
 8008d7a:	f040 8171 	bne.w	8009060 <vsprintf+0x574>
 8008d7e:	f10b 0b01 	add.w	fp, fp, #1
 8008d82:	9b05      	ldr	r3, [sp, #20]
 8008d84:	ebab 0003 	sub.w	r0, fp, r3
 8008d88:	2300      	movs	r3, #0
 8008d8a:	f88b 3000 	strb.w	r3, [fp]
 8008d8e:	b016      	add	sp, #88	; 0x58
 8008d90:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8008d94:	f990 2001 	ldrsb.w	r2, [r0, #1]
 8008d98:	2a6c      	cmp	r2, #108	; 0x6c
 8008d9a:	f000 8150 	beq.w	800903e <vsprintf+0x552>
 8008d9e:	3a25      	subs	r2, #37	; 0x25
 8008da0:	1c45      	adds	r5, r0, #1
 8008da2:	2a53      	cmp	r2, #83	; 0x53
 8008da4:	d8e3      	bhi.n	8008d6e <vsprintf+0x282>
 8008da6:	a101      	add	r1, pc, #4	; (adr r1, 8008dac <vsprintf+0x2c0>)
 8008da8:	f851 f022 	ldr.w	pc, [r1, r2, lsl #2]
 8008dac:	0800902d 	.word	0x0800902d
 8008db0:	08008d6f 	.word	0x08008d6f
 8008db4:	08008d6f 	.word	0x08008d6f
 8008db8:	08008d6f 	.word	0x08008d6f
 8008dbc:	08008d6f 	.word	0x08008d6f
 8008dc0:	08008d6f 	.word	0x08008d6f
 8008dc4:	08008d6f 	.word	0x08008d6f
 8008dc8:	08008d6f 	.word	0x08008d6f
 8008dcc:	08008d6f 	.word	0x08008d6f
 8008dd0:	08008d6f 	.word	0x08008d6f
 8008dd4:	08008d6f 	.word	0x08008d6f
 8008dd8:	08008d6f 	.word	0x08008d6f
 8008ddc:	08008d6f 	.word	0x08008d6f
 8008de0:	08008d6f 	.word	0x08008d6f
 8008de4:	08008d6f 	.word	0x08008d6f
 8008de8:	08008d6f 	.word	0x08008d6f
 8008dec:	08008d6f 	.word	0x08008d6f
 8008df0:	08008d6f 	.word	0x08008d6f
 8008df4:	08008d6f 	.word	0x08008d6f
 8008df8:	08008d6f 	.word	0x08008d6f
 8008dfc:	08008d6f 	.word	0x08008d6f
 8008e00:	08008d6f 	.word	0x08008d6f
 8008e04:	08008d6f 	.word	0x08008d6f
 8008e08:	08008d6f 	.word	0x08008d6f
 8008e0c:	08008d6f 	.word	0x08008d6f
 8008e10:	08008d6f 	.word	0x08008d6f
 8008e14:	08008d6f 	.word	0x08008d6f
 8008e18:	08008d6f 	.word	0x08008d6f
 8008e1c:	08008d6f 	.word	0x08008d6f
 8008e20:	08008d6f 	.word	0x08008d6f
 8008e24:	08008d6f 	.word	0x08008d6f
 8008e28:	08008d6f 	.word	0x08008d6f
 8008e2c:	08008d6f 	.word	0x08008d6f
 8008e30:	08008d6f 	.word	0x08008d6f
 8008e34:	08008d6f 	.word	0x08008d6f
 8008e38:	08008d6f 	.word	0x08008d6f
 8008e3c:	08008d6f 	.word	0x08008d6f
 8008e40:	08008d6f 	.word	0x08008d6f
 8008e44:	08008d6f 	.word	0x08008d6f
 8008e48:	08008d6f 	.word	0x08008d6f
 8008e4c:	08008d6f 	.word	0x08008d6f
 8008e50:	08008d6f 	.word	0x08008d6f
 8008e54:	08008d6f 	.word	0x08008d6f
 8008e58:	08008d6f 	.word	0x08008d6f
 8008e5c:	08008d6f 	.word	0x08008d6f
 8008e60:	08008d6f 	.word	0x08008d6f
 8008e64:	08008d6f 	.word	0x08008d6f
 8008e68:	08008d6f 	.word	0x08008d6f
 8008e6c:	08008d6f 	.word	0x08008d6f
 8008e70:	08008d6f 	.word	0x08008d6f
 8008e74:	08008d6f 	.word	0x08008d6f
 8008e78:	080091a3 	.word	0x080091a3
 8008e7c:	08008d6f 	.word	0x08008d6f
 8008e80:	08008d6f 	.word	0x08008d6f
 8008e84:	08008d6f 	.word	0x08008d6f
 8008e88:	08008d6f 	.word	0x08008d6f
 8008e8c:	08008d6f 	.word	0x08008d6f
 8008e90:	08008d6f 	.word	0x08008d6f
 8008e94:	08008d6f 	.word	0x08008d6f
 8008e98:	08008d6f 	.word	0x08008d6f
 8008e9c:	08008d6f 	.word	0x08008d6f
 8008ea0:	08008d6f 	.word	0x08008d6f
 8008ea4:	08008fc9 	.word	0x08008fc9
 8008ea8:	08009009 	.word	0x08009009
 8008eac:	08008d6f 	.word	0x08008d6f
 8008eb0:	08008d6f 	.word	0x08008d6f
 8008eb4:	08008d6f 	.word	0x08008d6f
 8008eb8:	08008d6f 	.word	0x08008d6f
 8008ebc:	08009009 	.word	0x08009009
 8008ec0:	08008d6f 	.word	0x08008d6f
 8008ec4:	08008d6f 	.word	0x08008d6f
 8008ec8:	08008d6f 	.word	0x08008d6f
 8008ecc:	08008d6f 	.word	0x08008d6f
 8008ed0:	08009147 	.word	0x08009147
 8008ed4:	0800919b 	.word	0x0800919b
 8008ed8:	08008f87 	.word	0x08008f87
 8008edc:	08008d6f 	.word	0x08008d6f
 8008ee0:	08008d6f 	.word	0x08008d6f
 8008ee4:	08008f71 	.word	0x08008f71
 8008ee8:	08008d6f 	.word	0x08008d6f
 8008eec:	0800919f 	.word	0x0800919f
 8008ef0:	08008d6f 	.word	0x08008d6f
 8008ef4:	08008d6f 	.word	0x08008d6f
 8008ef8:	08008f5d 	.word	0x08008f5d
 8008efc:	292a      	cmp	r1, #42	; 0x2a
 8008efe:	f000 8144 	beq.w	800918a <vsprintf+0x69e>
 8008f02:	4610      	mov	r0, r2
 8008f04:	2300      	movs	r3, #0
 8008f06:	e64b      	b.n	8008ba0 <vsprintf+0xb4>
 8008f08:	f046 0620 	orr.w	r6, r6, #32
 8008f0c:	2210      	movs	r2, #16
 8008f0e:	f1be 0f4c 	cmp.w	lr, #76	; 0x4c
 8008f12:	f000 8083 	beq.w	800901c <vsprintf+0x530>
 8008f16:	f1be 0f6c 	cmp.w	lr, #108	; 0x6c
 8008f1a:	d022      	beq.n	8008f62 <vsprintf+0x476>
 8008f1c:	f02e 0120 	bic.w	r1, lr, #32
 8008f20:	295a      	cmp	r1, #90	; 0x5a
 8008f22:	f000 8089 	beq.w	8009038 <vsprintf+0x54c>
 8008f26:	f1be 0f74 	cmp.w	lr, #116	; 0x74
 8008f2a:	f000 812a 	beq.w	8009182 <vsprintf+0x696>
 8008f2e:	1d39      	adds	r1, r7, #4
 8008f30:	f1be 0f68 	cmp.w	lr, #104	; 0x68
 8008f34:	6838      	ldr	r0, [r7, #0]
 8008f36:	460f      	mov	r7, r1
 8008f38:	f000 811a 	beq.w	8009170 <vsprintf+0x684>
 8008f3c:	07b1      	lsls	r1, r6, #30
 8008f3e:	d415      	bmi.n	8008f6c <vsprintf+0x480>
 8008f40:	2100      	movs	r1, #0
 8008f42:	9302      	str	r3, [sp, #8]
 8008f44:	e88d 0014 	stmia.w	sp, {r2, r4}
 8008f48:	460b      	mov	r3, r1
 8008f4a:	4602      	mov	r2, r0
 8008f4c:	9603      	str	r6, [sp, #12]
 8008f4e:	4658      	mov	r0, fp
 8008f50:	f7ff fbc4 	bl	80086dc <number>
 8008f54:	f995 3001 	ldrsb.w	r3, [r5, #1]
 8008f58:	4683      	mov	fp, r0
 8008f5a:	e5dc      	b.n	8008b16 <vsprintf+0x2a>
 8008f5c:	2210      	movs	r2, #16
 8008f5e:	f046 0620 	orr.w	r6, r6, #32
 8008f62:	1d39      	adds	r1, r7, #4
 8008f64:	6838      	ldr	r0, [r7, #0]
 8008f66:	460f      	mov	r7, r1
 8008f68:	07b1      	lsls	r1, r6, #30
 8008f6a:	d5e9      	bpl.n	8008f40 <vsprintf+0x454>
 8008f6c:	17c1      	asrs	r1, r0, #31
 8008f6e:	e7e8      	b.n	8008f42 <vsprintf+0x456>
 8008f70:	6839      	ldr	r1, [r7, #0]
 8008f72:	4658      	mov	r0, fp
 8008f74:	4622      	mov	r2, r4
 8008f76:	9600      	str	r6, [sp, #0]
 8008f78:	f7ff faea 	bl	8008550 <string>
 8008f7c:	3704      	adds	r7, #4
 8008f7e:	4683      	mov	fp, r0
 8008f80:	f995 3001 	ldrsb.w	r3, [r5, #1]
 8008f84:	e5c7      	b.n	8008b16 <vsprintf+0x2a>
 8008f86:	683a      	ldr	r2, [r7, #0]
 8008f88:	1d39      	adds	r1, r7, #4
 8008f8a:	9106      	str	r1, [sp, #24]
 8008f8c:	2a00      	cmp	r2, #0
 8008f8e:	f000 810b 	beq.w	80091a8 <vsprintf+0x6bc>
 8008f92:	f995 1001 	ldrsb.w	r1, [r5, #1]
 8008f96:	3949      	subs	r1, #73	; 0x49
 8008f98:	2924      	cmp	r1, #36	; 0x24
 8008f9a:	f200 80ae 	bhi.w	80090fa <vsprintf+0x60e>
 8008f9e:	e8df f001 	tbb	[pc, r1]
 8008fa2:	aca2      	.short	0xaca2
 8008fa4:	ac68acac 	.word	0xac68acac
 8008fa8:	acacacac 	.word	0xacacacac
 8008fac:	acacacac 	.word	0xacacacac
 8008fb0:	acacacac 	.word	0xacacacac
 8008fb4:	acacacac 	.word	0xacacacac
 8008fb8:	acacacac 	.word	0xacacacac
 8008fbc:	acacacac 	.word	0xacacacac
 8008fc0:	aca0acac 	.word	0xaca0acac
 8008fc4:	acac      	.short	0xacac
 8008fc6:	66          	.byte	0x66
 8008fc7:	00          	.byte	0x00
 8008fc8:	06f3      	lsls	r3, r6, #27
 8008fca:	d40a      	bmi.n	8008fe2 <vsprintf+0x4f6>
 8008fcc:	3c01      	subs	r4, #1
 8008fce:	2c00      	cmp	r4, #0
 8008fd0:	dd07      	ble.n	8008fe2 <vsprintf+0x4f6>
 8008fd2:	2220      	movs	r2, #32
 8008fd4:	eb0b 0304 	add.w	r3, fp, r4
 8008fd8:	f80b 2b01 	strb.w	r2, [fp], #1
 8008fdc:	459b      	cmp	fp, r3
 8008fde:	d1fb      	bne.n	8008fd8 <vsprintf+0x4ec>
 8008fe0:	2400      	movs	r4, #0
 8008fe2:	683b      	ldr	r3, [r7, #0]
 8008fe4:	2c01      	cmp	r4, #1
 8008fe6:	f88b 3000 	strb.w	r3, [fp]
 8008fea:	f107 0704 	add.w	r7, r7, #4
 8008fee:	f10b 0301 	add.w	r3, fp, #1
 8008ff2:	dd05      	ble.n	8009000 <vsprintf+0x514>
 8008ff4:	2220      	movs	r2, #32
 8008ff6:	445c      	add	r4, fp
 8008ff8:	f803 2b01 	strb.w	r2, [r3], #1
 8008ffc:	42a3      	cmp	r3, r4
 8008ffe:	d1fb      	bne.n	8008ff8 <vsprintf+0x50c>
 8009000:	469b      	mov	fp, r3
 8009002:	f995 3001 	ldrsb.w	r3, [r5, #1]
 8009006:	e586      	b.n	8008b16 <vsprintf+0x2a>
 8009008:	f04f 0e6c 	mov.w	lr, #108	; 0x6c
 800900c:	f1be 0f4c 	cmp.w	lr, #76	; 0x4c
 8009010:	f046 0602 	orr.w	r6, r6, #2
 8009014:	f04f 020a 	mov.w	r2, #10
 8009018:	f47f af7d 	bne.w	8008f16 <vsprintf+0x42a>
 800901c:	1df9      	adds	r1, r7, #7
 800901e:	f021 0107 	bic.w	r1, r1, #7
 8009022:	f101 0708 	add.w	r7, r1, #8
 8009026:	e9d1 0100 	ldrd	r0, r1, [r1]
 800902a:	e78a      	b.n	8008f42 <vsprintf+0x456>
 800902c:	2325      	movs	r3, #37	; 0x25
 800902e:	e56c      	b.n	8008b0a <vsprintf+0x1e>
 8009030:	220a      	movs	r2, #10
 8009032:	e76c      	b.n	8008f0e <vsprintf+0x422>
 8009034:	2208      	movs	r2, #8
 8009036:	e76a      	b.n	8008f0e <vsprintf+0x422>
 8009038:	6838      	ldr	r0, [r7, #0]
 800903a:	3704      	adds	r7, #4
 800903c:	e780      	b.n	8008f40 <vsprintf+0x454>
 800903e:	f990 1002 	ldrsb.w	r1, [r0, #2]
 8009042:	f04f 0e4c 	mov.w	lr, #76	; 0x4c
 8009046:	3002      	adds	r0, #2
 8009048:	e5b9      	b.n	8008bbe <vsprintf+0xd2>
 800904a:	296c      	cmp	r1, #108	; 0x6c
 800904c:	d07b      	beq.n	8009146 <vsprintf+0x65a>
 800904e:	9a05      	ldr	r2, [sp, #20]
 8009050:	683b      	ldr	r3, [r7, #0]
 8009052:	ebab 0202 	sub.w	r2, fp, r2
 8009056:	601a      	str	r2, [r3, #0]
 8009058:	3704      	adds	r7, #4
 800905a:	f995 3001 	ldrsb.w	r3, [r5, #1]
 800905e:	e55a      	b.n	8008b16 <vsprintf+0x2a>
 8009060:	f88b 3001 	strb.w	r3, [fp, #1]
 8009064:	f995 3001 	ldrsb.w	r3, [r5, #1]
 8009068:	f10b 0b02 	add.w	fp, fp, #2
 800906c:	e553      	b.n	8008b16 <vsprintf+0x2a>
 800906e:	f046 0640 	orr.w	r6, r6, #64	; 0x40
 8009072:	f006 0940 	and.w	r9, r6, #64	; 0x40
 8009076:	f102 3eff 	add.w	lr, r2, #4294967295	; 0xffffffff
 800907a:	464a      	mov	r2, r9
 800907c:	a90c      	add	r1, sp, #48	; 0x30
 800907e:	4699      	mov	r9, r3
 8009080:	2700      	movs	r7, #0
 8009082:	9407      	str	r4, [sp, #28]
 8009084:	4613      	mov	r3, r2
 8009086:	e00a      	b.n	800909e <vsprintf+0x5b2>
 8009088:	2f05      	cmp	r7, #5
 800908a:	f000 810d 	beq.w	80092a8 <vsprintf+0x7bc>
 800908e:	f04f 023a 	mov.w	r2, #58	; 0x3a
 8009092:	3701      	adds	r7, #1
 8009094:	2f06      	cmp	r7, #6
 8009096:	708a      	strb	r2, [r1, #2]
 8009098:	f101 0103 	add.w	r1, r1, #3
 800909c:	d013      	beq.n	80090c6 <vsprintf+0x5da>
 800909e:	468c      	mov	ip, r1
 80090a0:	f81e 2f01 	ldrb.w	r2, [lr, #1]!
 80090a4:	4c84      	ldr	r4, [pc, #528]	; (80092b8 <vsprintf+0x7cc>)
 80090a6:	f002 000f 	and.w	r0, r2, #15
 80090aa:	4420      	add	r0, r4
 80090ac:	eb04 1212 	add.w	r2, r4, r2, lsr #4
 80090b0:	7c00      	ldrb	r0, [r0, #16]
 80090b2:	7c12      	ldrb	r2, [r2, #16]
 80090b4:	f80c 2b02 	strb.w	r2, [ip], #2
 80090b8:	7048      	strb	r0, [r1, #1]
 80090ba:	2b00      	cmp	r3, #0
 80090bc:	d0e4      	beq.n	8009088 <vsprintf+0x59c>
 80090be:	3701      	adds	r7, #1
 80090c0:	2f06      	cmp	r7, #6
 80090c2:	4661      	mov	r1, ip
 80090c4:	d1eb      	bne.n	800909e <vsprintf+0x5b2>
 80090c6:	464b      	mov	r3, r9
 80090c8:	9c07      	ldr	r4, [sp, #28]
 80090ca:	2700      	movs	r7, #0
 80090cc:	f026 0640 	bic.w	r6, r6, #64	; 0x40
 80090d0:	700f      	strb	r7, [r1, #0]
 80090d2:	4658      	mov	r0, fp
 80090d4:	4622      	mov	r2, r4
 80090d6:	a90c      	add	r1, sp, #48	; 0x30
 80090d8:	9600      	str	r6, [sp, #0]
 80090da:	f7ff fa39 	bl	8008550 <string>
 80090de:	4683      	mov	fp, r0
 80090e0:	e01e      	b.n	8009120 <vsprintf+0x634>
 80090e2:	f046 0640 	orr.w	r6, r6, #64	; 0x40
 80090e6:	f995 1002 	ldrsb.w	r1, [r5, #2]
 80090ea:	2936      	cmp	r1, #54	; 0x36
 80090ec:	f000 8093 	beq.w	8009216 <vsprintf+0x72a>
 80090f0:	2934      	cmp	r1, #52	; 0x34
 80090f2:	bf18      	it	ne
 80090f4:	f026 0640 	bicne.w	r6, r6, #64	; 0x40
 80090f8:	d05e      	beq.n	80091b8 <vsprintf+0x6cc>
 80090fa:	1c67      	adds	r7, r4, #1
 80090fc:	bf08      	it	eq
 80090fe:	2408      	moveq	r4, #8
 8009100:	f04f 0110 	mov.w	r1, #16
 8009104:	bf14      	ite	ne
 8009106:	f046 0620 	orrne.w	r6, r6, #32
 800910a:	f046 0621 	orreq.w	r6, r6, #33	; 0x21
 800910e:	9302      	str	r3, [sp, #8]
 8009110:	4658      	mov	r0, fp
 8009112:	9603      	str	r6, [sp, #12]
 8009114:	9401      	str	r4, [sp, #4]
 8009116:	9100      	str	r1, [sp, #0]
 8009118:	2300      	movs	r3, #0
 800911a:	f7ff fadf 	bl	80086dc <number>
 800911e:	4683      	mov	fp, r0
 8009120:	f995 3001 	ldrsb.w	r3, [r5, #1]
 8009124:	b2da      	uxtb	r2, r3
 8009126:	f81a 2002 	ldrb.w	r2, [sl, r2]
 800912a:	0754      	lsls	r4, r2, #29
 800912c:	d009      	beq.n	8009142 <vsprintf+0x656>
 800912e:	1c6a      	adds	r2, r5, #1
 8009130:	f992 3001 	ldrsb.w	r3, [r2, #1]
 8009134:	4615      	mov	r5, r2
 8009136:	b2d9      	uxtb	r1, r3
 8009138:	f81a 1001 	ldrb.w	r1, [sl, r1]
 800913c:	3201      	adds	r2, #1
 800913e:	0748      	lsls	r0, r1, #29
 8009140:	d1f6      	bne.n	8009130 <vsprintf+0x644>
 8009142:	9f06      	ldr	r7, [sp, #24]
 8009144:	e4e7      	b.n	8008b16 <vsprintf+0x2a>
 8009146:	9a05      	ldr	r2, [sp, #20]
 8009148:	683b      	ldr	r3, [r7, #0]
 800914a:	ebab 0202 	sub.w	r2, fp, r2
 800914e:	601a      	str	r2, [r3, #0]
 8009150:	3704      	adds	r7, #4
 8009152:	f990 3002 	ldrsb.w	r3, [r0, #2]
 8009156:	e4de      	b.n	8008b16 <vsprintf+0x2a>
 8009158:	683c      	ldr	r4, [r7, #0]
 800915a:	1ca8      	adds	r0, r5, #2
 800915c:	2c00      	cmp	r4, #0
 800915e:	f107 0704 	add.w	r7, r7, #4
 8009162:	bfbc      	itt	lt
 8009164:	4264      	neglt	r4, r4
 8009166:	f046 0610 	orrlt.w	r6, r6, #16
 800916a:	f995 1002 	ldrsb.w	r1, [r5, #2]
 800916e:	e512      	b.n	8008b96 <vsprintf+0xaa>
 8009170:	07b1      	lsls	r1, r6, #30
 8009172:	bf4d      	iteet	mi
 8009174:	b200      	sxthmi	r0, r0
 8009176:	b280      	uxthpl	r0, r0
 8009178:	2100      	movpl	r1, #0
 800917a:	17c1      	asrmi	r1, r0, #31
 800917c:	e6e1      	b.n	8008f42 <vsprintf+0x456>
 800917e:	4618      	mov	r0, r3
 8009180:	e602      	b.n	8008d88 <vsprintf+0x29c>
 8009182:	6838      	ldr	r0, [r7, #0]
 8009184:	3704      	adds	r7, #4
 8009186:	17c1      	asrs	r1, r0, #31
 8009188:	e6db      	b.n	8008f42 <vsprintf+0x456>
 800918a:	683b      	ldr	r3, [r7, #0]
 800918c:	f990 1002 	ldrsb.w	r1, [r0, #2]
 8009190:	ea23 73e3 	bic.w	r3, r3, r3, asr #31
 8009194:	3704      	adds	r7, #4
 8009196:	3002      	adds	r0, #2
 8009198:	e502      	b.n	8008ba0 <vsprintf+0xb4>
 800919a:	2208      	movs	r2, #8
 800919c:	e6e1      	b.n	8008f62 <vsprintf+0x476>
 800919e:	220a      	movs	r2, #10
 80091a0:	e6df      	b.n	8008f62 <vsprintf+0x476>
 80091a2:	f04f 0e6c 	mov.w	lr, #108	; 0x6c
 80091a6:	e6b1      	b.n	8008f0c <vsprintf+0x420>
 80091a8:	4658      	mov	r0, fp
 80091aa:	9600      	str	r6, [sp, #0]
 80091ac:	4622      	mov	r2, r4
 80091ae:	4943      	ldr	r1, [pc, #268]	; (80092bc <vsprintf+0x7d0>)
 80091b0:	f7ff f9ce 	bl	8008550 <string>
 80091b4:	4683      	mov	fp, r0
 80091b6:	e7b3      	b.n	8009120 <vsprintf+0x634>
 80091b8:	1e51      	subs	r1, r2, #1
 80091ba:	4658      	mov	r0, fp
 80091bc:	9107      	str	r1, [sp, #28]
 80091be:	4629      	mov	r1, r5
 80091c0:	3203      	adds	r2, #3
 80091c2:	469b      	mov	fp, r3
 80091c4:	4625      	mov	r5, r4
 80091c6:	4603      	mov	r3, r0
 80091c8:	4614      	mov	r4, r2
 80091ca:	460a      	mov	r2, r1
 80091cc:	af0c      	add	r7, sp, #48	; 0x30
 80091ce:	f10d 092c 	add.w	r9, sp, #44	; 0x2c
 80091d2:	9308      	str	r3, [sp, #32]
 80091d4:	9b07      	ldr	r3, [sp, #28]
 80091d6:	4648      	mov	r0, r9
 80091d8:	f813 1f01 	ldrb.w	r1, [r3, #1]!
 80091dc:	9209      	str	r2, [sp, #36]	; 0x24
 80091de:	9307      	str	r3, [sp, #28]
 80091e0:	f7ff f962 	bl	80084a8 <put_dec_trunc>
 80091e4:	ebb0 0e09 	subs.w	lr, r0, r9
 80091e8:	9b08      	ldr	r3, [sp, #32]
 80091ea:	9a09      	ldr	r2, [sp, #36]	; 0x24
 80091ec:	d00a      	beq.n	8009204 <vsprintf+0x718>
 80091ee:	f10e 30ff 	add.w	r0, lr, #4294967295	; 0xffffffff
 80091f2:	4639      	mov	r1, r7
 80091f4:	4448      	add	r0, r9
 80091f6:	4477      	add	r7, lr
 80091f8:	f910 e901 	ldrsb.w	lr, [r0], #-1
 80091fc:	f801 eb01 	strb.w	lr, [r1], #1
 8009200:	428f      	cmp	r7, r1
 8009202:	d1f9      	bne.n	80091f8 <vsprintf+0x70c>
 8009204:	9907      	ldr	r1, [sp, #28]
 8009206:	428c      	cmp	r4, r1
 8009208:	d03b      	beq.n	8009282 <vsprintf+0x796>
 800920a:	f04f 012e 	mov.w	r1, #46	; 0x2e
 800920e:	3701      	adds	r7, #1
 8009210:	f807 1c01 	strb.w	r1, [r7, #-1]
 8009214:	e7dd      	b.n	80091d2 <vsprintf+0x6e6>
 8009216:	f006 0040 	and.w	r0, r6, #64	; 0x40
 800921a:	4694      	mov	ip, r2
 800921c:	a90c      	add	r1, sp, #48	; 0x30
 800921e:	2700      	movs	r7, #0
 8009220:	9007      	str	r0, [sp, #28]
 8009222:	9308      	str	r3, [sp, #32]
 8009224:	e00b      	b.n	800923e <vsprintf+0x752>
 8009226:	2f07      	cmp	r7, #7
 8009228:	d042      	beq.n	80092b0 <vsprintf+0x7c4>
 800922a:	f04f 033a 	mov.w	r3, #58	; 0x3a
 800922e:	3105      	adds	r1, #5
 8009230:	f801 3c01 	strb.w	r3, [r1, #-1]
 8009234:	3701      	adds	r7, #1
 8009236:	2f08      	cmp	r7, #8
 8009238:	f10c 0c02 	add.w	ip, ip, #2
 800923c:	d032      	beq.n	80092a4 <vsprintf+0x7b8>
 800923e:	f812 0017 	ldrb.w	r0, [r2, r7, lsl #1]
 8009242:	4b1d      	ldr	r3, [pc, #116]	; (80092b8 <vsprintf+0x7cc>)
 8009244:	f000 0e0f 	and.w	lr, r0, #15
 8009248:	449e      	add	lr, r3
 800924a:	eb03 1010 	add.w	r0, r3, r0, lsr #4
 800924e:	f89e e010 	ldrb.w	lr, [lr, #16]
 8009252:	7c00      	ldrb	r0, [r0, #16]
 8009254:	f881 e001 	strb.w	lr, [r1, #1]
 8009258:	7008      	strb	r0, [r1, #0]
 800925a:	f89c 0001 	ldrb.w	r0, [ip, #1]
 800925e:	f101 0904 	add.w	r9, r1, #4
 8009262:	f000 0e0f 	and.w	lr, r0, #15
 8009266:	449e      	add	lr, r3
 8009268:	eb03 1010 	add.w	r0, r3, r0, lsr #4
 800926c:	f89e e010 	ldrb.w	lr, [lr, #16]
 8009270:	7c00      	ldrb	r0, [r0, #16]
 8009272:	9b07      	ldr	r3, [sp, #28]
 8009274:	f881 e003 	strb.w	lr, [r1, #3]
 8009278:	7088      	strb	r0, [r1, #2]
 800927a:	2b00      	cmp	r3, #0
 800927c:	d0d3      	beq.n	8009226 <vsprintf+0x73a>
 800927e:	4649      	mov	r1, r9
 8009280:	e7d8      	b.n	8009234 <vsprintf+0x748>
 8009282:	4619      	mov	r1, r3
 8009284:	462c      	mov	r4, r5
 8009286:	465b      	mov	r3, fp
 8009288:	468b      	mov	fp, r1
 800928a:	2100      	movs	r1, #0
 800928c:	f026 0640 	bic.w	r6, r6, #64	; 0x40
 8009290:	7039      	strb	r1, [r7, #0]
 8009292:	4658      	mov	r0, fp
 8009294:	4615      	mov	r5, r2
 8009296:	a90c      	add	r1, sp, #48	; 0x30
 8009298:	4622      	mov	r2, r4
 800929a:	9600      	str	r6, [sp, #0]
 800929c:	f7ff f958 	bl	8008550 <string>
 80092a0:	4683      	mov	fp, r0
 80092a2:	e73d      	b.n	8009120 <vsprintf+0x634>
 80092a4:	9b08      	ldr	r3, [sp, #32]
 80092a6:	e710      	b.n	80090ca <vsprintf+0x5de>
 80092a8:	9c07      	ldr	r4, [sp, #28]
 80092aa:	464b      	mov	r3, r9
 80092ac:	4661      	mov	r1, ip
 80092ae:	e70c      	b.n	80090ca <vsprintf+0x5de>
 80092b0:	9b08      	ldr	r3, [sp, #32]
 80092b2:	4649      	mov	r1, r9
 80092b4:	e709      	b.n	80090ca <vsprintf+0x5de>
 80092b6:	bf00      	nop
 80092b8:	0800ec10 	.word	0x0800ec10
 80092bc:	0800ec3c 	.word	0x0800ec3c
 80092c0:	200009c8 	.word	0x200009c8

080092c4 <sprintf>:
 80092c4:	b40e      	push	{r1, r2, r3}
 80092c6:	b500      	push	{lr}
 80092c8:	b082      	sub	sp, #8
 80092ca:	ab03      	add	r3, sp, #12
 80092cc:	f853 1b04 	ldr.w	r1, [r3], #4
 80092d0:	461a      	mov	r2, r3
 80092d2:	9301      	str	r3, [sp, #4]
 80092d4:	f7ff fc0a 	bl	8008aec <vsprintf>
 80092d8:	b002      	add	sp, #8
 80092da:	f85d eb04 	ldr.w	lr, [sp], #4
 80092de:	b003      	add	sp, #12
 80092e0:	4770      	bx	lr
 80092e2:	bf00      	nop

080092e4 <panic>:
 80092e4:	b40f      	push	{r0, r1, r2, r3}
 80092e6:	b500      	push	{lr}
 80092e8:	b083      	sub	sp, #12
 80092ea:	ab04      	add	r3, sp, #16
 80092ec:	f853 0b04 	ldr.w	r0, [r3], #4
 80092f0:	4619      	mov	r1, r3
 80092f2:	9301      	str	r3, [sp, #4]
 80092f4:	f7fc f844 	bl	8005380 <vprintf>
 80092f8:	200a      	movs	r0, #10
 80092fa:	f7fc f815 	bl	8005328 <putc>
 80092fe:	4807      	ldr	r0, [pc, #28]	; (800931c <panic+0x38>)
 8009300:	f7ff f8c2 	bl	8008488 <udelay>
 8009304:	2300      	movs	r3, #0
 8009306:	461a      	mov	r2, r3
 8009308:	4619      	mov	r1, r3
 800930a:	4618      	mov	r0, r3
 800930c:	f002 f914 	bl	800b538 <do_reset>
 8009310:	b003      	add	sp, #12
 8009312:	f85d eb04 	ldr.w	lr, [sp], #4
 8009316:	b004      	add	sp, #16
 8009318:	4770      	bx	lr
 800931a:	bf00      	nop
 800931c:	000186a0 	.word	0x000186a0

08009320 <zcalloc>:
 8009320:	fb02 f001 	mul.w	r0, r2, r1
 8009324:	f7fc baae 	b.w	8005884 <malloc>

08009328 <zcfree>:
 8009328:	4608      	mov	r0, r1
 800932a:	f7fc b9cd 	b.w	80056c8 <free>
 800932e:	bf00      	nop

08009330 <inflate_fast>:
 8009330:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8009334:	f04f 0e01 	mov.w	lr, #1
 8009338:	f8d0 b01c 	ldr.w	fp, [r0, #28]
 800933c:	b090      	sub	sp, #64	; 0x40
 800933e:	f8db 3058 	ldr.w	r3, [fp, #88]	; 0x58
 8009342:	f8db 6054 	ldr.w	r6, [fp, #84]	; 0x54
 8009346:	9301      	str	r3, [sp, #4]
 8009348:	f8db 3028 	ldr.w	r3, [fp, #40]	; 0x28
 800934c:	fa0e f606 	lsl.w	r6, lr, r6
 8009350:	9306      	str	r3, [sp, #24]
 8009352:	f8db 3030 	ldr.w	r3, [fp, #48]	; 0x30
 8009356:	6804      	ldr	r4, [r0, #0]
 8009358:	9305      	str	r3, [sp, #20]
 800935a:	9b01      	ldr	r3, [sp, #4]
 800935c:	3e01      	subs	r6, #1
 800935e:	fa0e f303 	lsl.w	r3, lr, r3
 8009362:	9604      	str	r6, [sp, #16]
 8009364:	1e5e      	subs	r6, r3, #1
 8009366:	3c01      	subs	r4, #1
 8009368:	9608      	str	r6, [sp, #32]
 800936a:	9b06      	ldr	r3, [sp, #24]
 800936c:	9e05      	ldr	r6, [sp, #20]
 800936e:	9401      	str	r4, [sp, #4]
 8009370:	4682      	mov	sl, r0
 8009372:	4433      	add	r3, r6
 8009374:	9e01      	ldr	r6, [sp, #4]
 8009376:	6842      	ldr	r2, [r0, #4]
 8009378:	68c0      	ldr	r0, [r0, #12]
 800937a:	930b      	str	r3, [sp, #44]	; 0x2c
 800937c:	4633      	mov	r3, r6
 800937e:	f100 3cff 	add.w	ip, r0, #4294967295	; 0xffffffff
 8009382:	f46f 7080 	mvn.w	r0, #256	; 0x100
 8009386:	f8da 7010 	ldr.w	r7, [sl, #16]
 800938a:	4675      	mov	r5, lr
 800938c:	f1a2 0e05 	sub.w	lr, r2, #5
 8009390:	f8db 202c 	ldr.w	r2, [fp, #44]	; 0x2c
 8009394:	1a79      	subs	r1, r7, r1
 8009396:	4473      	add	r3, lr
 8009398:	4407      	add	r7, r0
 800939a:	9209      	str	r2, [sp, #36]	; 0x24
 800939c:	9303      	str	r3, [sp, #12]
 800939e:	f8db 2034 	ldr.w	r2, [fp, #52]	; 0x34
 80093a2:	eb0c 0301 	add.w	r3, ip, r1
 80093a6:	9301      	str	r3, [sp, #4]
 80093a8:	eb0c 0307 	add.w	r3, ip, r7
 80093ac:	920a      	str	r2, [sp, #40]	; 0x28
 80093ae:	f8db 003c 	ldr.w	r0, [fp, #60]	; 0x3c
 80093b2:	f8db 2038 	ldr.w	r2, [fp, #56]	; 0x38
 80093b6:	f8db 404c 	ldr.w	r4, [fp, #76]	; 0x4c
 80093ba:	f8db 9050 	ldr.w	r9, [fp, #80]	; 0x50
 80093be:	9302      	str	r3, [sp, #8]
 80093c0:	f8cd a01c 	str.w	sl, [sp, #28]
 80093c4:	46b2      	mov	sl, r6
 80093c6:	280e      	cmp	r0, #14
 80093c8:	d80c      	bhi.n	80093e4 <inflate_fast+0xb4>
 80093ca:	f89a 3002 	ldrb.w	r3, [sl, #2]
 80093ce:	f89a 1001 	ldrb.w	r1, [sl, #1]
 80093d2:	f100 0608 	add.w	r6, r0, #8
 80093d6:	4081      	lsls	r1, r0
 80093d8:	40b3      	lsls	r3, r6
 80093da:	440b      	add	r3, r1
 80093dc:	441a      	add	r2, r3
 80093de:	3010      	adds	r0, #16
 80093e0:	f10a 0a02 	add.w	sl, sl, #2
 80093e4:	9b04      	ldr	r3, [sp, #16]
 80093e6:	4013      	ands	r3, r2
 80093e8:	eb04 0683 	add.w	r6, r4, r3, lsl #2
 80093ec:	7871      	ldrb	r1, [r6, #1]
 80093ee:	f814 3023 	ldrb.w	r3, [r4, r3, lsl #2]
 80093f2:	8876      	ldrh	r6, [r6, #2]
 80093f4:	40ca      	lsrs	r2, r1
 80093f6:	1a40      	subs	r0, r0, r1
 80093f8:	b99b      	cbnz	r3, 8009422 <inflate_fast+0xf2>
 80093fa:	e098      	b.n	800952e <inflate_fast+0x1fe>
 80093fc:	0659      	lsls	r1, r3, #25
 80093fe:	f100 80a6 	bmi.w	800954e <inflate_fast+0x21e>
 8009402:	fa05 f303 	lsl.w	r3, r5, r3
 8009406:	3b01      	subs	r3, #1
 8009408:	4013      	ands	r3, r2
 800940a:	441e      	add	r6, r3
 800940c:	eb04 0786 	add.w	r7, r4, r6, lsl #2
 8009410:	7879      	ldrb	r1, [r7, #1]
 8009412:	f814 3026 	ldrb.w	r3, [r4, r6, lsl #2]
 8009416:	40ca      	lsrs	r2, r1
 8009418:	887e      	ldrh	r6, [r7, #2]
 800941a:	1a40      	subs	r0, r0, r1
 800941c:	2b00      	cmp	r3, #0
 800941e:	f000 8086 	beq.w	800952e <inflate_fast+0x1fe>
 8009422:	06d9      	lsls	r1, r3, #27
 8009424:	d5ea      	bpl.n	80093fc <inflate_fast+0xcc>
 8009426:	f013 030f 	ands.w	r3, r3, #15
 800942a:	4631      	mov	r1, r6
 800942c:	d00f      	beq.n	800944e <inflate_fast+0x11e>
 800942e:	4283      	cmp	r3, r0
 8009430:	d906      	bls.n	8009440 <inflate_fast+0x110>
 8009432:	f89a 1001 	ldrb.w	r1, [sl, #1]
 8009436:	f10a 0a01 	add.w	sl, sl, #1
 800943a:	4081      	lsls	r1, r0
 800943c:	440a      	add	r2, r1
 800943e:	3008      	adds	r0, #8
 8009440:	fa05 f103 	lsl.w	r1, r5, r3
 8009444:	3901      	subs	r1, #1
 8009446:	4011      	ands	r1, r2
 8009448:	1ac0      	subs	r0, r0, r3
 800944a:	4431      	add	r1, r6
 800944c:	40da      	lsrs	r2, r3
 800944e:	280e      	cmp	r0, #14
 8009450:	f240 80c3 	bls.w	80095da <inflate_fast+0x2aa>
 8009454:	9b08      	ldr	r3, [sp, #32]
 8009456:	4013      	ands	r3, r2
 8009458:	e007      	b.n	800946a <inflate_fast+0x13a>
 800945a:	065f      	lsls	r7, r3, #25
 800945c:	f100 80cc 	bmi.w	80095f8 <inflate_fast+0x2c8>
 8009460:	fa05 f303 	lsl.w	r3, r5, r3
 8009464:	3b01      	subs	r3, #1
 8009466:	4013      	ands	r3, r2
 8009468:	4433      	add	r3, r6
 800946a:	eb09 0683 	add.w	r6, r9, r3, lsl #2
 800946e:	7877      	ldrb	r7, [r6, #1]
 8009470:	f819 3023 	ldrb.w	r3, [r9, r3, lsl #2]
 8009474:	40fa      	lsrs	r2, r7
 8009476:	1bc0      	subs	r0, r0, r7
 8009478:	06df      	lsls	r7, r3, #27
 800947a:	8876      	ldrh	r6, [r6, #2]
 800947c:	d5ed      	bpl.n	800945a <inflate_fast+0x12a>
 800947e:	f003 030f 	and.w	r3, r3, #15
 8009482:	4283      	cmp	r3, r0
 8009484:	d90b      	bls.n	800949e <inflate_fast+0x16e>
 8009486:	f89a 7001 	ldrb.w	r7, [sl, #1]
 800948a:	f100 0e08 	add.w	lr, r0, #8
 800948e:	4087      	lsls	r7, r0
 8009490:	4573      	cmp	r3, lr
 8009492:	443a      	add	r2, r7
 8009494:	f200 8116 	bhi.w	80096c4 <inflate_fast+0x394>
 8009498:	4670      	mov	r0, lr
 800949a:	f10a 0a01 	add.w	sl, sl, #1
 800949e:	fa05 f703 	lsl.w	r7, r5, r3
 80094a2:	3f01      	subs	r7, #1
 80094a4:	4017      	ands	r7, r2
 80094a6:	19be      	adds	r6, r7, r6
 80094a8:	4637      	mov	r7, r6
 80094aa:	960c      	str	r6, [sp, #48]	; 0x30
 80094ac:	9e01      	ldr	r6, [sp, #4]
 80094ae:	1ac0      	subs	r0, r0, r3
 80094b0:	ebac 0606 	sub.w	r6, ip, r6
 80094b4:	42b7      	cmp	r7, r6
 80094b6:	fa22 f203 	lsr.w	r2, r2, r3
 80094ba:	f200 80a8 	bhi.w	800960e <inflate_fast+0x2de>
 80094be:	9b0c      	ldr	r3, [sp, #48]	; 0x30
 80094c0:	f01c 0f01 	tst.w	ip, #1
 80094c4:	ebac 0703 	sub.w	r7, ip, r3
 80094c8:	d106      	bne.n	80094d8 <inflate_fast+0x1a8>
 80094ca:	787b      	ldrb	r3, [r7, #1]
 80094cc:	3901      	subs	r1, #1
 80094ce:	f88c 3001 	strb.w	r3, [ip, #1]
 80094d2:	3701      	adds	r7, #1
 80094d4:	f10c 0c01 	add.w	ip, ip, #1
 80094d8:	9e0c      	ldr	r6, [sp, #48]	; 0x30
 80094da:	f10c 33ff 	add.w	r3, ip, #4294967295	; 0xffffffff
 80094de:	2e02      	cmp	r6, #2
 80094e0:	930d      	str	r3, [sp, #52]	; 0x34
 80094e2:	f240 80d3 	bls.w	800968c <inflate_fast+0x35c>
 80094e6:	1e7e      	subs	r6, r7, #1
 80094e8:	46b6      	mov	lr, r6
 80094ea:	469c      	mov	ip, r3
 80094ec:	084f      	lsrs	r7, r1, #1
 80094ee:	960c      	str	r6, [sp, #48]	; 0x30
 80094f0:	970e      	str	r7, [sp, #56]	; 0x38
 80094f2:	f89e 6003 	ldrb.w	r6, [lr, #3]
 80094f6:	f81e 3f02 	ldrb.w	r3, [lr, #2]!
 80094fa:	3f01      	subs	r7, #1
 80094fc:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
 8009500:	f82c 3f02 	strh.w	r3, [ip, #2]!
 8009504:	d1f5      	bne.n	80094f2 <inflate_fast+0x1c2>
 8009506:	9b0e      	ldr	r3, [sp, #56]	; 0x38
 8009508:	f103 4700 	add.w	r7, r3, #2147483648	; 0x80000000
 800950c:	3f01      	subs	r7, #1
 800950e:	007f      	lsls	r7, r7, #1
 8009510:	9b0d      	ldr	r3, [sp, #52]	; 0x34
 8009512:	3703      	adds	r7, #3
 8009514:	443b      	add	r3, r7
 8009516:	469c      	mov	ip, r3
 8009518:	9b0c      	ldr	r3, [sp, #48]	; 0x30
 800951a:	443b      	add	r3, r7
 800951c:	461f      	mov	r7, r3
 800951e:	07cb      	lsls	r3, r1, #31
 8009520:	d509      	bpl.n	8009536 <inflate_fast+0x206>
 8009522:	787b      	ldrb	r3, [r7, #1]
 8009524:	f88c 3001 	strb.w	r3, [ip, #1]
 8009528:	f10c 0c01 	add.w	ip, ip, #1
 800952c:	e003      	b.n	8009536 <inflate_fast+0x206>
 800952e:	f88c 6001 	strb.w	r6, [ip, #1]
 8009532:	f10c 0c01 	add.w	ip, ip, #1
 8009536:	9b03      	ldr	r3, [sp, #12]
 8009538:	459a      	cmp	sl, r3
 800953a:	d203      	bcs.n	8009544 <inflate_fast+0x214>
 800953c:	9b02      	ldr	r3, [sp, #8]
 800953e:	459c      	cmp	ip, r3
 8009540:	f4ff af41 	bcc.w	80093c6 <inflate_fast+0x96>
 8009544:	f8cd a004 	str.w	sl, [sp, #4]
 8009548:	f8dd a01c 	ldr.w	sl, [sp, #28]
 800954c:	e00e      	b.n	800956c <inflate_fast+0x23c>
 800954e:	069b      	lsls	r3, r3, #26
 8009550:	bf4c      	ite	mi
 8009552:	230b      	movmi	r3, #11
 8009554:	231b      	movpl	r3, #27
 8009556:	f8cd a004 	str.w	sl, [sp, #4]
 800955a:	bf58      	it	pl
 800955c:	4985      	ldrpl	r1, [pc, #532]	; (8009774 <inflate_fast+0x444>)
 800955e:	f8dd a01c 	ldr.w	sl, [sp, #28]
 8009562:	bf58      	it	pl
 8009564:	f8ca 1018 	strpl.w	r1, [sl, #24]
 8009568:	f88b 3000 	strb.w	r3, [fp]
 800956c:	2101      	movs	r1, #1
 800956e:	9c01      	ldr	r4, [sp, #4]
 8009570:	f000 0307 	and.w	r3, r0, #7
 8009574:	eba4 00d0 	sub.w	r0, r4, r0, lsr #3
 8009578:	1c44      	adds	r4, r0, #1
 800957a:	4099      	lsls	r1, r3
 800957c:	f8ca 4000 	str.w	r4, [sl]
 8009580:	9c03      	ldr	r4, [sp, #12]
 8009582:	3901      	subs	r1, #1
 8009584:	400a      	ands	r2, r1
 8009586:	4284      	cmp	r4, r0
 8009588:	f10c 0101 	add.w	r1, ip, #1
 800958c:	f8ca 100c 	str.w	r1, [sl, #12]
 8009590:	d915      	bls.n	80095be <inflate_fast+0x28e>
 8009592:	9902      	ldr	r1, [sp, #8]
 8009594:	1a20      	subs	r0, r4, r0
 8009596:	3005      	adds	r0, #5
 8009598:	458c      	cmp	ip, r1
 800959a:	f8ca 0004 	str.w	r0, [sl, #4]
 800959e:	d317      	bcc.n	80095d0 <inflate_fast+0x2a0>
 80095a0:	9902      	ldr	r1, [sp, #8]
 80095a2:	ebac 0701 	sub.w	r7, ip, r1
 80095a6:	f5c7 7780 	rsb	r7, r7, #256	; 0x100
 80095aa:	3701      	adds	r7, #1
 80095ac:	f8ca 7010 	str.w	r7, [sl, #16]
 80095b0:	f8cb 2038 	str.w	r2, [fp, #56]	; 0x38
 80095b4:	f8cb 303c 	str.w	r3, [fp, #60]	; 0x3c
 80095b8:	b010      	add	sp, #64	; 0x40
 80095ba:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 80095be:	9903      	ldr	r1, [sp, #12]
 80095c0:	1a40      	subs	r0, r0, r1
 80095c2:	9902      	ldr	r1, [sp, #8]
 80095c4:	f1c0 0005 	rsb	r0, r0, #5
 80095c8:	458c      	cmp	ip, r1
 80095ca:	f8ca 0004 	str.w	r0, [sl, #4]
 80095ce:	d2e7      	bcs.n	80095a0 <inflate_fast+0x270>
 80095d0:	eba1 070c 	sub.w	r7, r1, ip
 80095d4:	f207 1701 	addw	r7, r7, #257	; 0x101
 80095d8:	e7e8      	b.n	80095ac <inflate_fast+0x27c>
 80095da:	f89a 7002 	ldrb.w	r7, [sl, #2]
 80095de:	f89a 6001 	ldrb.w	r6, [sl, #1]
 80095e2:	f100 0308 	add.w	r3, r0, #8
 80095e6:	4086      	lsls	r6, r0
 80095e8:	fa07 f303 	lsl.w	r3, r7, r3
 80095ec:	4433      	add	r3, r6
 80095ee:	441a      	add	r2, r3
 80095f0:	3010      	adds	r0, #16
 80095f2:	f10a 0a02 	add.w	sl, sl, #2
 80095f6:	e72d      	b.n	8009454 <inflate_fast+0x124>
 80095f8:	231b      	movs	r3, #27
 80095fa:	f8cd a004 	str.w	sl, [sp, #4]
 80095fe:	495e      	ldr	r1, [pc, #376]	; (8009778 <inflate_fast+0x448>)
 8009600:	f8dd a01c 	ldr.w	sl, [sp, #28]
 8009604:	f8ca 1018 	str.w	r1, [sl, #24]
 8009608:	f88b 3000 	strb.w	r3, [fp]
 800960c:	e7ae      	b.n	800956c <inflate_fast+0x23c>
 800960e:	1bbb      	subs	r3, r7, r6
 8009610:	9e09      	ldr	r6, [sp, #36]	; 0x24
 8009612:	930d      	str	r3, [sp, #52]	; 0x34
 8009614:	429e      	cmp	r6, r3
 8009616:	f0c0 80a1 	bcc.w	800975c <inflate_fast+0x42c>
 800961a:	9b0a      	ldr	r3, [sp, #40]	; 0x28
 800961c:	f103 3eff 	add.w	lr, r3, #4294967295	; 0xffffffff
 8009620:	9b05      	ldr	r3, [sp, #20]
 8009622:	2b00      	cmp	r3, #0
 8009624:	d157      	bne.n	80096d6 <inflate_fast+0x3a6>
 8009626:	9f0d      	ldr	r7, [sp, #52]	; 0x34
 8009628:	9e06      	ldr	r6, [sp, #24]
 800962a:	42b9      	cmp	r1, r7
 800962c:	eba6 0307 	sub.w	r3, r6, r7
 8009630:	4473      	add	r3, lr
 8009632:	d91a      	bls.n	800966a <inflate_fast+0x33a>
 8009634:	4666      	mov	r6, ip
 8009636:	1bc9      	subs	r1, r1, r7
 8009638:	9f06      	ldr	r7, [sp, #24]
 800963a:	44be      	add	lr, r7
 800963c:	f813 7f01 	ldrb.w	r7, [r3, #1]!
 8009640:	4573      	cmp	r3, lr
 8009642:	f806 7f01 	strb.w	r7, [r6, #1]!
 8009646:	d1f9      	bne.n	800963c <inflate_fast+0x30c>
 8009648:	9b0d      	ldr	r3, [sp, #52]	; 0x34
 800964a:	449c      	add	ip, r3
 800964c:	9b0c      	ldr	r3, [sp, #48]	; 0x30
 800964e:	ebac 0303 	sub.w	r3, ip, r3
 8009652:	e00a      	b.n	800966a <inflate_fast+0x33a>
 8009654:	785e      	ldrb	r6, [r3, #1]
 8009656:	3903      	subs	r1, #3
 8009658:	f88c 6001 	strb.w	r6, [ip, #1]
 800965c:	789e      	ldrb	r6, [r3, #2]
 800965e:	f88c 6002 	strb.w	r6, [ip, #2]
 8009662:	f813 6f03 	ldrb.w	r6, [r3, #3]!
 8009666:	f80c 6f03 	strb.w	r6, [ip, #3]!
 800966a:	2902      	cmp	r1, #2
 800966c:	d8f2      	bhi.n	8009654 <inflate_fast+0x324>
 800966e:	2900      	cmp	r1, #0
 8009670:	f43f af61 	beq.w	8009536 <inflate_fast+0x206>
 8009674:	785e      	ldrb	r6, [r3, #1]
 8009676:	2902      	cmp	r1, #2
 8009678:	f88c 6001 	strb.w	r6, [ip, #1]
 800967c:	f47f af54 	bne.w	8009528 <inflate_fast+0x1f8>
 8009680:	789b      	ldrb	r3, [r3, #2]
 8009682:	f10c 0c02 	add.w	ip, ip, #2
 8009686:	f88c 3000 	strb.w	r3, [ip]
 800968a:	e754      	b.n	8009536 <inflate_fast+0x206>
 800968c:	9b0c      	ldr	r3, [sp, #48]	; 0x30
 800968e:	f83c ec01 	ldrh.w	lr, [ip, #-1]
 8009692:	2b01      	cmp	r3, #1
 8009694:	bf08      	it	eq
 8009696:	f02e 03ff 	biceq.w	r3, lr, #255	; 0xff
 800969a:	ea4f 0c51 	mov.w	ip, r1, lsr #1
 800969e:	bf08      	it	eq
 80096a0:	ea43 2e1e 	orreq.w	lr, r3, lr, lsr #8
 80096a4:	4663      	mov	r3, ip
 80096a6:	9e0d      	ldr	r6, [sp, #52]	; 0x34
 80096a8:	3b01      	subs	r3, #1
 80096aa:	f826 ef02 	strh.w	lr, [r6, #2]!
 80096ae:	d1fb      	bne.n	80096a8 <inflate_fast+0x378>
 80096b0:	f10c 4c00 	add.w	ip, ip, #2147483648	; 0x80000000
 80096b4:	9b0d      	ldr	r3, [sp, #52]	; 0x34
 80096b6:	f10c 3cff 	add.w	ip, ip, #4294967295	; 0xffffffff
 80096ba:	eb03 0c4c 	add.w	ip, r3, ip, lsl #1
 80096be:	f10c 0c03 	add.w	ip, ip, #3
 80096c2:	e72c      	b.n	800951e <inflate_fast+0x1ee>
 80096c4:	f89a 7002 	ldrb.w	r7, [sl, #2]
 80096c8:	3010      	adds	r0, #16
 80096ca:	fa07 f70e 	lsl.w	r7, r7, lr
 80096ce:	443a      	add	r2, r7
 80096d0:	f10a 0a02 	add.w	sl, sl, #2
 80096d4:	e6e3      	b.n	800949e <inflate_fast+0x16e>
 80096d6:	9b05      	ldr	r3, [sp, #20]
 80096d8:	9e0d      	ldr	r6, [sp, #52]	; 0x34
 80096da:	461f      	mov	r7, r3
 80096dc:	42b7      	cmp	r7, r6
 80096de:	d227      	bcs.n	8009730 <inflate_fast+0x400>
 80096e0:	9f0b      	ldr	r7, [sp, #44]	; 0x2c
 80096e2:	1bbb      	subs	r3, r7, r6
 80096e4:	9f05      	ldr	r7, [sp, #20]
 80096e6:	4473      	add	r3, lr
 80096e8:	1bf6      	subs	r6, r6, r7
 80096ea:	42b1      	cmp	r1, r6
 80096ec:	4637      	mov	r7, r6
 80096ee:	960e      	str	r6, [sp, #56]	; 0x38
 80096f0:	d9bb      	bls.n	800966a <inflate_fast+0x33a>
 80096f2:	1bc9      	subs	r1, r1, r7
 80096f4:	19df      	adds	r7, r3, r7
 80096f6:	f8cd a03c 	str.w	sl, [sp, #60]	; 0x3c
 80096fa:	4666      	mov	r6, ip
 80096fc:	46ba      	mov	sl, r7
 80096fe:	f813 7f01 	ldrb.w	r7, [r3, #1]!
 8009702:	4553      	cmp	r3, sl
 8009704:	f806 7f01 	strb.w	r7, [r6, #1]!
 8009708:	d1f9      	bne.n	80096fe <inflate_fast+0x3ce>
 800970a:	9b0e      	ldr	r3, [sp, #56]	; 0x38
 800970c:	9f05      	ldr	r7, [sp, #20]
 800970e:	4463      	add	r3, ip
 8009710:	428f      	cmp	r7, r1
 8009712:	f8dd a03c 	ldr.w	sl, [sp, #60]	; 0x3c
 8009716:	461e      	mov	r6, r3
 8009718:	d21d      	bcs.n	8009756 <inflate_fast+0x426>
 800971a:	4633      	mov	r3, r6
 800971c:	9e0d      	ldr	r6, [sp, #52]	; 0x34
 800971e:	1bc9      	subs	r1, r1, r7
 8009720:	44b4      	add	ip, r6
 8009722:	f81e 6f01 	ldrb.w	r6, [lr, #1]!
 8009726:	f803 6f01 	strb.w	r6, [r3, #1]!
 800972a:	459c      	cmp	ip, r3
 800972c:	d1f9      	bne.n	8009722 <inflate_fast+0x3f2>
 800972e:	e78d      	b.n	800964c <inflate_fast+0x31c>
 8009730:	9e0d      	ldr	r6, [sp, #52]	; 0x34
 8009732:	9f05      	ldr	r7, [sp, #20]
 8009734:	42b1      	cmp	r1, r6
 8009736:	eba7 0306 	sub.w	r3, r7, r6
 800973a:	4473      	add	r3, lr
 800973c:	4637      	mov	r7, r6
 800973e:	d994      	bls.n	800966a <inflate_fast+0x33a>
 8009740:	4666      	mov	r6, ip
 8009742:	1bc9      	subs	r1, r1, r7
 8009744:	9f05      	ldr	r7, [sp, #20]
 8009746:	44be      	add	lr, r7
 8009748:	f813 7f01 	ldrb.w	r7, [r3, #1]!
 800974c:	4573      	cmp	r3, lr
 800974e:	f806 7f01 	strb.w	r7, [r6, #1]!
 8009752:	d1f9      	bne.n	8009748 <inflate_fast+0x418>
 8009754:	e778      	b.n	8009648 <inflate_fast+0x318>
 8009756:	4673      	mov	r3, lr
 8009758:	46b4      	mov	ip, r6
 800975a:	e786      	b.n	800966a <inflate_fast+0x33a>
 800975c:	231b      	movs	r3, #27
 800975e:	f8cd a004 	str.w	sl, [sp, #4]
 8009762:	4906      	ldr	r1, [pc, #24]	; (800977c <inflate_fast+0x44c>)
 8009764:	f8dd a01c 	ldr.w	sl, [sp, #28]
 8009768:	f8ca 1018 	str.w	r1, [sl, #24]
 800976c:	f88b 3000 	strb.w	r3, [fp]
 8009770:	e6fc      	b.n	800956c <inflate_fast+0x23c>
 8009772:	bf00      	nop
 8009774:	0800f64c 	.word	0x0800f64c
 8009778:	0800f634 	.word	0x0800f634
 800977c:	0800f614 	.word	0x0800f614

08009780 <inflate_table>:
 8009780:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8009784:	2400      	movs	r4, #0
 8009786:	b09e      	sub	sp, #120	; 0x78
 8009788:	9107      	str	r1, [sp, #28]
 800978a:	9927      	ldr	r1, [sp, #156]	; 0x9c
 800978c:	900a      	str	r0, [sp, #40]	; 0x28
 800978e:	930d      	str	r3, [sp, #52]	; 0x34
 8009790:	f10d 0056 	add.w	r0, sp, #86	; 0x56
 8009794:	f10d 0336 	add.w	r3, sp, #54	; 0x36
 8009798:	f823 4f02 	strh.w	r4, [r3, #2]!
 800979c:	4298      	cmp	r0, r3
 800979e:	d1fb      	bne.n	8009798 <inflate_table+0x18>
 80097a0:	b182      	cbz	r2, 80097c4 <inflate_table+0x44>
 80097a2:	9807      	ldr	r0, [sp, #28]
 80097a4:	4605      	mov	r5, r0
 80097a6:	eb00 0642 	add.w	r6, r0, r2, lsl #1
 80097aa:	f835 0b02 	ldrh.w	r0, [r5], #2
 80097ae:	ac1e      	add	r4, sp, #120	; 0x78
 80097b0:	eb04 0040 	add.w	r0, r4, r0, lsl #1
 80097b4:	f830 4c40 	ldrh.w	r4, [r0, #-64]
 80097b8:	42ae      	cmp	r6, r5
 80097ba:	f104 0401 	add.w	r4, r4, #1
 80097be:	f820 4c40 	strh.w	r4, [r0, #-64]
 80097c2:	d1f2      	bne.n	80097aa <inflate_table+0x2a>
 80097c4:	4618      	mov	r0, r3
 80097c6:	f04f 0a0f 	mov.w	sl, #15
 80097ca:	f830 4902 	ldrh.w	r4, [r0], #-2
 80097ce:	b9bc      	cbnz	r4, 8009800 <inflate_table+0x80>
 80097d0:	f1ba 0a01 	subs.w	sl, sl, #1
 80097d4:	d1f9      	bne.n	80097ca <inflate_table+0x4a>
 80097d6:	2201      	movs	r2, #1
 80097d8:	2140      	movs	r1, #64	; 0x40
 80097da:	4650      	mov	r0, sl
 80097dc:	9d0d      	ldr	r5, [sp, #52]	; 0x34
 80097de:	682b      	ldr	r3, [r5, #0]
 80097e0:	f103 0408 	add.w	r4, r3, #8
 80097e4:	7019      	strb	r1, [r3, #0]
 80097e6:	f8a3 a002 	strh.w	sl, [r3, #2]
 80097ea:	705a      	strb	r2, [r3, #1]
 80097ec:	602c      	str	r4, [r5, #0]
 80097ee:	7119      	strb	r1, [r3, #4]
 80097f0:	715a      	strb	r2, [r3, #5]
 80097f2:	f8a3 a006 	strh.w	sl, [r3, #6]
 80097f6:	9b26      	ldr	r3, [sp, #152]	; 0x98
 80097f8:	601a      	str	r2, [r3, #0]
 80097fa:	b01e      	add	sp, #120	; 0x78
 80097fc:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8009800:	f10d 063a 	add.w	r6, sp, #58	; 0x3a
 8009804:	4630      	mov	r0, r6
 8009806:	f04f 0901 	mov.w	r9, #1
 800980a:	9c26      	ldr	r4, [sp, #152]	; 0x98
 800980c:	6825      	ldr	r5, [r4, #0]
 800980e:	f830 4b02 	ldrh.w	r4, [r0], #2
 8009812:	2c00      	cmp	r4, #0
 8009814:	f040 80fb 	bne.w	8009a0e <inflate_table+0x28e>
 8009818:	f109 0901 	add.w	r9, r9, #1
 800981c:	f1b9 0f10 	cmp.w	r9, #16
 8009820:	d1f5      	bne.n	800980e <inflate_table+0x8e>
 8009822:	f8cd 900c 	str.w	r9, [sp, #12]
 8009826:	4634      	mov	r4, r6
 8009828:	2001      	movs	r0, #1
 800982a:	af16      	add	r7, sp, #88	; 0x58
 800982c:	f834 5b02 	ldrh.w	r5, [r4], #2
 8009830:	ebd5 0040 	rsbs	r0, r5, r0, lsl #1
 8009834:	f100 80e6 	bmi.w	8009a04 <inflate_table+0x284>
 8009838:	42a7      	cmp	r7, r4
 800983a:	d1f7      	bne.n	800982c <inflate_table+0xac>
 800983c:	b138      	cbz	r0, 800984e <inflate_table+0xce>
 800983e:	980a      	ldr	r0, [sp, #40]	; 0x28
 8009840:	2800      	cmp	r0, #0
 8009842:	f000 80df 	beq.w	8009a04 <inflate_table+0x284>
 8009846:	f1ba 0f01 	cmp.w	sl, #1
 800984a:	f040 80db 	bne.w	8009a04 <inflate_table+0x284>
 800984e:	2400      	movs	r4, #0
 8009850:	4620      	mov	r0, r4
 8009852:	f8ad 405a 	strh.w	r4, [sp, #90]	; 0x5a
 8009856:	ad17      	add	r5, sp, #92	; 0x5c
 8009858:	f836 4b02 	ldrh.w	r4, [r6], #2
 800985c:	4420      	add	r0, r4
 800985e:	b280      	uxth	r0, r0
 8009860:	429e      	cmp	r6, r3
 8009862:	f825 0b02 	strh.w	r0, [r5], #2
 8009866:	d1f7      	bne.n	8009858 <inflate_table+0xd8>
 8009868:	b1aa      	cbz	r2, 8009896 <inflate_table+0x116>
 800986a:	9b07      	ldr	r3, [sp, #28]
 800986c:	2400      	movs	r4, #0
 800986e:	4618      	mov	r0, r3
 8009870:	eb03 0242 	add.w	r2, r3, r2, lsl #1
 8009874:	f830 3b02 	ldrh.w	r3, [r0], #2
 8009878:	b14b      	cbz	r3, 800988e <inflate_table+0x10e>
 800987a:	ad1e      	add	r5, sp, #120	; 0x78
 800987c:	eb05 0343 	add.w	r3, r5, r3, lsl #1
 8009880:	f833 5c20 	ldrh.w	r5, [r3, #-32]
 8009884:	1c6e      	adds	r6, r5, #1
 8009886:	f821 4015 	strh.w	r4, [r1, r5, lsl #1]
 800988a:	f823 6c20 	strh.w	r6, [r3, #-32]
 800988e:	4282      	cmp	r2, r0
 8009890:	f104 0401 	add.w	r4, r4, #1
 8009894:	d1ee      	bne.n	8009874 <inflate_table+0xf4>
 8009896:	9b0a      	ldr	r3, [sp, #40]	; 0x28
 8009898:	2b00      	cmp	r3, #0
 800989a:	f000 8122 	beq.w	8009ae2 <inflate_table+0x362>
 800989e:	2b01      	cmp	r3, #1
 80098a0:	f000 80be 	beq.w	8009a20 <inflate_table+0x2a0>
 80098a4:	2301      	movs	r3, #1
 80098a6:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 80098aa:	9803      	ldr	r0, [sp, #12]
 80098ac:	9204      	str	r2, [sp, #16]
 80098ae:	4083      	lsls	r3, r0
 80098b0:	980d      	ldr	r0, [sp, #52]	; 0x34
 80098b2:	4a93      	ldr	r2, [pc, #588]	; (8009b00 <inflate_table+0x380>)
 80098b4:	9306      	str	r3, [sp, #24]
 80098b6:	6800      	ldr	r0, [r0, #0]
 80098b8:	3b01      	subs	r3, #1
 80098ba:	9308      	str	r3, [sp, #32]
 80098bc:	f102 0340 	add.w	r3, r2, #64	; 0x40
 80098c0:	920c      	str	r2, [sp, #48]	; 0x30
 80098c2:	9009      	str	r0, [sp, #36]	; 0x24
 80098c4:	930b      	str	r3, [sp, #44]	; 0x2c
 80098c6:	2400      	movs	r4, #0
 80098c8:	9b09      	ldr	r3, [sp, #36]	; 0x24
 80098ca:	46a4      	mov	ip, r4
 80098cc:	9301      	str	r3, [sp, #4]
 80098ce:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
 80098d2:	4648      	mov	r0, r9
 80098d4:	f04f 0b01 	mov.w	fp, #1
 80098d8:	9d03      	ldr	r5, [sp, #12]
 80098da:	9100      	str	r1, [sp, #0]
 80098dc:	9305      	str	r3, [sp, #20]
 80098de:	9b00      	ldr	r3, [sp, #0]
 80098e0:	b2c7      	uxtb	r7, r0
 80098e2:	f833 6b02 	ldrh.w	r6, [r3], #2
 80098e6:	9300      	str	r3, [sp, #0]
 80098e8:	9b04      	ldr	r3, [sp, #16]
 80098ea:	429e      	cmp	r6, r3
 80098ec:	f2c0 80b4 	blt.w	8009a58 <inflate_table+0x2d8>
 80098f0:	f340 80b5 	ble.w	8009a5e <inflate_table+0x2de>
 80098f4:	9b0c      	ldr	r3, [sp, #48]	; 0x30
 80098f6:	f813 e016 	ldrb.w	lr, [r3, r6, lsl #1]
 80098fa:	9b0b      	ldr	r3, [sp, #44]	; 0x2c
 80098fc:	f833 6016 	ldrh.w	r6, [r3, r6, lsl #1]
 8009900:	fa0b f105 	lsl.w	r1, fp, r5
 8009904:	fa24 f30c 	lsr.w	r3, r4, ip
 8009908:	9102      	str	r1, [sp, #8]
 800990a:	440b      	add	r3, r1
 800990c:	9a01      	ldr	r2, [sp, #4]
 800990e:	fa0b f100 	lsl.w	r1, fp, r0
 8009912:	1a5b      	subs	r3, r3, r1
 8009914:	eb02 0383 	add.w	r3, r2, r3, lsl #2
 8009918:	f06f 0203 	mvn.w	r2, #3
 800991c:	fa02 f000 	lsl.w	r0, r2, r0
 8009920:	9a02      	ldr	r2, [sp, #8]
 8009922:	1a52      	subs	r2, r2, r1
 8009924:	f883 e000 	strb.w	lr, [r3]
 8009928:	705f      	strb	r7, [r3, #1]
 800992a:	805e      	strh	r6, [r3, #2]
 800992c:	4403      	add	r3, r0
 800992e:	d1f8      	bne.n	8009922 <inflate_table+0x1a2>
 8009930:	f109 31ff 	add.w	r1, r9, #4294967295	; 0xffffffff
 8009934:	fa0b f301 	lsl.w	r3, fp, r1
 8009938:	421c      	tst	r4, r3
 800993a:	d002      	beq.n	8009942 <inflate_table+0x1c2>
 800993c:	085b      	lsrs	r3, r3, #1
 800993e:	421c      	tst	r4, r3
 8009940:	d1fc      	bne.n	800993c <inflate_table+0x1bc>
 8009942:	b113      	cbz	r3, 800994a <inflate_table+0x1ca>
 8009944:	1e5a      	subs	r2, r3, #1
 8009946:	4014      	ands	r4, r2
 8009948:	4423      	add	r3, r4
 800994a:	aa1e      	add	r2, sp, #120	; 0x78
 800994c:	eb02 0049 	add.w	r0, r2, r9, lsl #1
 8009950:	f830 2c40 	ldrh.w	r2, [r0, #-64]
 8009954:	3a01      	subs	r2, #1
 8009956:	b292      	uxth	r2, r2
 8009958:	f820 2c40 	strh.w	r2, [r0, #-64]
 800995c:	b93a      	cbnz	r2, 800996e <inflate_table+0x1ee>
 800995e:	45d1      	cmp	r9, sl
 8009960:	f000 8085 	beq.w	8009a6e <inflate_table+0x2ee>
 8009964:	9a00      	ldr	r2, [sp, #0]
 8009966:	9907      	ldr	r1, [sp, #28]
 8009968:	8812      	ldrh	r2, [r2, #0]
 800996a:	f831 9012 	ldrh.w	r9, [r1, r2, lsl #1]
 800996e:	9a03      	ldr	r2, [sp, #12]
 8009970:	4591      	cmp	r9, r2
 8009972:	d96d      	bls.n	8009a50 <inflate_table+0x2d0>
 8009974:	9a08      	ldr	r2, [sp, #32]
 8009976:	ea03 0602 	and.w	r6, r3, r2
 800997a:	9a05      	ldr	r2, [sp, #20]
 800997c:	42b2      	cmp	r2, r6
 800997e:	d067      	beq.n	8009a50 <inflate_table+0x2d0>
 8009980:	9a03      	ldr	r2, [sp, #12]
 8009982:	9901      	ldr	r1, [sp, #4]
 8009984:	f1bc 0f00 	cmp.w	ip, #0
 8009988:	bf08      	it	eq
 800998a:	4694      	moveq	ip, r2
 800998c:	2204      	movs	r2, #4
 800998e:	40aa      	lsls	r2, r5
 8009990:	4411      	add	r1, r2
 8009992:	eba9 050c 	sub.w	r5, r9, ip
 8009996:	45d1      	cmp	r9, sl
 8009998:	9101      	str	r1, [sp, #4]
 800999a:	4628      	mov	r0, r5
 800999c:	fa0b f205 	lsl.w	r2, fp, r5
 80099a0:	d219      	bcs.n	80099d6 <inflate_table+0x256>
 80099a2:	a91e      	add	r1, sp, #120	; 0x78
 80099a4:	eb01 0149 	add.w	r1, r1, r9, lsl #1
 80099a8:	f831 1c40 	ldrh.w	r1, [r1, #-64]
 80099ac:	1a52      	subs	r2, r2, r1
 80099ae:	2a00      	cmp	r2, #0
 80099b0:	dd11      	ble.n	80099d6 <inflate_table+0x256>
 80099b2:	eb0c 0105 	add.w	r1, ip, r5
 80099b6:	ac0e      	add	r4, sp, #56	; 0x38
 80099b8:	eb04 0141 	add.w	r1, r4, r1, lsl #1
 80099bc:	e004      	b.n	80099c8 <inflate_table+0x248>
 80099be:	f831 4f02 	ldrh.w	r4, [r1, #2]!
 80099c2:	1b12      	subs	r2, r2, r4
 80099c4:	2a00      	cmp	r2, #0
 80099c6:	dd06      	ble.n	80099d6 <inflate_table+0x256>
 80099c8:	3501      	adds	r5, #1
 80099ca:	eb0c 0405 	add.w	r4, ip, r5
 80099ce:	4554      	cmp	r4, sl
 80099d0:	ea4f 0242 	mov.w	r2, r2, lsl #1
 80099d4:	d3f3      	bcc.n	80099be <inflate_table+0x23e>
 80099d6:	9906      	ldr	r1, [sp, #24]
 80099d8:	fa0b f205 	lsl.w	r2, fp, r5
 80099dc:	4411      	add	r1, r2
 80099de:	9a0a      	ldr	r2, [sp, #40]	; 0x28
 80099e0:	9106      	str	r1, [sp, #24]
 80099e2:	2a01      	cmp	r2, #1
 80099e4:	d03f      	beq.n	8009a66 <inflate_table+0x2e6>
 80099e6:	9c09      	ldr	r4, [sp, #36]	; 0x24
 80099e8:	9901      	ldr	r1, [sp, #4]
 80099ea:	f804 5026 	strb.w	r5, [r4, r6, lsl #2]
 80099ee:	1b0a      	subs	r2, r1, r4
 80099f0:	1092      	asrs	r2, r2, #2
 80099f2:	eb04 0186 	add.w	r1, r4, r6, lsl #2
 80099f6:	804a      	strh	r2, [r1, #2]
 80099f8:	f89d 200c 	ldrb.w	r2, [sp, #12]
 80099fc:	9605      	str	r6, [sp, #20]
 80099fe:	704a      	strb	r2, [r1, #1]
 8009a00:	461c      	mov	r4, r3
 8009a02:	e76c      	b.n	80098de <inflate_table+0x15e>
 8009a04:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8009a08:	b01e      	add	sp, #120	; 0x78
 8009a0a:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8009a0e:	4555      	cmp	r5, sl
 8009a10:	bf28      	it	cs
 8009a12:	4655      	movcs	r5, sl
 8009a14:	454d      	cmp	r5, r9
 8009a16:	4628      	mov	r0, r5
 8009a18:	bf38      	it	cc
 8009a1a:	4648      	movcc	r0, r9
 8009a1c:	9003      	str	r0, [sp, #12]
 8009a1e:	e702      	b.n	8009826 <inflate_table+0xa6>
 8009a20:	4b38      	ldr	r3, [pc, #224]	; (8009b04 <inflate_table+0x384>)
 8009a22:	9803      	ldr	r0, [sp, #12]
 8009a24:	461a      	mov	r2, r3
 8009a26:	930c      	str	r3, [sp, #48]	; 0x30
 8009a28:	9b0a      	ldr	r3, [sp, #40]	; 0x28
 8009a2a:	3240      	adds	r2, #64	; 0x40
 8009a2c:	4083      	lsls	r3, r0
 8009a2e:	9306      	str	r3, [sp, #24]
 8009a30:	920b      	str	r2, [sp, #44]	; 0x2c
 8009a32:	461a      	mov	r2, r3
 8009a34:	3b01      	subs	r3, #1
 8009a36:	9308      	str	r3, [sp, #32]
 8009a38:	9b0d      	ldr	r3, [sp, #52]	; 0x34
 8009a3a:	f5b2 6fb6 	cmp.w	r2, #1456	; 0x5b0
 8009a3e:	681b      	ldr	r3, [r3, #0]
 8009a40:	9309      	str	r3, [sp, #36]	; 0x24
 8009a42:	f44f 7380 	mov.w	r3, #256	; 0x100
 8009a46:	9304      	str	r3, [sp, #16]
 8009a48:	f4ff af3d 	bcc.w	80098c6 <inflate_table+0x146>
 8009a4c:	2001      	movs	r0, #1
 8009a4e:	e6d4      	b.n	80097fa <inflate_table+0x7a>
 8009a50:	eba9 000c 	sub.w	r0, r9, ip
 8009a54:	461c      	mov	r4, r3
 8009a56:	e742      	b.n	80098de <inflate_table+0x15e>
 8009a58:	f04f 0e00 	mov.w	lr, #0
 8009a5c:	e750      	b.n	8009900 <inflate_table+0x180>
 8009a5e:	2600      	movs	r6, #0
 8009a60:	f04f 0e60 	mov.w	lr, #96	; 0x60
 8009a64:	e74c      	b.n	8009900 <inflate_table+0x180>
 8009a66:	f5b1 6fb6 	cmp.w	r1, #1456	; 0x5b0
 8009a6a:	d3bc      	bcc.n	80099e6 <inflate_table+0x266>
 8009a6c:	e7ee      	b.n	8009a4c <inflate_table+0x2cc>
 8009a6e:	b333      	cbz	r3, 8009abe <inflate_table+0x33e>
 8009a70:	2540      	movs	r5, #64	; 0x40
 8009a72:	2601      	movs	r6, #1
 8009a74:	9803      	ldr	r0, [sp, #12]
 8009a76:	f8dd a004 	ldr.w	sl, [sp, #4]
 8009a7a:	fa5f fe80 	uxtb.w	lr, r0
 8009a7e:	f100 39ff 	add.w	r9, r0, #4294967295	; 0xffffffff
 8009a82:	f1bc 0f00 	cmp.w	ip, #0
 8009a86:	d00a      	beq.n	8009a9e <inflate_table+0x31e>
 8009a88:	9808      	ldr	r0, [sp, #32]
 8009a8a:	9c05      	ldr	r4, [sp, #20]
 8009a8c:	4018      	ands	r0, r3
 8009a8e:	4284      	cmp	r4, r0
 8009a90:	d005      	beq.n	8009a9e <inflate_table+0x31e>
 8009a92:	4677      	mov	r7, lr
 8009a94:	f04f 0c00 	mov.w	ip, #0
 8009a98:	4649      	mov	r1, r9
 8009a9a:	f8dd a024 	ldr.w	sl, [sp, #36]	; 0x24
 8009a9e:	fa23 f00c 	lsr.w	r0, r3, ip
 8009aa2:	eb0a 0480 	add.w	r4, sl, r0, lsl #2
 8009aa6:	f80a 5020 	strb.w	r5, [sl, r0, lsl #2]
 8009aaa:	fa06 f001 	lsl.w	r0, r6, r1
 8009aae:	4218      	tst	r0, r3
 8009ab0:	7067      	strb	r7, [r4, #1]
 8009ab2:	8062      	strh	r2, [r4, #2]
 8009ab4:	d011      	beq.n	8009ada <inflate_table+0x35a>
 8009ab6:	0840      	lsrs	r0, r0, #1
 8009ab8:	4218      	tst	r0, r3
 8009aba:	d1fc      	bne.n	8009ab6 <inflate_table+0x336>
 8009abc:	b968      	cbnz	r0, 8009ada <inflate_table+0x35a>
 8009abe:	9a06      	ldr	r2, [sp, #24]
 8009ac0:	9b09      	ldr	r3, [sp, #36]	; 0x24
 8009ac2:	2000      	movs	r0, #0
 8009ac4:	eb03 0382 	add.w	r3, r3, r2, lsl #2
 8009ac8:	9a0d      	ldr	r2, [sp, #52]	; 0x34
 8009aca:	6013      	str	r3, [r2, #0]
 8009acc:	9b26      	ldr	r3, [sp, #152]	; 0x98
 8009ace:	461a      	mov	r2, r3
 8009ad0:	9b03      	ldr	r3, [sp, #12]
 8009ad2:	6013      	str	r3, [r2, #0]
 8009ad4:	b01e      	add	sp, #120	; 0x78
 8009ad6:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8009ada:	1e44      	subs	r4, r0, #1
 8009adc:	4023      	ands	r3, r4
 8009ade:	4403      	add	r3, r0
 8009ae0:	e7cf      	b.n	8009a82 <inflate_table+0x302>
 8009ae2:	2301      	movs	r3, #1
 8009ae4:	9a03      	ldr	r2, [sp, #12]
 8009ae6:	910c      	str	r1, [sp, #48]	; 0x30
 8009ae8:	4093      	lsls	r3, r2
 8009aea:	9306      	str	r3, [sp, #24]
 8009aec:	3b01      	subs	r3, #1
 8009aee:	9308      	str	r3, [sp, #32]
 8009af0:	9b0d      	ldr	r3, [sp, #52]	; 0x34
 8009af2:	910b      	str	r1, [sp, #44]	; 0x2c
 8009af4:	681b      	ldr	r3, [r3, #0]
 8009af6:	9309      	str	r3, [sp, #36]	; 0x24
 8009af8:	2313      	movs	r3, #19
 8009afa:	9304      	str	r3, [sp, #16]
 8009afc:	e6e3      	b.n	80098c6 <inflate_table+0x146>
 8009afe:	bf00      	nop
 8009b00:	0800ec44 	.word	0x0800ec44
 8009b04:	0800eac2 	.word	0x0800eac2

08009b08 <inflateReset>:
 8009b08:	b318      	cbz	r0, 8009b52 <inflateReset+0x4a>
 8009b0a:	69c3      	ldr	r3, [r0, #28]
 8009b0c:	b30b      	cbz	r3, 8009b52 <inflateReset+0x4a>
 8009b0e:	b570      	push	{r4, r5, r6, lr}
 8009b10:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8009b14:	2400      	movs	r4, #0
 8009b16:	2601      	movs	r6, #1
 8009b18:	6b05      	ldr	r5, [r0, #48]	; 0x30
 8009b1a:	f503 62a6 	add.w	r2, r3, #1328	; 0x530
 8009b1e:	61dc      	str	r4, [r3, #28]
 8009b20:	6144      	str	r4, [r0, #20]
 8009b22:	6084      	str	r4, [r0, #8]
 8009b24:	6184      	str	r4, [r0, #24]
 8009b26:	6346      	str	r6, [r0, #52]	; 0x34
 8009b28:	701c      	strb	r4, [r3, #0]
 8009b2a:	605c      	str	r4, [r3, #4]
 8009b2c:	60dc      	str	r4, [r3, #12]
 8009b2e:	621c      	str	r4, [r3, #32]
 8009b30:	629c      	str	r4, [r3, #40]	; 0x28
 8009b32:	62dc      	str	r4, [r3, #44]	; 0x2c
 8009b34:	631c      	str	r4, [r3, #48]	; 0x30
 8009b36:	639c      	str	r4, [r3, #56]	; 0x38
 8009b38:	63dc      	str	r4, [r3, #60]	; 0x3c
 8009b3a:	6159      	str	r1, [r3, #20]
 8009b3c:	66da      	str	r2, [r3, #108]	; 0x6c
 8009b3e:	651a      	str	r2, [r3, #80]	; 0x50
 8009b40:	64da      	str	r2, [r3, #76]	; 0x4c
 8009b42:	b125      	cbz	r5, 8009b4e <inflateReset+0x46>
 8009b44:	4620      	mov	r0, r4
 8009b46:	4621      	mov	r1, r4
 8009b48:	47a8      	blx	r5
 8009b4a:	4620      	mov	r0, r4
 8009b4c:	bd70      	pop	{r4, r5, r6, pc}
 8009b4e:	4628      	mov	r0, r5
 8009b50:	bd70      	pop	{r4, r5, r6, pc}
 8009b52:	f06f 0001 	mvn.w	r0, #1
 8009b56:	4770      	bx	lr

08009b58 <inflateInit2_>:
 8009b58:	2a00      	cmp	r2, #0
 8009b5a:	d032      	beq.n	8009bc2 <inflateInit2_+0x6a>
 8009b5c:	f992 2000 	ldrsb.w	r2, [r2]
 8009b60:	2a31      	cmp	r2, #49	; 0x31
 8009b62:	d12e      	bne.n	8009bc2 <inflateInit2_+0x6a>
 8009b64:	2b3c      	cmp	r3, #60	; 0x3c
 8009b66:	d12c      	bne.n	8009bc2 <inflateInit2_+0x6a>
 8009b68:	b538      	push	{r3, r4, r5, lr}
 8009b6a:	4604      	mov	r4, r0
 8009b6c:	2800      	cmp	r0, #0
 8009b6e:	d03f      	beq.n	8009bf0 <inflateInit2_+0x98>
 8009b70:	2200      	movs	r2, #0
 8009b72:	6a03      	ldr	r3, [r0, #32]
 8009b74:	460d      	mov	r5, r1
 8009b76:	6182      	str	r2, [r0, #24]
 8009b78:	b333      	cbz	r3, 8009bc8 <inflateInit2_+0x70>
 8009b7a:	6a62      	ldr	r2, [r4, #36]	; 0x24
 8009b7c:	6a80      	ldr	r0, [r0, #40]	; 0x28
 8009b7e:	b35a      	cbz	r2, 8009bd8 <inflateInit2_+0x80>
 8009b80:	2101      	movs	r1, #1
 8009b82:	f242 5230 	movw	r2, #9520	; 0x2530
 8009b86:	4798      	blx	r3
 8009b88:	4601      	mov	r1, r0
 8009b8a:	2800      	cmp	r0, #0
 8009b8c:	d033      	beq.n	8009bf6 <inflateInit2_+0x9e>
 8009b8e:	2d00      	cmp	r5, #0
 8009b90:	61e0      	str	r0, [r4, #28]
 8009b92:	db12      	blt.n	8009bba <inflateInit2_+0x62>
 8009b94:	112b      	asrs	r3, r5, #4
 8009b96:	3301      	adds	r3, #1
 8009b98:	2d2f      	cmp	r5, #47	; 0x2f
 8009b9a:	6083      	str	r3, [r0, #8]
 8009b9c:	bfd8      	it	le
 8009b9e:	f005 050f 	andle.w	r5, r5, #15
 8009ba2:	f1a5 0308 	sub.w	r3, r5, #8
 8009ba6:	2b07      	cmp	r3, #7
 8009ba8:	d819      	bhi.n	8009bde <inflateInit2_+0x86>
 8009baa:	2300      	movs	r3, #0
 8009bac:	624d      	str	r5, [r1, #36]	; 0x24
 8009bae:	4620      	mov	r0, r4
 8009bb0:	634b      	str	r3, [r1, #52]	; 0x34
 8009bb2:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8009bb6:	f7ff bfa7 	b.w	8009b08 <inflateReset>
 8009bba:	2300      	movs	r3, #0
 8009bbc:	426d      	negs	r5, r5
 8009bbe:	6083      	str	r3, [r0, #8]
 8009bc0:	e7ef      	b.n	8009ba2 <inflateInit2_+0x4a>
 8009bc2:	f06f 0005 	mvn.w	r0, #5
 8009bc6:	4770      	bx	lr
 8009bc8:	4a0c      	ldr	r2, [pc, #48]	; (8009bfc <inflateInit2_+0xa4>)
 8009bca:	6283      	str	r3, [r0, #40]	; 0x28
 8009bcc:	4618      	mov	r0, r3
 8009bce:	6222      	str	r2, [r4, #32]
 8009bd0:	4613      	mov	r3, r2
 8009bd2:	6a62      	ldr	r2, [r4, #36]	; 0x24
 8009bd4:	2a00      	cmp	r2, #0
 8009bd6:	d1d3      	bne.n	8009b80 <inflateInit2_+0x28>
 8009bd8:	4a09      	ldr	r2, [pc, #36]	; (8009c00 <inflateInit2_+0xa8>)
 8009bda:	6262      	str	r2, [r4, #36]	; 0x24
 8009bdc:	e7d0      	b.n	8009b80 <inflateInit2_+0x28>
 8009bde:	6a63      	ldr	r3, [r4, #36]	; 0x24
 8009be0:	6aa0      	ldr	r0, [r4, #40]	; 0x28
 8009be2:	2200      	movs	r2, #0
 8009be4:	4798      	blx	r3
 8009be6:	2300      	movs	r3, #0
 8009be8:	f06f 0001 	mvn.w	r0, #1
 8009bec:	61e3      	str	r3, [r4, #28]
 8009bee:	bd38      	pop	{r3, r4, r5, pc}
 8009bf0:	f06f 0001 	mvn.w	r0, #1
 8009bf4:	bd38      	pop	{r3, r4, r5, pc}
 8009bf6:	f06f 0003 	mvn.w	r0, #3
 8009bfa:	bd38      	pop	{r3, r4, r5, pc}
 8009bfc:	08009321 	.word	0x08009321
 8009c00:	08009329 	.word	0x08009329

08009c04 <inflateInit_>:
 8009c04:	4613      	mov	r3, r2
 8009c06:	460a      	mov	r2, r1
 8009c08:	210f      	movs	r1, #15
 8009c0a:	f7ff bfa5 	b.w	8009b58 <inflateInit2_>
 8009c0e:	bf00      	nop

08009c10 <inflateEnd>:
 8009c10:	b1e8      	cbz	r0, 8009c4e <inflateEnd+0x3e>
 8009c12:	b538      	push	{r3, r4, r5, lr}
 8009c14:	69c5      	ldr	r5, [r0, #28]
 8009c16:	b1bd      	cbz	r5, 8009c48 <inflateEnd+0x38>
 8009c18:	6a43      	ldr	r3, [r0, #36]	; 0x24
 8009c1a:	b1ab      	cbz	r3, 8009c48 <inflateEnd+0x38>
 8009c1c:	6b69      	ldr	r1, [r5, #52]	; 0x34
 8009c1e:	4604      	mov	r4, r0
 8009c20:	b159      	cbz	r1, 8009c3a <inflateEnd+0x2a>
 8009c22:	6b02      	ldr	r2, [r0, #48]	; 0x30
 8009c24:	b122      	cbz	r2, 8009c30 <inflateEnd+0x20>
 8009c26:	2100      	movs	r1, #0
 8009c28:	4608      	mov	r0, r1
 8009c2a:	4790      	blx	r2
 8009c2c:	6b69      	ldr	r1, [r5, #52]	; 0x34
 8009c2e:	6a63      	ldr	r3, [r4, #36]	; 0x24
 8009c30:	2200      	movs	r2, #0
 8009c32:	6aa0      	ldr	r0, [r4, #40]	; 0x28
 8009c34:	4798      	blx	r3
 8009c36:	6a63      	ldr	r3, [r4, #36]	; 0x24
 8009c38:	69e5      	ldr	r5, [r4, #28]
 8009c3a:	6aa0      	ldr	r0, [r4, #40]	; 0x28
 8009c3c:	4629      	mov	r1, r5
 8009c3e:	2200      	movs	r2, #0
 8009c40:	4798      	blx	r3
 8009c42:	2000      	movs	r0, #0
 8009c44:	61e0      	str	r0, [r4, #28]
 8009c46:	bd38      	pop	{r3, r4, r5, pc}
 8009c48:	f06f 0001 	mvn.w	r0, #1
 8009c4c:	bd38      	pop	{r3, r4, r5, pc}
 8009c4e:	f06f 0001 	mvn.w	r0, #1
 8009c52:	4770      	bx	lr

08009c54 <adler32>:
 8009c54:	2a01      	cmp	r2, #1
 8009c56:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8009c5a:	ea4f 4510 	mov.w	r5, r0, lsr #16
 8009c5e:	b286      	uxth	r6, r0
 8009c60:	f000 8106 	beq.w	8009e70 <adler32+0x21c>
 8009c64:	2900      	cmp	r1, #0
 8009c66:	f000 8118 	beq.w	8009e9a <adler32+0x246>
 8009c6a:	2a0f      	cmp	r2, #15
 8009c6c:	f240 80e2 	bls.w	8009e34 <adler32+0x1e0>
 8009c70:	f241 59af 	movw	r9, #5551	; 0x15af
 8009c74:	454a      	cmp	r2, r9
 8009c76:	d968      	bls.n	8009d4a <adler32+0xf6>
 8009c78:	f241 5ab0 	movw	sl, #5552	; 0x15b0
 8009c7c:	f8df c228 	ldr.w	ip, [pc, #552]	; 8009ea8 <adler32+0x254>
 8009c80:	f5a2 5ead 	sub.w	lr, r2, #5536	; 0x15a0
 8009c84:	f1ae 0210 	sub.w	r2, lr, #16
 8009c88:	f101 0410 	add.w	r4, r1, #16
 8009c8c:	f501 57ae 	add.w	r7, r1, #5568	; 0x15c0
 8009c90:	f814 3c10 	ldrb.w	r3, [r4, #-16]
 8009c94:	f814 bc0f 	ldrb.w	fp, [r4, #-15]
 8009c98:	4433      	add	r3, r6
 8009c9a:	f814 0c0e 	ldrb.w	r0, [r4, #-14]
 8009c9e:	f814 6c0d 	ldrb.w	r6, [r4, #-13]
 8009ca2:	449b      	add	fp, r3
 8009ca4:	4458      	add	r0, fp
 8009ca6:	445b      	add	r3, fp
 8009ca8:	f814 bc0c 	ldrb.w	fp, [r4, #-12]
 8009cac:	4403      	add	r3, r0
 8009cae:	4430      	add	r0, r6
 8009cb0:	f814 6c0b 	ldrb.w	r6, [r4, #-11]
 8009cb4:	4403      	add	r3, r0
 8009cb6:	4458      	add	r0, fp
 8009cb8:	f814 bc0a 	ldrb.w	fp, [r4, #-10]
 8009cbc:	4403      	add	r3, r0
 8009cbe:	4430      	add	r0, r6
 8009cc0:	f814 6c09 	ldrb.w	r6, [r4, #-9]
 8009cc4:	4403      	add	r3, r0
 8009cc6:	4458      	add	r0, fp
 8009cc8:	f814 bc08 	ldrb.w	fp, [r4, #-8]
 8009ccc:	4403      	add	r3, r0
 8009cce:	4430      	add	r0, r6
 8009cd0:	f814 6c07 	ldrb.w	r6, [r4, #-7]
 8009cd4:	4403      	add	r3, r0
 8009cd6:	4458      	add	r0, fp
 8009cd8:	f814 bc06 	ldrb.w	fp, [r4, #-6]
 8009cdc:	4403      	add	r3, r0
 8009cde:	4430      	add	r0, r6
 8009ce0:	f814 6c05 	ldrb.w	r6, [r4, #-5]
 8009ce4:	4403      	add	r3, r0
 8009ce6:	4458      	add	r0, fp
 8009ce8:	f814 bc04 	ldrb.w	fp, [r4, #-4]
 8009cec:	4403      	add	r3, r0
 8009cee:	4430      	add	r0, r6
 8009cf0:	f814 6c03 	ldrb.w	r6, [r4, #-3]
 8009cf4:	4403      	add	r3, r0
 8009cf6:	4458      	add	r0, fp
 8009cf8:	f814 bc02 	ldrb.w	fp, [r4, #-2]
 8009cfc:	4403      	add	r3, r0
 8009cfe:	4430      	add	r0, r6
 8009d00:	f814 6c01 	ldrb.w	r6, [r4, #-1]
 8009d04:	4403      	add	r3, r0
 8009d06:	4458      	add	r0, fp
 8009d08:	4403      	add	r3, r0
 8009d0a:	4406      	add	r6, r0
 8009d0c:	3410      	adds	r4, #16
 8009d0e:	4433      	add	r3, r6
 8009d10:	42a7      	cmp	r7, r4
 8009d12:	441d      	add	r5, r3
 8009d14:	d1bc      	bne.n	8009c90 <adler32+0x3c>
 8009d16:	fbac 3006 	umull	r3, r0, ip, r6
 8009d1a:	fbac 4305 	umull	r4, r3, ip, r5
 8009d1e:	0bc0      	lsrs	r0, r0, #15
 8009d20:	0bdb      	lsrs	r3, r3, #15
 8009d22:	ebc0 3700 	rsb	r7, r0, r0, lsl #12
 8009d26:	ebc3 3403 	rsb	r4, r3, r3, lsl #12
 8009d2a:	eb00 1007 	add.w	r0, r0, r7, lsl #4
 8009d2e:	eb03 1304 	add.w	r3, r3, r4, lsl #4
 8009d32:	454a      	cmp	r2, r9
 8009d34:	4451      	add	r1, sl
 8009d36:	eba6 0600 	sub.w	r6, r6, r0
 8009d3a:	eba5 0503 	sub.w	r5, r5, r3
 8009d3e:	d89f      	bhi.n	8009c80 <adler32+0x2c>
 8009d40:	2a00      	cmp	r2, #0
 8009d42:	d073      	beq.n	8009e2c <adler32+0x1d8>
 8009d44:	2a0f      	cmp	r2, #15
 8009d46:	f240 80ab 	bls.w	8009ea0 <adler32+0x24c>
 8009d4a:	4614      	mov	r4, r2
 8009d4c:	f101 0010 	add.w	r0, r1, #16
 8009d50:	f810 3c10 	ldrb.w	r3, [r0, #-16]
 8009d54:	f810 cc0f 	ldrb.w	ip, [r0, #-15]
 8009d58:	441e      	add	r6, r3
 8009d5a:	f810 7c0e 	ldrb.w	r7, [r0, #-14]
 8009d5e:	44b4      	add	ip, r6
 8009d60:	f810 ec0d 	ldrb.w	lr, [r0, #-13]
 8009d64:	eb06 030c 	add.w	r3, r6, ip
 8009d68:	eb07 060c 	add.w	r6, r7, ip
 8009d6c:	f810 7c0c 	ldrb.w	r7, [r0, #-12]
 8009d70:	44b6      	add	lr, r6
 8009d72:	4433      	add	r3, r6
 8009d74:	f810 6c0b 	ldrb.w	r6, [r0, #-11]
 8009d78:	4477      	add	r7, lr
 8009d7a:	4473      	add	r3, lr
 8009d7c:	f810 ec0a 	ldrb.w	lr, [r0, #-10]
 8009d80:	443e      	add	r6, r7
 8009d82:	443b      	add	r3, r7
 8009d84:	f810 7c09 	ldrb.w	r7, [r0, #-9]
 8009d88:	44b6      	add	lr, r6
 8009d8a:	4433      	add	r3, r6
 8009d8c:	f810 6c08 	ldrb.w	r6, [r0, #-8]
 8009d90:	4477      	add	r7, lr
 8009d92:	4473      	add	r3, lr
 8009d94:	f810 ec07 	ldrb.w	lr, [r0, #-7]
 8009d98:	443e      	add	r6, r7
 8009d9a:	443b      	add	r3, r7
 8009d9c:	f810 7c06 	ldrb.w	r7, [r0, #-6]
 8009da0:	44b6      	add	lr, r6
 8009da2:	4433      	add	r3, r6
 8009da4:	f810 6c05 	ldrb.w	r6, [r0, #-5]
 8009da8:	4477      	add	r7, lr
 8009daa:	4473      	add	r3, lr
 8009dac:	f810 ec04 	ldrb.w	lr, [r0, #-4]
 8009db0:	443e      	add	r6, r7
 8009db2:	443b      	add	r3, r7
 8009db4:	f810 7c03 	ldrb.w	r7, [r0, #-3]
 8009db8:	44b6      	add	lr, r6
 8009dba:	4433      	add	r3, r6
 8009dbc:	f810 6c02 	ldrb.w	r6, [r0, #-2]
 8009dc0:	4477      	add	r7, lr
 8009dc2:	4473      	add	r3, lr
 8009dc4:	f810 ec01 	ldrb.w	lr, [r0, #-1]
 8009dc8:	443e      	add	r6, r7
 8009dca:	443b      	add	r3, r7
 8009dcc:	4433      	add	r3, r6
 8009dce:	3c10      	subs	r4, #16
 8009dd0:	4476      	add	r6, lr
 8009dd2:	4433      	add	r3, r6
 8009dd4:	2c0f      	cmp	r4, #15
 8009dd6:	441d      	add	r5, r3
 8009dd8:	f100 0010 	add.w	r0, r0, #16
 8009ddc:	d8b8      	bhi.n	8009d50 <adler32+0xfc>
 8009dde:	f1a2 0310 	sub.w	r3, r2, #16
 8009de2:	f023 000f 	bic.w	r0, r3, #15
 8009de6:	f023 0e0f 	bic.w	lr, r3, #15
 8009dea:	3010      	adds	r0, #16
 8009dec:	f1a2 0311 	sub.w	r3, r2, #17
 8009df0:	0712      	lsls	r2, r2, #28
 8009df2:	4401      	add	r1, r0
 8009df4:	eba3 030e 	sub.w	r3, r3, lr
 8009df8:	d007      	beq.n	8009e0a <adler32+0x1b6>
 8009dfa:	440b      	add	r3, r1
 8009dfc:	3901      	subs	r1, #1
 8009dfe:	f811 2f01 	ldrb.w	r2, [r1, #1]!
 8009e02:	4416      	add	r6, r2
 8009e04:	428b      	cmp	r3, r1
 8009e06:	4435      	add	r5, r6
 8009e08:	d1f9      	bne.n	8009dfe <adler32+0x1aa>
 8009e0a:	4b27      	ldr	r3, [pc, #156]	; (8009ea8 <adler32+0x254>)
 8009e0c:	fba3 1206 	umull	r1, r2, r3, r6
 8009e10:	fba3 1305 	umull	r1, r3, r3, r5
 8009e14:	0bd2      	lsrs	r2, r2, #15
 8009e16:	0bdb      	lsrs	r3, r3, #15
 8009e18:	ebc2 3002 	rsb	r0, r2, r2, lsl #12
 8009e1c:	ebc3 3103 	rsb	r1, r3, r3, lsl #12
 8009e20:	eb02 1200 	add.w	r2, r2, r0, lsl #4
 8009e24:	eb03 1301 	add.w	r3, r3, r1, lsl #4
 8009e28:	1ab6      	subs	r6, r6, r2
 8009e2a:	1aed      	subs	r5, r5, r3
 8009e2c:	ea46 4005 	orr.w	r0, r6, r5, lsl #16
 8009e30:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8009e34:	b132      	cbz	r2, 8009e44 <adler32+0x1f0>
 8009e36:	440a      	add	r2, r1
 8009e38:	f811 3b01 	ldrb.w	r3, [r1], #1
 8009e3c:	441e      	add	r6, r3
 8009e3e:	4291      	cmp	r1, r2
 8009e40:	4435      	add	r5, r6
 8009e42:	d1f9      	bne.n	8009e38 <adler32+0x1e4>
 8009e44:	f64f 73f0 	movw	r3, #65520	; 0xfff0
 8009e48:	429e      	cmp	r6, r3
 8009e4a:	4b17      	ldr	r3, [pc, #92]	; (8009ea8 <adler32+0x254>)
 8009e4c:	bf88      	it	hi
 8009e4e:	f5a6 467f 	subhi.w	r6, r6, #65280	; 0xff00
 8009e52:	fba3 2305 	umull	r2, r3, r3, r5
 8009e56:	ea4f 33d3 	mov.w	r3, r3, lsr #15
 8009e5a:	ebc3 3203 	rsb	r2, r3, r3, lsl #12
 8009e5e:	eb03 1302 	add.w	r3, r3, r2, lsl #4
 8009e62:	bf88      	it	hi
 8009e64:	3ef1      	subhi	r6, #241	; 0xf1
 8009e66:	1aed      	subs	r5, r5, r3
 8009e68:	ea46 4005 	orr.w	r0, r6, r5, lsl #16
 8009e6c:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8009e70:	f64f 73f0 	movw	r3, #65520	; 0xfff0
 8009e74:	780a      	ldrb	r2, [r1, #0]
 8009e76:	4416      	add	r6, r2
 8009e78:	429e      	cmp	r6, r3
 8009e7a:	f64f 73f0 	movw	r3, #65520	; 0xfff0
 8009e7e:	bf84      	itt	hi
 8009e80:	f5a6 467f 	subhi.w	r6, r6, #65280	; 0xff00
 8009e84:	3ef1      	subhi	r6, #241	; 0xf1
 8009e86:	4435      	add	r5, r6
 8009e88:	429d      	cmp	r5, r3
 8009e8a:	d9cf      	bls.n	8009e2c <adler32+0x1d8>
 8009e8c:	f5a5 457f 	sub.w	r5, r5, #65280	; 0xff00
 8009e90:	3df1      	subs	r5, #241	; 0xf1
 8009e92:	ea46 4005 	orr.w	r0, r6, r5, lsl #16
 8009e96:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8009e9a:	2001      	movs	r0, #1
 8009e9c:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 8009ea0:	f1ae 0311 	sub.w	r3, lr, #17
 8009ea4:	e7a9      	b.n	8009dfa <adler32+0x1a6>
 8009ea6:	bf00      	nop
 8009ea8:	80078071 	.word	0x80078071

08009eac <inflate>:
 8009eac:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 8009eb0:	b08e      	sub	sp, #56	; 0x38
 8009eb2:	2800      	cmp	r0, #0
 8009eb4:	f000 83b9 	beq.w	800a62a <inflate+0x77e>
 8009eb8:	f8d0 b01c 	ldr.w	fp, [r0, #28]
 8009ebc:	f1bb 0f00 	cmp.w	fp, #0
 8009ec0:	f000 83b3 	beq.w	800a62a <inflate+0x77e>
 8009ec4:	6843      	ldr	r3, [r0, #4]
 8009ec6:	f8d0 9000 	ldr.w	r9, [r0]
 8009eca:	9304      	str	r3, [sp, #16]
 8009ecc:	f1b9 0f00 	cmp.w	r9, #0
 8009ed0:	f000 83a8 	beq.w	800a624 <inflate+0x778>
 8009ed4:	f89b 3000 	ldrb.w	r3, [fp]
 8009ed8:	2b0b      	cmp	r3, #11
 8009eda:	f000 8292 	beq.w	800a402 <inflate+0x556>
 8009ede:	4682      	mov	sl, r0
 8009ee0:	6902      	ldr	r2, [r0, #16]
 8009ee2:	9d04      	ldr	r5, [sp, #16]
 8009ee4:	9202      	str	r2, [sp, #8]
 8009ee6:	9206      	str	r2, [sp, #24]
 8009ee8:	68c2      	ldr	r2, [r0, #12]
 8009eea:	f8db 6038 	ldr.w	r6, [fp, #56]	; 0x38
 8009eee:	9203      	str	r2, [sp, #12]
 8009ef0:	4a90      	ldr	r2, [pc, #576]	; (800a134 <inflate+0x288>)
 8009ef2:	f8db 403c 	ldr.w	r4, [fp, #60]	; 0x3c
 8009ef6:	3a80      	subs	r2, #128	; 0x80
 8009ef8:	9107      	str	r1, [sp, #28]
 8009efa:	9205      	str	r2, [sp, #20]
 8009efc:	2b1c      	cmp	r3, #28
 8009efe:	f200 8394 	bhi.w	800a62a <inflate+0x77e>
 8009f02:	e8df f013 	tbh	[pc, r3, lsl #1]
 8009f06:	0600      	.short	0x0600
 8009f08:	00620105 	.word	0x00620105
 8009f0c:	060a007b 	.word	0x060a007b
 8009f10:	062808e6 	.word	0x062808e6
 8009f14:	053304be 	.word	0x053304be
 8009f18:	0185016f 	.word	0x0185016f
 8009f1c:	01960192 	.word	0x01960192
 8009f20:	05a801bc 	.word	0x05a801bc
 8009f24:	05ce0026 	.word	0x05ce0026
 8009f28:	02e50538 	.word	0x02e50538
 8009f2c:	03af05a2 	.word	0x03af05a2
 8009f30:	043d0473 	.word	0x043d0473
 8009f34:	029102d6 	.word	0x029102d6
 8009f38:	07eb049e 	.word	0x07eb049e
 8009f3c:	08ea0113 	.word	0x08ea0113
 8009f40:	2d00      	cmp	r5, #0
 8009f42:	f000 81bd 	beq.w	800a2c0 <inflate+0x414>
 8009f46:	f819 3b01 	ldrb.w	r3, [r9], #1
 8009f4a:	3d01      	subs	r5, #1
 8009f4c:	40a3      	lsls	r3, r4
 8009f4e:	441e      	add	r6, r3
 8009f50:	3408      	adds	r4, #8
 8009f52:	2c0d      	cmp	r4, #13
 8009f54:	d9f4      	bls.n	8009f40 <inflate+0x94>
 8009f56:	f006 031f 	and.w	r3, r6, #31
 8009f5a:	f3c6 1244 	ubfx	r2, r6, #5, #5
 8009f5e:	f3c6 2083 	ubfx	r0, r6, #10, #4
 8009f62:	f203 1301 	addw	r3, r3, #257	; 0x101
 8009f66:	3201      	adds	r2, #1
 8009f68:	3004      	adds	r0, #4
 8009f6a:	f5b3 7f8f 	cmp.w	r3, #286	; 0x11e
 8009f6e:	f1a4 040e 	sub.w	r4, r4, #14
 8009f72:	f8cb 3060 	str.w	r3, [fp, #96]	; 0x60
 8009f76:	f8cb 2064 	str.w	r2, [fp, #100]	; 0x64
 8009f7a:	f8cb 005c 	str.w	r0, [fp, #92]	; 0x5c
 8009f7e:	ea4f 3696 	mov.w	r6, r6, lsr #14
 8009f82:	f200 8673 	bhi.w	800ac6c <inflate+0xdc0>
 8009f86:	2a1e      	cmp	r2, #30
 8009f88:	f200 8670 	bhi.w	800ac6c <inflate+0xdc0>
 8009f8c:	2300      	movs	r3, #0
 8009f8e:	2210      	movs	r2, #16
 8009f90:	f8cb 3068 	str.w	r3, [fp, #104]	; 0x68
 8009f94:	f88b 2000 	strb.w	r2, [fp]
 8009f98:	f000 bd8a 	b.w	800aab0 <inflate+0xc04>
 8009f9c:	f8db 3020 	ldr.w	r3, [fp, #32]
 8009fa0:	b113      	cbz	r3, 8009fa8 <inflate+0xfc>
 8009fa2:	f3c6 2200 	ubfx	r2, r6, #8, #1
 8009fa6:	601a      	str	r2, [r3, #0]
 8009fa8:	05b1      	lsls	r1, r6, #22
 8009faa:	f101 8036 	bmi.w	800b01a <inflate+0x116e>
 8009fae:	2400      	movs	r4, #0
 8009fb0:	2302      	movs	r3, #2
 8009fb2:	4626      	mov	r6, r4
 8009fb4:	f88b 3000 	strb.w	r3, [fp]
 8009fb8:	2d00      	cmp	r5, #0
 8009fba:	f000 8181 	beq.w	800a2c0 <inflate+0x414>
 8009fbe:	f819 3b01 	ldrb.w	r3, [r9], #1
 8009fc2:	3d01      	subs	r5, #1
 8009fc4:	40a3      	lsls	r3, r4
 8009fc6:	441e      	add	r6, r3
 8009fc8:	3408      	adds	r4, #8
 8009fca:	2c1f      	cmp	r4, #31
 8009fcc:	d9f4      	bls.n	8009fb8 <inflate+0x10c>
 8009fce:	f8db 3020 	ldr.w	r3, [fp, #32]
 8009fd2:	b103      	cbz	r3, 8009fd6 <inflate+0x12a>
 8009fd4:	605e      	str	r6, [r3, #4]
 8009fd6:	f8db 3010 	ldr.w	r3, [fp, #16]
 8009fda:	059a      	lsls	r2, r3, #22
 8009fdc:	f100 86bc 	bmi.w	800ad58 <inflate+0xeac>
 8009fe0:	2600      	movs	r6, #0
 8009fe2:	2303      	movs	r3, #3
 8009fe4:	4634      	mov	r4, r6
 8009fe6:	f88b 3000 	strb.w	r3, [fp]
 8009fea:	2d00      	cmp	r5, #0
 8009fec:	f000 8168 	beq.w	800a2c0 <inflate+0x414>
 8009ff0:	f819 3b01 	ldrb.w	r3, [r9], #1
 8009ff4:	3d01      	subs	r5, #1
 8009ff6:	40a3      	lsls	r3, r4
 8009ff8:	441e      	add	r6, r3
 8009ffa:	3408      	adds	r4, #8
 8009ffc:	2c0f      	cmp	r4, #15
 8009ffe:	d9f4      	bls.n	8009fea <inflate+0x13e>
 800a000:	f8db 3020 	ldr.w	r3, [fp, #32]
 800a004:	b11b      	cbz	r3, 800a00e <inflate+0x162>
 800a006:	b2f1      	uxtb	r1, r6
 800a008:	0a32      	lsrs	r2, r6, #8
 800a00a:	6099      	str	r1, [r3, #8]
 800a00c:	60da      	str	r2, [r3, #12]
 800a00e:	f8db 2010 	ldr.w	r2, [fp, #16]
 800a012:	0593      	lsls	r3, r2, #22
 800a014:	f100 864f 	bmi.w	800acb6 <inflate+0xe0a>
 800a018:	2304      	movs	r3, #4
 800a01a:	f412 6480 	ands.w	r4, r2, #1024	; 0x400
 800a01e:	f88b 3000 	strb.w	r3, [fp]
 800a022:	f040 8620 	bne.w	800ac66 <inflate+0xdba>
 800a026:	4626      	mov	r6, r4
 800a028:	f8db 3020 	ldr.w	r3, [fp, #32]
 800a02c:	b10b      	cbz	r3, 800a032 <inflate+0x186>
 800a02e:	2100      	movs	r1, #0
 800a030:	6119      	str	r1, [r3, #16]
 800a032:	2305      	movs	r3, #5
 800a034:	f88b 3000 	strb.w	r3, [fp]
 800a038:	0550      	lsls	r0, r2, #21
 800a03a:	d50d      	bpl.n	800a058 <inflate+0x1ac>
 800a03c:	f8db 3040 	ldr.w	r3, [fp, #64]	; 0x40
 800a040:	462f      	mov	r7, r5
 800a042:	429d      	cmp	r5, r3
 800a044:	bf28      	it	cs
 800a046:	461f      	movcs	r7, r3
 800a048:	2f00      	cmp	r7, #0
 800a04a:	f040 85b6 	bne.w	800abba <inflate+0xd0e>
 800a04e:	2b00      	cmp	r3, #0
 800a050:	f040 85ec 	bne.w	800ac2c <inflate+0xd80>
 800a054:	f8db 2010 	ldr.w	r2, [fp, #16]
 800a058:	2100      	movs	r1, #0
 800a05a:	2306      	movs	r3, #6
 800a05c:	f8cb 1040 	str.w	r1, [fp, #64]	; 0x40
 800a060:	f88b 3000 	strb.w	r3, [fp]
 800a064:	f412 6100 	ands.w	r1, r2, #2048	; 0x800
 800a068:	f000 856a 	beq.w	800ab40 <inflate+0xc94>
 800a06c:	2d00      	cmp	r5, #0
 800a06e:	f000 8127 	beq.w	800a2c0 <inflate+0x414>
 800a072:	2700      	movs	r7, #0
 800a074:	46a6      	mov	lr, r4
 800a076:	f109 31ff 	add.w	r1, r9, #4294967295	; 0xffffffff
 800a07a:	f8db 3020 	ldr.w	r3, [fp, #32]
 800a07e:	3701      	adds	r7, #1
 800a080:	f811 2f01 	ldrb.w	r2, [r1, #1]!
 800a084:	b153      	cbz	r3, 800a09c <inflate+0x1f0>
 800a086:	69d8      	ldr	r0, [r3, #28]
 800a088:	b140      	cbz	r0, 800a09c <inflate+0x1f0>
 800a08a:	6a1c      	ldr	r4, [r3, #32]
 800a08c:	f8db 3040 	ldr.w	r3, [fp, #64]	; 0x40
 800a090:	42a3      	cmp	r3, r4
 800a092:	d203      	bcs.n	800a09c <inflate+0x1f0>
 800a094:	1c5c      	adds	r4, r3, #1
 800a096:	f8cb 4040 	str.w	r4, [fp, #64]	; 0x40
 800a09a:	54c2      	strb	r2, [r0, r3]
 800a09c:	2a00      	cmp	r2, #0
 800a09e:	f000 855e 	beq.w	800ab5e <inflate+0xcb2>
 800a0a2:	42bd      	cmp	r5, r7
 800a0a4:	d1e9      	bne.n	800a07a <inflate+0x1ce>
 800a0a6:	f8db 3010 	ldr.w	r3, [fp, #16]
 800a0aa:	4674      	mov	r4, lr
 800a0ac:	f413 7300 	ands.w	r3, r3, #512	; 0x200
 800a0b0:	9305      	str	r3, [sp, #20]
 800a0b2:	f000 8717 	beq.w	800aee4 <inflate+0x1038>
 800a0b6:	4649      	mov	r1, r9
 800a0b8:	462a      	mov	r2, r5
 800a0ba:	f8db 0018 	ldr.w	r0, [fp, #24]
 800a0be:	f7fd fe63 	bl	8007d88 <crc32>
 800a0c2:	44a9      	add	r9, r5
 800a0c4:	2500      	movs	r5, #0
 800a0c6:	f8cb 0018 	str.w	r0, [fp, #24]
 800a0ca:	9505      	str	r5, [sp, #20]
 800a0cc:	e0f9      	b.n	800a2c2 <inflate+0x416>
 800a0ce:	2200      	movs	r2, #0
 800a0d0:	4611      	mov	r1, r2
 800a0d2:	4610      	mov	r0, r2
 800a0d4:	f7fd fe58 	bl	8007d88 <crc32>
 800a0d8:	211f      	movs	r1, #31
 800a0da:	238b      	movs	r3, #139	; 0x8b
 800a0dc:	2400      	movs	r4, #0
 800a0de:	f88d 1034 	strb.w	r1, [sp, #52]	; 0x34
 800a0e2:	f8cb 0018 	str.w	r0, [fp, #24]
 800a0e6:	2202      	movs	r2, #2
 800a0e8:	a90d      	add	r1, sp, #52	; 0x34
 800a0ea:	f88d 3035 	strb.w	r3, [sp, #53]	; 0x35
 800a0ee:	f7fd fe4b 	bl	8007d88 <crc32>
 800a0f2:	2301      	movs	r3, #1
 800a0f4:	4626      	mov	r6, r4
 800a0f6:	f8cb 0018 	str.w	r0, [fp, #24]
 800a0fa:	f88b 3000 	strb.w	r3, [fp]
 800a0fe:	2d00      	cmp	r5, #0
 800a100:	f000 80de 	beq.w	800a2c0 <inflate+0x414>
 800a104:	f819 3b01 	ldrb.w	r3, [r9], #1
 800a108:	3d01      	subs	r5, #1
 800a10a:	40a3      	lsls	r3, r4
 800a10c:	441e      	add	r6, r3
 800a10e:	3408      	adds	r4, #8
 800a110:	2c0f      	cmp	r4, #15
 800a112:	d9f4      	bls.n	800a0fe <inflate+0x252>
 800a114:	b2f3      	uxtb	r3, r6
 800a116:	2b08      	cmp	r3, #8
 800a118:	f8cb 6010 	str.w	r6, [fp, #16]
 800a11c:	f000 863d 	beq.w	800ad9a <inflate+0xeee>
 800a120:	231b      	movs	r3, #27
 800a122:	4a05      	ldr	r2, [pc, #20]	; (800a138 <inflate+0x28c>)
 800a124:	f8ca 2018 	str.w	r2, [sl, #24]
 800a128:	f88b 3000 	strb.w	r3, [fp]
 800a12c:	f06f 0302 	mvn.w	r3, #2
 800a130:	9305      	str	r3, [sp, #20]
 800a132:	e0c6      	b.n	800a2c2 <inflate+0x416>
 800a134:	0800f5c4 	.word	0x0800f5c4
 800a138:	0800f680 	.word	0x0800f680
 800a13c:	2d00      	cmp	r5, #0
 800a13e:	f000 80bf 	beq.w	800a2c0 <inflate+0x414>
 800a142:	f819 3b01 	ldrb.w	r3, [r9], #1
 800a146:	3d01      	subs	r5, #1
 800a148:	40a3      	lsls	r3, r4
 800a14a:	441e      	add	r6, r3
 800a14c:	3408      	adds	r4, #8
 800a14e:	2c0f      	cmp	r4, #15
 800a150:	d9f4      	bls.n	800a13c <inflate+0x290>
 800a152:	0797      	lsls	r7, r2, #30
 800a154:	d503      	bpl.n	800a15e <inflate+0x2b2>
 800a156:	f648 331f 	movw	r3, #35615	; 0x8b1f
 800a15a:	429e      	cmp	r6, r3
 800a15c:	d0b7      	beq.n	800a0ce <inflate+0x222>
 800a15e:	2100      	movs	r1, #0
 800a160:	f8db 3020 	ldr.w	r3, [fp, #32]
 800a164:	f8cb 1010 	str.w	r1, [fp, #16]
 800a168:	b113      	cbz	r3, 800a170 <inflate+0x2c4>
 800a16a:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
 800a16e:	6319      	str	r1, [r3, #48]	; 0x30
 800a170:	07d0      	lsls	r0, r2, #31
 800a172:	f140 85c3 	bpl.w	800acfc <inflate+0xe50>
 800a176:	0232      	lsls	r2, r6, #8
 800a178:	b292      	uxth	r2, r2
 800a17a:	4bc7      	ldr	r3, [pc, #796]	; (800a498 <inflate+0x5ec>)
 800a17c:	eb02 2216 	add.w	r2, r2, r6, lsr #8
 800a180:	fba3 1302 	umull	r1, r3, r3, r2
 800a184:	1ad1      	subs	r1, r2, r3
 800a186:	eb03 0351 	add.w	r3, r3, r1, lsr #1
 800a18a:	091b      	lsrs	r3, r3, #4
 800a18c:	ebc3 1343 	rsb	r3, r3, r3, lsl #5
 800a190:	1ad3      	subs	r3, r2, r3
 800a192:	f040 85b3 	bne.w	800acfc <inflate+0xe50>
 800a196:	f006 020f 	and.w	r2, r6, #15
 800a19a:	2a08      	cmp	r2, #8
 800a19c:	d1c0      	bne.n	800a120 <inflate+0x274>
 800a19e:	0936      	lsrs	r6, r6, #4
 800a1a0:	f006 020f 	and.w	r2, r6, #15
 800a1a4:	f8db 1024 	ldr.w	r1, [fp, #36]	; 0x24
 800a1a8:	3208      	adds	r2, #8
 800a1aa:	428a      	cmp	r2, r1
 800a1ac:	f200 8702 	bhi.w	800afb4 <inflate+0x1108>
 800a1b0:	2101      	movs	r1, #1
 800a1b2:	f416 7600 	ands.w	r6, r6, #512	; 0x200
 800a1b6:	fa01 f202 	lsl.w	r2, r1, r2
 800a1ba:	f8cb 2014 	str.w	r2, [fp, #20]
 800a1be:	f8cb 1018 	str.w	r1, [fp, #24]
 800a1c2:	f8ca 1034 	str.w	r1, [sl, #52]	; 0x34
 800a1c6:	f000 8535 	beq.w	800ac34 <inflate+0xd88>
 800a1ca:	461e      	mov	r6, r3
 800a1cc:	2309      	movs	r3, #9
 800a1ce:	4634      	mov	r4, r6
 800a1d0:	f88b 3000 	strb.w	r3, [fp]
 800a1d4:	2d00      	cmp	r5, #0
 800a1d6:	d073      	beq.n	800a2c0 <inflate+0x414>
 800a1d8:	f819 3b01 	ldrb.w	r3, [r9], #1
 800a1dc:	3d01      	subs	r5, #1
 800a1de:	40a3      	lsls	r3, r4
 800a1e0:	441e      	add	r6, r3
 800a1e2:	3408      	adds	r4, #8
 800a1e4:	2c1f      	cmp	r4, #31
 800a1e6:	d9f5      	bls.n	800a1d4 <inflate+0x328>
 800a1e8:	0633      	lsls	r3, r6, #24
 800a1ea:	eb03 6316 	add.w	r3, r3, r6, lsr #24
 800a1ee:	0a31      	lsrs	r1, r6, #8
 800a1f0:	0232      	lsls	r2, r6, #8
 800a1f2:	2600      	movs	r6, #0
 800a1f4:	200a      	movs	r0, #10
 800a1f6:	4634      	mov	r4, r6
 800a1f8:	f401 417f 	and.w	r1, r1, #65280	; 0xff00
 800a1fc:	440b      	add	r3, r1
 800a1fe:	f402 027f 	and.w	r2, r2, #16711680	; 0xff0000
 800a202:	4413      	add	r3, r2
 800a204:	f8cb 3018 	str.w	r3, [fp, #24]
 800a208:	f8ca 3034 	str.w	r3, [sl, #52]	; 0x34
 800a20c:	f88b 0000 	strb.w	r0, [fp]
 800a210:	f8db 300c 	ldr.w	r3, [fp, #12]
 800a214:	2b00      	cmp	r3, #0
 800a216:	f000 86bb 	beq.w	800af90 <inflate+0x10e4>
 800a21a:	2301      	movs	r3, #1
 800a21c:	220b      	movs	r2, #11
 800a21e:	f8cb 3018 	str.w	r3, [fp, #24]
 800a222:	f8ca 3034 	str.w	r3, [sl, #52]	; 0x34
 800a226:	f88b 2000 	strb.w	r2, [fp]
 800a22a:	9b07      	ldr	r3, [sp, #28]
 800a22c:	2b05      	cmp	r3, #5
 800a22e:	f000 84fd 	beq.w	800ac2c <inflate+0xd80>
 800a232:	f8db 3004 	ldr.w	r3, [fp, #4]
 800a236:	2b00      	cmp	r3, #0
 800a238:	f040 80ee 	bne.w	800a418 <inflate+0x56c>
 800a23c:	2c02      	cmp	r4, #2
 800a23e:	d80a      	bhi.n	800a256 <inflate+0x3aa>
 800a240:	2d00      	cmp	r5, #0
 800a242:	f000 864c 	beq.w	800aede <inflate+0x1032>
 800a246:	f899 3000 	ldrb.w	r3, [r9]
 800a24a:	3d01      	subs	r5, #1
 800a24c:	40a3      	lsls	r3, r4
 800a24e:	441e      	add	r6, r3
 800a250:	f109 0901 	add.w	r9, r9, #1
 800a254:	3408      	adds	r4, #8
 800a256:	f3c6 0341 	ubfx	r3, r6, #1, #2
 800a25a:	f006 0201 	and.w	r2, r6, #1
 800a25e:	2b02      	cmp	r3, #2
 800a260:	f8cb 2004 	str.w	r2, [fp, #4]
 800a264:	f000 84db 	beq.w	800ac1e <inflate+0xd72>
 800a268:	2b03      	cmp	r3, #3
 800a26a:	f000 8562 	beq.w	800ad32 <inflate+0xe86>
 800a26e:	2b01      	cmp	r3, #1
 800a270:	f000 854c 	beq.w	800ad0c <inflate+0xe60>
 800a274:	230d      	movs	r3, #13
 800a276:	08f6      	lsrs	r6, r6, #3
 800a278:	3c03      	subs	r4, #3
 800a27a:	f88b 3000 	strb.w	r3, [fp]
 800a27e:	f004 0307 	and.w	r3, r4, #7
 800a282:	f024 0407 	bic.w	r4, r4, #7
 800a286:	2c1f      	cmp	r4, #31
 800a288:	fa26 f603 	lsr.w	r6, r6, r3
 800a28c:	d808      	bhi.n	800a2a0 <inflate+0x3f4>
 800a28e:	b1bd      	cbz	r5, 800a2c0 <inflate+0x414>
 800a290:	f819 3b01 	ldrb.w	r3, [r9], #1
 800a294:	3d01      	subs	r5, #1
 800a296:	40a3      	lsls	r3, r4
 800a298:	3408      	adds	r4, #8
 800a29a:	2c1f      	cmp	r4, #31
 800a29c:	441e      	add	r6, r3
 800a29e:	d9f6      	bls.n	800a28e <inflate+0x3e2>
 800a2a0:	0c33      	lsrs	r3, r6, #16
 800a2a2:	f483 437f 	eor.w	r3, r3, #65280	; 0xff00
 800a2a6:	f083 03ff 	eor.w	r3, r3, #255	; 0xff
 800a2aa:	b2b2      	uxth	r2, r6
 800a2ac:	429a      	cmp	r2, r3
 800a2ae:	f000 8568 	beq.w	800ad82 <inflate+0xed6>
 800a2b2:	231b      	movs	r3, #27
 800a2b4:	4a79      	ldr	r2, [pc, #484]	; (800a49c <inflate+0x5f0>)
 800a2b6:	f8ca 2018 	str.w	r2, [sl, #24]
 800a2ba:	f88b 3000 	strb.w	r3, [fp]
 800a2be:	e735      	b.n	800a12c <inflate+0x280>
 800a2c0:	9505      	str	r5, [sp, #20]
 800a2c2:	f8db 7028 	ldr.w	r7, [fp, #40]	; 0x28
 800a2c6:	9b03      	ldr	r3, [sp, #12]
 800a2c8:	9a02      	ldr	r2, [sp, #8]
 800a2ca:	f8ca 300c 	str.w	r3, [sl, #12]
 800a2ce:	f8ca 2010 	str.w	r2, [sl, #16]
 800a2d2:	f8ca 9000 	str.w	r9, [sl]
 800a2d6:	f8ca 5004 	str.w	r5, [sl, #4]
 800a2da:	f8cb 6038 	str.w	r6, [fp, #56]	; 0x38
 800a2de:	f8cb 403c 	str.w	r4, [fp, #60]	; 0x3c
 800a2e2:	b93f      	cbnz	r7, 800a2f4 <inflate+0x448>
 800a2e4:	f89b 3000 	ldrb.w	r3, [fp]
 800a2e8:	2b17      	cmp	r3, #23
 800a2ea:	d837      	bhi.n	800a35c <inflate+0x4b0>
 800a2ec:	9906      	ldr	r1, [sp, #24]
 800a2ee:	4291      	cmp	r1, r2
 800a2f0:	f000 8264 	beq.w	800a7bc <inflate+0x910>
 800a2f4:	f8da 401c 	ldr.w	r4, [sl, #28]
 800a2f8:	6b60      	ldr	r0, [r4, #52]	; 0x34
 800a2fa:	2800      	cmp	r0, #0
 800a2fc:	f000 84a0 	beq.w	800ac40 <inflate+0xd94>
 800a300:	6aa2      	ldr	r2, [r4, #40]	; 0x28
 800a302:	b932      	cbnz	r2, 800a312 <inflate+0x466>
 800a304:	2201      	movs	r2, #1
 800a306:	2300      	movs	r3, #0
 800a308:	6a66      	ldr	r6, [r4, #36]	; 0x24
 800a30a:	6323      	str	r3, [r4, #48]	; 0x30
 800a30c:	40b2      	lsls	r2, r6
 800a30e:	62a2      	str	r2, [r4, #40]	; 0x28
 800a310:	62e3      	str	r3, [r4, #44]	; 0x2c
 800a312:	9b06      	ldr	r3, [sp, #24]
 800a314:	9902      	ldr	r1, [sp, #8]
 800a316:	1a5d      	subs	r5, r3, r1
 800a318:	4295      	cmp	r5, r2
 800a31a:	f080 8220 	bcs.w	800a75e <inflate+0x8b2>
 800a31e:	6b23      	ldr	r3, [r4, #48]	; 0x30
 800a320:	9903      	ldr	r1, [sp, #12]
 800a322:	1ad6      	subs	r6, r2, r3
 800a324:	42ae      	cmp	r6, r5
 800a326:	bf28      	it	cs
 800a328:	462e      	movcs	r6, r5
 800a32a:	1b49      	subs	r1, r1, r5
 800a32c:	4418      	add	r0, r3
 800a32e:	4632      	mov	r2, r6
 800a330:	f7f6 fa0e 	bl	8000750 <memcpy>
 800a334:	1bad      	subs	r5, r5, r6
 800a336:	f040 8249 	bne.w	800a7cc <inflate+0x920>
 800a33a:	6b23      	ldr	r3, [r4, #48]	; 0x30
 800a33c:	6aa2      	ldr	r2, [r4, #40]	; 0x28
 800a33e:	4433      	add	r3, r6
 800a340:	4293      	cmp	r3, r2
 800a342:	6323      	str	r3, [r4, #48]	; 0x30
 800a344:	6ae3      	ldr	r3, [r4, #44]	; 0x2c
 800a346:	bf08      	it	eq
 800a348:	6325      	streq	r5, [r4, #48]	; 0x30
 800a34a:	429a      	cmp	r2, r3
 800a34c:	d95e      	bls.n	800a40c <inflate+0x560>
 800a34e:	441e      	add	r6, r3
 800a350:	f8da 3010 	ldr.w	r3, [sl, #16]
 800a354:	f8da 5004 	ldr.w	r5, [sl, #4]
 800a358:	9302      	str	r3, [sp, #8]
 800a35a:	62e6      	str	r6, [r4, #44]	; 0x2c
 800a35c:	9b04      	ldr	r3, [sp, #16]
 800a35e:	f8da 1008 	ldr.w	r1, [sl, #8]
 800a362:	1b5d      	subs	r5, r3, r5
 800a364:	9802      	ldr	r0, [sp, #8]
 800a366:	9b06      	ldr	r3, [sp, #24]
 800a368:	f8da 2014 	ldr.w	r2, [sl, #20]
 800a36c:	1a1f      	subs	r7, r3, r0
 800a36e:	4429      	add	r1, r5
 800a370:	f8db 301c 	ldr.w	r3, [fp, #28]
 800a374:	f8ca 1008 	str.w	r1, [sl, #8]
 800a378:	f8db 1008 	ldr.w	r1, [fp, #8]
 800a37c:	443a      	add	r2, r7
 800a37e:	443b      	add	r3, r7
 800a380:	f8ca 2014 	str.w	r2, [sl, #20]
 800a384:	f8cb 301c 	str.w	r3, [fp, #28]
 800a388:	b1b1      	cbz	r1, 800a3b8 <inflate+0x50c>
 800a38a:	b1af      	cbz	r7, 800a3b8 <inflate+0x50c>
 800a38c:	f8da 100c 	ldr.w	r1, [sl, #12]
 800a390:	f8db 3010 	ldr.w	r3, [fp, #16]
 800a394:	463a      	mov	r2, r7
 800a396:	1bc9      	subs	r1, r1, r7
 800a398:	f8db 0018 	ldr.w	r0, [fp, #24]
 800a39c:	2b00      	cmp	r3, #0
 800a39e:	f040 80c6 	bne.w	800a52e <inflate+0x682>
 800a3a2:	f7ff fc57 	bl	8009c54 <adler32>
 800a3a6:	f8db 403c 	ldr.w	r4, [fp, #60]	; 0x3c
 800a3aa:	f89b 3000 	ldrb.w	r3, [fp]
 800a3ae:	f8cb 0018 	str.w	r0, [fp, #24]
 800a3b2:	f8ca 0034 	str.w	r0, [sl, #52]	; 0x34
 800a3b6:	e003      	b.n	800a3c0 <inflate+0x514>
 800a3b8:	f8db 403c 	ldr.w	r4, [fp, #60]	; 0x3c
 800a3bc:	f89b 3000 	ldrb.w	r3, [fp]
 800a3c0:	f8db 2004 	ldr.w	r2, [fp, #4]
 800a3c4:	2a00      	cmp	r2, #0
 800a3c6:	bf0c      	ite	eq
 800a3c8:	2200      	moveq	r2, #0
 800a3ca:	2240      	movne	r2, #64	; 0x40
 800a3cc:	2b0b      	cmp	r3, #11
 800a3ce:	bf14      	ite	ne
 800a3d0:	2300      	movne	r3, #0
 800a3d2:	2380      	moveq	r3, #128	; 0x80
 800a3d4:	4414      	add	r4, r2
 800a3d6:	441c      	add	r4, r3
 800a3d8:	f8ca 402c 	str.w	r4, [sl, #44]	; 0x2c
 800a3dc:	b955      	cbnz	r5, 800a3f4 <inflate+0x548>
 800a3de:	b94f      	cbnz	r7, 800a3f4 <inflate+0x548>
 800a3e0:	9b05      	ldr	r3, [sp, #20]
 800a3e2:	2b00      	cmp	r3, #0
 800a3e4:	bf08      	it	eq
 800a3e6:	f06f 0304 	mvneq.w	r3, #4
 800a3ea:	9305      	str	r3, [sp, #20]
 800a3ec:	9805      	ldr	r0, [sp, #20]
 800a3ee:	b00e      	add	sp, #56	; 0x38
 800a3f0:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 800a3f4:	9b07      	ldr	r3, [sp, #28]
 800a3f6:	2b04      	cmp	r3, #4
 800a3f8:	d0f2      	beq.n	800a3e0 <inflate+0x534>
 800a3fa:	9805      	ldr	r0, [sp, #20]
 800a3fc:	b00e      	add	sp, #56	; 0x38
 800a3fe:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 800a402:	220c      	movs	r2, #12
 800a404:	4613      	mov	r3, r2
 800a406:	f88b 2000 	strb.w	r2, [fp]
 800a40a:	e568      	b.n	8009ede <inflate+0x32>
 800a40c:	f8da 3010 	ldr.w	r3, [sl, #16]
 800a410:	f8da 5004 	ldr.w	r5, [sl, #4]
 800a414:	9302      	str	r3, [sp, #8]
 800a416:	e7a1      	b.n	800a35c <inflate+0x4b0>
 800a418:	2218      	movs	r2, #24
 800a41a:	f004 0307 	and.w	r3, r4, #7
 800a41e:	f88b 2000 	strb.w	r2, [fp]
 800a422:	40de      	lsrs	r6, r3
 800a424:	f024 0407 	bic.w	r4, r4, #7
 800a428:	f8db 3008 	ldr.w	r3, [fp, #8]
 800a42c:	b973      	cbnz	r3, 800a44c <inflate+0x5a0>
 800a42e:	231a      	movs	r3, #26
 800a430:	f88b 3000 	strb.w	r3, [fp]
 800a434:	2301      	movs	r3, #1
 800a436:	9305      	str	r3, [sp, #20]
 800a438:	e743      	b.n	800a2c2 <inflate+0x416>
 800a43a:	2d00      	cmp	r5, #0
 800a43c:	f43f af40 	beq.w	800a2c0 <inflate+0x414>
 800a440:	f819 3b01 	ldrb.w	r3, [r9], #1
 800a444:	3d01      	subs	r5, #1
 800a446:	40a3      	lsls	r3, r4
 800a448:	441e      	add	r6, r3
 800a44a:	3408      	adds	r4, #8
 800a44c:	2c1f      	cmp	r4, #31
 800a44e:	d9f4      	bls.n	800a43a <inflate+0x58e>
 800a450:	9a06      	ldr	r2, [sp, #24]
 800a452:	9802      	ldr	r0, [sp, #8]
 800a454:	f8da 1014 	ldr.w	r1, [sl, #20]
 800a458:	f8db 301c 	ldr.w	r3, [fp, #28]
 800a45c:	1a12      	subs	r2, r2, r0
 800a45e:	4411      	add	r1, r2
 800a460:	4413      	add	r3, r2
 800a462:	f8ca 1014 	str.w	r1, [sl, #20]
 800a466:	f8cb 301c 	str.w	r3, [fp, #28]
 800a46a:	2a00      	cmp	r2, #0
 800a46c:	f040 84b4 	bne.w	800add8 <inflate+0xf2c>
 800a470:	f8db 0018 	ldr.w	r0, [fp, #24]
 800a474:	f8db 3010 	ldr.w	r3, [fp, #16]
 800a478:	2b00      	cmp	r3, #0
 800a47a:	f000 84bc 	beq.w	800adf6 <inflate+0xf4a>
 800a47e:	4633      	mov	r3, r6
 800a480:	4283      	cmp	r3, r0
 800a482:	f000 8533 	beq.w	800aeec <inflate+0x1040>
 800a486:	231b      	movs	r3, #27
 800a488:	4a05      	ldr	r2, [pc, #20]	; (800a4a0 <inflate+0x5f4>)
 800a48a:	f8ca 2018 	str.w	r2, [sl, #24]
 800a48e:	f88b 3000 	strb.w	r3, [fp]
 800a492:	9b02      	ldr	r3, [sp, #8]
 800a494:	9306      	str	r3, [sp, #24]
 800a496:	e649      	b.n	800a12c <inflate+0x280>
 800a498:	08421085 	.word	0x08421085
 800a49c:	0800f6f4 	.word	0x0800f6f4
 800a4a0:	0800f7a4 	.word	0x0800f7a4
 800a4a4:	40d6      	lsrs	r6, r2
 800a4a6:	1aa4      	subs	r4, r4, r2
 800a4a8:	f8cb 0040 	str.w	r0, [fp, #64]	; 0x40
 800a4ac:	2317      	movs	r3, #23
 800a4ae:	f88b 3000 	strb.w	r3, [fp]
 800a4b2:	9902      	ldr	r1, [sp, #8]
 800a4b4:	2900      	cmp	r1, #0
 800a4b6:	f000 8541 	beq.w	800af3c <inflate+0x1090>
 800a4ba:	2312      	movs	r3, #18
 800a4bc:	9803      	ldr	r0, [sp, #12]
 800a4be:	f8db 2040 	ldr.w	r2, [fp, #64]	; 0x40
 800a4c2:	3901      	subs	r1, #1
 800a4c4:	7002      	strb	r2, [r0, #0]
 800a4c6:	1c42      	adds	r2, r0, #1
 800a4c8:	9102      	str	r1, [sp, #8]
 800a4ca:	9203      	str	r2, [sp, #12]
 800a4cc:	f88b 3000 	strb.w	r3, [fp]
 800a4d0:	f8da 3030 	ldr.w	r3, [sl, #48]	; 0x30
 800a4d4:	b113      	cbz	r3, 800a4dc <inflate+0x630>
 800a4d6:	2100      	movs	r1, #0
 800a4d8:	4608      	mov	r0, r1
 800a4da:	4798      	blx	r3
 800a4dc:	2d05      	cmp	r5, #5
 800a4de:	d929      	bls.n	800a534 <inflate+0x688>
 800a4e0:	9b02      	ldr	r3, [sp, #8]
 800a4e2:	f5b3 7f81 	cmp.w	r3, #258	; 0x102
 800a4e6:	d325      	bcc.n	800a534 <inflate+0x688>
 800a4e8:	9b03      	ldr	r3, [sp, #12]
 800a4ea:	f8ca 9000 	str.w	r9, [sl]
 800a4ee:	f8ca 300c 	str.w	r3, [sl, #12]
 800a4f2:	9b02      	ldr	r3, [sp, #8]
 800a4f4:	f8ca 5004 	str.w	r5, [sl, #4]
 800a4f8:	f8ca 3010 	str.w	r3, [sl, #16]
 800a4fc:	9906      	ldr	r1, [sp, #24]
 800a4fe:	f8cb 6038 	str.w	r6, [fp, #56]	; 0x38
 800a502:	f8cb 403c 	str.w	r4, [fp, #60]	; 0x3c
 800a506:	4650      	mov	r0, sl
 800a508:	f7fe ff12 	bl	8009330 <inflate_fast>
 800a50c:	f8da 300c 	ldr.w	r3, [sl, #12]
 800a510:	f8da 9000 	ldr.w	r9, [sl]
 800a514:	9303      	str	r3, [sp, #12]
 800a516:	f8da 3010 	ldr.w	r3, [sl, #16]
 800a51a:	f8da 5004 	ldr.w	r5, [sl, #4]
 800a51e:	9302      	str	r3, [sp, #8]
 800a520:	f8db 6038 	ldr.w	r6, [fp, #56]	; 0x38
 800a524:	f8db 403c 	ldr.w	r4, [fp, #60]	; 0x3c
 800a528:	f89b 3000 	ldrb.w	r3, [fp]
 800a52c:	e4e6      	b.n	8009efc <inflate+0x50>
 800a52e:	f7fd fc2b 	bl	8007d88 <crc32>
 800a532:	e738      	b.n	800a3a6 <inflate+0x4fa>
 800a534:	2701      	movs	r7, #1
 800a536:	f8db 2054 	ldr.w	r2, [fp, #84]	; 0x54
 800a53a:	f8db 304c 	ldr.w	r3, [fp, #76]	; 0x4c
 800a53e:	4097      	lsls	r7, r2
 800a540:	3f01      	subs	r7, #1
 800a542:	ea06 0107 	and.w	r1, r6, r7
 800a546:	eb03 0081 	add.w	r0, r3, r1, lsl #2
 800a54a:	7842      	ldrb	r2, [r0, #1]
 800a54c:	f813 1021 	ldrb.w	r1, [r3, r1, lsl #2]
 800a550:	4294      	cmp	r4, r2
 800a552:	8840      	ldrh	r0, [r0, #2]
 800a554:	d212      	bcs.n	800a57c <inflate+0x6d0>
 800a556:	2d00      	cmp	r5, #0
 800a558:	f43f aeb2 	beq.w	800a2c0 <inflate+0x414>
 800a55c:	f819 2b01 	ldrb.w	r2, [r9], #1
 800a560:	3d01      	subs	r5, #1
 800a562:	40a2      	lsls	r2, r4
 800a564:	4416      	add	r6, r2
 800a566:	ea06 0107 	and.w	r1, r6, r7
 800a56a:	eb03 0081 	add.w	r0, r3, r1, lsl #2
 800a56e:	7842      	ldrb	r2, [r0, #1]
 800a570:	3408      	adds	r4, #8
 800a572:	42a2      	cmp	r2, r4
 800a574:	f813 1021 	ldrb.w	r1, [r3, r1, lsl #2]
 800a578:	8840      	ldrh	r0, [r0, #2]
 800a57a:	d8ec      	bhi.n	800a556 <inflate+0x6aa>
 800a57c:	2900      	cmp	r1, #0
 800a57e:	d091      	beq.n	800a4a4 <inflate+0x5f8>
 800a580:	f011 0ff0 	tst.w	r1, #240	; 0xf0
 800a584:	f040 8450 	bne.w	800ae28 <inflate+0xf7c>
 800a588:	2701      	movs	r7, #1
 800a58a:	4411      	add	r1, r2
 800a58c:	fa07 f101 	lsl.w	r1, r7, r1
 800a590:	3901      	subs	r1, #1
 800a592:	9108      	str	r1, [sp, #32]
 800a594:	4031      	ands	r1, r6
 800a596:	40d1      	lsrs	r1, r2
 800a598:	4401      	add	r1, r0
 800a59a:	eb03 0781 	add.w	r7, r3, r1, lsl #2
 800a59e:	f897 e001 	ldrb.w	lr, [r7, #1]
 800a5a2:	f813 1021 	ldrb.w	r1, [r3, r1, lsl #2]
 800a5a6:	eb02 0c0e 	add.w	ip, r2, lr
 800a5aa:	45a4      	cmp	ip, r4
 800a5ac:	887f      	ldrh	r7, [r7, #2]
 800a5ae:	d921      	bls.n	800a5f4 <inflate+0x748>
 800a5b0:	2d00      	cmp	r5, #0
 800a5b2:	f43f ae85 	beq.w	800a2c0 <inflate+0x414>
 800a5b6:	f8cd b024 	str.w	fp, [sp, #36]	; 0x24
 800a5ba:	f8dd b020 	ldr.w	fp, [sp, #32]
 800a5be:	e002      	b.n	800a5c6 <inflate+0x71a>
 800a5c0:	2d00      	cmp	r5, #0
 800a5c2:	f000 84d2 	beq.w	800af6a <inflate+0x10be>
 800a5c6:	f819 1b01 	ldrb.w	r1, [r9], #1
 800a5ca:	3d01      	subs	r5, #1
 800a5cc:	40a1      	lsls	r1, r4
 800a5ce:	440e      	add	r6, r1
 800a5d0:	ea06 010b 	and.w	r1, r6, fp
 800a5d4:	40d1      	lsrs	r1, r2
 800a5d6:	4401      	add	r1, r0
 800a5d8:	eb03 0781 	add.w	r7, r3, r1, lsl #2
 800a5dc:	f897 e001 	ldrb.w	lr, [r7, #1]
 800a5e0:	3408      	adds	r4, #8
 800a5e2:	eb02 0c0e 	add.w	ip, r2, lr
 800a5e6:	45a4      	cmp	ip, r4
 800a5e8:	f813 1021 	ldrb.w	r1, [r3, r1, lsl #2]
 800a5ec:	887f      	ldrh	r7, [r7, #2]
 800a5ee:	d8e7      	bhi.n	800a5c0 <inflate+0x714>
 800a5f0:	f8dd b024 	ldr.w	fp, [sp, #36]	; 0x24
 800a5f4:	40d6      	lsrs	r6, r2
 800a5f6:	1aa4      	subs	r4, r4, r2
 800a5f8:	fa26 f60e 	lsr.w	r6, r6, lr
 800a5fc:	eba4 040e 	sub.w	r4, r4, lr
 800a600:	f8cb 7040 	str.w	r7, [fp, #64]	; 0x40
 800a604:	2900      	cmp	r1, #0
 800a606:	f43f af51 	beq.w	800a4ac <inflate+0x600>
 800a60a:	068a      	lsls	r2, r1, #26
 800a60c:	f100 82f4 	bmi.w	800abf8 <inflate+0xd4c>
 800a610:	064b      	lsls	r3, r1, #25
 800a612:	f140 849e 	bpl.w	800af52 <inflate+0x10a6>
 800a616:	231b      	movs	r3, #27
 800a618:	4ac9      	ldr	r2, [pc, #804]	; (800a940 <inflate+0xa94>)
 800a61a:	f8ca 2018 	str.w	r2, [sl, #24]
 800a61e:	f88b 3000 	strb.w	r3, [fp]
 800a622:	e583      	b.n	800a12c <inflate+0x280>
 800a624:	2b00      	cmp	r3, #0
 800a626:	f43f ac55 	beq.w	8009ed4 <inflate+0x28>
 800a62a:	f06f 0301 	mvn.w	r3, #1
 800a62e:	9305      	str	r3, [sp, #20]
 800a630:	e6dc      	b.n	800a3ec <inflate+0x540>
 800a632:	2d00      	cmp	r5, #0
 800a634:	f43f ae44 	beq.w	800a2c0 <inflate+0x414>
 800a638:	f819 3b01 	ldrb.w	r3, [r9], #1
 800a63c:	3d01      	subs	r5, #1
 800a63e:	40a3      	lsls	r3, r4
 800a640:	441e      	add	r6, r3
 800a642:	3408      	adds	r4, #8
 800a644:	428c      	cmp	r4, r1
 800a646:	d3f4      	bcc.n	800a632 <inflate+0x786>
 800a648:	2301      	movs	r3, #1
 800a64a:	408b      	lsls	r3, r1
 800a64c:	f8db 2040 	ldr.w	r2, [fp, #64]	; 0x40
 800a650:	3b01      	subs	r3, #1
 800a652:	4033      	ands	r3, r6
 800a654:	4413      	add	r3, r2
 800a656:	1a64      	subs	r4, r4, r1
 800a658:	40ce      	lsrs	r6, r1
 800a65a:	f8cb 3040 	str.w	r3, [fp, #64]	; 0x40
 800a65e:	2314      	movs	r3, #20
 800a660:	f88b 3000 	strb.w	r3, [fp]
 800a664:	f04f 0e01 	mov.w	lr, #1
 800a668:	f8db 3058 	ldr.w	r3, [fp, #88]	; 0x58
 800a66c:	f8db 2050 	ldr.w	r2, [fp, #80]	; 0x50
 800a670:	fa0e fe03 	lsl.w	lr, lr, r3
 800a674:	f10e 3eff 	add.w	lr, lr, #4294967295	; 0xffffffff
 800a678:	ea06 010e 	and.w	r1, r6, lr
 800a67c:	eb02 0081 	add.w	r0, r2, r1, lsl #2
 800a680:	7843      	ldrb	r3, [r0, #1]
 800a682:	f812 1021 	ldrb.w	r1, [r2, r1, lsl #2]
 800a686:	429c      	cmp	r4, r3
 800a688:	8840      	ldrh	r0, [r0, #2]
 800a68a:	9308      	str	r3, [sp, #32]
 800a68c:	d213      	bcs.n	800a6b6 <inflate+0x80a>
 800a68e:	2d00      	cmp	r5, #0
 800a690:	f43f ae16 	beq.w	800a2c0 <inflate+0x414>
 800a694:	f819 3b01 	ldrb.w	r3, [r9], #1
 800a698:	3d01      	subs	r5, #1
 800a69a:	40a3      	lsls	r3, r4
 800a69c:	441e      	add	r6, r3
 800a69e:	ea06 010e 	and.w	r1, r6, lr
 800a6a2:	eb02 0081 	add.w	r0, r2, r1, lsl #2
 800a6a6:	7843      	ldrb	r3, [r0, #1]
 800a6a8:	3408      	adds	r4, #8
 800a6aa:	42a3      	cmp	r3, r4
 800a6ac:	f812 1021 	ldrb.w	r1, [r2, r1, lsl #2]
 800a6b0:	8840      	ldrh	r0, [r0, #2]
 800a6b2:	d8ec      	bhi.n	800a68e <inflate+0x7e2>
 800a6b4:	9308      	str	r3, [sp, #32]
 800a6b6:	f011 0ff0 	tst.w	r1, #240	; 0xf0
 800a6ba:	d142      	bne.n	800a742 <inflate+0x896>
 800a6bc:	f04f 0c01 	mov.w	ip, #1
 800a6c0:	469e      	mov	lr, r3
 800a6c2:	18cb      	adds	r3, r1, r3
 800a6c4:	fa0c f303 	lsl.w	r3, ip, r3
 800a6c8:	3b01      	subs	r3, #1
 800a6ca:	ea03 0106 	and.w	r1, r3, r6
 800a6ce:	fa21 f10e 	lsr.w	r1, r1, lr
 800a6d2:	4401      	add	r1, r0
 800a6d4:	eb02 0c81 	add.w	ip, r2, r1, lsl #2
 800a6d8:	9309      	str	r3, [sp, #36]	; 0x24
 800a6da:	f89c 3001 	ldrb.w	r3, [ip, #1]
 800a6de:	900a      	str	r0, [sp, #40]	; 0x28
 800a6e0:	eb03 000e 	add.w	r0, r3, lr
 800a6e4:	4607      	mov	r7, r0
 800a6e6:	42a7      	cmp	r7, r4
 800a6e8:	f812 1021 	ldrb.w	r1, [r2, r1, lsl #2]
 800a6ec:	f8bc 0002 	ldrh.w	r0, [ip, #2]
 800a6f0:	d923      	bls.n	800a73a <inflate+0x88e>
 800a6f2:	2d00      	cmp	r5, #0
 800a6f4:	f43f ade4 	beq.w	800a2c0 <inflate+0x414>
 800a6f8:	f8cd b02c 	str.w	fp, [sp, #44]	; 0x2c
 800a6fc:	f8dd c024 	ldr.w	ip, [sp, #36]	; 0x24
 800a700:	f8dd b028 	ldr.w	fp, [sp, #40]	; 0x28
 800a704:	e002      	b.n	800a70c <inflate+0x860>
 800a706:	2d00      	cmp	r5, #0
 800a708:	f000 82e6 	beq.w	800acd8 <inflate+0xe2c>
 800a70c:	f819 3b01 	ldrb.w	r3, [r9], #1
 800a710:	3d01      	subs	r5, #1
 800a712:	40a3      	lsls	r3, r4
 800a714:	441e      	add	r6, r3
 800a716:	ea0c 0106 	and.w	r1, ip, r6
 800a71a:	fa21 f10e 	lsr.w	r1, r1, lr
 800a71e:	4459      	add	r1, fp
 800a720:	eb02 0081 	add.w	r0, r2, r1, lsl #2
 800a724:	7843      	ldrb	r3, [r0, #1]
 800a726:	3408      	adds	r4, #8
 800a728:	eb03 070e 	add.w	r7, r3, lr
 800a72c:	42a7      	cmp	r7, r4
 800a72e:	f812 1021 	ldrb.w	r1, [r2, r1, lsl #2]
 800a732:	8840      	ldrh	r0, [r0, #2]
 800a734:	d8e7      	bhi.n	800a706 <inflate+0x85a>
 800a736:	f8dd b02c 	ldr.w	fp, [sp, #44]	; 0x2c
 800a73a:	9a08      	ldr	r2, [sp, #32]
 800a73c:	fa26 f60e 	lsr.w	r6, r6, lr
 800a740:	1aa4      	subs	r4, r4, r2
 800a742:	064f      	lsls	r7, r1, #25
 800a744:	fa26 f603 	lsr.w	r6, r6, r3
 800a748:	eba4 0403 	sub.w	r4, r4, r3
 800a74c:	f140 829e 	bpl.w	800ac8c <inflate+0xde0>
 800a750:	231b      	movs	r3, #27
 800a752:	4a7c      	ldr	r2, [pc, #496]	; (800a944 <inflate+0xa98>)
 800a754:	f8ca 2018 	str.w	r2, [sl, #24]
 800a758:	f88b 3000 	strb.w	r3, [fp]
 800a75c:	e4e6      	b.n	800a12c <inflate+0x280>
 800a75e:	9b03      	ldr	r3, [sp, #12]
 800a760:	1a99      	subs	r1, r3, r2
 800a762:	f7f5 fff5 	bl	8000750 <memcpy>
 800a766:	2200      	movs	r2, #0
 800a768:	6aa3      	ldr	r3, [r4, #40]	; 0x28
 800a76a:	6322      	str	r2, [r4, #48]	; 0x30
 800a76c:	62e3      	str	r3, [r4, #44]	; 0x2c
 800a76e:	f8da 3010 	ldr.w	r3, [sl, #16]
 800a772:	f8da 5004 	ldr.w	r5, [sl, #4]
 800a776:	9302      	str	r3, [sp, #8]
 800a778:	e5f0      	b.n	800a35c <inflate+0x4b0>
 800a77a:	2316      	movs	r3, #22
 800a77c:	f88b 3000 	strb.w	r3, [fp]
 800a780:	9a02      	ldr	r2, [sp, #8]
 800a782:	2a00      	cmp	r2, #0
 800a784:	f000 83da 	beq.w	800af3c <inflate+0x1090>
 800a788:	9906      	ldr	r1, [sp, #24]
 800a78a:	f8db 3044 	ldr.w	r3, [fp, #68]	; 0x44
 800a78e:	1a88      	subs	r0, r1, r2
 800a790:	4298      	cmp	r0, r3
 800a792:	f080 81ed 	bcs.w	800ab70 <inflate+0xcc4>
 800a796:	f8db 2030 	ldr.w	r2, [fp, #48]	; 0x30
 800a79a:	1a18      	subs	r0, r3, r0
 800a79c:	4290      	cmp	r0, r2
 800a79e:	f240 8270 	bls.w	800ac82 <inflate+0xdd6>
 800a7a2:	f8db 1028 	ldr.w	r1, [fp, #40]	; 0x28
 800a7a6:	1a80      	subs	r0, r0, r2
 800a7a8:	f8db 3034 	ldr.w	r3, [fp, #52]	; 0x34
 800a7ac:	1a09      	subs	r1, r1, r0
 800a7ae:	440b      	add	r3, r1
 800a7b0:	f8db 2040 	ldr.w	r2, [fp, #64]	; 0x40
 800a7b4:	4290      	cmp	r0, r2
 800a7b6:	bf28      	it	cs
 800a7b8:	4610      	movcs	r0, r2
 800a7ba:	e1de      	b.n	800ab7a <inflate+0xcce>
 800a7bc:	9904      	ldr	r1, [sp, #16]
 800a7be:	f8da 2008 	ldr.w	r2, [sl, #8]
 800a7c2:	1b4d      	subs	r5, r1, r5
 800a7c4:	442a      	add	r2, r5
 800a7c6:	f8ca 2008 	str.w	r2, [sl, #8]
 800a7ca:	e5f9      	b.n	800a3c0 <inflate+0x514>
 800a7cc:	f8da 100c 	ldr.w	r1, [sl, #12]
 800a7d0:	462a      	mov	r2, r5
 800a7d2:	1b49      	subs	r1, r1, r5
 800a7d4:	6b60      	ldr	r0, [r4, #52]	; 0x34
 800a7d6:	f7f5 ffbb 	bl	8000750 <memcpy>
 800a7da:	6aa3      	ldr	r3, [r4, #40]	; 0x28
 800a7dc:	6325      	str	r5, [r4, #48]	; 0x30
 800a7de:	62e3      	str	r3, [r4, #44]	; 0x2c
 800a7e0:	f8da 3010 	ldr.w	r3, [sl, #16]
 800a7e4:	f8da 5004 	ldr.w	r5, [sl, #4]
 800a7e8:	9302      	str	r3, [sp, #8]
 800a7ea:	e5b7      	b.n	800a35c <inflate+0x4b0>
 800a7ec:	f8db 1048 	ldr.w	r1, [fp, #72]	; 0x48
 800a7f0:	b9c9      	cbnz	r1, 800a826 <inflate+0x97a>
 800a7f2:	f8db 2044 	ldr.w	r2, [fp, #68]	; 0x44
 800a7f6:	9906      	ldr	r1, [sp, #24]
 800a7f8:	f8db 302c 	ldr.w	r3, [fp, #44]	; 0x2c
 800a7fc:	440b      	add	r3, r1
 800a7fe:	9902      	ldr	r1, [sp, #8]
 800a800:	1a5b      	subs	r3, r3, r1
 800a802:	4293      	cmp	r3, r2
 800a804:	d2b9      	bcs.n	800a77a <inflate+0x8ce>
 800a806:	231b      	movs	r3, #27
 800a808:	4a4f      	ldr	r2, [pc, #316]	; (800a948 <inflate+0xa9c>)
 800a80a:	f8ca 2018 	str.w	r2, [sl, #24]
 800a80e:	f88b 3000 	strb.w	r3, [fp]
 800a812:	e48b      	b.n	800a12c <inflate+0x280>
 800a814:	2d00      	cmp	r5, #0
 800a816:	f43f ad53 	beq.w	800a2c0 <inflate+0x414>
 800a81a:	f819 3b01 	ldrb.w	r3, [r9], #1
 800a81e:	3d01      	subs	r5, #1
 800a820:	40a3      	lsls	r3, r4
 800a822:	441e      	add	r6, r3
 800a824:	3408      	adds	r4, #8
 800a826:	428c      	cmp	r4, r1
 800a828:	d3f4      	bcc.n	800a814 <inflate+0x968>
 800a82a:	2201      	movs	r2, #1
 800a82c:	408a      	lsls	r2, r1
 800a82e:	f8db 3044 	ldr.w	r3, [fp, #68]	; 0x44
 800a832:	3a01      	subs	r2, #1
 800a834:	4032      	ands	r2, r6
 800a836:	441a      	add	r2, r3
 800a838:	1a64      	subs	r4, r4, r1
 800a83a:	40ce      	lsrs	r6, r1
 800a83c:	f8cb 2044 	str.w	r2, [fp, #68]	; 0x44
 800a840:	e7d9      	b.n	800a7f6 <inflate+0x94a>
 800a842:	f8db 3008 	ldr.w	r3, [fp, #8]
 800a846:	2b00      	cmp	r3, #0
 800a848:	f43f adf1 	beq.w	800a42e <inflate+0x582>
 800a84c:	f8db 3010 	ldr.w	r3, [fp, #16]
 800a850:	b94b      	cbnz	r3, 800a866 <inflate+0x9ba>
 800a852:	e5ec      	b.n	800a42e <inflate+0x582>
 800a854:	2d00      	cmp	r5, #0
 800a856:	f43f ad33 	beq.w	800a2c0 <inflate+0x414>
 800a85a:	f819 3b01 	ldrb.w	r3, [r9], #1
 800a85e:	3d01      	subs	r5, #1
 800a860:	40a3      	lsls	r3, r4
 800a862:	441e      	add	r6, r3
 800a864:	3408      	adds	r4, #8
 800a866:	2c1f      	cmp	r4, #31
 800a868:	d9f4      	bls.n	800a854 <inflate+0x9a8>
 800a86a:	f8db 301c 	ldr.w	r3, [fp, #28]
 800a86e:	42b3      	cmp	r3, r6
 800a870:	f000 83e2 	beq.w	800b038 <inflate+0x118c>
 800a874:	231b      	movs	r3, #27
 800a876:	4a35      	ldr	r2, [pc, #212]	; (800a94c <inflate+0xaa0>)
 800a878:	f8ca 2018 	str.w	r2, [sl, #24]
 800a87c:	f88b 3000 	strb.w	r3, [fp]
 800a880:	e454      	b.n	800a12c <inflate+0x280>
 800a882:	f8db 2010 	ldr.w	r2, [fp, #16]
 800a886:	f412 5180 	ands.w	r1, r2, #4096	; 0x1000
 800a88a:	d01d      	beq.n	800a8c8 <inflate+0xa1c>
 800a88c:	2d00      	cmp	r5, #0
 800a88e:	f43f ad17 	beq.w	800a2c0 <inflate+0x414>
 800a892:	2700      	movs	r7, #0
 800a894:	46a6      	mov	lr, r4
 800a896:	f109 31ff 	add.w	r1, r9, #4294967295	; 0xffffffff
 800a89a:	f8db 3020 	ldr.w	r3, [fp, #32]
 800a89e:	3701      	adds	r7, #1
 800a8a0:	f811 2f01 	ldrb.w	r2, [r1, #1]!
 800a8a4:	b153      	cbz	r3, 800a8bc <inflate+0xa10>
 800a8a6:	6a58      	ldr	r0, [r3, #36]	; 0x24
 800a8a8:	b140      	cbz	r0, 800a8bc <inflate+0xa10>
 800a8aa:	6a9c      	ldr	r4, [r3, #40]	; 0x28
 800a8ac:	f8db 3040 	ldr.w	r3, [fp, #64]	; 0x40
 800a8b0:	42a3      	cmp	r3, r4
 800a8b2:	d203      	bcs.n	800a8bc <inflate+0xa10>
 800a8b4:	1c5c      	adds	r4, r3, #1
 800a8b6:	f8cb 4040 	str.w	r4, [fp, #64]	; 0x40
 800a8ba:	54c2      	strb	r2, [r0, r3]
 800a8bc:	2a00      	cmp	r2, #0
 800a8be:	d049      	beq.n	800a954 <inflate+0xaa8>
 800a8c0:	42bd      	cmp	r5, r7
 800a8c2:	d1ea      	bne.n	800a89a <inflate+0x9ee>
 800a8c4:	f7ff bbef 	b.w	800a0a6 <inflate+0x1fa>
 800a8c8:	f8db 3020 	ldr.w	r3, [fp, #32]
 800a8cc:	b103      	cbz	r3, 800a8d0 <inflate+0xa24>
 800a8ce:	6259      	str	r1, [r3, #36]	; 0x24
 800a8d0:	f402 7300 	and.w	r3, r2, #512	; 0x200
 800a8d4:	2108      	movs	r1, #8
 800a8d6:	f88b 1000 	strb.w	r1, [fp]
 800a8da:	bb0b      	cbnz	r3, 800a920 <inflate+0xa74>
 800a8dc:	f8db 3020 	ldr.w	r3, [fp, #32]
 800a8e0:	b123      	cbz	r3, 800a8ec <inflate+0xa40>
 800a8e2:	2101      	movs	r1, #1
 800a8e4:	f3c2 2240 	ubfx	r2, r2, #9, #1
 800a8e8:	62da      	str	r2, [r3, #44]	; 0x2c
 800a8ea:	6319      	str	r1, [r3, #48]	; 0x30
 800a8ec:	2200      	movs	r2, #0
 800a8ee:	4611      	mov	r1, r2
 800a8f0:	4610      	mov	r0, r2
 800a8f2:	f7fd fa49 	bl	8007d88 <crc32>
 800a8f6:	230b      	movs	r3, #11
 800a8f8:	f8cb 0018 	str.w	r0, [fp, #24]
 800a8fc:	f8ca 0034 	str.w	r0, [sl, #52]	; 0x34
 800a900:	f88b 3000 	strb.w	r3, [fp]
 800a904:	9b07      	ldr	r3, [sp, #28]
 800a906:	2b05      	cmp	r3, #5
 800a908:	f47f ac93 	bne.w	800a232 <inflate+0x386>
 800a90c:	e18e      	b.n	800ac2c <inflate+0xd80>
 800a90e:	2d00      	cmp	r5, #0
 800a910:	f43f acd6 	beq.w	800a2c0 <inflate+0x414>
 800a914:	f819 3b01 	ldrb.w	r3, [r9], #1
 800a918:	3d01      	subs	r5, #1
 800a91a:	40a3      	lsls	r3, r4
 800a91c:	441e      	add	r6, r3
 800a91e:	3408      	adds	r4, #8
 800a920:	2c0f      	cmp	r4, #15
 800a922:	d9f4      	bls.n	800a90e <inflate+0xa62>
 800a924:	f8bb 3018 	ldrh.w	r3, [fp, #24]
 800a928:	42b3      	cmp	r3, r6
 800a92a:	f000 81a7 	beq.w	800ac7c <inflate+0xdd0>
 800a92e:	231b      	movs	r3, #27
 800a930:	4a07      	ldr	r2, [pc, #28]	; (800a950 <inflate+0xaa4>)
 800a932:	f8ca 2018 	str.w	r2, [sl, #24]
 800a936:	f88b 3000 	strb.w	r3, [fp]
 800a93a:	f7ff bbf7 	b.w	800a12c <inflate+0x280>
 800a93e:	bf00      	nop
 800a940:	0800f64c 	.word	0x0800f64c
 800a944:	0800f634 	.word	0x0800f634
 800a948:	0800f614 	.word	0x0800f614
 800a94c:	0800f7bc 	.word	0x0800f7bc
 800a950:	0800f6cc 	.word	0x0800f6cc
 800a954:	f8db 2010 	ldr.w	r2, [fp, #16]
 800a958:	4674      	mov	r4, lr
 800a95a:	0593      	lsls	r3, r2, #22
 800a95c:	f100 839d 	bmi.w	800b09a <inflate+0x11ee>
 800a960:	2308      	movs	r3, #8
 800a962:	1bed      	subs	r5, r5, r7
 800a964:	44b9      	add	r9, r7
 800a966:	f88b 3000 	strb.w	r3, [fp]
 800a96a:	e7b7      	b.n	800a8dc <inflate+0xa30>
 800a96c:	f8db 2010 	ldr.w	r2, [fp, #16]
 800a970:	f402 7300 	and.w	r3, r2, #512	; 0x200
 800a974:	e7b1      	b.n	800a8da <inflate+0xa2e>
 800a976:	f8db 7068 	ldr.w	r7, [fp, #104]	; 0x68
 800a97a:	f04f 0e01 	mov.w	lr, #1
 800a97e:	f8db 3060 	ldr.w	r3, [fp, #96]	; 0x60
 800a982:	f8db 0064 	ldr.w	r0, [fp, #100]	; 0x64
 800a986:	9308      	str	r3, [sp, #32]
 800a988:	4418      	add	r0, r3
 800a98a:	4287      	cmp	r7, r0
 800a98c:	f080 831b 	bcs.w	800afc6 <inflate+0x111a>
 800a990:	f8db 3054 	ldr.w	r3, [fp, #84]	; 0x54
 800a994:	f8db 204c 	ldr.w	r2, [fp, #76]	; 0x4c
 800a998:	fa0e f303 	lsl.w	r3, lr, r3
 800a99c:	1e59      	subs	r1, r3, #1
 800a99e:	ea06 0301 	and.w	r3, r6, r1
 800a9a2:	eb02 0383 	add.w	r3, r2, r3, lsl #2
 800a9a6:	f893 c001 	ldrb.w	ip, [r3, #1]
 800a9aa:	885b      	ldrh	r3, [r3, #2]
 800a9ac:	4564      	cmp	r4, ip
 800a9ae:	d211      	bcs.n	800a9d4 <inflate+0xb28>
 800a9b0:	2d00      	cmp	r5, #0
 800a9b2:	f43f ac85 	beq.w	800a2c0 <inflate+0x414>
 800a9b6:	f819 3b01 	ldrb.w	r3, [r9], #1
 800a9ba:	3d01      	subs	r5, #1
 800a9bc:	40a3      	lsls	r3, r4
 800a9be:	441e      	add	r6, r3
 800a9c0:	ea06 0301 	and.w	r3, r6, r1
 800a9c4:	eb02 0383 	add.w	r3, r2, r3, lsl #2
 800a9c8:	f893 c001 	ldrb.w	ip, [r3, #1]
 800a9cc:	3408      	adds	r4, #8
 800a9ce:	45a4      	cmp	ip, r4
 800a9d0:	885b      	ldrh	r3, [r3, #2]
 800a9d2:	d8ed      	bhi.n	800a9b0 <inflate+0xb04>
 800a9d4:	2b0f      	cmp	r3, #15
 800a9d6:	f240 8184 	bls.w	800ace2 <inflate+0xe36>
 800a9da:	2b10      	cmp	r3, #16
 800a9dc:	f000 822a 	beq.w	800ae34 <inflate+0xf88>
 800a9e0:	2b11      	cmp	r3, #17
 800a9e2:	f000 828d 	beq.w	800af00 <inflate+0x1054>
 800a9e6:	f10c 0207 	add.w	r2, ip, #7
 800a9ea:	4294      	cmp	r4, r2
 800a9ec:	d20a      	bcs.n	800aa04 <inflate+0xb58>
 800a9ee:	2d00      	cmp	r5, #0
 800a9f0:	f43f ac66 	beq.w	800a2c0 <inflate+0x414>
 800a9f4:	f819 3b01 	ldrb.w	r3, [r9], #1
 800a9f8:	3d01      	subs	r5, #1
 800a9fa:	40a3      	lsls	r3, r4
 800a9fc:	3408      	adds	r4, #8
 800a9fe:	4294      	cmp	r4, r2
 800aa00:	441e      	add	r6, r3
 800aa02:	d3f4      	bcc.n	800a9ee <inflate+0xb42>
 800aa04:	2200      	movs	r2, #0
 800aa06:	fa26 f60c 	lsr.w	r6, r6, ip
 800aa0a:	f1cc 2cff 	rsb	ip, ip, #4278255360	; 0xff00ff00
 800aa0e:	f50c 0c7f 	add.w	ip, ip, #16711680	; 0xff0000
 800aa12:	f006 037f 	and.w	r3, r6, #127	; 0x7f
 800aa16:	f10c 0cf9 	add.w	ip, ip, #249	; 0xf9
 800aa1a:	4464      	add	r4, ip
 800aa1c:	330b      	adds	r3, #11
 800aa1e:	09f6      	lsrs	r6, r6, #7
 800aa20:	19d9      	adds	r1, r3, r7
 800aa22:	4281      	cmp	r1, r0
 800aa24:	f200 8331 	bhi.w	800b08a <inflate+0x11de>
 800aa28:	f107 0c37 	add.w	ip, r7, #55	; 0x37
 800aa2c:	449c      	add	ip, r3
 800aa2e:	eb0b 0347 	add.w	r3, fp, r7, lsl #1
 800aa32:	b292      	uxth	r2, r2
 800aa34:	eb0b 0c4c 	add.w	ip, fp, ip, lsl #1
 800aa38:	336e      	adds	r3, #110	; 0x6e
 800aa3a:	f823 2f02 	strh.w	r2, [r3, #2]!
 800aa3e:	4563      	cmp	r3, ip
 800aa40:	d1fb      	bne.n	800aa3a <inflate+0xb8e>
 800aa42:	460f      	mov	r7, r1
 800aa44:	f8cb 1068 	str.w	r1, [fp, #104]	; 0x68
 800aa48:	e79f      	b.n	800a98a <inflate+0xade>
 800aa4a:	f8db 1048 	ldr.w	r1, [fp, #72]	; 0x48
 800aa4e:	2900      	cmp	r1, #0
 800aa50:	f43f ae05 	beq.w	800a65e <inflate+0x7b2>
 800aa54:	e5f6      	b.n	800a644 <inflate+0x798>
 800aa56:	f8db 3040 	ldr.w	r3, [fp, #64]	; 0x40
 800aa5a:	2b00      	cmp	r3, #0
 800aa5c:	f000 80cc 	beq.w	800abf8 <inflate+0xd4c>
 800aa60:	42ab      	cmp	r3, r5
 800aa62:	bf28      	it	cs
 800aa64:	462b      	movcs	r3, r5
 800aa66:	9a02      	ldr	r2, [sp, #8]
 800aa68:	429a      	cmp	r2, r3
 800aa6a:	4617      	mov	r7, r2
 800aa6c:	bf28      	it	cs
 800aa6e:	461f      	movcs	r7, r3
 800aa70:	2f00      	cmp	r7, #0
 800aa72:	f000 82e5 	beq.w	800b040 <inflate+0x1194>
 800aa76:	463a      	mov	r2, r7
 800aa78:	4649      	mov	r1, r9
 800aa7a:	9803      	ldr	r0, [sp, #12]
 800aa7c:	f7f5 fe68 	bl	8000750 <memcpy>
 800aa80:	9a02      	ldr	r2, [sp, #8]
 800aa82:	f8db 3040 	ldr.w	r3, [fp, #64]	; 0x40
 800aa86:	1bd2      	subs	r2, r2, r7
 800aa88:	9202      	str	r2, [sp, #8]
 800aa8a:	9a03      	ldr	r2, [sp, #12]
 800aa8c:	1bdb      	subs	r3, r3, r7
 800aa8e:	443a      	add	r2, r7
 800aa90:	f8cb 3040 	str.w	r3, [fp, #64]	; 0x40
 800aa94:	1bed      	subs	r5, r5, r7
 800aa96:	44b9      	add	r9, r7
 800aa98:	9203      	str	r2, [sp, #12]
 800aa9a:	f89b 3000 	ldrb.w	r3, [fp]
 800aa9e:	f7ff ba2d 	b.w	8009efc <inflate+0x50>
 800aaa2:	f8db 005c 	ldr.w	r0, [fp, #92]	; 0x5c
 800aaa6:	f8db 3068 	ldr.w	r3, [fp, #104]	; 0x68
 800aaaa:	4298      	cmp	r0, r3
 800aaac:	f240 81e3 	bls.w	800ae76 <inflate+0xfca>
 800aab0:	4ad7      	ldr	r2, [pc, #860]	; (800ae10 <inflate+0xf64>)
 800aab2:	2c02      	cmp	r4, #2
 800aab4:	eb02 0143 	add.w	r1, r2, r3, lsl #1
 800aab8:	f100 0001 	add.w	r0, r0, #1
 800aabc:	f1a1 0102 	sub.w	r1, r1, #2
 800aac0:	f103 0201 	add.w	r2, r3, #1
 800aac4:	d80a      	bhi.n	800aadc <inflate+0xc30>
 800aac6:	2d00      	cmp	r5, #0
 800aac8:	f43f abfa 	beq.w	800a2c0 <inflate+0x414>
 800aacc:	f899 3000 	ldrb.w	r3, [r9]
 800aad0:	3d01      	subs	r5, #1
 800aad2:	40a3      	lsls	r3, r4
 800aad4:	441e      	add	r6, r3
 800aad6:	f109 0901 	add.w	r9, r9, #1
 800aada:	3408      	adds	r4, #8
 800aadc:	f831 3f02 	ldrh.w	r3, [r1, #2]!
 800aae0:	1c57      	adds	r7, r2, #1
 800aae2:	f006 0e07 	and.w	lr, r6, #7
 800aae6:	3338      	adds	r3, #56	; 0x38
 800aae8:	4287      	cmp	r7, r0
 800aaea:	f8cb 2068 	str.w	r2, [fp, #104]	; 0x68
 800aaee:	f1a4 0403 	sub.w	r4, r4, #3
 800aaf2:	f82b e013 	strh.w	lr, [fp, r3, lsl #1]
 800aaf6:	ea4f 06d6 	mov.w	r6, r6, lsr #3
 800aafa:	f000 81bb 	beq.w	800ae74 <inflate+0xfc8>
 800aafe:	2c02      	cmp	r4, #2
 800ab00:	463a      	mov	r2, r7
 800ab02:	d9e0      	bls.n	800aac6 <inflate+0xc1a>
 800ab04:	e7ea      	b.n	800aadc <inflate+0xc30>
 800ab06:	f8db 2008 	ldr.w	r2, [fp, #8]
 800ab0a:	2a00      	cmp	r2, #0
 800ab0c:	f47f ab1f 	bne.w	800a14e <inflate+0x2a2>
 800ab10:	230c      	movs	r3, #12
 800ab12:	f88b 3000 	strb.w	r3, [fp]
 800ab16:	f7ff bb8c 	b.w	800a232 <inflate+0x386>
 800ab1a:	f8db 2010 	ldr.w	r2, [fp, #16]
 800ab1e:	0557      	lsls	r7, r2, #21
 800ab20:	f57f aa82 	bpl.w	800a028 <inflate+0x17c>
 800ab24:	2c0f      	cmp	r4, #15
 800ab26:	d86c      	bhi.n	800ac02 <inflate+0xd56>
 800ab28:	2d00      	cmp	r5, #0
 800ab2a:	f43f abc9 	beq.w	800a2c0 <inflate+0x414>
 800ab2e:	f819 3b01 	ldrb.w	r3, [r9], #1
 800ab32:	3d01      	subs	r5, #1
 800ab34:	40a3      	lsls	r3, r4
 800ab36:	3408      	adds	r4, #8
 800ab38:	2c0f      	cmp	r4, #15
 800ab3a:	441e      	add	r6, r3
 800ab3c:	d9f4      	bls.n	800ab28 <inflate+0xc7c>
 800ab3e:	e060      	b.n	800ac02 <inflate+0xd56>
 800ab40:	f8db 3020 	ldr.w	r3, [fp, #32]
 800ab44:	b103      	cbz	r3, 800ab48 <inflate+0xc9c>
 800ab46:	61d9      	str	r1, [r3, #28]
 800ab48:	2100      	movs	r1, #0
 800ab4a:	2307      	movs	r3, #7
 800ab4c:	f8cb 1040 	str.w	r1, [fp, #64]	; 0x40
 800ab50:	f88b 3000 	strb.w	r3, [fp]
 800ab54:	e697      	b.n	800a886 <inflate+0x9da>
 800ab56:	f8db 2010 	ldr.w	r2, [fp, #16]
 800ab5a:	f7ff ba83 	b.w	800a064 <inflate+0x1b8>
 800ab5e:	f8db 2010 	ldr.w	r2, [fp, #16]
 800ab62:	4674      	mov	r4, lr
 800ab64:	0591      	lsls	r1, r2, #22
 800ab66:	f100 82a7 	bmi.w	800b0b8 <inflate+0x120c>
 800ab6a:	1bed      	subs	r5, r5, r7
 800ab6c:	44b9      	add	r9, r7
 800ab6e:	e7eb      	b.n	800ab48 <inflate+0xc9c>
 800ab70:	9a03      	ldr	r2, [sp, #12]
 800ab72:	f8db 0040 	ldr.w	r0, [fp, #64]	; 0x40
 800ab76:	1ad3      	subs	r3, r2, r3
 800ab78:	4602      	mov	r2, r0
 800ab7a:	9f02      	ldr	r7, [sp, #8]
 800ab7c:	42b8      	cmp	r0, r7
 800ab7e:	bf28      	it	cs
 800ab80:	4638      	movcs	r0, r7
 800ab82:	1a12      	subs	r2, r2, r0
 800ab84:	f8cb 2040 	str.w	r2, [fp, #64]	; 0x40
 800ab88:	1a3a      	subs	r2, r7, r0
 800ab8a:	9202      	str	r2, [sp, #8]
 800ab8c:	9a03      	ldr	r2, [sp, #12]
 800ab8e:	181f      	adds	r7, r3, r0
 800ab90:	3a01      	subs	r2, #1
 800ab92:	f813 1b01 	ldrb.w	r1, [r3], #1
 800ab96:	429f      	cmp	r7, r3
 800ab98:	f802 1f01 	strb.w	r1, [r2, #1]!
 800ab9c:	d1f9      	bne.n	800ab92 <inflate+0xce6>
 800ab9e:	9a03      	ldr	r2, [sp, #12]
 800aba0:	f8db 3040 	ldr.w	r3, [fp, #64]	; 0x40
 800aba4:	4402      	add	r2, r0
 800aba6:	9203      	str	r2, [sp, #12]
 800aba8:	b11b      	cbz	r3, 800abb2 <inflate+0xd06>
 800abaa:	f89b 3000 	ldrb.w	r3, [fp]
 800abae:	f7ff b9a5 	b.w	8009efc <inflate+0x50>
 800abb2:	2312      	movs	r3, #18
 800abb4:	f88b 3000 	strb.w	r3, [fp]
 800abb8:	e48a      	b.n	800a4d0 <inflate+0x624>
 800abba:	f8db 1020 	ldr.w	r1, [fp, #32]
 800abbe:	b179      	cbz	r1, 800abe0 <inflate+0xd34>
 800abc0:	6908      	ldr	r0, [r1, #16]
 800abc2:	b168      	cbz	r0, 800abe0 <inflate+0xd34>
 800abc4:	694a      	ldr	r2, [r1, #20]
 800abc6:	6989      	ldr	r1, [r1, #24]
 800abc8:	1ad3      	subs	r3, r2, r3
 800abca:	18fa      	adds	r2, r7, r3
 800abcc:	428a      	cmp	r2, r1
 800abce:	bf8c      	ite	hi
 800abd0:	1aca      	subhi	r2, r1, r3
 800abd2:	463a      	movls	r2, r7
 800abd4:	4418      	add	r0, r3
 800abd6:	4649      	mov	r1, r9
 800abd8:	f7f5 fdba 	bl	8000750 <memcpy>
 800abdc:	f8db 2010 	ldr.w	r2, [fp, #16]
 800abe0:	0591      	lsls	r1, r2, #22
 800abe2:	f100 80b0 	bmi.w	800ad46 <inflate+0xe9a>
 800abe6:	f8db 3040 	ldr.w	r3, [fp, #64]	; 0x40
 800abea:	1bed      	subs	r5, r5, r7
 800abec:	1bdb      	subs	r3, r3, r7
 800abee:	44b9      	add	r9, r7
 800abf0:	f8cb 3040 	str.w	r3, [fp, #64]	; 0x40
 800abf4:	f7ff ba2b 	b.w	800a04e <inflate+0x1a2>
 800abf8:	230b      	movs	r3, #11
 800abfa:	f88b 3000 	strb.w	r3, [fp]
 800abfe:	f7ff bb14 	b.w	800a22a <inflate+0x37e>
 800ac02:	f8db 3020 	ldr.w	r3, [fp, #32]
 800ac06:	f8cb 6040 	str.w	r6, [fp, #64]	; 0x40
 800ac0a:	b103      	cbz	r3, 800ac0e <inflate+0xd62>
 800ac0c:	615e      	str	r6, [r3, #20]
 800ac0e:	f412 7300 	ands.w	r3, r2, #512	; 0x200
 800ac12:	f040 80ce 	bne.w	800adb2 <inflate+0xf06>
 800ac16:	461e      	mov	r6, r3
 800ac18:	461c      	mov	r4, r3
 800ac1a:	f7ff ba0a 	b.w	800a032 <inflate+0x186>
 800ac1e:	230f      	movs	r3, #15
 800ac20:	08f6      	lsrs	r6, r6, #3
 800ac22:	3c03      	subs	r4, #3
 800ac24:	f88b 3000 	strb.w	r3, [fp]
 800ac28:	f7ff b993 	b.w	8009f52 <inflate+0xa6>
 800ac2c:	2300      	movs	r3, #0
 800ac2e:	9305      	str	r3, [sp, #20]
 800ac30:	f7ff bb47 	b.w	800a2c2 <inflate+0x416>
 800ac34:	230b      	movs	r3, #11
 800ac36:	4634      	mov	r4, r6
 800ac38:	f88b 3000 	strb.w	r3, [fp]
 800ac3c:	f7ff baf5 	b.w	800a22a <inflate+0x37e>
 800ac40:	2201      	movs	r2, #1
 800ac42:	6a61      	ldr	r1, [r4, #36]	; 0x24
 800ac44:	f8da 3020 	ldr.w	r3, [sl, #32]
 800ac48:	fa02 f101 	lsl.w	r1, r2, r1
 800ac4c:	f8da 0028 	ldr.w	r0, [sl, #40]	; 0x28
 800ac50:	4798      	blx	r3
 800ac52:	6360      	str	r0, [r4, #52]	; 0x34
 800ac54:	b338      	cbz	r0, 800aca6 <inflate+0xdfa>
 800ac56:	f8da 3010 	ldr.w	r3, [sl, #16]
 800ac5a:	9302      	str	r3, [sp, #8]
 800ac5c:	f8da 300c 	ldr.w	r3, [sl, #12]
 800ac60:	9303      	str	r3, [sp, #12]
 800ac62:	f7ff bb4d 	b.w	800a300 <inflate+0x454>
 800ac66:	2400      	movs	r4, #0
 800ac68:	4626      	mov	r6, r4
 800ac6a:	e75d      	b.n	800ab28 <inflate+0xc7c>
 800ac6c:	231b      	movs	r3, #27
 800ac6e:	4a69      	ldr	r2, [pc, #420]	; (800ae14 <inflate+0xf68>)
 800ac70:	f8ca 2018 	str.w	r2, [sl, #24]
 800ac74:	f88b 3000 	strb.w	r3, [fp]
 800ac78:	f7ff ba58 	b.w	800a12c <inflate+0x280>
 800ac7c:	2400      	movs	r4, #0
 800ac7e:	4626      	mov	r6, r4
 800ac80:	e62c      	b.n	800a8dc <inflate+0xa30>
 800ac82:	f8db 3034 	ldr.w	r3, [fp, #52]	; 0x34
 800ac86:	1a12      	subs	r2, r2, r0
 800ac88:	4413      	add	r3, r2
 800ac8a:	e591      	b.n	800a7b0 <inflate+0x904>
 800ac8c:	2315      	movs	r3, #21
 800ac8e:	f001 010f 	and.w	r1, r1, #15
 800ac92:	f8cb 1048 	str.w	r1, [fp, #72]	; 0x48
 800ac96:	f8cb 0044 	str.w	r0, [fp, #68]	; 0x44
 800ac9a:	f88b 3000 	strb.w	r3, [fp]
 800ac9e:	2900      	cmp	r1, #0
 800aca0:	f47f adc1 	bne.w	800a826 <inflate+0x97a>
 800aca4:	e5a5      	b.n	800a7f2 <inflate+0x946>
 800aca6:	231c      	movs	r3, #28
 800aca8:	f06f 0203 	mvn.w	r2, #3
 800acac:	f88b 3000 	strb.w	r3, [fp]
 800acb0:	9205      	str	r2, [sp, #20]
 800acb2:	f7ff bb9b 	b.w	800a3ec <inflate+0x540>
 800acb6:	0a33      	lsrs	r3, r6, #8
 800acb8:	2202      	movs	r2, #2
 800acba:	a90d      	add	r1, sp, #52	; 0x34
 800acbc:	f8db 0018 	ldr.w	r0, [fp, #24]
 800acc0:	f88d 6034 	strb.w	r6, [sp, #52]	; 0x34
 800acc4:	f88d 3035 	strb.w	r3, [sp, #53]	; 0x35
 800acc8:	f7fd f85e 	bl	8007d88 <crc32>
 800accc:	f8db 2010 	ldr.w	r2, [fp, #16]
 800acd0:	f8cb 0018 	str.w	r0, [fp, #24]
 800acd4:	f7ff b9a0 	b.w	800a018 <inflate+0x16c>
 800acd8:	f8dd b02c 	ldr.w	fp, [sp, #44]	; 0x2c
 800acdc:	9505      	str	r5, [sp, #20]
 800acde:	f7ff baf0 	b.w	800a2c2 <inflate+0x416>
 800ace2:	1c7a      	adds	r2, r7, #1
 800ace4:	f107 0138 	add.w	r1, r7, #56	; 0x38
 800ace8:	f8cb 2068 	str.w	r2, [fp, #104]	; 0x68
 800acec:	fa26 f60c 	lsr.w	r6, r6, ip
 800acf0:	eba4 040c 	sub.w	r4, r4, ip
 800acf4:	4617      	mov	r7, r2
 800acf6:	f82b 3011 	strh.w	r3, [fp, r1, lsl #1]
 800acfa:	e646      	b.n	800a98a <inflate+0xade>
 800acfc:	231b      	movs	r3, #27
 800acfe:	4a46      	ldr	r2, [pc, #280]	; (800ae18 <inflate+0xf6c>)
 800ad00:	f8ca 2018 	str.w	r2, [sl, #24]
 800ad04:	f88b 3000 	strb.w	r3, [fp]
 800ad08:	f7ff ba10 	b.w	800a12c <inflate+0x280>
 800ad0c:	2109      	movs	r1, #9
 800ad0e:	2205      	movs	r2, #5
 800ad10:	2312      	movs	r3, #18
 800ad12:	4842      	ldr	r0, [pc, #264]	; (800ae1c <inflate+0xf70>)
 800ad14:	08f6      	lsrs	r6, r6, #3
 800ad16:	f8cb 004c 	str.w	r0, [fp, #76]	; 0x4c
 800ad1a:	9805      	ldr	r0, [sp, #20]
 800ad1c:	3c03      	subs	r4, #3
 800ad1e:	f8cb 0050 	str.w	r0, [fp, #80]	; 0x50
 800ad22:	f8cb 1054 	str.w	r1, [fp, #84]	; 0x54
 800ad26:	f8cb 2058 	str.w	r2, [fp, #88]	; 0x58
 800ad2a:	f88b 3000 	strb.w	r3, [fp]
 800ad2e:	f7ff bbcf 	b.w	800a4d0 <inflate+0x624>
 800ad32:	221b      	movs	r2, #27
 800ad34:	493a      	ldr	r1, [pc, #232]	; (800ae20 <inflate+0xf74>)
 800ad36:	08f6      	lsrs	r6, r6, #3
 800ad38:	f8ca 1018 	str.w	r1, [sl, #24]
 800ad3c:	3c03      	subs	r4, #3
 800ad3e:	f88b 2000 	strb.w	r2, [fp]
 800ad42:	f7ff b9f3 	b.w	800a12c <inflate+0x280>
 800ad46:	463a      	mov	r2, r7
 800ad48:	4649      	mov	r1, r9
 800ad4a:	f8db 0018 	ldr.w	r0, [fp, #24]
 800ad4e:	f7fd f81b 	bl	8007d88 <crc32>
 800ad52:	f8cb 0018 	str.w	r0, [fp, #24]
 800ad56:	e746      	b.n	800abe6 <inflate+0xd3a>
 800ad58:	0a31      	lsrs	r1, r6, #8
 800ad5a:	0c30      	lsrs	r0, r6, #16
 800ad5c:	0e33      	lsrs	r3, r6, #24
 800ad5e:	f88d 1035 	strb.w	r1, [sp, #53]	; 0x35
 800ad62:	f88d 0036 	strb.w	r0, [sp, #54]	; 0x36
 800ad66:	2204      	movs	r2, #4
 800ad68:	a90d      	add	r1, sp, #52	; 0x34
 800ad6a:	f8db 0018 	ldr.w	r0, [fp, #24]
 800ad6e:	f88d 6034 	strb.w	r6, [sp, #52]	; 0x34
 800ad72:	f88d 3037 	strb.w	r3, [sp, #55]	; 0x37
 800ad76:	f7fd f807 	bl	8007d88 <crc32>
 800ad7a:	f8cb 0018 	str.w	r0, [fp, #24]
 800ad7e:	f7ff b92f 	b.w	8009fe0 <inflate+0x134>
 800ad82:	2400      	movs	r4, #0
 800ad84:	210e      	movs	r1, #14
 800ad86:	4613      	mov	r3, r2
 800ad88:	4626      	mov	r6, r4
 800ad8a:	f8cb 2040 	str.w	r2, [fp, #64]	; 0x40
 800ad8e:	f88b 1000 	strb.w	r1, [fp]
 800ad92:	2b00      	cmp	r3, #0
 800ad94:	f43f af30 	beq.w	800abf8 <inflate+0xd4c>
 800ad98:	e662      	b.n	800aa60 <inflate+0xbb4>
 800ad9a:	f416 4f60 	tst.w	r6, #57344	; 0xe000
 800ad9e:	f43f a8fd 	beq.w	8009f9c <inflate+0xf0>
 800ada2:	231b      	movs	r3, #27
 800ada4:	4a1f      	ldr	r2, [pc, #124]	; (800ae24 <inflate+0xf78>)
 800ada6:	f8ca 2018 	str.w	r2, [sl, #24]
 800adaa:	f88b 3000 	strb.w	r3, [fp]
 800adae:	f7ff b9bd 	b.w	800a12c <inflate+0x280>
 800adb2:	0a33      	lsrs	r3, r6, #8
 800adb4:	2202      	movs	r2, #2
 800adb6:	a90d      	add	r1, sp, #52	; 0x34
 800adb8:	f8db 0018 	ldr.w	r0, [fp, #24]
 800adbc:	f88d 6034 	strb.w	r6, [sp, #52]	; 0x34
 800adc0:	f88d 3035 	strb.w	r3, [sp, #53]	; 0x35
 800adc4:	2600      	movs	r6, #0
 800adc6:	f7fc ffdf 	bl	8007d88 <crc32>
 800adca:	4634      	mov	r4, r6
 800adcc:	f8cb 0018 	str.w	r0, [fp, #24]
 800add0:	f8db 2010 	ldr.w	r2, [fp, #16]
 800add4:	f7ff b92d 	b.w	800a032 <inflate+0x186>
 800add8:	f8db 3010 	ldr.w	r3, [fp, #16]
 800addc:	2b00      	cmp	r3, #0
 800adde:	f040 80c9 	bne.w	800af74 <inflate+0x10c8>
 800ade2:	9b03      	ldr	r3, [sp, #12]
 800ade4:	f8db 0018 	ldr.w	r0, [fp, #24]
 800ade8:	1a99      	subs	r1, r3, r2
 800adea:	f7fe ff33 	bl	8009c54 <adler32>
 800adee:	f8cb 0018 	str.w	r0, [fp, #24]
 800adf2:	f8ca 0034 	str.w	r0, [sl, #52]	; 0x34
 800adf6:	0633      	lsls	r3, r6, #24
 800adf8:	0a31      	lsrs	r1, r6, #8
 800adfa:	eb03 6316 	add.w	r3, r3, r6, lsr #24
 800adfe:	f401 417f 	and.w	r1, r1, #65280	; 0xff00
 800ae02:	0232      	lsls	r2, r6, #8
 800ae04:	440b      	add	r3, r1
 800ae06:	f402 027f 	and.w	r2, r2, #16711680	; 0xff0000
 800ae0a:	4413      	add	r3, r2
 800ae0c:	f7ff bb38 	b.w	800a480 <inflate+0x5d4>
 800ae10:	0800f5c4 	.word	0x0800f5c4
 800ae14:	0800f714 	.word	0x0800f714
 800ae18:	0800f668 	.word	0x0800f668
 800ae1c:	0800ed44 	.word	0x0800ed44
 800ae20:	0800f6e0 	.word	0x0800f6e0
 800ae24:	0800f6b0 	.word	0x0800f6b0
 800ae28:	40d6      	lsrs	r6, r2
 800ae2a:	1aa4      	subs	r4, r4, r2
 800ae2c:	f8cb 0040 	str.w	r0, [fp, #64]	; 0x40
 800ae30:	f7ff bbeb 	b.w	800a60a <inflate+0x75e>
 800ae34:	f10c 0202 	add.w	r2, ip, #2
 800ae38:	4294      	cmp	r4, r2
 800ae3a:	d20a      	bcs.n	800ae52 <inflate+0xfa6>
 800ae3c:	2d00      	cmp	r5, #0
 800ae3e:	f43f aa3f 	beq.w	800a2c0 <inflate+0x414>
 800ae42:	f819 3b01 	ldrb.w	r3, [r9], #1
 800ae46:	3d01      	subs	r5, #1
 800ae48:	40a3      	lsls	r3, r4
 800ae4a:	3408      	adds	r4, #8
 800ae4c:	4294      	cmp	r4, r2
 800ae4e:	441e      	add	r6, r3
 800ae50:	d3f4      	bcc.n	800ae3c <inflate+0xf90>
 800ae52:	fa26 f60c 	lsr.w	r6, r6, ip
 800ae56:	eba4 040c 	sub.w	r4, r4, ip
 800ae5a:	2f00      	cmp	r7, #0
 800ae5c:	f000 8115 	beq.w	800b08a <inflate+0x11de>
 800ae60:	f006 0303 	and.w	r3, r6, #3
 800ae64:	f107 0237 	add.w	r2, r7, #55	; 0x37
 800ae68:	3c02      	subs	r4, #2
 800ae6a:	f83b 2012 	ldrh.w	r2, [fp, r2, lsl #1]
 800ae6e:	3303      	adds	r3, #3
 800ae70:	08b6      	lsrs	r6, r6, #2
 800ae72:	e5d5      	b.n	800aa20 <inflate+0xb74>
 800ae74:	4613      	mov	r3, r2
 800ae76:	2b12      	cmp	r3, #18
 800ae78:	d80f      	bhi.n	800ae9a <inflate+0xfee>
 800ae7a:	2100      	movs	r1, #0
 800ae7c:	4a99      	ldr	r2, [pc, #612]	; (800b0e4 <inflate+0x1238>)
 800ae7e:	eb02 0343 	add.w	r3, r2, r3, lsl #1
 800ae82:	3b02      	subs	r3, #2
 800ae84:	f833 2f02 	ldrh.w	r2, [r3, #2]!
 800ae88:	3238      	adds	r2, #56	; 0x38
 800ae8a:	f82b 1012 	strh.w	r1, [fp, r2, lsl #1]
 800ae8e:	4a96      	ldr	r2, [pc, #600]	; (800b0e8 <inflate+0x123c>)
 800ae90:	429a      	cmp	r2, r3
 800ae92:	d1f7      	bne.n	800ae84 <inflate+0xfd8>
 800ae94:	2313      	movs	r3, #19
 800ae96:	f8cb 3068 	str.w	r3, [fp, #104]	; 0x68
 800ae9a:	2007      	movs	r0, #7
 800ae9c:	f50b 63a6 	add.w	r3, fp, #1328	; 0x530
 800aea0:	f50b 713c 	add.w	r1, fp, #752	; 0x2f0
 800aea4:	f10b 0254 	add.w	r2, fp, #84	; 0x54
 800aea8:	f8cb 0054 	str.w	r0, [fp, #84]	; 0x54
 800aeac:	f8cb 306c 	str.w	r3, [fp, #108]	; 0x6c
 800aeb0:	f8cb 304c 	str.w	r3, [fp, #76]	; 0x4c
 800aeb4:	2000      	movs	r0, #0
 800aeb6:	9101      	str	r1, [sp, #4]
 800aeb8:	9200      	str	r2, [sp, #0]
 800aeba:	f10b 036c 	add.w	r3, fp, #108	; 0x6c
 800aebe:	2213      	movs	r2, #19
 800aec0:	f10b 0170 	add.w	r1, fp, #112	; 0x70
 800aec4:	f7fe fc5c 	bl	8009780 <inflate_table>
 800aec8:	2800      	cmp	r0, #0
 800aeca:	d03b      	beq.n	800af44 <inflate+0x1098>
 800aecc:	231b      	movs	r3, #27
 800aece:	4a87      	ldr	r2, [pc, #540]	; (800b0ec <inflate+0x1240>)
 800aed0:	f8ca 2018 	str.w	r2, [sl, #24]
 800aed4:	f88b 3000 	strb.w	r3, [fp]
 800aed8:	f7ff b928 	b.w	800a12c <inflate+0x280>
 800aedc:	2301      	movs	r3, #1
 800aede:	9305      	str	r3, [sp, #20]
 800aee0:	f7ff b9ef 	b.w	800a2c2 <inflate+0x416>
 800aee4:	44a9      	add	r9, r5
 800aee6:	9d05      	ldr	r5, [sp, #20]
 800aee8:	f7ff b9eb 	b.w	800a2c2 <inflate+0x416>
 800aeec:	2319      	movs	r3, #25
 800aeee:	2400      	movs	r4, #0
 800aef0:	9a02      	ldr	r2, [sp, #8]
 800aef2:	f88b 3000 	strb.w	r3, [fp]
 800aef6:	4626      	mov	r6, r4
 800aef8:	f8db 3008 	ldr.w	r3, [fp, #8]
 800aefc:	9206      	str	r2, [sp, #24]
 800aefe:	e4a2      	b.n	800a846 <inflate+0x99a>
 800af00:	f10c 0203 	add.w	r2, ip, #3
 800af04:	4294      	cmp	r4, r2
 800af06:	d20a      	bcs.n	800af1e <inflate+0x1072>
 800af08:	2d00      	cmp	r5, #0
 800af0a:	f43f a9d9 	beq.w	800a2c0 <inflate+0x414>
 800af0e:	f819 3b01 	ldrb.w	r3, [r9], #1
 800af12:	3d01      	subs	r5, #1
 800af14:	40a3      	lsls	r3, r4
 800af16:	3408      	adds	r4, #8
 800af18:	4294      	cmp	r4, r2
 800af1a:	441e      	add	r6, r3
 800af1c:	d3f4      	bcc.n	800af08 <inflate+0x105c>
 800af1e:	fa26 f60c 	lsr.w	r6, r6, ip
 800af22:	f1cc 2cff 	rsb	ip, ip, #4278255360	; 0xff00ff00
 800af26:	f50c 0c7f 	add.w	ip, ip, #16711680	; 0xff0000
 800af2a:	f006 0307 	and.w	r3, r6, #7
 800af2e:	f10c 0cfd 	add.w	ip, ip, #253	; 0xfd
 800af32:	4464      	add	r4, ip
 800af34:	3303      	adds	r3, #3
 800af36:	08f6      	lsrs	r6, r6, #3
 800af38:	2200      	movs	r2, #0
 800af3a:	e571      	b.n	800aa20 <inflate+0xb74>
 800af3c:	9b02      	ldr	r3, [sp, #8]
 800af3e:	9305      	str	r3, [sp, #20]
 800af40:	f7ff b9bf 	b.w	800a2c2 <inflate+0x416>
 800af44:	2311      	movs	r3, #17
 800af46:	4607      	mov	r7, r0
 800af48:	f8cb 0068 	str.w	r0, [fp, #104]	; 0x68
 800af4c:	f88b 3000 	strb.w	r3, [fp]
 800af50:	e513      	b.n	800a97a <inflate+0xace>
 800af52:	2313      	movs	r3, #19
 800af54:	f001 010f 	and.w	r1, r1, #15
 800af58:	f8cb 1048 	str.w	r1, [fp, #72]	; 0x48
 800af5c:	f88b 3000 	strb.w	r3, [fp]
 800af60:	2900      	cmp	r1, #0
 800af62:	f43f ab7c 	beq.w	800a65e <inflate+0x7b2>
 800af66:	f7ff bb6d 	b.w	800a644 <inflate+0x798>
 800af6a:	f8dd b024 	ldr.w	fp, [sp, #36]	; 0x24
 800af6e:	9505      	str	r5, [sp, #20]
 800af70:	f7ff b9a7 	b.w	800a2c2 <inflate+0x416>
 800af74:	9b03      	ldr	r3, [sp, #12]
 800af76:	f8db 0018 	ldr.w	r0, [fp, #24]
 800af7a:	1a99      	subs	r1, r3, r2
 800af7c:	f7fc ff04 	bl	8007d88 <crc32>
 800af80:	f8db 3010 	ldr.w	r3, [fp, #16]
 800af84:	f8cb 0018 	str.w	r0, [fp, #24]
 800af88:	f8ca 0034 	str.w	r0, [sl, #52]	; 0x34
 800af8c:	f7ff ba74 	b.w	800a478 <inflate+0x5cc>
 800af90:	9b03      	ldr	r3, [sp, #12]
 800af92:	f8ca 9000 	str.w	r9, [sl]
 800af96:	f8ca 300c 	str.w	r3, [sl, #12]
 800af9a:	9b02      	ldr	r3, [sp, #8]
 800af9c:	f8ca 5004 	str.w	r5, [sl, #4]
 800afa0:	f8ca 3010 	str.w	r3, [sl, #16]
 800afa4:	2302      	movs	r3, #2
 800afa6:	f8cb 6038 	str.w	r6, [fp, #56]	; 0x38
 800afaa:	9305      	str	r3, [sp, #20]
 800afac:	f8cb 403c 	str.w	r4, [fp, #60]	; 0x3c
 800afb0:	f7ff ba1c 	b.w	800a3ec <inflate+0x540>
 800afb4:	231b      	movs	r3, #27
 800afb6:	4a4e      	ldr	r2, [pc, #312]	; (800b0f0 <inflate+0x1244>)
 800afb8:	3c04      	subs	r4, #4
 800afba:	f8ca 2018 	str.w	r2, [sl, #24]
 800afbe:	f88b 3000 	strb.w	r3, [fp]
 800afc2:	f7ff b8b3 	b.w	800a12c <inflate+0x280>
 800afc6:	f89b 3000 	ldrb.w	r3, [fp]
 800afca:	2b1b      	cmp	r3, #27
 800afcc:	f43f a8ae 	beq.w	800a12c <inflate+0x280>
 800afd0:	2109      	movs	r1, #9
 800afd2:	f10b 0270 	add.w	r2, fp, #112	; 0x70
 800afd6:	f50b 63a6 	add.w	r3, fp, #1328	; 0x530
 800afda:	f50b 703c 	add.w	r0, fp, #752	; 0x2f0
 800afde:	9209      	str	r2, [sp, #36]	; 0x24
 800afe0:	f10b 076c 	add.w	r7, fp, #108	; 0x6c
 800afe4:	f10b 0e54 	add.w	lr, fp, #84	; 0x54
 800afe8:	f8cb 1054 	str.w	r1, [fp, #84]	; 0x54
 800afec:	f8cb 306c 	str.w	r3, [fp, #108]	; 0x6c
 800aff0:	f8cb 304c 	str.w	r3, [fp, #76]	; 0x4c
 800aff4:	900a      	str	r0, [sp, #40]	; 0x28
 800aff6:	9001      	str	r0, [sp, #4]
 800aff8:	9a08      	ldr	r2, [sp, #32]
 800affa:	9909      	ldr	r1, [sp, #36]	; 0x24
 800affc:	463b      	mov	r3, r7
 800affe:	f8cd e000 	str.w	lr, [sp]
 800b002:	2001      	movs	r0, #1
 800b004:	f7fe fbbc 	bl	8009780 <inflate_table>
 800b008:	b1e8      	cbz	r0, 800b046 <inflate+0x119a>
 800b00a:	231b      	movs	r3, #27
 800b00c:	4a39      	ldr	r2, [pc, #228]	; (800b0f4 <inflate+0x1248>)
 800b00e:	f8ca 2018 	str.w	r2, [sl, #24]
 800b012:	f88b 3000 	strb.w	r3, [fp]
 800b016:	f7ff b889 	b.w	800a12c <inflate+0x280>
 800b01a:	0a33      	lsrs	r3, r6, #8
 800b01c:	2202      	movs	r2, #2
 800b01e:	a90d      	add	r1, sp, #52	; 0x34
 800b020:	f8db 0018 	ldr.w	r0, [fp, #24]
 800b024:	f88d 6034 	strb.w	r6, [sp, #52]	; 0x34
 800b028:	f88d 3035 	strb.w	r3, [sp, #53]	; 0x35
 800b02c:	f7fc feac 	bl	8007d88 <crc32>
 800b030:	f8cb 0018 	str.w	r0, [fp, #24]
 800b034:	f7fe bfbb 	b.w	8009fae <inflate+0x102>
 800b038:	2400      	movs	r4, #0
 800b03a:	4626      	mov	r6, r4
 800b03c:	f7ff b9f7 	b.w	800a42e <inflate+0x582>
 800b040:	9705      	str	r7, [sp, #20]
 800b042:	f7ff b93e 	b.w	800a2c2 <inflate+0x416>
 800b046:	2206      	movs	r2, #6
 800b048:	f8db 306c 	ldr.w	r3, [fp, #108]	; 0x6c
 800b04c:	f8cb 2058 	str.w	r2, [fp, #88]	; 0x58
 800b050:	9a0a      	ldr	r2, [sp, #40]	; 0x28
 800b052:	f8db 1060 	ldr.w	r1, [fp, #96]	; 0x60
 800b056:	f8cb 3050 	str.w	r3, [fp, #80]	; 0x50
 800b05a:	f10b 0358 	add.w	r3, fp, #88	; 0x58
 800b05e:	9201      	str	r2, [sp, #4]
 800b060:	9a09      	ldr	r2, [sp, #36]	; 0x24
 800b062:	9300      	str	r3, [sp, #0]
 800b064:	eb02 0141 	add.w	r1, r2, r1, lsl #1
 800b068:	463b      	mov	r3, r7
 800b06a:	f8db 2064 	ldr.w	r2, [fp, #100]	; 0x64
 800b06e:	2002      	movs	r0, #2
 800b070:	f7fe fb86 	bl	8009780 <inflate_table>
 800b074:	2800      	cmp	r0, #0
 800b076:	f43f ad9c 	beq.w	800abb2 <inflate+0xd06>
 800b07a:	231b      	movs	r3, #27
 800b07c:	4a1e      	ldr	r2, [pc, #120]	; (800b0f8 <inflate+0x124c>)
 800b07e:	f8ca 2018 	str.w	r2, [sl, #24]
 800b082:	f88b 3000 	strb.w	r3, [fp]
 800b086:	f7ff b851 	b.w	800a12c <inflate+0x280>
 800b08a:	231b      	movs	r3, #27
 800b08c:	4a1b      	ldr	r2, [pc, #108]	; (800b0fc <inflate+0x1250>)
 800b08e:	f8ca 2018 	str.w	r2, [sl, #24]
 800b092:	f88b 3000 	strb.w	r3, [fp]
 800b096:	f7ff b849 	b.w	800a12c <inflate+0x280>
 800b09a:	463a      	mov	r2, r7
 800b09c:	4649      	mov	r1, r9
 800b09e:	f8db 0018 	ldr.w	r0, [fp, #24]
 800b0a2:	f7fc fe71 	bl	8007d88 <crc32>
 800b0a6:	f8db 2010 	ldr.w	r2, [fp, #16]
 800b0aa:	1bed      	subs	r5, r5, r7
 800b0ac:	44b9      	add	r9, r7
 800b0ae:	f8cb 0018 	str.w	r0, [fp, #24]
 800b0b2:	f402 7300 	and.w	r3, r2, #512	; 0x200
 800b0b6:	e40d      	b.n	800a8d4 <inflate+0xa28>
 800b0b8:	463a      	mov	r2, r7
 800b0ba:	4649      	mov	r1, r9
 800b0bc:	f8db 0018 	ldr.w	r0, [fp, #24]
 800b0c0:	f7fc fe62 	bl	8007d88 <crc32>
 800b0c4:	1bed      	subs	r5, r5, r7
 800b0c6:	44b9      	add	r9, r7
 800b0c8:	f8cb 0018 	str.w	r0, [fp, #24]
 800b0cc:	f8db 2010 	ldr.w	r2, [fp, #16]
 800b0d0:	e53a      	b.n	800ab48 <inflate+0xc9c>
 800b0d2:	f8db 2010 	ldr.w	r2, [fp, #16]
 800b0d6:	f7fe bfaf 	b.w	800a038 <inflate+0x18c>
 800b0da:	f06f 0303 	mvn.w	r3, #3
 800b0de:	9305      	str	r3, [sp, #20]
 800b0e0:	f7ff b984 	b.w	800a3ec <inflate+0x540>
 800b0e4:	0800f5c4 	.word	0x0800f5c4
 800b0e8:	0800f5e8 	.word	0x0800f5e8
 800b0ec:	0800f738 	.word	0x0800f738
 800b0f0:	0800f69c 	.word	0x0800f69c
 800b0f4:	0800f770 	.word	0x0800f770
 800b0f8:	0800f78c 	.word	0x0800f78c
 800b0fc:	0800f754 	.word	0x0800f754

0800b100 <__div64_32>:
 800b100:	e92d 4cf0 	stmdb	sp!, {r4, r5, r6, r7, sl, fp, lr}
 800b104:	e9d0 6700 	ldrd	r6, r7, [r0]
 800b108:	42b9      	cmp	r1, r7
 800b10a:	460a      	mov	r2, r1
 800b10c:	f04f 0300 	mov.w	r3, #0
 800b110:	d839      	bhi.n	800b186 <__div64_32+0x86>
 800b112:	fbb7 fef1 	udiv	lr, r7, r1
 800b116:	f04f 0a00 	mov.w	sl, #0
 800b11a:	46f3      	mov	fp, lr
 800b11c:	fb0e f501 	mul.w	r5, lr, r1
 800b120:	ebb6 060a 	subs.w	r6, r6, sl
 800b124:	eb67 0705 	sbc.w	r7, r7, r5
 800b128:	b391      	cbz	r1, 800b190 <__div64_32+0x90>
 800b12a:	42bb      	cmp	r3, r7
 800b12c:	bf08      	it	eq
 800b12e:	42b2      	cmpeq	r2, r6
 800b130:	f04f 0401 	mov.w	r4, #1
 800b134:	f04f 0500 	mov.w	r5, #0
 800b138:	d304      	bcc.n	800b144 <__div64_32+0x44>
 800b13a:	e00b      	b.n	800b154 <__div64_32+0x54>
 800b13c:	42bb      	cmp	r3, r7
 800b13e:	bf08      	it	eq
 800b140:	42b2      	cmpeq	r2, r6
 800b142:	d207      	bcs.n	800b154 <__div64_32+0x54>
 800b144:	1892      	adds	r2, r2, r2
 800b146:	415b      	adcs	r3, r3
 800b148:	1924      	adds	r4, r4, r4
 800b14a:	416d      	adcs	r5, r5
 800b14c:	2a01      	cmp	r2, #1
 800b14e:	f173 0100 	sbcs.w	r1, r3, #0
 800b152:	daf3      	bge.n	800b13c <__div64_32+0x3c>
 800b154:	429f      	cmp	r7, r3
 800b156:	bf08      	it	eq
 800b158:	4296      	cmpeq	r6, r2
 800b15a:	d306      	bcc.n	800b16a <__div64_32+0x6a>
 800b15c:	1ab6      	subs	r6, r6, r2
 800b15e:	eb67 0703 	sbc.w	r7, r7, r3
 800b162:	eb1a 0a04 	adds.w	sl, sl, r4
 800b166:	eb4b 0b05 	adc.w	fp, fp, r5
 800b16a:	086d      	lsrs	r5, r5, #1
 800b16c:	ea4f 0434 	mov.w	r4, r4, rrx
 800b170:	085b      	lsrs	r3, r3, #1
 800b172:	ea4f 0232 	mov.w	r2, r2, rrx
 800b176:	ea54 0105 	orrs.w	r1, r4, r5
 800b17a:	d1eb      	bne.n	800b154 <__div64_32+0x54>
 800b17c:	e9c0 ab00 	strd	sl, fp, [r0]
 800b180:	4630      	mov	r0, r6
 800b182:	e8bd 8cf0 	ldmia.w	sp!, {r4, r5, r6, r7, sl, fp, pc}
 800b186:	f04f 0a00 	mov.w	sl, #0
 800b18a:	f04f 0b00 	mov.w	fp, #0
 800b18e:	e7cb      	b.n	800b128 <__div64_32+0x28>
 800b190:	2401      	movs	r4, #1
 800b192:	2500      	movs	r5, #0
 800b194:	e7de      	b.n	800b154 <__div64_32+0x54>
 800b196:	bf00      	nop

0800b198 <print_cpuinfo>:
 800b198:	b510      	push	{r4, lr}
 800b19a:	4914      	ldr	r1, [pc, #80]	; (800b1ec <print_cpuinfo+0x54>)
 800b19c:	b0a2      	sub	sp, #136	; 0x88
 800b19e:	4814      	ldr	r0, [pc, #80]	; (800b1f0 <print_cpuinfo+0x58>)
 800b1a0:	f7fa f8da 	bl	8005358 <printf>
 800b1a4:	4c13      	ldr	r4, [pc, #76]	; (800b1f4 <print_cpuinfo+0x5c>)
 800b1a6:	2000      	movs	r0, #0
 800b1a8:	47a0      	blx	r4
 800b1aa:	4601      	mov	r1, r0
 800b1ac:	a802      	add	r0, sp, #8
 800b1ae:	f000 fe03 	bl	800bdb8 <strmhz>
 800b1b2:	2001      	movs	r0, #1
 800b1b4:	47a0      	blx	r4
 800b1b6:	4601      	mov	r1, r0
 800b1b8:	a80a      	add	r0, sp, #40	; 0x28
 800b1ba:	f000 fdfd 	bl	800bdb8 <strmhz>
 800b1be:	2002      	movs	r0, #2
 800b1c0:	47a0      	blx	r4
 800b1c2:	4601      	mov	r1, r0
 800b1c4:	a812      	add	r0, sp, #72	; 0x48
 800b1c6:	f000 fdf7 	bl	800bdb8 <strmhz>
 800b1ca:	2003      	movs	r0, #3
 800b1cc:	47a0      	blx	r4
 800b1ce:	ac1a      	add	r4, sp, #104	; 0x68
 800b1d0:	4601      	mov	r1, r0
 800b1d2:	4620      	mov	r0, r4
 800b1d4:	f000 fdf0 	bl	800bdb8 <strmhz>
 800b1d8:	9400      	str	r4, [sp, #0]
 800b1da:	ab12      	add	r3, sp, #72	; 0x48
 800b1dc:	aa0a      	add	r2, sp, #40	; 0x28
 800b1de:	a902      	add	r1, sp, #8
 800b1e0:	4805      	ldr	r0, [pc, #20]	; (800b1f8 <print_cpuinfo+0x60>)
 800b1e2:	f7fa f8b9 	bl	8005358 <printf>
 800b1e6:	2000      	movs	r0, #0
 800b1e8:	b022      	add	sp, #136	; 0x88
 800b1ea:	bd10      	pop	{r4, pc}
 800b1ec:	0800f854 	.word	0x0800f854
 800b1f0:	0800f868 	.word	0x0800f868
 800b1f4:	20000b21 	.word	0x20000b21
 800b1f8:	0800f874 	.word	0x0800f874

0800b1fc <fsmc_nor_psram_init>:
 800b1fc:	3801      	subs	r0, #1
 800b1fe:	2803      	cmp	r0, #3
 800b200:	f200 80ac 	bhi.w	800b35c <fsmc_nor_psram_init+0x160>
 800b204:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800b206:	4e57      	ldr	r6, [pc, #348]	; (800b364 <fsmc_nor_psram_init+0x168>)
 800b208:	6834      	ldr	r4, [r6, #0]
 800b20a:	b98c      	cbnz	r4, 800b230 <fsmc_nor_psram_init+0x34>
 800b20c:	4d56      	ldr	r5, [pc, #344]	; (800b368 <fsmc_nor_psram_init+0x16c>)
 800b20e:	e001      	b.n	800b214 <fsmc_nor_psram_init+0x18>
 800b210:	2c21      	cmp	r4, #33	; 0x21
 800b212:	d00b      	beq.n	800b22c <fsmc_nor_psram_init+0x30>
 800b214:	2c02      	cmp	r4, #2
 800b216:	4628      	mov	r0, r5
 800b218:	bfd4      	ite	le
 800b21a:	210b      	movle	r1, #11
 800b21c:	2109      	movgt	r1, #9
 800b21e:	f000 f99f 	bl	800b560 <stm32f2_gpio_config>
 800b222:	3401      	adds	r4, #1
 800b224:	3502      	adds	r5, #2
 800b226:	2800      	cmp	r0, #0
 800b228:	d0f2      	beq.n	800b210 <fsmc_nor_psram_init+0x14>
 800b22a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800b22c:	2301      	movs	r3, #1
 800b22e:	6033      	str	r3, [r6, #0]
 800b230:	4a4e      	ldr	r2, [pc, #312]	; (800b36c <fsmc_nor_psram_init+0x170>)
 800b232:	6b93      	ldr	r3, [r2, #56]	; 0x38
 800b234:	f043 0301 	orr.w	r3, r3, #1
 800b238:	6393      	str	r3, [r2, #56]	; 0x38
 800b23a:	f3bf 8f4f 	dsb	sy
 800b23e:	f04f 4320 	mov.w	r3, #2684354560	; 0xa0000000
 800b242:	f241 2e97 	movw	lr, #4759	; 0x1297
 800b246:	f241 27db 	movw	r7, #4827	; 0x12db
 800b24a:	f46f 7c2e 	mvn.w	ip, #696	; 0x2b8
 800b24e:	2000      	movs	r0, #0
 800b250:	f06f 4270 	mvn.w	r2, #4026531840	; 0xf0000000
 800b254:	f243 04d2 	movw	r4, #12498	; 0x30d2
 800b258:	f04f 31fc 	mov.w	r1, #4244438268	; 0xfcfcfcfc
 800b25c:	2618      	movs	r6, #24
 800b25e:	2540      	movs	r5, #64	; 0x40
 800b260:	f8c3 e000 	str.w	lr, [r3]
 800b264:	f8df e108 	ldr.w	lr, [pc, #264]	; 800b370 <fsmc_nor_psram_init+0x174>
 800b268:	f8c3 e004 	str.w	lr, [r3, #4]
 800b26c:	609f      	str	r7, [r3, #8]
 800b26e:	f107 5744 	add.w	r7, r7, #822083584	; 0x31000000
 800b272:	f5a7 0761 	sub.w	r7, r7, #14745600	; 0xe10000
 800b276:	4467      	add	r7, ip
 800b278:	60df      	str	r7, [r3, #12]
 800b27a:	611c      	str	r4, [r3, #16]
 800b27c:	615a      	str	r2, [r3, #20]
 800b27e:	619c      	str	r4, [r3, #24]
 800b280:	61da      	str	r2, [r3, #28]
 800b282:	6218      	str	r0, [r3, #32]
 800b284:	6258      	str	r0, [r3, #36]	; 0x24
 800b286:	6298      	str	r0, [r3, #40]	; 0x28
 800b288:	62d8      	str	r0, [r3, #44]	; 0x2c
 800b28a:	6318      	str	r0, [r3, #48]	; 0x30
 800b28c:	6358      	str	r0, [r3, #52]	; 0x34
 800b28e:	6398      	str	r0, [r3, #56]	; 0x38
 800b290:	63d8      	str	r0, [r3, #60]	; 0x3c
 800b292:	6418      	str	r0, [r3, #64]	; 0x40
 800b294:	6458      	str	r0, [r3, #68]	; 0x44
 800b296:	6498      	str	r0, [r3, #72]	; 0x48
 800b298:	64d8      	str	r0, [r3, #76]	; 0x4c
 800b29a:	6518      	str	r0, [r3, #80]	; 0x50
 800b29c:	6558      	str	r0, [r3, #84]	; 0x54
 800b29e:	6598      	str	r0, [r3, #88]	; 0x58
 800b2a0:	65d8      	str	r0, [r3, #92]	; 0x5c
 800b2a2:	6618      	str	r0, [r3, #96]	; 0x60
 800b2a4:	6658      	str	r0, [r3, #100]	; 0x64
 800b2a6:	6698      	str	r0, [r3, #104]	; 0x68
 800b2a8:	66d8      	str	r0, [r3, #108]	; 0x6c
 800b2aa:	6718      	str	r0, [r3, #112]	; 0x70
 800b2ac:	6758      	str	r0, [r3, #116]	; 0x74
 800b2ae:	6798      	str	r0, [r3, #120]	; 0x78
 800b2b0:	67d8      	str	r0, [r3, #124]	; 0x7c
 800b2b2:	f8c3 6080 	str.w	r6, [r3, #128]	; 0x80
 800b2b6:	f8c3 5084 	str.w	r5, [r3, #132]	; 0x84
 800b2ba:	f8c3 1088 	str.w	r1, [r3, #136]	; 0x88
 800b2be:	f8c3 108c 	str.w	r1, [r3, #140]	; 0x8c
 800b2c2:	f8c3 0090 	str.w	r0, [r3, #144]	; 0x90
 800b2c6:	f8c3 0094 	str.w	r0, [r3, #148]	; 0x94
 800b2ca:	f8c3 0098 	str.w	r0, [r3, #152]	; 0x98
 800b2ce:	f8c3 009c 	str.w	r0, [r3, #156]	; 0x9c
 800b2d2:	f8c3 00a0 	str.w	r0, [r3, #160]	; 0xa0
 800b2d6:	f8c3 00a4 	str.w	r0, [r3, #164]	; 0xa4
 800b2da:	f8c3 00a8 	str.w	r0, [r3, #168]	; 0xa8
 800b2de:	f8c3 00ac 	str.w	r0, [r3, #172]	; 0xac
 800b2e2:	f8c3 00b0 	str.w	r0, [r3, #176]	; 0xb0
 800b2e6:	f8c3 00b4 	str.w	r0, [r3, #180]	; 0xb4
 800b2ea:	f8c3 00b8 	str.w	r0, [r3, #184]	; 0xb8
 800b2ee:	f8c3 00bc 	str.w	r0, [r3, #188]	; 0xbc
 800b2f2:	f8c3 00c0 	str.w	r0, [r3, #192]	; 0xc0
 800b2f6:	f8c3 00c4 	str.w	r0, [r3, #196]	; 0xc4
 800b2fa:	f8c3 00c8 	str.w	r0, [r3, #200]	; 0xc8
 800b2fe:	f8c3 00cc 	str.w	r0, [r3, #204]	; 0xcc
 800b302:	f8c3 00d0 	str.w	r0, [r3, #208]	; 0xd0
 800b306:	f8c3 00d4 	str.w	r0, [r3, #212]	; 0xd4
 800b30a:	f8c3 00d8 	str.w	r0, [r3, #216]	; 0xd8
 800b30e:	f8c3 00dc 	str.w	r0, [r3, #220]	; 0xdc
 800b312:	f8c3 00e0 	str.w	r0, [r3, #224]	; 0xe0
 800b316:	f8c3 00e4 	str.w	r0, [r3, #228]	; 0xe4
 800b31a:	f8c3 00e8 	str.w	r0, [r3, #232]	; 0xe8
 800b31e:	f8c3 00ec 	str.w	r0, [r3, #236]	; 0xec
 800b322:	f8c3 00f0 	str.w	r0, [r3, #240]	; 0xf0
 800b326:	f8c3 00f4 	str.w	r0, [r3, #244]	; 0xf4
 800b32a:	f8c3 00f8 	str.w	r0, [r3, #248]	; 0xf8
 800b32e:	f8c3 00fc 	str.w	r0, [r3, #252]	; 0xfc
 800b332:	f8c3 0100 	str.w	r0, [r3, #256]	; 0x100
 800b336:	f8c3 2104 	str.w	r2, [r3, #260]	; 0x104
 800b33a:	f8c3 0108 	str.w	r0, [r3, #264]	; 0x108
 800b33e:	f8c3 210c 	str.w	r2, [r3, #268]	; 0x10c
 800b342:	f8c3 0110 	str.w	r0, [r3, #272]	; 0x110
 800b346:	f8c3 2114 	str.w	r2, [r3, #276]	; 0x114
 800b34a:	f8c3 0118 	str.w	r0, [r3, #280]	; 0x118
 800b34e:	f8c3 211c 	str.w	r2, [r3, #284]	; 0x11c
 800b352:	f8c3 0120 	str.w	r0, [r3, #288]	; 0x120
 800b356:	f3bf 8f4f 	dsb	sy
 800b35a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800b35c:	f06f 0015 	mvn.w	r0, #21
 800b360:	4770      	bx	lr
 800b362:	bf00      	nop
 800b364:	20003c0c 	.word	0x20003c0c
 800b368:	0800f8ac 	.word	0x0800f8ac
 800b36c:	40023800 	.word	0x40023800
 800b370:	00170835 	.word	0x00170835

0800b374 <arch_lmb_reserve>:
 800b374:	f8d8 1000 	ldr.w	r1, [r8]
 800b378:	466b      	mov	r3, sp
 800b37a:	6949      	ldr	r1, [r1, #20]
 800b37c:	f5a3 6380 	sub.w	r3, r3, #1024	; 0x400
 800b380:	428b      	cmp	r3, r1
 800b382:	d30a      	bcc.n	800b39a <arch_lmb_reserve+0x26>
 800b384:	f8d8 1000 	ldr.w	r1, [r8]
 800b388:	b410      	push	{r4}
 800b38a:	f8d8 4000 	ldr.w	r4, [r8]
 800b38e:	6949      	ldr	r1, [r1, #20]
 800b390:	69a4      	ldr	r4, [r4, #24]
 800b392:	4421      	add	r1, r4
 800b394:	428b      	cmp	r3, r1
 800b396:	d301      	bcc.n	800b39c <arch_lmb_reserve+0x28>
 800b398:	bc10      	pop	{r4}
 800b39a:	4770      	bx	lr
 800b39c:	f8d8 4000 	ldr.w	r4, [r8]
 800b3a0:	f8d8 1000 	ldr.w	r1, [r8]
 800b3a4:	6962      	ldr	r2, [r4, #20]
 800b3a6:	698c      	ldr	r4, [r1, #24]
 800b3a8:	4619      	mov	r1, r3
 800b3aa:	4422      	add	r2, r4
 800b3ac:	1ad2      	subs	r2, r2, r3
 800b3ae:	bc10      	pop	{r4}
 800b3b0:	f7fc bf8c 	b.w	80082cc <lmb_reserve>

0800b3b4 <do_bootm_linux>:
 800b3b4:	e92d 46f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r9, sl, lr}
 800b3b8:	4607      	mov	r7, r0
 800b3ba:	f8d8 5000 	ldr.w	r5, [r8]
 800b3be:	4850      	ldr	r0, [pc, #320]	; (800b500 <do_bootm_linux+0x14c>)
 800b3c0:	4699      	mov	r9, r3
 800b3c2:	68ee      	ldr	r6, [r5, #12]
 800b3c4:	f7f9 fd86 	bl	8004ed4 <getenv>
 800b3c8:	f037 0780 	bics.w	r7, r7, #128	; 0x80
 800b3cc:	d002      	beq.n	800b3d4 <do_bootm_linux+0x20>
 800b3ce:	2001      	movs	r0, #1
 800b3d0:	e8bd 86f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r9, sl, pc}
 800b3d4:	4604      	mov	r4, r0
 800b3d6:	484b      	ldr	r0, [pc, #300]	; (800b504 <do_bootm_linux+0x150>)
 800b3d8:	f7f9 fd7c 	bl	8004ed4 <getenv>
 800b3dc:	b140      	cbz	r0, 800b3f0 <do_bootm_linux+0x3c>
 800b3de:	4639      	mov	r1, r7
 800b3e0:	2210      	movs	r2, #16
 800b3e2:	f7fd fa79 	bl	80088d8 <simple_strtoul>
 800b3e6:	4606      	mov	r6, r0
 800b3e8:	4601      	mov	r1, r0
 800b3ea:	4847      	ldr	r0, [pc, #284]	; (800b508 <do_bootm_linux+0x154>)
 800b3ec:	f7f9 ffb4 	bl	8005358 <printf>
 800b3f0:	200f      	movs	r0, #15
 800b3f2:	f7fb fc95 	bl	8006d20 <__show_boot_progress>
 800b3f6:	2300      	movs	r3, #0
 800b3f8:	2105      	movs	r1, #5
 800b3fa:	2204      	movs	r2, #4
 800b3fc:	f8d5 a010 	ldr.w	sl, [r5, #16]
 800b400:	f8d9 7060 	ldr.w	r7, [r9, #96]	; 0x60
 800b404:	f8ca 3008 	str.w	r3, [sl, #8]
 800b408:	f8ca 300c 	str.w	r3, [sl, #12]
 800b40c:	f8ca 3010 	str.w	r3, [sl, #16]
 800b410:	696b      	ldr	r3, [r5, #20]
 800b412:	f8df 911c 	ldr.w	r9, [pc, #284]	; 800b530 <do_bootm_linux+0x17c>
 800b416:	f8ca 3020 	str.w	r3, [sl, #32]
 800b41a:	4b3c      	ldr	r3, [pc, #240]	; (800b50c <do_bootm_linux+0x158>)
 800b41c:	f8ca 1000 	str.w	r1, [sl]
 800b420:	f8ca 3004 	str.w	r3, [sl, #4]
 800b424:	493a      	ldr	r1, [pc, #232]	; (800b510 <do_bootm_linux+0x15c>)
 800b426:	69ab      	ldr	r3, [r5, #24]
 800b428:	f8ca 2014 	str.w	r2, [sl, #20]
 800b42c:	f10a 0224 	add.w	r2, sl, #36	; 0x24
 800b430:	f8ca 1018 	str.w	r1, [sl, #24]
 800b434:	f8ca 301c 	str.w	r3, [sl, #28]
 800b438:	f8c9 2000 	str.w	r2, [r9]
 800b43c:	b144      	cbz	r4, 800b450 <do_bootm_linux+0x9c>
 800b43e:	f994 3000 	ldrsb.w	r3, [r4]
 800b442:	2b20      	cmp	r3, #32
 800b444:	d103      	bne.n	800b44e <do_bootm_linux+0x9a>
 800b446:	f914 3f01 	ldrsb.w	r3, [r4, #1]!
 800b44a:	2b20      	cmp	r3, #32
 800b44c:	d0fb      	beq.n	800b446 <do_bootm_linux+0x92>
 800b44e:	b9eb      	cbnz	r3, 800b48c <do_bootm_linux+0xd8>
 800b450:	f44f 1180 	mov.w	r1, #1048576	; 0x100000
 800b454:	f44f 2320 	mov.w	r3, #655360	; 0xa0000
 800b458:	2400      	movs	r4, #0
 800b45a:	2005      	movs	r0, #5
 800b45c:	60d1      	str	r1, [r2, #12]
 800b45e:	6113      	str	r3, [r2, #16]
 800b460:	492c      	ldr	r1, [pc, #176]	; (800b514 <do_bootm_linux+0x160>)
 800b462:	4b2d      	ldr	r3, [pc, #180]	; (800b518 <do_bootm_linux+0x164>)
 800b464:	6010      	str	r0, [r2, #0]
 800b466:	6093      	str	r3, [r2, #8]
 800b468:	6194      	str	r4, [r2, #24]
 800b46a:	6154      	str	r4, [r2, #20]
 800b46c:	6051      	str	r1, [r2, #4]
 800b46e:	482b      	ldr	r0, [pc, #172]	; (800b51c <do_bootm_linux+0x168>)
 800b470:	3214      	adds	r2, #20
 800b472:	f8c9 2000 	str.w	r2, [r9]
 800b476:	f7f9 ff6f 	bl	8005358 <printf>
 800b47a:	f7f5 fa3b 	bl	80008f4 <cleanup_before_linux>
 800b47e:	4620      	mov	r0, r4
 800b480:	692a      	ldr	r2, [r5, #16]
 800b482:	4631      	mov	r1, r6
 800b484:	47b8      	blx	r7
 800b486:	2001      	movs	r0, #1
 800b488:	e8bd 86f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r9, sl, pc}
 800b48c:	4b24      	ldr	r3, [pc, #144]	; (800b520 <do_bootm_linux+0x16c>)
 800b48e:	4620      	mov	r0, r4
 800b490:	f8ca 3028 	str.w	r3, [sl, #40]	; 0x28
 800b494:	f7f5 f80e 	bl	80004b4 <strlen>
 800b498:	f8d9 2000 	ldr.w	r2, [r9]
 800b49c:	300d      	adds	r0, #13
 800b49e:	0880      	lsrs	r0, r0, #2
 800b4a0:	f8ca 0024 	str.w	r0, [sl, #36]	; 0x24
 800b4a4:	4621      	mov	r1, r4
 800b4a6:	f102 0008 	add.w	r0, r2, #8
 800b4aa:	f7f4 ff69 	bl	8000380 <strcpy>
 800b4ae:	491d      	ldr	r1, [pc, #116]	; (800b524 <do_bootm_linux+0x170>)
 800b4b0:	4620      	mov	r0, r4
 800b4b2:	f7f5 f9c3 	bl	800083c <strstr>
 800b4b6:	b128      	cbz	r0, 800b4c4 <do_bootm_linux+0x110>
 800b4b8:	f8d9 2000 	ldr.w	r2, [r9]
 800b4bc:	6813      	ldr	r3, [r2, #0]
 800b4be:	eb02 0283 	add.w	r2, r2, r3, lsl #2
 800b4c2:	e7c5      	b.n	800b450 <do_bootm_linux+0x9c>
 800b4c4:	4818      	ldr	r0, [pc, #96]	; (800b528 <do_bootm_linux+0x174>)
 800b4c6:	f7f9 fd05 	bl	8004ed4 <getenv>
 800b4ca:	4682      	mov	sl, r0
 800b4cc:	2800      	cmp	r0, #0
 800b4ce:	d0f3      	beq.n	800b4b8 <do_bootm_linux+0x104>
 800b4d0:	f8d9 3000 	ldr.w	r3, [r9]
 800b4d4:	4620      	mov	r0, r4
 800b4d6:	f103 0408 	add.w	r4, r3, #8
 800b4da:	f7f4 ffeb 	bl	80004b4 <strlen>
 800b4de:	4652      	mov	r2, sl
 800b4e0:	4420      	add	r0, r4
 800b4e2:	4912      	ldr	r1, [pc, #72]	; (800b52c <do_bootm_linux+0x178>)
 800b4e4:	f7fd feee 	bl	80092c4 <sprintf>
 800b4e8:	f8d9 4000 	ldr.w	r4, [r9]
 800b4ec:	f104 0008 	add.w	r0, r4, #8
 800b4f0:	f7f4 ffe0 	bl	80004b4 <strlen>
 800b4f4:	f100 030d 	add.w	r3, r0, #13
 800b4f8:	089b      	lsrs	r3, r3, #2
 800b4fa:	6023      	str	r3, [r4, #0]
 800b4fc:	e7dc      	b.n	800b4b8 <do_bootm_linux+0x104>
 800b4fe:	bf00      	nop
 800b500:	0800cf68 	.word	0x0800cf68
 800b504:	0800f8f0 	.word	0x0800f8f0
 800b508:	0800f8f8 	.word	0x0800f8f8
 800b50c:	54410001 	.word	0x54410001
 800b510:	54410002 	.word	0x54410002
 800b514:	5441000a 	.word	0x5441000a
 800b518:	60700000 	.word	0x60700000
 800b51c:	0800f934 	.word	0x0800f934
 800b520:	54410009 	.word	0x54410009
 800b524:	0800f91c 	.word	0x0800f91c
 800b528:	0800c7b8 	.word	0x0800c7b8
 800b52c:	0800f928 	.word	0x0800f928
 800b530:	20003c10 	.word	0x20003c10

0800b534 <flush_cache>:
 800b534:	4770      	bx	lr
 800b536:	bf00      	nop

0800b538 <do_reset>:
 800b538:	b508      	push	{r3, lr}
 800b53a:	4807      	ldr	r0, [pc, #28]	; (800b558 <do_reset+0x20>)
 800b53c:	f7f9 ff00 	bl	8005340 <puts>
 800b540:	f24c 3050 	movw	r0, #50000	; 0xc350
 800b544:	f7fc ffa0 	bl	8008488 <udelay>
 800b548:	f7f5 fd22 	bl	8000f90 <disable_interrupts>
 800b54c:	2000      	movs	r0, #0
 800b54e:	4b03      	ldr	r3, [pc, #12]	; (800b55c <do_reset+0x24>)
 800b550:	4798      	blx	r3
 800b552:	2000      	movs	r0, #0
 800b554:	bd08      	pop	{r3, pc}
 800b556:	bf00      	nop
 800b558:	0800f94c 	.word	0x0800f94c
 800b55c:	20000add 	.word	0x20000add

0800b560 <stm32f2_gpio_config>:
 800b560:	e92d 42f0 	stmdb	sp!, {r4, r5, r6, r7, r9, lr}
 800b564:	b300      	cbz	r0, 800b5a8 <stm32f2_gpio_config+0x48>
 800b566:	7802      	ldrb	r2, [r0, #0]
 800b568:	2a0a      	cmp	r2, #10
 800b56a:	d80d      	bhi.n	800b588 <stm32f2_gpio_config+0x28>
 800b56c:	7844      	ldrb	r4, [r0, #1]
 800b56e:	2c0f      	cmp	r4, #15
 800b570:	d80a      	bhi.n	800b588 <stm32f2_gpio_config+0x28>
 800b572:	290b      	cmp	r1, #11
 800b574:	f200 8095 	bhi.w	800b6a2 <stm32f2_gpio_config+0x142>
 800b578:	e8df f001 	tbb	[pc, r1]
 800b57c:	50505050 	.word	0x50505050
 800b580:	7f7f5050 	.word	0x7f7f5050
 800b584:	7f1e7f83 	.word	0x7f1e7f83
 800b588:	f8d8 300c 	ldr.w	r3, [r8, #12]
 800b58c:	b143      	cbz	r3, 800b5a0 <stm32f2_gpio_config+0x40>
 800b58e:	7843      	ldrb	r3, [r0, #1]
 800b590:	494c      	ldr	r1, [pc, #304]	; (800b6c4 <stm32f2_gpio_config+0x164>)
 800b592:	484d      	ldr	r0, [pc, #308]	; (800b6c8 <stm32f2_gpio_config+0x168>)
 800b594:	f7f9 fee0 	bl	8005358 <printf>
 800b598:	f06f 0015 	mvn.w	r0, #21
 800b59c:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 800b5a0:	f06f 0015 	mvn.w	r0, #21
 800b5a4:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 800b5a8:	f8d8 300c 	ldr.w	r3, [r8, #12]
 800b5ac:	2b00      	cmp	r3, #0
 800b5ae:	d0f7      	beq.n	800b5a0 <stm32f2_gpio_config+0x40>
 800b5b0:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 800b5b4:	4613      	mov	r3, r2
 800b5b6:	e7eb      	b.n	800b590 <stm32f2_gpio_config+0x30>
 800b5b8:	2101      	movs	r1, #1
 800b5ba:	4d44      	ldr	r5, [pc, #272]	; (800b6cc <stm32f2_gpio_config+0x16c>)
 800b5bc:	fa01 f002 	lsl.w	r0, r1, r2
 800b5c0:	6b2e      	ldr	r6, [r5, #48]	; 0x30
 800b5c2:	4b40      	ldr	r3, [pc, #256]	; (800b6c4 <stm32f2_gpio_config+0x164>)
 800b5c4:	4330      	orrs	r0, r6
 800b5c6:	6328      	str	r0, [r5, #48]	; 0x30
 800b5c8:	2500      	movs	r5, #0
 800b5ca:	2002      	movs	r0, #2
 800b5cc:	eb03 0282 	add.w	r2, r3, r2, lsl #2
 800b5d0:	6952      	ldr	r2, [r2, #20]
 800b5d2:	fa04 f601 	lsl.w	r6, r4, r1
 800b5d6:	2303      	movs	r3, #3
 800b5d8:	2701      	movs	r7, #1
 800b5da:	40b3      	lsls	r3, r6
 800b5dc:	43db      	mvns	r3, r3
 800b5de:	40a7      	lsls	r7, r4
 800b5e0:	6854      	ldr	r4, [r2, #4]
 800b5e2:	40b1      	lsls	r1, r6
 800b5e4:	ea24 0407 	bic.w	r4, r4, r7
 800b5e8:	6054      	str	r4, [r2, #4]
 800b5ea:	6854      	ldr	r4, [r2, #4]
 800b5ec:	fa00 f606 	lsl.w	r6, r0, r6
 800b5f0:	6054      	str	r4, [r2, #4]
 800b5f2:	6814      	ldr	r4, [r2, #0]
 800b5f4:	2000      	movs	r0, #0
 800b5f6:	401c      	ands	r4, r3
 800b5f8:	6014      	str	r4, [r2, #0]
 800b5fa:	6814      	ldr	r4, [r2, #0]
 800b5fc:	4321      	orrs	r1, r4
 800b5fe:	6011      	str	r1, [r2, #0]
 800b600:	6891      	ldr	r1, [r2, #8]
 800b602:	4019      	ands	r1, r3
 800b604:	6091      	str	r1, [r2, #8]
 800b606:	6891      	ldr	r1, [r2, #8]
 800b608:	430e      	orrs	r6, r1
 800b60a:	6096      	str	r6, [r2, #8]
 800b60c:	68d1      	ldr	r1, [r2, #12]
 800b60e:	400b      	ands	r3, r1
 800b610:	60d3      	str	r3, [r2, #12]
 800b612:	68d3      	ldr	r3, [r2, #12]
 800b614:	431d      	orrs	r5, r3
 800b616:	60d5      	str	r5, [r2, #12]
 800b618:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 800b61c:	2501      	movs	r5, #1
 800b61e:	2002      	movs	r0, #2
 800b620:	fa04 f605 	lsl.w	r6, r4, r5
 800b624:	40b5      	lsls	r5, r6
 800b626:	2701      	movs	r7, #1
 800b628:	4b26      	ldr	r3, [pc, #152]	; (800b6c4 <stm32f2_gpio_config+0x164>)
 800b62a:	f8df c0a0 	ldr.w	ip, [pc, #160]	; 800b6cc <stm32f2_gpio_config+0x16c>
 800b62e:	eb03 0181 	add.w	r1, r3, r1, lsl #2
 800b632:	f8dc 9030 	ldr.w	r9, [ip, #48]	; 0x30
 800b636:	f8d1 e040 	ldr.w	lr, [r1, #64]	; 0x40
 800b63a:	4097      	lsls	r7, r2
 800b63c:	ea47 0709 	orr.w	r7, r7, r9
 800b640:	eb03 0282 	add.w	r2, r3, r2, lsl #2
 800b644:	f1be 3fff 	cmp.w	lr, #4294967295	; 0xffffffff
 800b648:	f8cc 7030 	str.w	r7, [ip, #48]	; 0x30
 800b64c:	6952      	ldr	r2, [r2, #20]
 800b64e:	d036      	beq.n	800b6be <stm32f2_gpio_config+0x15e>
 800b650:	f04f 0c0f 	mov.w	ip, #15
 800b654:	08e1      	lsrs	r1, r4, #3
 800b656:	eb02 0181 	add.w	r1, r2, r1, lsl #2
 800b65a:	f004 0307 	and.w	r3, r4, #7
 800b65e:	6a0f      	ldr	r7, [r1, #32]
 800b660:	009b      	lsls	r3, r3, #2
 800b662:	fa0c fc03 	lsl.w	ip, ip, r3
 800b666:	ea27 070c 	bic.w	r7, r7, ip
 800b66a:	620f      	str	r7, [r1, #32]
 800b66c:	6a0f      	ldr	r7, [r1, #32]
 800b66e:	fa0e f303 	lsl.w	r3, lr, r3
 800b672:	433b      	orrs	r3, r7
 800b674:	620b      	str	r3, [r1, #32]
 800b676:	2102      	movs	r1, #2
 800b678:	e7ad      	b.n	800b5d6 <stm32f2_gpio_config+0x76>
 800b67a:	0066      	lsls	r6, r4, #1
 800b67c:	2500      	movs	r5, #0
 800b67e:	2003      	movs	r0, #3
 800b680:	e7d1      	b.n	800b626 <stm32f2_gpio_config+0xc6>
 800b682:	2301      	movs	r3, #1
 800b684:	4811      	ldr	r0, [pc, #68]	; (800b6cc <stm32f2_gpio_config+0x16c>)
 800b686:	490f      	ldr	r1, [pc, #60]	; (800b6c4 <stm32f2_gpio_config+0x164>)
 800b688:	6b05      	ldr	r5, [r0, #48]	; 0x30
 800b68a:	4093      	lsls	r3, r2
 800b68c:	432b      	orrs	r3, r5
 800b68e:	eb01 0282 	add.w	r2, r1, r2, lsl #2
 800b692:	6303      	str	r3, [r0, #48]	; 0x30
 800b694:	6952      	ldr	r2, [r2, #20]
 800b696:	0066      	lsls	r6, r4, #1
 800b698:	2500      	movs	r5, #0
 800b69a:	f04f 0e0e 	mov.w	lr, #14
 800b69e:	2002      	movs	r0, #2
 800b6a0:	e7d6      	b.n	800b650 <stm32f2_gpio_config+0xf0>
 800b6a2:	f8d8 300c 	ldr.w	r3, [r8, #12]
 800b6a6:	2b00      	cmp	r3, #0
 800b6a8:	f43f af7a 	beq.w	800b5a0 <stm32f2_gpio_config+0x40>
 800b6ac:	460a      	mov	r2, r1
 800b6ae:	4808      	ldr	r0, [pc, #32]	; (800b6d0 <stm32f2_gpio_config+0x170>)
 800b6b0:	4904      	ldr	r1, [pc, #16]	; (800b6c4 <stm32f2_gpio_config+0x164>)
 800b6b2:	f7f9 fe51 	bl	8005358 <printf>
 800b6b6:	f06f 0015 	mvn.w	r0, #21
 800b6ba:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
 800b6be:	2102      	movs	r1, #2
 800b6c0:	e789      	b.n	800b5d6 <stm32f2_gpio_config+0x76>
 800b6c2:	bf00      	nop
 800b6c4:	0800f95c 	.word	0x0800f95c
 800b6c8:	0800f9e0 	.word	0x0800f9e0
 800b6cc:	40023800 	.word	0x40023800
 800b6d0:	0800fa00 	.word	0x0800fa00

0800b6d4 <stm32f2_gpout_set>:
 800b6d4:	b510      	push	{r4, lr}
 800b6d6:	b320      	cbz	r0, 800b722 <stm32f2_gpout_set+0x4e>
 800b6d8:	7802      	ldrb	r2, [r0, #0]
 800b6da:	2a0a      	cmp	r2, #10
 800b6dc:	d80e      	bhi.n	800b6fc <stm32f2_gpout_set+0x28>
 800b6de:	7843      	ldrb	r3, [r0, #1]
 800b6e0:	2b0f      	cmp	r3, #15
 800b6e2:	d80b      	bhi.n	800b6fc <stm32f2_gpout_set+0x28>
 800b6e4:	4813      	ldr	r0, [pc, #76]	; (800b734 <stm32f2_gpout_set+0x60>)
 800b6e6:	eb00 0282 	add.w	r2, r0, r2, lsl #2
 800b6ea:	6954      	ldr	r4, [r2, #20]
 800b6ec:	2201      	movs	r2, #1
 800b6ee:	b999      	cbnz	r1, 800b718 <stm32f2_gpout_set+0x44>
 800b6f0:	3310      	adds	r3, #16
 800b6f2:	fa02 f303 	lsl.w	r3, r2, r3
 800b6f6:	4608      	mov	r0, r1
 800b6f8:	61a3      	str	r3, [r4, #24]
 800b6fa:	bd10      	pop	{r4, pc}
 800b6fc:	f8d8 300c 	ldr.w	r3, [r8, #12]
 800b700:	b13b      	cbz	r3, 800b712 <stm32f2_gpout_set+0x3e>
 800b702:	7843      	ldrb	r3, [r0, #1]
 800b704:	490c      	ldr	r1, [pc, #48]	; (800b738 <stm32f2_gpout_set+0x64>)
 800b706:	480d      	ldr	r0, [pc, #52]	; (800b73c <stm32f2_gpout_set+0x68>)
 800b708:	f7f9 fe26 	bl	8005358 <printf>
 800b70c:	f06f 0015 	mvn.w	r0, #21
 800b710:	bd10      	pop	{r4, pc}
 800b712:	f06f 0015 	mvn.w	r0, #21
 800b716:	bd10      	pop	{r4, pc}
 800b718:	fa02 f303 	lsl.w	r3, r2, r3
 800b71c:	61a3      	str	r3, [r4, #24]
 800b71e:	2000      	movs	r0, #0
 800b720:	bd10      	pop	{r4, pc}
 800b722:	f8d8 300c 	ldr.w	r3, [r8, #12]
 800b726:	2b00      	cmp	r3, #0
 800b728:	d0f3      	beq.n	800b712 <stm32f2_gpout_set+0x3e>
 800b72a:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 800b72e:	4613      	mov	r3, r2
 800b730:	e7e8      	b.n	800b704 <stm32f2_gpout_set+0x30>
 800b732:	bf00      	nop
 800b734:	0800f95c 	.word	0x0800f95c
 800b738:	0800f9cc 	.word	0x0800f9cc
 800b73c:	0800f9e0 	.word	0x0800f9e0

0800b740 <stm_eth_halt>:
 800b740:	f241 0118 	movw	r1, #4120	; 0x1018
 800b744:	4a05      	ldr	r2, [pc, #20]	; (800b75c <stm_eth_halt+0x1c>)
 800b746:	5853      	ldr	r3, [r2, r1]
 800b748:	f423 5300 	bic.w	r3, r3, #8192	; 0x2000
 800b74c:	f023 0302 	bic.w	r3, r3, #2
 800b750:	5053      	str	r3, [r2, r1]
 800b752:	6813      	ldr	r3, [r2, #0]
 800b754:	f023 030c 	bic.w	r3, r3, #12
 800b758:	6013      	str	r3, [r2, #0]
 800b75a:	4770      	bx	lr
 800b75c:	40028000 	.word	0x40028000

0800b760 <stm_eth_recv>:
 800b760:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 800b764:	4682      	mov	sl, r0
 800b766:	4e23      	ldr	r6, [pc, #140]	; (800b7f4 <stm_eth_recv+0x94>)
 800b768:	4f23      	ldr	r7, [pc, #140]	; (800b7f8 <stm_eth_recv+0x98>)
 800b76a:	4c24      	ldr	r4, [pc, #144]	; (800b7fc <stm_eth_recv+0x9c>)
 800b76c:	f04f 4500 	mov.w	r5, #2147483648	; 0x80000000
 800b770:	f8da 3090 	ldr.w	r3, [sl, #144]	; 0x90
 800b774:	e027      	b.n	800b7c6 <stm_eth_recv+0x66>
 800b776:	f8d9 2050 	ldr.w	r2, [r9, #80]	; 0x50
 800b77a:	f402 7240 	and.w	r2, r2, #768	; 0x300
 800b77e:	f5b2 7f40 	cmp.w	r2, #768	; 0x300
 800b782:	d005      	beq.n	800b790 <stm_eth_recv+0x30>
 800b784:	f8d9 2050 	ldr.w	r2, [r9, #80]	; 0x50
 800b788:	4631      	mov	r1, r6
 800b78a:	4638      	mov	r0, r7
 800b78c:	f7f9 fde4 	bl	8005358 <printf>
 800b790:	f8d9 1050 	ldr.w	r1, [r9, #80]	; 0x50
 800b794:	44d3      	add	fp, sl
 800b796:	f3c1 410d 	ubfx	r1, r1, #16, #14
 800b79a:	f8db 0058 	ldr.w	r0, [fp, #88]	; 0x58
 800b79e:	3904      	subs	r1, #4
 800b7a0:	f7f6 f8e2 	bl	8001968 <NetReceive>
 800b7a4:	f8c9 5050 	str.w	r5, [r9, #80]	; 0x50
 800b7a8:	f8da 3090 	ldr.w	r3, [sl, #144]	; 0x90
 800b7ac:	3301      	adds	r3, #1
 800b7ae:	425a      	negs	r2, r3
 800b7b0:	f002 0203 	and.w	r2, r2, #3
 800b7b4:	f003 0303 	and.w	r3, r3, #3
 800b7b8:	bf58      	it	pl
 800b7ba:	4253      	negpl	r3, r2
 800b7bc:	f8ca 3090 	str.w	r3, [sl, #144]	; 0x90
 800b7c0:	6822      	ldr	r2, [r4, #0]
 800b7c2:	0612      	lsls	r2, r2, #24
 800b7c4:	d40a      	bmi.n	800b7dc <stm_eth_recv+0x7c>
 800b7c6:	ea4f 1b03 	mov.w	fp, r3, lsl #4
 800b7ca:	eb0a 090b 	add.w	r9, sl, fp
 800b7ce:	f8d9 2050 	ldr.w	r2, [r9, #80]	; 0x50
 800b7d2:	2a00      	cmp	r2, #0
 800b7d4:	dacf      	bge.n	800b776 <stm_eth_recv+0x16>
 800b7d6:	2000      	movs	r0, #0
 800b7d8:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 800b7dc:	4631      	mov	r1, r6
 800b7de:	4808      	ldr	r0, [pc, #32]	; (800b800 <stm_eth_recv+0xa0>)
 800b7e0:	f7f9 fdba 	bl	8005358 <printf>
 800b7e4:	2200      	movs	r2, #0
 800b7e6:	6823      	ldr	r3, [r4, #0]
 800b7e8:	f023 0380 	bic.w	r3, r3, #128	; 0x80
 800b7ec:	6023      	str	r3, [r4, #0]
 800b7ee:	4b05      	ldr	r3, [pc, #20]	; (800b804 <stm_eth_recv+0xa4>)
 800b7f0:	601a      	str	r2, [r3, #0]
 800b7f2:	e7bb      	b.n	800b76c <stm_eth_recv+0xc>
 800b7f4:	0800fa18 	.word	0x0800fa18
 800b7f8:	0800fa7c 	.word	0x0800fa7c
 800b7fc:	40029014 	.word	0x40029014
 800b800:	0800faa0 	.word	0x0800faa0
 800b804:	40029008 	.word	0x40029008

0800b808 <stm_eth_send>:
 800b808:	f5b2 6fc0 	cmp.w	r2, #1536	; 0x600
 800b80c:	b538      	push	{r3, r4, r5, lr}
 800b80e:	dc31      	bgt.n	800b874 <stm_eth_send+0x6c>
 800b810:	4613      	mov	r3, r2
 800b812:	6c02      	ldr	r2, [r0, #64]	; 0x40
 800b814:	4604      	mov	r4, r0
 800b816:	2a00      	cmp	r2, #0
 800b818:	db33      	blt.n	800b882 <stm_eth_send+0x7a>
 800b81a:	f241 0014 	movw	r0, #4116	; 0x1014
 800b81e:	64a1      	str	r1, [r4, #72]	; 0x48
 800b820:	6463      	str	r3, [r4, #68]	; 0x44
 800b822:	6c23      	ldr	r3, [r4, #64]	; 0x40
 800b824:	4a1a      	ldr	r2, [pc, #104]	; (800b890 <stm_eth_send+0x88>)
 800b826:	f043 4330 	orr.w	r3, r3, #2952790016	; 0xb0000000
 800b82a:	6423      	str	r3, [r4, #64]	; 0x40
 800b82c:	5813      	ldr	r3, [r2, r0]
 800b82e:	075b      	lsls	r3, r3, #29
 800b830:	d417      	bmi.n	800b862 <stm_eth_send+0x5a>
 800b832:	6c23      	ldr	r3, [r4, #64]	; 0x40
 800b834:	2b00      	cmp	r3, #0
 800b836:	db01      	blt.n	800b83c <stm_eth_send+0x34>
 800b838:	2000      	movs	r0, #0
 800b83a:	bd38      	pop	{r3, r4, r5, pc}
 800b83c:	2001      	movs	r0, #1
 800b83e:	f7fc fe23 	bl	8008488 <udelay>
 800b842:	4d14      	ldr	r5, [pc, #80]	; (800b894 <stm_eth_send+0x8c>)
 800b844:	6c23      	ldr	r3, [r4, #64]	; 0x40
 800b846:	2b00      	cmp	r3, #0
 800b848:	daf6      	bge.n	800b838 <stm_eth_send+0x30>
 800b84a:	2001      	movs	r0, #1
 800b84c:	f7fc fe1c 	bl	8008488 <udelay>
 800b850:	3d01      	subs	r5, #1
 800b852:	d1f7      	bne.n	800b844 <stm_eth_send+0x3c>
 800b854:	4910      	ldr	r1, [pc, #64]	; (800b898 <stm_eth_send+0x90>)
 800b856:	4811      	ldr	r0, [pc, #68]	; (800b89c <stm_eth_send+0x94>)
 800b858:	f7f9 fd7e 	bl	8005358 <printf>
 800b85c:	f06f 006d 	mvn.w	r0, #109	; 0x6d
 800b860:	bd38      	pop	{r3, r4, r5, pc}
 800b862:	f241 0104 	movw	r1, #4100	; 0x1004
 800b866:	2500      	movs	r5, #0
 800b868:	5813      	ldr	r3, [r2, r0]
 800b86a:	f023 0304 	bic.w	r3, r3, #4
 800b86e:	5013      	str	r3, [r2, r0]
 800b870:	5055      	str	r5, [r2, r1]
 800b872:	e7de      	b.n	800b832 <stm_eth_send+0x2a>
 800b874:	4908      	ldr	r1, [pc, #32]	; (800b898 <stm_eth_send+0x90>)
 800b876:	480a      	ldr	r0, [pc, #40]	; (800b8a0 <stm_eth_send+0x98>)
 800b878:	f7f9 fd6e 	bl	8005358 <printf>
 800b87c:	f06f 0015 	mvn.w	r0, #21
 800b880:	bd38      	pop	{r3, r4, r5, pc}
 800b882:	4905      	ldr	r1, [pc, #20]	; (800b898 <stm_eth_send+0x90>)
 800b884:	4807      	ldr	r0, [pc, #28]	; (800b8a4 <stm_eth_send+0x9c>)
 800b886:	f7f9 fd67 	bl	8005358 <printf>
 800b88a:	f06f 000f 	mvn.w	r0, #15
 800b88e:	bd38      	pop	{r3, r4, r5, pc}
 800b890:	40028000 	.word	0x40028000
 800b894:	000f423f 	.word	0x000f423f
 800b898:	0800fa28 	.word	0x0800fa28
 800b89c:	0800fadc 	.word	0x0800fadc
 800b8a0:	0800fab4 	.word	0x0800fab4
 800b8a4:	0800fad0 	.word	0x0800fad0

0800b8a8 <stm_phy_wait_busy.constprop.4>:
 800b8a8:	b538      	push	{r3, r4, r5, lr}
 800b8aa:	4d0d      	ldr	r5, [pc, #52]	; (800b8e0 <stm_phy_wait_busy.constprop.4+0x38>)
 800b8ac:	692b      	ldr	r3, [r5, #16]
 800b8ae:	07da      	lsls	r2, r3, #31
 800b8b0:	d513      	bpl.n	800b8da <stm_phy_wait_busy.constprop.4+0x32>
 800b8b2:	2064      	movs	r0, #100	; 0x64
 800b8b4:	f7fc fde8 	bl	8008488 <udelay>
 800b8b8:	f640 14c3 	movw	r4, #2499	; 0x9c3
 800b8bc:	692b      	ldr	r3, [r5, #16]
 800b8be:	07db      	lsls	r3, r3, #31
 800b8c0:	d50b      	bpl.n	800b8da <stm_phy_wait_busy.constprop.4+0x32>
 800b8c2:	2064      	movs	r0, #100	; 0x64
 800b8c4:	f7fc fde0 	bl	8008488 <udelay>
 800b8c8:	3c01      	subs	r4, #1
 800b8ca:	d1f7      	bne.n	800b8bc <stm_phy_wait_busy.constprop.4+0x14>
 800b8cc:	4905      	ldr	r1, [pc, #20]	; (800b8e4 <stm_phy_wait_busy.constprop.4+0x3c>)
 800b8ce:	4806      	ldr	r0, [pc, #24]	; (800b8e8 <stm_phy_wait_busy.constprop.4+0x40>)
 800b8d0:	f7f9 fd42 	bl	8005358 <printf>
 800b8d4:	f06f 006d 	mvn.w	r0, #109	; 0x6d
 800b8d8:	bd38      	pop	{r3, r4, r5, pc}
 800b8da:	2000      	movs	r0, #0
 800b8dc:	bd38      	pop	{r3, r4, r5, pc}
 800b8de:	bf00      	nop
 800b8e0:	40028000 	.word	0x40028000
 800b8e4:	0800fa38 	.word	0x0800fa38
 800b8e8:	0800faec 	.word	0x0800faec

0800b8ec <stm_phy_read>:
 800b8ec:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800b8ee:	460e      	mov	r6, r1
 800b8f0:	4615      	mov	r5, r2
 800b8f2:	8f84      	ldrh	r4, [r0, #60]	; 0x3c
 800b8f4:	f7ff ffd8 	bl	800b8a8 <stm_phy_wait_busy.constprop.4>
 800b8f8:	b9a0      	cbnz	r0, 800b924 <stm_phy_read+0x38>
 800b8fa:	4f0d      	ldr	r7, [pc, #52]	; (800b930 <stm_phy_read+0x44>)
 800b8fc:	f006 061f 	and.w	r6, r6, #31
 800b900:	6939      	ldr	r1, [r7, #16]
 800b902:	f004 041f 	and.w	r4, r4, #31
 800b906:	f001 011c 	and.w	r1, r1, #28
 800b90a:	f041 0101 	orr.w	r1, r1, #1
 800b90e:	ea41 1186 	orr.w	r1, r1, r6, lsl #6
 800b912:	ea41 21c4 	orr.w	r1, r1, r4, lsl #11
 800b916:	6139      	str	r1, [r7, #16]
 800b918:	f7ff ffc6 	bl	800b8a8 <stm_phy_wait_busy.constprop.4>
 800b91c:	b928      	cbnz	r0, 800b92a <stm_phy_read+0x3e>
 800b91e:	697b      	ldr	r3, [r7, #20]
 800b920:	802b      	strh	r3, [r5, #0]
 800b922:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800b924:	f06f 000f 	mvn.w	r0, #15
 800b928:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800b92a:	f06f 006d 	mvn.w	r0, #109	; 0x6d
 800b92e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800b930:	40028000 	.word	0x40028000

0800b934 <stm_phy_link_get>:
 800b934:	b5f0      	push	{r4, r5, r6, r7, lr}
 800b936:	b083      	sub	sp, #12
 800b938:	460c      	mov	r4, r1
 800b93a:	4617      	mov	r7, r2
 800b93c:	2101      	movs	r1, #1
 800b93e:	f10d 0206 	add.w	r2, sp, #6
 800b942:	461e      	mov	r6, r3
 800b944:	4605      	mov	r5, r0
 800b946:	f7ff ffd1 	bl	800b8ec <stm_phy_read>
 800b94a:	b108      	cbz	r0, 800b950 <stm_phy_link_get+0x1c>
 800b94c:	b003      	add	sp, #12
 800b94e:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800b950:	f8bd 3006 	ldrh.w	r3, [sp, #6]
 800b954:	4601      	mov	r1, r0
 800b956:	f3c3 0380 	ubfx	r3, r3, #2, #1
 800b95a:	f10d 0206 	add.w	r2, sp, #6
 800b95e:	4628      	mov	r0, r5
 800b960:	6023      	str	r3, [r4, #0]
 800b962:	f7ff ffc3 	bl	800b8ec <stm_phy_read>
 800b966:	2800      	cmp	r0, #0
 800b968:	d1f0      	bne.n	800b94c <stm_phy_link_get+0x18>
 800b96a:	f8bd 3006 	ldrh.w	r3, [sp, #6]
 800b96e:	f413 4fc0 	tst.w	r3, #24576	; 0x6000
 800b972:	bf14      	ite	ne
 800b974:	2264      	movne	r2, #100	; 0x64
 800b976:	220a      	moveq	r2, #10
 800b978:	f3c3 2300 	ubfx	r3, r3, #8, #1
 800b97c:	603b      	str	r3, [r7, #0]
 800b97e:	6032      	str	r2, [r6, #0]
 800b980:	b003      	add	sp, #12
 800b982:	bdf0      	pop	{r4, r5, r6, r7, pc}

0800b984 <stm_eth_init>:
 800b984:	e92d 4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
 800b988:	4fb3      	ldr	r7, [pc, #716]	; (800bc58 <stm_eth_init+0x2d4>)
 800b98a:	b084      	sub	sp, #16
 800b98c:	683b      	ldr	r3, [r7, #0]
 800b98e:	4606      	mov	r6, r0
 800b990:	b96b      	cbnz	r3, 800b9ae <stm_eth_init+0x2a>
 800b992:	4db2      	ldr	r5, [pc, #712]	; (800bc5c <stm_eth_init+0x2d8>)
 800b994:	f105 0912 	add.w	r9, r5, #18
 800b998:	4628      	mov	r0, r5
 800b99a:	2106      	movs	r1, #6
 800b99c:	f7ff fde0 	bl	800b560 <stm32f2_gpio_config>
 800b9a0:	3502      	adds	r5, #2
 800b9a2:	4604      	mov	r4, r0
 800b9a4:	bb58      	cbnz	r0, 800b9fe <stm_eth_init+0x7a>
 800b9a6:	454d      	cmp	r5, r9
 800b9a8:	d1f6      	bne.n	800b998 <stm_eth_init+0x14>
 800b9aa:	2301      	movs	r3, #1
 800b9ac:	603b      	str	r3, [r7, #0]
 800b9ae:	4bac      	ldr	r3, [pc, #688]	; (800bc60 <stm_eth_init+0x2dc>)
 800b9b0:	4dac      	ldr	r5, [pc, #688]	; (800bc64 <stm_eth_init+0x2e0>)
 800b9b2:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 800b9b4:	f042 6260 	orr.w	r2, r2, #234881024	; 0xe000000
 800b9b8:	631a      	str	r2, [r3, #48]	; 0x30
 800b9ba:	691a      	ldr	r2, [r3, #16]
 800b9bc:	f042 7200 	orr.w	r2, r2, #33554432	; 0x2000000
 800b9c0:	611a      	str	r2, [r3, #16]
 800b9c2:	691a      	ldr	r2, [r3, #16]
 800b9c4:	f022 7200 	bic.w	r2, r2, #33554432	; 0x2000000
 800b9c8:	611a      	str	r2, [r3, #16]
 800b9ca:	682b      	ldr	r3, [r5, #0]
 800b9cc:	f043 0301 	orr.w	r3, r3, #1
 800b9d0:	602b      	str	r3, [r5, #0]
 800b9d2:	682b      	ldr	r3, [r5, #0]
 800b9d4:	07db      	lsls	r3, r3, #31
 800b9d6:	d51b      	bpl.n	800ba10 <stm_eth_init+0x8c>
 800b9d8:	2064      	movs	r0, #100	; 0x64
 800b9da:	f7fc fd55 	bl	8008488 <udelay>
 800b9de:	f644 641f 	movw	r4, #19999	; 0x4e1f
 800b9e2:	682b      	ldr	r3, [r5, #0]
 800b9e4:	07da      	lsls	r2, r3, #31
 800b9e6:	d513      	bpl.n	800ba10 <stm_eth_init+0x8c>
 800b9e8:	2064      	movs	r0, #100	; 0x64
 800b9ea:	f7fc fd4d 	bl	8008488 <udelay>
 800b9ee:	3c01      	subs	r4, #1
 800b9f0:	d1f7      	bne.n	800b9e2 <stm_eth_init+0x5e>
 800b9f2:	499d      	ldr	r1, [pc, #628]	; (800bc68 <stm_eth_init+0x2e4>)
 800b9f4:	489d      	ldr	r0, [pc, #628]	; (800bc6c <stm_eth_init+0x2e8>)
 800b9f6:	f7f9 fcaf 	bl	8005358 <printf>
 800b9fa:	f06f 040f 	mvn.w	r4, #15
 800b9fe:	4622      	mov	r2, r4
 800ba00:	499b      	ldr	r1, [pc, #620]	; (800bc70 <stm_eth_init+0x2ec>)
 800ba02:	489c      	ldr	r0, [pc, #624]	; (800bc74 <stm_eth_init+0x2f0>)
 800ba04:	f7f9 fca8 	bl	8005358 <printf>
 800ba08:	4620      	mov	r0, r4
 800ba0a:	b004      	add	sp, #16
 800ba0c:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 800ba10:	4a99      	ldr	r2, [pc, #612]	; (800bc78 <stm_eth_init+0x2f4>)
 800ba12:	4b94      	ldr	r3, [pc, #592]	; (800bc64 <stm_eth_init+0x2e0>)
 800ba14:	2001      	movs	r0, #1
 800ba16:	601a      	str	r2, [r3, #0]
 800ba18:	4b98      	ldr	r3, [pc, #608]	; (800bc7c <stm_eth_init+0x2f8>)
 800ba1a:	4798      	blx	r3
 800ba1c:	4b98      	ldr	r3, [pc, #608]	; (800bc80 <stm_eth_init+0x2fc>)
 800ba1e:	4a99      	ldr	r2, [pc, #612]	; (800bc84 <stm_eth_init+0x300>)
 800ba20:	4403      	add	r3, r0
 800ba22:	4293      	cmp	r3, r2
 800ba24:	d907      	bls.n	800ba36 <stm_eth_init+0xb2>
 800ba26:	4b98      	ldr	r3, [pc, #608]	; (800bc88 <stm_eth_init+0x304>)
 800ba28:	4a98      	ldr	r2, [pc, #608]	; (800bc8c <stm_eth_init+0x308>)
 800ba2a:	4403      	add	r3, r0
 800ba2c:	4293      	cmp	r3, r2
 800ba2e:	f200 808e 	bhi.w	800bb4e <stm_eth_init+0x1ca>
 800ba32:	240c      	movs	r4, #12
 800ba34:	e000      	b.n	800ba38 <stm_eth_init+0xb4>
 800ba36:	2408      	movs	r4, #8
 800ba38:	f7ff ff36 	bl	800b8a8 <stm_phy_wait_busy.constprop.4>
 800ba3c:	4605      	mov	r5, r0
 800ba3e:	2800      	cmp	r0, #0
 800ba40:	f040 80c6 	bne.w	800bbd0 <stm_eth_init+0x24c>
 800ba44:	4b92      	ldr	r3, [pc, #584]	; (800bc90 <stm_eth_init+0x30c>)
 800ba46:	611c      	str	r4, [r3, #16]
 800ba48:	6bb3      	ldr	r3, [r6, #56]	; 0x38
 800ba4a:	2bff      	cmp	r3, #255	; 0xff
 800ba4c:	f000 8093 	beq.w	800bb76 <stm_eth_init+0x1f2>
 800ba50:	f10d 090c 	add.w	r9, sp, #12
 800ba54:	aa02      	add	r2, sp, #8
 800ba56:	a901      	add	r1, sp, #4
 800ba58:	464b      	mov	r3, r9
 800ba5a:	4630      	mov	r0, r6
 800ba5c:	f7ff ff6a 	bl	800b934 <stm_phy_link_get>
 800ba60:	4604      	mov	r4, r0
 800ba62:	2800      	cmp	r0, #0
 800ba64:	d1cb      	bne.n	800b9fe <stm_eth_init+0x7a>
 800ba66:	9b01      	ldr	r3, [sp, #4]
 800ba68:	2b00      	cmp	r3, #0
 800ba6a:	d078      	beq.n	800bb5e <stm_eth_init+0x1da>
 800ba6c:	687b      	ldr	r3, [r7, #4]
 800ba6e:	2b00      	cmp	r3, #0
 800ba70:	d075      	beq.n	800bb5e <stm_eth_init+0x1da>
 800ba72:	4b87      	ldr	r3, [pc, #540]	; (800bc90 <stm_eth_init+0x30c>)
 800ba74:	4631      	mov	r1, r6
 800ba76:	4887      	ldr	r0, [pc, #540]	; (800bc94 <stm_eth_init+0x310>)
 800ba78:	f8d3 9000 	ldr.w	r9, [r3]
 800ba7c:	f7f9 fc6c 	bl	8005358 <printf>
 800ba80:	9b03      	ldr	r3, [sp, #12]
 800ba82:	2b64      	cmp	r3, #100	; 0x64
 800ba84:	f000 8137 	beq.w	800bcf6 <stm_eth_init+0x372>
 800ba88:	4883      	ldr	r0, [pc, #524]	; (800bc98 <stm_eth_init+0x314>)
 800ba8a:	f7f9 fc65 	bl	8005358 <printf>
 800ba8e:	f429 4980 	bic.w	r9, r9, #16384	; 0x4000
 800ba92:	9b02      	ldr	r3, [sp, #8]
 800ba94:	2b00      	cmp	r3, #0
 800ba96:	f000 8128 	beq.w	800bcea <stm_eth_init+0x366>
 800ba9a:	4880      	ldr	r0, [pc, #512]	; (800bc9c <stm_eth_init+0x318>)
 800ba9c:	f7f9 fc5c 	bl	8005358 <printf>
 800baa0:	f449 6900 	orr.w	r9, r9, #2048	; 0x800
 800baa4:	2101      	movs	r1, #1
 800baa6:	2200      	movs	r2, #0
 800baa8:	f44f 1c80 	mov.w	ip, #1048576	; 0x100000
 800baac:	f04f 4e00 	mov.w	lr, #2147483648	; 0x80000000
 800bab0:	f44f 408c 	mov.w	r0, #17920	; 0x4600
 800bab4:	4b76      	ldr	r3, [pc, #472]	; (800bc90 <stm_eth_init+0x30c>)
 800bab6:	6079      	str	r1, [r7, #4]
 800bab8:	f8c3 9000 	str.w	r9, [r3]
 800babc:	8ab1      	ldrh	r1, [r6, #20]
 800babe:	f106 0740 	add.w	r7, r6, #64	; 0x40
 800bac2:	6419      	str	r1, [r3, #64]	; 0x40
 800bac4:	6931      	ldr	r1, [r6, #16]
 800bac6:	6459      	str	r1, [r3, #68]	; 0x44
 800bac8:	f8c6 c040 	str.w	ip, [r6, #64]	; 0x40
 800bacc:	f106 0194 	add.w	r1, r6, #148	; 0x94
 800bad0:	6472      	str	r2, [r6, #68]	; 0x44
 800bad2:	64b2      	str	r2, [r6, #72]	; 0x48
 800bad4:	64f7      	str	r7, [r6, #76]	; 0x4c
 800bad6:	1c6b      	adds	r3, r5, #1
 800bad8:	eb06 1205 	add.w	r2, r6, r5, lsl #4
 800badc:	461d      	mov	r5, r3
 800bade:	f003 0303 	and.w	r3, r3, #3
 800bae2:	3305      	adds	r3, #5
 800bae4:	eb06 1303 	add.w	r3, r6, r3, lsl #4
 800bae8:	2d04      	cmp	r5, #4
 800baea:	f8c2 e050 	str.w	lr, [r2, #80]	; 0x50
 800baee:	6550      	str	r0, [r2, #84]	; 0x54
 800baf0:	6591      	str	r1, [r2, #88]	; 0x58
 800baf2:	f501 61c0 	add.w	r1, r1, #1536	; 0x600
 800baf6:	65d3      	str	r3, [r2, #92]	; 0x5c
 800baf8:	d1ed      	bne.n	800bad6 <stm_eth_init+0x152>
 800bafa:	2000      	movs	r0, #0
 800bafc:	f241 0110 	movw	r1, #4112	; 0x1010
 800bb00:	f241 020c 	movw	r2, #4108	; 0x100c
 800bb04:	f241 0518 	movw	r5, #4120	; 0x1018
 800bb08:	4b61      	ldr	r3, [pc, #388]	; (800bc90 <stm_eth_init+0x30c>)
 800bb0a:	f8c6 0090 	str.w	r0, [r6, #144]	; 0x90
 800bb0e:	4618      	mov	r0, r3
 800bb10:	3650      	adds	r6, #80	; 0x50
 800bb12:	505f      	str	r7, [r3, r1]
 800bb14:	509e      	str	r6, [r3, r2]
 800bb16:	6819      	ldr	r1, [r3, #0]
 800bb18:	4a61      	ldr	r2, [pc, #388]	; (800bca0 <stm_eth_init+0x31c>)
 800bb1a:	f041 0108 	orr.w	r1, r1, #8
 800bb1e:	6019      	str	r1, [r3, #0]
 800bb20:	5959      	ldr	r1, [r3, r5]
 800bb22:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
 800bb26:	5159      	str	r1, [r3, r5]
 800bb28:	6813      	ldr	r3, [r2, #0]
 800bb2a:	02d9      	lsls	r1, r3, #11
 800bb2c:	d4fc      	bmi.n	800bb28 <stm_eth_init+0x1a4>
 800bb2e:	6803      	ldr	r3, [r0, #0]
 800bb30:	f043 0304 	orr.w	r3, r3, #4
 800bb34:	6003      	str	r3, [r0, #0]
 800bb36:	4620      	mov	r0, r4
 800bb38:	6813      	ldr	r3, [r2, #0]
 800bb3a:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
 800bb3e:	6013      	str	r3, [r2, #0]
 800bb40:	6813      	ldr	r3, [r2, #0]
 800bb42:	f043 0302 	orr.w	r3, r3, #2
 800bb46:	6013      	str	r3, [r2, #0]
 800bb48:	b004      	add	sp, #16
 800bb4a:	e8bd 8ef0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
 800bb4e:	4c55      	ldr	r4, [pc, #340]	; (800bca4 <stm_eth_init+0x320>)
 800bb50:	4b55      	ldr	r3, [pc, #340]	; (800bca8 <stm_eth_init+0x324>)
 800bb52:	4404      	add	r4, r0
 800bb54:	429c      	cmp	r4, r3
 800bb56:	bf8c      	ite	hi
 800bb58:	2404      	movhi	r4, #4
 800bb5a:	2400      	movls	r4, #0
 800bb5c:	e76c      	b.n	800ba38 <stm_eth_init+0xb4>
 800bb5e:	4853      	ldr	r0, [pc, #332]	; (800bcac <stm_eth_init+0x328>)
 800bb60:	f7f9 fbfa 	bl	8005358 <printf>
 800bb64:	f10d 0202 	add.w	r2, sp, #2
 800bb68:	2100      	movs	r1, #0
 800bb6a:	4630      	mov	r0, r6
 800bb6c:	f7ff febe 	bl	800b8ec <stm_phy_read>
 800bb70:	b388      	cbz	r0, 800bbd6 <stm_eth_init+0x252>
 800bb72:	4604      	mov	r4, r0
 800bb74:	e743      	b.n	800b9fe <stm_eth_init+0x7a>
 800bb76:	4604      	mov	r4, r0
 800bb78:	f64f 7afd 	movw	sl, #65533	; 0xfffd
 800bb7c:	f10d 090c 	add.w	r9, sp, #12
 800bb80:	e002      	b.n	800bb88 <stm_eth_init+0x204>
 800bb82:	2c20      	cmp	r4, #32
 800bb84:	f000 80a8 	beq.w	800bcd8 <stm_eth_init+0x354>
 800bb88:	63f4      	str	r4, [r6, #60]	; 0x3c
 800bb8a:	464a      	mov	r2, r9
 800bb8c:	2102      	movs	r1, #2
 800bb8e:	4630      	mov	r0, r6
 800bb90:	f7ff feac 	bl	800b8ec <stm_phy_read>
 800bb94:	3401      	adds	r4, #1
 800bb96:	2800      	cmp	r0, #0
 800bb98:	d1f3      	bne.n	800bb82 <stm_eth_init+0x1fe>
 800bb9a:	f8bd 200c 	ldrh.w	r2, [sp, #12]
 800bb9e:	1e53      	subs	r3, r2, #1
 800bba0:	b29b      	uxth	r3, r3
 800bba2:	4553      	cmp	r3, sl
 800bba4:	d8ed      	bhi.n	800bb82 <stm_eth_init+0x1fe>
 800bba6:	0412      	lsls	r2, r2, #16
 800bba8:	63b2      	str	r2, [r6, #56]	; 0x38
 800bbaa:	2103      	movs	r1, #3
 800bbac:	464a      	mov	r2, r9
 800bbae:	4630      	mov	r0, r6
 800bbb0:	f7ff fe9c 	bl	800b8ec <stm_phy_read>
 800bbb4:	2800      	cmp	r0, #0
 800bbb6:	f47f af4d 	bne.w	800ba54 <stm_eth_init+0xd0>
 800bbba:	f8bd 200c 	ldrh.w	r2, [sp, #12]
 800bbbe:	1e53      	subs	r3, r2, #1
 800bbc0:	b29b      	uxth	r3, r3
 800bbc2:	4553      	cmp	r3, sl
 800bbc4:	f63f af46 	bhi.w	800ba54 <stm_eth_init+0xd0>
 800bbc8:	6bb3      	ldr	r3, [r6, #56]	; 0x38
 800bbca:	4313      	orrs	r3, r2
 800bbcc:	63b3      	str	r3, [r6, #56]	; 0x38
 800bbce:	e741      	b.n	800ba54 <stm_eth_init+0xd0>
 800bbd0:	f06f 040f 	mvn.w	r4, #15
 800bbd4:	e713      	b.n	800b9fe <stm_eth_init+0x7a>
 800bbd6:	f8bd a002 	ldrh.w	sl, [sp, #2]
 800bbda:	f8b6 b03c 	ldrh.w	fp, [r6, #60]	; 0x3c
 800bbde:	f44a 5a90 	orr.w	sl, sl, #4608	; 0x1200
 800bbe2:	fa1f fa8a 	uxth.w	sl, sl
 800bbe6:	f7ff fe5f 	bl	800b8a8 <stm_phy_wait_busy.constprop.4>
 800bbea:	2800      	cmp	r0, #0
 800bbec:	d1f0      	bne.n	800bbd0 <stm_eth_init+0x24c>
 800bbee:	4a28      	ldr	r2, [pc, #160]	; (800bc90 <stm_eth_init+0x30c>)
 800bbf0:	f00b 0b1f 	and.w	fp, fp, #31
 800bbf4:	6913      	ldr	r3, [r2, #16]
 800bbf6:	f8c2 a014 	str.w	sl, [r2, #20]
 800bbfa:	f003 031c 	and.w	r3, r3, #28
 800bbfe:	f043 0303 	orr.w	r3, r3, #3
 800bc02:	ea43 23cb 	orr.w	r3, r3, fp, lsl #11
 800bc06:	6113      	str	r3, [r2, #16]
 800bc08:	f7ff fe4e 	bl	800b8a8 <stm_phy_wait_busy.constprop.4>
 800bc0c:	2800      	cmp	r0, #0
 800bc0e:	d178      	bne.n	800bd02 <stm_eth_init+0x37e>
 800bc10:	f8df a0a4 	ldr.w	sl, [pc, #164]	; 800bcb8 <stm_eth_init+0x334>
 800bc14:	f10d 0202 	add.w	r2, sp, #2
 800bc18:	2101      	movs	r1, #1
 800bc1a:	4630      	mov	r0, r6
 800bc1c:	f7ff fe66 	bl	800b8ec <stm_phy_read>
 800bc20:	2800      	cmp	r0, #0
 800bc22:	d14b      	bne.n	800bcbc <stm_eth_init+0x338>
 800bc24:	f8bd 3002 	ldrh.w	r3, [sp, #2]
 800bc28:	069b      	lsls	r3, r3, #26
 800bc2a:	d547      	bpl.n	800bcbc <stm_eth_init+0x338>
 800bc2c:	4820      	ldr	r0, [pc, #128]	; (800bcb0 <stm_eth_init+0x32c>)
 800bc2e:	f7f9 fb93 	bl	8005358 <printf>
 800bc32:	464b      	mov	r3, r9
 800bc34:	aa02      	add	r2, sp, #8
 800bc36:	a901      	add	r1, sp, #4
 800bc38:	4630      	mov	r0, r6
 800bc3a:	f7ff fe7b 	bl	800b934 <stm_phy_link_get>
 800bc3e:	2800      	cmp	r0, #0
 800bc40:	d197      	bne.n	800bb72 <stm_eth_init+0x1ee>
 800bc42:	9b01      	ldr	r3, [sp, #4]
 800bc44:	2b00      	cmp	r3, #0
 800bc46:	f47f af14 	bne.w	800ba72 <stm_eth_init+0xee>
 800bc4a:	481a      	ldr	r0, [pc, #104]	; (800bcb4 <stm_eth_init+0x330>)
 800bc4c:	f7f9 fb84 	bl	8005358 <printf>
 800bc50:	f06f 0464 	mvn.w	r4, #100	; 0x64
 800bc54:	e6d3      	b.n	800b9fe <stm_eth_init+0x7a>
 800bc56:	bf00      	nop
 800bc58:	20003c14 	.word	0x20003c14
 800bc5c:	20000ac8 	.word	0x20000ac8
 800bc60:	40023800 	.word	0x40023800
 800bc64:	40029000 	.word	0x40029000
 800bc68:	0800fa6c 	.word	0x0800fa6c
 800bc6c:	0800fb84 	.word	0x0800fb84
 800bc70:	0800fa5c 	.word	0x0800fa5c
 800bc74:	0800fb70 	.word	0x0800fb70
 800bc78:	02c16000 	.word	0x02c16000
 800bc7c:	20000b21 	.word	0x20000b21
 800bc80:	feced300 	.word	0xfeced300
 800bc84:	00e4e1bf 	.word	0x00e4e1bf
 800bc88:	fde9f140 	.word	0xfde9f140
 800bc8c:	017d783f 	.word	0x017d783f
 800bc90:	40028000 	.word	0x40028000
 800bc94:	0800fb2c 	.word	0x0800fb2c
 800bc98:	0800fb44 	.word	0x0800fb44
 800bc9c:	0800fb4c 	.word	0x0800fb4c
 800bca0:	40029018 	.word	0x40029018
 800bca4:	fc6c7900 	.word	0xfc6c7900
 800bca8:	026259ff 	.word	0x026259ff
 800bcac:	0800fafc 	.word	0x0800fafc
 800bcb0:	0800fb10 	.word	0x0800fb10
 800bcb4:	0800fb1c 	.word	0x0800fb1c
 800bcb8:	000186a0 	.word	0x000186a0
 800bcbc:	2064      	movs	r0, #100	; 0x64
 800bcbe:	f7fc fbe3 	bl	8008488 <udelay>
 800bcc2:	f1ba 0a01 	subs.w	sl, sl, #1
 800bcc6:	d1a5      	bne.n	800bc14 <stm_eth_init+0x290>
 800bcc8:	f8bd 3002 	ldrh.w	r3, [sp, #2]
 800bccc:	0698      	lsls	r0, r3, #26
 800bcce:	d4ad      	bmi.n	800bc2c <stm_eth_init+0x2a8>
 800bcd0:	480d      	ldr	r0, [pc, #52]	; (800bd08 <stm_eth_init+0x384>)
 800bcd2:	f7f9 fb41 	bl	8005358 <printf>
 800bcd6:	e7ac      	b.n	800bc32 <stm_eth_init+0x2ae>
 800bcd8:	23ff      	movs	r3, #255	; 0xff
 800bcda:	490c      	ldr	r1, [pc, #48]	; (800bd0c <stm_eth_init+0x388>)
 800bcdc:	63b3      	str	r3, [r6, #56]	; 0x38
 800bcde:	480c      	ldr	r0, [pc, #48]	; (800bd10 <stm_eth_init+0x38c>)
 800bce0:	f7f9 fb3a 	bl	8005358 <printf>
 800bce4:	f06f 0412 	mvn.w	r4, #18
 800bce8:	e689      	b.n	800b9fe <stm_eth_init+0x7a>
 800bcea:	480a      	ldr	r0, [pc, #40]	; (800bd14 <stm_eth_init+0x390>)
 800bcec:	f7f9 fb34 	bl	8005358 <printf>
 800bcf0:	f429 6900 	bic.w	r9, r9, #2048	; 0x800
 800bcf4:	e6d6      	b.n	800baa4 <stm_eth_init+0x120>
 800bcf6:	4808      	ldr	r0, [pc, #32]	; (800bd18 <stm_eth_init+0x394>)
 800bcf8:	f449 4980 	orr.w	r9, r9, #16384	; 0x4000
 800bcfc:	f7f9 fb2c 	bl	8005358 <printf>
 800bd00:	e6c7      	b.n	800ba92 <stm_eth_init+0x10e>
 800bd02:	f06f 046d 	mvn.w	r4, #109	; 0x6d
 800bd06:	e67a      	b.n	800b9fe <stm_eth_init+0x7a>
 800bd08:	0800fae0 	.word	0x0800fae0
 800bd0c:	0800fa4c 	.word	0x0800fa4c
 800bd10:	0800fb5c 	.word	0x0800fb5c
 800bd14:	0800fb54 	.word	0x0800fb54
 800bd18:	0800fb3c 	.word	0x0800fb3c

0800bd1c <stm32_eth_init>:
 800bd1c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800bd1e:	f641 0094 	movw	r0, #6292	; 0x1894
 800bd22:	f7f9 fdaf 	bl	8005884 <malloc>
 800bd26:	b358      	cbz	r0, 800bd80 <stm32_eth_init+0x64>
 800bd28:	4604      	mov	r4, r0
 800bd2a:	2700      	movs	r7, #0
 800bd2c:	26ff      	movs	r6, #255	; 0xff
 800bd2e:	f641 0294 	movw	r2, #6292	; 0x1894
 800bd32:	2100      	movs	r1, #0
 800bd34:	f7f4 fccc 	bl	80006d0 <memset>
 800bd38:	4916      	ldr	r1, [pc, #88]	; (800bd94 <stm32_eth_init+0x78>)
 800bd3a:	4a17      	ldr	r2, [pc, #92]	; (800bd98 <stm32_eth_init+0x7c>)
 800bd3c:	6c4b      	ldr	r3, [r1, #68]	; 0x44
 800bd3e:	4d17      	ldr	r5, [pc, #92]	; (800bd9c <stm32_eth_init+0x80>)
 800bd40:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
 800bd44:	644b      	str	r3, [r1, #68]	; 0x44
 800bd46:	6853      	ldr	r3, [r2, #4]
 800bd48:	4915      	ldr	r1, [pc, #84]	; (800bda0 <stm32_eth_init+0x84>)
 800bd4a:	f443 0300 	orr.w	r3, r3, #8388608	; 0x800000
 800bd4e:	6053      	str	r3, [r2, #4]
 800bd50:	4620      	mov	r0, r4
 800bd52:	61a5      	str	r5, [r4, #24]
 800bd54:	63e7      	str	r7, [r4, #60]	; 0x3c
 800bd56:	63a6      	str	r6, [r4, #56]	; 0x38
 800bd58:	f7fd fab4 	bl	80092c4 <sprintf>
 800bd5c:	4811      	ldr	r0, [pc, #68]	; (800bda4 <stm32_eth_init+0x88>)
 800bd5e:	4912      	ldr	r1, [pc, #72]	; (800bda8 <stm32_eth_init+0x8c>)
 800bd60:	4a12      	ldr	r2, [pc, #72]	; (800bdac <stm32_eth_init+0x90>)
 800bd62:	4b13      	ldr	r3, [pc, #76]	; (800bdb0 <stm32_eth_init+0x94>)
 800bd64:	6220      	str	r0, [r4, #32]
 800bd66:	62e1      	str	r1, [r4, #44]	; 0x2c
 800bd68:	6262      	str	r2, [r4, #36]	; 0x24
 800bd6a:	62a3      	str	r3, [r4, #40]	; 0x28
 800bd6c:	4620      	mov	r0, r4
 800bd6e:	f7f5 fad9 	bl	8001324 <eth_register>
 800bd72:	4605      	mov	r5, r0
 800bd74:	b110      	cbz	r0, 800bd7c <stm32_eth_init+0x60>
 800bd76:	4620      	mov	r0, r4
 800bd78:	f7f9 fca6 	bl	80056c8 <free>
 800bd7c:	4628      	mov	r0, r5
 800bd7e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800bd80:	4a07      	ldr	r2, [pc, #28]	; (800bda0 <stm32_eth_init+0x84>)
 800bd82:	f641 0194 	movw	r1, #6292	; 0x1894
 800bd86:	480b      	ldr	r0, [pc, #44]	; (800bdb4 <stm32_eth_init+0x98>)
 800bd88:	f7f9 fae6 	bl	8005358 <printf>
 800bd8c:	f06f 050b 	mvn.w	r5, #11
 800bd90:	e7f4      	b.n	800bd7c <stm32_eth_init+0x60>
 800bd92:	bf00      	nop
 800bd94:	40023800 	.word	0x40023800
 800bd98:	40013800 	.word	0x40013800
 800bd9c:	40028000 	.word	0x40028000
 800bda0:	0800fba8 	.word	0x0800fba8
 800bda4:	0800b985 	.word	0x0800b985
 800bda8:	0800b741 	.word	0x0800b741
 800bdac:	0800b809 	.word	0x0800b809
 800bdb0:	0800b761 	.word	0x0800b761
 800bdb4:	0800fbb4 	.word	0x0800fbb4

0800bdb8 <strmhz>:
 800bdb8:	b570      	push	{r4, r5, r6, lr}
 800bdba:	460e      	mov	r6, r1
 800bdbc:	4c0f      	ldr	r4, [pc, #60]	; (800bdfc <strmhz+0x44>)
 800bdbe:	f501 73fa 	add.w	r3, r1, #500	; 0x1f4
 800bdc2:	fb84 2403 	smull	r2, r4, r4, r3
 800bdc6:	17db      	asrs	r3, r3, #31
 800bdc8:	ebc3 44a4 	rsb	r4, r3, r4, asr #18
 800bdcc:	4622      	mov	r2, r4
 800bdce:	490c      	ldr	r1, [pc, #48]	; (800be00 <strmhz+0x48>)
 800bdd0:	4605      	mov	r5, r0
 800bdd2:	f7fd fa77 	bl	80092c4 <sprintf>
 800bdd6:	4a0b      	ldr	r2, [pc, #44]	; (800be04 <strmhz+0x4c>)
 800bdd8:	4b0b      	ldr	r3, [pc, #44]	; (800be08 <strmhz+0x50>)
 800bdda:	fb02 6204 	mla	r2, r2, r4, r6
 800bdde:	f502 72fa 	add.w	r2, r2, #500	; 0x1f4
 800bde2:	fb83 3402 	smull	r3, r4, r3, r2
 800bde6:	17d2      	asrs	r2, r2, #31
 800bde8:	ebd2 12a4 	rsbs	r2, r2, r4, asr #6
 800bdec:	d003      	beq.n	800bdf6 <strmhz+0x3e>
 800bdee:	4428      	add	r0, r5
 800bdf0:	4906      	ldr	r1, [pc, #24]	; (800be0c <strmhz+0x54>)
 800bdf2:	f7fd fa67 	bl	80092c4 <sprintf>
 800bdf6:	4628      	mov	r0, r5
 800bdf8:	bd70      	pop	{r4, r5, r6, pc}
 800bdfa:	bf00      	nop
 800bdfc:	431bde83 	.word	0x431bde83
 800be00:	0800fbe4 	.word	0x0800fbe4
 800be04:	fff0bdc0 	.word	0xfff0bdc0
 800be08:	10624dd3 	.word	0x10624dd3
 800be0c:	0800fbe8 	.word	0x0800fbe8

0800be10 <__aeabi_uldivmod>:
 800be10:	b953      	cbnz	r3, 800be28 <__aeabi_uldivmod+0x18>
 800be12:	b94a      	cbnz	r2, 800be28 <__aeabi_uldivmod+0x18>
 800be14:	2900      	cmp	r1, #0
 800be16:	bf08      	it	eq
 800be18:	2800      	cmpeq	r0, #0
 800be1a:	bf1c      	itt	ne
 800be1c:	f04f 31ff 	movne.w	r1, #4294967295	; 0xffffffff
 800be20:	f04f 30ff 	movne.w	r0, #4294967295	; 0xffffffff
 800be24:	f000 b97a 	b.w	800c11c <__aeabi_idiv0>
 800be28:	f1ad 0c08 	sub.w	ip, sp, #8
 800be2c:	e96d ce04 	strd	ip, lr, [sp, #-16]!
 800be30:	f000 f806 	bl	800be40 <__udivmoddi4>
 800be34:	f8dd e004 	ldr.w	lr, [sp, #4]
 800be38:	e9dd 2302 	ldrd	r2, r3, [sp, #8]
 800be3c:	b004      	add	sp, #16
 800be3e:	4770      	bx	lr

0800be40 <__udivmoddi4>:
 800be40:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 800be44:	468c      	mov	ip, r1
 800be46:	460e      	mov	r6, r1
 800be48:	4604      	mov	r4, r0
 800be4a:	9d08      	ldr	r5, [sp, #32]
 800be4c:	2b00      	cmp	r3, #0
 800be4e:	d150      	bne.n	800bef2 <__udivmoddi4+0xb2>
 800be50:	428a      	cmp	r2, r1
 800be52:	4617      	mov	r7, r2
 800be54:	d96c      	bls.n	800bf30 <__udivmoddi4+0xf0>
 800be56:	fab2 fe82 	clz	lr, r2
 800be5a:	f1be 0f00 	cmp.w	lr, #0
 800be5e:	d00b      	beq.n	800be78 <__udivmoddi4+0x38>
 800be60:	f1ce 0c20 	rsb	ip, lr, #32
 800be64:	fa01 f60e 	lsl.w	r6, r1, lr
 800be68:	fa20 fc0c 	lsr.w	ip, r0, ip
 800be6c:	fa02 f70e 	lsl.w	r7, r2, lr
 800be70:	ea4c 0c06 	orr.w	ip, ip, r6
 800be74:	fa00 f40e 	lsl.w	r4, r0, lr
 800be78:	0c3a      	lsrs	r2, r7, #16
 800be7a:	fbbc f9f2 	udiv	r9, ip, r2
 800be7e:	b2bb      	uxth	r3, r7
 800be80:	fb02 cc19 	mls	ip, r2, r9, ip
 800be84:	fb09 fa03 	mul.w	sl, r9, r3
 800be88:	ea4f 4814 	mov.w	r8, r4, lsr #16
 800be8c:	ea48 460c 	orr.w	r6, r8, ip, lsl #16
 800be90:	45b2      	cmp	sl, r6
 800be92:	d90a      	bls.n	800beaa <__udivmoddi4+0x6a>
 800be94:	19f6      	adds	r6, r6, r7
 800be96:	f109 31ff 	add.w	r1, r9, #4294967295	; 0xffffffff
 800be9a:	f080 8125 	bcs.w	800c0e8 <__udivmoddi4+0x2a8>
 800be9e:	45b2      	cmp	sl, r6
 800bea0:	f240 8122 	bls.w	800c0e8 <__udivmoddi4+0x2a8>
 800bea4:	f1a9 0902 	sub.w	r9, r9, #2
 800bea8:	443e      	add	r6, r7
 800beaa:	eba6 060a 	sub.w	r6, r6, sl
 800beae:	fbb6 f0f2 	udiv	r0, r6, r2
 800beb2:	fb02 6610 	mls	r6, r2, r0, r6
 800beb6:	fb00 f303 	mul.w	r3, r0, r3
 800beba:	b2a4      	uxth	r4, r4
 800bebc:	ea44 4406 	orr.w	r4, r4, r6, lsl #16
 800bec0:	42a3      	cmp	r3, r4
 800bec2:	d909      	bls.n	800bed8 <__udivmoddi4+0x98>
 800bec4:	19e4      	adds	r4, r4, r7
 800bec6:	f100 32ff 	add.w	r2, r0, #4294967295	; 0xffffffff
 800beca:	f080 810b 	bcs.w	800c0e4 <__udivmoddi4+0x2a4>
 800bece:	42a3      	cmp	r3, r4
 800bed0:	f240 8108 	bls.w	800c0e4 <__udivmoddi4+0x2a4>
 800bed4:	3802      	subs	r0, #2
 800bed6:	443c      	add	r4, r7
 800bed8:	2100      	movs	r1, #0
 800beda:	1ae4      	subs	r4, r4, r3
 800bedc:	ea40 4009 	orr.w	r0, r0, r9, lsl #16
 800bee0:	2d00      	cmp	r5, #0
 800bee2:	d062      	beq.n	800bfaa <__udivmoddi4+0x16a>
 800bee4:	2300      	movs	r3, #0
 800bee6:	fa24 f40e 	lsr.w	r4, r4, lr
 800beea:	602c      	str	r4, [r5, #0]
 800beec:	606b      	str	r3, [r5, #4]
 800beee:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 800bef2:	428b      	cmp	r3, r1
 800bef4:	d907      	bls.n	800bf06 <__udivmoddi4+0xc6>
 800bef6:	2d00      	cmp	r5, #0
 800bef8:	d055      	beq.n	800bfa6 <__udivmoddi4+0x166>
 800befa:	2100      	movs	r1, #0
 800befc:	e885 0041 	stmia.w	r5, {r0, r6}
 800bf00:	4608      	mov	r0, r1
 800bf02:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 800bf06:	fab3 f183 	clz	r1, r3
 800bf0a:	2900      	cmp	r1, #0
 800bf0c:	f040 808f 	bne.w	800c02e <__udivmoddi4+0x1ee>
 800bf10:	42b3      	cmp	r3, r6
 800bf12:	d302      	bcc.n	800bf1a <__udivmoddi4+0xda>
 800bf14:	4282      	cmp	r2, r0
 800bf16:	f200 80fc 	bhi.w	800c112 <__udivmoddi4+0x2d2>
 800bf1a:	1a84      	subs	r4, r0, r2
 800bf1c:	eb66 0603 	sbc.w	r6, r6, r3
 800bf20:	2001      	movs	r0, #1
 800bf22:	46b4      	mov	ip, r6
 800bf24:	2d00      	cmp	r5, #0
 800bf26:	d040      	beq.n	800bfaa <__udivmoddi4+0x16a>
 800bf28:	e885 1010 	stmia.w	r5, {r4, ip}
 800bf2c:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 800bf30:	b912      	cbnz	r2, 800bf38 <__udivmoddi4+0xf8>
 800bf32:	2701      	movs	r7, #1
 800bf34:	fbb7 f7f2 	udiv	r7, r7, r2
 800bf38:	fab7 fe87 	clz	lr, r7
 800bf3c:	f1be 0f00 	cmp.w	lr, #0
 800bf40:	d135      	bne.n	800bfae <__udivmoddi4+0x16e>
 800bf42:	2101      	movs	r1, #1
 800bf44:	1bf6      	subs	r6, r6, r7
 800bf46:	ea4f 4c17 	mov.w	ip, r7, lsr #16
 800bf4a:	fa1f f887 	uxth.w	r8, r7
 800bf4e:	fbb6 f2fc 	udiv	r2, r6, ip
 800bf52:	fb0c 6612 	mls	r6, ip, r2, r6
 800bf56:	fb08 f002 	mul.w	r0, r8, r2
 800bf5a:	0c23      	lsrs	r3, r4, #16
 800bf5c:	ea43 4606 	orr.w	r6, r3, r6, lsl #16
 800bf60:	42b0      	cmp	r0, r6
 800bf62:	d907      	bls.n	800bf74 <__udivmoddi4+0x134>
 800bf64:	19f6      	adds	r6, r6, r7
 800bf66:	f102 33ff 	add.w	r3, r2, #4294967295	; 0xffffffff
 800bf6a:	d202      	bcs.n	800bf72 <__udivmoddi4+0x132>
 800bf6c:	42b0      	cmp	r0, r6
 800bf6e:	f200 80d2 	bhi.w	800c116 <__udivmoddi4+0x2d6>
 800bf72:	461a      	mov	r2, r3
 800bf74:	1a36      	subs	r6, r6, r0
 800bf76:	fbb6 f0fc 	udiv	r0, r6, ip
 800bf7a:	fb0c 6610 	mls	r6, ip, r0, r6
 800bf7e:	fb08 f800 	mul.w	r8, r8, r0
 800bf82:	b2a3      	uxth	r3, r4
 800bf84:	ea43 4406 	orr.w	r4, r3, r6, lsl #16
 800bf88:	45a0      	cmp	r8, r4
 800bf8a:	d907      	bls.n	800bf9c <__udivmoddi4+0x15c>
 800bf8c:	19e4      	adds	r4, r4, r7
 800bf8e:	f100 33ff 	add.w	r3, r0, #4294967295	; 0xffffffff
 800bf92:	d202      	bcs.n	800bf9a <__udivmoddi4+0x15a>
 800bf94:	45a0      	cmp	r8, r4
 800bf96:	f200 80b9 	bhi.w	800c10c <__udivmoddi4+0x2cc>
 800bf9a:	4618      	mov	r0, r3
 800bf9c:	eba4 0408 	sub.w	r4, r4, r8
 800bfa0:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
 800bfa4:	e79c      	b.n	800bee0 <__udivmoddi4+0xa0>
 800bfa6:	4629      	mov	r1, r5
 800bfa8:	4628      	mov	r0, r5
 800bfaa:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 800bfae:	fa07 f70e 	lsl.w	r7, r7, lr
 800bfb2:	f1ce 0320 	rsb	r3, lr, #32
 800bfb6:	fa26 f203 	lsr.w	r2, r6, r3
 800bfba:	ea4f 4c17 	mov.w	ip, r7, lsr #16
 800bfbe:	fbb2 f1fc 	udiv	r1, r2, ip
 800bfc2:	fa1f f887 	uxth.w	r8, r7
 800bfc6:	fb0c 2211 	mls	r2, ip, r1, r2
 800bfca:	fa06 f60e 	lsl.w	r6, r6, lr
 800bfce:	fa20 f303 	lsr.w	r3, r0, r3
 800bfd2:	fb01 f908 	mul.w	r9, r1, r8
 800bfd6:	4333      	orrs	r3, r6
 800bfd8:	0c1e      	lsrs	r6, r3, #16
 800bfda:	ea46 4602 	orr.w	r6, r6, r2, lsl #16
 800bfde:	45b1      	cmp	r9, r6
 800bfe0:	fa00 f40e 	lsl.w	r4, r0, lr
 800bfe4:	d909      	bls.n	800bffa <__udivmoddi4+0x1ba>
 800bfe6:	19f6      	adds	r6, r6, r7
 800bfe8:	f101 32ff 	add.w	r2, r1, #4294967295	; 0xffffffff
 800bfec:	f080 808c 	bcs.w	800c108 <__udivmoddi4+0x2c8>
 800bff0:	45b1      	cmp	r9, r6
 800bff2:	f240 8089 	bls.w	800c108 <__udivmoddi4+0x2c8>
 800bff6:	3902      	subs	r1, #2
 800bff8:	443e      	add	r6, r7
 800bffa:	eba6 0609 	sub.w	r6, r6, r9
 800bffe:	fbb6 f0fc 	udiv	r0, r6, ip
 800c002:	fb0c 6210 	mls	r2, ip, r0, r6
 800c006:	fb00 f908 	mul.w	r9, r0, r8
 800c00a:	b29e      	uxth	r6, r3
 800c00c:	ea46 4602 	orr.w	r6, r6, r2, lsl #16
 800c010:	45b1      	cmp	r9, r6
 800c012:	d907      	bls.n	800c024 <__udivmoddi4+0x1e4>
 800c014:	19f6      	adds	r6, r6, r7
 800c016:	f100 33ff 	add.w	r3, r0, #4294967295	; 0xffffffff
 800c01a:	d271      	bcs.n	800c100 <__udivmoddi4+0x2c0>
 800c01c:	45b1      	cmp	r9, r6
 800c01e:	d96f      	bls.n	800c100 <__udivmoddi4+0x2c0>
 800c020:	3802      	subs	r0, #2
 800c022:	443e      	add	r6, r7
 800c024:	eba6 0609 	sub.w	r6, r6, r9
 800c028:	ea40 4101 	orr.w	r1, r0, r1, lsl #16
 800c02c:	e78f      	b.n	800bf4e <__udivmoddi4+0x10e>
 800c02e:	f1c1 0720 	rsb	r7, r1, #32
 800c032:	fa22 f807 	lsr.w	r8, r2, r7
 800c036:	408b      	lsls	r3, r1
 800c038:	ea48 0303 	orr.w	r3, r8, r3
 800c03c:	fa26 f407 	lsr.w	r4, r6, r7
 800c040:	ea4f 4e13 	mov.w	lr, r3, lsr #16
 800c044:	fbb4 f9fe 	udiv	r9, r4, lr
 800c048:	fa1f fc83 	uxth.w	ip, r3
 800c04c:	fb0e 4419 	mls	r4, lr, r9, r4
 800c050:	408e      	lsls	r6, r1
 800c052:	fa20 f807 	lsr.w	r8, r0, r7
 800c056:	fb09 fa0c 	mul.w	sl, r9, ip
 800c05a:	ea48 0806 	orr.w	r8, r8, r6
 800c05e:	ea4f 4618 	mov.w	r6, r8, lsr #16
 800c062:	ea46 4404 	orr.w	r4, r6, r4, lsl #16
 800c066:	45a2      	cmp	sl, r4
 800c068:	fa02 f201 	lsl.w	r2, r2, r1
 800c06c:	fa00 f601 	lsl.w	r6, r0, r1
 800c070:	d908      	bls.n	800c084 <__udivmoddi4+0x244>
 800c072:	18e4      	adds	r4, r4, r3
 800c074:	f109 30ff 	add.w	r0, r9, #4294967295	; 0xffffffff
 800c078:	d244      	bcs.n	800c104 <__udivmoddi4+0x2c4>
 800c07a:	45a2      	cmp	sl, r4
 800c07c:	d942      	bls.n	800c104 <__udivmoddi4+0x2c4>
 800c07e:	f1a9 0902 	sub.w	r9, r9, #2
 800c082:	441c      	add	r4, r3
 800c084:	eba4 040a 	sub.w	r4, r4, sl
 800c088:	fbb4 f0fe 	udiv	r0, r4, lr
 800c08c:	fb0e 4410 	mls	r4, lr, r0, r4
 800c090:	fb00 fc0c 	mul.w	ip, r0, ip
 800c094:	fa1f f888 	uxth.w	r8, r8
 800c098:	ea48 4404 	orr.w	r4, r8, r4, lsl #16
 800c09c:	45a4      	cmp	ip, r4
 800c09e:	d907      	bls.n	800c0b0 <__udivmoddi4+0x270>
 800c0a0:	18e4      	adds	r4, r4, r3
 800c0a2:	f100 3eff 	add.w	lr, r0, #4294967295	; 0xffffffff
 800c0a6:	d229      	bcs.n	800c0fc <__udivmoddi4+0x2bc>
 800c0a8:	45a4      	cmp	ip, r4
 800c0aa:	d927      	bls.n	800c0fc <__udivmoddi4+0x2bc>
 800c0ac:	3802      	subs	r0, #2
 800c0ae:	441c      	add	r4, r3
 800c0b0:	ea40 4009 	orr.w	r0, r0, r9, lsl #16
 800c0b4:	fba0 8902 	umull	r8, r9, r0, r2
 800c0b8:	eba4 0c0c 	sub.w	ip, r4, ip
 800c0bc:	45cc      	cmp	ip, r9
 800c0be:	46c2      	mov	sl, r8
 800c0c0:	46ce      	mov	lr, r9
 800c0c2:	d315      	bcc.n	800c0f0 <__udivmoddi4+0x2b0>
 800c0c4:	d012      	beq.n	800c0ec <__udivmoddi4+0x2ac>
 800c0c6:	b155      	cbz	r5, 800c0de <__udivmoddi4+0x29e>
 800c0c8:	ebb6 030a 	subs.w	r3, r6, sl
 800c0cc:	eb6c 060e 	sbc.w	r6, ip, lr
 800c0d0:	fa06 f707 	lsl.w	r7, r6, r7
 800c0d4:	40cb      	lsrs	r3, r1
 800c0d6:	431f      	orrs	r7, r3
 800c0d8:	40ce      	lsrs	r6, r1
 800c0da:	602f      	str	r7, [r5, #0]
 800c0dc:	606e      	str	r6, [r5, #4]
 800c0de:	2100      	movs	r1, #0
 800c0e0:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 800c0e4:	4610      	mov	r0, r2
 800c0e6:	e6f7      	b.n	800bed8 <__udivmoddi4+0x98>
 800c0e8:	4689      	mov	r9, r1
 800c0ea:	e6de      	b.n	800beaa <__udivmoddi4+0x6a>
 800c0ec:	4546      	cmp	r6, r8
 800c0ee:	d2ea      	bcs.n	800c0c6 <__udivmoddi4+0x286>
 800c0f0:	ebb8 0a02 	subs.w	sl, r8, r2
 800c0f4:	eb69 0e03 	sbc.w	lr, r9, r3
 800c0f8:	3801      	subs	r0, #1
 800c0fa:	e7e4      	b.n	800c0c6 <__udivmoddi4+0x286>
 800c0fc:	4670      	mov	r0, lr
 800c0fe:	e7d7      	b.n	800c0b0 <__udivmoddi4+0x270>
 800c100:	4618      	mov	r0, r3
 800c102:	e78f      	b.n	800c024 <__udivmoddi4+0x1e4>
 800c104:	4681      	mov	r9, r0
 800c106:	e7bd      	b.n	800c084 <__udivmoddi4+0x244>
 800c108:	4611      	mov	r1, r2
 800c10a:	e776      	b.n	800bffa <__udivmoddi4+0x1ba>
 800c10c:	3802      	subs	r0, #2
 800c10e:	443c      	add	r4, r7
 800c110:	e744      	b.n	800bf9c <__udivmoddi4+0x15c>
 800c112:	4608      	mov	r0, r1
 800c114:	e706      	b.n	800bf24 <__udivmoddi4+0xe4>
 800c116:	3a02      	subs	r2, #2
 800c118:	443e      	add	r6, r7
 800c11a:	e72b      	b.n	800bf74 <__udivmoddi4+0x134>

0800c11c <__aeabi_idiv0>:
 800c11c:	4770      	bx	lr
 800c11e:	bf00      	nop

0800c120 <exc.4081>:
	...
 800c128:	c1d0 0800 c1d4 0800 c1e0 0800 c1f4 0800     ................
 800c138:	c200 0800 c20c 0800 c20c 0800 c20c 0800     ................
 800c148:	c20c 0800 c218 0800 c220 0800 c20c 0800     ........ .......
 800c158:	c230 0800 c238 0800                         0...8...

0800c160 <regs.4080>:
 800c160:	c1a4 0800 c1b4 0800 c1b8 0800 c1bc 0800     ................
 800c170:	c1c0 0800 c1c4 0800 c1c8 0800 c1cc 0800     ................
 800c180:	4e55 4148 444e 454c 2044 5845 4543 5450     UNHANDLED EXCEPT
 800c190:	4f49 3a4e 0020 0000 4e49 4954 5253 255b     ION: ...INTISR[%
 800c1a0:	5d64 000a 3052 0000 2020 7325 3d09 2520     d]..R0..  %s.= %
 800c1b0:	3830 0078 3152 0000 3252 0000 3352 0000     08x.R1..R2..R3..
 800c1c0:	3152 0032 524c 0000 4350 0000 5350 0052     R12.LR..PC..PSR.
 800c1d0:	4d4e 0049 4148 4452 4620 5541 544c 0000     NMI.HARD FAULT..
 800c1e0:	454d 4f4d 5952 4d20 4e41 4741 4d45 4e45     MEMORY MANAGEMEN
 800c1f0:	0054 0000 5542 2053 4146 4c55 0054 0000     T...BUS FAULT...
 800c200:	5355 4741 2045 4146 4c55 0054 4552 4553     USAGE FAULT.RESE
 800c210:	5652 4445 0000 0000 5653 4143 4c4c 0000     RVED....SVCALL..
 800c220:	4544 5542 2047 4f4d 494e 4f54 0052 0000     DEBUG MONITOR...
 800c230:	4550 444e 5653 0000 5953 5453 4349 004b     PENDSV..SYSTICK.
 800c240:	7325 203a 6c46 7361 2068 666f 7366 7465     %s: Flash offset
 800c250:	6d20 7375 2074 6562 7320 6570 6963 6966      must be specifi
 800c260:	6465 000a 7325 203a 7055 6164 6974 676e     ed..%s: Updating
 800c270:	6520 564e 2e4d 5020 656c 7361 2065 6177      eNVM. Please wa
 800c280:	7469 2e20 2e2e 000a 7325 203a 6e65 6d76     it .....%s: envm
 800c290:	775f 6972 6574 615f 646e 725f 7365 7465     _write_and_reset
 800c2a0:	6620 6961 656c 3a64 2520 0a64 0000 0000      failed: %d.....
 800c2b0:	7063 6674 0000 0000 6f63 7970 6d20 6d65     cptf....copy mem
 800c2c0:	726f 2079 7562 6666 7265 7420 206f 6e69     ory buffer to in
 800c2d0:	6574 6e72 6c61 4620 616c 6873 6f20 2066     ternal Flash of 
 800c2e0:	6f43 7472 7865 4d2d 0033 0000               Cortex-M3...

0800c2ec <apbahb_presc_tbl.5364>:
	...
 800c2fc:	0001 0000 0002 0000 0003 0000 0004 0000     ................
 800c30c:	0001 0000 0002 0000 0003 0000 0004 0000     ................
 800c31c:	0006 0000 0007 0000 0008 0000 0009 0000     ................

0800c32c <__func__.5627>:
 800c32c:	6e65 6d76 775f 6972 6574 0000               envm_write..

0800c338 <flash_bsize>:
 800c338:	8000 0000 8000 0000 8000 0000 8000 0000     ................
 800c348:	0000 0002 0000 0004 0000 0004 0000 0004     ................

0800c358 <__func__.5588>:
 800c358:	7473 336d 5f32 6c66 7361 5f68 7265 7361     stm32_flash_eras
 800c368:	0065 0000 7325 203a 6441 7264 7365 2073     e...%s: Address 
 800c378:	2325 2078 7369 6e20 746f 6920 206e 6c66     %#x is not in fl
 800c388:	7361 2068 726f 7320 7a69 2065 6425 6920     ash or size %d i
 800c398:	2073 6f74 206f 6962 0a67 0000 7325 203a     s too big...%s: 
 800c3a8:	6c46 7361 2068 7369 6220 7375 0a79 0000     Flash is busy...
 800c3b8:	7325 203a 6441 7264 7365 2073 2325 2078     %s: Address %#x 
 800c3c8:	7369 6e20 746f 6220 6f6c 6b63 612d 696c     is not block-ali
 800c3d8:	6e67 6465 000a 0000                         gned....

0800c3e0 <version_string>:
 800c3e0:	2d55 6f42 746f 3220 3130 2e30 3330 302d     U-Boot 2010.03-0
 800c3f0:	3030 3030 672d 6662 6339 3039 2063 4f28     0000-gbf9c90c (O
 800c400:	7463 3220 2037 3032 3731 2d20 3020 3a31     ct 27 2017 - 01:
 800c410:	3033 333a 2938 0000 5244 4d41 203a 0020     30:38)..DRAM:  .
 800c420:	0a0a 7325 0a0a 0000 6162 6475 6172 6574     ..%s....baudrate
 800c430:	0000 0000 2323 2023 5245 4f52 2052 2323     ....### ERROR ##
 800c440:	2023 6c50 6165 6573 5220 5345 5445 7420     # Please RESET t
 800c450:	6568 6220 616f 6472 2320 2323 000a 0000     he board ###....
 800c460:	7069 6461 7264 0000 6f6c 6461 6461 7264     ipaddr..loadaddr
 800c470:	0000 0000 6f62 746f 6966 656c 0000 0000     ....bootfile....
 800c480:	654e 3a74 2020 0020 c6a0 0800 c6a8 0800     Net:   .........
 800c490:	c6b0 0800 c6b8 0800 c6c0 0800 c6c8 0800     ................
 800c4a0:	c6d0 0800 c6d8 0800 c6e0 0800 c6e8 0800     ................
 800c4b0:	c6f0 0800 c6f8 0800 c700 0800 c708 0800     ................
 800c4c0:	c710 0800 c718 0800 c720 0800 c728 0800     ........ ...(...
 800c4d0:	c730 0800 c738 0800 c740 0800 c748 0800     0...8...@...H...
 800c4e0:	c750 0800 c758 0800 c760 0800 c768 0800     P...X...`...h...
 800c4f0:	c770 0800 c778 0800 c780 0800 c788 0800     p...x...........
 800c500:	c790 0800 c798 0800 6552 6573 7474 6e69     ........Resettin
 800c510:	2067 5043 2055 2e2e 0a2e 0000 6e6f 0000     g CPU ......on..
 800c520:	666f 0066 6370 3a20 5b20 253c 3830 786c     off.pc : [<%08lx
 800c530:	5d3e 2009 2020 726c 3a20 5b20 253c 3830     >].   lr : [<%08
 800c540:	786c 5d3e 730a 2070 203a 3025 6c38 2078     lx>].sp : %08lx 
 800c550:	6920 2070 203a 3025 6c38 0978 6620 2070      ip : %08lx. fp 
 800c560:	203a 3025 6c38 0a78 0000 0000 3172 3a30     : %08lx.....r10:
 800c570:	2520 3830 786c 2020 3972 3a20 2520 3830      %08lx  r9 : %08
 800c580:	786c 2009 3872 3a20 2520 3830 786c 000a     lx. r8 : %08lx..
 800c590:	3772 3a20 2520 3830 786c 2020 3672 3a20     r7 : %08lx  r6 :
 800c5a0:	2520 3830 786c 2009 3572 3a20 2520 3830      %08lx. r5 : %08
 800c5b0:	786c 2020 3472 3a20 2520 3830 786c 000a     lx  r4 : %08lx..
 800c5c0:	3372 3a20 2520 3830 786c 2020 3272 3a20     r3 : %08lx  r2 :
 800c5d0:	2520 3830 786c 2009 3172 3a20 2520 3830      %08lx. r1 : %08
 800c5e0:	786c 2020 3072 3a20 2520 3830 786c 000a     lx  r0 : %08lx..
 800c5f0:	6c46 6761 3a73 2520 2563 2563 2563 0063     Flags: %c%c%c%c.
 800c600:	2020 5249 7351 2520 2073 4620 5149 2073       IRQs %s  FIQs 
 800c610:	7325 2020 6f4d 6564 2520 2573 0a73 0000     %s  Mode %s%s...
 800c620:	6e75 6564 6966 656e 2064 6e69 7473 7572     undefined instru
 800c630:	7463 6f69 0a6e 0000 6f73 7466 6177 6572     ction...software
 800c640:	6920 746e 7265 7572 7470 000a 7270 6665      interrupt..pref
 800c650:	7465 6863 6120 6f62 7472 000a 6164 6174     etch abort..data
 800c660:	6120 6f62 7472 000a 6f6e 2074 7375 6465      abort..not used
 800c670:	000a 0000 6166 7473 6920 746e 7265 7572     ....fast interru
 800c680:	7470 7220 7165 6575 7473 000a 6e69 6574     pt request..inte
 800c690:	7272 7075 2074 6572 7571 7365 0a74 0000     rrupt request...
 800c6a0:	5355 5245 325f 0036 4946 5f51 3632 0000     USER_26.FIQ_26..
 800c6b0:	5249 5f51 3632 0000 5653 5f43 3632 0000     IRQ_26..SVC_26..
 800c6c0:	4b55 5f34 3632 0000 4b55 5f35 3632 0000     UK4_26..UK5_26..
 800c6d0:	4b55 5f36 3632 0000 4b55 5f37 3632 0000     UK6_26..UK7_26..
 800c6e0:	4b55 5f38 3632 0000 4b55 5f39 3632 0000     UK8_26..UK9_26..
 800c6f0:	4b55 3031 325f 0036 4b55 3131 325f 0036     UK10_26.UK11_26.
 800c700:	4b55 3231 325f 0036 4b55 3331 325f 0036     UK12_26.UK13_26.
 800c710:	4b55 3431 325f 0036 4b55 3531 325f 0036     UK14_26.UK15_26.
 800c720:	5355 5245 335f 0032 4946 5f51 3233 0000     USER_32.FIQ_32..
 800c730:	5249 5f51 3233 0000 5653 5f43 3233 0000     IRQ_32..SVC_32..
 800c740:	4b55 5f34 3233 0000 4b55 5f35 3233 0000     UK4_32..UK5_32..
 800c750:	4b55 5f36 3233 0000 4241 5f54 3233 0000     UK6_32..ABT_32..
 800c760:	4b55 5f38 3233 0000 4b55 5f39 3233 0000     UK8_32..UK9_32..
 800c770:	4b55 3031 335f 0032 4e55 5f44 3233 0000     UK10_32.UND_32..
 800c780:	4b55 3231 335f 0032 4b55 3331 335f 0032     UK12_32.UK13_32.
 800c790:	4b55 3431 335f 0032 5953 5f53 3233 0000     UK14_32.SYS_32..
	...
 800c7a8:	7025 004d 7465 2568 6164 6464 0072 0000     %pM.eth%daddr...
 800c7b8:	7465 6168 6464 0072 7465 6168 7463 0000     ethaddr.ethact..
 800c7c8:	6f4e 6520 6874 7265 656e 2074 6f66 6e75     No ethernet foun
 800c7d8:	2e64 000a 7465 7068 6972 656d 0000 0000     d...ethprime....
 800c7e8:	202c 0000 5b20 5250 4d49 5d45 0000 0000     , .. [PRIME]....
 800c7f8:	570a 7261 696e 676e 203a 7325 4d20 4341     .Warning: %s MAC
 800c808:	6120 6464 6572 7373 7365 6420 6e6f 7427      addresses don't
 800c818:	6d20 7461 6863 0a3a 0000 0000 6441 7264      match:.....Addr
 800c828:	7365 2073 6e69 5320 4f52 204d 7369 2020     ess in SROM is  
 800c838:	2020 2020 2020 2520 4d70 000a 6441 7264            %pM..Addr
 800c848:	7365 2073 6e69 6520 766e 7269 6e6f 656d     ess in environme
 800c858:	746e 6920 2073 2520 4d70 000a 7465 7268     nt is  %pM..ethr
 800c868:	746f 7461 0065 0000 6f6e 0000 6e75 6e6b     otate...no..unkn
 800c878:	776f 006e 0000 0000 0000 0000 656e 7274     own.........netr
 800c888:	7465 7972 0000 0000 6579 0073 6e6f 6563     etry....yes.once
 800c898:	0000 0000 2323 5720 7261 696e 676e 203a     ....## Warning: 
 800c8a8:	6167 6574 6177 6979 2070 656e 6465 6465     gatewayip needed
 800c8b8:	6220 7475 6e20 746f 7320 7465 000a 0000      but not set....
 800c8c8:	410a 5052 5220 7465 7972 6320 756f 746e     .ARP Retry count
 800c8d8:	6520 6378 6565 6564 3b64 7320 6174 7472      exceeded; start
 800c8e8:	6e69 2067 6761 6961 0a6e 0000 6162 2064     ing again...bad 
 800c8f8:	656c 676e 6874 2520 2064 203c 6425 000a     length %d < %d..
 800c908:	6e69 6176 696c 2064 4152 5052 6820 6165     invalid RARP hea
 800c918:	6564 0a72 0000 0000 656c 206e 6162 2064     der.....len bad 
 800c928:	6425 3c20 2520 0a64 0000 0000 6863 6365     %d < %d.....chec
 800c938:	736b 6d75 6220 6461 000a 0000 4920 4d43     ksum bad.... ICM
 800c948:	2050 6f48 7473 5220 6465 7269 6365 2074     P Host Redirect 
 800c958:	6f74 2520 4970 2034 0000 0000 6425 252e     to %pI4 ....%d.%
 800c968:	2e64 6425 252e 0064 6f6e 656e 0000 0000     d.%d.%d.none....
 800c978:	6425 0000 6167 6574 6177 6979 0070 0000     %d..gatewayip...
 800c988:	656e 6d74 7361 006b 6573 7672 7265 7069     netmask.serverip
 800c998:	0000 0000 766e 616c 006e 0000 6c76 6e61     ....nvlan...vlan
 800c9a8:	0000 0000 2a2a 202a 5245 4f52 3a52 6020     ....*** ERROR: `
 800c9b8:	6573 7672 7265 7069 2027 6f6e 2074 6573     serverip' not se
 800c9c8:	0a74 0000 2a2a 202a 5245 4f52 3a52 6020     t...*** ERROR: `
 800c9d8:	7069 6461 7264 2027 6f6e 2074 6573 0a74     ipaddr' not set.
 800c9e8:	0000 0000 2a2a 202a 5245 4f52 3a52 4e20     ....*** ERROR: N
 800c9f8:	206f 7465 6568 6e72 7465 6620 756f 646e     o ethernet found
 800ca08:	0a2e 0000 2a2a 202a 5245 4f52 3a52 6020     ....*** ERROR: `
 800ca18:	7465 6168 6464 2772 6e20 746f 7320 7465     ethaddr' not set
 800ca28:	000a 0000 2a2a 202a 5245 4f52 3a52 6020     ....*** ERROR: `
 800ca38:	7465 2568 6164 6464 2772 6e20 746f 7320     eth%daddr' not s
 800ca48:	7465 000a 410a 6f62 7472 000a 7942 6574     et...Abort..Byte
 800ca58:	2073 7274 6e61 6673 7265 6572 2064 203d     s transferred = 
 800ca68:	6c25 2064 2528 786c 6820 7865 0a29 0000     %ld (%lx hex)...
 800ca78:	6c25 0058 6966 656c 6973 657a 0000 0000     %lX.filesize....
 800ca88:	6966 656c 6461 7264 0000 0000 7561 6f74     fileaddr....auto
 800ca98:	6f6c 6461 0000 0000 4152 5052 6220 6f72     load....RARP bro
 800caa8:	6461 6163 7473 2520 0a64 0000 520a 7465     adcast %d....Ret
 800cab8:	7972 6320 756f 746e 6520 6378 6565 6564     ry count exceede
 800cac8:	3b64 7320 6174 7472 6e69 2067 6761 6961     d; starting agai
 800cad8:	0a6e 0000 636f 6574 0074 0000 6c25 0075     n...octet...%lu.
 800cae8:	6c62 736b 7a69 2565 2563 2564 0063 0000     blksize%c%d%c...
 800caf8:	6946 656c 7420 6f6f 6c20 7261 6567 0000     File too large..
 800cb08:	6946 656c 6820 7361 6220 6461 6d20 6761     File has bad mag
 800cb18:	6369 0000 6c62 736b 7a69 0065 090a 2520     ic..blksize... %
 800cb28:	756c 4d20 2042 6572 6563 7669 6465 090a     lu MB received..
 800cb38:	0020 0000 090a 0020 540a 5446 2050 7265      ..... ..TFTP er
 800cb48:	6f72 3a72 4620 7269 7473 6220 6f6c 6b63     ror: First block
 800cb58:	6920 2073 6f6e 2074 6c62 636f 206b 2031      is not block 1 
 800cb68:	2528 646c 0a29 7453 7261 6974 676e 6120     (%ld).Starting a
 800cb78:	6167 6e69 0a0a 0000 640a 6e6f 0a65 0000     gain.....done...
 800cb88:	540a 5446 2050 7265 6f72 3a72 2720 7325     .TFTP error: '%s
 800cb98:	2027 2528 2964 000a 6f4e 2074 6572 7274     ' (%d)..Not retr
 800cba8:	6979 676e 2e2e 0a2e 0000 0000 7453 7261     ying........Star
 800cbb8:	6974 676e 6120 6167 6e69 0a0a 0000 0000     ting again......
 800cbc8:	2054 0000 6674 7074 6c62 636f 736b 7a69     T ..tftpblocksiz
 800cbd8:	0065 0000 6674 7074 6974 656d 756f 0074     e...tftptimeout.
 800cbe8:	4654 5054 7420 6d69 6f65 7475 2820 6c25     TFTP timeout (%l
 800cbf8:	2064 736d 2029 6f74 206f 6f6c 2c77 7320     d ms) too low, s
 800cc08:	7465 6d20 6e69 6d69 6d75 3d20 3120 3030     et minimum = 100
 800cc18:	2030 736d 000a 0000 3025 6c32 2558 3230     0 ms....%02lX%02
 800cc28:	586c 3025 6c32 2558 3230 586c 692e 676d     lX%02lX%02lX.img
 800cc38:	0000 0000 2a2a 202a 6157 6e72 6e69 3a67     ....*** Warning:
 800cc48:	6e20 206f 6f62 746f 6620 6c69 2065 616e      no boot file na
 800cc58:	656d 203b 7375 6e69 2067 2527 2773 000a     me; using '%s'..
 800cc68:	7355 6e69 2067 7325 6420 7665 6369 0a65     Using %s device.
 800cc78:	0000 0000 4654 5054 6620 6f72 206d 6573     ....TFTP from se
 800cc88:	7672 7265 2520 4970 3b34 6f20 7275 4920     rver %pI4; our I
 800cc98:	2050 6461 7264 7365 2073 7369 2520 4970     P address is %pI
 800cca8:	0034 0000 203b 6573 646e 6e69 2067 6874     4...; sending th
 800ccb8:	6f72 6775 2068 6167 6574 6177 2079 7025     rough gateway %p
 800ccc8:	3449 0000 6946 656c 616e 656d 2720 7325     I4..Filename '%s
 800ccd8:	2e27 0000 5320 7a69 2065 7369 3020 2578     '... Size is 0x%
 800cce8:	2078 7942 6574 2073 203d 0000 6f4c 6461     x Bytes = ..Load
 800ccf8:	6120 6464 6572 7373 203a 7830 6c25 0a78      address: 0x%lx.
 800cd08:	0000 0000 6f4c 6461 6e69 3a67 2a20 0008     ....Loading: *..
 800cd18:	6f48 7473 4e20 6d61 0065 0000 2a2a 202a     Host Name...*** 
 800cd28:	4157 4e52 4e49 3a47 2520 2073 7369 7420     WARNING: %s is t
 800cd38:	6f6f 6c20 6e6f 2067 2528 2064 202d 616d     oo long (%d - ma
 800cd48:	3a78 2520 2964 2d20 7420 7572 636e 7461     x: %d) - truncat
 800cd58:	6465 000a 6f52 746f 5020 7461 0068 0000     ed..Root Path...
 800cd68:	494e 2053 6f44 616d 6e69 4e20 6d61 0065     NIS Domain Name.
 800cd78:	4f42 544f 2050 7262 616f 6364 7361 2074     BOOTP broadcast 
 800cd88:	6425 000a 6e28 746f 7320 7465 0029 0000     %d..(not set)...
 800cd98:	7261 6863 6e5f 6d75 6562 0072 2d25 3231     arch_number.%-12
 800cda8:	3d73 3020 2578 3830 586c 000a 6e65 5f76     s= 0x%08lX..env_
 800cdb8:	0074 0000 6f62 746f 705f 7261 6d61 0073     t...boot_params.
 800cdc8:	5244 4d41 6220 6e61 006b 0000 3e2d 7320     DRAM bank...-> s
 800cdd8:	6174 7472 0000 0000 3e2d 7320 7a69 0065     tart....-> size.
 800cde8:	2d25 3231 3d73 2520 0a73 0000 7069 615f     %-12s= %s...ip_a
 800cdf8:	6464 2072 2020 2020 203d 7025 3449 000a     ddr     = %pI4..
 800ce08:	6162 6475 6172 6574 2020 2020 203d 6425     baudrate    = %d
 800ce18:	6220 7370 000a 0000 6462 6e69 6f66 0000      bps....bdinfo..
 800ce28:	7270 6e69 2074 6f42 7261 2064 6e49 6f66     print Board Info
 800ce38:	7320 7274 6375 7574 6572 0000 2323 5320      structure..## S
 800ce48:	6174 7472 6e69 2067 7061 6c70 6369 7461     tarting applicat
 800ce58:	6f69 206e 7461 3020 2578 3830 586c 2e20     ion at 0x%08lX .
 800ce68:	2e2e 000a 2323 4120 7070 696c 6163 6974     ....## Applicati
 800ce78:	6e6f 7420 7265 696d 616e 6574 2c64 7220     on terminated, r
 800ce88:	2063 203d 7830 6c25 0a58 0000 6572 6573     c = 0x%lX...rese
 800ce98:	0074 0000 6550 6672 726f 206d 4552 4553     t...Perform RESE
 800cea8:	2054 666f 7420 6568 4320 5550 0000 0000     T of the CPU....
 800ceb8:	6f67 0000 7473 7261 2074 7061 6c70 6369     go..start applic
 800cec8:	7461 6f69 206e 7461 6120 6464 6572 7373     ation at address
 800ced8:	2720 6461 7264 0027                          'addr'.

0800cee0 <boot_os>:
	...
 800cee8:	2fd9 0800 0000 0000 0000 0000 b3b5 0800     ./..............
	...
 800cf28:	2fad 0800 2323 5420 6172 736e 6566 7272     ./..## Transferr
 800cf38:	6e69 2067 6f63 746e 6f72 206c 6f74 5220     ing control to R
 800cf48:	4554 534d 2820 7461 6120 6464 6572 7373     TEMS (at address
 800cf58:	2520 3830 786c 2029 2e2e 0a2e 0000 0000      %08lx) ........
 800cf68:	6f62 746f 7261 7367 0000 0000 2323 5420     bootargs....## T
 800cf78:	6172 736e 6566 7272 6e69 2067 6f63 746e     ransferring cont
 800cf88:	6f72 206c 6f74 4e20 7465 5342 2044 7473     rol to NetBSD st
 800cf98:	6761 2d65 2032 6f6c 6461 7265 2820 7461     age-2 loader (at
 800cfa8:	6120 6464 6572 7373 2520 3830 786c 2029      address %08lx) 
 800cfb8:	2e2e 0a2e 0000 0000 2020 5820 5049 2520     ........   XIP %
 800cfc8:	2073 2e2e 202e 0000 2020 4c20 616f 6964     s ... ..   Loadi
 800cfd8:	676e 2520 2073 2e2e 202e 0000 4b4f 000a     ng %s ... ..OK..
 800cfe8:	2020 5520 636e 6d6f 7270 7365 6973 676e        Uncompressing
 800cff8:	2520 2073 2e2e 202e 0000 0000 5547 5a4e      %s ... ....GUNZ
 800d008:	5049 203a 6e75 6f63 706d 6572 7373 202c     IP: uncompress, 
 800d018:	756f 2d74 666f 6d2d 6d65 6f20 2072 766f     out-of-mem or ov
 800d028:	7265 7277 7469 2065 7265 6f72 2072 202d     erwrite error - 
 800d038:	756d 7473 5220 5345 5445 6220 616f 6472     must RESET board
 800d048:	7420 206f 6572 6f63 6576 0a72 0000 0000      to recover.....
 800d058:	6e55 6d69 6c70 6d65 6e65 6574 2064 6f63     Unimplemented co
 800d068:	706d 6572 7373 6f69 206e 7974 6570 2520     mpression type %
 800d078:	0a64 0000 6576 6972 7966 0000 2323 4220     d...verify..## B
 800d088:	6f6f 6974 676e 6b20 7265 656e 206c 7266     ooting kernel fr
 800d098:	6d6f 4c20 6765 6361 2079 6d49 6761 2065     om Legacy Image 
 800d0a8:	7461 2520 3830 786c 2e20 2e2e 000a 0000     at %08lx .......
 800d0b8:	6142 2064 614d 6967 2063 754e 626d 7265     Bad Magic Number
 800d0c8:	000a 0000 6142 2064 6548 6461 7265 4320     ....Bad Header C
 800d0d8:	6568 6b63 7573 0a6d 0000 0000 2020 5620     hecksum.....   V
 800d0e8:	7265 6669 6979 676e 4320 6568 6b63 7573     erifying Checksu
 800d0f8:	206d 2e2e 202e 0000 6142 2064 6144 6174     m ... ..Bad Data
 800d108:	4320 4352 000a 0000 7257 6e6f 2067 6d49      CRC....Wrong Im
 800d118:	6761 2065 7954 6570 6620 726f 2520 2073     age Type for %s 
 800d128:	6f63 6d6d 6e61 0a64 0000 0000 7257 6e6f     command.....Wron
 800d138:	2067 6d49 6761 2065 6f46 6d72 7461 6620     g Image Format f
 800d148:	726f 2520 2073 6f63 6d6d 6e61 0a64 0000     or %s command...
 800d158:	5245 4f52 3a52 6320 6e61 7427 6720 7465     ERROR: can't get
 800d168:	6b20 7265 656e 206c 6d69 6761 2165 000a      kernel image!..
 800d178:	5245 4f52 3a52 7520 6b6e 6f6e 6e77 6920     ERROR: unknown i
 800d188:	616d 6567 6620 726f 616d 2074 7974 6570     mage format type
 800d198:	0a21 0000 6f43 6c75 2064 6f6e 2074 6966     !...Could not fi
 800d1a8:	646e 6b20 7265 656e 206c 6e65 7274 2079     nd kernel entry 
 800d1b8:	6f70 6e69 2174 000a 6152 646d 7369 206b     point!..Ramdisk 
 800d1c8:	6d69 6761 2065 7369 6320 726f 7572 7470     image is corrupt
 800d1d8:	6f20 2072 6e69 6176 696c 0a64 0000 0000      or invalid.....
 800d1e8:	6e55 7573 7070 726f 6574 2064 7241 6863     Unsupported Arch
 800d1f8:	7469 6365 7574 6572 3020 2578 0a78 0000     itecture 0x%x...
 800d208:	7254 6979 676e 7420 206f 7865 6365 7475     Trying to execut
 800d218:	2065 2061 6f63 6d6d 6e61 2064 756f 2074     e a command out 
 800d228:	666f 6f20 6472 7265 000a 0000 6c25 0078     of order....%lx.
 800d238:	6e69 7469 6472 735f 6174 7472 0000 0000     initrd_start....
 800d248:	6e69 7469 6472 655f 646e 0000 6d63 6c64     initrd_end..cmdl
 800d258:	6e69 2065 7573 6362 6d6f 616d 646e 6e20     ine subcommand n
 800d268:	746f 7320 7075 6f70 7472 6465 000a 0000     ot supported....
 800d278:	6462 2074 7573 6362 6d6f 616d 646e 6e20     bdt subcommand n
 800d288:	746f 7320 7075 6f70 7472 6465 000a 0000     ot supported....
 800d298:	7270 7065 7320 6275 6f63 6d6d 6e61 2064     prep subcommand 
 800d2a8:	6f6e 2074 7573 7070 726f 6574 0a64 0000     not supported...
 800d2b8:	4157 4e52 4e49 3a47 6c20 6765 6361 2079     WARNING: legacy 
 800d2c8:	6f66 6d72 7461 6d20 6c75 6974 6320 6d6f     format multi com
 800d2d8:	6f70 656e 746e 6920 616d 6567 6f20 6576     ponent image ove
 800d2e8:	7772 6972 7474 6e65 000a 0000 5245 4f52     rwritten....ERRO
 800d2f8:	3a52 6e20 7765 6620 726f 616d 2074 6d69     R: new format im
 800d308:	6761 2065 766f 7265 7277 7469 6574 206e     age overwritten 
 800d318:	202d 756d 7473 5220 5345 5445 7420 6568     - must RESET the
 800d328:	6220 616f 6472 7420 206f 6572 6f63 6576      board to recove
 800d338:	0a72 0000 7561 6f74 7473 7261 0074 0000     r...autostart...
 800d348:	5245 4f52 3a52 6220 6f6f 6974 676e 6f20     ERROR: booting o
 800d358:	2073 2527 2773 2820 6425 2029 7369 6e20     s '%s' (%d) is n
 800d368:	746f 7320 7075 6f70 7472 6465 000a 0000     ot supported....
 800d378:	6f62 746f 006d 0000 6f62 746f 6120 7070     bootm...boot app
 800d388:	696c 6163 6974 6e6f 6920 616d 6567 6620     lication image f
 800d398:	6f72 206d 656d 6f6d 7972 0000 6f6c 6461     rom memory..load
 800d3a8:	736f 0000 6172 646d 7369 006b 6d63 6c64     os..ramdisk.cmdl
 800d3b8:	6e69 0065 6462 0074 7270 7065 0000 0000     ine.bdt.prep....
 800d3c8:	003f 0000 6c61 6169 2073 6f66 2072 6827     ?...alias for 'h
 800d3d8:	6c65 2770 0000 0000 6568 706c 0000 0000     elp'....help....
 800d3e8:	7270 6e69 2074 6f63 6d6d 6e61 2064 6564     print command de
 800d3f8:	6373 6972 7470 6f69 2f6e 7375 6761 0065     scription/usage.
 800d408:	2323 5420 746f 6c61 5320 7a69 2065 2020     ## Total Size   
 800d418:	2020 3d20 3020 2578 3830 2078 203d 6425        = 0x%08x = %d
 800d428:	4220 7479 7365 000a 5825 0000 2323 5320      Bytes..%X..## S
 800d438:	6977 6374 2068 6162 6475 6172 6574 7420     witch baudrate t
 800d448:	206f 6425 6220 7370 6120 646e 7020 6572     o %d bps and pre
 800d458:	7373 4520 544e 5245 2e20 2e2e 000a 0000     ss ENTER .......
 800d468:	6f6c 6461 0079 0000 2323 5220 6165 7964     loady...## Ready
 800d478:	6620 726f 6220 6e69 7261 2079 7928 6f6d      for binary (ymo
 800d488:	6564 296d 6420 776f 6c6e 616f 2064 6f74     dem) download to
 800d498:	3020 2578 3830 586c 6120 2074 6425 6220      0x%08lX at %d b
 800d4a8:	7370 2e2e 0a2e 0000 2323 5220 6165 7964     ps......## Ready
 800d4b8:	6620 726f 6220 6e69 7261 2079 6b28 7265      for binary (ker
 800d4c8:	696d 2974 6420 776f 6c6e 616f 2064 6f74     mit) download to
 800d4d8:	3020 2578 3830 586c 6120 2074 6425 6220      0x%08lX at %d b
 800d4e8:	7370 2e2e 0a2e 0000 2323 4220 6e69 7261     ps......## Binar
 800d4f8:	2079 6b28 7265 696d 2974 6420 776f 6c6e     y (kermit) downl
 800d508:	616f 2064 6261 726f 6574 0a64 0000 0000     oad aborted.....
 800d518:	2323 5320 6174 7472 4120 6464 2072 2020     ## Start Addr   
 800d528:	2020 3d20 3020 2578 3830 586c 000a 0000        = 0x%08lX....
 800d538:	2323 5320 6977 6374 2068 6162 6475 6172     ## Switch baudra
 800d548:	6574 7420 206f 6425 6220 7370 6120 646e     te to %d bps and
 800d558:	7020 6572 7373 4520 4353 2e20 2e2e 000a      press ESC .....
 800d568:	6f6c 6461 6220 6e69 7261 2079 6966 656c     load binary file
 800d578:	6f20 6576 2072 6573 6972 6c61 6c20 6e69      over serial lin
 800d588:	2065 7928 6f6d 6564 206d 6f6d 6564 0029     e (ymodem mode).
 800d598:	6f6c 6461 0062 0000 6f6c 6461 6220 6e69     loadb...load bin
 800d5a8:	7261 2079 6966 656c 6f20 6576 2072 6573     ary file over se
 800d5b8:	6972 6c61 6c20 6e69 2065 6b28 7265 696d     rial line (kermi
 800d5c8:	2074 6f6d 6564 0029 6142 6573 4120 6464     t mode).Base Add
 800d5d8:	6572 7373 203a 7830 3025 6c38 0a78 0000     ress: 0x%08lx...
 800d5e8:	6554 7473 6465 2520 2064 7469 7265 7461     Tested %d iterat
 800d5f8:	6f69 286e 2973 7720 7469 2068 6c25 2075     ion(s) with %lu 
 800d608:	7265 6f72 7372 0a2e 0000 0000 500d 7461     errors.......Pat
 800d618:	6574 6e72 2520 3830 586c 2020 7257 7469     tern %08lX  Writ
 800d628:	6e69 2e67 2e2e 3125 7332 0808 0808 0808     ing...%12s......
 800d638:	0808 0808 0000 0000 4d0a 6d65 6520 7272     .........Mem err
 800d648:	726f 4020 3020 2578 3830 3a58 6620 756f     or @ 0x%08X: fou
 800d658:	646e 2520 3830 586c 202c 7865 6570 7463     nd %08lX, expect
 800d668:	6465 2520 3830 586c 000a 0000 6552 6461     ed %08lX....Read
 800d678:	6e69 2e67 2e2e 0000 6168 666c 6f77 6472     ing.....halfword
 800d688:	0000 0000 7962 6574 0000 0000 6f77 6472     ....byte....word
 800d698:	6120 2074 7830 3025 6c38 2078 3028 2578      at 0x%08lx (0x%
 800d6a8:	3830 786c 2029 3d21 7720 726f 2064 7461     08lx) != word at
 800d6b8:	3020 2578 3830 786c 2820 7830 3025 6c38      0x%08lx (0x%08l
 800d6c8:	2978 000a 6168 666c 6f77 6472 6120 2074     x)..halfword at 
 800d6d8:	7830 3025 6c38 2078 3028 2578 3430 2978     0x%08lx (0x%04x)
 800d6e8:	2120 203d 6168 666c 6f77 6472 6120 2074      != halfword at 
 800d6f8:	7830 3025 6c38 2078 3028 2578 3430 2978     0x%08lx (0x%04x)
 800d708:	000a 0000 7962 6574 6120 2074 7830 3025     ....byte at 0x%0
 800d718:	6c38 2078 3028 2578 3230 2978 2120 203d     8lx (0x%02x) != 
 800d728:	7962 6574 6120 2074 7830 3025 6c38 2078     byte at 0x%08lx 
 800d738:	3028 2578 3230 2978 000a 0000 6f54 6174     (0x%02x)....Tota
 800d748:	206c 666f 2520 646c 2520 2573 2073 6577     l of %ld %s%s we
 800d758:	6572 7420 6568 7320 6d61 0a65 0000 0000     re the same.....
 800d768:	3025 6c38 3a78 0000 2520 3830 0078 0000     %08lx:.. %08x...
 800d778:	2520 3430 0078 0000 2520 3230 0078 0000      %04x... %02x...
 800d788:	3f20 0020 655a 6f72 6c20 6e65 7467 2068      ? .Zero length 
 800d798:	3f3f 0a3f 0000 0000 6143 6e6e 746f 6320     ???.....Cannot c
 800d7a8:	706f 2079 7266 6d6f 4520 564e 204d 6f74     opy from ENVM to
 800d7b8:	4520 564e 2c4d 6120 6f62 7472 6e69 2e67      ENVM, aborting.
 800d7c8:	0d0a 0000 6143 6e6e 746f 6320 706f 2079     ....Cannot copy 
 800d7d8:	6361 6f72 7373 4520 564e 204d 6f62 6e75     across ENVM boun
 800d7e8:	6164 6972 7365 202c 6261 726f 6974 676e     daries, aborting
 800d7f8:	0a2e 000d 5243 3343 2032 6f66 2072 3025     ....CRC32 for %0
 800d808:	6c38 2078 2e2e 202e 3025 6c38 2078 3d3d     8lx ... %08lx ==
 800d818:	203e 3025 6c38 0a78 0000 0000 746d 7365     > %08lx.....mtes
 800d828:	0074 0000 6973 706d 656c 5220 4d41 7220     t...simple RAM r
 800d838:	6165 2f64 7277 7469 2065 6574 7473 0000     ead/write test..
 800d848:	6f6c 706f 0000 0000 6e69 6966 696e 6574     loop....infinite
 800d858:	6c20 6f6f 2070 6e6f 6120 6464 6572 7373      loop on address
 800d868:	7220 6e61 6567 0000 6162 6573 0000 0000      range..base....
 800d878:	7270 6e69 2074 726f 7320 7465 6120 6464     print or set add
 800d888:	6572 7373 6f20 6666 6573 0074 7263 3363     ress offset.crc3
 800d898:	0032 0000 6863 6365 736b 6d75 6320 6c61     2...checksum cal
 800d8a8:	7563 616c 6974 6e6f 0000 0000 6d63 0070     culation....cmp.
 800d8b8:	656d 6f6d 7972 6320 6d6f 6170 6572 0000     memory compare..
 800d8c8:	7063 0000 656d 6f6d 7972 6320 706f 0079     cp..memory copy.
 800d8d8:	776d 0000 656d 6f6d 7972 7720 6972 6574     mw..memory write
 800d8e8:	2820 6966 6c6c 0029 6d6e 0000 656d 6f6d      (fill).nm..memo
 800d8f8:	7972 6d20 646f 6669 2079 6328 6e6f 7473     ry modify (const
 800d908:	6e61 2074 6461 7264 7365 2973 0000 0000     ant address)....
 800d918:	6d6d 0000 656d 6f6d 7972 6d20 646f 6669     mm..memory modif
 800d928:	2079 6128 7475 2d6f 6e69 7263 6d65 6e65     y (auto-incremen
 800d938:	6974 676e 6120 6464 6572 7373 0029 0000     ting address)...
 800d948:	646d 0000 656d 6f6d 7972 6420 7369 6c70     md..memory displ
 800d958:	7961 0000 6f68 7473 616e 656d 0000 0000     ay..hostname....
 800d968:	6f72 746f 6170 6874 0000 0000 6e64 6973     rootpath....dnsi
 800d978:	0070 0000 6f64 616d 6e69 0000 7541 6f74     p...domain..Auto
 800d988:	616d 6974 2063 6f62 746f 6f20 2066 6d69     matic boot of im
 800d998:	6761 2065 7461 6120 6464 2072 7830 3025     age at addr 0x%0
 800d9a8:	6c38 2058 2e2e 0a2e 0000 0000 6172 7072     8lX ........rarp
 800d9b8:	6f62 746f 0000 0000 6f62 746f 6920 616d     boot....boot ima
 800d9c8:	6567 7620 6169 6e20 7465 6f77 6b72 7520     ge via network u
 800d9d8:	6973 676e 5220 5241 2f50 4654 5054 7020     sing RARP/TFTP p
 800d9e8:	6f72 6f74 6f63 006c 6674 7074 6f62 746f     rotocol.tftpboot
 800d9f8:	0000 0000 6f62 746f 6920 616d 6567 7620     ....boot image v
 800da08:	6169 6e20 7465 6f77 6b72 7520 6973 676e     ia network using
 800da18:	5420 5446 2050 7270 746f 636f 6c6f 0000      TFTP protocol..
 800da28:	6f62 746f 0070 0000 6f62 746f 6920 616d     bootp...boot ima
 800da38:	6567 7620 6169 6e20 7465 6f77 6b72 7520     ge via network u
 800da48:	6973 676e 4220 4f4f 5054 542f 5446 2050     sing BOOTP/TFTP 
 800da58:	7270 746f 636f 6c6f 0000 0000 6153 6976     protocol....Savi
 800da68:	676e 4520 766e 7269 6e6f 656d 746e 7420     ng Environment t
 800da78:	206f 7325 2e2e 0a2e 0000 0000 450a 766e     o %s.........Env
 800da88:	7269 6e6f 656d 746e 7320 7a69 3a65 2520     ironment size: %
 800da98:	2f64 6c25 2064 7962 6574 0a73 0000 0000     d/%ld bytes.....
 800daa8:	2323 4520 7272 726f 203a 2522 2273 6e20     ## Error: "%s" n
 800dab8:	746f 6420 6665 6e69 6465 000a 2323 4520     ot defined..## E
 800dac8:	7272 726f 203a 6c69 656c 6167 206c 6863     rror: illegal ch
 800dad8:	7261 6361 6574 2072 3d27 2027 6e69 7620     aracter '=' in v
 800dae8:	7261 6169 6c62 2065 616e 656d 2220 7325     ariable name "%s
 800daf8:	0a22 0000 7473 6964 006e 0000 7473 6f64     "...stdin...stdo
 800db08:	7475 0000 7473 6564 7272 0000 6143 276e     ut..stderr..Can'
 800db18:	2074 6564 656c 6574 2220 7325 0a22 0000     t delete "%s"...
 800db28:	2323 4220 7561 7264 7461 2065 6425 6220     ## Baudrate %d b
 800db38:	7370 6e20 746f 7320 7075 6f70 7472 6465     ps not supported
 800db48:	000a 0000 2323 4520 7272 726f 203a 6e65     ....## Error: en
 800db58:	6976 6f72 6d6e 6e65 2074 766f 7265 6c66     vironment overfl
 800db68:	776f 202c 2522 2273 6420 6c65 7465 6465     ow, "%s" deleted
 800db78:	000a 0000 6573 6574 766e 0000 7572 006e     ....setenv..run.
 800db88:	7572 206e 6f63 6d6d 6e61 7364 6920 206e     run commands in 
 800db98:	6e61 6520 766e 7269 6e6f 656d 746e 7620     an environment v
 800dba8:	7261 6169 6c62 0065 6573 2074 6e65 6976     ariable.set envi
 800dbb8:	6f72 6d6e 6e65 2074 6176 6972 6261 656c     ronment variable
 800dbc8:	0073 0000 7270 6e69 6574 766e 0000 0000     s...printenv....
 800dbd8:	7270 6e69 2074 6e65 6976 6f72 6d6e 6e65     print environmen
 800dbe8:	2074 6176 6972 6261 656c 0073 6173 6576     t variables.save
 800dbf8:	6e65 0076 6173 6576 6520 766e 7269 6e6f     env.save environ
 800dc08:	656d 746e 7620 7261 6169 6c62 7365 7420     ment variables t
 800dc18:	206f 6570 7372 7369 6574 746e 7320 6f74     o persistent sto
 800dc28:	6172 6567 0000 0000 250a 0a73 0000 0000     rage.....%s.....
 800dc38:	6576 7372 6f69 006e 7270 6e69 2074 6f6d     version.print mo
 800dc48:	696e 6f74 2072 6576 7372 6f69 006e 0000     nitor version...

0800dc58 <CSWTCH.19>:
 800dc58:	0001 0000 ffff ffff ffff ffff ffff ffff     ................
 800dc68:	ffff ffff ffff ffff ffff ffff ffff ffff     ................
 800dc78:	ffff ffff ffff ffff 0004 0000 ffff ffff     ................
 800dc88:	ffff ffff ffff ffff ffff ffff ffff ffff     ................
 800dc98:	ffff ffff fffe ffff ffff ffff ffff ffff     ................
 800dca8:	ffff ffff 0002 0000 2d25 732a 202d 7325     ........%-*s- %s
 800dcb8:	000a 0000 7325 2d20 2520 0a73 000a 0000     ....%s - %s.....
 800dcc8:	6e55 6e6b 776f 206e 6f63 6d6d 6e61 2064     Unknown command 
 800dcd8:	2527 2773 2d20 7420 7972 2720 6568 706c     '%s' - try 'help
 800dce8:	2027 6977 6874 756f 2074 7261 7567 656d     ' without argume
 800dcf8:	746e 2073 6f66 2072 696c 7473 6f20 2066     nts for list of 
 800dd08:	6c61 206c 6e6b 776f 206e 6f63 6d6d 6e61     all known comman
 800dd18:	7364 0a0a 0000 0000 6e49 203a 2020 0020     ds......In:    .
 800dd28:	6f4e 6920 706e 7475 6420 7665 6369 7365     No input devices
 800dd38:	6120 6176 6c69 6261 656c 0a21 0000 0000      available!.....
 800dd48:	754f 3a74 2020 0020 6f4e 6f20 7475 7570     Out:   .No outpu
 800dd58:	2074 6564 6976 6563 2073 7661 6961 616c     t devices availa
 800dd68:	6c62 2165 000a 0000 7245 3a72 2020 0020     ble!....Err:   .
 800dd78:	6f4e 6520 7272 726f 6420 7665 6369 7365     No error devices
 800dd88:	6120 6176 6c69 6261 656c 0a21 0000 0000      available!.....
 800dd98:	6573 6972 6c61 0000 2a2a 202a 6157 6e72     serial..*** Warn
 800dda8:	6e69 2067 202d 6162 2064 5243 2c43 7520     ing - bad CRC, u
 800ddb8:	6973 676e 6420 6665 7561 746c 6520 766e     sing default env
 800ddc8:	7269 6e6f 656d 746e 0a0a 0000 6e65 6d76     ironment....envm
 800ddd8:	0000 0000 6e55 6e6b 776f 206e 534f 0000     ....Unknown OS..
 800dde8:	6e55 6e6b 776f 206e 7241 6863 7469 6365     Unknown Architec
 800ddf8:	7574 6572 0000 0000 6e55 6e6b 776f 206e     ture....Unknown 
 800de08:	6d49 6761 0065 0000 6e55 6e6b 776f 206e     Image...Unknown 
 800de18:	6f43 706d 6572 7373 6f69 006e 7325 6d49     Compression.%sIm
 800de28:	6761 2065 614e 656d 203a 2020 2e25 732a     age Name:   %.*s
 800de38:	000a 0000 7325 6d49 6761 2065 7954 6570     ....%sImage Type
 800de48:	203a 2020 0000 0000 7325 2520 2073 7325     :   ....%s %s %s
 800de58:	2820 7325 0a29 0000 7325 6144 6174 5320      (%s)...%sData S
 800de68:	7a69 3a65 2020 2020 0000 0000 6425 4220     ize:    ....%d B
 800de78:	7479 7365 3d20 0020 7325 6f4c 6461 4120     ytes = .%sLoad A
 800de88:	6464 6572 7373 203a 3025 7838 000a 0000     ddress: %08x....
 800de98:	7325 6e45 7274 2079 6f50 6e69 3a74 2020     %sEntry Point:  
 800dea8:	3025 7838 000a 0000 7325 6f43 746e 6e65     %08x....%sConten
 800deb8:	7374 0a3a 0000 0000 7325 2020 4920 616d     ts:.....%s   Ima
 800dec8:	6567 2520 3a64 0020 7325 2020 2020 664f     ge %d: .%s    Of
 800ded8:	7366 7465 3d20 3020 2578 3830 786c 000a     fset = 0x%08lx..
 800dee8:	6f62 746f 5f6d 6f6c 0077 0000 6f62 746f     bootm_low...boot
 800def8:	5f6d 6973 657a 0000 5043 0055 002d 0000     m_size..CPU.-...
 800df08:	6f4e 4c20 6e69 7875 2520 2073 6152 646d     No Linux %s Ramd
 800df18:	7369 206b 6d49 6761 0a65 0000 2323 4c20     isk Image...## L
 800df28:	616f 6964 676e 6920 696e 2074 6152 646d     oading init Ramd
 800df38:	7369 206b 7266 6d6f 6d20 6c75 6974 6320     isk from multi c
 800df48:	6d6f 6f70 656e 746e 4c20 6765 6361 2079     omponent Legacy 
 800df58:	6d49 6761 2065 7461 2520 3830 786c 2e20     Image at %08lx .
 800df68:	2e2e 000a 7257 6e6f 2067 6152 646d 7369     ....Wrong Ramdis
 800df78:	206b 6d49 6761 2065 6f46 6d72 7461 000a     k Image Format..
 800df88:	2323 4c20 616f 6964 676e 6920 696e 2074     ## Loading init 
 800df98:	6152 646d 7369 206b 7266 6d6f 4c20 6765     Ramdisk from Leg
 800dfa8:	6361 2079 6d49 6761 2065 7461 2520 3830     acy Image at %08
 800dfb8:	786c 2e20 2e2e 000a 6e69 7469 6472 685f     lx .....initrd_h
 800dfc8:	6769 0068 6172 646d 7369 206b 202d 6c61     igh.ramdisk - al
 800dfd8:	6f6c 6163 6974 6e6f 6520 7272 726f 000a     location error..
 800dfe8:	2020 4c20 616f 6964 676e 5220 6d61 6964        Loading Ramdi
 800dff8:	6b73 7420 206f 3025 6c38 2c78 6520 646e     sk to %08lx, end
 800e008:	2520 3830 786c 2e20 2e2e 0020 6e75 6f63      %08lx ... .unco
 800e018:	706d 6572 7373 6465 0000 0000 7a62 7069     mpressed....bzip
 800e028:	0032 0000 7a62 7069 2032 6f63 706d 6572     2...bzip2 compre
 800e038:	7373 6465 0000 0000 7a67 7069 0000 0000     ssed....gzip....
 800e048:	7a67 7069 6320 6d6f 7270 7365 6573 0064     gzip compressed.
 800e058:	7a6c 616d 0000 0000 7a6c 616d 6320 6d6f     lzma....lzma com
 800e068:	7270 7365 6573 0064 7a6c 006f 7a6c 206f     pressed.lzo.lzo 
 800e078:	6f63 706d 6572 7373 6465 0000 6e49 6176     compressed..Inva
 800e088:	696c 2064 6d49 6761 0065 0000 6966 656c     lid Image...file
 800e098:	7973 7473 6d65 0000 6946 656c 7973 7473     system..Filesyst
 800e0a8:	6d65 4920 616d 6567 0000 0000 6966 6d72     em Image....firm
 800e0b8:	6177 6572 0000 0000 6946 6d72 6177 6572     ware....Firmware
 800e0c8:	0000 0000 656b 6e72 6c65 0000 654b 6e72     ....kernel..Kern
 800e0d8:	6c65 4920 616d 6567 0000 0000 756d 746c     el Image....mult
 800e0e8:	0069 0000 754d 746c 2d69 6946 656c 4920     i...Multi-File I
 800e0f8:	616d 6567 0000 0000 4152 444d 7369 206b     mage....RAMDisk 
 800e108:	6d49 6761 0065 0000 6373 6972 7470 0000     Image...script..
 800e118:	6353 6972 7470 0000 7473 6e61 6164 6f6c     Script..standalo
 800e128:	656e 0000 7453 6e61 6164 6f6c 656e 5020     ne..Standalone P
 800e138:	6f72 7267 6d61 0000 6c66 7461 645f 0074     rogram..flat_dt.
 800e148:	6c46 7461 4420 7665 6369 2065 7254 6565     Flat Device Tree
 800e158:	0000 0000 776b 6962 616d 6567 0000 0000     ....kwbimage....
 800e168:	694b 6b72 6f77 646f 4220 6f6f 2074 6d49     Kirkwood Boot Im
 800e178:	6761 0065 6d69 6978 616d 6567 0000 0000     age.imximage....
 800e188:	7246 6565 6373 6c61 2065 2e69 584d 4220     Freescale i.MX B
 800e198:	6f6f 2074 6d49 6761 0065 0000 6e49 6176     oot Image...Inva
 800e1a8:	696c 2064 534f 0000 696c 756e 0078 0000     lid OS..linux...
 800e1b8:	694c 756e 0078 0000 656e 6274 6473 0000     Linux...netbsd..
 800e1c8:	654e 4274 4453 0000 7472 6d65 0073 0000     NetBSD..rtems...
 800e1d8:	5452 4d45 0053 0000 2d75 6f62 746f 0000     RTEMS...u-boot..
 800e1e8:	2d55 6f42 746f 0000 6e49 6176 696c 2064     U-Boot..Invalid 
 800e1f8:	5241 4843 0000 0000 6c61 6870 0061 0000     ARCH....alpha...
 800e208:	6c41 6870 0061 0000 7261 006d 5241 004d     Alpha...arm.ARM.
 800e218:	3878 0036 6e49 6574 206c 3878 0036 0000     x86.Intel x86...
 800e228:	6169 3436 0000 0000 4149 3436 0000 0000     ia64....IA64....
 800e238:	366d 6b38 0000 0000 364d 4b38 0000 0000     m68k....M68K....
 800e248:	696d 7263 626f 616c 657a 0000 694d 7263     microblaze..Micr
 800e258:	426f 616c 657a 0000 696d 7370 0000 0000     oBlaze..mips....
 800e268:	494d 5350 0000 0000 696d 7370 3436 0000     MIPS....mips64..
 800e278:	494d 5350 3620 2034 6942 0074 696e 736f     MIPS 64 Bit.nios
 800e288:	0000 0000 494e 534f 0000 0000 696e 736f     ....NIOS....nios
 800e298:	0032 0000 494e 534f 4920 0049 6f70 6577     2...NIOS II.powe
 800e2a8:	7072 0063 6f50 6577 5072 0043 7070 0063     rpc.PowerPC.ppc.
 800e2b8:	3373 3039 0000 0000 4249 204d 3353 3039     s390....IBM S390
 800e2c8:	0000 0000 6873 0000 7553 6570 4872 0000     ....sh..SuperH..
 800e2d8:	7073 7261 0063 0000 5053 5241 0043 0000     sparc...SPARC...
 800e2e8:	7073 7261 3663 0034 5053 5241 2043 3436     sparc64.SPARC 64
 800e2f8:	4220 7469 0000 0000 6c62 6361 666b 6e69      Bit....blackfin
 800e308:	0000 0000 6c42 6361 666b 6e69 0000 0000     ....Blackfin....
 800e318:	7661 3372 0032 0000 5641 3352 0032 0000     avr32...AVR32...
 800e328:	0a0d 0000 2a2a 5420 6f6f 6d20 6e61 2079     ....** Too many 
 800e338:	7261 7367 2820 616d 2e78 2520 2964 2a20     args (max. %d) *
 800e348:	0a2a 0000 2323 4320 6d6f 616d 646e 7420     *...## Command t
 800e358:	6f6f 6c20 6e6f 2167 000a 0000 6e55 6e6b     oo long!....Unkn
 800e368:	776f 206e 6f63 6d6d 6e61 2064 2527 2773     own command '%s'
 800e378:	2d20 7420 7972 2720 6568 706c 0a27 0000      - try 'help'...
 800e388:	6f62 746f 6564 616c 0079 0000 6f62 746f     bootdelay...boot
 800e398:	6d63 0064 6948 2074 6e61 2079 656b 2079     cmd.Hit any key 
 800e3a8:	6f74 7320 6f74 2070 7561 6f74 6f62 746f     to stop autoboot
 800e3b8:	203a 3225 2064 0000 0808 2008 0030 0000     : %2d ..... 0...
 800e3c8:	0808 2508 6432 0020 5453 334d 4632 3637     ...%2d .STM32F76
 800e3d8:	4139 3e49 0020 0000 493c 544e 5245 5552     9AI> ...<INTERRU
 800e3e8:	5450 0a3e 0000 0000                         PT>.....

0800e3f0 <CSWTCH.32>:
 800e3f0:	e470 0800 e488 0800 e49c 0800 e4ac 0800     p...............
 800e400:	e4b8 0800 e4c4 0800 e4d0 0800 e4f0 0800     ................
 800e410:	5243 0043 6b43 7573 006d 0000 7978 4d7a     CRC.Cksum...xyzM
 800e420:	646f 6d65 2d20 2520 2073 6f6d 6564 202c     odem - %s mode, 
 800e430:	6425 5328 484f 2f29 6425 5328 5854 2f29     %d(SOH)/%d(STX)/
 800e440:	6425 4328 4e41 2029 6170 6b63 7465 2c73     %d(CAN) packets,
 800e450:	2520 2064 6572 7274 6569 0a73 0000 0000      %d retries.....
 800e460:	6e55 6e6b 776f 206e 7265 6f72 0072 0000     Unknown error...
 800e470:	6c42 636f 206b 6573 7571 6e65 6563 6520     Block sequence e
 800e480:	7272 726f 0000 0000 5243 2f43 6863 6365     rror....CRC/chec
 800e490:	736b 6d75 6520 7272 726f 0000 6e49 6176     ksum error..Inva
 800e4a0:	696c 2064 7266 6d61 6e69 0067 6143 636e     lid framing.Canc
 800e4b0:	6c65 656c 0064 0000 6e45 2064 666f 6620     elled...End of f
 800e4c0:	6c69 0065 6954 656d 2064 756f 0074 0000     ile.Timed out...
 800e4d0:	6f53 7272 2c79 7a20 6f4d 6564 206d 6f6e     Sorry, zModem no
 800e4e0:	2074 7661 6961 616c 6c62 2065 6579 0074     t available yet.
 800e4f0:	6143 276e 2074 6361 6563 7373 6620 6c69     Can't access fil
 800e500:	0065 0000                                   e...

0800e504 <ext_led_gpio>:
 800e504:	0300 0000                                   ....

0800e508 <psram_cre_gpio>:
 800e508:	0f06 0000 2e31 0041 6f42 7261 3a64 5320     ....1.A.Board: S
 800e518:	4d54 3233 3746 3936 4420 7369 6f63 6576     TM32F769 Discove
 800e528:	7972 5220 7665 2520 0a73 0000               ry Rev %s...

0800e534 <crc16_tab>:
 800e534:	0000 1021 2042 3063 4084 50a5 60c6 70e7     ..!.B c0.@.P.`.p
 800e544:	8108 9129 a14a b16b c18c d1ad e1ce f1ef     ..).J.k.........
 800e554:	1231 0210 3273 2252 52b5 4294 72f7 62d6     1...s2R".R.B.r.b
 800e564:	9339 8318 b37b a35a d3bd c39c f3ff e3de     9...{.Z.........
 800e574:	2462 3443 0420 1401 64e6 74c7 44a4 5485     b$C4 ....d.t.D.T
 800e584:	a56a b54b 8528 9509 e5ee f5cf c5ac d58d     j.K.(...........
 800e594:	3653 2672 1611 0630 76d7 66f6 5695 46b4     S6r&..0..v.f.V.F
 800e5a4:	b75b a77a 9719 8738 f7df e7fe d79d c7bc     [.z...8.........
 800e5b4:	48c4 58e5 6886 78a7 0840 1861 2802 3823     .H.X.h.x@.a..(#8
 800e5c4:	c9cc d9ed e98e f9af 8948 9969 a90a b92b     ........H.i...+.
 800e5d4:	5af5 4ad4 7ab7 6a96 1a71 0a50 3a33 2a12     .Z.J.z.jq.P.3:.*
 800e5e4:	dbfd cbdc fbbf eb9e 9b79 8b58 bb3b ab1a     ........y.X.;...
 800e5f4:	6ca6 7c87 4ce4 5cc5 2c22 3c03 0c60 1c41     .l.|.L.\",.<`.A.
 800e604:	edae fd8f cdec ddcd ad2a bd0b 8d68 9d49     ........*...h.I.
 800e614:	7e97 6eb6 5ed5 4ef4 3e13 2e32 1e51 0e70     .~.n.^.N.>2.Q.p.
 800e624:	ff9f efbe dfdd cffc bf1b af3a 9f59 8f78     ..........:.Y.x.
 800e634:	9188 81a9 b1ca a1eb d10c c12d f14e e16f     ..........-.N.o.
 800e644:	1080 00a1 30c2 20e3 5004 4025 7046 6067     .....0. .P%@Fpg`
 800e654:	83b9 9398 a3fb b3da c33d d31c e37f f35e     ........=.....^.
 800e664:	02b1 1290 22f3 32d2 4235 5214 6277 7256     .....".25B.RwbVr
 800e674:	b5ea a5cb 95a8 8589 f56e e54f d52c c50d     ........n.O.,...
 800e684:	34e2 24c3 14a0 0481 7466 6447 5424 4405     .4.$....ftGd$T.D
 800e694:	a7db b7fa 8799 97b8 e75f f77e c71d d73c     ........_.~...<.
 800e6a4:	26d3 36f2 0691 16b0 6657 7676 4615 5634     .&.6....Wfvv.F4V
 800e6b4:	d94c c96d f90e e92f 99c8 89e9 b98a a9ab     L.m.../.........
 800e6c4:	5844 4865 7806 6827 18c0 08e1 3882 28a3     DXeH.x'h.....8.(
 800e6d4:	cb7d db5c eb3f fb1e 8bf9 9bd8 abbb bb9a     }.\.?...........
 800e6e4:	4a75 5a54 6a37 7a16 0af1 1ad0 2ab3 3a92     uJTZ7j.z.....*.:
 800e6f4:	fd2e ed0f dd6c cd4d bdaa ad8b 9de8 8dc9     ....l.M.........
 800e704:	7c26 6c07 5c64 4c45 3ca2 2c83 1ce0 0cc1     &|.ld\EL.<.,....
 800e714:	ef1f ff3e cf5d df7c af9b bfba 8fd9 9ff8     ..>.].|.........
 800e724:	6e17 7e36 4e55 5e74 2e93 3eb2 0ed1 1ef0     .n6~UNt^...>....

0800e734 <crc_table>:
 800e734:	0000 0000 3096 7707 612c ee0e 51ba 9909     .....0.w,a...Q..
 800e744:	c419 076d f48f 706a a535 e963 95a3 9e64     ..m...jp5.c...d.
 800e754:	8832 0edb b8a4 79dc e91e e0d5 d988 97d2     2......y........
 800e764:	4c2b 09b6 7cbd 7eb1 2d07 e7b8 1d91 90bf     +L...|.~.-......
 800e774:	1064 1db7 20f2 6ab0 7148 f3b9 41de 84be     d.... .jHq...A..
 800e784:	d47d 1ada e4eb 6ddd b551 f4d4 85c7 83d3     }......mQ.......
 800e794:	9856 136c a8c0 646b f97a fd62 c9ec 8a65     V.l...kdz.b...e.
 800e7a4:	5c4f 1401 6cd9 6306 3d63 fa0f 0df5 8d08     O\...l.cc=......
 800e7b4:	20c8 3b6e 105e 4c69 41e4 d560 7172 a267     . n;^.iL.A`.rqg.
 800e7c4:	e4d1 3c03 d447 4b04 85fd d20d b56b a50a     ...<G..K....k...
 800e7d4:	a8fa 35b5 986c 42b2 c9d6 dbbb f940 acbc     ...5l..B....@...
 800e7e4:	6ce3 32d8 5c75 45df 0dcf dcd6 3d59 abd1     .l.2u\.E....Y=..
 800e7f4:	30ac 26d9 003a 51de 5180 c8d7 6116 bfd0     .0.&:..Q.Q...a..
 800e804:	f4b5 21b4 c423 56b3 9599 cfba a50f b8bd     ...!#..V........
 800e814:	b89e 2802 8808 5f05 d9b2 c60c e924 b10b     ...(..._....$...
 800e824:	7c87 2f6f 4c11 5868 1dab c161 2d3d b666     .|o/.LhX..a.=-f.
 800e834:	4190 76dc 7106 01db 20bc 98d2 102a efd5     .A.v.q... ..*...
 800e844:	8589 71b1 b51f 06b6 e4a5 9fbf d433 e8b8     ...q........3...
 800e854:	c9a2 7807 f934 0f00 a88e 9609 9818 e10e     ...x4...........
 800e864:	0dbb 7f6a 3d2d 086d 6c97 9164 5c01 e663     ..j.-=m..ld..\c.
 800e874:	51f4 6b6b 6162 1c6c 30d8 8565 004e f262     .Qkkbal..0e.N.b.
 800e884:	95ed 6c06 a57b 1b01 f4c1 8208 c457 f50f     ...l{.......W...
 800e894:	d9c6 65b0 e950 12b7 b8ea 8bbe 887c fcb9     ...eP.......|...
 800e8a4:	1ddf 62dd 2d49 15da 7cf3 8cd3 4c65 fbd4     ...bI-...|..eL..
 800e8b4:	6158 4db2 51ce 3ab5 0074 a3bc 30e2 d4bb     Xa.M.Q.:t....0..
 800e8c4:	a541 4adf 95d7 3dd8 c46d a4d1 f4fb d3d6     A..J...=m.......
 800e8d4:	e96a 4369 d9fc 346e 8846 ad67 b8d0 da60     j.iC..n4F.g...`.
 800e8e4:	2d73 4404 1de5 3303 4c5f aa0a 7cc9 dd0d     s-.D...3_L...|..
 800e8f4:	713c 5005 41aa 2702 1010 be0b 2086 c90c     <q.P.A.'..... ..
 800e904:	b525 5768 85b3 206f d409 b966 e49f ce61     %.hW..o ..f...a.
 800e914:	f90e 5ede c998 29d9 9822 b0d0 a8b4 c7d7     ...^...)".......
 800e924:	3d17 59b3 0d81 2eb4 5c3b b7bd 6cad c0ba     .=.Y....;\...l..
 800e934:	8320 edb8 b3b6 9abf e20c 03b6 d29a 74b1      ..............t
 800e944:	4739 ead5 77af 9dd2 2615 04db 1683 73dc     9G...w...&.....s
 800e954:	0b12 e363 3b84 9464 6a3e 0d6d 5aa8 7a6a     ..c..;d.>jm..Zjz
 800e964:	cf0b e40e ff9d 9309 ae27 0a00 9eb1 7d07     ........'......}
 800e974:	9344 f00f a3d2 8708 f268 1e01 c2fe 6906     D.......h......i
 800e984:	575d f762 67cb 8065 3671 196c 06e7 6e6b     ]Wb..ge.q6l...kn
 800e994:	1b76 fed4 2be0 89d3 7a5a 10da 4acc 67dd     v....+..Zz...J.g
 800e9a4:	df6f f9b9 eff9 8ebe be43 17b7 8ed5 60b0     o.......C......`
 800e9b4:	a3e8 d6d6 937e a1d1 c2c4 38d8 f252 4fdf     ....~......8R..O
 800e9c4:	67f1 d1bb 5767 a6bc 06dd 3fb5 364b 48b2     .g..gW.....?K6.H
 800e9d4:	2bda d80d 1b4c af0a 4af6 3603 7a60 4104     .+..L....J.6`z.A
 800e9e4:	efc3 df60 df55 a867 8eef 316e be79 4669     ..`.U.g...n1y.iF
 800e9f4:	b38c cb61 831a bc66 d2a0 256f e236 5268     ..a...f...o%6.hR
 800ea04:	7795 cc0c 4703 bb0b 16b9 2202 262f 5505     .w...G....."/&.U
 800ea14:	3bbe c5ba 0b28 b2bd 5a92 2bb4 6a04 5cb3     .;..(....Z.+.j.\
 800ea24:	ffa7 c2d7 cf31 b5d0 9e8b 2cd9 ae1d 5bde     ....1......,...[
 800ea34:	c2b0 9b64 f226 ec63 a39c 756a 930a 026d     ..d.&.c...ju..m.
 800ea44:	06a9 9c09 363f eb0e 6785 7207 5713 0500     ....?6...g.r.W..
 800ea54:	4a82 95bf 7a14 e2b8 2bae 7bb1 1b38 0cb6     .J...z...+.{8...
 800ea64:	8e9b 92d2 be0d e5d5 efb7 7cdc df21 0bdb     ...........|!...
 800ea74:	d2d4 86d3 e242 f1d4 b3f8 68dd 836e 1fda     ....B......hn...
 800ea84:	16cd 81be 265b f6b9 77e1 6fb0 4777 18b7     ....[&...w.owG..
 800ea94:	5ae6 8808 6a70 ff0f 3bca 6606 0b5c 1101     .Z..pj...;.f\...
 800eaa4:	9eff 8f65 ae69 f862 ffd3 616b cf45 166c     ..e.i.b...kaE.l.
 800eab4:	e278 a00a d2ee d70d 8354 4e04 b3c2 3903     x.......T..N...9
 800eac4:	2661 a767 16f7 d060 474d 4969 77db 3e6e     a&g...`.MGiI.wn>
 800ead4:	6a4a aed1 5adc d9d6 0b66 40df 3bf0 37d8     Jj...Z..f..@.;.7
 800eae4:	ae53 a9bc 9ec5 debb cf7f 47b2 ffe9 30b5     S..........G...0
 800eaf4:	f21c bdbd c28a caba 9330 53b3 a3a6 24b4     ........0..S...$
 800eb04:	3605 bad0 0693 cdd7 5729 54de 67bf 23d9     .6......)W.T.g.#
 800eb14:	7a2e b366 4ab8 c461 1b02 5d68 2b94 2a6f     .zf..Ja...h].+o*
 800eb24:	be37 b40b 8ea1 c30c df1b 5a05 ef8d 2d02     7..........Z...-
 800eb34:	3225 646c 0000 0000 252e 646c 0000 0000     %2ld.....%ld....
 800eb44:	2520 4263 7325 0000 2e31 2e32 0033 0000      %cB%s..1.2.3...
 800eb54:	7245 6f72 3a72 6920 666e 616c 6574 6e49     Error: inflateIn
 800eb64:	7469 2832 2029 6572 7574 6e72 6465 2520     it2() returned %
 800eb74:	0a64 0000 7245 6f72 3a72 6920 666e 616c     d...Error: infla
 800eb84:	6574 2928 7220 7465 7275 656e 2064 6425     te() returned %d
 800eb94:	000a 0000 7245 6f72 3a72 4220 6461 6720     ....Error: Bad g
 800eba4:	697a 7070 6465 6420 7461 0a61 0000 0000     zipped data.....
 800ebb4:	7245 6f72 3a72 6720 6e75 697a 2070 756f     Error: gunzip ou
 800ebc4:	2074 666f 6420 7461 2061 6e69 6820 6165     t of data in hea
 800ebd4:	6564 0a72 0000 0000 5245 4f52 3a52 4620     der.....ERROR: F
 800ebe4:	6961 656c 2064 6f74 6120 6c6c 636f 7461     ailed to allocat
 800ebf4:	2065 7830 6c25 2078 7962 6574 2073 6562     e 0x%lx bytes be
 800ec04:	6f6c 2077 7830 6c25 2e78 000a               low 0x%lx...

0800ec10 <digits.5422>:
 800ec10:	3130 3332 3534 3736 3938 4241 4443 4645     0123456789ABCDEF

0800ec20 <hex_asc>:
 800ec20:	3130 3332 3534 3736 3938 6261 6463 6665     0123456789abcdef
 800ec30:	0000 0000 4e3c 4c55 3e4c 0000 6e28 6c75     ....<NULL>..(nul
 800ec40:	296c 0000                                   l)..

0800ec44 <dext.5726>:
 800ec44:	0010 0010 0010 0010 0011 0011 0012 0012     ................
 800ec54:	0013 0013 0014 0014 0015 0015 0016 0016     ................
 800ec64:	0017 0017 0018 0018 0019 0019 001a 001a     ................
 800ec74:	001b 001b 001c 001c 001d 001d 0040 0040     ............@.@.

0800ec84 <dbase.5725>:
 800ec84:	0001 0002 0003 0004 0005 0007 0009 000d     ................
 800ec94:	0011 0019 0021 0031 0041 0061 0081 00c1     ....!.1.A.a.....
 800eca4:	0101 0181 0201 0301 0401 0601 0801 0c01     ................
 800ecb4:	1001 1801 2001 3001 4001 6001 0000 0000     ..... .0.@.`....

0800ecc4 <lext.5724>:
 800ecc4:	0010 0010 0010 0010 0010 0010 0010 0010     ................
 800ecd4:	0011 0011 0011 0011 0012 0012 0012 0012     ................
 800ece4:	0013 0013 0013 0013 0014 0014 0014 0014     ................
 800ecf4:	0015 0015 0015 0015 0010 00c9 00c4 0000     ................

0800ed04 <lbase.5723>:
 800ed04:	0003 0004 0005 0006 0007 0008 0009 000a     ................
 800ed14:	000b 000d 000f 0011 0013 0017 001b 001f     ................
 800ed24:	0023 002b 0033 003b 0043 0053 0063 0073     #.+.3.;.C.S.c.s.
 800ed34:	0083 00a3 00c3 00e3 0102 0000 0000 0000     ................

0800ed44 <lenfix>:
 800ed44:	0760 0000 0800 0050 0800 0010 0814 0073     `.....P.......s.
 800ed54:	0712 001f 0800 0070 0800 0030 0900 00c0     ......p...0.....
 800ed64:	0710 000a 0800 0060 0800 0020 0900 00a0     ......`... .....
 800ed74:	0800 0000 0800 0080 0800 0040 0900 00e0     ..........@.....
 800ed84:	0710 0006 0800 0058 0800 0018 0900 0090     ......X.........
 800ed94:	0713 003b 0800 0078 0800 0038 0900 00d0     ..;...x...8.....
 800eda4:	0711 0011 0800 0068 0800 0028 0900 00b0     ......h...(.....
 800edb4:	0800 0008 0800 0088 0800 0048 0900 00f0     ..........H.....
 800edc4:	0710 0004 0800 0054 0800 0014 0815 00e3     ......T.........
 800edd4:	0713 002b 0800 0074 0800 0034 0900 00c8     ..+...t...4.....
 800ede4:	0711 000d 0800 0064 0800 0024 0900 00a8     ......d...$.....
 800edf4:	0800 0004 0800 0084 0800 0044 0900 00e8     ..........D.....
 800ee04:	0710 0008 0800 005c 0800 001c 0900 0098     ......\.........
 800ee14:	0714 0053 0800 007c 0800 003c 0900 00d8     ..S...|...<.....
 800ee24:	0712 0017 0800 006c 0800 002c 0900 00b8     ......l...,.....
 800ee34:	0800 000c 0800 008c 0800 004c 0900 00f8     ..........L.....
 800ee44:	0710 0003 0800 0052 0800 0012 0815 00a3     ......R.........
 800ee54:	0713 0023 0800 0072 0800 0032 0900 00c4     ..#...r...2.....
 800ee64:	0711 000b 0800 0062 0800 0022 0900 00a4     ......b...".....
 800ee74:	0800 0002 0800 0082 0800 0042 0900 00e4     ..........B.....
 800ee84:	0710 0007 0800 005a 0800 001a 0900 0094     ......Z.........
 800ee94:	0714 0043 0800 007a 0800 003a 0900 00d4     ..C...z...:.....
 800eea4:	0712 0013 0800 006a 0800 002a 0900 00b4     ......j...*.....
 800eeb4:	0800 000a 0800 008a 0800 004a 0900 00f4     ..........J.....
 800eec4:	0710 0005 0800 0056 0800 0016 0840 0000     ......V.....@...
 800eed4:	0713 0033 0800 0076 0800 0036 0900 00cc     ..3...v...6.....
 800eee4:	0711 000f 0800 0066 0800 0026 0900 00ac     ......f...&.....
 800eef4:	0800 0006 0800 0086 0800 0046 0900 00ec     ..........F.....
 800ef04:	0710 0009 0800 005e 0800 001e 0900 009c     ......^.........
 800ef14:	0714 0063 0800 007e 0800 003e 0900 00dc     ..c...~...>.....
 800ef24:	0712 001b 0800 006e 0800 002e 0900 00bc     ......n.........
 800ef34:	0800 000e 0800 008e 0800 004e 0900 00fc     ..........N.....
 800ef44:	0760 0000 0800 0051 0800 0011 0815 0083     `.....Q.........
 800ef54:	0712 001f 0800 0071 0800 0031 0900 00c2     ......q...1.....
 800ef64:	0710 000a 0800 0061 0800 0021 0900 00a2     ......a...!.....
 800ef74:	0800 0001 0800 0081 0800 0041 0900 00e2     ..........A.....
 800ef84:	0710 0006 0800 0059 0800 0019 0900 0092     ......Y.........
 800ef94:	0713 003b 0800 0079 0800 0039 0900 00d2     ..;...y...9.....
 800efa4:	0711 0011 0800 0069 0800 0029 0900 00b2     ......i...).....
 800efb4:	0800 0009 0800 0089 0800 0049 0900 00f2     ..........I.....
 800efc4:	0710 0004 0800 0055 0800 0015 0810 0102     ......U.........
 800efd4:	0713 002b 0800 0075 0800 0035 0900 00ca     ..+...u...5.....
 800efe4:	0711 000d 0800 0065 0800 0025 0900 00aa     ......e...%.....
 800eff4:	0800 0005 0800 0085 0800 0045 0900 00ea     ..........E.....
 800f004:	0710 0008 0800 005d 0800 001d 0900 009a     ......].........
 800f014:	0714 0053 0800 007d 0800 003d 0900 00da     ..S...}...=.....
 800f024:	0712 0017 0800 006d 0800 002d 0900 00ba     ......m...-.....
 800f034:	0800 000d 0800 008d 0800 004d 0900 00fa     ..........M.....
 800f044:	0710 0003 0800 0053 0800 0013 0815 00c3     ......S.........
 800f054:	0713 0023 0800 0073 0800 0033 0900 00c6     ..#...s...3.....
 800f064:	0711 000b 0800 0063 0800 0023 0900 00a6     ......c...#.....
 800f074:	0800 0003 0800 0083 0800 0043 0900 00e6     ..........C.....
 800f084:	0710 0007 0800 005b 0800 001b 0900 0096     ......[.........
 800f094:	0714 0043 0800 007b 0800 003b 0900 00d6     ..C...{...;.....
 800f0a4:	0712 0013 0800 006b 0800 002b 0900 00b6     ......k...+.....
 800f0b4:	0800 000b 0800 008b 0800 004b 0900 00f6     ..........K.....
 800f0c4:	0710 0005 0800 0057 0800 0017 0840 0000     ......W.....@...
 800f0d4:	0713 0033 0800 0077 0800 0037 0900 00ce     ..3...w...7.....
 800f0e4:	0711 000f 0800 0067 0800 0027 0900 00ae     ......g...'.....
 800f0f4:	0800 0007 0800 0087 0800 0047 0900 00ee     ..........G.....
 800f104:	0710 0009 0800 005f 0800 001f 0900 009e     ......_.........
 800f114:	0714 0063 0800 007f 0800 003f 0900 00de     ..c.......?.....
 800f124:	0712 001b 0800 006f 0800 002f 0900 00be     ......o.../.....
 800f134:	0800 000f 0800 008f 0800 004f 0900 00fe     ..........O.....
 800f144:	0760 0000 0800 0050 0800 0010 0814 0073     `.....P.......s.
 800f154:	0712 001f 0800 0070 0800 0030 0900 00c1     ......p...0.....
 800f164:	0710 000a 0800 0060 0800 0020 0900 00a1     ......`... .....
 800f174:	0800 0000 0800 0080 0800 0040 0900 00e1     ..........@.....
 800f184:	0710 0006 0800 0058 0800 0018 0900 0091     ......X.........
 800f194:	0713 003b 0800 0078 0800 0038 0900 00d1     ..;...x...8.....
 800f1a4:	0711 0011 0800 0068 0800 0028 0900 00b1     ......h...(.....
 800f1b4:	0800 0008 0800 0088 0800 0048 0900 00f1     ..........H.....
 800f1c4:	0710 0004 0800 0054 0800 0014 0815 00e3     ......T.........
 800f1d4:	0713 002b 0800 0074 0800 0034 0900 00c9     ..+...t...4.....
 800f1e4:	0711 000d 0800 0064 0800 0024 0900 00a9     ......d...$.....
 800f1f4:	0800 0004 0800 0084 0800 0044 0900 00e9     ..........D.....
 800f204:	0710 0008 0800 005c 0800 001c 0900 0099     ......\.........
 800f214:	0714 0053 0800 007c 0800 003c 0900 00d9     ..S...|...<.....
 800f224:	0712 0017 0800 006c 0800 002c 0900 00b9     ......l...,.....
 800f234:	0800 000c 0800 008c 0800 004c 0900 00f9     ..........L.....
 800f244:	0710 0003 0800 0052 0800 0012 0815 00a3     ......R.........
 800f254:	0713 0023 0800 0072 0800 0032 0900 00c5     ..#...r...2.....
 800f264:	0711 000b 0800 0062 0800 0022 0900 00a5     ......b...".....
 800f274:	0800 0002 0800 0082 0800 0042 0900 00e5     ..........B.....
 800f284:	0710 0007 0800 005a 0800 001a 0900 0095     ......Z.........
 800f294:	0714 0043 0800 007a 0800 003a 0900 00d5     ..C...z...:.....
 800f2a4:	0712 0013 0800 006a 0800 002a 0900 00b5     ......j...*.....
 800f2b4:	0800 000a 0800 008a 0800 004a 0900 00f5     ..........J.....
 800f2c4:	0710 0005 0800 0056 0800 0016 0840 0000     ......V.....@...
 800f2d4:	0713 0033 0800 0076 0800 0036 0900 00cd     ..3...v...6.....
 800f2e4:	0711 000f 0800 0066 0800 0026 0900 00ad     ......f...&.....
 800f2f4:	0800 0006 0800 0086 0800 0046 0900 00ed     ..........F.....
 800f304:	0710 0009 0800 005e 0800 001e 0900 009d     ......^.........
 800f314:	0714 0063 0800 007e 0800 003e 0900 00dd     ..c...~...>.....
 800f324:	0712 001b 0800 006e 0800 002e 0900 00bd     ......n.........
 800f334:	0800 000e 0800 008e 0800 004e 0900 00fd     ..........N.....
 800f344:	0760 0000 0800 0051 0800 0011 0815 0083     `.....Q.........
 800f354:	0712 001f 0800 0071 0800 0031 0900 00c3     ......q...1.....
 800f364:	0710 000a 0800 0061 0800 0021 0900 00a3     ......a...!.....
 800f374:	0800 0001 0800 0081 0800 0041 0900 00e3     ..........A.....
 800f384:	0710 0006 0800 0059 0800 0019 0900 0093     ......Y.........
 800f394:	0713 003b 0800 0079 0800 0039 0900 00d3     ..;...y...9.....
 800f3a4:	0711 0011 0800 0069 0800 0029 0900 00b3     ......i...).....
 800f3b4:	0800 0009 0800 0089 0800 0049 0900 00f3     ..........I.....
 800f3c4:	0710 0004 0800 0055 0800 0015 0810 0102     ......U.........
 800f3d4:	0713 002b 0800 0075 0800 0035 0900 00cb     ..+...u...5.....
 800f3e4:	0711 000d 0800 0065 0800 0025 0900 00ab     ......e...%.....
 800f3f4:	0800 0005 0800 0085 0800 0045 0900 00eb     ..........E.....
 800f404:	0710 0008 0800 005d 0800 001d 0900 009b     ......].........
 800f414:	0714 0053 0800 007d 0800 003d 0900 00db     ..S...}...=.....
 800f424:	0712 0017 0800 006d 0800 002d 0900 00bb     ......m...-.....
 800f434:	0800 000d 0800 008d 0800 004d 0900 00fb     ..........M.....
 800f444:	0710 0003 0800 0053 0800 0013 0815 00c3     ......S.........
 800f454:	0713 0023 0800 0073 0800 0033 0900 00c7     ..#...s...3.....
 800f464:	0711 000b 0800 0063 0800 0023 0900 00a7     ......c...#.....
 800f474:	0800 0003 0800 0083 0800 0043 0900 00e7     ..........C.....
 800f484:	0710 0007 0800 005b 0800 001b 0900 0097     ......[.........
 800f494:	0714 0043 0800 007b 0800 003b 0900 00d7     ..C...{...;.....
 800f4a4:	0712 0013 0800 006b 0800 002b 0900 00b7     ......k...+.....
 800f4b4:	0800 000b 0800 008b 0800 004b 0900 00f7     ..........K.....
 800f4c4:	0710 0005 0800 0057 0800 0017 0840 0000     ......W.....@...
 800f4d4:	0713 0033 0800 0077 0800 0037 0900 00cf     ..3...w...7.....
 800f4e4:	0711 000f 0800 0067 0800 0027 0900 00af     ......g...'.....
 800f4f4:	0800 0007 0800 0087 0800 0047 0900 00ef     ..........G.....
 800f504:	0710 0009 0800 005f 0800 001f 0900 009f     ......_.........
 800f514:	0714 0063 0800 007f 0800 003f 0900 00df     ..c.......?.....
 800f524:	0712 001b 0800 006f 0800 002f 0900 00bf     ......o.../.....
 800f534:	0800 000f 0800 008f 0800 004f 0900 00ff     ..........O.....

0800f544 <distfix>:
 800f544:	0510 0001 0517 0101 0513 0011 051b 1001     ................
 800f554:	0511 0005 0519 0401 0515 0041 051d 4001     ..........A....@
 800f564:	0510 0003 0518 0201 0514 0021 051c 2001     ..........!.... 
 800f574:	0512 0009 051a 0801 0516 0081 0540 0000     ............@...
 800f584:	0510 0002 0517 0181 0513 0019 051b 1801     ................
 800f594:	0511 0007 0519 0601 0515 0061 051d 6001     ..........a....`
 800f5a4:	0510 0004 0518 0301 0514 0031 051c 3001     ..........1....0
 800f5b4:	0512 000d 051a 0c01 0516 00c1 0540 0000     ............@...

0800f5c4 <order.5819>:
 800f5c4:	0010 0011 0012 0000 0008 0007 0009 0006     ................
 800f5d4:	000a 0005 000b 0004 000c 0003 000d 0002     ................
 800f5e4:	000e 0001 000f 0000                         ........

0800f5ec <z_errmsg>:
 800f5ec:	f7d4 0800 f7e4 0800 d63c 0800 f7f0 0800     ........<.......
 800f5fc:	f7fc 0800 f80c 0800 f818 0800 f82c 0800     ............,...
 800f60c:	f83c 0800 d63c 0800 6e69 6176 696c 2064     <...<...invalid 
 800f61c:	6964 7473 6e61 6563 7420 6f6f 6620 7261     distance too far
 800f62c:	6220 6361 006b 0000 6e69 6176 696c 2064      back...invalid 
 800f63c:	6964 7473 6e61 6563 6320 646f 0065 0000     distance code...
 800f64c:	6e69 6176 696c 2064 696c 6574 6172 2f6c     invalid literal/
 800f65c:	656c 676e 6874 6320 646f 0065 6e69 6f63     length code.inco
 800f66c:	7272 6365 2074 6568 6461 7265 6320 6568     rrect header che
 800f67c:	6b63 0000 6e75 6e6b 776f 206e 6f63 706d     ck..unknown comp
 800f68c:	6572 7373 6f69 206e 656d 6874 646f 0000     ression method..
 800f69c:	6e69 6176 696c 2064 6977 646e 776f 7320     invalid window s
 800f6ac:	7a69 0065 6e75 6e6b 776f 206e 6568 6461     ize.unknown head
 800f6bc:	7265 6620 616c 7367 7320 7465 0000 0000     er flags set....
 800f6cc:	6568 6461 7265 6320 6372 6d20 7369 616d     header crc misma
 800f6dc:	6374 0068 6e69 6176 696c 2064 6c62 636f     tch.invalid bloc
 800f6ec:	206b 7974 6570 0000 6e69 6176 696c 2064     k type..invalid 
 800f6fc:	7473 726f 6465 6220 6f6c 6b63 6c20 6e65     stored block len
 800f70c:	7467 7368 0000 0000 6f74 206f 616d 796e     gths....too many
 800f71c:	6c20 6e65 7467 2068 726f 6420 7369 6174      length or dista
 800f72c:	636e 2065 7973 626d 6c6f 0073 6e69 6176     nce symbols.inva
 800f73c:	696c 2064 6f63 6564 6c20 6e65 7467 7368     lid code lengths
 800f74c:	7320 7465 0000 0000 6e69 6176 696c 2064      set....invalid 
 800f75c:	6962 2074 656c 676e 6874 7220 7065 6165     bit length repea
 800f76c:	0074 0000 6e69 6176 696c 2064 696c 6574     t...invalid lite
 800f77c:	6172 2f6c 656c 676e 6874 2073 6573 0074     ral/lengths set.
 800f78c:	6e69 6176 696c 2064 6964 7473 6e61 6563     invalid distance
 800f79c:	2073 6573 0074 0000 6e69 6f63 7272 6365     s set...incorrec
 800f7ac:	2074 6164 6174 6320 6568 6b63 0000 0000     t data check....
 800f7bc:	6e69 6f63 7272 6365 2074 656c 676e 6874     incorrect length
 800f7cc:	6320 6568 6b63 0000 656e 6465 6420 6369      check..need dic
 800f7dc:	6974 6e6f 7261 0079 7473 6572 6d61 6520     tionary.stream e
 800f7ec:	646e 0000 6966 656c 6520 7272 726f 0000     nd..file error..
 800f7fc:	7473 6572 6d61 6520 7272 726f 0000 0000     stream error....
 800f80c:	6164 6174 6520 7272 726f 0000 6e69 7573     data error..insu
 800f81c:	6666 6369 6569 746e 6d20 6d65 726f 0079     fficient memory.
 800f82c:	7562 6666 7265 6520 7272 726f 0000 0000     buffer error....
 800f83c:	6e69 6f63 706d 7461 6269 656c 7620 7265     incompatible ver
 800f84c:	6973 6e6f 0000 0000 5453 334d 4632 2037     sion....STM32F7 
 800f85c:	4328 726f 6574 2d78 374d 0029 5043 2055     (Cortex-M7).CPU 
 800f86c:	3a20 2520 0a73 0000 7246 7165 3a73 5320      : %s...Freqs: S
 800f87c:	5359 4c43 3d4b 7325 484d 2c7a 4348 4b4c     YSCLK=%sMHz,HCLK
 800f88c:	253d 4d73 7a48 502c 4c43 314b 253d 4d73     =%sMHz,PCLK1=%sM
 800f89c:	7a48 502c 4c43 324b 253d 4d73 7a48 000a     Hz,PCLK2=%sMHz..

0800f8ac <ext_psram_fsmc_fmc_gpio>:
 800f8ac:	0602 0702 0802 0701 0003 0103 0303 0403     ................
 800f8bc:	0503 0803 0903 0a03 0b03 0c03 0d03 0e03     ................
 800f8cc:	0f03 0004 0104 0304 0404 0504 0604 0704     ................
 800f8dc:	0804 0904 0a04 0b04 0c04 0d04 0e04 0f04     ................
 800f8ec:	0d06 0000 616d 6863 6469 0000 7355 6e69     ....machid..Usin
 800f8fc:	2067 616d 6863 6469 3020 2578 2078 7266     g machid 0x%x fr
 800f90c:	6d6f 6520 766e 7269 6e6f 656d 746e 000a     om environment..
 800f91c:	7465 6168 6464 3d72 0000 0000 6520 6874     ethaddr=.... eth
 800f92c:	6461 7264 253d 0073 530a 6174 7472 6e69     addr=%s..Startin
 800f93c:	2067 656b 6e72 6c65 2e20 2e2e 0a0a 0000     g kernel .......
 800f94c:	6572 6573 7474 6e69 2067 2e2e 0a2e 0000     resetting ......

0800f95c <__func__.5396>:
 800f95c:	7473 336d 6632 5f32 7067 6f69 635f 6e6f     stm32f2_gpio_con
 800f96c:	6966 0067                                   fig.

0800f970 <io_base>:
 800f970:	0000 4002 0400 4002 0800 4002 0c00 4002     ...@...@...@...@
 800f980:	1000 4002 1400 4002 1800 4002 1c00 4002     ...@...@...@...@
 800f990:	2000 4002 2400 4002 2800 4002               . .@.$.@.(.@

0800f99c <af_val>:
 800f99c:	0007 0000 0007 0000 0007 0000 0008 0000     ................
 800f9ac:	0008 0000 0008 0000 000b 0000 ffff ffff     ................
 800f9bc:	000e 0000 000c 0000 ffff ffff 0009 0000     ................

0800f9cc <__func__.5418>:
 800f9cc:	7473 336d 6632 5f32 7067 756f 5f74 6573     stm32f2_gpout_se
 800f9dc:	0074 0000 7325 203a 6e69 6f63 7272 6365     t...%s: incorrec
 800f9ec:	2074 6170 6172 736d 2520 2e64 6425 0a2e     t params %d.%d..
 800f9fc:	0000 0000 7325 203a 6e69 6f63 7272 6365     ....%s: incorrec
 800fa0c:	2074 6f72 656c 2520 2e64 000a               t role %d...

0800fa18 <__func__.5726>:
 800fa18:	7473 5f6d 7465 5f68 6572 7663 0000 0000     stm_eth_recv....

0800fa28 <__func__.5713>:
 800fa28:	7473 5f6d 7465 5f68 6573 646e 0000 0000     stm_eth_send....

0800fa38 <__func__.5638>:
 800fa38:	7473 5f6d 6870 5f79 6177 7469 625f 7375     stm_phy_wait_bus
 800fa48:	0079 0000                                   y...

0800fa4c <__func__.5604>:
 800fa4c:	7473 5f6d 6870 5f79 6e69 7469 0000 0000     stm_phy_init....

0800fa5c <__func__.5702>:
 800fa5c:	7473 5f6d 7465 5f68 6e69 7469 0000 0000     stm_eth_init....

0800fa6c <__func__.5689>:
 800fa6c:	7473 5f6d 616d 5f63 7768 695f 696e 0074     stm_mac_hw_init.
 800fa7c:	7325 203a 6177 6e72 202c 7266 6d61 2065     %s: warn, frame 
 800fa8c:	7073 696c 2074 3028 2578 3830 2978 0a2e     split (0x%08x)..
 800fa9c:	0000 0000 7325 203a 5852 6f20 6576 6672     ....%s: RX overf
 800faac:	6f6c 2e77 000a 0000 7325 203a 7266 6d61     low.....%s: fram
 800fabc:	2065 6f74 206f 6f6c 676e 2820 6425 2e29     e too long (%d).
 800facc:	000a 0000 7325 203a 7562 7973 0a2e 0000     ....%s: busy....
 800fadc:	7325 203a 6974 656d 756f 2e74 000a 0000     %s: timeout.....
 800faec:	7325 203a 6974 656d 2064 756f 0a74 0000     %s: timed out...
 800fafc:	7541 6f74 6e2d 6765 746f 6169 6974 6e6f     Auto-negotiation
 800fb0c:	2e2e 002e 6f63 706d 656c 6574 2e64 000a     ....completed...
 800fb1c:	694c 6b6e 6920 2073 4f44 4e57 0a2e 0000     Link is DOWN....
 800fb2c:	7325 203a 696c 6b6e 5520 2050 0000 0000     %s: link UP ....
 800fb3c:	3128 3030 002f 0000 3128 2f30 0000 0000     (100/...(10/....
 800fb4c:	7546 6c6c 0a29 0000 6148 666c 0a29 0000     Full)...Half)...
 800fb5c:	7325 203a 4850 2059 6f6e 2074 6f66 6e75     %s: PHY not foun
 800fb6c:	2e64 000a 7325 203a 6166 6c69 6465 2820     d...%s: failed (
 800fb7c:	6425 2e29 000a 0000 7325 203a 6166 6c69     %d).....%s: fail
 800fb8c:	6465 7220 7365 7465 4d20 4341 7320 6275     ed reset MAC sub
 800fb9c:	7973 7473 6d65 0a2e 0000 0000 5453 334d     system......STM3
 800fbac:	5f32 414d 0043 0000 7245 6f72 3a72 6620     2_MAC...Error: f
 800fbbc:	6961 656c 2064 6f74 6120 6c6c 636f 7461     ailed to allocat
 800fbcc:	2065 6425 2042 666f 6d20 6d65 726f 2079     e %dB of memory 
 800fbdc:	6f66 2072 7325 000a 6c25 0064 252e 3330     for %s..%ld..%03
 800fbec:	646c 0000                                   ld..

Disassembly of section .data:

20000000 <init_sequence>:
20000000:	08c9 0800 7c3d 0800 63ed 0800 0e2d 0800     ....=|...c..-...
20000010:	2dd1 0800 543d 0800 0e15 0800 b199 0800     .-..=T..........
20000020:	7c49 0800 7c61 0800 0df1 0800 0000 0000     I|..a|..........

20000030 <NetOurVLAN>:
20000030:	ffff 0000                                   ....

20000034 <NetBcastAddr>:
20000034:	ffff ffff ffff                              ......

2000003a <NetOurNativeVLAN>:
2000003a:	ffff                                        ..

2000003c <TftpTimeoutMSecs>:
2000003c:	1388 0000                                   ....

20000040 <TftpBlkSizeOption>:
20000040:	05bc                                        ..

20000042 <TftpBlkSize>:
20000042:	0200                                        ..

20000044 <TftpTimeoutCountMax>:
20000044:	000a 0000                                   ....

20000048 <TftpRRQTimeoutCountMax>:
20000048:	000a 0000                                   ....

2000004c <TftpRRQTimeoutMSecs>:
2000004c:	1388 0000                                   ....

20000050 <tx_gpio.5395>:
20000050:	0200 0000                                   ....

20000054 <rx_gpio.5396>:
20000054:	0300 0000                                   ....

20000058 <load_addr>:
20000058:	0000 6000                                   ...`

2000005c <cmd_bootm_sub>:
2000005c:	d340 0800 0000 0000 0001 0000 0001 0000     @...............
2000006c:	d63c 0800 d3a4 0800 0000 0000 0001 0000     <...............
2000007c:	0002 0000 d63c 0800 d3ac 0800 0000 0000     ....<...........
2000008c:	0001 0000 0004 0000 d63c 0800 d3b4 0800     ........<.......
2000009c:	0000 0000 0001 0000 0010 0000 d63c 0800     ............<...
200000ac:	d3bc 0800 0000 0000 0001 0000 0020 0000     ............ ...
200000bc:	d63c 0800 d3c0 0800 0000 0000 0001 0000     <...............
200000cc:	0040 0000 d63c 0800 ceb8 0800 0000 0000     @...<...........
200000dc:	0001 0000 0080 0000 d63c 0800               ........<...

200000e8 <dp_last_length>:
200000e8:	0040 0000                                   @...

200000ec <env_id>:
200000ec:	0001 0000                                   ....

200000f0 <av_>:
	...
200000f8:	00f0 2000 00f0 2000 00f8 2000 00f8 2000     ... ... ... ... 
20000108:	0100 2000 0100 2000 0108 2000 0108 2000     ... ... ... ... 
20000118:	0110 2000 0110 2000 0118 2000 0118 2000     ... ... ... ... 
20000128:	0120 2000 0120 2000 0128 2000 0128 2000      ..  .. (.. (.. 
20000138:	0130 2000 0130 2000 0138 2000 0138 2000     0.. 0.. 8.. 8.. 
20000148:	0140 2000 0140 2000 0148 2000 0148 2000     @.. @.. H.. H.. 
20000158:	0150 2000 0150 2000 0158 2000 0158 2000     P.. P.. X.. X.. 
20000168:	0160 2000 0160 2000 0168 2000 0168 2000     `.. `.. h.. h.. 
20000178:	0170 2000 0170 2000 0178 2000 0178 2000     p.. p.. x.. x.. 
20000188:	0180 2000 0180 2000 0188 2000 0188 2000     ... ... ... ... 
20000198:	0190 2000 0190 2000 0198 2000 0198 2000     ... ... ... ... 
200001a8:	01a0 2000 01a0 2000 01a8 2000 01a8 2000     ... ... ... ... 
200001b8:	01b0 2000 01b0 2000 01b8 2000 01b8 2000     ... ... ... ... 
200001c8:	01c0 2000 01c0 2000 01c8 2000 01c8 2000     ... ... ... ... 
200001d8:	01d0 2000 01d0 2000 01d8 2000 01d8 2000     ... ... ... ... 
200001e8:	01e0 2000 01e0 2000 01e8 2000 01e8 2000     ... ... ... ... 
200001f8:	01f0 2000 01f0 2000 01f8 2000 01f8 2000     ... ... ... ... 
20000208:	0200 2000 0200 2000 0208 2000 0208 2000     ... ... ... ... 
20000218:	0210 2000 0210 2000 0218 2000 0218 2000     ... ... ... ... 
20000228:	0220 2000 0220 2000 0228 2000 0228 2000      ..  .. (.. (.. 
20000238:	0230 2000 0230 2000 0238 2000 0238 2000     0.. 0.. 8.. 8.. 
20000248:	0240 2000 0240 2000 0248 2000 0248 2000     @.. @.. H.. H.. 
20000258:	0250 2000 0250 2000 0258 2000 0258 2000     P.. P.. X.. X.. 
20000268:	0260 2000 0260 2000 0268 2000 0268 2000     `.. `.. h.. h.. 
20000278:	0270 2000 0270 2000 0278 2000 0278 2000     p.. p.. x.. x.. 
20000288:	0280 2000 0280 2000 0288 2000 0288 2000     ... ... ... ... 
20000298:	0290 2000 0290 2000 0298 2000 0298 2000     ... ... ... ... 
200002a8:	02a0 2000 02a0 2000 02a8 2000 02a8 2000     ... ... ... ... 
200002b8:	02b0 2000 02b0 2000 02b8 2000 02b8 2000     ... ... ... ... 
200002c8:	02c0 2000 02c0 2000 02c8 2000 02c8 2000     ... ... ... ... 
200002d8:	02d0 2000 02d0 2000 02d8 2000 02d8 2000     ... ... ... ... 
200002e8:	02e0 2000 02e0 2000 02e8 2000 02e8 2000     ... ... ... ... 
200002f8:	02f0 2000 02f0 2000 02f8 2000 02f8 2000     ... ... ... ... 
20000308:	0300 2000 0300 2000 0308 2000 0308 2000     ... ... ... ... 
20000318:	0310 2000 0310 2000 0318 2000 0318 2000     ... ... ... ... 
20000328:	0320 2000 0320 2000 0328 2000 0328 2000      ..  .. (.. (.. 
20000338:	0330 2000 0330 2000 0338 2000 0338 2000     0.. 0.. 8.. 8.. 
20000348:	0340 2000 0340 2000 0348 2000 0348 2000     @.. @.. H.. H.. 
20000358:	0350 2000 0350 2000 0358 2000 0358 2000     P.. P.. X.. X.. 
20000368:	0360 2000 0360 2000 0368 2000 0368 2000     `.. `.. h.. h.. 
20000378:	0370 2000 0370 2000 0378 2000 0378 2000     p.. p.. x.. x.. 
20000388:	0380 2000 0380 2000 0388 2000 0388 2000     ... ... ... ... 
20000398:	0390 2000 0390 2000 0398 2000 0398 2000     ... ... ... ... 
200003a8:	03a0 2000 03a0 2000 03a8 2000 03a8 2000     ... ... ... ... 
200003b8:	03b0 2000 03b0 2000 03b8 2000 03b8 2000     ... ... ... ... 
200003c8:	03c0 2000 03c0 2000 03c8 2000 03c8 2000     ... ... ... ... 
200003d8:	03d0 2000 03d0 2000 03d8 2000 03d8 2000     ... ... ... ... 
200003e8:	03e0 2000 03e0 2000 03e8 2000 03e8 2000     ... ... ... ... 
200003f8:	03f0 2000 03f0 2000 03f8 2000 03f8 2000     ... ... ... ... 
20000408:	0400 2000 0400 2000 0408 2000 0408 2000     ... ... ... ... 
20000418:	0410 2000 0410 2000 0418 2000 0418 2000     ... ... ... ... 
20000428:	0420 2000 0420 2000 0428 2000 0428 2000      ..  .. (.. (.. 
20000438:	0430 2000 0430 2000 0438 2000 0438 2000     0.. 0.. 8.. 8.. 
20000448:	0440 2000 0440 2000 0448 2000 0448 2000     @.. @.. H.. H.. 
20000458:	0450 2000 0450 2000 0458 2000 0458 2000     P.. P.. X.. X.. 
20000468:	0460 2000 0460 2000 0468 2000 0468 2000     `.. `.. h.. h.. 
20000478:	0470 2000 0470 2000 0478 2000 0478 2000     p.. p.. x.. x.. 
20000488:	0480 2000 0480 2000 0488 2000 0488 2000     ... ... ... ... 
20000498:	0490 2000 0490 2000 0498 2000 0498 2000     ... ... ... ... 
200004a8:	04a0 2000 04a0 2000 04a8 2000 04a8 2000     ... ... ... ... 
200004b8:	04b0 2000 04b0 2000 04b8 2000 04b8 2000     ... ... ... ... 
200004c8:	04c0 2000 04c0 2000 04c8 2000 04c8 2000     ... ... ... ... 
200004d8:	04d0 2000 04d0 2000 04d8 2000 04d8 2000     ... ... ... ... 
200004e8:	04e0 2000 04e0 2000 04e8 2000 04e8 2000     ... ... ... ... 

200004f8 <sbrk_base>:
200004f8:	ffff ffff                                   ....

200004fc <trim_threshold>:
200004fc:	0000 0002                                   ....

20000500 <default_environment>:
20000500:	6f62 746f 7261 7367 733d 6d74 3233 705f     bootargs=stm32_p
20000510:	616c 6674 726f 3d6d 7473 336d 6632 2d37     latform=stm32f7-
20000520:	6964 6373 206f 6f63 736e 6c6f 3d65 7474     disco console=tt
20000530:	5379 2c31 3131 3235 3030 7020 6e61 6369     yS1,115200 panic
20000540:	313d 2030 6f6c 6c67 7665 6c65 373d 0020     =10 loglevel=7 .
20000550:	6f62 746f 6d63 3d64 7063 3820 3130 3031     bootcmd=cp 80110
20000560:	3030 3620 3030 3730 6366 2030 4237 3030     00 60007fc0 7B00
20000570:	3b30 6f62 746f 006d 6f62 746f 6564 616c     0;bootm.bootdela
20000580:	3d79 0032 6162 6475 6172 6574 313d 3531     y=2.baudrate=115
20000590:	3032 0030 6f68 7473 616e 656d 733d 6d74     200.hostname=stm
200005a0:	3233 3766 642d 7369 6f63 6c00 616f 6164     32f7-disco.loada
200005b0:	6464 3d72 7830 3036 3030 4637 3043 6100     ddr=0x60007FC0.a
200005c0:	6772 3d73 6573 6574 766e 6220 6f6f 6174     rgs=setenv boota
200005d0:	6772 2073 7473 336d 5f32 6c70 7461 6f66     rgs stm32_platfo
200005e0:	6d72 733d 6d74 3233 3766 642d 7369 6f63     rm=stm32f7-disco
200005f0:	6320 6e6f 6f73 656c 743d 7974 3153 312c      console=ttyS1,1
20000600:	3531 3032 2030 6170 696e 3d63 3031 6c20     15200 panic=10 l
20000610:	676f 656c 6576 3d6c 2037 6100 6464 7069     oglevel=7 .addip
20000620:	733d 7465 6e65 2076 6f62 746f 7261 7367     =setenv bootargs
20000630:	2420 627b 6f6f 6174 6772 7d73 6920 3d70      ${bootargs} ip=
20000640:	7b24 7069 6461 7264 3a7d 7b24 6573 7672     ${ipaddr}:${serv
20000650:	7265 7069 3a7d 7b24 6167 6574 6177 6979     erip}:${gatewayi
20000660:	7d70 243a 6e7b 7465 616d 6b73 3a7d 7b24     p}:${netmask}:${
20000670:	6f68 7473 616e 656d 3a7d 7465 3068 6f3a     hostname}:eth0:o
20000680:	6666 6500 766e 616d 6464 3d72 3830 3430     ff.envmaddr=0804
20000690:	3030 3030 6500 6874 6461 7264 433d 3a30     0000.ethaddr=C0:
200006a0:	3142 333a 3a43 3838 383a 3a38 3538 6900     B1:3C:88:88:85.i
200006b0:	6170 6464 3d72 3931 2e32 3631 2e38 2e31     paddr=192.168.1.
200006c0:	0039 6573 7672 7265 7069 313d 3239 312e     9.serverip=192.1
200006d0:	3836 312e 382e 6900 616d 6567 6e3d 7465     68.1.8.image=net
200006e0:	6f77 6b72 6e69 2e67 4975 616d 6567 7300     working.uImage.s
200006f0:	6474 6e69 733d 7265 6169 006c 656e 6274     tdin=serial.netb
20000700:	6f6f 3d74 6674 7074 2420 697b 616d 6567     oot=tftp ${image
20000710:	3b7d 7572 206e 7261 7367 6120 6464 7069     };run args addip
20000720:	623b 6f6f 6d74 6500 766e 626d 6f6f 3d74     ;bootm.envmboot=
20000730:	7572 206e 7261 7367 6120 6464 7069 623b     run args addip;b
20000740:	6f6f 6d74 2420 657b 766e 616d 6464 7d72     ootm ${envmaddr}
20000750:	6500 766e 756d 6470 7461 3d65 6674 7074     .envmupdate=tftp
20000760:	2420 697b 616d 6567 3b7d 7063 6674 2420      ${image};cptf $
20000770:	657b 766e 616d 6464 7d72 2420 6c7b 616f     {envmaddr} ${loa
20000780:	6164 6464 7d72 2420 667b 6c69 7365 7a69     daddr} ${filesiz
20000790:	7d65 0000 0000 0000                         e}......

20000798 <env_name_spec>:
20000798:	ddd4 0800                                   ....

2000079c <uimage_os>:
	...
200007a4:	e1a4 0800 0005 0000 e1b0 0800 e1b8 0800     ................
200007b4:	0002 0000 e1c0 0800 e1c8 0800 0012 0000     ................
200007c4:	e1d0 0800 e1d8 0800 0011 0000 e1e0 0800     ................
200007d4:	e1e8 0800 ffff ffff d63c 0800 d63c 0800     ........<...<...

200007e4 <uimage_arch>:
	...
200007ec:	e1f0 0800 0001 0000 e200 0800 e208 0800     ................
200007fc:	0002 0000 e210 0800 e214 0800 0003 0000     ................
2000080c:	e218 0800 e21c 0800 0004 0000 e228 0800     ............(...
2000081c:	e230 0800 000c 0000 e238 0800 e240 0800     0.......8...@...
2000082c:	000e 0000 e248 0800 e254 0800 0005 0000     ....H...T.......
2000083c:	e260 0800 e268 0800 0006 0000 e270 0800     `...h.......p...
2000084c:	e278 0800 000d 0000 e284 0800 e28c 0800     x...............
2000085c:	000f 0000 e294 0800 e29c 0800 0007 0000     ................
2000086c:	e2a4 0800 e2ac 0800 0007 0000 e2b4 0800     ................
2000087c:	e2ac 0800 0008 0000 e2b8 0800 e2c0 0800     ................
2000088c:	0009 0000 e2cc 0800 e2d0 0800 000a 0000     ................
2000089c:	e2d8 0800 e2e0 0800 000b 0000 e2e8 0800     ................
200008ac:	e2f0 0800 0010 0000 e300 0800 e30c 0800     ................
200008bc:	0011 0000 e318 0800 e320 0800 ffff ffff     ........ .......
200008cc:	d63c 0800 d63c 0800                         <...<...

200008d4 <uimage_type>:
	...
200008dc:	e084 0800 0007 0000 e094 0800 e0a0 0800     ................
200008ec:	0005 0000 e0b4 0800 e0c0 0800 0002 0000     ................
200008fc:	e0cc 0800 e0d4 0800 0004 0000 e0e4 0800     ................
2000090c:	e0ec 0800 0003 0000 d3ac 0800 e100 0800     ................
2000091c:	0006 0000 e110 0800 e118 0800 0001 0000     ................
2000092c:	e120 0800 e12c 0800 0008 0000 e140 0800      ...,.......@...
2000093c:	e148 0800 0009 0000 e15c 0800 e168 0800     H.......\...h...
2000094c:	000a 0000 e17c 0800 e188 0800 ffff ffff     ....|...........
2000095c:	d63c 0800 d63c 0800                         <...<...

20000964 <uimage_comp>:
20000964:	0000 0000 c970 0800 e014 0800 0002 0000     ....p...........
20000974:	e024 0800 e02c 0800 0001 0000 e040 0800     $...,.......@...
20000984:	e048 0800 0003 0000 e058 0800 e060 0800     H.......X...`...
20000994:	0004 0000 e070 0800 e074 0800 ffff ffff     ....p...t.......
200009a4:	d63c 0800 d63c 0800                         <...<...

200009ac <erase_seq>:
200009ac:	2008 0008                                   . ..

200009b0 <tab_seq>:
200009b0:	2020 2020 2020 2020 0000 0000                       ....

200009bc <stdio_names>:
200009bc:	dafc 0800 db04 0800 db0c 0800               ............

200009c8 <_ctype>:
200009c8:	0808 0808 0808 0808 2808 2828 2828 0808     .........(((((..
200009d8:	0808 0808 0808 0808 0808 0808 0808 0808     ................
200009e8:	10a0 1010 1010 1010 1010 1010 1010 1010     ................
200009f8:	0404 0404 0404 0404 0404 1010 1010 1010     ................
20000a08:	4110 4141 4141 0141 0101 0101 0101 0101     .AAAAAA.........
20000a18:	0101 0101 0101 0101 0101 1001 1010 1010     ................
20000a28:	4210 4242 4242 0242 0202 0202 0202 0202     .BBBBBB.........
20000a38:	0202 0202 0202 0202 0202 1002 1010 0810     ................
	...
20000a68:	10a0 1010 1010 1010 1010 1010 1010 1010     ................
20000a78:	1010 1010 1010 1010 1010 1010 1010 1010     ................
20000a88:	0101 0101 0101 0101 0101 0101 0101 0101     ................
20000a98:	0101 0101 0101 1001 0101 0101 0101 0201     ................
20000aa8:	0202 0202 0202 0202 0202 0202 0202 0202     ................
20000ab8:	0202 0202 0202 1002 0202 0202 0202 0202     ................

20000ac8 <mac_gpio>:
20000ac8:	0100 0200 0700 0102 0402 0502 0b06 0d06     ................
20000ad8:	0e06 0000                                   ....

20000adc <reset_cpu>:
20000adc:	4903      	ldr	r1, [pc, #12]	; (20000aec <reset_cpu+0x10>)
20000ade:	4b04      	ldr	r3, [pc, #16]	; (20000af0 <reset_cpu+0x14>)
20000ae0:	68ca      	ldr	r2, [r1, #12]
20000ae2:	f402 62e0 	and.w	r2, r2, #1792	; 0x700
20000ae6:	4313      	orrs	r3, r2
20000ae8:	60cb      	str	r3, [r1, #12]
20000aea:	4770      	bx	lr
20000aec:	e000ed00 	.word	0xe000ed00
20000af0:	05fa0004 	.word	0x05fa0004

20000af4 <envm_write_and_reset>:
20000af4:	b570      	push	{r4, r5, r6, lr}
20000af6:	4c08      	ldr	r4, [pc, #32]	; (20000b18 <envm_write_and_reset+0x24>)
20000af8:	4615      	mov	r5, r2
20000afa:	461e      	mov	r6, r3
20000afc:	47a0      	blx	r4
20000afe:	4285      	cmp	r5, r0
20000b00:	4604      	mov	r4, r0
20000b02:	d001      	beq.n	20000b08 <envm_write_and_reset+0x14>
20000b04:	4620      	mov	r0, r4
20000b06:	bd70      	pop	{r4, r5, r6, pc}
20000b08:	2e00      	cmp	r6, #0
20000b0a:	d0fb      	beq.n	20000b04 <envm_write_and_reset+0x10>
20000b0c:	2000      	movs	r0, #0
20000b0e:	4b03      	ldr	r3, [pc, #12]	; (20000b1c <envm_write_and_reset+0x28>)
20000b10:	4798      	blx	r3
20000b12:	4620      	mov	r0, r4
20000b14:	bd70      	pop	{r4, r5, r6, pc}
20000b16:	bf00      	nop
20000b18:	20000b2d 	.word	0x20000b2d
20000b1c:	20000add 	.word	0x20000add

20000b20 <clock_get>:
20000b20:	4b01      	ldr	r3, [pc, #4]	; (20000b28 <clock_get+0x8>)
20000b22:	f853 0020 	ldr.w	r0, [r3, r0, lsl #2]
20000b26:	4770      	bx	lr
20000b28:	20000ccc 	.word	0x20000ccc

20000b2c <envm_write>:
20000b2c:	e92d 42f0 	stmdb	sp!, {r4, r5, r6, r7, r9, lr}
20000b30:	4606      	mov	r6, r0
20000b32:	460d      	mov	r5, r1
20000b34:	4617      	mov	r7, r2
20000b36:	f000 f8bb 	bl	20000cb0 <__stm32f7_envm_as_dev_veneer>
20000b3a:	f1b6 6f00 	cmp.w	r6, #134217728	; 0x8000000
20000b3e:	d303      	bcc.n	20000b48 <envm_write+0x1c>
20000b40:	19f3      	adds	r3, r6, r7
20000b42:	f1b3 6f01 	cmp.w	r3, #135266304	; 0x8100000
20000b46:	d90c      	bls.n	20000b62 <envm_write+0x36>
20000b48:	463b      	mov	r3, r7
20000b4a:	4632      	mov	r2, r6
20000b4c:	494a      	ldr	r1, [pc, #296]	; (20000c78 <envm_write+0x14c>)
20000b4e:	484b      	ldr	r0, [pc, #300]	; (20000c7c <envm_write+0x150>)
20000b50:	f000 f8aa 	bl	20000ca8 <__printf_veneer>
20000b54:	f04f 0900 	mov.w	r9, #0
20000b58:	f000 f8aa 	bl	20000cb0 <__stm32f7_envm_as_dev_veneer>
20000b5c:	4648      	mov	r0, r9
20000b5e:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
20000b62:	f1b6 6f00 	cmp.w	r6, #134217728	; 0x8000000
20000b66:	d012      	beq.n	20000b8e <envm_write+0x62>
20000b68:	2301      	movs	r3, #1
20000b6a:	4945      	ldr	r1, [pc, #276]	; (20000c80 <envm_write+0x154>)
20000b6c:	4a45      	ldr	r2, [pc, #276]	; (20000c84 <envm_write+0x158>)
20000b6e:	4296      	cmp	r6, r2
20000b70:	d00e      	beq.n	20000b90 <envm_write+0x64>
20000b72:	f851 0b04 	ldr.w	r0, [r1], #4
20000b76:	3301      	adds	r3, #1
20000b78:	2b08      	cmp	r3, #8
20000b7a:	4402      	add	r2, r0
20000b7c:	d1f7      	bne.n	20000b6e <envm_write+0x42>
20000b7e:	4632      	mov	r2, r6
20000b80:	4941      	ldr	r1, [pc, #260]	; (20000c88 <envm_write+0x15c>)
20000b82:	4842      	ldr	r0, [pc, #264]	; (20000c8c <envm_write+0x160>)
20000b84:	f000 f890 	bl	20000ca8 <__printf_veneer>
20000b88:	f04f 0900 	mov.w	r9, #0
20000b8c:	e7e4      	b.n	20000b58 <envm_write+0x2c>
20000b8e:	2300      	movs	r3, #0
20000b90:	469e      	mov	lr, r3
20000b92:	b157      	cbz	r7, 20000baa <envm_write+0x7e>
20000b94:	2200      	movs	r2, #0
20000b96:	493e      	ldr	r1, [pc, #248]	; (20000c90 <envm_write+0x164>)
20000b98:	eb01 0183 	add.w	r1, r1, r3, lsl #2
20000b9c:	f851 0b04 	ldr.w	r0, [r1], #4
20000ba0:	f10e 0e01 	add.w	lr, lr, #1
20000ba4:	4402      	add	r2, r0
20000ba6:	4297      	cmp	r7, r2
20000ba8:	d8f8      	bhi.n	20000b9c <envm_write+0x70>
20000baa:	4a3a      	ldr	r2, [pc, #232]	; (20000c94 <envm_write+0x168>)
20000bac:	68d1      	ldr	r1, [r2, #12]
20000bae:	f411 3980 	ands.w	r9, r1, #65536	; 0x10000
20000bb2:	d159      	bne.n	20000c68 <envm_write+0x13c>
20000bb4:	6911      	ldr	r1, [r2, #16]
20000bb6:	2900      	cmp	r1, #0
20000bb8:	db4c      	blt.n	20000c54 <envm_write+0x128>
20000bba:	459e      	cmp	lr, r3
20000bbc:	dd16      	ble.n	20000bec <envm_write+0xc0>
20000bbe:	4c35      	ldr	r4, [pc, #212]	; (20000c94 <envm_write+0x168>)
20000bc0:	00d8      	lsls	r0, r3, #3
20000bc2:	6922      	ldr	r2, [r4, #16]
20000bc4:	f022 0278 	bic.w	r2, r2, #120	; 0x78
20000bc8:	6122      	str	r2, [r4, #16]
20000bca:	6921      	ldr	r1, [r4, #16]
20000bcc:	f041 0102 	orr.w	r1, r1, #2
20000bd0:	4301      	orrs	r1, r0
20000bd2:	6121      	str	r1, [r4, #16]
20000bd4:	6922      	ldr	r2, [r4, #16]
20000bd6:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
20000bda:	6122      	str	r2, [r4, #16]
20000bdc:	68e1      	ldr	r1, [r4, #12]
20000bde:	03ca      	lsls	r2, r1, #15
20000be0:	d4fc      	bmi.n	20000bdc <envm_write+0xb0>
20000be2:	3301      	adds	r3, #1
20000be4:	4573      	cmp	r3, lr
20000be6:	f100 0008 	add.w	r0, r0, #8
20000bea:	d1ea      	bne.n	20000bc2 <envm_write+0x96>
20000bec:	4b29      	ldr	r3, [pc, #164]	; (20000c94 <envm_write+0x168>)
20000bee:	691a      	ldr	r2, [r3, #16]
20000bf0:	f022 027a 	bic.w	r2, r2, #122	; 0x7a
20000bf4:	611a      	str	r2, [r3, #16]
20000bf6:	691a      	ldr	r2, [r3, #16]
20000bf8:	f042 4200 	orr.w	r2, r2, #2147483648	; 0x80000000
20000bfc:	611a      	str	r2, [r3, #16]
20000bfe:	68da      	ldr	r2, [r3, #12]
20000c00:	03d1      	lsls	r1, r2, #15
20000c02:	d4a9      	bmi.n	20000b58 <envm_write+0x2c>
20000c04:	691a      	ldr	r2, [r3, #16]
20000c06:	2a00      	cmp	r2, #0
20000c08:	db29      	blt.n	20000c5e <envm_write+0x132>
20000c0a:	4c22      	ldr	r4, [pc, #136]	; (20000c94 <envm_write+0x168>)
20000c0c:	1cfa      	adds	r2, r7, #3
20000c0e:	6923      	ldr	r3, [r4, #16]
20000c10:	f022 0203 	bic.w	r2, r2, #3
20000c14:	442a      	add	r2, r5
20000c16:	f043 0301 	orr.w	r3, r3, #1
20000c1a:	42aa      	cmp	r2, r5
20000c1c:	f1a6 0604 	sub.w	r6, r6, #4
20000c20:	6123      	str	r3, [r4, #16]
20000c22:	d008      	beq.n	20000c36 <envm_write+0x10a>
20000c24:	f855 3b04 	ldr.w	r3, [r5], #4
20000c28:	f846 3f04 	str.w	r3, [r6, #4]!
20000c2c:	68e0      	ldr	r0, [r4, #12]
20000c2e:	03c3      	lsls	r3, r0, #15
20000c30:	d4fc      	bmi.n	20000c2c <envm_write+0x100>
20000c32:	42aa      	cmp	r2, r5
20000c34:	d1f6      	bne.n	20000c24 <envm_write+0xf8>
20000c36:	46b9      	mov	r9, r7
20000c38:	4b16      	ldr	r3, [pc, #88]	; (20000c94 <envm_write+0x168>)
20000c3a:	691a      	ldr	r2, [r3, #16]
20000c3c:	f022 0201 	bic.w	r2, r2, #1
20000c40:	611a      	str	r2, [r3, #16]
20000c42:	691a      	ldr	r2, [r3, #16]
20000c44:	f042 4200 	orr.w	r2, r2, #2147483648	; 0x80000000
20000c48:	611a      	str	r2, [r3, #16]
20000c4a:	f000 f831 	bl	20000cb0 <__stm32f7_envm_as_dev_veneer>
20000c4e:	4648      	mov	r0, r9
20000c50:	e8bd 82f0 	ldmia.w	sp!, {r4, r5, r6, r7, r9, pc}
20000c54:	4810      	ldr	r0, [pc, #64]	; (20000c98 <envm_write+0x16c>)
20000c56:	4911      	ldr	r1, [pc, #68]	; (20000c9c <envm_write+0x170>)
20000c58:	6050      	str	r0, [r2, #4]
20000c5a:	6051      	str	r1, [r2, #4]
20000c5c:	e7ad      	b.n	20000bba <envm_write+0x8e>
20000c5e:	490e      	ldr	r1, [pc, #56]	; (20000c98 <envm_write+0x16c>)
20000c60:	4a0e      	ldr	r2, [pc, #56]	; (20000c9c <envm_write+0x170>)
20000c62:	6059      	str	r1, [r3, #4]
20000c64:	605a      	str	r2, [r3, #4]
20000c66:	e7d0      	b.n	20000c0a <envm_write+0xde>
20000c68:	4907      	ldr	r1, [pc, #28]	; (20000c88 <envm_write+0x15c>)
20000c6a:	480d      	ldr	r0, [pc, #52]	; (20000ca0 <envm_write+0x174>)
20000c6c:	f000 f81c 	bl	20000ca8 <__printf_veneer>
20000c70:	f04f 0900 	mov.w	r9, #0
20000c74:	e770      	b.n	20000b58 <envm_write+0x2c>
20000c76:	bf00      	nop
20000c78:	0800c32c 	.word	0x0800c32c
20000c7c:	0800c36c 	.word	0x0800c36c
20000c80:	0800c33c 	.word	0x0800c33c
20000c84:	08008000 	.word	0x08008000
20000c88:	0800c358 	.word	0x0800c358
20000c8c:	0800c3b8 	.word	0x0800c3b8
20000c90:	0800c338 	.word	0x0800c338
20000c94:	40023c00 	.word	0x40023c00
20000c98:	45670123 	.word	0x45670123
20000c9c:	cdef89ab 	.word	0xcdef89ab
20000ca0:	0800c3a4 	.word	0x0800c3a4
20000ca4:	00000000 	.word	0x00000000

20000ca8 <__printf_veneer>:
20000ca8:	f85f f000 	ldr.w	pc, [pc]	; 20000cac <__printf_veneer+0x4>
20000cac:	08005359 	.word	0x08005359

20000cb0 <__stm32f7_envm_as_dev_veneer>:
20000cb0:	f85f f000 	ldr.w	pc, [pc]	; 20000cb4 <__stm32f7_envm_as_dev_veneer+0x4>
20000cb4:	08000c95 	.word	0x08000c95
