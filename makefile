TOOLPATH = ./tools/
MAKE     = make -r
NASM     = $(TOOLPATH)nasm\nasm.exe
EDIMG    = $(TOOLPATH)edimg.exe
QEMU     =$(TOOLPATH)qemu\qemu-system-x86_64.exe
COPY     = copy
DEL      = del



default :
	$(MAKE) img
img :
	$(NASM) TengYunOS.asm -o TengYunOS.sys
	$(NASM) ipl.asm -o ipl.bin
	$(MAKE) edimg
	$(MAKE) run
run :
	@set SDL_VIDEODRIVER=windib
	@set QEMU_AUDIO_DRV=none
	@set QEMU_AUDIO_LOG_TO_MONITOR=0
	$(QEMU) tengyunos.img
edimg :
	$(EDIMG)   imgin:.\fdimg0at.tek \
		wbinimg src:ipl.bin len:512 from:0 to:0 \
		copy from:TengYunOS.sys to:@: \
		imgout:tengyunos.img
