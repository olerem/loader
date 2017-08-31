OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_start)

MEMORY {
	ocram_s (rx) : org = 0x00000000, l = 0x00008000
	tcmu (w)     : org = 0x20000000, l = 0x00008000
	ddri1 (w)     : org = 0x1fef0000, l = 0x00080000
	ddri2 (w)     : org = 0x1ff70000, l = 0x00080000
}

SECTIONS
{
	.text : {
		imx7m4.o (.text)
	} >ocram_s
	.fw : {
		. = 0x0200;
		imx7m4.o (.dts)
		. = 0x8000;
		imx7m4.o (.linux)
	} >ddri1
	.resource_table : {
		imx7m4.o (.resource_table)
	} >ddri2

}
