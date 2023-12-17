


ASM=nasm
MACROS_FOLDER=macros/
ASMFLAGS=-f bin -i $(MACROS_FOLDER) -i $(SRC_FOLDER)
SRC_FOLDER=src
OUT_FOLDER=out
VM_NAME=Teste
VM_DEBUG_ARGS=--debug-command-line --gdb
VM_ARGS=--fda $(OUT_FOLDER)/boot.img --startvm $(VM_NAME) 
SRC_FILES=$(wildcard $(SRC_FOLDER)/*.asm)

all: $(OUT_FOLDER)/boot.img


$(OUT_FOLDER)/boot.img:  $(SRC_FILES)
	$(ASM) $(ASMFLAGS) $(SRC_FOLDER)/boot.asm -o $(OUT_FOLDER)/boot.img
	@echo "$^ -> $@"



	

.PHONY: clean list run


run:
	VirtualBoxVM $(VM_ARGS)
debug:
	VirtualBoxVM $(VM_DEBUG_ARGS) $(VM_ARGS)



list:
	$(ASM) $(ASMFLAGS) -l $(OUT_FOLDER)/boot.lst $(SRC_FOLDER)/boot.asm -o $(OUT_FOLDER)/boot.bin

clean:
	if [ -d out ]; then rm -f out/*; fi
	@echo "Cleaned"