SECTIONS
{
	. = 0x0;
	.text : { *(.text) }
	. = 0x20000000;
	.data : { *(.data) }
	.bss : { *(.bss) }
}
