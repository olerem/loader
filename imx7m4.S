.syntax unified
.text
.thumb
.global _start
_start:

#define ADDR_DTB        0x10000200
#define ADDR_LINUX      0x10008000

	mov	r0, #0x55
	ldr	r1, =(0x40)
1:
	str	r0, [r1]
	add	r0, 1
	b	1b

/* data required by remoteproc loader and actual fw to provide info
 * about shared resources. It is writable, since it can be updated.
 */
.section .resource_table, "aw" @progbits
.word	1, 0, 0, 0	/* struct resource_table base */
.word	0		/* uint32_t offset[1] */

.section .dts, "aw" @progbits
.incbin "blob.bin"

.section .linux, "aw" @progbits
.incbin "blob.bin"
