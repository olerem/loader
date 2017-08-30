OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_start)

MEMORY {
	ocram_s (rx) : org = 0x00000000, l = 0x00008000
	tcmu (w)     : org = 0x20000000, l = 0x00008000
	ddri (w)     : org = 0x10000000, l = 0x0FFF0000
}

SECTIONS
{
	.text : {
		imx7m4.o (.text)
	} >ocram_s
	.fw 0x10000000 : {
		. = 0x0200;
		imx7m4.o (.dts)
		. = 0x8000;
		imx7m4.o (.linux)
	} >ddri
	.resource_table : {
		imx7m4.o (.resource_table)
	} >ddri

}
