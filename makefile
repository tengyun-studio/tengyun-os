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
	$(NASM) main.asm -o tengyunos.img
	$(MAKE) run
run :
	@set SDL_VIDEODRIVER=windib
	@set QEMU_AUDIO_DRV=none
	@set QEMU_AUDIO_LOG_TO_MONITOR=0
	$(QEMU) tengyunos.img
