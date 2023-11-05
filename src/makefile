ToolsPath = ..\z_tools
MakePath = $(ToolsPath) make.exe
default :
	$(MakePath) run
run :
	$(MakePath) img
	@set SDL_VIDEODRIVER=windib
	@set QEMU_AUDIO_DRV=none
	@set QEMU_AUDIO_LOG_TO_MONITOR=0
	$(ToolsPath)\qemu\qemu.exe -L . -m 32 -localtime -std-vga -fda tengyunos.img